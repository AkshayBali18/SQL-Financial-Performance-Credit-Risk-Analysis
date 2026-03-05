/*******************************************************************************
-- PROJECT: Financial Performance & Credit Risk Analysis
-- DESCRIPTION: Consolidates Company Dimensions with Financial Facts 
--              Calculates key Performance/Risk KPIs
                - Net Profit Margin
                - Debt-to-Equity Ratio
                - Return on Equity (ROE)
                - Interest Coverage Ratio
                - EBIT Margin
--              Aggregate by Category( Year, Grade, and Rating)

*******************************************************************************/

-- This CTE joins the tables and calculates base KPIs for each company.
WITH basic_query AS (
    SELECT 
        f.company_key,
        c.credit_grade,
        c.credit_rating_code,
        f.fiscal_year,
        f.revenue,
        f.net_income,
        f.ebit,
        f.interest_expense,
        f.total_debt,
        f.total_equity,
        -- Profitability Ratio
        (f.net_income / NULLIF(f.revenue, 0)) * 100 AS net_margin,
        -- Solvency Ratio
        f.ebit / NULLIF(f.interest_expense, 0) AS interest_coverage,
        -- Leverage Ratio
        f.total_debt / NULLIF(f.total_equity, 0) AS debt_to_equity
    FROM gold.fact_financials f
    INNER JOIN gold.dim_company c ON f.company_key = c.company_key
)
/*---------------------------------------------------------------------------
2) Company Aggregations: Summarizes key performance at the company level
---------------------------------------------------------------------------*/
    SELECT 
        fiscal_year,
        credit_grade,
        credit_rating_code,
        COUNT(company_key) AS company_count,
        SUM(revenue) AS total_revenue,
        CAST (AVG(net_margin) AS DECIMAL(10,2)) AS avg_net_margin,
        CAST(AVG(interest_coverage) AS DECIMAL (10,2)) AS avg_interest_coverage,
        CAST(AVG(debt_to_equity)AS DECIMAL(10,2)) AS avg_debt_to_equity
    FROM basic_query
    GROUP BY 
        fiscal_year, 
        credit_grade, 
        credit_rating_code
    ORDER BY 
        fiscal_year DESC, 
        credit_grade, 
        credit_rating_code


