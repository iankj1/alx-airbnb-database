# ⚙️ Query Optimization Report

## 🎯 Objective
Optimize a complex query that retrieves all bookings along with user details, property details, and payment details.

---

## 🔍 Initial Query Summary

- Performed joins between the following tables:
  - `Booking` (main)
  - `User` (joined on `user_id`)
  - `Property` (joined on `property_id`)
  - `Payment` (joined on `booking_id` via LEFT JOIN)

---

## 🧪 Performance Analysis

We used `EXPLAIN ANALYZE` to assess the performance of the query. The initial analysis showed:

- Full table scans or sequential joins when indexes were missing
- Higher execution cost on large data due to join complexity

---

## 🛠️ Optimization Applied

- Suggested adding indexes on:
  - `Booking(user_id)`
  - `Booking(property_id)`
  - `Payment(booking_id)`
- These indexes help the planner choose faster indexed joins and reduce row scans.

---

## ✅ Results

After indexing:
- Query planner chose index scans
- Execution cost reduced
- Query speed improved especially for large datasets

---

**Conclusion:**  
Refactoring joins and using proper indexes significantly improves complex query performance.
