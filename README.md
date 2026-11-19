# data-analysis-bank-R

## Collaborators: Jerley Garcia, Jennie Le, Marko Sanchez

## Dataset: https://www.kaggle.com/datasets/kumarsakshat22/standard-bank-forage

## Description:
→ This data is from a bank that provides information of 614 loans that were taken out. The information provided includes the loan amount, the gender of who took out the loan, their marital status, if and/or any dependents, employment status, income(self and/or co-applicant), loan term, and their education level. 

## Columns/Features: (12 columns and 614 rows)
- Loan_ID: unique ID number for each row
- Married: marital status (Binary – Yes/No)
- Dependents: number of dependents (Integer)
- Education: (Binary - graduate/not graduate)
- Self_Employed: (Binary - Yes/No)
- Applicant Income: $ (Continuous)
- CoApplicant Income: $ (Continuous)
- Loan Amount: $ (Continuous - in thousands)
- Loan Amount Term: repayment period of loan (Integer - months)
- Credit History: (Binary - 1 for Credit History, 0 for None)
- Property Area: Zoning for home property (Categorical - Rural/Urban/Semiurban)

## Statistical Analysis and Descriptive Statistics:
### Descriptive Statistics
Measures of mean, median, and variance of continuous variables (income, loan amount) for total dataset and categorical variables (grouped by marital status, etc.)
Create different graphs to explore relationships and data:
Boxplots/Bar graph: loan amount based on gender, loan term based on education status
Histograms: Distribution of continuous variables
Scatter plot: Loan amount vs. Applicant income
Use qq-plots to test normality of continuous variables (loan amount, income) for assumptions of hypothesis test
### Statistical Analysis
Logistic Regression classifying loans into n categories (education, marital status, credit history, etc.) (Advanced Statistical Analysis)
Hypothesis testing using n-tailed tests, p-value, and x^2 test
Proportions and percentages comparing variables against one another (property area, loan amount, marital status, etc.)
Testing if the difference in repayment between genders (male and female) is zero.
Establish conclusions from our analyses and tests that accurately reflect what is presented in the data.

