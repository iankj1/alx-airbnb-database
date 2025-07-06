🔹 1. INNER JOIN — Bookings with Respective Users
  
sql
Copy
Edit
-- Retrieve all bookings and the users who made them
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

🔹 2. LEFT JOIN — Properties with or without Reviews
sql
Copy
Edit
-- Retrieve all properties and their reviews, including properties without reviews
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;


🔹 3. FULL OUTER JOIN — All Users and All Bookings (Even If Unlinked)
sql
Copy
Edit
-- Retrieve all users and all bookings, including unmatched ones
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;
