# -*- coding: utf-8 -*-
"""
Created on Tue Oct 29 17:46:47 2019

@author: Vandan
"""



#################################################################3
#predicting price of cars
#################################################################

import pandas as pd
import numpy as np
import seaborn as sb

#setting dimensions for plot
sb.set(rc={'figure.figsize':(11.7,8.27)})
    

#reading csv
cars_data=pd.read_csv('cars_sampled.csv')

#creating copy
cars=cars_data.copy()

#structure of dataset
cars.info()

#summarizing data
cars.describe()
pd.set_option('display.float_format',lambda x: '%.3f' % x) #sets 3 digits after decimal point
cars.describe()

##to display maximum set of columns
pd.set_option('display.max_columns',500)
cars.describe()

#droping unwanted columns
cols=['name','dateCrawled','dateCreated','postalCode','lastSeen']
cars=cars.drop(columns=cols,axis=1)

cars.isnull().sum()

#removing duplicates
cars.drop_duplicates(keep='first',inplace=True) #470 records deleted

#data cleaning

#no. of missing values
print(cars.isnull().sum())
print(cars['notRepairedDamage'].value_counts())

#variable yearof registration
yearwise_count=cars['yearOfRegistration'].value_counts().sort_index
print(sum(cars['yearOfRegistration']>2018))
print(sum(cars['yearOfRegistration']<1950))
sb.regplot(x='yearOfRegistration',y='price',scatter=True,fit_reg=False,data=cars)
#working range of years 1950-2018


#variable price
price_count=cars['price'].value_counts().sort_index
sb.distplot(cars['price'])
cars.describe()
sb.boxplot(y=cars['price'])
sum(cars['price']>150000)
sum(cars['price']<100)
#working range of price 100-150000

#varible powerps
power_count=cars['powerPS'].value_counts().sort_index()
sb.distplot(cars['powerPS'])
cars['powerPS'].describe()
sb.boxplot(y=cars['powerPS'])
sb.regplot(x='powerPS',y='price',scatter=True,fit_reg=False,data=cars)
sum(cars['powerPS'] > 500)
sum(cars['powerPS'] < 10)
#working range of powerps 10-500


#####################################################################
#working range of data
#####################################################################

cars = cars[(cars.yearOfRegistration <= 2018)
            & (cars.yearOfRegistration >=1950)
            & (cars.price>=100)
            & (cars.price<=150000)
            & (cars.powerPS>=10)
            & (cars.powerPS<=500)]
#6700 records drop

#futher simplify variable reduction
#creating new variable age by combining yearofregisteration and monthofregistration

cars['monthOfRegistration']/=12

cars['Age']=(2018-cars['yearOfRegistration'])+cars['monthOfRegistration']
cars['Age'] = round(cars['Age'],2)
cars['Age'].describe()

#droping yearOfRegistration and monthOfRegistration
cars=cars.drop(columns=['yearOfRegistration','monthOfRegistration'],axis=1)


#visualizing parameters
#age
sb.distplot(cars['Age'])
sb.boxplot(y=cars['Age'])

#Price
sb.distplot(cars['price'])
sb.boxplot(y=cars['price'])

#powerPS
sb.distplot(cars['powerPS'])
sb.boxplot(y=cars['powerPS'])

#visualizing parameters after narrow working
#age vs price
sb.regplot(x='Age',y='price',scatter=True,fit_reg=False,data=cars)
#cars priced higher are newer
#with increase in age , price decreases
#some cars with more age 



#powerPS vs price
sb.regplot(x='powerPS',y='price',scatter=True,fit_reg=False,data=cars)

#variable seller
cars['seller'].value_counts()
pd.crosstab(cars['seller'],columns='count',normalize=True)
sb.countplot(x='seller',data=cars)
#few car has commercial => insignificant



#variable offertype
cars['offerType'].value_counts()
sb.countplot(x='offerType',data=cars)
#all offertype are offer  => insignificant


#variable abtest
cars['abtest'].value_counts()
pd.crosstab(cars['abtest'],columns='count',normalize=True)
sb.countplot(x='abtest',data=cars)
#equally distributed
sb.boxplot(x='abtest',y='price',data=cars)
#there is 50-50 distribution 
#does not affect price =>insignificant 


#varible vehicletype
cars['vehicleType'].value_counts()
pd.crosstab(cars['vehicleType'],columns='count',normalize=True)
sb.countplot(x='vehicleType',data=cars)
sb.boxplot(x='vehicleType',y='price',data=cars)
#vehicletype affects price =>significant





#varible gearbox
cars['gearbox'].value_counts()
pd.crosstab(cars['gearbox'],columns='count',normalize=True)
sb.countplot(x='gearbox',data=cars)
sb.boxplot(x='gearbox',y='price',data=cars)
#gearbox affects price =>significant

