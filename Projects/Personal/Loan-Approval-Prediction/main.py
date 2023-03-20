from flask import Flask, request, jsonify, render_template
import pickle
import pandas as pd
import numpy as np
from utils import get_gender_encode, get_dependents_encode, get_education_encode,get_married_encode,get_property_area_encode,get_self_emp_encode

model = pickle.load(open("loan_pred_model.pkl","rb"))

app = Flask(__name__, template_folder='template')

@app.route('/', methods=['GET','POST'])
def index():
    return render_template("index.html")
    
@app.route('/Loan_Prediction', methods=['GET','POST'])
def Loan_Prediction():
    
    Gender = request.form.get('User_Gender')
    Married = request.form.get('User_Married')
    Dependents = request.form.get('User_Dependents')
    Education = request.form.get('User_Education')
    Self_Employed = request.form.get('Uesr_Self_Employed')
    ApplicantIncome = int(request.form.get('User_ApplicantIncome')) 
    CoapplicantIncome = float(request.form.get('User_CoapplicantIncome'))
    LoanAmount = float(request.form.get('Uesr_LoanAmount'))
    Loan_Amount_Term = float(request.form.get('User_Loan_Amount_Term'))
    Credit_History = float(request.form.get('Uesr_Credit_History'))
    Property_Area = request.form.get('User_Property_Area')

    Self_Employed = get_self_emp_encode(Self_Employed)
    Property_Area = get_property_area_encode(Property_Area)
    Dependents = get_dependents_encode(Dependents)
    Education = get_education_encode(Education)
    Gender = get_gender_encode(Gender)
    Married = get_married_encode(Married)

    
    test_df = pd.DataFrame({"Gender" : [Gender], 'Married' : [Married], 'Dependents' : [Dependents], 'Education' : [Education],
       'Self_Employed' : [Self_Employed], 'ApplicantIncome' : [ApplicantIncome], 'CoapplicantIncome' : [CoapplicantIncome], 'LoanAmount':LoanAmount,
       'Loan_Amount_Term' : [Loan_Amount_Term], 'Credit_History' : [Credit_History], 'Property_Area' : [Property_Area]})

    model_output = model.predict(test_df)

    if model_output[0]==0:
        Loan = "************** Sorry : Loan Not Approved **************"
    else:
        Loan = "************** Congratualations : Loan Approved **************"

    return render_template('index.html',Loan_Prediction = Loan)
    
 
if __name__ == '__main__':
    app.run(debug = True)