# 🔍 Performance Monitoring Report

## 🎯 Objective
To monitor and refine database performance by analyzing query execution plans and applying schema improvements such as indexes.

---

## 🛠️ Tools Used
- `EXPLAIN ANALYZE` to measure execution plan and cost
- SQL indexes to reduce scan time and improve efficiency

---

## ✅ Queries Monitored

### 1. **Booking and User Join by Date Range**

```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.total_price,
    u.first_name,
    u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-12-31';
