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


# Semana 1
 Ao realizar a  importação do arquivo DUMP para o banco de dados MySQL, é necessário realizar o tratamento dos dados, realizando tradução no nome das colunas e variaveis assim como modelar uma tabela única para ser lida pelo modelo. E tivemos como desafio criar um arquivo .CSV tratado retirando os dados nulos, traduzindo colunas e informações, que demos o nome de `dados_juntos_tratados.csv`.
 
   Na pasta Dados/dumps, encontra-se o arquivo DUMP do banco de dados e também o script BD.sql que foi utilizado para os tratamentos dos dados.
   
      * Alteração do tipo de dados nas colunas para melhor desempenho;
      * Tradução de nome de colunas;
      * Tradução de linhas;
      * Inclusão de chaves primarias e estrangeiras;
      * Criação de tabela única para leitura do modelo;
      * Relacionar as tabelas atraves dos IDs respectivamente;
      * Construir um arquivo .CSV realizando o tratamento de dados.
      
# Semana 2

  Após iniciarmos a semana 2, é necessário realizar a construção do modelo de aprendizado de maquina e realizando a comparação dos modelos `DecisionTreeClassifier` `GradientBoostingClassifier` e `LogisticRegression`.
  
  Para assim realizar a leitura do banco de dados, realizar a limpeza dos dados, realizar a transformação dos dados e por fim e realizar a construção do modelo
  
  No arquivo /semana - 2/alura_cash.ipynb, encontra-se o código utilizado para a construção do modelo assim como o tratamento do dado. Nessa etapa comparamos os arquivos tratados através do SQL e da linha de código gerado atraves do python e após algumas análises, focamos em utilizar o arquivo `/semana - 2/dados_juntos_tratados.csv` criado pelo SQL.

  No processo de validação do modelo, foram testados os 3 modelos com métodos de `OverSampling` e `UnderSampling` e também o `GridSearchCV` para encontrar os melhores parâmetros para o modelo escolhido.

  Ao final de cada processo foi utilizada a biblioteca Pickle para exportar o modelo serializado para o arquivo modelo.pkl que será utilizado na API. ( Assim como os transformadores de dados.)

# Semana 3
   Com os dados tratados em mãos e os modelos exportados, temos como foco criar uma API e pra isso foi utilizado a framework FastApi, que podemos ler no arquivo `/semana - 3 e 4/main.py`.

   Para a requisição na API foi utilizado diretamente os parâmetros de consulta do PowerBi, que realizam uma consulta local através do endereço: 127.0.0.1 e porta 8000, utilizada como padrão pelo framework, e caso a API esteja rodando em outro endereço, deve ser alterado no arquivo de consulta do PowerBi.

  O arquivo de PowerBi é construído em cima de 3 consultas básicas, sendo elas:   
      
      1- Montar requisição na API.
      2- Retorno da previsão e probabilidades.
      3- Consulta dos dados em que o modelo foi treinado.
      
  * para esse uso em específico o PowerBi não permitia a mudança dos parâmetros pelo usuário final, por isso podemos buscar outras plataformas para esse uso.

# O Dashboard
  O Dashboard parte da premissa de um atendente da Alura Cash que recebe uma solicitação de empréstimo e precisa realizar uma análise de risco para aprovar ou não o empréstimo, ao editar os parâmetros no PowerBi e atualizar os dados e isso se faz necessário pois existe uma consulta de requisição e outra de retorno.
  
<br>
<div align="center" >
<img src="semana - 3 e 4/dashboard_pb.gif" width="">
</img>
</div>
<br>
  
  Na parte superior do Dashboard podemo observar as informações gerados através do dados do cliente solicitante, e na parte inferior os dados agora são de acordo com o banco de dados, para que seja possível identificar também algumas análises entre o grupo de pessoas que já foram inadimplentes em solicitações anteriores, sendo base para o "atendente" realizar uma análise de risco e para facilitar ainda mais na coluna da esquerda podemos possuimos uns filtros para podermos comparar da melhor forma os dados do cliente solicitante com os clientes anteriores.
  


#vitrinedev
#alurachallengedados1
