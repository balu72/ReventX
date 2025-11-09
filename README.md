# Splash25 Event Management System

A comprehensive event management platform for organizing B2B meetings, managing accommodations, and coordinating travel plans for large-scale events.

## 🚀 Live Access

- **Temporary Tunnel:** https://sport-drama-prerequisite-intimate.trycloudflare.com
- **Custom Domain:** https://splash25.dechivo.com (requires Cloudflare security settings adjustment)
- **Local:** http://localhost

## 📋 Project Overview

Splash25 is a full-stack event management system designed to handle:
- **783 Users:** 626 buyers and 156 sellers
- **13,602 Scheduled Meetings:** Automated meeting scheduling with distance optimization
- **524 Travel Plans:** Complete travel and accommodation management
- **5,148 Stall Inventory Items:** Exhibition stall allocation and management

## 🏗️ Architecture

### Tech Stack
- **Frontend:** React + TypeScript + Vite + TailwindCSS + shadcn/ui
- **Backend:** Python Flask + SQLAlchemy
- **Database:** PostgreSQL 15
- **Cache:** Redis
- **Web Server:** Nginx
- **Deployment:** Docker Compose
- **Tunneling:** Cloudflare Tunnel

### Services
- **PostgreSQL:** Database with full staging data
- **Redis:** Session and cache management
- **Backend API:** RESTful Flask API on port 5000
- **Frontend:** React SPA on port 3000
- **Nginx:** Reverse proxy on port 80

## 🚀 Quick Start

### Prerequisites
- Docker Desktop installed
- 8GB+ RAM available
- 10GB+ disk space

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/balu72/ReventX.git
cd ReventX
```

2. **Start all services:**
```bash
docker compose up -d
```

3. **Wait for health checks (30-45 seconds):**
```bash
docker compose ps
```

4. **Access the application:**
- Local: http://localhost
- Or use Cloudflare tunnel (see below)

### Database

The database is automatically initialized with:
- ✅ Complete schema (56 tables)
- ✅ Master data (categories, stall types, properties)
- ✅ Transaction data (783 users loaded from staging dump)
- ✅ 13,602 pre-scheduled meetings
- ✅ 19,740 time slots
- ✅ 524 travel plans with accommodations

## 🌐 Public Access via Cloudflare Tunnel

### Option 1: Temporary Quick Tunnel
```bash
cloudflared tunnel --url http://localhost:80
```
This creates a temporary public URL (changes each time).

### Option 2: Custom Domain (Persistent)
The project includes configuration for `splash25.dechivo.com`:

1. **Start the tunnel:**
```bash
cloudflared tunnel --config ~/.cloudflared/config-mytunnel.yml run mytunnel
```

2. **Configure Cloudflare Dashboard:**
   - Go to https://dash.cloudflare.com
   - Select your domain
   - Go to Security → Settings
   - Set Security Level to "Low" or "Essentially Off"
   - Disable "Bot Fight Mode"
   - Disable "Browser Integrity Check"
   - Go to SSL/TLS → Overview
   - Set to "Full" mode

## 📁 Project Structure

```
ReventX/
├── docker-compose.yml          # Multi-container orchestration
├── splash25-backend/           # Python Flask API
│   ├── app/
│   │   ├── models/            # SQLAlchemy models
│   │   ├── routes/            # API endpoints
│   │   └── utils/             # Helper functions
│   ├── Dockerfile
│   └── requirements.txt
├── splash25-ui/               # React frontend
│   ├── src/
│   │   ├── components/       # React components
│   │   ├── pages/            # Page components
│   │   ├── services/         # API services
│   │   └── contexts/         # React contexts
│   ├── Dockerfile.dev
│   └── vite.config.ts
└── splash25-db/              # Database files
    ├── init-scripts/         # Schema and master data
    ├── muddyboo_splash25_staging_db_full_dump.sql  # Full staging data
    ├── meeting_scheduler/    # Meeting scheduling tools
    ├── migration_data/       # Data import scripts
    └── buyer_photos/         # Photo processing scripts
