CREATE TABLE PRODUCT_CATEGORY (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES PRODUCT_CATEGORY(category_id)
);

CREATE TABLE ORDER_ITEM (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
    FOREIGN KEY (order_id) REFERENCES ORDER(order_id)
);

CREATE TYPE order_status AS ENUM ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TABLE ORDER (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    status order_status DEFAULT 'PENDING',
    total_price DECIMAL(10, 2) NOT NULL,
    order_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

-- Subtype tables for different order types
CREATE TABLE IN_STORE_ORDER (
    order_id INT PRIMARY KEY,
    release_time TIME NULL,
    claimed_by VARCHAR(255) NULL,
    FOREIGN KEY (order_id) REFERENCES ORDER(order_id)
);

CREATE TABLE DELIVERY_ORDER (
    order_id INT PRIMARY KEY,
    delivery_address VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDER(order_id)
);

-- Delivery table to track delivery details for delivery orders
CREATE TYPE delivery_status AS ENUM ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TABLE DELIVERY (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_date DATE NOT NULL,
    delivery_street VARCHAR(255) NOT NULL,
    delivery_baranagay VARCHAR(255) NOT NULL,
    delivery_city VARCHAR(255) NOT NULL,
    delivery_province VARCHAR(255) NOT NULL,
    status delivery_status DEFAULT 'PENDING',
    FOREIGN KEY (order_id) REFERENCES ORDER(order_id)
);

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    customer_street VARCHAR(255) NOT NULL,
    customer_baranagay VARCHAR(255) NOT NULL,
    customer_city VARCHAR(255) NOT NULL,
    customer_province VARCHAR(255) NOT NULL
);

CREATE SHIPMENT_ITEM (
    shipment_item_id INT PRIMARY KEY,
    shipment_id INT, 
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES SHIPMENT(shipment_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
)

CREATE TYPE shipment_status AS ENUM ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TABLE SHIPMENT (
    shipment_id INT PRIMARY KEY,
    supplier_id INT,
    shipment_date DATE NOT NULL,
    status shipment_status DEFAULT 'PENDING'
    reference_number VARCHAR(255) NOT NULL
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
);

CREATE TABLE SUPPLIER (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    supplier_street VARCHAR(255) NOT NULL,
    supplier_baranagay VARCHAR(255) NOT NULL,
    supplier_city VARCHAR(255) NOT NULL,
    supplier_province VARCHAR(255) NOT NULL
)




