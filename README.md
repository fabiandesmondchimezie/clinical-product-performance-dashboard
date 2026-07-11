# Clinical Product Performance Dashboard

## Project Overview
This repository contains the backend database configuration and clinical risk intelligence logic for a **Remote Patient Monitoring (RPM)** data pipeline. The project bridges clinical safety parameters with product engagement metrics to identify high-risk patients and optimize care delivery compliance.

## Repository Contents
*   `01_database_setup.sql`: Generates the core database schema (`Patients` and `Vitals_Logs` tables) and populates them with simulated clinical tracking data.
*   `02_clinical_kpis.sql`: Implements advanced SQL analytical queries, featuring:
    *   **High-Risk Patient Alert System:** Targets specific biometric thresholds (e.g., Systolic BP $\ge$ 140 mmHg) mapped against medication non-adherence.
    *   **Cohort Adherence Optimization:** Aggregates compliant data logging behavior by medical diagnosis to guide clinical product adjustments.

## Technology Stack
*   **SQL (Structured Query Language):** Scheme architecture, conditional aggregations, relational logic.
*   **Data Architecture:** Relational dimension and fact modeling.
*   
