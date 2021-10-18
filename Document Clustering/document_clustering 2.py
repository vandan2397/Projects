
"""
@author: Vandan
"""
"""
Project: Implementation of clustering techniques on text data set

Code Description: Code in the file is used for following task on precomputed 
                  similarity matrix of webscraped data:
                      
                  - WCSS method (Optimal value of K in K-Means)
                  - K-Means Clustering
                  - DMDBSCAN method (Optimal value of epsilon in DBSCAN)
                  - DBSCAN Clustering
"""

'''
Import libraries
'''

import pandas as pd
import numpy as np
from scipy import sparse
from sklearn import metrics
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn import metrics
import collections
from sklearn.cluster import KMeans
from sklearn.cluster import DBSCAN

'''
Import Data
'''

df = pd.read_csv('CosineSimilarity_InverseDocumentFrequency_1121.csv')
df = df.drop(df.columns[0],axis=1)

########################################################################################################################################################################

'''
DMDBSCAN method to calculate optimal value of epsilon
'''

matrix = np.array(df)
const = 1
new_matrix = const-matrix
np.fill_diagonal(new_matrix, 0)

np.fill_diagonal(new_matrix, np.inf)
min_values=np.partition(new_matrix,2,axis=0)[2]
min_values = np.min(new_matrix, axis=0)
print(min_values)
min_values.sort()


plt.plot(min_values)
plt.xlabel('documents')
plt.ylabel('epsilon values')


########################################################################################################################################################################

'''
DBSCAN clustering with optimal value of epsilon
'''

for i in range(1,50):
    clf = DBSCAN(eps=0.57, min_samples=7, n_jobs=-1,metric="precomputed").fit(new_matrix)
    temp_list = list(clf.labels_)


print("Silhouette Coefficient: %0.3f" % metrics.silhouette_score(new_matrix, clf.labels_, sample_size=1000))


dic = {}
for item in temp_list:
  if(item not in dic.keys()):
    dic[item]=1
  else:
    dic[item]+=1
dic = dict(collections.OrderedDict(sorted(dic.items())))
print(dic)
plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.xlabel('Clusters')
plt.ylabel('Numbers of Documents')
plt.show()


print("Homogeneity: %0.3f" % metrics.homogeneity_score(labels, clf.labels_))
print("Completeness: %0.3f" % metrics.completeness_score(labels, clf.labels_))
print("V-measure: %0.3f" % metrics.v_measure_score(labels, clf.labels_))
print("Silhouette Coefficient: %0.3f" % metrics.silhouette_score(new_matrix, clf.labels_, sample_size=1000))


########################################################################################################################################################################


'''
WCSS(within cluster sum of squares) method for optimal parameter calculation
'''

#optimal no. of clusters
n_clusters=10
cost=[]
for i in range(1,n_clusters):
    kmean= KMeans(i)
    kmean.fit(matrix)
    cost.append(kmean.inertia_)  
   
plt.plot(cost, 'bx-')


########################################################################################################################################################################

'''
WCSS(within cluster sum of squares) method for optimal parameter calculation
'''
silhouette_scores = [] 
for n_cluster in range(2, 6):
    silhouette_scores.append(   
        metrics.silhouette_score(matrix, KMeans(n_clusters = n_cluster).fit_predict(matrix))) 
    
k = [2, 3, 4] 
plt.bar(k, silhouette_scores) 
plt.xlabel('Number of clusters', fontsize = 10) 
plt.ylabel('Silhouette Score', fontsize = 10) 
plt.show()    

########################################################################################################################################################################

'''
K-Means clustering with optimal value of K
'''

clf = KMeans(n_clusters=3,random_state=3, n_init=10, max_iter=300)
clf.fit(matrix)
temp_list = list(clf.labels_)
print(temp_list)

dic = {}
for item in temp_list:
  if(item not in dic.keys()):
    dic[item]=1
  else:
    dic[item]+=1
dic = dict(collections.OrderedDict(sorted(dic.items())))
print(dic)

print("Silhouette Coefficient: %0.3f" % metrics.silhouette_score(matrix, clf.labels_, sample_size=1000))
#0.635

plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.xlabel('Clusters')
plt.ylabel('Numbers of Documents')
plt.show()




