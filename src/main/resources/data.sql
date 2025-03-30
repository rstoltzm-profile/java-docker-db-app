INSERT IGNORE INTO users (id, name, email) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT IGNORE INTO users (id, name, email) VALUES (2, 'Jane Smith', 'jane.smith@example.com');

INSERT IGNORE INTO orders (id, user_id, product_name, amount) VALUES (1, 1, 'Laptop', 1200.00);
INSERT IGNORE INTO orders (id, user_id, product_name, amount) VALUES (2, 2, 'Phone', 800.00);