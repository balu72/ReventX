# ReventX/Splash25 - C4 Architecture Documentation

## Overview

This document describes the architecture of the ReventX (Splash25) Event Management System using the C4 model approach - Context, Containers, Components, and Code.

---

## Level 1: System Context Diagram

### Purpose
Shows the big picture - how the Splash25 system fits into the world around it, including users and external systems.

### System Context

```mermaid
graph TB
    subgraph "Event Management Ecosystem"
        Splash25["Splash25 Event<br/>Management System<br/>(ReventX)"]
    end
    
    Buyer["Buyer<br/>(Event Participant)"]
    Seller["Seller<br/>(Exhibitor)"]
    Admin["Administrator<br/>(Event Manager)"]
    
    Email["Email System<br/>(SMTP)"]
    CloudflareAPI["Cloudflare<br/>(CDN & Tunnel)"]
    Browser["Web Browser"]
    
    Buyer -->|Views sellers, books meetings,<br/>manages travel| Splash25
    Seller -->|Manages stall, schedules meetings,<br/>views buyer profiles| Splash25
    Admin -->|Manages users, allocates stalls,<br/>generates reports| Splash25
    
    Splash25 -->|Sends notifications| Email
    Splash25 -->|Public access via tunnel| CloudflareAPI
    Browser -->|HTTPS| CloudflareAPI
    CloudflareAPI -->|Proxies requests| Splash25
```

### Key Users & Systems

**Primary Users:**
- **Buyers (626):** Event participants looking to connect with sellers
  - Browse seller profiles and stalls
  - Schedule meetings based on availability
  - Manage travel plans and accommodations
  - View floor plans and navigate event venue

- **Sellers (156):** Exhibitors showcasing products/services
  - Manage stall information and profile
  - Schedule meeting time slots
  - View and approve meeting requests
  - Track attendees and check-ins

- **Administrators:** Event management team
  - User management and approval
  - Stall allocation and floor plan management
  - Meeting oversight and conflict resolution
  - Generate reports and analytics

**External Systems:**
- **Email System:** Notification and communication delivery
- **Cloudflare:** CDN, security, and global access via tunnel
- **Web Browsers:** User interface access point

---

## Level 2: Container Diagram

### Purpose
Shows the high-level shape of the software architecture and the responsibilities of, and interactions between, containers (applications, data stores, etc.).

### Container Architecture

```mermaid
graph TB
    subgraph "User Devices"
        Browser["Web Browser<br/>[Container: Browser]<br/>JavaScript + React"]
    end
    
    subgraph "Cloudflare Network"
        Tunnel["Cloudflare Tunnel<br/>[Container: Tunnel Service]<br/>Secure connection proxy"]
    end
    
    subgraph "ReventX Docker Environment"
        Nginx["Nginx<br/>[Container: Web Server]<br/>Reverse Proxy & Static Files<br/>Port: 80"]
        
        Frontend["Frontend Application<br/>[Container: React SPA]<br/>TypeScript + Vite + TailwindCSS<br/>Port: 3000"]
        
        Backend["Backend API<br/>[Container: Flask Application]<br/>Python + SQLAlchemy<br/>Port: 5000"]
        
        Database["PostgreSQL Database<br/>[Container: Database]<br/>PostgreSQL 15<br/>Port: 5432"]
        
        Cache["Redis Cache<br/>[Container: Cache]<br/>Session & Cache Store<br/>Port: 6379"]
    end
    
    Browser -->|HTTPS requests| Tunnel
    Tunnel -->|HTTP| Nginx
    Nginx -->|Proxy /api/*| Backend
    Nginx -->|Serve static files| Frontend
    Nginx -->|Proxy /| Frontend
    Backend -->|Read/Write| Database
    Backend -->|Session storage| Cache
    Frontend -->|API calls via Nginx| Backend
```

### Container Details

#### 1. **Nginx Web Server**
- **Technology:** Nginx 1.29.3
- **Purpose:** Reverse proxy and static file server
- **Responsibilities:**
  - Route API requests to backend (path: `/api/*`)
  - Serve frontend static files
  - Handle CORS and security headers
  - SSL termination (when enabled)
- **Port:** 80 (HTTP)

#### 2. **Frontend Application**
- **Technology:** React 18 + TypeScript + Vite
- **UI Framework:** TailwindCSS + shadcn/ui
- **Purpose:** Single Page Application providing user interface
- **Key Features:**
  - Buyer dashboard and seller profiles
  - Meeting scheduling interface
  - Travel plan management
  - Floor plan visualization
  - Admin management console
