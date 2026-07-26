CREATE DATABASE project_health

CREATE TABLE performance_staging
(EmployeeID TEXT,Age TEXT,Attrition TEXT,BusinessTravel TEXT,DailyRate TEXT,
Department TEXT,DistanceFromHome TEXT,Education TEXT,EducationField TEXT,EmployeeCount TEXT,
EnvironmentSatisfaction TEXT,Gender TEXT,HourlyRate TEXT,JobInvolvement TEXT,JobLevel TEXT,
JobRole TEXT,JobSatisfaction TEXT,MaritalStatus TEXT,MonthlyIncome TEXT,MonthlyRate TEXT,
NumCompaniesWorked TEXT,Over18 TEXT,OverTime TEXT,PercentSalaryHike TEXT,
PerformanceRating TEXT,RelationshipSatisfaction TEXT,StandardHours TEXT,Shift TEXT,
TotalWorkingYears TEXT,TrainingTimesLastYear TEXT,WorkLifeBalance TEXT,YearsAtCompany TEXT,
YearsInCurrentRole TEXT,YearsSinceLastPromotion TEXT,YearsWithCurrManager TEXT
)

\copy performance_staging FROM 'C:\Users\chimc\Documents\Personal_Projects\1_SQL_and_Excel\watson_healthcare_modified.csv'WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')

CREATE TABLE fact_performance_attrition
(employee_id BIGINT PRIMARY KEY,
age INT,
attrition BOOLEAN,
business_travel VARCHAR(50),
daily_rate NUMERIC,
department VARCHAR(50),
dist_from_home INT,
education INT,
education_field VARCHAR(50),
employee_count INT,
env_satisfaction INT,gender VARCHAR(20),hourly_rate FLOAT,job_involvement INT,job_level INT,
job_role VARCHAR(20),job_satisfaction INT,marital_status VARCHAR(50),monthly_income FLOAT,monthly_rate FLOAT,
num_companies_worked INT, over_18 BOOLEAN,over_time BOOLEAN,percent_salary_hike INT,
performance_rating INT,relationship_satisfaction INT,standard_hours INT,shift INT,
total_working_years INT,training_times_last_year INT,work_life_balance INT,years_at_company INT,
years_in_current_role INT,years_since_last_promotion INT,years_with_curr_manager INT
);

INSERT INTO fact_performance_attrition(
employee_id,
age,
attrition,
business_travel,
daily_rate,
department,
dist_from_home,
education,
education_field,
employee_count,
env_satisfaction,gender,hourly_rate ,job_involvement,job_level,
job_role,job_satisfaction,marital_status,monthly_income ,monthly_rate ,
num_companies_worked, over_18,over_time,percent_salary_hike,
performance_rating,relationship_satisfaction,standard_hours,shift,
total_working_years,training_times_last_year,work_life_balance,years_at_company,
years_in_current_role,years_since_last_promotion,years_with_curr_manager)

SELECT DISTINCT ON (EmployeeID)
EmployeeID::BIGINT,
Age:: INT, Attrition::BOOLEAN, BusinessTravel, DailyRate::FLOAT, 
Department, DistanceFromHome::INT, Education::INT, EducationField, EmployeeCount::INT, 
EnvironmentSatisfaction::INT, Gender, HourlyRate::INT, JobInvolvement::INT, JobLevel::INT, 
JobRole, JobSatisfaction::INT, MaritalStatus, MonthlyIncome::FLOAT, MonthlyRate::FLOAT, 
NumCompaniesWorked::INT, Over18::BOOLEAN, OverTime::BOOLEAN, PercentSalaryHike::INT, 
PerformanceRating::INT, RelationshipSatisfaction::INT, StandardHours::INT, Shift::INT, 
TotalWorkingYears::INT, TrainingTimesLastYear::INT, WorkLifeBalance::INT, YearsAtCompany::INT, 
YearsInCurrentRole::INT, YearsSinceLastPromotion::INT, YearsWithCurrManager::INT
FROM performance_staging
ORDER BY EmployeeID;


CREATE TABLE dim_employees AS
SELECT DISTINCT ON (employee_id) 
employee_id, 
age, 
gender, 
marital_status,
over_18,
department,
job_role, 
job_level,
shift,
business_travel,
dist_from_home,
education,
education_field
FROM fact_performance_attrition
ORDER BY employee_id, years_at_company DESC;

ALTER TABLE dim_employees
ADD CONSTRAINT pk_dim_employees PRIMARY KEY (employee_id);

ALTER TABLE fact_performance_attrition
DROP CONSTRAINT fact_performance_attrition_pkey;

ALTER TABLE fact_performance_attrition
ADD CONSTRAINT fk_fact_dim_employees 
FOREIGN KEY (employee_id)
REFERENCES dim_employees (employee_id);






