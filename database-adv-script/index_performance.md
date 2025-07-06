-- Write a SQL command to create appropriate indexes for the columns used in joins and WHERE clauses

CREATE INDEX idx_user_user_id ON User(user_id);

CREATE INDEX idx_booking_user_id ON Booking(user_id);

CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_property_property_id ON Property(property_id);


-- Measure the query performance before adding indexes using EXPLAIN

EXPLAIN SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name;


-- Measure the query performance after adding indexes using EXPLAIN

EXPLAIN SELECT 
    b.property_id,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Booking b
GROUP BY 
    b.property_id;
