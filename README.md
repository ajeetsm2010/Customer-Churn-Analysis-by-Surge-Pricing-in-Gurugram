# Dynamic Pricing Analytics & Customer Churn Diagnostics  
### 🚖 Quick Commerce & Food Delivery Ecosystem (Gurugram Market)

---

## 📌 Project Overview & Business Context

In high-frequency quick-commerce markets like Gurugram, dynamic pricing and delivery surge multipliers heavily influence customer retention and checkout behavior.

This project delivers a strategic diagnostic framework analyzing **10,000+ simulated transactional checkout sessions** across high-density logistics clusters.

The primary objective was to identify structural revenue leakage during peak-demand volatility, isolate customer price-elasticity thresholds, and engineer data-backed operational recommendations to safeguard Gross Merchandise Value (GMV) without negatively affecting platform unit economics.

🔗 **Live Interactive Power BI Dashboard:**  
[[🔗 View Live Interactive Power BI Dashboard](https://app.powerbi.com/links/Bq9Rd5-tv6?ctid=dce8bb35-165c-4983-8608-dec340151756&pbi_source=linkShare)]

---

# 🛠️ Data Infrastructure & Tech Stack

| Technology | Purpose |
|------------|----------|
| **SQL (SQLite)** | Transaction-level data extraction, funnel segmentation, and behavioral mapping |
| Python (Pandas, NumPy, SciPy) | Data cleaning, transformation, statistical analysis, and A/B testing |
| **Power BI Desktop** | Executive-facing dashboard development and KPI visualization |
| **DAX** | Churn-rate calculations and analytical metric generation |
| A/B Testing | Controlled experiment design, conversion analysis, and lift measurement |
| Statistical Hypothesis Testing | Two-proportion Z-test and statistical significance evaluation |
| **Generative AI (ChatGPT)** | Workflow acceleration, documentation refinement, and insight validation |

---

# 📊 Core Business Metrics & Attrition Cohorts

The checkout funnel was segmented into three surge-pricing tiers to evaluate customer price sensitivity and abandonment behavior.

| Surge Fee Cohort | Pricing Threshold | Documented Attrition Rate | Strategic Operational Interpretation |
|------------------|------------------|---------------------------|--------------------------------------|
| **Low Baseline Surge** | 0 – 30 INR | **9.92%** | Stable customer willingness-to-pay and strong retention |
| **Volatile Medium Surge** | 31 – 70 INR | **28.62%** | Customer friction begins and competitive substitution risk increases |
| **Critical Peak Surge** | > 70 INR | **59.92%** | Severe checkout abandonment and conversion collapse |

### 📌 Overall Platform Funnel Attrition Rate:
**33.47% cumulative checkout abandonment across all monitored user sessions**

---

# 📐 Funnel Attrition Methodology

To isolate behavioral drop-off patterns, the transactional dataset was mapped into structured commercial funnels instead of relying solely on flat aggregate counting.

## Churn Rate Formula

```math
Funnel Attrition Rate (%) =
(Total Dropped Users ÷ Total Checkout Attempts) × 100
```

# 🧪 A/B Testing & Experimentation

To evaluate whether a capped-surge pricing strategy could improve checkout conversion, a simulated controlled A/B experiment was conducted using 10,000 checkout sessions.

### Experiment Design

| Group | Strategy | Users | Conversion Rate |
|---|---|---:|---:|
| Control | Existing high-surge pricing | 5,000 | 35.0% |
| Treatment | Capped-surge pricing strategy | 5,000 | 49.2% |

### Statistical Analysis

A two-proportion Z-test was implemented in Python to evaluate whether the observed conversion difference was statistically significant.

**Results:**

- Control Conversion Rate: **35.0%**
- Treatment Conversion Rate: **49.2%**
- Absolute Conversion Lift: **14.2 percentage points**
- Relative Conversion Lift: **40.6%**
- Z-Statistic: **14.38**
- Statistical Significance: **p < 0.001**

The treatment group demonstrated a statistically significant improvement in checkout conversion compared with the control group.

### Business Recommendation

The analysis supports further controlled rollout testing of the capped-surge strategy, while monitoring revenue, customer retention, and unit economics before full-scale implementation.

> **Note:** The A/B experiment uses simulated treatment outcomes for analytical demonstration and does not represent a production experiment conducted on real platform users.


### Analytical Implementation
- Segmented raw transactional parameters into surge-pricing cohorts
- Evaluated localized price elasticity behavior
- Identified micro-leakage zones within the checkout funnel
- Tracked conversion deterioration across pricing thresholds

---

## 🛠️ Corporate Data Architecture & Backend Extraction Logic
To transform raw customer transactional telemetry into structured executive insights, a custom data-cleaning and cohort-segmentation pipeline was executed via SQL. Instead of relying on flat aggregate counts, the database was queried to track conditional purchasing funnels dynamically.

* 📄 **Production SQL Script:** [`churn_analysis_pipeline.sql`](./churn_analysis_pipeline.sql)

=========

### Executive Analytical Approach:
1. **Willingness-to-Pay (WTP) Segmentation:** Programmatically converted raw text string variables (`c4`) into precision numeric types (`CAST AS REAL`) to establish strict consumer price-sensitivity boundaries ($0-30$, $31-70$, $>70\text{ INR}$).
2. **Granular Funnel Aggregation:** Used conditional `SUM(CASE WHEN...)` rules to separate binary transactional success parameters (`c6`) from absolute baseline session volume.
3. **Strategic Business Sorting:** Prioritized reporting rows by highest leakage velocity (`ORDER BY funnel_attrition_rate DESC`) to instantly highlight high-risk sectors requiring immediate revenue guardrails.

# 🔍 Critical Business Insights

### 1️⃣ Price Elasticity Breach
Customer conversion rates sharply collapse once pricing exceeds the **70 INR threshold**, indicating the existence of a psychological pricing ceiling rather than a gradual linear decline.

### 2️⃣ Funnel Attrition Dynamics
The rapid increase from **9.92% churn** to **59.92% churn** reveals severe revenue leakage and measurable customer dissatisfaction during critical surge periods.

### 3️⃣ Medium Surge Instability
Medium surge ranges also demonstrate significant churn acceleration, suggesting early-stage retention friction before reaching critical pricing thresholds.

---

# 🚀 Actionable Strategic Recommendations

## ✅ Smart-Cap Pricing Mechanism
Introduce a tactical surge-price cap around the **50 INR threshold** during peak-demand periods to reduce severe abandonment behavior.

## ✅ Loyalty-Based Retention Protection
Deploy automated surge-protection plans and retention incentives for repeat or high-value customers to improve long-term customer lifetime value (LTV).

## ✅ Supply-Side Optimization
Improve real-time delivery-partner allocation and dynamic incentive management during high-demand windows to naturally reduce excessive surge pricing triggers.

## ✅ Dynamic Pricing Optimization
Continuously monitor customer price sensitivity using behavioral analytics to maintain profitability while minimizing funnel leakage.

---

# 📈 Projected Business Impact

| Business Area | Expected Outcome |
|----------------|-----------------|
| **Revenue Recovery** | Potential recovery of high-risk checkout revenue during surge periods |
| **Customer Retention** | Reduced checkout abandonment and improved user satisfaction |
| **GMV Stability** | Improved transaction consistency during peak operational volatility |
| **Operational Efficiency** | Better surge management and delivery-partner allocation |

---

# 📂 Project Deliverables

- Interactive Power BI Dashboard
- SQL-Based Transaction Analysis
- Python Data Processing Workflow
- Business Recommendation Framework
- Dashboard Screenshots & Documentation

---

# 📌 Dashboard Features

- KPI Cards for Checkout Attempts, Dropped Users & Churn Rate
- Surge-Tier-Based Churn Analysis
- Visual Funnel Attrition Comparison
- Business Recommendation Section
- Executive-Level Business Intelligence Reporting

---

## 👨‍💻 Developed By
**Ajeet Yadav**  
Business Analytics Portfolio Project • 2026
