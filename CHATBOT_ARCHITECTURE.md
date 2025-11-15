# Chatbot Architecture - How Messages Flow

## 📋 Overview

The chatbot system uses a **client-server architecture** where the frontend (React) communicates with the backend (Flask) via REST API calls. Messages are stored in PostgreSQL database.

## 🔄 Complete Message Flow

### 1️⃣ User Sends a Message

```
User types "Hello" → Frontend creates message → API call → Backend processes → Stores in DB → Returns response → Frontend displays
```

### Detailed Steps:

#### **Frontend (ChatWindow.tsx)**

```typescript
const handleSendMessage = async () => {
  // 1. Get user's message text
  const userMessageText = inputMessage.trim();
  
  // 2. Create temporary user message for immediate display
  const userMessage: ChatMessage = {
    id: Date.now(), // Temporary ID
    role: 'user',
    content: userMessageText,
    created_at: new Date().toISOString()
  };
  
  // 3. Display user message immediately (optimistic UI)
  setMessages(prev => [...prev, userMessage]);
  
  // 4. Send to backend API
  const response = await ChatService.sendMessage({
    message: userMessageText,
    conversation_id: conversationId || undefined
  });
  
  // 5. Add assistant's response to display
  setMessages(prev => [...prev, response.message]);
}
```

#### **API Service (chat.service.ts)**

```typescript
sendMessage: async (data: SendMessageRequest) => {
  // Makes POST request to /api/chat/message
  const response = await api.post<SendMessageResponse>('/chat/message', data);
  return response.data;
}
```

**HTTP Request:**
```http
POST http://localhost:5000/api/chat/message
Headers:
  Authorization: Bearer <JWT_TOKEN>
  Content-Type: application/json
Body:
  {
    "message": "Hello",
    "conversation_id": 1  // Optional, omitted for new conversations
  }
```

---

### 2️⃣ Backend Processes Message

#### **API Endpoint (splash25-backend/app/routes/chatbot.py)**

```python
@chatbot_bp.route('/message', methods=['POST'])
@jwt_required()
def send_message():
    # 1. Get authenticated user
    current_user = get_jwt_identity()
    user_id = int(current_user['sub'])
    
    # 2. Get request data
    data = request.get_json()
    message_text = data.get('message')
    conversation_id = data.get('conversation_id')
    
    # 3. Process message using chatbot service
    response = chatbot_service.handle_message(
        user_id=user_id,
        message=message_text,
        conversation_id=conversation_id
    )
    
    # 4. Return response
    return jsonify(response), 200
```

#### **Chatbot Service (app/utils/chatbot_service.py)**

```python
def handle_message(user_id, message, conversation_id=None):
    # 1. Get or create conversation
    if conversation_id:
        conversation = get_conversation(conversation_id)
    else:
        conversation = create_conversation(user_id)
    
    # 2. Store user's message in database
    user_message = create_message(
        conversation_id=conversation.id,
        role='user',
        content=message
    )
    
    # 3. Gather context about user (meetings, travel, etc.)
    context = chatbot_context.gather_context(user_id)
    
    # 4. Classify intent (greeting, meetings, travel, etc.)
    intent = classify_intent(message)
    
    # 5. Generate response
    if OPENAI_API_KEY:
        # Use OpenAI for smart responses
        response_text = llm_service.generate_response(message, context, intent)
    else:
        # Use rule-based responses
        response_text = chatbot_rules.get_response(intent, context)
    
    # 6. Store assistant's message in database
    assistant_message = create_message(
        conversation_id=conversation.id,
        role='assistant',
        content=response_text,
        metadata={'intent': intent, 'used_llm': bool(OPENAI_API_KEY)}
    )
    
    # 7. Return response
    return {
        'conversation_id': conversation.id,
        'message': serialize_message(assistant_message)
    }
```

---

### 3️⃣ Response Structure

**Backend Returns:**
```json
{
  "conversation_id": 8,
  "message": {
    "id": 16,
    "conversation_id": 8,
    "role": "assistant",
    "content": "Hello! I'm here to help you with Splash25 event.",
    "metadata": {
      "intent": "greeting",
      "used_llm": false,
      "actions": [
        {"label": "My Meetings", "type": "query", "value": "Show me my meetings"},
        {"label": "Event Details", "type": "query", "value": "When is the event?"}
      ]
    },
    "created_at": "2025-11-15T06:53:49.933901",
    "has_feedback": false
  }
}
```

---

## 🗄️ Database Structure

### Tables:

#### **chat_conversations**
```sql
CREATE TABLE chat_conversations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
```

#### **chat_messages**
```sql
CREATE TABLE chat_messages (
    id SERIAL PRIMARY KEY,
    conversation_id INTEGER NOT NULL,
    role VARCHAR(20) NOT NULL,  -- 'user' or 'assistant'
    content TEXT NOT NULL,
    metadata JSONB,  -- Store intent, actions, etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    has_feedback BOOLEAN DEFAULT FALSE
);
```

---

## 🔄 Loading Previous Conversations

### When Chat Opens:

