use exercicio02
INSERT INTO cidades(nome,uf)
 VALUES
 	('Terra de Areia','RS'),
    ('Capão da canoa','RS'),
    ('Florianópolis','SC'),
    ('Curitiba','PR'),
    ('Sao Paulo','sp');
    
 insert into categorias(nome,descricao)
 values
	('banco de dados','armazenamento'),
    ('desenv.web','sites'),
    ('programacao','codigos'),
    ('seguranca','antivirus'),
    ('mobile','aplicativos');
    
insert into clientes(nome,endereco,cod_cidade)
values
	('pedro','rua osorio',01),
    ('joao','rua treze de abril',02),
    ('marcia','rua catavento',03),
    ('ana','rua nascimento',04),
    ('paula','rua grande',02);
    
insert into autores(nome,cod_cidade)
values
	('cassio',01),
    ('ramon',02),
    ('vinicios',03),
    ('antonio',04),
    ('marcelo',05);
    
insert into livros(titulo,n_folhas,editora,valor,cod_autor,cod_cat)
values
	('banco de dados power',250,'abril',250,01,01),
    ('sesenvolvimento web',250,'abril',500,03,02),
    ('android',220,'abril',240,04,05),
    ('ataque hacker',250,'abril',350,02,04),
    ('algoritimos',450,'abril',450,05,03);
    
insert into vendas(quantidade,data,cod_livro,cod_clientes)
values
	(01,'2021-03-05',02,01),
    (03,'2021-04-09',05,04),
    (05,'2021-07-15',03,05),
    (07,'2021-08-25',04,03),
    (09,'2021-04-05',01,02);
    
 select
	sum(quantidade) as total_de_vendas
    from vendas

select l.titulo,l.valor,c.nome as nome_da_categoria
from categorias c
	inner join livros l 
    on c.cod_cat = l.cod_cat
    where c.nome ='banco de dados'
    
select l.titulo,a.nome as autor,c.nome as cliente,cid.nome as cidade,cid.uf
from autores a
	inner join livros l
    on a.cod_autor = l.cod_autor
	inner join vendas v
    on l.cod_livro = v.cod_livro
    inner join clientes c
    on c.cod_clientes = v.cod_clientes
    inner join cidades cid
    on cid.cod_cidade = c.cod_cidade
    where l.valor >300
    
select c.nome,l.titulo 
	from livros l 
	inner join vendas v
	on l.cod_livro = v.cod_livro
	inner join clientes c
	on c.cod_clientes = v.cod_clientes
    
select l.titulo,a.nome as autor ,count(v.cod_livro),v.quantidade
from vendas v
	inner join livros l
    on v.cod_livro = l.cod_livro
    inner join autores a
	on a.cod_autor = l.cod_autor
    where v.data between '2021-03-01' and '2021-03-31'
    group by v.quantidade
    order by v.quantidade
    limit 5
    
   
    
SELECT quantidade, COUNT(cod_livro)
FROM vendas
GROUP BY quantidade

select c.nome,l.titulo
from clientes c
	inner join vendas v
    on c.cod_clientes = v.cod_clientes
    inner join livros l
    on l.cod_livro = v.cod_livro
    where l.titulo = 'banco de dados power'
    
    
    
    
    
    
    
    
    
    