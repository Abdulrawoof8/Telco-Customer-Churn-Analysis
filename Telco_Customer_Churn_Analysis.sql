-- 1. Preview Dataset
select top 5 * from [WA_Fn-UseC_-Telco-Customer-Churn_extra]


-- 2. Contract Churn Analysis
SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY Contract
ORDER BY ChurnRatePercent DESC;


-- 3.Payment Method churn Analysis
SELECT
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY PaymentMethod
ORDER BY ChurnRatePercent DESC;

-- 4. Missing Values Analysis
SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END)
        AS MissingTotalCharges,
    SUM(CASE WHEN tenure = 0 THEN 1 ELSE 0 END)
        AS ZeroTenureCustomers,
    SUM(CASE
        WHEN TotalCharges IS NULL AND tenure = 0 THEN 1
        ELSE 0
    END) AS BothConditions
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra];


--5 Display Customers with Missing TotalCharges
SELECT
    customerID,
    tenure,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
WHERE TotalCharges IS NULL;


-- 6 Validate Missing TotalCharges Records
SELECT
    COUNT(*) AS MissingTotalCharges,
    SUM(CASE WHEN tenure = 0 THEN 1 ELSE 0 END) AS ZeroTenure,
    SUM(CASE WHEN MonthlyCharges > 0 THEN 1 ELSE 0 END) AS PositiveMonthlyCharges
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
WHERE TotalCharges IS NULL;


-- 7. Internet Service Churn Analysis
SELECT
    InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY InternetService
ORDER BY ChurnRatePercent DESC;


-- 8. Online Security Churn Analysis
SELECT
    OnlineSecurity,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY OnlineSecurity
ORDER BY ChurnRatePercent DESC;


-- 9. Tech Support Churn Analysis
SELECT
    TechSupport,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY TechSupport
ORDER BY ChurnRatePercent DESC;


-- 10. Online Backup Churn Analysis
SELECT
    OnlineBackup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY OnlineBackup
ORDER BY ChurnRatePercent DESC;


-- 11. Device Protection Churn Analysis
SELECT
    DeviceProtection,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY DeviceProtection
ORDER BY ChurnRatePercent DESC;


-- 12. Paperless Billing Churn Analysis
SELECT
    PaperlessBilling,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY PaperlessBilling
ORDER BY ChurnRatePercent DESC;



-- 13. Phone Service Churn Analysis
SELECT
    PhoneService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY PhoneService
ORDER BY ChurnRatePercent DESC;


--MultipleLines Churn Analysis
SELECT
    MultipleLines,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY MultipleLines
ORDER BY ChurnRatePercent DESC;


-- 14. Streaming TV Churn Analysis
SELECT
    StreamingTV,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY StreamingTV
ORDER BY ChurnRatePercent DESC;

-- 15. StreamingMovies  Churn Analysis
SELECT
    StreamingMovies,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY StreamingMovies
ORDER BY ChurnRatePercent DESC;



--Gender Churn Analysis
SELECT
    gender,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY gender
ORDER BY ChurnRatePercent DESC;




-- SeniorCitizen Churn Analysis
SELECT
    SeniorCitizen,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY SeniorCitizen
ORDER BY ChurnRatePercent DESC;


 -- Partner Churn Analysis
 SELECT
    Partner,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY Partner
ORDER BY ChurnRatePercent DESC;


 -- Dependents Churn Analysis
SELECT
    Dependents,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]
GROUP BY Dependents
ORDER BY ChurnRatePercent DESC;


SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS CustomersStayed,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS OverallChurnRate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra];



-- 18. Tenure Group Churn Analysis
SELECT
    CASE
        WHEN tenure <= 12 THEN 'New (0-12 months)'
        WHEN tenure <= 36 THEN 'Medium (13-36 months)'
        ELSE 'Long-term (37+ months)'
    END AS TenureGroup,

    COUNT(*) AS TotalCustomers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,

    CAST(
        100.0 * SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS ChurnRatePercent

FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn_extra]

GROUP BY
    CASE
        WHEN tenure <= 12 THEN 'New (0-12 months)'
        WHEN tenure <= 36 THEN 'Medium (13-36 months)'
        ELSE 'Long-term (37+ months)'
    END

ORDER BY ChurnRatePercent DESC;