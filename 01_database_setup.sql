-- Create the Patients Dimension Table
CREATE TABLE Patients (
    Patient_ID VARCHAR(50) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Primary_Diagnosis VARCHAR(100),
    Date_Onboarded DATE
);

-- Create the Vitals Logs Fact Table
CREATE TABLE Vitals_Logs (
    Log_ID VARCHAR(50) PRIMARY KEY,
    Patient_ID VARCHAR(50),
    Log_Date DATE,
    Systolic_BP INT,
    Diastolic_BP INT,
    Oxygen_Sat_Pct INT,
    Med_Adherence VARCHAR(5),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Populate Mock Data for Patients
INSERT INTO Patients (Patient_ID, Age, Gender, Primary_Diagnosis, Date_Onboarded) VALUES
('P-001', 68, 'M', 'Chronic Heart Failure', '2026-01-10'),
('P-002', 74, 'F', 'Hypertension', '2026-01-12'),
('P-003', 61, 'M', 'COPD', '2026-01-15'),
('P-004', 82, 'F', 'Chronic Heart Failure', '2026-01-20'),
('P-005', 55, 'M', 'Hypertension', '2026-01-22');

-- Populate Mock Data for Vitals Logs
INSERT INTO Vitals_Logs (Log_ID, Patient_ID, Log_Date, Systolic_BP, Diastolic_BP, Oxygen_Sat_Pct, Med_Adherence) VALUES
('L-1001', 'P-001', '2026-03-01', 135, 85, 96, 'Yes'),
('L-1002', 'P-001', '2026-03-02', 145, 92, 95, 'No'), -- Critical: High BP + Non-adherence
('L-1003', 'P-002', '2026-03-01', 120, 80, 98, 'Yes'),
('L-1004', 'P-002', '2026-03-02', 122, 81, 97, 'Yes'),
('L-1005', 'P-003', '2026-03-01', 130, 85, 91, 'Yes'), -- Critical: Low O2 for COPD
('L-1006', 'P-003', '2026-03-02', 132, 84, 89, 'Yes'), -- Critical Trend: Dropping O2
('L-1007', 'P-004', '2026-03-01', 138, 88, 96, 'Yes'),
('L-1008', 'P-004', '2026-03-02', 151, 95, 94, 'No'); -- Critical: High BP + Non-adherence
