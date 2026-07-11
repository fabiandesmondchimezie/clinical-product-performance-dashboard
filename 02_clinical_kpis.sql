-- QUERY 1: High-Risk Alert System
-- Identifies patients with hypertensive crisis features who missed their medication.
SELECT 
    p.Patient_ID,
    p.Age,
    p.Primary_Diagnosis,
    v.Log_Date,
    v.Systolic_BP,
    v.Med_Adherence
FROM Patients p
JOIN Vitals_Logs v ON p.Patient_ID = v.Patient_ID
WHERE v.Systolic_BP >= 140 
  AND v.Med_Adherence = 'No'
ORDER BY v.Systolic_BP DESC;

-- QUERY 2: Cohort Adherence Optimization Metrics
-- Aggregates overall adherence rates by diagnosis to show product managers where engagement lags.
SELECT 
    p.Primary_Diagnosis,
    COUNT(v.Log_ID) AS Total_Logs,
    SUM(CASE WHEN v.Med_Adherence = 'Yes' THEN 1 ELSE 0 END) AS Compliant_Logs,
    ROUND(
        (SUM(CASE WHEN v.Med_Adherence = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(v.Log_ID), 
        2
    ) AS Adherence_Rate_Pct
FROM Patients p
JOIN Vitals_Logs v ON p.Patient_ID = v.Patient_ID
GROUP BY p.Primary_Diagnosis;
