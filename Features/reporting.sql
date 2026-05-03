-- Inventory Stock Report
SELECT p.product_id, p.product_name,
       pc.category_name, p.stock_quantity, p.price
FROM PRODUCT p
JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
ORDER BY pc.category_name, p.stock_quantity ASC;

-- Supplier Shipment Report
SELECT sup.supplier_name, s.shipment_id,
       s.reference_number, s.shipment_date, s.status
FROM SHIPMENT s
JOIN SUPPLIER sup ON s.supplier_id = sup.supplier_id
ORDER BY sup.supplier_name, s.shipment_date DESC;

-- Sales/Order Report
SELECT o.order_id, c.customer_name, o.order_date,
       o.order_type, o.status, o.total_price
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- Order Items Detail Report
SELECT o.order_id, c.customer_name, p.product_name,
       oi.quantity, oi.selling_price,
       (oi.quantity * oi.selling_price) AS item_total
FROM ORDER_ITEM oi
JOIN ORDERS o ON oi.order_id = o.order_id
JOIN CUSTOMER c ON o.customer_id = c.customer_id
JOIN PRODUCT p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- Low Stock Alert Report
SELECT p.product_id, p.product_name,
       pc.category_name, p.stock_quantity
FROM PRODUCT p
JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
WHERE p.stock_quantity <= 10
ORDER BY p.stock_quantity ASC;

-- Delivery Status Report
SELECT d.delivery_id, c.customer_name, o.order_id,
       d.delivery_date, d.status, d.delivered_by,
       CONCAT(d.delivery_street, ', ', d.delivery_barangay,
              ', ', d.delivery_city) AS delivery_address
FROM DELIVERY d
JOIN ORDERS o ON d.order_id = o.order_id
JOIN CUSTOMER c ON o.customer_id = c.customer_id
ORDER BY d.delivery_date DESC;