#variable model
cars['model'].value_counts()
pd.crosstab(cars['model'],columns='count',normalize=True)
sb.countplot(x='model',data=cars)
sb.boxplot(x='model',y='price',data=cars)
#cars are distributed over many models
#considered in modelling

#variable kilometer
cars['kilometer'].value_counts()
pd.crosstab(cars['kilometer'],columns='count',normalize=True)
sb.countplot(x='kilometer',data=cars)
sb.boxplot(x='kilometer',y='price',data=cars)
#cars are distributed over many kilometers
#considered in modelling


#variable fuelType
cars['fuelType'].value_counts()
pd.crosstab(cars['fuelType'],columns='count',normalize=True)
sb.countplot(x='fuelType',data=cars)
sb.boxplot(x='fuelType',y='price',data=cars)
#cars are distributed over many fuel type
#affects price
#considered in modelling


#variable brand
cars['brand'].value_counts()
pd.crosstab(cars['brand'],columns='count',normalize=True)
sb.countplot(x='brand',data=cars)
sb.boxplot(x='brand',y='price',data=cars)
#cars are distributed over many brands
#considered in modelling

#variable notRepairedDamage
#yes car are is damaged but not repaired
#no car was damaged but repaired
cars['notRepairedDamage'].value_counts()
pd.crosstab(cars['notRepairedDamage'],columns='count',normalize=True)
sb.countplot(x='notRepairedDamage',data=cars)
sb.boxplot(x='notRepairedDamage',y='price',data=cars)
#cars which are required to be repaired falls under low price



###########################################################################
#removing insignificant variables
###########################################################################
col=['seller','abtest','offerType']
cars=cars.drop(columns=col,axis=1)
cars_copy=cars.copy()



###########################################################################
#correlation
###########################################################################
cars_select1=cars.select_dtypes(exclude=[object])
correlation=cars_select1.corr()
round(correlation,3)
cars_select1.corr().loc[:,'price'].abs().sort_values(ascending=False)[1:]




###########################################################################
#Two models using linear regression and random forest on sets of data
#1)model with omiting missing values
#2)model with imputing missing values
###########################################################################


#omitting missing values
cars_omit=cars.dropna(axis=0)

#converting categorical variables to dummy variables.
cars_omit=pd.get_dummies(cars_omit,drop_first=True)


#importing necessary libraries
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import  RandomForestRegressor
from sklearn.metrics import mean_squared_error


#seperating input and output features 
x1=cars_omit.drop(['price'],axis='columns',inplace=False)
y1=cars_omit['price']

#plotting variable price
prices=pd.DataFrame({"before":y1,"after":np.log(y1)})
prices.hist()

#transforming price as logarithmic value
y1 = np.log(y1)


#splitting data into training and testing
X_train,X_test,y_train,y_test = train_test_split(x1,y1,test_size=0.3,random_state=3)
print(X_train.shape,X_test.shape,y_train.shape,y_test.shape)


#finding mean for test data value
base_pred = np.mean(y_test)
print(base_pred)

#repeating same value till length of test data
base_pred= np.repeat(base_pred,len(y_test))

#finding rmse
base_root_mean_square_error = np.sqrt(mean_squared_error(y_test,base_pred))
print(base_root_mean_square_error)
#further model should have less than this rmse value


#########################################################################
#Linear regression
#########################################################################

#setting intercept as true
lgr=LinearRegression(fit_intercept=True)

#model fitting
model_lin1 = lgr.fit(X_train,y_train)

#predicting model on test set
cars_predictions_lin1 = lgr.predict(X_test)



#computing mse and rmse
lin_mse1=mean_squared_error(y_test,cars_predictions_lin1)
lin_rmse1=np.sqrt(lin_mse1)
print(lin_rmse1)
#mse 0.0531
#rmse 0.072

#r-squared value
r2_lin1_test = model_lin1.score(X_test,y_test)
r2_lin1_train = model_lin1.score(X_train,y_train)
print(r2_lin1_test,r2_lin1_train)
#r square testing data 0.734
#r square training data 0.751



#regression diagnostics residual plot analysis
residuals=y_test-cars_predictions_lin1
sb.regplot(x=cars_predictions_lin1,y=residuals,scatter=True,fit_reg=False)
residuals.describe()



#########################################################################
#Random forest regressor
#########################################################################

#model parameter
rf=RandomForestRegressor(n_estimators=400,max_features='auto',
                         max_depth=100,min_samples_split=10,
                         min_samples_leaf=4,random_state=1)

#model
model_rf1 = rf.fit(X_train,y_train)

