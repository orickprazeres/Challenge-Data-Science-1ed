use alura_cash;
-- realizando o SELECT para traduzir as colunas
-- e traduzindo as informações
drop table dados_juntos_traduzidos;
create table dados_juntos_traduzidos as select 
		-- dados mutuarios
		dm.person_age as idade,
		dm.person_income as salario,
        /*person_home_ownership -> situacao_moradia*/
        case
           when dm.person_home_ownership = 'Rent' then 'Alugada'
           when dm.person_home_ownership = 'Mortgage' then 'Hipotecada'
           when dm.person_home_ownership = 'Own' then 'Própria'
           when dm.person_home_ownership = 'Other' then 'Outro'
           ELSE dm.person_home_ownership
			end 	as situacao_moradia,
		dm.person_emp_length as tempo_trabalho,
		-- dados emprestimos
		/*loan_intent -> motivo_emprestimo*/
        case
           when e.loan_intent = 'Personal' then 'Pessoal'
           when e.loan_intent = 'Education' then 'Educativo'
           when e.loan_intent = 'Medical' then 'Médico'
           when e.loan_intent = 'Venture' then 'Empreendimento'
           when e.loan_intent = 'Homeimprovement' then 'Melhora do lar'
           when e.loan_intent = 'Debtconsolidation' then 'Pagamento de débitos'
           else e.loan_intent
			end		as motivo_emprestimo,
		e.loan_grade as pontuacao_emprestimo,
        e.loan_amnt as valor_emprestimo,
        e.loan_int_rate as taxa_juros,
        e.loan_status as inadimplencia,
        e.loan_percent_income as renda_percentual_emprestimo,
        -- dados historico de banco
        /*cb_person_default_on_file -> INADIMPLENTE */
		case
           when hb.cb_person_default_on_file = 'Y' then 1
           when hb.cb_person_default_on_file = 'N' then 0
           else hb.cb_person_default_on_file
			end		as devendo,
		hb.cb_person_cred_hist_length AS tempo_de_credito
	
-- realizando o FROM para captura de dados
from dados_mutuarios dm
			 inner join id id on id.person_id = dm.person_id
			 inner join emprestimos e on e.loan_id = id.loan_id
			 inner join historicos_banco hb on hb.cb_id = id.cb_id
	where dm.person_id != ''
	  and dm.person_age is not null
	  and dm.person_income is not null
	  and dm.person_home_ownership != ''
	  and dm.person_emp_length is not null
	  and hb.cb_person_default_on_file != ''
	  and hb.cb_person_cred_hist_length is not null
	  and e.loan_intent != ''
	  and e.loan_grade != ''
	  and e.loan_int_rate is not null
	  and e.loan_status is not null
	  and e.loan_percent_income is not null;