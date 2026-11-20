# functions

#Loading the dataset
#testDf <- read.csv('test.csv', na.strings = c('','NA'))
trainDf <- read.csv('train.csv', na.strings = c('','NA')) #Use trainDf
nrow(trainDf) #614 rows
orig_test = trainDf #make a copy of train

#Cleaning/Checking continuous variables
#testing continuous/integer numerical cols to see if it's zero or less
which(trainDf$LoanAmount<=0)
which(trainDf$Loan_Amount_Term <= 0) 
which(trainDf$ApplicantIncome <= 0) 

#co-applicant income has many values of zero
index = which(trainDf$CoapplicantIncome <= 0)
length(index) #273 have 0 income
trainDf$CoapplicantIncome[index]

#since many values are zero, it causes some nonzero values to become outliers
boxplot.stats(trainDf$CoapplicantIncome)$out
boxplot(trainDf$CoapplicantIncome, #boxplot showing coapplicant income
        main = "Coapplicant income",
        ylab = "($)")

#Descriptive Stats of Continuous Variables (min,max,median,mean,sd)
print('Measures of mean, median, max, min, and variance of continuous variables:')
print(paste('Applicant Income Mean: $', round(mean(trainDf$ApplicantIncome),2)))
print(paste('Applicant Income Median: $', median(trainDf$ApplicantIncome)))
print(paste('Applicant Income SD: $', round(sqrt(var(trainDf$ApplicantIncome)),2)))
print(paste('Applicant Income Max: $', max(trainDf$ApplicantIncome,na.rm=TRUE)))
print(paste('Applicant Income Min: $', min(trainDf$ApplicantIncome,na.rm=TRUE)))

print(paste('Loan Amount Mean: $', round(mean(trainDf$LoanAmount, na.rm = TRUE),2)))
print(paste('Loan Amount Median: $', median(trainDf$LoanAmount, na.rm = TRUE)))
print(paste('Loan Amount SD: $', round(sqrt(var(trainDf$LoanAmount, na.rm = TRUE)),2)))
print(paste('Loan Amount Max: $', max(trainDf$LoanAmount, na.rm=TRUE)))
print(paste('Loan Amount Min: $', min(trainDf$LoanAmount, na.rm=TRUE)))

print(paste('Coapplicant Income Mean: $', round(mean(trainDf$CoapplicantIncome, na.rm = TRUE),2)))
print(paste('Coapplicant Income Median: $', median(trainDf$CoapplicantIncome, na.rm = TRUE)))
print(paste('Coapplicant Income SD: $', round(sqrt(var(trainDf$CoapplicantIncome, na.rm = TRUE)),2)))
print(paste('Coapplicant Income Max: $', max(trainDf$CoapplicantIncome, na.rm=TRUE)))
print(paste('Coapplicant Income Min: $', min(trainDf$CoapplicantIncome, na.rm=TRUE)))

#Boxplots of loan amounts based on some categorical variables
par(mfrow=c(2,2))
boxplot(trainDf$LoanAmount ~ trainDf$Gender, 
        data = trainDf, main = 'Loan Amount by Gender', 
        xlab = 'Gender', ylab = 'Loan Amount ($)')
boxplot(trainDf$LoanAmount ~ trainDf$Education, 
        data = trainDf, main = 'Loan Amount by Education Level', 
        xlab = 'Gender', ylab = 'Loan Amount ($)')
boxplot(trainDf$LoanAmount ~ trainDf$Dependents, 
        data = trainDf, main = 'Loan Amount by Dependents', 
        xlab = 'Gender', ylab = 'Loan Amount ($)')
boxplot(trainDf$LoanAmount ~ trainDf$Property_Area, 
        data = trainDf, main = 'Loan Amount by Property Area', 
        xlab = 'Gender', ylab = 'Loan Amount ($)')

#Other categorical plots
library(ggplot2)

boxplot(trainDf$Loan_Amount_Term ~ trainDf$Education, 
        data = trainDf, main = 'Loan Term by Education Level', 
        xlab = 'Education Level', ylab = 'Loan Term (Days)')
ggplot(trainDf, aes(x=Gender,fill=Loan_Status))+
  geom_bar()+
  labs(title='Loan status of Gender')

#Scatterplots 
ggplot(trainDf, aes(x=ApplicantIncome,y=CoapplicantIncome,color=Gender))+
  geom_point()+
  labs(title='Applicant Income vs Coapplicant Income')

ggplot(trainDf, aes(x=LoanAmount,y=Loan_Amount_Term))+
  geom_point()+
  labs(title='Loan Amount vs Loan Amount Term')

ggplot(trainDf, aes(x=ApplicantIncome,y=LoanAmount,color=Loan_Status))+
  geom_point()+
  labs(title='Applicant Income vs Loan Amount')

#QQplots, hypothesis testing, etc.

#X^2 Testing
tb1 <- table(trainDf$Gender, trainDf$Education)
result1 <- chisq.test(tb1)
result1
result1$observed
result1$expected
result1$stdres

tb2 <- table(trainDf$Property_Area, trainDf$Loan_Status)
result2 <- chisq.test(tb2)
result2
result2$observed
result2$expected
result2$stdres

tb3 <- table(trainDf$Married, trainDf$Loan_Status)
result3 <- chisq.test(tb3)
result3
result3$observed
result3$expected
result3$stdres

#For advanced we can do ANOVA (property type?)
#or Logistical Regression(to predict loan status Y/N)
factoredGender <- factor(trainDf$Gender)
factoredPropertyArea <- factor(trainDf$Property_Area)
factoredEduation <- factor(trainDf$Education)

threeWayANOVA <- aov(trainDf$LoanAmount ~ factoredGender * factoredPropertyArea * factoredEduation, data = trainDf)
summary(threeWayANOVA)
