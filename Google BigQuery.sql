SELECT *
 FROM `bright-tv-493010.Retail.retail_sales` LIMIT 1000

---Question1: WHERE Clause
---Filter all transactions that occurred in the year 2023.
---Expected Output: All columns
SELECT * 
FROM `bright-tv-493010.Retail.retail_sales` 
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31'; 

---Question 2: Filtering + Conditions
---Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
---Expected Output: All columns

SELECT *
FROM `bright-tv-493010.Retail.retail_sales` 
WHERE `Total Amount` > (SELECT AVG (`Total Amount`) 
FROM `bright-tv-493010.Retail.retail_sales`);

---Question 3: Aggregate Functions
--Calculate the total revenue (sum of Total Amount).
---Expected Output: Total_Revenue

SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `bright-tv-493010.Retail.retail_sales`;

---Question 4: DISTINCT
---Display all distinct Product Categories in the dataset.
---Expected Output: Product_Category

SELECT DISTINCT(`Product Category`)
FROM `bright-tv-493010.Retail.retail_sales`;

---Question 5 GROUP BY
---For each Product Category, calculate the total quantity sold.
---Expected Output: Product_Category, Total_Quantity

SELECT `Product Category`, SUM(Quantity) AS Total_Quantity
FROM `bright-tv-493010.Retail.retail_sales`
GROUP BY `Product Category`;

---Question 6: CASE Statement
---Create a column called Age_Group that classifies customers as:
– 'Youth' (<30)
– 'Adult' (30–59)
– 'Senior' (60+)
---Expected Output: Customer_ID, Age, Age_Group

SELECT 'Customer ID', Age,
CASE 
  WHEN Age <30 THEN 'Youth'
  WHEN Age BETWEEN 30 AND 59 THEN 'Adult' 
  ELSE 'Senior'
  END AS Age_Group
FROM `bright-tv-493010.Retail.retail_sales`;

---Question 7: Conditional Aggregation
---For each Gender, count how many high-value transactions occurred (where Total Amount > 500).
---Expected Output: Gender, High_Value_Transactions

SELECT Gender,COUNT('Transaction ID') AS High_Value_Transactions
FROM `bright-tv-493010.Retail.retail_sales`
WHERE `Total Amount` >500
GROUP BY Gender;

---Question 8 HAVING Clause
---For each Product Category, show only those categories where the total revenue exceeds 5,000.
---Expected Output: Product_Category, Total_Revenue
SELECT `Product Category`, SUM(`Total Amount`) AS Total_Revenue
FROM `bright-tv-493010.Retail.retail_sales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) >5000;

---Question 9: Calculated Fields
---Display a new column called Unit_Cost_Category that labels a transaction as:
--- 'Cheap' if Price per Unit < 50
---'Moderate' if Price per Unit between 50 and 200
--'Expensive' if Price per Unit > 200
---Expected Output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

SELECT `Transaction ID`, `Price per unit`,
CASE
  WHEN `Price per Unit`< 50 THEN 'Cheap'
   WHEN `Price per Unit`BETWEEN 50 AND 200 THEN 'Moderate'
   WHEN `Price per Unit`> 200 THEN 'Expensive' 
   END AS `Unit_Cost Category`
FROM `bright-tv-493010.Retail.retail_sales`;

---Question 10: Combining WHERE + CASE
---Display all transactions from customers aged 40 or older and add a column Spending_Level
---showing:
– 'High' if Total Amount > 1000
– 'Low' otherwise
---Expected Output: Customer_ID, Age, Total_Amount, Spending_Level

SELECT `Customer ID`, Age, `Total Amount`,
CASE
  WHEN `Total Amount` >1000 THEN 'High'
  ELSE 'Low'
  END AS Spending_Level
  FROM `bright-tv-493010.Retail.retail_sales`
  WHERE Age >=40;

