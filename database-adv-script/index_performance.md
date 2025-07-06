# 📊 Index Performance Report

## 🎯 Objective
Improve the performance of SQL queries by identifying and creating indexes on frequently used columns in the `User`, `Booking`, and `Property` tables.

---

## 🔍 Identified High-Usage Columns

These columns are frequently used in `JOIN`, `WHERE`, or `GROUP BY` clauses:

| Table     | Column         | Usage Reason                                     |
|-----------|----------------|--------------------------------------------------|
| `User`    | `user_id`      | Used in JOINs with Booking, Message              |
| `Booking` | `user_id`      | Used in JOINs, WHERE, and GROUP BY clauses       |
| `Booking` | `property_id`  | Used in JOINs and property ranking query         |
| `Property`| `property_id`  | Used in JOINs with Review                        |

---

## 🛠️ Indexes Implemented

The following indexes were created in the `database_index.sql` file:

```sql
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_property_id ON Property(property_id);
