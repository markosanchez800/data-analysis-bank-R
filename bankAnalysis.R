# functions



# main
testDf <- read.csv('test.csv', na.strings = c('','NA'))
trainDf <- read.csv('train.csv', na.strings = c('','NA'))

print('Measures of mean, median, and variance of continuous variables:')
print(paste('Applicant Income Mean: $', round(mean(trainDf$ApplicantIncome),2)))
print(paste('Applicant Income Median: $', median(trainDf$ApplicantIncome)))
print(paste('Applicant Income SD: $', round(sqrt(var(trainDf$ApplicantIncome)),2)))

print(paste('Loan Amount Mean: $', round(mean(trainDf$LoanAmount, na.rm = TRUE),2)))
print(paste('Loan Amount Median: $', median(trainDf$LoanAmount, na.rm = TRUE)))
print(paste('Loan Amount SD: $', round(sqrt(var(trainDf$LoanAmount, na.rm = TRUE)),2)))

print(paste('Coapplicant Income Mean: $', round(mean(trainDf$CoapplicantIncome, na.rm = TRUE),2)))
print(paste('Coapplicant Income Median: $', median(trainDf$CoapplicantIncome, na.rm = TRUE)))
print(paste('Coapplicant Income SD: $', round(sqrt(var(trainDf$CoapplicantIncome, na.rm = TRUE)),2)))

print('Boxplots/Bar graph: loan amount based on gender, loan term based on education status:')
boxplot(trainDf$LoanAmount ~ trainDf$Gender, data = trainDf, main = 'Loan Amount by Gender', xlab = 'Gender', ylab = 'Loan Amount ($)')
boxplot(trainDf$Loan_Amount_Term ~ trainDf$Education, data = trainDf, main = 'Loan Term by Education Level', xlab = 'Education Level', ylab = 'Loan Term (Days)')

