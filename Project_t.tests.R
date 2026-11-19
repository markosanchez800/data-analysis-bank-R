# Going to do a t.test to test the means
#this is a t.test of if the H0:mu=146 vs. Ha: mu > 146
train$LoanAmount
Loanvals <- train$LoanAmount[is.na(train$LoanAmount)==FALSE]
Loanvals
mean(Loanvals)
t.test(Loanvals, alternative= "greater", mu= 146)
# p-value is 0.4534 so we fail to reject the null hypothesis because the p-value is too high compared to alpha=0.05.

# Going to do a 2 sample t.test testing the means of two groups for significance or if it's due to 
#random chance.
# we are going to test if the avg applicant income and co-applicant income are significant
# Assuming the two groups are independent: H0:mu=0 vs. Ha: mu !=0
app <- train$ApplicantIncome
coapp <- train$CoapplicantIncome
t.test(app, coapp, alternative = "two.sided")
#p-value is really small so we can reject the null hypothesis which was mu=0.
# This means the true difference in means is not equal to 0 and that there is a difference in the avg
# income between the applicant an coapplicant

# We can also test whether the difference in loan amount between men and women is zero
# we are testing H0: mu=0 vs. Ha: mu != 0
t.test(train$LoanAmount[train$Gender=="Female"],
       train$LoanAmount[train$Gender=="Male"], alternative="two.sided")
# p-value is 0.008701 which is less than 0.05 so we reject the null hyp that mu=0. 
# thus we can conclude that there is a difference in loan amount between men and women
