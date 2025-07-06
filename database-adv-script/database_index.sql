
EXPLAIN ANALYZE
SELECT 
    * 
FROM Booking 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';



CREATE INDEX idx_booking_start_date ON Booking(start_date);



EXPLAIN ANALYZE
SELECT 
    * 
FROM Booking 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';




EXPLAIN ANALYZE
SELECT 
    * 
FROM Property 
WHERE location = 'Nairobi';


-- ✅ Create index
CREATE INDEX idx_property_location ON Property(location);


-- 🔁 AFTER index
EXPLAIN ANALYZE
SELECT 
    * 
FROM Property 
WHERE location = 'Nairobi';
