drop table dados_juntos;
create table dados_juntos as select 
dm.person_age,
dm.person_income,
dm.person_home_ownership,
dm.person_emp_length,
e.loan_intent,
e.loan_grade,
e.loan_amnt,
e.loan_int_rate,
e.loan_status,
e.loan_percent_income,
hb.cb_person_default_on_file,
hb.cb_person_cred_hist_length

from id i
join dados_mutuarios dm on dm.person_id = i.person_id 
join emprestimos e on e.loan_id = i.loan_id 
join historicos_banco hb on hb.cb_id = i.cb_id;

-- Realizando Contagem de informações
SELECT COUNT(dm.person_id) AS person_id
    , COUNT(id.person_id) AS person_id
    , COUNT(h.cb_id) AS cb_id
    , COUNT(e.loan_id) AS loan_id
FROM dados_mutuarios dm
    LEFT JOIN id id ON id.person_id = dm.person_id
    LEFT JOIN emprestimos e ON e.loan_id = id.loan_id
    LEFT JOIN historicos_banco h ON h.cb_id = id.cb_id
WHERE dm.person_id != ''