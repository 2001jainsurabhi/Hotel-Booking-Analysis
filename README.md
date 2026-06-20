# Hotel Booking Flat

## Project Overview

This project was completed as part of the TravClan Business Analyst Intern Technical Assessment (Set C).

The assessment covers:

- Data Quality Analysis
- VIP vs Volume Business Case Study
- SQL Schema Design & Query Analysis
- Multi-Currency Revenue Reporter using a Live API
- Power BI Dashboard Development

Dataset: Hotel Booking Platform Dataset (12,000 Records)

---

# Tools Used

- Python (Google Colab)
- Pandas
- NumPy
- Matplotlib
- Requests
- MySQL Workbench
- Power BI
- Frankfurter FX API

---

# Section 1 - Data Quality Checks

Performed data quality validation on:

- Zero-room bookings
- Booking date before signup date
- Missing reviews by booking status

### Key Findings

- 60 bookings contained zero rooms.
- 163 bookings occurred before customer signup dates.
- 57.12% of bookings had missing reviews.
- Cancelled and No-Show bookings showed the highest percentage of missing reviews.

---

# Section 2 - VIP vs Volume Strategy

Defined VIP customers using three approaches:

1. Top 10% by Total Spend
2. Top 10% by Booking Count
3. Top 10% by Lifetime Value Rate

### Key Findings

- 10 customers appeared in all three VIP definitions.
- VIP customers generated 26.84% of realized revenue.
- VIP cancellation rate was lower than Non-VIP customers.
- VIP customers received significantly higher discounts.

### Business Recommendation

A balanced acquisition and retention strategy is recommended, with stronger emphasis on retaining high-value VIP customers while continuing customer acquisition efforts.

---

# Section 3 - SQL Challenge

Created a normalized schema using:

- Customers Table
- Properties Table
- Bookings Table

Implemented:

- Primary Keys
- Foreign Keys
- CHECK Constraints
- Indexing Strategy

### SQL Analysis

- Booking Sequence Analysis using ROW_NUMBER()
- Property Rating Analysis with Corporate Rating Normalization

---

# Section 4 - Multi-Currency Revenue Reporter

Built a revenue reporting tool using the Frankfurter FX API.

### Features

- Live API Integration
- Error Handling
- Historical FX Rate Retrieval
- INR to USD Revenue Conversion
- FX Adjusted Revenue Trend Analysis

### Business Insight

After adjusting revenue using historical exchange rates, overall revenue trends remained broadly consistent. This indicates that business growth was primarily driven by booking activity rather than currency fluctuations.

---

# Power BI Dashboard

The dashboard includes:

- KPI Overview
- Booking Status Distribution
- Revenue by Booking Channel
- Revenue by Customer Segment
- Monthly Revenue Trend
- Interactive Slicers

### Dashboard Highlights

- 77.78% Completed Bookings
- OTA generated the highest revenue
- Individual customers contributed the most revenue
- Revenue increased during later months of the year

---

# API Used

Frankfurter Foreign Exchange API

https://api.frankfurter.app

Example:

https://api.frankfurter.app/latest?base=INR&symbols=USD,EUR,GBP

---

# AI Usage Note

AI assistance was used for:

- Structuring analysis workflow
- Generating API integration templates
- Drafting SQL query logic
- Reviewing business interpretations

Manual corrections were made for:

- Historical FX date handling
- Revenue conversion calculations
- API exception handling
- Realized revenue calculations

---

# Repository Structure

```text
├── answers.docx
├── code
│   ├── schema.sql
│   ├── queries.sql
│   └── analysis_notebook.ipynb
├── project
│   ├── fx_reporter.ipynb
│   ├── README.md
│   ├── insight.txt
│   └── AI_usage_note.txt
├── dashboard
│   └── DATA_ANALYST_ASSIGNMENT.pbix
└── visuals
```

---

# Author

**Surbhi Jain**
