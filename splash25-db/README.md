# Splash25 PostgreSQL Database

This directory contains the Docker setup for the PostgreSQL database used by the Splash25 application.

## Setup Instructions

### Prerequisites

- Docker and Docker Compose installed on your system
- Docker daemon running

### Starting the Database

To start the PostgreSQL database, run the following command from this directory:

```bash
docker-compose up -d
```

This will start the PostgreSQL container in detached mode.

### Stopping the Database

To stop the PostgreSQL database, run:

```bash
docker-compose down
```

To stop and remove all data (volumes), run:

```bash
docker-compose down -v
```

**Warning**: This will delete all data in the database.

## Connection Details

- **Host**: localhost
- **Port**: 5432
- **Database**: splash25
- **Username**: splash25user
- **Password**: splash25password

### Connection String

For the Flask application, use the following connection string in your `.env` file:

```
DATABASE_URI=postgresql://splash25user:splash25password@localhost:5432/splash25
```

## Database Management

### Accessing the PostgreSQL CLI

To access the PostgreSQL command-line interface, run:

```bash
docker exec -it splash25-postgres psql -U splash25user -d splash25
```

### Common PostgreSQL Commands

Once in the PostgreSQL CLI:

- `\l` - List all databases
- `\c splash25` - Connect to the splash25 database
- `\dt` - List all tables
- `\d table_name` - Describe a table
- `\q` - Quit the CLI

### Backup and Restore

To backup the database:

```bash
docker exec -t splash25-postgres pg_dump -U splash25user splash25 > splash25_backup.sql
```

To restore the database:

```bash
cat splash25_backup.sql | docker exec -i splash25-postgres psql -U splash25user -d splash25
```

## Data Migration from SQLite

To migrate data from the existing SQLite database to PostgreSQL, you can use the provided migration script:

```bash
python migrate_to_postgres.py
```

## Troubleshooting

If you encounter issues:

1. Check if the container is running:
   ```bash
   docker ps | grep splash25-postgres
   ```

2. View container logs:
   ```bash
   docker logs splash25-postgres
   ```

3. Ensure the port is not already in use:
   ```bash
   netstat -an | grep 5432
   ```

4. Restart the container:
   ```bash
   docker-compose restart
# splash-db
