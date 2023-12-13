# eSave

## Invoices Endpoints

### `GET /invoices`

Retrieve the list of all invoices.

### `GET /invoices/:id`

Retrieve details of a specific invoice.

### `POST /invoices`

Create a new invoice.

#### Request Body:
```json
{
  "price": 100.00,
  "date": "2023-12-13",
  "provider_id": 1,
  "client_id": 2
}
```
#### Response:
- **Status:** 201 Created
- **Body:**
```json
  {
    "id": 1,
    "price": 100.00,
    "date": "2023-12-13",
    "provider_id": 1,
    "client_id": 2
  }
```

### `PATCH /invoices/:id`

Update details of an existing invoice.

#### Request Body:
```json
{
  "price": 120.00
}
```
#### Response:
- **Status:** 200 ok
- **Body:**
```json
  {
    "id": 1,
    "price": 120.00,
    "date": "2023-12-13",
    "provider_id": 1,
    "client_id": 2
  }
```
### `DELETE /invoices/:id`

Delete a specific invoice.

#### Response:
- **Status:** 204 No Content

## Database Choice: PostgreSQL

### Rationale

1. **Data Integrity:**
   - PostgreSQL is renowned for its robust support for data integrity and foreign key constraints, making it well-suited for managing relationships between entities like invoices, clients, and providers.

2. **Performance:**
   - PostgreSQL is known for its high performance and scalability, making it beneficial for handling a high volume of fast invoice insertions.

3. **Stability and Durability:**
   - PostgreSQL is a mature and stable database, suitable for production environments. Its stability is particularly advantageous when dealing with a stable provider table.

4. **Advanced Features:**
   - PostgreSQL offers advanced features, including native JSON support. This can be valuable if you need to store additional information flexibly within your entities.

5. **Transaction Support:**
   - Given the rapid addition of invoices, it's crucial to have a database system that supports efficient transactions, a strength of PostgreSQL.