#predicting model on test data
cars_predictions_rf1 = rf.predict(X_test)

#computing mse and rmse
rf_mse1=mean_squared_error(y_test,cars_predictions_rf1)
rf_rmse1=np.sqrt(rf_mse1)
print(rf_rmse1)
#mse 0.0034
#rmse 0.0058


#r-squared value
r2_rf1_test = model_rf1.score(X_test,y_test)
r2_rf1_train = model_rf1.score(X_train,y_train)
print(r2_rf1_test,r2_rf1_train)
#r square testing data 0.829
#r square testing data 0.907



##########################################################################
#model with imputed value
##########################################################################

#imputing values using lambda function
cars_imputed = cars.apply(lambda x:x.fillna(x.median()) 
                        if(x.dtype=='float') else
                        x.fillna(x.value_counts().index[0])) 

cars_imputed.isnull().sum()

#converting categorical variables to dummy variables.
cars_imputed=pd.get_dummies(cars_imputed,drop_first=True)


#seperating input and output features 
x2=cars_imputed.drop(['price'],axis='columns',inplace=False)
y2=cars_imputed['price']

#plotting variable price
prices1=pd.DataFrame({"before":y2,"after":np.log(y2)})
prices1.hist()

#transforming price as logarithmic value
y2 = np.log(y2)


#splitting data into training and testing
X_train1,X_test1,y_train1,y_test1 = train_test_split(x2,y2,test_size=0.3,random_state=3)
print(X_train1.shape,X_test1.shape,y_train1.shape,y_test1.shape)


#finding mean for test data value
base_pred1 = np.mean(y_test1)
print(base_pred1)

#repeating same value till length of test data
base_pred1= np.repeat(base_pred1,len(y_test1))

#finding rmse
base_root_mean_square_error1 = np.sqrt(mean_squared_error(y_test1,base_pred1))
print(base_root_mean_square_error1)
#further model should have less than this rmse value


#########################################################################
#Linear regression
#########################################################################

#setting intercept as true
lgr2=LinearRegression(fit_intercept=True)

#model fitting
model_lin2 = lgr2.fit(X_train1,y_train1)

#predicting model on test set
cars_predictions_lin2 = lgr2.predict(X_test1)

#computing mse and rmse
lin_mse2=mean_squared_error(y_test1,cars_predictions_lin2)
lin_rmse2=np.sqrt(lin_mse2)
print(lin_rmse2)
#mse 0.420
#rmse 0.648

#r-squared value
r2_lin2_test = model_lin2.score(X_test1,y_test1)
r2_lin2_train = model_lin2.score(X_train1,y_train1)
print(r2_lin2_test,r2_lin2_train)
#r squared testing data 0.702
#r squared training data 0.707

#regression diagnostics residual plot analysis
residuals1=y_test1-cars_predictions_lin2
sb.regplot(x=cars_predictions_lin2,y=residuals1,scatter=True,fit_reg=False)
residuals1.describe()



#########################################################################
#Random forest regressor
#########################################################################

#model parameter
rf1=RandomForestRegressor(n_estimators=400,max_features='auto',
                         max_depth=100,min_samples_split=10,
                         min_samples_leaf=4,random_state=1)

#model
model_rf2 = rf1.fit(X_train1,y_train1)

#predicting model on test data
cars_predictions_rf2 = rf1.predict(X_test1)



from sklearn.model_selection import RandomizedSearchCV
#hyperparameter tuning
n_estimators=[100,200,300,400,500,600,700]
max_depth=[50,100,150]
min_samples_split = [5,10,15,20]
min_samples_leaf=[1,2,3,4,5,6]

#defining grid for hyper parameters 
hyperparameter_grid={'n_estimators':n_estimators,
                    'max_depth':max_depth,
                    'min_samples_split':min_samples_split,
                    'min_samples_leaf':min_samples_leaf
                    }

#randomized cv
random_cv =  RandomizedSearchCV(estimator = rf1, param_distributions = hyperparameter_grid, scoring='neg_mean_squared_error',n_iter = 100, cv = 3, verbose=2, random_state=1, n_jobs = -1)


random_cv.fit(X_train1,y_train1)
best_random = random_cv.best_estimator_
best_score = random_cv.best_score_




#computing mse and rmse
rf_mse2=mean_squared_error(y_test1,cars_predictions_rf2)
rf_rmse2=np.sqrt(rf_mse2)
print(rf_rmse2)
#mse 0.243
#rmse 0.492



#r-squared value
r2_rf2_test = model_rf2.score(X_test1,y_test1)
r2_rf2_train = model_rf2.score(X_train1,y_train1)
print(r2_rf2_test,r2_rf2_train)

#r squared testing data 0.827
#r squared training data 0.903



























 



