```typescript
// Frontend: ChatWindow.tsx
useEffect(() => {
  loadConversations();
}, []);

const loadConversations = async () => {
  // 1. Get list of conversations
  const conversations = await ChatService.getConversations();
  
  // 2. Load the most recent active conversation
  if (conversations.length > 0) {
    const activeConversation = conversations.find(c => c.is_active) || conversations[0];
    
    // 3. Get full conversation with all messages
    const fullConversation = await ChatService.getConversation(activeConversation.id);
    
    // 4. Display all messages
    setConversationId(fullConversation.id);
    setMessages(fullConversation.messages || []);
  }
};
```

**API Calls:**

1. **Get Conversations List:**
```http
GET /api/chat/conversations
Returns: [
  {id: 1, title: "Chat about meetings", message_count: 5},
  {id: 2, title: "Event questions", message_count: 3}
]
```

2. **Get Specific Conversation:**
```http
GET /api/chat/conversations/1
Returns: {
  id: 1,
  title: "Chat about meetings",
  messages: [
    {id: 1, role: "user", content: "Hello"},
    {id: 2, role: "assistant", content: "Hi! How can I help?"},
    ...
  ]
}
```

---

## 🎯 Context Gathering

The chatbot knows about you because it gathers context:

```python
# app/utils/chatbot_context.py

def gather_context(user_id):
    context = {}
    
    # 1. Get user info
    user = User.query.get(user_id)
    context['user_name'] = user.first_name
    context['role'] = user.role  # buyer or seller
    
    # 2. Get meetings
    if user.role == 'buyer':
        meetings = get_buyer_meetings(user_id)
        context['meetings'] = meetings
        context['meeting_count'] = len(meetings)
    
    # 3. Get travel plans
    travel_plan = get_travel_plan(user_id)
    context['travel'] = travel_plan
    
    # 4. Get accommodation
    accommodation = get_accommodation(user_id)
    context['accommodation'] = accommodation
    
    # 5. Get event details
    context['event'] = get_event_details()
    
    return context
```

---

## 🧠 Intent Classification

```python
# app/utils/chatbot_service.py

def classify_intent(message):
    message_lower = message.lower()
    
    # Greeting
    if any(word in message_lower for word in ['hello', 'hi', 'hey']):
        return 'greeting'
    
    # Meetings
    if any(word in message_lower for word in ['meeting', 'schedule', 'appointment']):
        return 'meetings'
    
    # Travel
    if any(word in message_lower for word in ['travel', 'transportation', 'flight']):
        return 'travel'
    
    # Event info
    if any(word in message_lower for word in ['when', 'date', 'time', 'venue']):
        return 'event_info'
    
    # Sellers
    if any(word in message_lower for word in ['seller', 'find', 'search', 'company']):
        return 'sellers'
    
    return 'general'
```

---

## 📊 Complete Flow Diagram

```
┌─────────────┐
│   USER      │
│  Types msg  │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│  FRONTEND (React)                   │
│  - ChatWindow.tsx                   │
│  - Creates temp user message        │
│  - Displays immediately             │
│  - Calls chat.service.ts            │
└──────┬──────────────────────────────┘
       │ POST /api/chat/message
       │ {message: "Hello", conversation_id: 1}
       ▼
┌─────────────────────────────────────┐
│  BACKEND (Flask)                    │
│  - routes/chatbot.py                │
│  - Authenticates user (JWT)         │
│  - Validates request                │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────┐
│  CHATBOT SERVICE                    │
│  - utils/chatbot_service.py         │
│  1. Get/create conversation         │
│  2. Store user message in DB        │
│  3. Gather context                  │
│  4. Classify intent                 │
│  5. Generate response               │
│  6. Store assistant message in DB   │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────┐
│  DATABASE (PostgreSQL)              │
│  - chat_conversations table         │
│  - chat_messages table              │
│  - Stores all messages              │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────┐
│  RESPONSE BACK TO FRONTEND          │
│  {conversation_id: 1,               │
│   message: {...}}                   │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────┐
│  FRONTEND DISPLAYS                  │
│  - Adds assistant message to UI     │
│  - Shows with timestamp             │
│  - Displays action buttons          │
└─────────────────────────────────────┘
```

---

## 🔧 Key Files

### Frontend:
- `splash25-ui/src/components/chat/ChatWidget.tsx` - Floating button
- `splash25-ui/src/components/chat/ChatWindow.tsx` - Chat interface
- `splash25-ui/src/components/chat/MessageBubble.tsx` - Message display
- `splash25-ui/src/services/chat.service.ts` - API client

### Backend:
- `splash25-backend/app/routes/chatbot.py` - API endpoints
- `splash25-backend/app/utils/chatbot_service.py` - Main logic
- `splash25-backend/app/utils/chatbot_context.py` - Context gathering
- `splash25-backend/app/utils/chatbot_rules.py` - Rule-based responses
- `splash25-backend/app/utils/llm_service.py` - OpenAI integration

### Database:
- `splash25-backend/db-migration-add-chatbot.sql` - Schema

---

## 💡 Summary

1. **User sends message** → Frontend displays it immediately
2. **Frontend calls API** → POST /api/chat/message
3. **Backend receives** → Authenticates user, validates request
4. **Chatbot service processes:**
   - Stores user message in database
   - Gathers context (meetings, travel, etc.)
   - Classifies intent
   - Generates response (OpenAI or rules)
   - Stores assistant message in database
5. **Returns response** → JSON with message data
6. **Frontend displays** → Shows assistant's message

**All messages are stored in PostgreSQL**, so conversation history persists across sessions!
