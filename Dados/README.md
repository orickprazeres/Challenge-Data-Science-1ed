## Dicionário de dados por tabela

### dados_mutuarios

Tabela contendo os dados pessoais de cada solicitante

| Feature | Tradução | Característica |
| --- | --- | --- |
|`person_id`| `person_id` |ID da pessoa solicitante|
| `person_age` | `idade` | Idade da pessoa - em anos - que solicita empréstimo |
| `person_income` | `salario` | Salário anual da pessoa solicitante |
| `person_home_ownership` | `situacao_moradia` | Situação da propriedade que a pessoa possui: *Alugada* (`Rent`), *Própria* (`Own`), *Hipotecada* (`Mortgage`) e *Outros casos* (`Other`) |
| `person_emp_length` | `tempo_trabalho` |Tempo - em anos - que a pessoa trabalhou |

### emprestimos

Tabela contendo as informações do empréstimo solicitado

| Feature | Tradução | Característica |
| --- | --- | -- |
|`loan_id`| `loan_id` | ID da solicitação de empréstico de cada solicitante|
| `loan_intent` | `motivo_emprestimo` | Motivo do empréstimo: *Pessoal* (`Personal`), *Educativo* (`Education`), *Médico* (`Medical`), *Empreendimento* (`Venture`), *Melhora do lar* (`Homeimprovement`), *Pagamento de débitos* (`Debtconsolidation`) |
| `loan_grade` | `pontuacao_emprestimo` |  Pontuação de empréstimos, por nível variando de `A` a `G` |
| `loan_amnt` | `valor_emprestimo` |  Valor total do empréstimo solicitado |
| `loan_int_rate` | `valor_emprestimo` |  Taxa de juros |
| `loan_status` | `inadimplencia` |  Possibilidade de inadimplência |
| `loan_percent_income` | `renda_percentual_emprestimo` |  Renda percentual entre o *valor total do empréstimo* e o *salário anual* |


### historicos_banco

Histório de emprétimos de cada cliente

| Feature | Tradução | Característica |
| --- | --- | --- |
|`cb_id`| `cb_id` |ID do histórico de cada solicitante|
| `cb_person_default_on_file` | `devendo` |  Indica se a pessoa já foi inadimplente: sim (`Y`,`YES`) e não (`N`,`NO`) |
| `cb_person_cred_hist_length` | `tempo_de_credito` |  Tempo - em anos - desde a primeira solicitação de crédito ou aquisição de um cartão de crédito |

### id

Tabela que relaciona os IDs de cada informação da pessoa solicitante

| Feature | Tradução | Característica |
| --- | --- | --- |
|`person_id`| `person_id`| ID da pessoa solicitante|
|`loan_id`| `loan_id`| ID da solicitação de empréstico de cada solicitante|
|`cb_id`| `cb_id`| ID do histórico de cada solicitante|
