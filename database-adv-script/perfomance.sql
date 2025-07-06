-- 🔍 Initial Query: Join Bookings with User, Property, and Payment
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON pay.booking_id = b.booking_id
WHERE 
    b.start_date >= '2024-01-01'
AND 
    b.status = 'confirmed';


-- 🔬 Analyze performance before optimization
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON pay.booking_id = b.booking_id
WHERE 
    b.start_date >= '2024-01-01'
AND 
    b.status = 'confirmed';


-- ⚙️ Optional: Index improvements
-- CREATE INDEX idx_booking_start_date ON Booking(start_date);
-- CREATE INDEX idx_booking_status ON Booking(status);
-- CREATE INDEX idx_booking_user_id ON Booking(user_id);
-- CREATE INDEX idx_booking_property_id ON Booking(property_id);
-- CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
