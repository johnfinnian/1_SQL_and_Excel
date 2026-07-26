
CREATE VIEW vw_fact_employee_attrition AS
SELECT 
    -- Key
    e.employee_id,
    
    -- Dimensions (pulled from dim_employees)
    e.department,
    e.job_role,
    e.job_level,
    e.gender,
    e.marital_status,
    e.education,
    e.education_field,
    e.age,
    e.business_travel,
    
    -- Facts & Metrics (pulled from fact_performance_attrition)
      -- Years at Company Bucket
    CASE 
        WHEN f.years_at_company <= 1 THEN 'New Hires(0-1 Year)'
        WHEN f.years_at_company BETWEEN 1 AND 3 THEN 'Retained(1-3 Years)'
        WHEN f.years_at_company BETWEEN 4 AND 7 THEN 'Established(4-7 Years)'
        ELSE 'Veterans(8+ Years'
    END AS years_at_company,
    
    -- Years in Current Role Bucket
    CASE 
        WHEN  f.years_in_current_role < 1 THEN 'Onboarding(< 1 Year)'
        WHEN  f.years_in_current_role BETWEEN 1 AND 2 THEN 'Proficient(1-2 Years)'
        WHEN  f.years_in_current_role BETWEEN 3 AND 5 THEN 'Growth Ready(3-5 Years)'
        ELSE 'Experts(5+ Years)'
    END AS  years_in_current_role,
    
    -- Distance Bucket
    CASE 
        WHEN e.dist_from_home < 5 THEN 'Near (<5 mi)'
        WHEN e.dist_from_home BETWEEN 5 AND 15 THEN 'Moderate (5-15 mi)'
        ELSE 'Far (16+ mi)'
    END AS dist_from_home,

    CASE 
    WHEN  f.years_since_last_promotion <= 1 THEN 'Recent(0-1 Year)'
    WHEN  f.years_since_last_promotion BETWEEN 2 AND 4 THEN 'Mid-tenure(2-4 Years)'
    ELSE 'Long-tenure(5+ Years)'
END AS  years_since_last_promotion,
    f.attrition,
    f.monthly_income,
    f.percent_salary_hike,
    f.over_time,
    f.total_working_years,
    f.years_with_curr_manager,
    f.num_companies_worked,
    f.training_times_last_year,
    f.env_satisfaction,
    f.job_satisfaction,
    f.relationship_satisfaction,
    f.work_life_balance,
    f.job_involvement,
    f.performance_rating

FROM fact_performance_attrition f
JOIN dim_employees e ON f.employee_id = e.employee_id;







