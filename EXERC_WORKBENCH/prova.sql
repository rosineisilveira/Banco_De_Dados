use prova

insert into categorias(nome)
values
	('acao'),
    ('terror'),
    ('comedia'),
    ('romance');

insert into filmes(numero,titulo,qtd_exemplares,categorias_id_categoria)
values
	('100','velozes','1500',1),
    ('200','panico','2500',2),
    ('300','aloprado','500',3),
    ('400','aloprado2','5500',3),
    ('500','bela','1500',4);
    
insert into atores (nome,nome_real,data_nasc)
values
	('pit','brad pit','2000-02-02'),
    ('julia','robrt julia','2000-02-02'),
    ('angelina','julie angelina','2000-04-06'),
    ('tom','cruise','2000-09-02');
    
insert into atores_has_filmes(atores_id,filmes_id)
values
	(1,1),
    (3,2),
    (2,5),
    (4,3),
    (1,4);

insert into clientes (prenome,sobrenome)
values
	('roberto','andrade'),
    ('paulo','costa'),
    ('cassio','vila'),
    ('ramon','vilela'),
    ('antonio','rodrigues'),
    ('rosinei','silveira');
insert into clientes (prenome,sobrenome)
values
	('jose','andrade');
    
select * from clientes
    
insert into locacoes (loc_id_cliente)
values 
	(1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (6);
    
    
insert into locacoes_has_filmes (locacoes_id_loc,filmes_id_filmes)
values
	(1,4),
    (2,4),
    (3,4),
    (4,3),
    (5,2),
    (6,3),
    (7,4);
   
select f.titulo,c.nome 
from categorias c
inner join filmes f
on f.categorias_id_categoria = c.id_categoria

select count(id_filmes),c.nome 
from categorias c
inner join filmes f
on f.categorias_id_categoria = c.id_categoria
group by id_categoria

select c.prenome,f.titulo
from clientes c
	left join locacoes l
    on l.loc_id_cliente = c.id_clientes
    left join locacoes_has_filmes lf
    on lf.locacoes_id_loc = l.id_loc
    left join filmes f
    on f.id_filmes = lf.filmes_id_filmes


select f.titulo,l.id_loc
from filmes f
left join locacoes_has_filmes lf
on lf.filmes_id_filmes = f.id_filmes
left join locacoes l
on l.id_loc = lf.locacoes_id_loc
--limit 1

create view consulta_view
as 
select f.titulo,l.id_loc
from filmes f
left join locacoes_has_filmes lf
on lf.filmes_id_filmes = f.id_filmes
left join locacoes l
on l.id_loc = lf.locacoes_id_loc

select distinct titulo as filme_locado
from consulta_view
where id_loc is not null

select distinct titulo as filme_nao_locado
from consulta_view
where id_loc is  null

select



    