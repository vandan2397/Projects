import numpy as np
from flask import Flask, request, jsonify,escape,render_template, url_for, redirect, request
import pickle
from sklearn.externals import joblib

app = Flask(__name__)
#model = pickle.load(open('et_model.pkl', 'rb'))
#model = joblib.load("et_model.pkl")
model = joblib.load('Extra.pkl')  

@app.route('/')
@app.route('/Home')
def home():
    return render_template('index.html')

@app.route('/predict',methods=['POST'])
def predict():
	int_features=[int(x) for x in request.form.values()]
	final_features=[np.array(int_features)]
	prediction = model.predict(final_features)
	Detection =''
	if prediction==0:
		Detection='Benign'
	else:
		Detection='Malign'
	return render_template('index.html',detection_text='Diagnosed as {}'.format(Detection))

#@app.route('/predict',methods=['POST'])
#def predict():


if __name__ == "__main__":
    app.run(debug=True)    