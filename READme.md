# Healthcare Employee Attrition & Retention Analysis
## 📌 Project Overview
![Dashboard](/Images/Employee%20Attrition%20Gif.gif)
High employee turnover presents critical operational, financial, and clinical challenges to healthcare organizations. This project delivers an end-to-end data analytics solution designed to evaluate workforce attrition patterns, quantify financial exposure, and uncover the primary drivers of staff departures across key hospital departments (Cardiology, Maternity, and Neurology).
By analyzing demographic, operational, compensation, and psychometric metrics across 1,676 active and former staff members, this interactive dashboard equips HR leaders and executive decision-makers with data-driven insights to curb turnover and optimize workforce stability.

### Project File Link
 * Project File: Download Dashboard [here](/Poject_file/SQL_EXCEL_Project.xlsx)

## Key Metrics Overview
- Total Workforce: 1,676 employees
- Overall Attrition Rate: 12.00% (Target: <10.00%)
- Estimated Financial Loss: $7,995,942

## 🗂️ Data Structure & Architecture

The analysis follows an end-to-end Data Engineering and Analytics workflow:

```
[Raw CSV Dataset] 
       │
       ▼
[PostgreSQL Staging Environment] (Datatype standardization)
       │
       ▼
[Star Schema Data Model] (Fact & Dimension Tables with PK/FK Integrity)
       │
       ▼
[Optimized SQL View] (Bucketed numerical attributes & flattened structure)
       │
       ▼
[Excel Power Query Connection] (Data transformation & Data Model loading)
       │
       ▼
[Interactive Excel Dashboard] (DAX/Pivot Analysis & Visuals)
```
- Extraction & Staging: Downloaded healthcare HR data from Kaggle and imported it into a local PostgreSQL database using a staging table with standard TEXT datatypes.
- Data Modeling (ETL): Created a star schema consisting of a Fact Table and an Employees Dimension Table (dim_employees). Defined primary/foreign key relationships and removed redundant columns to maintain normalization principles.
- Feature Engineering & SQL Views: Constructed an analytical SQL VIEW featuring custom data buckets (e.g., Distance From Home, Years Since Last Promotion, and Years in Current Role) to streamline analysis.
- Data Import & Power Query Transformation: Connected PostgreSQL directly to Microsoft Excel via Power Query. Cleaned column headers, mapped boolean flags (Attrition, OverTime) into actionable descriptive dimensions, and loaded the dataset into the Excel Data Model.
- Visualization & Dashboarding: Designed a dynamic, interactive executive dashboard equipped with job role, gender, and marital status slicers.



## 📊 Key Analytical Insights
### Departmental & Role Vulnerability

Cardiology experienced the highest employee attrition (~14%), closely followed by Maternity (~12.5%) and Neurology (~8%).
High-stress healthcare environments are disproportionately contributing to staff turnover.

### Overtime & Work-Life Balance

69.85% of employees who left the organization worked Overtime, compared to only 30.15% of non-overtime staff leaving.
Employees working regular hours maintained a high retention rate of 77.18%, proving overtime fatigue is a primary operational catalyst for turnover.

### Commute Distance Impact

Commute distance correlates directly with attrition rates:
Near (<5 miles): ~9% Attrition
Moderate (5–15 miles): ~11% Attrition
Far (16+ miles): ~18% Attrition


### Role Tenure & Career Progression

Onboarding Staff (<1 Year in current role) experience the sharpest attrition peak (~27%).
Attrition decreases significantly as tenure stabilizes: Proficient (1–2 Years) sits at ~15%, while Experts (5+ Years) exhibit the lowest attrition (~5%).

### Work-Life Balance vs. Job Satisfaction
100 out of 199 departed staff (50.3%) rated their Work-Life Balance at Level 3 (High).
Within this Level 3 Work-Life Balance cluster, 47 employees reported high to very high Job Satisfaction (31 staff at Level 3, 16 staff at Level 4).
Therefore, employees are not resigning primarily due to dissatisfaction with their roles or responsibilities; rather, high job engagement combined with subtle, unaddressed operational burnout leads highly satisfied staff to exit unexpectedly.


### Compensation vs. Experience

Across all tenure brackets (Recent, Mid-Tenure, Long-Tenure), departed employees consistently had lower average monthly incomes compared to their retained peers, pointing to potential compensation disparities among staff with similar experience.

## Strategic Recommendations for HR

- Overtime Relief & Shift Optimization: Implement shift-capped rotations and recruit per-diem/locum tenens staff for high-volume departments (Cardiology and Maternity) to mitigate burnout.

- Targeted Onboarding Retention Program: Establish structured 30-60-90 day mentorship programs and check-ins for newly hired or newly promoted staff (<1 year in current role) to reduce the initial 27% attrition spike.

- Flexible & Remote Work Options: Introduce hybrid scheduling, flexible shift starts, or transit stipends for employees commuting over 15 miles.

- Competitive Compensation Benchmarking: Perform market-rate salary adjustments for mid-level staff to ensure competitive compensation parity between retained and at-risk talent.

## 🏁 Conclusion
By addressing mandatory overtime, salary compression, and first-year onboarding vulnerability, the organization can reduce its 12.0% attrition rate to meet the <10.0% target. Reducing turnover by just 3 percentage points would preserve valuable clinical talent, maintain operational continuity, and save the hospital over $1.5 million annually in turnover-related losses.

## Technical Stack & Tools

- Database Management: PostgreSQL (Data Staging, Modeling, Views)
- ETL & Transformation: SQL, Excel Power Query
- Data Visualization & Analytics: Microsoft Excel (Pivot Tables, Data Model, Dynamic Slicers, Dashboarding)
- IDE: Visual Studio Code






