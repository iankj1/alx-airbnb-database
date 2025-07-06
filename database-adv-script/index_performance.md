Based on your previous queries (JOINs, WHERE, ORDER BY), here are the high-usage columns:

Table	High-Usage Column	Reason
User	user_id	Used in JOINs with Booking, Message
Booking	user_id	JOINs and COUNT by user
Booking	property_id	JOINs and ranking
Property	property_id	JOINs with Review


-- Create index on user_id in User table (used in JOINs and WHERE)
CREATE INDEX idx_user_user_id ON User(user_id);

-- Create index on user_id in Booking table (used in JOINs, GROUP BY, WHERE)
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on property_id in Booking table (used in JOINs and ranking)
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on property_id in Property table (used in JOINs with Review)
CREATE INDEX idx_property_property_id ON Property(property_id);


EXPLAIN SELECT 
    u.first_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id;
