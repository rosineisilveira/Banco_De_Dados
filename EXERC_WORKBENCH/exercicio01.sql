use exercicio01

INSERT INTO cidades(nome,uf)
 VALUES
 	('Terra de Areia','RS'),
    ('Capão da canoa','RS'),
    ('Florianópolis','SC'),
    ('Curitiba','PR');
SELECT *
FROM cidades

INSERT into filiais(nome,endereco,cidades_cod_cid)
 VALUES
 	('f1','Rua um',3),
    ('f2','Rua dois',1),
    ('f3','Rua três',4),
    ('f4','Rua quatro',2);
SELECT *
FROM filiais

insert into empregados(nome,endereco,cidades_cod_cid,rg,cpf,salario,filiais_cod_filial)
 VALUES
 	('Samuel Reis','Rua azul',1,4088665846,01258944035,900.00,1),
    ('Maria Paula','Rua rosa',1,5298445965,12549566031,498.00,2),
    ('Samira Silva','Rua verde',3,9255665247,65978422564,990.00,3),
    ('Conrado Junior','Rua vermelha',4,5245894787,32546988546,700.00,4);
SELECT *
from empregados

INSERT INTO produtos(descricao,preco,nome_categoria,descricao_categoria)
 values 
	('Tv',3000.00,'televisores','smart tv led'),
    ('Radio',1000.00,'radio','radio portatil'),
    ('celular',2000.00,'telefone','telefones em geral'),
    ('Tv',2000.00,'televisores','smart tv lcd');
SELECT *
from produtos

INSERT into vendas(produtos_cod_produto,filiais_cod_filial)
 VALUES
 	(1,2),
    (2,3),
    (3,4),
    (4,1);
SELECT *
from vendas

select
	max(preco) as maior_preco
    from produtos
    


select p.cod_produto,p.descricao
from produtos p
inner join vendas v
on p.cod_produto = v.produtos_cod_produto
where filiais_cod_filial = 3

select e.cod_emp,e.nome,e.rg,e.salario,e.cidades_cod_cid,c.uf
from empregados e
	inner join cidades c
	on e.cidades_cod_cid = c.cod_cid
	where c.uf = "RS"
	and e.salario > 500


