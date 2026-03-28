# 🍽️ Swiggy Sales Analysis | SQL + Power BI (DirectQuery)

## Business Problem Definition (BPD)

Food delivery platforms like Swiggy generate massive volumes of transactional data across cities, restaurants, and dishes. However, without proper analysis, it is difficult to extract meaningful insights.

### Key Business Questions

* Which cities generate the highest revenue and orders?
* What are the most popular dishes and food categories (Veg vs Non-Veg)?
* Which restaurants perform best based on sales and ratings?
* How do sales and orders trend over time?
* What drives customer satisfaction (ratings)?


## Objective

To build an end-to-end data analytics solution that:

* Transforms raw data into a **Star Schema**
* Establishes relationships using **SQL Server**
* Performs analytical queries
* Builds an **interactive Power BI dashboard (DirectQuery)**
* Enables data-driven decision making


## Solution Approach

To address the business problem, the following solution was implemented:

### 1. Data Preparation (SQL Server)

* Imported raw data into SQL Server using flat file import
* Cleaned and structured the dataset
* Renamed columns for consistency (`food_id → dish_id`)


### 2. Data Modeling (Star Schema)

* Designed a **Fact-Dimension model**
* Created:

  * `fact_orders` (transaction data)
  * `dim_date`, `dim_dish`, `dim_restaurant`, `dim_location`
* Established relationships using **Primary Keys & Foreign Keys**


### 3. Data Validation

* Performed SQL joins to validate relationships
* Ensured referential integrity across all tables

### 4. SQL-Based Analysis

* Calculated KPIs:

  * Total Revenue
  * Total Orders
  * Average Rating
* Performed:

  * City-level analysis
  * Restaurant performance analysis
  * Time-based trend analysis


### 5. Power BI Integration (DirectQuery)

* Connected SQL Server to Power BI using **DirectQuery mode**
* Ensured real-time data connectivity
* Built relationships in Power BI model view


### 6. Dashboard Development

* Created interactive visuals:

  * KPI Cards (Sales, Orders, Ratings)
  * Bar Charts (Top Restaurants, Top Dishes)
  * Line Chart (Monthly Trend)
  * Map (City-wise Sales)
  * Pie Chart (Veg vs Non-Veg)


### 7. DAX Calculations

* Created custom calculated column for food classification:

```DAX
Food Type =
VAR dish = LOWER(dim_dish[dish_name])
RETURN
IF (
    CONTAINSSTRING(dish, "chicken") ||
    CONTAINSSTRING(dish, "egg") ||
    CONTAINSSTRING(dish, "fish") ||
    CONTAINSSTRING(dish, "mutton") ||
    CONTAINSSTRING(dish, "prawn") ||
    CONTAINSSTRING(dish, "biryani") ||
    CONTAINSSTRING(dish, "kabab") ||
    CONTAINSSTRING(dish, "kebab") ||
    CONTAINSSTRING(dish, "non-veg") ||
    CONTAINSSTRING(dish, "non veg"),
    "Non-Veg",
    "Veg"
)
```


## Data Model (Star Schema)

### Fact Table

* `fact_orders`

### Dimension Tables

* `dim_date`
* `dim_dish`
* `dim_restaurant`
* `dim_location`

###  Relationships

* fact_orders → dim_date
* fact_orders → dim_dish
* fact_orders → dim_restaurant
* fact_orders → dim_location

✔ Built using **Primary Key & Foreign Key constraints**
✔ Optimized for analytics


##  Tools & Technologies

* Microsoft SQL Server (SSMS)
* Power BI (DirectQuery Mode)
* DAX (Data Analysis Expressions)
* Data Modeling (Star Schema)


## SQL Implementation

Key steps performed:

* Created foreign key relationships
* Validated joins between tables
* Performed business analysis queries

SQL Script Included: `Swiggy.sql`


## Power BI Dashboard

###  Key KPIs

* Total Sales: ₹53.01M
* Total Orders: 197K
* Avg Order Value: ₹268.51
* Avg Rating: 4.34
* Rating Count: 5.59M
* Locations Covered: 995


## Dashboard Insights

* Monthly Sales Trend
* Veg vs Non-Veg Distribution
* Top Restaurants by Sales
* City-wise Sales Analysis
* Restaurant Rating Comparison
* Top Dishes by Orders


## Project Files

* `Swiggy.sql` → SQL scripts
* `Swiggy.pbix` → Power BI dashboard
* `Swiggy.pdf` → Dashboard preview
* `README.md` → Documentation


## Dashboard Preview

```
<img width="1914" height="892" alt="Screenshot 2026-03-29 004138" src="https://github.com/user-attachments/assets/fd7b717c-7389-4106-a83c-275ba9795e01" />

```


## Key Learnings

* Built **end-to-end data pipeline**
* Designed **Star Schema**
* Used **DirectQuery for real-time analytics**
* Created **interactive dashboards**
* Derived **business insights from data**


## Use Case

This solution helps businesses:

* Identify top-performing restaurants
* Understand customer preferences
* Track sales growth
* Improve decision-making


##  Author

Prince Kumar
Business Analyst | Data Anlyst

---

## ⭐ Support

If you found this project useful, please ⭐ the repository!

