"""

@author: Vandan
"""

"""
Project: Implementation of clustering techniques on text data set

Code Description: Code in the file is used for following task:
                  
                  - Pre-preprocess the text data
                  - Perform tf-idf vectorization
                  - Cosine similarity of documents
                  - WCSS method (Optimal value of K in K-Means)
                  - K-Means Clustering
                  - DMDBSCAN method (Optimal value of epsilon in DBSCAN)
                  - DBSCAN Clustering
"""


'''
Import libraries
'''

import requests 
from bs4 import BeautifulSoup 
import nltk
from nltk.stem import WordNetLemmatizer #for grouping similar meaning words in single item
from nltk.stem.porter import PorterStemmer #reducing similar words in single word
from nltk.corpus import stopwords
nltk.download('punkt') # divides text into list of sentences
nltk.download('wordnet')
nltk.download('stopwords')
import os
import pandas as pd
from sklearn.datasets import fetch_20newsgroups
from sklearn.feature_extraction.text import TfidfVectorizer
from keras.preprocessing.text import Tokenizer
import string
import pickle
import re
import matplotlib.pyplot as plt
import collections
import numpy as np
from sklearn.cluster import KMeans
from sklearn.cluster import DBSCAN
from sklearn import metrics

########################################################################################################################################################################

'''
Import Data
'''
# Import 20 newgroup dataset
newsgroups_train = fetch_20newsgroups(subset='train',remove=('headers', 'footers', 'quotes'))
labels=newsgroups_train.target
texts = newsgroups_train.data


########################################################################################################################################################################

'''
Data Pre-Processing
'''

set(stopwords.words('english'))
MAX_NB_WORDS = 9999999

# Tokenizer
tokenizer = Tokenizer(num_words=MAX_NB_WORDS)
tokenizer.fit_on_texts(texts)

use_words=list(tokenizer.word_index.keys())
use_words=set(use_words)

stop_words=set(stopwords.words('english'))

# Function to split the words
def to_list(string_to_conv):
  words = string_to_conv.split(' ')
  return words

# Function to join the words
def to_string(words):
  string_to_conv = ' '.join(words)
  return string_to_conv

# Remove stop words and digits
def preprocess(string_to_conv):
  string_to_conv = re.sub(r'\d+', ' ', string_to_conv)
  words = to_list(string_to_conv)
  words = [word.lower() for word in words]
  words = [word for word in words if word not in stop_words]
  words = [word for word in words if word in use_words]
  words = [word for word in words if not word.isdigit()]
  words = [word for word in words if not len(word) == 1]
  
  string_to_conv = to_string(words)

  return string_to_conv

# preview of records
for i in range(0,5):
  print(i," ",newsgroups_train.data[i])


dic_without_preprocessing={}
dic={}
dic_without_preprocessing['Content']=newsgroups_train.data
dic_without_preprocessing['Labels']=newsgroups_train.target
dic['Content']=list(map(preprocess,newsgroups_train.data))
dic['Labels']=newsgroups_train.target
df = pd.DataFrame(dic_without_preprocessing)
df.to_csv('dataset_without_preprocessing.csv')
df = pd.DataFrame(dic)
df.to_csv('dataset.csv')


from google.colab import drive
drive.mount('/content/drive')


os.chdir('/content/drive/My Drive/MCA SEM 5/MINOR PROJECT')
print(os.getcwd())

print(dic['Content'][0:100])

content=dic['Content']
vectorizer = TfidfVectorizer()
vectorizer.fit(content)
tfidf = vectorizer.transform(content)#term frequency of different documents
data = pd.DataFrame(tfidf.todense(),index=list(range(0,len(dic['Content']))),columns=vectorizer.get_feature_names())
data

data.to_csv('tfidf_csv.csv')


# Import labels
data = pd.DataFrame(dic['Labels'])
data.to_csv('labels_csv.csv',index=False)
labels=pd.read_csv('labels_csv.csv',usecols=[0])
labels=labels.values.tolist()
list1=[]
for values in labels:
  list1.append(values[0])
labels=list1.copy()
print(labels)

########################################################################################################################################################################

'''
Cosine Similarity
'''
from sklearn.metrics.pairwise import cosine_similarity
tf_cosine = cosine_similarity(tfidf)


########################################################################################################################################################################

'''
WCSS(within cluster sum of squares) method for optimal parameter calculation
'''

n_clusters=10
cost=[]
for i in range(1,n_clusters):
    kmean= KMeans(i)
    kmean.fit(tf_cosine)
    cost.append(kmean.inertia_)  
   
plt.plot(cost, 'bx-')

########################################################################################################################################################################

'''
K-Means clustering with optimal value of K
'''

silhouette_scores = [] 
for n_cluster in range(2, 6):
    silhouette_scores.append(   
        metrics.silhouette_score(tf_cosine, KMeans(n_clusters = n_cluster).fit_predict(tf_cosine))) 
    
clf = KMeans(n_clusters=20, random_state=1, n_init=10, max_iter=300)
clf.fit(tf_cosine)
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

# Visualization
plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.show()

########################################################################################################################################################################

'''
DMDBSCAN method to calculate optimal value of epsilon
'''

matrix = np.array(tf_cosine)
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

for i in range(1,10):
    clf = DBSCAN(eps=0.61, min_samples=13, n_jobs=-1,metric="precomputed").fit(new_matrix)
    temp_list = list(clf.labels_)
    #print(temp_list)
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






