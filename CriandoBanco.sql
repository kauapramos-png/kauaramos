CREATE DATABASE BIKEINCKAUA;
GO

USE BIKEINCKAUA;
-- ======================
-- Production (Vermelho)
-- ======================

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE stocks (
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    -- store_id será FK para stores (Sales)
);

-- ======================
-- Sales (Azul)
-- ======================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150),
    street VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20)
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150),
    street VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20)
);

CREATE TABLE staffs (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    active BIT DEFAULT 1,
    store_id INT NOT NULL,
    manager_id INT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (manager_id) REFERENCES staffs(staff_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_status VARCHAR(50),
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT NOT NULL,
    staff_id INT NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    list_price DECIMAL(10,2),
    discount DECIMAL(5,2),

    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Agora adicionamos a FK faltante em stocks
ALTER TABLE stocks
ADD CONSTRAINT fk_stocks_store FOREIGN KEY (store_id) REFERENCES stores(store_id);
