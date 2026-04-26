CREATE TABLE hospitals(
Hospital_Name VARCHAR(100),
Location VARCHAR(50),
Department VARCHAR(50),
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM hospitals;

COPY hospitals(hospital_name, location, department, doctors_count, patients_count, admission_date, discharge_date, medical_expenses)
FROM 'D:\Data Analyst BootCamp\SQL\Assignments\Hospital_Data.csv'
DELIMITER ','
CSV HEADER;

-- 1. Total Number of Patients 
-- o Write an SQL query to find the total number of patients across all hospitals. 
	
	SELECT SUM(patients_count) AS total_patients FROM hospitals;

-- 2. Average Number of Doctors per Hospital 
-- o Retrieve the average count of doctors available in each hospital.

	SELECT hospital_name, AVG(doctors_count) AS avg_doctor_count 
	FROM hospitals
	GROUP BY hospital_name;

-- 3. Top 3 Departments with the Highest Number of Patients 
-- o Find the top 3 hospital departments that have the highest number of patients. 

	SELECT department, SUM(patients_count) AS total_patients FROM hospitals 
	GROUP BY department
	ORDER BY total_patients DESC
	LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses 
-- o Identify the hospital that recorded the highest medical expenses. 

	SELECT Hospital_Name, medical_expenses FROM hospitals 
	ORDER BY medical_expenses DESC
	LIMIT 1;

-- 5. Daily Average Medical Expenses 
-- o Calculate the average medical expenses per day for each hospital.

	SELECT hospital_name, AVG(medical_expenses) AS avg_expenses
	FROM hospitals
	GROUP BY hospital_name;

-- 6. Longest Hospital Stay 
-- o Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

	SELECT hospital_name, admission_date, discharge_date, 
	(discharge_date - admission_date) AS stays_day_count
	FROM hospitals
	ORDER BY stays_day_count DESC
	LIMIT 1;
 
-- 7. Total Patients Treated Per City 
-- o Count the total number of patients treated in each city.

	SELECT location, SUM(patients_count) AS total_patients
	FROM hospitals
	GROUP BY location;

-- 8. Average Length of Stay Per Department 
-- o Calculate the average number of days patients spend in each department. 

	SELECT department, AVG(discharge_date - admission_date) AS avg_stay
	FROM hospitals
	GROUP BY department;

-- 9. Identify the Department with the Lowest Number of Patients 
-- o Find the department with the least number of patients.

	SELECT department, SUM(patients_count) AS total_patients 
	FROM hospitals
	GROUP BY department
	ORDER BY total_patients ASC
	LIMIT 1;

-- 10. Monthly Medical Expenses Report 
-- • Group the data by month and calculate the total medical expenses for each month. 

	SELECT TO_CHAR(discharge_date, 'Month') AS month_name, SUM(medical_expenses) AS total_expenses
	FROM hospitals 
	GROUP BY month_name;