-- Step 1: Drop original table if it exists (for clean setup/testing)
DROP TABLE IF EXISTS Booking CASCADE;

-- Step 2: Create the parent table partitioned by RANGE on start_date
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (monthly or yearly)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Sample query to test performance on date-based filter
-- (Use EXPLAIN to show planner performance)

EXPLAIN SELECT * FROM Booking
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';

-- Optional: Insert dummy data into specific partitions if needed
-- INSERT INTO Booking VALUES (...);
