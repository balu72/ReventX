#!/bin/bash
# Script to set up PostgreSQL and migrate data from SQLite

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting PostgreSQL setup and migration...${NC}"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Error: Docker is not running. Please start Docker and try again.${NC}"
    exit 1
fi

# Step 1: Start PostgreSQL container
echo -e "${YELLOW}Step 1: Starting PostgreSQL container...${NC}"
docker-compose up -d

# Wait for container to be ready
echo "Waiting for PostgreSQL container to be ready..."
sleep 5

# Check if container is running
if ! docker ps | grep splash25-postgres > /dev/null; then
    echo -e "${RED}Error: PostgreSQL container failed to start. Check docker logs for details.${NC}"
    echo "Run: docker logs splash25-postgres"
    exit 1
fi

echo -e "${GREEN}PostgreSQL container started successfully!${NC}"

# Step 2: Update .env file
echo -e "${YELLOW}Step 2: Updating .env file...${NC}"
ENV_FILE="../splash25-backend/.env"
ENV_BACKUP="../splash25-backend/.env.sqlite.backup"

# Backup existing .env file
if [ -f "$ENV_FILE" ]; then
    echo "Backing up existing .env file to $ENV_BACKUP"
    cp "$ENV_FILE" "$ENV_BACKUP"
fi

# Copy new .env file
echo "Updating .env file with PostgreSQL configuration"
cp env.postgres.template "$ENV_FILE"

echo -e "${GREEN}.env file updated successfully!${NC}"

# Step 3: Install required Python packages
echo -e "${YELLOW}Step 3: Installing required Python packages...${NC}"
pip install pandas psycopg2-binary sqlalchemy

# Step 4: Run migration script
echo -e "${YELLOW}Step 4: Running migration script...${NC}"
python migrate_to_postgres.py

# Check if migration was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Migration failed. Restoring original .env file.${NC}"
    cp "$ENV_BACKUP" "$ENV_FILE"
    exit 1
fi

echo -e "${GREEN}Migration completed successfully!${NC}"

# Step 5: Provide next steps
echo -e "${YELLOW}Step 5: Next steps${NC}"
echo -e "1. Your application is now configured to use PostgreSQL."
echo -e "2. The original SQLite database is still available at: ../splash25-backend/instance/splash25.db"
echo -e "3. A backup of your original .env file is at: $ENV_BACKUP"
echo -e "4. To start your Flask application, run: cd ../splash25-backend && flask run"
echo -e "5. To stop the PostgreSQL container, run: docker-compose down"

echo -e "${GREEN}PostgreSQL setup and migration completed successfully!${NC}"
