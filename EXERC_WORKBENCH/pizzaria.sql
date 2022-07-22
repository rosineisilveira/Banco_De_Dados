use BD

insert into clientes(endereco,cidade,dada_cadastro,nome)
values
	('rua dois','tr','2022-02-02','rosinei'),
    ('rua dois','to','2022-02-02','ro'),
    ('rua dois','to','2022-02-02','rosi'),
    ('rua dois','to','2022-02-02','r');
    
insert into formas_pagamentos(nome)
values
	('pix'),
    ('cartao'),
    ('dinheiro');

insert into tamanho_pizzas(valor,nome)
values
	(100,'grande'),
    (75,'media'),
    (50,'pequena');
drop table pizzas
insert into pizzas(id_tamanho,sabor)
values
	(1,'frango'),
    (1,'frango'),
    (1,'frango'),
    (1,'frango'),
    (1,'bacon'),
    (1,'calabreza'),
    (1,'calabresa'),
    (1,'calabresa'),
    (1,'coracao'),
    (1,'coracao');
    
    select * from pizzas
    
insert into pedidos(id_clientes,id_pag,valor_total)
values
	(1,1,150),
    (2,1,120),
    (2,1,110),
    (3,1,115),
    (1,1,135);
select * from pedidos
    
insert into pedidos_has_pizzas(id_pedido,id_pizza)
values
	(1,1),
    (1,2),
    (3,1),
    (2,3),
    (1,4),
    (5,1),
    (2,1);

delimiter //
create procedure update_preco_pedido(preco_total decimal,preco_desc decimal)
begin
	select valor_total from pedidos 
		where valor_total > preco_total;
                   update pedidos set valor_total = (valor_total - preco_desc)
                    WHERE valor_total > preco_total;
                 
	
END//
delimiter ;

call update_preco_pedido(50,10)

select *  from pedidos



















