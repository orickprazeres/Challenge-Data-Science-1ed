#Arquivo que sobe o serviço de API e Funcoes de Dados.

# uvicorn FastApi:app --reload
# uvicorn main:app --reload --host 0.0.0.0

import pandas as pd
import numpy as np
import pickle as pk
from fastapi import FastAPI

app = FastAPI()

one_hot_enc = pd.read_pickle('modelos/one_hot_encoder.pkl')
modelo = pd.read_pickle('modelos/modelo_treinado.pkl')
scaler = pd.read_pickle('modelos/scaler.pkl')

@app.get("/")
def home():
    return "Minha API está no Ar"

# http://127.0.0.1:8000/modelo/v1=24&v2=100000&v3=Hipotecada&v4=6&v5=M%C3%A9dico&v6=A&v7=20000&v8=6.17&v9=0&v10=4
@app.get('/modelo/v1={idade}&v2={salario}&v3={situacao_moradia}&v4={tempo_trabalho}&v5={motivo_emprestimo}&v6={pontuacao_emprestimo}&v7={valor_emprestimo}&v8={taxa_juros}&v9={devendo}&v10={tempo_de_credito}')
def previsao_modelo(idade, salario, situacao_moradia, tempo_trabalho, 
                    motivo_emprestimo, pontuacao_emprestimo, valor_emprestimo,
                    taxa_juros, devendo, tempo_de_credito):
    global variaveis, dados
    
    variaveis = {
        'idade': [int(idade)],
        'salario': [int(salario)],
        'situacao_moradia': [str(situacao_moradia)],
        'tempo_trabalho': [int(tempo_trabalho)],
        'motivo_emprestimo': [str(motivo_emprestimo)],
        'pontuacao_emprestimo': [str(pontuacao_emprestimo)],
        'valor_emprestimo': [int(valor_emprestimo)],
        'taxa_juros': [float(taxa_juros)],
        'devendo': [int(devendo)],
        'tempo_de_credito': [int(tempo_de_credito)]
    }

    dados = pd.DataFrame(variaveis, index=[0])
    
    print(dados)
    return variaveis

# http://127.0.0.1:8000/previsao
@app.get("/previsao")
def previsao():
    global dados, x
    
    dados = one_hot_enc.transform(dados)
    dados_transformados = pd.DataFrame(dados, columns=one_hot_enc.get_feature_names_out())

    dados_transformados = scaler.transform(dados_transformados)
    dados_transformados = pd.DataFrame(dados_transformados, columns = one_hot_enc.get_feature_names_out())
    
    return {'result': modelo.predict(dados_transformados).tolist()[0],
            'probability_0': modelo.predict_proba(dados_transformados).tolist()[0][0],
            'probability_1': modelo.predict_proba(dados_transformados).tolist()[0][1]}