- **Port:** 3000 (Development server)

#### 3. **Backend API**
- **Technology:** Python Flask + SQLAlchemy
- **Purpose:** RESTful API server
- **Responsibilities:**
  - Business logic execution
  - Authentication and authorization
  - Database operations via ORM
  - Meeting scheduling algorithms
  - Distance matrix calculations
  - File upload handling
- **Port:** 5000

#### 4. **PostgreSQL Database**
- **Technology:** PostgreSQL 15
- **Purpose:** Primary data store
- **Data:**
  - User profiles (783 users)
  - Meeting schedules (13,602 meetings)
  - Travel plans (524 plans)
  - Stall inventory (5,148 items)
  - Time slots (19,740 slots)
- **Port:** 5432

#### 5. **Redis Cache**
- **Technology:** Redis 7
- **Purpose:** Session store and cache
- **Responsibilities:**
  - User session management
  - Temporary data caching
  - Rate limiting data
- **Port:** 6379

#### 6. **Cloudflare Tunnel**
- **Technology:** cloudflared
- **Purpose:** Secure public access without exposing ports
- **Features:**
  - Zero-trust network access
  - Automatic SSL/TLS
  - Global CDN integration
  - DDoS protection

---

## Level 3: Component Diagram

### Purpose
Decompose each container into components, showing their responsibilities and technology/implementation details.

### Backend API Components

```mermaid
graph TB
    subgraph "Backend API Container"
        subgraph "Routes Layer"
            AuthRoute["Auth Routes<br/>/api/auth/*<br/>Login, Register, Verify"]
            BuyerRoute["Buyer Routes<br/>/api/buyers/*<br/>Profile, Search, List"]
            SellerRoute["Seller Routes<br/>/api/sellers/*<br/>Profile, Stalls, Business"]
            MeetingRoute["Meeting Routes<br/>/api/meetings/*<br/>CRUD, Schedule, Status"]
            AdminRoute["Admin Routes<br/>/api/admin/*<br/>Management, Reports"]
            FloorplanRoute["Floorplan Routes<br/>/api/floorplan/*<br/>Layout, Stalls"]
            TravelRoute["Travel Routes<br/>/api/travel/*<br/>Plans, Transport"]
        end
        
        subgraph "Utils Layer"
            AuthUtil["Authentication Utils<br/>JWT, Password, Session"]
            EmailUtil["Email Service<br/>SMTP, Templates"]
            MeetingUtil["Meeting Utils<br/>Scheduling, Conflicts"]
            BuyerUtil["Buyer Utils<br/>Matching, Filtering"]
            PaymentUtil["Payment Utils<br/>Transactions, Validation"]
        end
        
        subgraph "Models Layer"
            UserModel["User Models<br/>Buyer, Seller, Admin"]
            MeetingModel["Meeting Models<br/>Meeting, TimeSlot"]
            TravelModel["Travel Models<br/>TravelPlan, Transport"]
            StallModel["Stall Models<br/>Inventory, Types"]
            ProfileModel["Profile Models<br/>BuyerProfile, SellerProfile"]
        end
        
        Database["PostgreSQL Database"]
        Cache["Redis Cache"]
    end
    
    AuthRoute --> AuthUtil
    BuyerRoute --> BuyerUtil
    MeetingRoute --> MeetingUtil
    AdminRoute --> EmailUtil
    
    AuthUtil --> UserModel
    BuyerUtil --> UserModel
    MeetingUtil --> MeetingModel
    
    UserModel --> Database
    MeetingModel --> Database
    TravelModel --> Database
    StallModel --> Database
    ProfileModel --> Database
    
    AuthUtil --> Cache
```

### Frontend Application Components

