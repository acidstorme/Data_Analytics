show global variables like 'local_infile';
set global local_infile=true;

CREATE DATABASE TelecomCustomerChurn;
USE TelecomCustomerChurn;
CREATE TABLE telecomcustomerchurn1 (
customerID varchar(20) PRIMARY KEY,
gender varchar(10),
SeniorCitizen int,
Partner varchar(5),
Dependents varchar(5),
tenure int,
PhoneService varchar(5),
MultipleLines varchar(20),
InternetService varchar(20),
OnlineSecurity varchar(25)
);

LOAD DATA LOCAL INFILE 'D:/Python Jupyter/Projects/Machine Learning/Project 1/TelcomCustomer-Churn_1.csv'
INTO TABLE TelecomCustomerChurn1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE telecomcustomerchurn2 (
customerID varchar(20) PRIMARY KEY,
OnlineBackup varchar(25),
DeviceProtection varchar(25),
TechSupport varchar(25),
StreamingTV varchar(25),
StreamingMovies varchar(25),
Contract varchar(25),
PaperlessBilling varchar(5),
PaymentMethod varchar(30),
MonthlyCharges dec(6,2) NULL,
TotalCharges dec(6,2) DEFAULT NULL,
Churn varchar(5)
);

LOAD DATA LOCAL INFILE 'D:/Python Jupyter/Projects/Machine Learning/Project 1/TelcomCustomer-Churn_2.csv'
INTO TABLE telecomcustomerchurn2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;