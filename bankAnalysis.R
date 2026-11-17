# functions



# main
testDf <- read.csv('test.csv')
trainDf <- read.csv('train.csv')

print('Measures of mean, median, and variance of continuous variables:')
print(paste('Applicant Income Mean: $', round(mean(testDf$ApplicantIncome),2)))
print(paste('Applicant Income Median: $', median(testDf$ApplicantIncome)))
print(paste('Applicant Income SD: $', round(sqrt(var(testDf$ApplicantIncome)),2)))

print(paste('Loan Amount Mean: $', round(mean(testDf$LoanAmount, na.rm = TRUE),2)))
print(paste('Loan Amount Median: $', median(testDf$LoanAmount, na.rm = TRUE)))
print(paste('Loan Amount SD: $', round(sqrt(var(testDf$LoanAmount, na.rm = TRUE)),2)))

print(paste('Coapplicant Income Mean: $', round(mean(testDf$CoapplicantIncome, na.rm = TRUE),2)))
print(paste('Coapplicant Income Median: $', median(testDf$CoapplicantIncome, na.rm = TRUE)))
print(paste('Coapplicant Income SD: $', round(sqrt(var(testDf$CoapplicantIncome, na.rm = TRUE)),2)))

print('Boxplots/Bar graph: loan amount based on gender, loan term based on education status:')
