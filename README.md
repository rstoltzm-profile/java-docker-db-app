# My Java DB App

This is a Spring Boot application that connects to a MySQL database using JPA. The project is containerized using Docker and can be run with Docker Compose. It includes REST APIs for managing `users` and `orders`.

## Prerequisites

- Docker and Docker Compose installed on your system.
- Java 17 installed if running locally.
- Maven installed for building the project.

## Project Structure

```
02-my-java-db-app/
├── all_restart.sh            # Script to rebuild and restart the full stack
├── app_restart.sh            # Script to rebuild and restart only the application
├── docker-compose.all.yaml   # Docker Compose file for the full stack
├── docker-compose.app.yaml   # Docker Compose file for the application
├── docker-compose.db.yaml    # Docker Compose file for the database
├── Dockerfile.app            # Dockerfile for building the application container
├── Dockerfile.db             # Dockerfile for building the database container
├── pom.xml                   # Maven configuration file
├── src/                      # Source code for the application
│   ├── main/
│   │   ├── java/             # Java source files
│   │   └── resources/        # Application properties, schema, and data files
│   └── test/                 # Unit tests
├── dbdata/                   # Persistent database storage
└── docs/                     # Documentation files
```

## How to Run

### Start the Database
To start the MySQL database container:
```sh
docker-compose -f docker-compose.db.yaml up -d
```

### Start the Application
To build and start the application container:
```sh
docker-compose -f docker-compose.app.yaml build
docker-compose -f docker-compose.app.yaml up -d
```

### Stop the Containers
To stop the application and database containers:
```sh
docker-compose -f docker-compose.app.yaml down
docker-compose -f docker-compose.db.yaml down
```

### Start or Stop Full Stack
To start or stop the full stack (application and database):
```sh
docker-compose -f docker-compose.all.yaml up -d
docker-compose -f docker-compose.all.yaml down
```

### Rebuild and Restart
To rebuild and restart the full stack:
```sh
./all_restart.sh
```

To rebuild and restart only the application:
```sh
./app_restart.sh
```

## Configuration

The application uses the following environment variables for database configuration:

- `SPRING_DATASOURCE_URL`: JDBC URL for the database (default: `jdbc:mysql://db:3306/mydatabase`)
- `SPRING_DATASOURCE_USERNAME`: Database username (default: `myuser`)
- `SPRING_DATASOURCE_PASSWORD`: Database password (default: `mypassword`)

These variables are defined in the `docker-compose.app.yaml` file.

## API Endpoints

The application exposes the following REST API endpoints:

### Health Check
```sh
curl http://localhost:8080/api/healthcheck
```

### Users API
- Get all users:
  ```sh
  curl http://localhost:8080/api/users
  ```
- Create a new user:
  ```sh
  curl -X POST -H "Content-Type: application/json" -d '{"name":"John","email":"john@example.com"}' http://localhost:8080/api/users
  ```

### Orders API
- Get all orders:
  ```sh
  curl http://localhost:8080/api/orders
  ```
- Create a new order:
  ```sh
  curl -X POST -H "Content-Type: application/json" -d '{"userId":1,"productName":"Tablet","amount":500.00}' http://localhost:8080/api/orders
  ```

## Database

The database schema and initial data are defined in the following files:

- **`src/main/resources/schema.sql`**: Defines the `users` and `orders` tables.
- **`src/main/resources/data.sql`**: Inserts initial data into the `users` and `orders` tables.

To manually inspect the database, connect to the MySQL container:
```sh
docker exec -it my-java-db-app-db-1 mysql -u myuser -pmypassword mydatabase
```

Run the following SQL commands:
```sql
SHOW TABLES;
SELECT * FROM users;
SELECT * FROM orders;
```

## Testing

To run the unit tests:
```sh
mvn test
```

## Troubleshooting

- If the application fails to start, check the logs:
  ```sh
  docker logs <container_id>
  ```
- Ensure the database container is running and accessible.
- If the database schema or data is not initialized, ensure `schema.sql` and `data.sql` are in the `src/main/resources` directory and that the `application.properties` file has the correct configuration:
  ```properties
  spring.datasource.initialization-mode=always
  spring.jpa.defer-datasource-initialization=true
  ```

## License

This project is licensed under the MIT License.