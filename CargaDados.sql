USE BIKEINCKAUA;

-- ======================
-- Production (Vermelho)
-- ======================

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Bicicletas'),
(2, 'Acessórios'),
(3, 'Peças');

INSERT INTO brands (brand_id, brand_name) VALUES
(1, 'Caloi'),
(2, 'Specialized'),
(3, 'Trek'),
(4, 'Shimano');

INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES
(1, 'Bicicleta MTB Caloi Elite', 1, 1, 2024, 5500.00),
(2, 'Bicicleta Trek Marlin 7', 3, 1, 2025, 7200.00),
(3, 'Capacete Specialized Align II', 2, 2, 2024, 450.00),
(4, 'Câmbio Traseiro Shimano Deore', 4, 3, 2023, 650.00),
(5, 'Bicleta Teste Estoque', 4, 3, 2023, 650.00);

-- ======================
-- Sales (Azul)
-- ======================

INSERT INTO stores (store_id, store_name, phone, email, street, city, state, zip_code) VALUES
(1, 'Loja Bike Centro', '15999999999', 'centro@bike.com', 'Rua A, 100', 'Sorocaba', 'SP', '18000-000'),
(2, 'Loja Bike Shopping', '15988888888', 'shopping@bike.com', 'Av B, 200', 'São Paulo', 'SP', '01000-000');

INSERT INTO staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES
(1, 'João', 'Silva', 'joao@bike.com', '15977777777', 1, 1, NULL),   -- gerente
(2, 'Maria', 'Oliveira', 'maria@bike.com', '15966666666', 1, 1, 1), -- subordinada
(3, 'Carlos', 'Souza', 'carlos@bike.com', '11955555555', 1, 2, NULL),
(4, 'Kauã', 'Ramos', 'kaua.ramos@bike.com', '11955555577', 1, 2, NULL);

INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES
(1, 'Ana', 'Pereira', '11944444444', 'ana@gmail.com', 'Rua C, 300', 'São Paulo', 'SP', '01020-000'),
(2, 'Bruno', 'Costa', '11933333333', 'bruno@gmail.com', 'Rua D, 400', 'Campinas', 'SP', '13000-000'),
(3, 'Kauã', 'Ramos', '15996326833', 'kaua.p.ramos@gmail.com', 'Rua 10 980', 'Sorocaba', 'SP', '19000-000');


INSERT INTO orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) VALUES
(1, 1, 'Shipped', '2025-08-01', '2025-08-05', '2025-08-03', 1, 2),
(2, 2, 'Pending', '2025-08-10', '2025-08-15', NULL, 2, 3);

INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount) VALUES
(1, 1, 1, 1, 5500.00, 0.00),   -- Bicicleta Caloi
(1, 2, 3, 1, 450.00, 50.00),   -- Capacete Specialized com desconto
(2, 1, 2, 1, 7200.00, 0.00);   -- Bicicleta Trek

-- ======================
-- Ligação de estoque (Stocks)
-- ======================

INSERT INTO stocks (store_id, product_id, quantity) VALUES
(1, 1, 5),  -- Loja Centro tem 5 Bicicletas Caloi
(1, 3, 15), -- Loja Centro tem 15 Capacetes
(2, 2, 3),  -- Loja Shopping tem 3 Bicicletas Trek
(2, 4, 8),  -- Loja Shopping tem 8 Câmbios Shimano
(2, 5, 0);  -- Loja Shopping tem 0 Bicleta Teste Estoque