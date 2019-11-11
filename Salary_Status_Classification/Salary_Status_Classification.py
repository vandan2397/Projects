# -*- coding: utf-8 -*-
"""
Created on Sun Sep 29 15:48:39 2019

@author: Vandan
"""

import pandas as pd
import numpy as np
import seaborn as sb

from sklearn.model_selection import train_test_split  #partition data
from sklearn.linear_model import LogisticRegression #logistic regression
from sklearn.metrics import  accuracy_score,confusion_matrix   #accuracy score and confusion matrix
from sklearn import metrics



###############################################################################
#Handled missing values
###############################################################################

#repalcing ? values to null values
data=pd.read_csv('income.csv',na_values=[' ?'])
print(data.isnull().sum())

# rows with missing values
missing = data[data.isnull().any(axis=1)]

#filling missing values
print(data['JobType'].value_counts())
print(data['occupation'].value_counts())
print(data['nativecountry'].value_counts())
print(data['race'].value_counts())


data['JobType']=data['JobType'].fillna(data['JobType'].mode()[0])
data['occupation']=data['occupation'].fillna(data['occupation'].mode()[0])


###############################################################################
#Splitting training/test data and dummifying categorical variables
###############################################################################

#re indexing the salary status to 0,1
data['SalStat']=data['SalStat'].map({' less than or equal to 50,000':0,' greater than 50,000':1})


#Anova test for selection of continous variable
import statsmodels.api as sm
from statsmodels.formula.api import ols
mod=ols('SalStat ~ hoursperweek',data=data).fit()
aov_table = sm.stats.anova_lm(mod,typ=2)
print(aov_table)

import statsmodels.api as sm
from statsmodels.formula.api import ols
mod=ols('SalStat ~ capitalgain',data=data).fit()
aov_table = sm.stats.anova_lm(mod,typ=2)
print(aov_table)

import statsmodels.api as sm
from statsmodels.formula.api import ols
mod=ols('SalStat ~ capitalloss',data=data).fit()
aov_table = sm.stats.anova_lm(mod,typ=2)
print(aov_table)


import statsmodels.api as sm
from statsmodels.formula.api import ols
mod=ols('SalStat ~ age',data=data).fit()
aov_table = sm.stats.anova_lm(mod,typ=2)
print(aov_table)



cols = ['gender','race']
new_data = data.drop(cols,axis=1)

#dummifying
#new_data=data
new_data=pd.get_dummies(new_data, drop_first=True)

#store column name
columns_list=list(new_data.columns)
print(columns_list)

#separating input variables from data
features = list(set(columns_list)-set(['SalStat']))
print(features)

#storing output values in y
y=new_data['SalStat'].values
print(y)

#storing output values 
x=new_data[features].values


#splitting data in training data and testing data
train_x,test_x,train_y,test_y=train_test_split(x,y,test_size=0.2,random_state=0)


###############################################################################
#logistic regression
###############################################################################


#make instance of model
logistic = LogisticRegression()

#fitting the value x and y
logistic.fit(train_x,train_y)
logistic.coef_
logistic.intercept_

#prediction from test data
prediction = logistic.predict(test_x)
print(prediction)

#confusion matrix
confusion_matrix =confusion_matrix(test_y,prediction)
print(confusion_matrix)

#calculating accuracy
accuracy_score_lr = accuracy_score(test_y, prediction) 
print(accuracy_score) 

#misclassified variables
print('misclassified samples %d '% (test_y != prediction).sum())

print(metrics.classification_report(test_y,prediction))

#86% accuracy



###############################################################################
#Random forest classifier
###############################################################################

# random forest model
from sklearn.ensemble import RandomForestClassifier
classifier_rf = RandomForestClassifier(n_estimators=200,criterion='entropy',random_state=0)
classifier_rf.fit(train_x,train_y)

#predicting
prediction_rf = classifier_rf.predict(test_x)

#confusion matrix
from sklearn.metrics import confusion_matrix
confusion_matrix_rf = confusion_matrix(test_y,prediction_rf)


#accuracy rate
accuracy_score_rf = accuracy_score(test_y,prediction_rf)
print(accuracy_score_rf)

print(metrics.classification_report(test_y,prediction_rf))



#applying gridsearch to find best model and best parameters
from sklearn.model_selection import GridSearchCV
parameters = [{'n_estimators':[100,200,300],'criterion':['entropy']},
              {'n_estimators':[100,200,300],'criterion':['gini'] }]
grid_search = GridSearchCV(estimator=classifier_rf, param_grid=parameters, scoring='accuracy', cv=10, n_jobs=-1)
grid_search = grid_search.fit(train_x,train_y)
best_accuracy = grid_search.best_score_
best_parameters = grid_search.best_params_


#85% accuracy



###############################################################################
#K Nearest Neighbors
###############################################################################


#importing KNN library
from sklearn.neighbors import KNeighborsClassifier 

#import library for plotting
import matplotlib.pyplot as plot

#storing the k nearest neighbors classifier
KNN_classifier = KNeighborsClassifier(n_neighbors=5)

#fitting values for x and y
KNN_classifier.fit(train_x,train_y)


#predicting the test values with model
prediction_knn = KNN_classifier.predict(test_x)
print(prediction_knn)
#performance metric check
confusion_matrix_knn = confusion_matrix(test_y, prediction_knn)
print("Confusion matrix",confusion_matrix_knn)

#accuracy rate
accuracy_score_knn = accuracy_score(test_y,prediction_knn)
print(accuracy_score_knn)#0.8341



Misclassified_sample = []
#calculating errors for different values of k
for i in range(1,20):
    knn= KNeighborsClassifier(n_neighbors=i)
    knn.fit(train_x,train_y)
    pred_i=knn.predict(test_x)
    Misclassified_sample.append((test_y != pred_i).sum())


print(Misclassified_sample)

print(metrics.classification_report(test_y,prediction_knn))