```mermaid
graph TB
    subgraph "Frontend Application Container"
        subgraph "Pages Layer"
            IndexPage["Index Page<br/>Landing, Login"]
            BuyerDash["Buyer Dashboard<br/>Overview, Stats"]
            SellerDash["Seller Dashboard<br/>Stall, Meetings"]
            AdminDash["Admin Dashboard<br/>Management Console"]
            MeetingPage["Meeting Pages<br/>List, Schedule, Detail"]
            TravelPage["Travel Pages<br/>Plans, Booking"]
        end
        
        subgraph "Components Layer"
            BuyerComp["Buyer Components<br/>SellerList, ProfileEdit"]
            SellerComp["Seller Components<br/>BuyerList, MeetingList"]
            AdminComp["Admin Components<br/>UserMgmt, Reports"]
            SharedComp["Shared Components<br/>Navbar, Footer, Modal"]
            UIComp["UI Components<br/>shadcn/ui library"]
        end
        
        subgraph "Services Layer"
            AuthService["Auth Service<br/>Login, Register, Token"]
            BuyerService["Buyer Service<br/>Profile, Search API"]
            SellerService["Seller Service<br/>Stall, Business API"]
            MeetingService["Meeting Service<br/>Schedule, CRUD API"]
            AdminService["Admin Service<br/>Management API"]
        end
        
        subgraph "State Management"
            AuthContext["Auth Context<br/>User, Session"]
            AppState["App State<br/>Global state"]
        end
        
        Backend["Backend API"]
    end
    
    IndexPage --> AuthService
    BuyerDash --> BuyerService
    SellerDash --> SellerService
    MeetingPage --> MeetingService
    AdminDash --> AdminService
    
    BuyerComp --> BuyerService
    SellerComp --> SellerService
    AdminComp --> AdminService
    
    AuthService --> Backend
    BuyerService --> Backend
    SellerService --> Backend
    MeetingService --> Backend
    AdminService --> Backend
    
    AuthService --> AuthContext
    AuthContext --> AppState
```

### Component Descriptions

#### Backend Components

**1. Routes Layer (API Endpoints)**
- `auth.py`: Authentication endpoints (login, register, verify)
- `buyers.py`: Buyer-specific endpoints
- `seller.py`: Seller-specific endpoints
- `meeting.py`: Meeting management endpoints
- `admin.py`: Administrative endpoints
- `floorplan.py`: Floor plan and stall endpoints
- `system.py`: System settings and health checks

**2. Utils Layer (Business Logic)**
- `auth.py`: JWT token management, password hashing
- `email_service.py`: Email notifications and templates
- `meeting_utils.py`: Meeting scheduling algorithms
- `buyer_utils.py`: Buyer matching and filtering
- `payment_utils.py`: Payment processing helpers

**3. Models Layer (Data Access)**
- User-related: User, BuyerProfile, SellerProfile
- Meeting-related: Meeting, TimeSlot, MeetingMetadata
- Travel-related: TravelPlan, Transportation, Accommodation
- Stall-related: StallInventory, StallType, StallDistanceMatrix
- Reference: BuyerCategory, Interest, PropertyType

#### Frontend Components

**1. Pages Layer**
- Landing and authentication pages
- Role-specific dashboards (buyer/seller/admin)
- Feature-specific pages (meetings, travel, reports)

**2. Components Layer**
- Role-specific components (buyer/seller/admin)
- Shared UI components (navbar, footer, modals)
- shadcn/ui component library integration

**3. Services Layer**
- API client wrappers for backend communication
- Request/response transformation
- Error handling and retry logic

**4. State Management**
- AuthContext: User authentication state
- Global state management for app-wide data

---

## Level 4: Code Diagram

### Purpose
Show how key components are implemented in code (class diagrams, sequence diagrams).

### Meeting Scheduling Sequence

```mermaid
sequenceDiagram
    participant Buyer
    participant Frontend
    participant Backend
    participant Database
    participant EmailService
    
    Buyer->>Frontend: Select seller & time slot
    Frontend->>Backend: POST /api/meetings
    Backend->>Database: Check time slot availability
    Database-->>Backend: Available slots
    Backend->>Database: Check distance conflicts
    Database-->>Backend: No conflicts
    Backend->>Database: Create meeting record
    Database-->>Backend: Meeting created
    Backend->>EmailService: Send notification
    EmailService-->>Backend: Email queued
    Backend-->>Frontend: Meeting confirmed
    Frontend-->>Buyer: Show confirmation
```

### Authentication Flow

```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant Backend
    participant Database
    participant Redis
    
    User->>Frontend: Enter credentials
    Frontend->>Backend: POST /api/auth/login
    Backend->>Database: Verify user credentials
    Database-->>Backend: User data
    Backend->>Backend: Generate JWT token
    Backend->>Redis: Store session
    Backend-->>Frontend: Return token
    Frontend->>Frontend: Store token in localStorage
    Frontend-->>User: Redirect to dashboard
    
    Note over Frontend,Backend: Subsequent requests include JWT in header
    
    Frontend->>Backend: GET /api/buyers (with JWT)
    Backend->>Backend: Validate JWT
    Backend->>Redis: Check session
    Redis-->>Backend: Session valid
    Backend->>Database: Query buyers
    Database-->>Backend: Buyer data
    Backend-->>Frontend: Return data
```

