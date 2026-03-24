# =========================================================================
# NORTHSTAR CASE STUDY - TASK 1 & 2: SQL IN R & R ANALYTICS
# =========================================================================

# 1. SETUP & DATA LOADING
if (!require(sqldf)) install.packages("sqldf")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")

# Helper to find files in Colab or Local
get_path <- function(filename) {
  if (file.exists(filename)) return(filename)
  if (file.exists(paste0("data/", filename))) return(paste0("data/", filename))
  if (file.exists(paste0("/content/", filename))) return(paste0("/content/", filename))
  return(filename)
}

customers <- read.csv(get_path("cleaned_customers.csv"))
orders <- read.csv(get_path("cleaned_orders.csv"))

# TASK 1: SQL IN R
print("--- SQL Analysis: Revenue by Zone ---")
zone_analysis <- sqldf("
  SELECT home_zone, COUNT(order_id) as total_orders, SUM(order_value) as total_revenue
  FROM customers c JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY home_zone ORDER BY total_revenue DESC
")
print(zone_analysis)

# TASK 2: R ANALYTICS & STATS
print("--- Statistical Model Summary ---")
model <- lm(order_value ~ loyalty_score, data = merge(customers, orders, by="customer_id"))
print(summary(model))

# Visualization
# ggplot(merge(customers, orders, by="customer_id"), aes(x=loyalty_score, y=order_value)) +
#   geom_point(alpha=0.2) + geom_smooth(method="lm") + labs(title="NorthStar Analysis")
