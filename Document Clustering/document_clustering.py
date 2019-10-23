# -*- coding: utf-8 -*-
"""Document_clustering.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1nIQ84VLhMtuTMNkoqrkhRiMTxE8Zr831
"""

# import requests 
# from bs4 import BeautifulSoup 
# import re
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
from sklearn.cluster import KMeans
from sklearn.cluster import DBSCAN
from sklearn import metrics

set(stopwords.words('english'))

newsgroups_train = fetch_20newsgroups(subset='train',remove=('headers', 'footers', 'quotes'))
labels=newsgroups_train.target
texts = newsgroups_train.data

MAX_NB_WORDS = 9999999

tokenizer = Tokenizer(num_words=MAX_NB_WORDS)
tokenizer.fit_on_texts(texts)

use_words=list(tokenizer.word_index.keys())
use_words=set(use_words)

stop_words=set(stopwords.words('english'))

def to_list(string_to_conv):
  words = string_to_conv.split(' ')
  return words

def to_string(words):
  string_to_conv = ' '.join(words)
  return string_to_conv

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

data = pd.DataFrame(dic['Labels'])
data.to_csv('labels_csv.csv',index=False)

labels=pd.read_csv('labels_csv.csv',usecols=[0])
labels=labels.values.tolist()
list1=[]
for values in labels:
  list1.append(values[0])
labels=list1.copy()
print(labels)

fopen = open('tfidf_file','wb') 
pickle.dump(tfidf,fopen)
fopen.close()

fopen = open('tfidf_file','rb') 
tfidf = pickle.load(fopen)
fopen.close()

clf = KMeans(random_state=1, n_init=10, max_iter=300)
clf.fit(tfidf)
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

plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.show()

clf = KMeans(n_clusters=20, random_state=1, n_init=10, max_iter=300)
clf.fit(tfidf)
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

plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.show()

import collections
clf = DBSCAN(eps=0.06, min_samples=5, n_jobs=-1).fit(tfidf)
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

from sklearn.metrics.pairwise import cosine_similarity
tf_cosine = cosine_similarity(tfidf)

import numpy as np
from scipy import sparse
matrix = np.array(tf_cosine)
const = 1
new_matrix = const-matrix
# tfidf = sparse.csr_matrix(new_matrix)
# print(tfidf)
print(new_matrix)

data = pd.DataFrame(new_matrix.tolist())
data.to_csv('cosine_similarity_tfidf_csv.csv',index=False)

np.fill_diagonal(new_matrix, np.inf)
min_values = np.min(new_matrix, axis=0)
print(min_values)
min_values.sort()
print(min_values)

import matplotlib.pyplot as plt
plt.plot(min_values)

import collections
clf = DBSCAN(eps=0.6, min_samples=3, n_jobs=-1).fit(new_matrix)
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

plt.bar(range(len(dic)), list(dic.values()), align='center')
plt.xticks(range(len(dic)), list(dic.keys()))
plt.show()

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

X_train, X_test, y_train, y_test = train_test_split(tfidf, labels)

clf=KNeighborsClassifier(n_neighbors=3, weights='distance', algorithm='auto',leaf_size=30, p=2, metric='minkowski')
clf.fit(X_train, y_train)
y_predicted = clf.predict(X_test)
print(y_predicted)
print(metrics.accuracy_score(y_test, y_predicted))

from sklearn.naive_bayes import MultinomialNB

clf = MultinomialNB(alpha=.01)
clf.fit(X_train, y_train)
pred = clf.predict(X_test)
print(pred)
print(metrics.accuracy_score(y_test, y_predicted))