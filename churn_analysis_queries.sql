-- =================================================================================
-- PROJECT: Quick Commerce Customer Attrition & Pricing Elasticity Analysis
-- REGION / MARKET: Gurugram Clusters (High-Density Transaction Data)
-- DATA SOURCE: gurugram_churn_data (User Transactional Telemetry Logs)
-- PURPOSE: Segmenting checkout metrics by dynamic surge tiers to isolate churn cliffs.
-- AUTHOR: Ajeet Yadav
-- DATE: May 2026
-- =================================================================================

SELECT 
    -- 1. Price Elasticity Segmentation (Converting Text Metrics into Real Numeric Boundaries)
    CASE 
        WHEN CAST(c4 AS REAL) <= 30.0 THEN '0-30 INR (Low Baseline Surge)'
        WHEN CAST(c4 AS REAL) > 30.0 AND CAST(c4 AS REAL) <= 70.0 THEN '31-70 INR (Volatile Medium Surge)'
        ELSE 'Above 70 INR (Critical Peak Surge)'
    END AS surge_tier,
    
    -- 2. Session Funnel Volumetric Tracking
    COUNT(c1) AS total_checkout_attempts,
    SUM(CAST(c6 AS INTEGER)) AS total_dropped_users,
    
    -- 3. Precision Analytical Churn Rate Formula
    ROUND(
        (CAST(SUM(CAST(c6 AS INTEGER)) AS REAL) / COUNT(c1)) * 100.0, 
        2
    ) AS analytical_churn_rate

FROM 
    gurugram_churn_data

-- 4. Grouping by the Programmatic Case Output
GROUP BY 
    1

-- 5. Sorting by Highest Leakage Severity to Focus on the Critical Business Drop-Offs
ORDER BY 
    analytical_churn_rate DESC;
