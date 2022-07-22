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
call add_produto(2,'jaqueta',200.90,5)


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
create procedure add_pedido( id_cli int,id_ven int, data_com date )
begin
	insert into pedidos(id_cliente,id_vendedor,data_compra)
    values(id_cli,id_ven,data_com);
end// 
delimiter ;

select *from pedidos

call add_pedido(1,1,'2022-03-25')
call add_pedido(3,1,'2022-05-20')
call add_pedido(2,3,'2021-04-25')


delimiter //
create procedure add_pedidos_produto( pedido int,produto int )
begin
	insert into pedidos_produtos(id_ped,id_produto)
    values(pedido,produto);
end// 
delimiter ;

select *from pedidos_produtos

call add_pedidos_produto(1,2)
call add_pedidos_produto(2,1)
call add_pedidos_produto(3,3)

-- aumentar preço de produto porcentagem
delimiter //
create procedure update_preco_produto(produto int,valor decimal(9,2))
begin
	if exists(select *
			  from  produtos
			  where id_produto = produto ) then
			update produtos set preco = (preco + ( (preco/100) * valor))
            where id_produto = produto;
			
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;

call update_preco_produto(1,10)

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

call delete_produto(8)











