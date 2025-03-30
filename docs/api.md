# API instructions

## Basic Check
```
curl http://localhost:8080/api/healthcheck
```

```
curl http://localhost:8080/api/users
```

```
curl -X POST -H "Content-Type: application/json" -d '{"name":"John","email":"john@example.com"}' http://localhost:8080/api/users
```

```
curl http://localhost:8080/api/orders
```
```
curl -X POST -H "Content-Type: application/json" -d '{"userId":1,"productName":"Tablet","amount":500.00}' http://localhost:8080/api/orders
```