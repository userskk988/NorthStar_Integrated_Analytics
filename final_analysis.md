# NorthStar Urban Mobility and Logistics - In-depth Analysis
# (Student Submission Notes)

## 1. Underlying Business Problems
Based on my analysis of the `orders.csv`, `deliveries.csv`, and `complaints.csv` files, here is what I found:
- **Data Fragmentation:** Zone names were inconsistent (e.g., 'NORTH' vs 'north') which made joining files difficult before cleaning.
- **Service Delays:** By comparing `promised_window_hours` with actual delivery times (in Task 3), I noticed that certain zones like 'Central' have higher frequencies of manual route overrides.
- **Loyalty Correlation:** There is a moderate correlation between loyalty scores and app engagement, but spending doesn't always scale with loyalty, suggesting we might need better retention strategies for high-value SME customers.

## 2. Integrated Data Solution
In Task 4, I implemented a MongoDB document model. Instead of having separate tables for 'Customers', 'Events', and 'Orders', I created a single **Customer Case History** document.
- **Benefits:** This allows the Customer Experience team to see every interaction (app event) and order for a customer in a single query, reducing the need for expensive JOINs across fragmented systems.

## 3. Query Optimization
In Task 5, I demonstrated that as our dataset grows (simulated 100k records), "Collection Scans" (COLLSCAN) become unsustainable. 
- **Recommendation:** We must implement indexes on `customer_id` and `order_id` in the new MongoDB Atlas environment to maintain performance as NorthStar expands.

---
*End of Analysis*