### Database Schema - Core Entities

```mermaid
erDiagram
    USERS ||--o{ BUYER_PROFILES : has
    USERS ||--o{ SELLER_PROFILES : has
    USERS ||--o{ MEETINGS : "participates in"
    USERS ||--o{ TIME_SLOTS : has
    USERS ||--o{ TRAVEL_PLANS : has
    
    MEETINGS ||--|| TIME_SLOTS : "scheduled in"
    MEETINGS }o--|| USERS : "buyer"
    MEETINGS }o--|| USERS : "seller"
    
    SELLER_PROFILES ||--o{ STALLS : owns
    STALLS }o--|| STALL_INVENTORY : "allocated to"
    STALLS }o--|| STALL_TYPES : "of type"
    
    TRAVEL_PLANS ||--o{ TRANSPORTATION : includes
    TRAVEL_PLANS ||--o{ ACCOMMODATIONS : includes
    ACCOMMODATIONS }o--|| HOST_PROPERTIES : "at"
    
    USERS {
        int id PK
        string username
        string email
        string password_hash
        string role
        timestamp created_at
    }
    
    MEETINGS {
        int id PK
        int buyer_id FK
        int seller_id FK
        int time_slot_id FK
        string status
        date meeting_date
        time meeting_time
    }
    
    STALL_INVENTORY {
        int id PK
        string stall_number
        int stall_type_id FK
        boolean is_allocated
    }
```

---

## Deployment Architecture

### Container Orchestration

```mermaid
graph TB
    subgraph "Docker Compose Environment"
        subgraph "Network: splash25-network"
            Postgres["PostgreSQL Container<br/>splash25-postgres<br/>Port: 5432"]
            Redis["Redis Container<br/>splash25-redis<br/>Port: 6379"]
            Backend["Backend Container<br/>splash25-backend<br/>Port: 5000"]
            Frontend["Frontend Container<br/>splash25-frontend<br/>Port: 3000"]
            Nginx["Nginx Container<br/>splash25-nginx<br/>Port: 80"]
        end
        
        subgraph "Volumes"
            DBVol["splash25<br/>(PostgreSQL data)"]
            RedisVol["splash25-redis-data<br/>(Redis persistence)"]
            BackendLogs["splash25-backend-logs<br/>(Application logs)"]
            NginxLogs["splash25-nginx-logs<br/>(Access logs)"]
        end
    end
    
    subgraph "External"
        Tunnel["Cloudflare Tunnel<br/>(Host process)"]
        Internet["Internet Users"]
    end
    
    Postgres -.-> DBVol
    Redis -.-> RedisVol
    Backend -.-> BackendLogs
    Nginx -.-> NginxLogs
    
    Backend --> Postgres
    Backend --> Redis
    Frontend --> Backend
    Nginx --> Frontend
    Nginx --> Backend
    
    Tunnel --> Nginx
    Internet --> Tunnel
```

### Health Check Flow

```mermaid
graph LR
    A[Docker Compose] -->|Health check| B[PostgreSQL]
    A -->|Health check| C[Redis]
    B -->|Ready| D[Backend starts]
    C -->|Ready| D
    D -->|Ready| E[Frontend starts]
    D -->|Ready| F[Nginx starts]
    E -->|Ready| G[System operational]
    F -->|Ready| G
```

---

## Data Flow Diagrams

### Meeting Creation Data Flow

```mermaid
graph LR
    A[Buyer UI] -->|1. Select time| B[Frontend Service]
    B -->|2. POST /api/meetings| C[Backend API]
    C -->|3. Validate| D[Meeting Utils]
    D -->|4. Check availability| E[Database]
    E -->|5. Available| D
    D -->|6. Check conflicts| E
    E -->|7. No conflicts| D
    D -->|8. Create meeting| E
    E -->|9. Record created| C
    C -->|10. Queue email| F[Email Service]
    C -->|11. Return success| B
    B -->|12. Update UI| A
    F -->|13. Send notification| G[Email System]
```

### User Authentication Data Flow

```mermaid
graph LR
    A[Login Form] -->|1. Credentials| B[Auth Service]
    B -->|2. POST /api/auth/login| C[Backend]
    C -->|3. Query user| D[Database]
    D -->|4. User data| C
    C -->|5. Verify password| C
    C -->|6. Generate JWT| C
    C -->|7. Store session| E[Redis]
    C -->|8. Return token| B
    B -->|9. Store token| F[LocalStorage]
    B -->|10. Redirect| G[Dashboard]
```

