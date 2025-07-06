-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
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

-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
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

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
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


-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            Review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );


-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    User u
WHERE 
    (
        SELECT 
            COUNT(*)
        FROM 
            Booking b
        WHERE 
            b.user_id = u.user_id
    ) > 3;
