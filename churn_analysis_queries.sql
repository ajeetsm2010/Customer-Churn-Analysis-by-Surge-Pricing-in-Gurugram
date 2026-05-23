-- =================================================================================
-- PROJECT: Revenue Leakage Diagnosis & Price Elasticity Optimization
-- ECOSYSTEM: Quick Commerce Customer Retention & Funnel Diagnostics (Zomato/Blinkit Style)
-- GEOGRAPHY / MARKET: Gurugram Clusters (High-Density Demand Hub)
-- ROLE FOCUS: Business Process Re-engineering & Revenue Guardrails
-- AUTHOR: Ajeet Yadav | May 2026
-- =================================================================================

SELECT 
    -- 1. Commercial Tier Segmentation (Mapping Psychological Willingness-to-Pay Boundaries)
    CASE 
        WHEN CAST(c4 AS REAL) <= 30.0 THEN '0-30 INR (Low Baseline Surge)'
        WHEN CAST(c4 AS REAL) > 30.0 AND CAST(c4 AS REAL) <= 70.0 THEN '31-70 INR (Volatile Medium Surge)'
        ELSE 'Above 70 INR (Critical Peak Surge)'
    END AS surge_tier,
    
    -- 2. Customer Purchasing Journey Funnel Tracking (Operational Metrics)
    COUNT(c1) AS total_checkout_attempts,
    SUM(CAST(c6 AS INTEGER)) AS total_dropped_users,
    
    -- 3. Business Metric Calculation: Funnel Attrition Rate (%)
    ROUND(
        (CAST(SUM(CAST(c6 AS INTEGER)) AS REAL) / COUNT(c1)) * 100.0, 
        2
    ) AS funnel_attrition_rate

FROM 
    gurugram_churn_data

-- 4. Grouping by Structured Commercial Tiers for Strategic Reporting
GROUP BY 
    1

-- 5. Prioritizing Outputs by Revenue Leakage Severity to Identify Strategic Interventions
ORDER BY 
    funnel_attrition_rate DESC;