---

## Technology Stack Summary

### Frontend Stack
```
React 18.3.1
├── TypeScript 5.5.3
├── Vite 5.4.1 (Build tool)
├── TailwindCSS 3.4.1 (Styling)
├── shadcn/ui (Component library)
├── Tanstack Query (Data fetching)
└── React Router (Navigation)
```

### Backend Stack
```
Python 3.11
├── Flask 3.0.3 (Web framework)
├── SQLAlchemy 2.0.30 (ORM)
├── Flask-CORS (CORS handling)
├── PyJWT (Authentication)
└── Redis-py (Cache client)
```

### Infrastructure Stack
```
Docker Compose
├── PostgreSQL 15 (Database)
├── Redis 7 (Cache)
├── Nginx 1.29.3 (Web server)
└── Cloudflared (Tunnel)
```

---

## Security Architecture

### Security Layers

```mermaid
graph TB
    subgraph "Security Layers"
        A[Cloudflare WAF<br/>DDoS Protection] --> B[Cloudflare Tunnel<br/>Zero-trust Access]
        B --> C[Nginx<br/>Request Filtering]
        C --> D[Backend API<br/>JWT Authentication]
        D --> E[PostgreSQL<br/>Row-level Security]
    end
    
    F[User Request] --> A
    E --> G[Encrypted Data<br/>at Rest]
```

### Authentication Flow
1. **Password Storage:** Bcrypt hashing with salt
2. **Session Management:** JWT tokens with expiry
3. **API Security:** Token validation on every request
4. **Database Access:** Connection pooling with credentials
5. **Cache Security:** Redis password protection

---

## Scalability Considerations

### Current Architecture Capacity
- **Users:** 783 (626 buyers + 156 sellers)
- **Concurrent Meetings:** 13,602 scheduled
- **Database Size:** ~500MB with staging data
- **Response Time:** <200ms average

### Horizontal Scaling Strategy
```mermaid
graph TB
    subgraph "Scaled Architecture"
        LB[Load Balancer]
        
        subgraph "Backend Cluster"
            B1[Backend 1]
            B2[Backend 2]
            B3[Backend N]
        end
        
        subgraph "Database Cluster"
            Primary[Primary DB]
            Replica1[Replica 1]
            Replica2[Replica 2]
        end
        
        Redis[Redis Cluster]
    end
    
    LB --> B1
    LB --> B2
    LB --> B3
    
    B1 --> Primary
    B2 --> Replica1
    B3 --> Replica2
    
    B1 --> Redis
    B2 --> Redis
    B3 --> Redis
```

---

## Monitoring & Observability

### Key Metrics
- **Application Metrics:**
  - Request rate and latency
  - Error rates by endpoint
  - Active user sessions
  - Meeting creation rate

- **Infrastructure Metrics:**
  - Database connection pool utilization
  - Redis cache hit rate
  - Docker container resource usage
  - Disk space utilization

- **Business Metrics:**
  - Daily active users
  - Meeting completion rate
  - Travel plan submissions
  - Stall allocation status

---

## Future Architecture Evolution

### Planned Enhancements
1. **Microservices Migration**
   - Split meeting, travel, and user services
   - Event-driven architecture with message queue

2. **Enhanced Caching**
   - CDN for static assets
   - Redis cluster for session store
   - Application-level caching

3. **Real-time Features**
   - WebSocket support for live updates
   - Push notifications
   - Real-time chat between users

4. **Analytics Platform**
   - Data warehouse for reporting
   - Business intelligence dashboards
   - Predictive analytics for meeting optimization

---

## Glossary

- **Buyer:** Event participant looking to schedule meetings with sellers
- **Seller:** Exhibitor with a stall at the event
- **Stall:** Physical booth space allocated to sellers
- **Meeting:** Scheduled appointment between buyer and seller
- **Time Slot:** Available time period for meetings
- **Travel Plan:** Buyer's travel arrangements including transport and accommodation
- **Floor Plan:** Layout of exhibition hall with stall locations
- **Distance Matrix:** Pre-calculated distances between stalls for optimization

---

## References

- [C4 Model](https://c4model.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [React Documentation](https://react.dev/)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Cloudflare Tunnel Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)

---

**Document Version:** 1.0  
**Last Updated:** November 9, 2025  
**Maintained By:** Development Team
