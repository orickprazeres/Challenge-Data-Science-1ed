<h1 align="center"> AluraChallengeDados1 - Alura Cash  </h1>

<div align="center">
<img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white"><img>
<img src="https://img.shields.io/badge/Python-14354C?style=for-the-badge&logo=python&logoColor=yellow"> </img>
<img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white"></img>
<img src="https://img.shields.io/badge/fastapi-109989?style=for-the-badge&logo=FASTAPI&logoColor=white"> </img>
<img src="https://img.shields.io/badge/PowerBI-F2C811?style=for-the-badge&logo=Power%20BI&logoColor=black"> </img>
</div>

<br>
<div align="center" >
<img src="semana - 3 e 4/dashboard_pb.gif" width="620">
</img>
</div>
<br>

  Neste projeto a Alura nos desafia a encontrar a probabilidade de inadimplência quando um determinado cliente solicitar um empréstimo. Para isso, utilizamos o dataset da Alura Cash que ja vem com algumas variáveis pré-processadas e com a variável alvo "inadimplente" que indica se o cliente pagou ou não o empréstimo.

  
  São 3 etapas propostas separadas por semanas com graus de dificuldade crescentes em que cada uma respectivamente corresponde aos seguintes objetivos: 
    
    1- Restaurar BD Alura Cash.
    
    2- Construção e validação do Modelo de Aprendizado de Maquina.
    
    3- Hospedar Modelo em API. Criar requisição para API e apresentar resultado na ferramenta PowerBI.


# Etapa 1
  Nesta etapa, foi necessário realizar a importação do arquivo DUMP para o banco de dados MySQL.
    
  Após a importação, foi necessário realizar o tratamento dos dados, realizando tradução no nome das colunas e variaveis assim como modelar uma tabela única para ser lida pelo modelo.

   Na pasta Dados/dumps, encontra-se o arquivo DUMP do banco de dados e  também o script BD.sql que foi utilizado para os tratamentos dos dados.
   
      * Alteração do tipo de dados nas colunas para melhor desempenho.
      * Tradução de nome de colunas
      * Tradução de linhas
      * Inclusão de chaves primarias e estrangeiras.
      * Criação de tabela única para leitura do modelo.
      
# Etapa 2

  Nesta etapa, foi necessário realizar a construção do modelo de aprendizado de maquina e realizando a comparação dos modelos `DecisionTreeClassifier` `GradientBoostingClassifier` e `LogisticRegression`.
  
  Para isso, foi necessário realizar a leitura do banco de dados, realizar a limpeza dos dados, realizar a transformação dos dados e por fim, realizar a construção do modelo.
  
  No arquivo /semana - 2/alura_cash.ipynb, encontra-se o código utilizado para a construção do modelo assim como o tratamento do dado.

  No processo de validação do modelo, foram testados os 3 modelos com métodos de OverSampling e UnderSampling e foi usado `GridSearchCV` para encontrar os melhores parâmetros para o modelo escolhido.

  Ao final de cada processo foi utilizada a biblioteca Pickle para exportar o modelo serializado para o arquivo modelo.pkl que será utilizado na API. ( Assim como os transformadores de dados.)

# Etapa 3 -  em andamento
   
   Objetivos: 
      
      1- Montar requisição na API.
      2- Retorno da previsão e probabilidades.
      3- Consulta dos dados em que o modelo foi treinado.
      
      
#alurachallengedados1