```

## 🔧 Configuration

### Environment Variables

**Backend (.env in splash25-backend/):**
```env
FLASK_ENV=development
DATABASE_URL=postgresql://splash25user:splash25pass@splash25-postgres:5432/splash25_core_db
REDIS_URL=redis://splash25-redis:6379/0
SECRET_KEY=your-secret-key
```

**Frontend (vite.config.ts):**
```typescript
server: {
  host: "::",
  port: 8080,
  allowedHosts: ['splashtest.ourevent.management', 'splash.ourevent.management', 'splash25.dechivo.com', 'localhost']
}
```

## 📊 Database Schema

The system includes 56 tables organized into:
- **User Management:** users, buyer_profiles, seller_profiles
- **Meeting System:** meetings, time_slots, meeting_metadata
- **Travel Management:** travel_plans, accommodations, transportation
- **Stall Management:** stall_inventory, stall_types, stall_distance_matrix
- **Reference Data:** buyer_categories, interests, property_types, transport_types

## 🛠️ Development

### Running Individual Services

**Backend only:**
```bash
cd splash25-backend
pip install -r requirements.txt
python run.py
```

**Frontend only:**
```bash
cd splash25-ui
npm install
npm run dev
```

**Database only:**
```bash
docker compose up splash25-postgres -d
```

### Database Management

**Connect to PostgreSQL:**
```bash
docker exec -it splash25-postgres psql -U splash25user -d splash25_core_db
```

**View table counts:**
```bash
docker exec splash25-postgres psql -U splash25user -d splash25_core_db -c "
SELECT 'Users' as table_name, COUNT(*) FROM users
UNION ALL SELECT 'Meetings', COUNT(*) FROM meetings
UNION ALL SELECT 'Time Slots', COUNT(*) FROM time_slots;
"
```

**Backup database:**
```bash
docker exec splash25-postgres pg_dump -U splash25user splash25_core_db > backup.sql
```

**Restore database:**
```bash
docker exec -i splash25-postgres psql -U splash25user -d splash25_core_db < backup.sql
```

## 🧪 Testing

### Health Check
```bash
curl http://localhost/api/health
```

### API Endpoints
- `GET /api/health` - System health status
- `POST /api/auth/login` - User authentication
- `GET /api/buyers` - List all buyers
- `GET /api/sellers` - List all sellers
- `GET /api/meetings` - List meetings
- `POST /api/meetings` - Create meeting
- `GET /api/stalls` - List stall inventory

## 🐳 Docker Commands

```bash
# Start all services
docker compose up -d

# Stop all services
docker compose down

# View logs
docker compose logs -f

# View specific service logs
docker logs splash25-backend -f

# Restart a service
docker compose restart frontend

# Rebuild and restart
docker compose up -d --build

# Remove all data and restart fresh
docker compose down -v
docker compose up -d
```

## 🔍 Troubleshooting

### Services won't start
```bash
# Check Docker resources (need 8GB+ RAM)
docker system df

# View detailed logs
docker compose logs
```

### Database connection issues
```bash
# Check PostgreSQL is healthy
docker compose ps

# Test connection
docker exec splash25-postgres pg_isready -U splash25user
```

### Frontend not loading
```bash
# Check if Vite dev server is running
docker logs splash25-frontend

# Rebuild frontend
docker compose up -d --build frontend
```

### Cloudflare tunnel not working
```bash
# Check tunnel process
ps aux | grep cloudflared

# View tunnel logs
tail -f /tmp/mytunnel.log

# Restart tunnel
kill <PID>
cloudflared tunnel --config ~/.cloudflared/config-mytunnel.yml run mytunnel
```

## 📈 Features

### User Management
- Buyer and Seller profiles
- Profile image uploads
- Category-based user segmentation
- Email verification system

### Meeting Management
- Automated meeting scheduling
- Time slot availability checking
- Distance-based optimization
- Meeting confirmation/cancellation
- QR code check-in system

### Travel Management
- Flight/train booking integration
- Accommodation allocation
- Ground transportation coordination
- Arrival/departure tracking

### Stall Management
- Interactive floor plan
- Stall allocation system
- Distance matrix calculation
- Stall type categorization

### Admin Features
- User management dashboard
- Meeting reports
- Travel & accommodation reports
- System settings configuration
- Access log monitoring

## 📝 Data Migration

The project includes tools for data import:
- `migration_data/` - User import scripts
- `meeting_scheduler/` - Automated meeting scheduling
- `buyer_photos/` - Photo processing utilities
- `accommodations_entry/` - Accommodation allocation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is proprietary software for Splash25 event management.

## 📞 Support

For issues or questions:
- Create an issue in this repository
- Contact the development team

## 🔐 Security Notes

- Default credentials should be changed in production
- Use environment variables for sensitive data
- Enable SSL/TLS for production deployments
- Review Cloudflare security settings before going live

## 🎯 Production Deployment

For production deployment:
1. Use production Dockerfiles (not `.dev`)
2. Set `FLASK_ENV=production`
3. Use strong SECRET_KEY
4. Enable SSL/TLS
5. Configure proper backup strategy
6. Set up monitoring and logging
7. Review and harden security settings

## 📊 System Requirements

**Minimum:**
- 8GB RAM
- 4 CPU cores
- 20GB disk space
- Docker Desktop

**Recommended:**
- 16GB RAM
- 8 CPU cores
- 50GB disk space
- Docker Desktop with resource limits increased

## 🌟 Highlights

- **Production-Ready Data:** 783 real users with complete profiles
- **Automated Scheduling:** 13,602 meetings pre-scheduled with distance optimization
- **Complete Travel System:** 524 travel plans with flight, accommodation, and ground transport
- **Scalable Architecture:** Microservices-based with Docker orchestration
- **Modern Stack:** React + TypeScript + Flask + PostgreSQL
- **Global Access:** Cloudflare Tunnel for worldwide accessibility

---

Built with ❤️ for Splash25 Event Management
