# 📊 Partitioning Report

## 🔍 Objective
Improve query performance on the Booking table by partitioning it based on the `start_date`.

## 🛠️ What We Did
- Partitioned the `Booking` table by RANGE on `start_date`
- Created yearly partitions: 2023, 2024, 2025
- Used `EXPLAIN` to test query on a date range

## ⚙️ Performance Result (EXPLAIN Plan)
- Before partitioning: Full table scan for date range queries
- After partitioning: Only relevant partitions are scanned
- **Result:** Reduced rows scanned, faster query planning

## ✅ Conclusion
Partitioning improved performance for date-based queries. Query planner avoids scanning unnecessary partitions, which is crucial for large datasets.
