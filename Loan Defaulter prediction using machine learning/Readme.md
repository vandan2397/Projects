				Problem Statement

Project Title	Loan Defaulters Prediction using Machine Learning 
Project Team	•	Lipi Shah ()
•	Anirudh Palleri ()
•	Vandan Pandya (2100996)
Problem Statement	There are many Banks and Financial institutions, which provide loan to urban customers. To grant the loan amount, bank has to thoroughly review customer’s application considering different attributes of applicant. This process is known as Credit risk analysis. It is very critical for every bank and financial institution as it helps them to manage financial risk. Mainly, there are two types of risks associated with bank’s decision:
•	Not approving loan application of a person likely to pay the amount, leads to Business loss for Bank.
•	Approving loan application of a person not likely to pay the amount, leads to financial loss to the Bank.
Now, analysis of application of each customer can be difficult as well as time consuming. So, to mitigate the risks and to solve problems, data of past applicants can be used. Here, the main aim is to identify the patterns in data by leveraging exploratory data analysis and Machine learning. It is very helpful for making various actions such as accepting loan application, to reduce amount to be disbursed, to increase or decrease interest rate, duration of loan, etc.
Generally, there are two types of decisions made by bank or financial institution.
•	Loan application accepted: If application is approved, there can be three scenarios:
o	Fully paid: Applicant has fully paid the loan.
o	Current: Applicant is currently paying the installments of loan. They are not considered defaulters.
o	Charged-Off: Applicant has not paid the installments in due time. They are considered defaulters.
•	Loan rejected: It is rejected, as they don’t have sufficient data or not matching requirements.
In the given problem, we will be using applicants who fully paid the amount and ones who were charged off i.e., defaulters.
Challenges	•	To acquire financial data can be a tough task. However, nowadays a lot of open-source platforms provide such data.
•	Identification of relevant and strong indicators of defaulters.
•	Understanding of domain knowledge is at most important to solve the problem. So, research of credit analytics needs to be done.
•	One of the challenges will be to deal with imbalanced data set, as there will be less proportion of defaulters and high proportion of non -defaulters.
•	To identify pertinent measures to evaluate performance of machine learning models for imbalanced data set. 
Data Description	Data set used in the project is of Lending club and downloaded from Kaggle website. Lending club is the largest online loan marketplace, which facilitates business loan, personal loan, auto loan and finances for medical purposes. It is headquartered in San Francisco, California and was the first peer-to-peer lender to register its offerings as securities with the Securities and Exchange Commission (SEC), and to offer loan trading on a secondary market. (LendingClub | Online Personal Loans at Great Rates) and Lending Club Dataset | Kaggle. 

Information 27 different attributes of applicants:

Attributes	Description
loan_amount	The amount of loan applied by the borrower.
term	Duration of loan
int_rate	Interest rate on loan
installment	The monthly payment owed by the borrower.
grade	Grade assigned by lending club
sub_grade	Sub Grade assigned by lending club
emp_title	Job title of an applicant
emp_length	Employment period in years
home_ownership	Homeownership status. Values (rent, own, mortgage, other)
annual_inc	Annual income of borrower
Verification_status	Income status verified by Lending club or not.
issue_d	Month and year in which loan amount was disbursed.
purpose	Purpose of loan
zip_code	Zip code
addr_state	State of Borrower
dti	A ratio calculated using the borrower’s total monthly debt payments on the total debt obligations, excluding mortgage and the requested LC loan, divided by the borrower’s self-reported monthly income.
earliest_cr_line	The month the borrower's earliest reported credit line was opened
open_acc	The number of open credit lines in the borrower's credit file.
pub_rec	Number of derogatory public records
revol_bal	Total credit revolving balance
revol_util	The amount of credit the borrower is using relative to all available revolving credit.
total_acc	The total number of credit lines currently in the borrower's credit file
initial_list_status	The initial listing status of the loan. Possible values are – W, F
application_type	Indicates whether the loan is an individual application or a joint application with two co-borrowers
mort_acc	Number of mortgage accounts.
pub_rec_bankruptcies	Number of public record bankruptcies
loan_status	Current status of the loan

Proposed solution and methods	Proposed solution to solve the problem involves exploratory data analysis to identify key predictors and machine learning models to automate the process of defaulter prediction.

•	Exploratory data analysis
o	Numerical summary and visualization plots (Box plot, scatter plot)
•	Data preparation
o	Synthetic data points in minority class
o	Class weights
•	Feature selection/dimensionality reduction
o	Statistical based feature selection (Anova, chi-squared, etc)
•	Classification modelling
o	Logistic Regression
o	SVM
o	Decision Tree
o	Naïve Bayes
o	Boosting techniques
o	Neural net
•	Model selection
o	Hyper parameter tuning
o	Cross Validation
•	Model evaluation
o	Precision, Recall, F1-Score, precision vs recall curve




