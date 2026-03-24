# Task 5: Query Optimisation Strategy

## 1. Indexing Strategy
To optimize the new MongoDB Atlas database for NorthStar, I have identified two primary indexes:

| Field | Index Type | Justification |
| :--- | :--- | :--- |
| `customer_id` | Unique Hashed | Crucial for the 360-degree customer view; prevents duplicate entries. |
| `profile.home_zone` | Single Field | Supports management's need to filter service performance by geographical region. |

## 2. Performance Tuning (Explaining Plans)
Using MongoDB's `.explain("executionStats")` method, we can compare performance:

### Stage A: COLLSCAN (Collection Scan)
Without an index, the database must check every single document. 
- **Time Complexity:** O(N)
- **Problem:** As NorthStar scales to millions of app events, search latency will rise linearly, leading to app timeouts.

### Stage B: IXSCAN (Index Scan)
By implementing the suggested indexes, the database uses a B-Tree structure.
- **Time Complexity:** O(log N)
- **Benefit:** Search times remain nearly constant regardless of data size (as shown in my `task5_optimization.py` simulation).

## 3. Performance Test Results
*Simulated on 100,000 records using Python simulation:*
- **Linear Search (COLLSCAN):** ~27.09 seconds
- **Indexed Search (IXSCAN):** ~0.000004 seconds
- **Performance Improvement:** **Over 1,000,000% speed increase.**

---
*Submitted as part of Coursework 1 - NorthStar Urban Mobility and Logistics.*
