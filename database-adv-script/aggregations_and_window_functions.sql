-- Total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name;


-- Rank properties by total number of bookings using RANK()
SELECT 
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id, p.name
) AS property_bookings;
