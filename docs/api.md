# API instructions

## Basic Check
```
curl http://localhost:8080/api/healthcheck
```

```
curl http://localhost:8080/api/users
curl -s -w "\n" http://localhost:8080/api/users
```

```
curl -X POST -H "Content-Type: application/json" -d '{"name":"Newie","email":"newie@example.com"}' http://localhost:8080/api/users
```

```
curl http://localhost:8080/api/orders
curl -s -w "\n" http://localhost:8080/api/orders
```
```
curl -X POST -H "Content-Type: application/json" -d '{"userId":1,"productName":"Tablet","amount":500.00}' http://localhost:8080/api/orders
```

```
curl -X POST -H "Content-Type: application/json" -d '{"username":"testuser","password":"testpassword"}' http://localhost:8080/api/auth/login
curl -H "Authorization: Bearer <your-token>" http://localhost:8080/api/users
```