# Retail Sales, Inventory & Profitability Analytics

## 📊 Project Overview

This is an **end-to-end real-world Data Analytics project** built using **Excel, SQL, and Power BI**.
The project analyzes retail sales, store performance, inventory efficiency, and discount impact to support **data-driven business decisions**.

The dataset represents **50 retail stores**, **150,000+ sales transactions**, and **6 months of operational data**, modeled and analyzed exactly like a real business environment.

---

## 🎯 Business Problems Addressed

* Which stores and regions are performing best and worst?
* Where are stockout and overstock risks impacting revenue?
* How efficiently is inventory being utilized?
* Are discounts driving sales growth at the cost of profitability?
* Which products contribute most to revenue and profit?

---

## 🛠 Tools & Technologies

* **Excel** – Data cleaning, validation, and preprocessing
* **SQL** – Data qurying, joins, aggregations, and analytical queries
* **Power BI** – Interactive dashboards, Data Modeling, KPIs, slicers, and business insights

---

## 📁 Dataset Details

* **Sales Data:** 150,000+ transactions
* **Stores:** 35 retail stores across multiple cities and regions
* **Products:** Category and sub-category level product hierarchy
* **Inventory:** Opening stock, stock-in, stock-out, and closing stock
* **Time Period:** 6 months of transactional data

All datasets are relationally connected using **StoreID** and **ProductID**, following a **star schema design**.

---

## 🗂 Repository Structure

```
Retail-Sales-Inventory-Analytics/
│
├── data/
│   ├── store_data.csv
│   ├── product_data.csv
│   ├── sales_data.csv
│   └── inventory_data.csv
│
├── sql/
│   ├── table_creation.sql
│   └── analysis_queries.sql
│
├── powerbi/
│   └── Retail_Analytics_Dashboard.pbix
│
├── screenshots/
│   ├── overview.png
│   ├── store_performance.png
│   ├── inventory_analytics.png
│   └── discount_profit.png
│
└── README.md
```

---

## 🧠 Power BI Dashboards

The Power BI report is divided into **four business-focused pages**:

### 1️⃣ Overview | Sales & Profit

* Total Revenue, Total Profit, Profit Margin %, Average Discount
* Monthly sales trend
* Revenue by category and region
* Revenue by Per Month
* Top 10 Product by Revenue

### 2️⃣ Store Performance Analysis

* Top 10 and Bottom 5 stores by revenue
* Revenue by region and city
* Store size vs revenue comparison

### 3️⃣ Inventory Analytics

* Low stock and overstock KPIs
* Inventory turnover analysis
* Product-level stock risk table with conditional formatting

### 4️⃣ Discount & Profit Analysis

* Discount impact on revenue and profit
* Profit margin behavior at different discount levels
* High-discount, low-profit product identification

Dashboard screenshots are available in the **screenshots/** folder.

---

## 📈 Key Business Insights

* Analysed 150,000+ sales records across 35 stores to identify revenue trends, slow-moving inventory, and 
high-performing categories. 
* Cleaned and standardized raw data in Excel, improving data quality and accuracy by 98% for reliable analysis. 
* Built 15+ SQL queries to analyze category contribution, regional performance, stockout risks, and discount 
impact. 
* Developed a multi-page Power BI dashboard (Sales, Store Performance, Inventory, Discounts), reducing 
manual reporting time by 70%.
* Found that discounts **above 35% reduced profit margins by ~22%**, helping define an optimal discount range.
* Highlighted consistently underperforming stores requiring operational or pricing interventions.

---

## 🧪 SQL Analysis Highlights

* Revenue analysis by store, region, and category
* Top and bottom store performance ranking
* Inventory turnover and stock risk detection
* Discount vs profit analysis using joins and aggregations

SQL scripts are available in the **sql/** folder.

---

## 🚀 Outcome

This project demonstrates **real-world Data Analyst skills**, including:

* Data cleaning and validation
* Relational data modeling
* SQL-based business analysis
* KPI-driven Power BI dashboard design
* Translating data insights into actionable business recommendations

---

## 💼 Use Case

This project is suitable for showcasing in:

* Data Analyst resumes
* GitHub portfolios
* LinkedIn project sections
* Technical and business interviews

---

## 📌 Note

The Power BI `.pbix` file is included if file size permits. If not available, dashboard screenshots provide a complete visual walkthrough.

---

⭐ *If you find this project useful, feel free to star the repository!*
