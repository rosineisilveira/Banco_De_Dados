use Aula12

insert into pessoas(idpessoas,nome,sexo,data_nasc)
values(1,'rosinei','m','1984-11-01');

delimiter //
create procedure add_pessoas(id int,n varchar(45),s varchar(1), data_n date)
begin
	-- declare prox_id int;
    set id = (select max(idpessoas) +1 from pessoas);
    insert into pessoas(idpessoas,nome,sexo,data_nasc)
    values(id,n,s,data_n);

end//
delimiter ;

call add_pessoas(0 ,'fernanda','f','2017-02-25');

select * from pessoas



drop procedure if exists cont;


delimiter //
create procedure cont()
begin
declare masculino int;
declare feminino int ;
    
    set masculino = (select count(idpessoas)  from pessoas
					where sexo = 'm');
                    
	set feminino = (select count(idpessoas) from pessoas
					where sexo = 'f');
                    
	select masculino , feminino;
   
end//
delimiter ;

call cont()

delimiter //
create procedure maioridade()
begin
declare homen_maior_idade int;
declare homem_menor_idade int ;
declare mulher_maior_idade int;
declare mulher_menor_idade int ;

set homen_maior_idade  = (select count(idpessoas)  from pessoas
					where sexo = 'm' and (SELECT YEAR(CURRENT_TIMESTAMP) - year(data_nasc)>18) );
                    
set homem_menor_idade = (select count(idpessoas)  from pessoas
					where sexo = 'm' and (SELECT YEAR(CURRENT_TIMESTAMP) - year(data_nasc)<18) );
                    
set mulher_maior_idade = (select count(idpessoas)  from pessoas
					where sexo = 'f' and (SELECT YEAR(CURRENT_TIMESTAMP) - year(data_nasc)>18) );
                    
set mulher_menor_idade = (select count(idpessoas)  from pessoas
					where sexo = 'f' and (SELECT YEAR(CURRENT_TIMESTAMP) - year(data_nasc)<18) );					
				
select  homen_maior_idade , homem_menor_idade , mulher_maior_idade , mulher_menor_idade;                  
                    
end//
delimiter ;
 
call maioridade()

delimiter //
create procedure calcular(n1 decimal(9,2) ,n2 decimal(9,2))
begin
declare  somar decimal(9,2);
declare  subtrair  decimal(9,2);
declare  dividir decimal(9,2);
declare  multiplicar decimal(9,2) ;

	set somar       =  n1 + n2 ;
    set subtrair    =  n1 - n2 ;
    set dividir     =  n1 / n2 ;
    set multiplicar =  n1 * n2 ;
    
    select somar , subtrair ,  dividir , multiplicar ;
end//
delimiter ;

call calcular(8,3)












