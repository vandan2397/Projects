# IMPLEMENTATION OF CLUSTERING TECHNIQUES ON TEXT DATASET

![Graphical Abstract 2](https://user-images.githubusercontent.com/55615788/136470685-23a58104-a90e-46a1-b5bf-4847e52e23b4.jpg)

### Introduction
Clustering documents is fruitful when you have large number of documents and you want to extract documents of specific category. But, the question arises that how much accurate the documents are clustered. So to answer the question, I conducted this project. This Project addresses the research question of the performance of two different clustering algorithms i.e. K-Means and DBSCAN with optimal parameter values using two different similarity measures(cosine and Hybrid).

### Methods Used
- Text Similarity
- Text Clustering
- Machine Learning

### Tools and Libraries
- Python
- Pandas, Numpy, Matplotlib, Seaborn and Sklearn
- Jupyter IDE

### Flow of project

<b>1) Data Acquisition </b>
- As a part of Data Acquisition, webscraped the abstracts of research papers from springer journal of different areas such as Wireless sensor network, Artificial Intelligence, Crypto, Image processing, Cryptoraphy, Machine Learning and Health.  

<b>2) Data Pre-processing </b>
- Performed 2 preprocessing steps:
  * Removed Stop words
  * Lemmatization 
- It helped to condense the dimensionality of the dataset. 

<b>3) Tf-Idf matrix generation and document index graph generation</b>
- Converted text to vector formation
    * Generated Term frequency-Inverse term frequency of text to calculate cosine similarity.
    * Generated Document Index Graph to extract shared phrases to calculate hybrid similarity.

<b>4) Similarity Calculation between documents </b>
- Calculated cosine similarity.
- Calculated hybrid similarity with significance of 0.7 for phrase based similarity and 0.3 for cosine similarity.   

<b>5) Optimal parameter values calculation </b>
- Utilized DMDBSCAN to calculate optimal parameter value of epsilon for DBSCAN and WCSS(within cluster sum of squares) to calculate optimal value of K for K-Means.

<b>6) Clustering(K-Means & DBSCAN)</b>

![image](https://user-images.githubusercontent.com/55615788/149265241-49a9a177-885c-43fa-812a-1bdb092ef2c8.png)

- Clustering results depict that DBSCAN performs little bit better than K-Means when hybrid similarity is used. However, DBSCAN significantly outperforms K-Means when Cosine similarity is used.
