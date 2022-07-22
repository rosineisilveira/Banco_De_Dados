use stored

insert into autores (nome,cpf)
 VALUES
 	('JOAO ANDRADE',12345698745),
    ('CARLOS',      12458569845),
    ('MARCELO',     12458569458),
    ('ANTONIO',     12458569858),
    ('ANA DA SILVA',12474789845),
    ('VICENTE',     18538569845),
    ('PEDRO',       12478569845),
    ('MARCOS',      17578569845),
    ('ANA PAULA',   12478569898);
    
select *from autores
    
insert into categoria (cod_cat,nome)
values
	(1,'ação');
    
insert into categoria (cod_cat,nome)
values
    (2,'misterio'), 
    (3,'terror'), 
    (4,'drama');
INSERT INTO livros (titulo,valor,cod_cat)
 VALUES
 	('BANCO DE DAOS DISTRIBUIDO'       ,150,2),
    ('PROGRAMANDO EM LINGUAGEM C'      ,130,2),
    ('PROGRAMANDO EM LINGUAGEM C++'    ,50,1),
    ('BANCO DE DADOS NA BIOINFORMATICA',30,3),
    ('BANCO RELACIONAL'                ,140,2),
    ('PROGRAMANDO EM JAVA'             ,90,1),
    ('PROGRAMANDO EM KOTLIN'           ,70,2),
    ('BANCO DE DADOS NA NUVEM'         ,45,1);   
    
select *from livros
ALTER TABLE livros DROP COLUMN data_lancamento
alter table livros add column data_lancamento date after cod_cat;
    
insert into autores_livros(cod_autor, lcod_livro)
 VALUES
 	(1,8),
    (2,5),
    (3,6),
    (4,4), 
    (4,1), 
    (6,2);
    
select *from autores_livros

 

delimiter //
create procedure cont(cat1 int,cat2 int)
BEGIN
		DECLARE totLivros1 integer;
	    DECLARE totLivros2 integer;
		DECLARE dif int;
		DECLARE mensagem1 varchar(100);
        DECLARE mensagem2 varchar(100);
		DECLARE mensagem3 varchar(100);
        
	    SET totLivros1 = (	SELECT Count(cod_livro) 
        FROM livros  
		WHERE cod_cat=cat1);
		
		SET totLivros2 = (	SELECT Count(cod_livro) 
		FROM	livros 
		WHERE 	cod_cat=cat2);
        

		IF totLivros1 > totLivros2 then
			SET dif = totLivros1 - totLivros2 ;
			   select   'O Número de livros '+ CAST(dif AS CHAR(2))+ 'da primeira CATEGORIA é maior';
               
		ELSEIF (totLivros1) < (totLivros2) then
				select  'O número de livros da segunda CATEGORIA é maior';
		ELSE
			    select  'O número de livros das categorias são iguais';
		END IF;
		  
END //
delimiter ;
 
 CALL cont(2,3)
 
delimiter //
CREATE PROCEDURE add_categoria(codigo int,categoria varchar(45))
BEGIN
	if exists(select *
			  from categoria 
					where cod_cat = codigo and nome = categoria) then
					select 'ja existe';
	else 
		insert into categoria (cod_cat,nome)
			values
				(codigo,categoria);
			
	end if;
    
END//
delimiter ;   
    
 call add_categoria(10,'te')   
    
 select *  from   categoria
    
delimiter //
CREATE PROCEDURE add_autor(n varchar(45),c varchar(11))
BEGIN
	if exists(select *
			  from autores 
					where cpf = c ) then
					select 'ja existe';
	else 
		insert into autores (nome,cpf)
			values
				(n,c);
			
	end if;
    
END//
delimiter ;

call add_autor('rafael', '12345698745')
    
select *  from autores

delimiter //
CREATE PROCEDURE add_livros(nome varchar(45),preco decimal,categoria int)
BEGIN
	if exists(select *
			  from livros 
					where titulo = nome ) then
					select 'ja existe';
	else 
		insert into livros (titulo,valor,cod_cat)
			values
				(nome,preco,categoria);
			
	end if;
    
END//
delimiter ;
    
call add_livros('BANCO',25,2)    
    
select * from livros 

delimiter //
CREATE PROCEDURE add_aut_lvs(autor int,livro int)
BEGIN
	if exists(select *
			  from autores_livros 
					where cod_autor = autor and lcod_livro = livro ) then
					select 'ja existe';
	else 
		insert into autores_livros(cod_autor,lcod_livro)
			values
				(autor,livro);
			
	end if;
    
END//
delimiter ;   

call add_aut_lvs(1,3)
    
select * from autores_livros


delimiter //
CREATE PROCEDURE lista_livros_autor(busca varchar(11))
BEGIN
DECLARE totLivros int;
	if exists(select *
			  from autores 
					where cpf = busca ) then
		SET totLivros = (	SELECT Count(cod_livro) 
        FROM autores a
        inner join autores_livros al
        on a.cod_autor = al.cod_autor
        inner join livros l 
        on l.cod_livro = al.lcod_livro
        where a.cpf = busca
		group by a.cod_autor);
        select (totlivros);
			
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;
    
call lista_livros_autor(12478569898)

delimiter //
CREATE PROCEDURE update_data_livro(codigo int,data_l date)
BEGIN
	if exists(select *
			  from livros 
			  where cod_livro = codigo ) then
              update livros set data_lancamento = data_l
              where cod_livro = codigo;
             
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;

call update_data_livro(2,'2022-05-03')

select * from livros

delimiter //
CREATE PROCEDURE delete_livros(codigo int)
BEGIN
	if exists(select *
			  from livros 
					where cod_livro = codigo ) then
                    DELETE FROM livros
                    WHERE cod_livro  = codigo;
	else 
		select 'Não encontrado';
	end if;
END//
delimiter ;

call delete_livros(3)
select * from livros

delimiter //
CREATE PROCEDURE update_livro(codigo int,preco decimal)
BEGIN
	if exists(select *
			  from livros 
			  where cod_livro = codigo ) then
              update livros set valor = preco
              where cod_livro = codigo;
             
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;

delimiter //
CREATE PROCEDURE update_preco(editora int,preco int)
BEGIN
	if exists(select *
			  from  livros
			  where cod_cat = editora ) then
			update livros set valor = valor + ( (valor/100) * preco)
			where cod_cat = editora;
	else 
		select 'Não encontrado';
	end if;
    
END//
delimiter ;

call update_preco(2,10)

select * from livros


-- FUSP que inclua e autalize livros 

DELIMITER $$
CREATE PROCEDURE 
	crud_livros_proc(
		p_id int, 	
		p_titulo varchar(45),
        p_data_lancamento date,
        p_editora_id int, 
        p_assunto_id int,
        p_preco decimal(18,2))

begin


	insert into livros (titulo, data_lancamento, editora_id, assunto_id, preco)
		values (p_titulo, p_data_lancamento, p_editora_id, p_assunto_id, p_preco);
    
    select 'Livro inserido com sucesso';

    
END $$
DELIMITER ;

SELECT 
 TIMESTAMPDIFF(YEAR, '1951-09-30', NOW()) AS idade;

