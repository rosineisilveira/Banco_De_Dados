use Ap2
delimiter //
create procedure add_cliente( n varchar(45) ,ender varchar(45) )
begin
	insert into clientes(nome,endereco)
    values(n,ender);
end// 
delimiter ;

select * from clientes

call add_cliente('rosinei','rua 25')
call add_cliente('carlos','rua praia grande')
call add_cliente('rafael','rua principal')
call add_cliente('rodrigo','rua ')
call add_cliente('pedro','rua ')
call add_cliente('marcos','rua ')
call add_cliente('laura','rua ')

delimiter //
create procedure add_categoria( n varchar(45) )
begin
	insert into categorias(nome)
    values(n);
end// 
delimiter ;

select * from categorias

call add_categoria('casual')
call add_categoria('esporte')
call add_categoria('social')

delimiter //
create procedure add_produto( id int, n varchar(45),valor decimal(9,2) , est int )
begin
	insert into produtos(id_cat,nome,preco,estoque)
    values(id,n,valor,est);
end// 
delimiter ;

select * from produtos

call add_produto(1,'casaco',155,10)
call add_produto(1,'sapato',90,15)
call add_produto(2,'tenis',228,8)
call add_produto(2,'moleton',98,19)
call add_produto(3,'camisa',188,3)
call add_produto(3,'gravata',35,5)
call add_produto(3,'lenço',20.20,5)
call add_produto(2,'jaqueta',200,5)


delimiter //
create procedure add_vendedor( n varchar(45) )
begin
	insert into vendedores(nome)
    values(n);
end// 
delimiter ;

select * from vendedores

call add_vendedor('marcos')
call add_vendedor('marcia')
call add_vendedor('rodrigo')


delimiter //
create procedure add_pedido( id_cli int,id_ven int, data_com date,total decimal )
begin
	insert into pedidos(id_cliente,id_vendedor,data_compra,valor_total)
    values(id_cli,id_ven,data_com,total);
end// 
delimiter ;

select *from pedidos


call add_pedido(4,2,'2021-04-25',210.00)
call add_pedido(5,3,'2021-04-25',210.00)
call add_pedido(5,3,'2021-04-25',210.00)

delimiter //
create procedure add_pedidos_produto( pedido int,produto int, quant int )
begin
	insert into pedidos_produtos(id_ped,id_produto)
    values(pedido,produto);
end// 
delimiter ;

select *from pedidos_produtos

call add_pedidos_produto(1,4,)
call add_pedidos_produto(20,4,1)
call add_pedidos_produto(21,4,1)


-- aumentar preço de produto porcentagem

delimiter //
create procedure update_preco_produto(produto int,valor int)
begin
	if exists(select *
			  from  produtos
			  where id_produto = produto ) then
			update produtos set preco = preco +((preco/100) * valor)
            where id_produto = produto;
			
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;

call update_preco_produto(9,5)

-- deletar um produto

delimiter //
CREATE PROCEDURE delete_produto(codigo int)
BEGIN
	if exists(select *
			  from produtos 
					where id_produto = codigo ) then
                    DELETE FROM produtos
                    WHERE id_produto  = codigo;
	else 
		select 'Não encontrado';
	end if;
END//
delimiter ;

call delete_produto(10)

-- procedure para adicionar desconto em uma compra

delimiter //
create procedure desconto_compra(total decimal,preco_desc decimal)
begin
	select valor_total from pedidos 
		where valor_total > total;
		update pedidos set valor_total = (valor_total - preco_desc)
		where valor_total > total;
				
END//
delimiter ;


call desconto(170,10)

-- view  para pesquisar produtos que nao foram vendidos

create view produto_vendido
as 
select p.nome,pe.id_ped
from produtos p
left join pedidos_produtos pp
on pp.id_produto = p.id_produto
left join pedidos pe
on pe.id_ped = pp.id_ped

-- produtos nao vendidos

select  nome as nao_vendido
from produto_vendido
where id_ped is  null

-- view total de vendas de cada produto

create view produto_mais_vendido
as 
select count(pe.id_ped) as total,p.nome 
from produtos p
inner join pedidos_produtos pp
on pp.id_produto = p.id_produto
inner join pedidos pe
on pe.id_ped = pp.id_ped
group by p.id_produto
order by total desc


select distinct nome ,total as total_vendido
from produto_mais_vendido

-- view para pesquisar vendedores com mais vendas

create view vendedor_com_mais_venda
as 
select count(p.id_ped) as total,v.nome 
from pedidos p
inner join vendedores v
on p.id_vendedor = v.id_vendedor
group by v.id_vendedor
order by total desc

select distinct nome ,total as total_vendas
from vendedor_com_mais_venda

-- trigger adicionar desconto

drop trigger if exists tr_desconto_pagamento

delimiter //
create trigger tr_desconto_pagamento before insert 
on pedidos
for each row 
begin

	if (new.valor_total > 200) then 
	set new.valor_total_desconto = ( new.valor_total *0.90);
	
	end if;
end //
delimiter ;

-- trigger adicionar data ao inserir cliente

delimiter //
create trigger tr_add_data before insert 
on clientes
for each row 
begin
	set new.data_cadastro = now();
end //
delimiter ;


delimiter //

-- trigger adicionar bonificacao de venda

delimiter //
create trigger tr_bonificar before insert 
on pedidos
for each row 
begin
	update vendedores
	set bonificacao  = 10 + bonificacao
    where vendedores.id_vendedor = new.id_vendedor;
end //
delimiter ;





