use ecommerce;
show tables;

select * from produto;
select * from usuario;
select * from itens_pedido;
select * from pedido;



select * from pedido;

create table if not exists pedido(
	codigo int not null auto_increment primary key,
    id_cliente int not null,
	data varchar(20),
    hora varchar(20),
    observacao varchar(100),    
    foreign key(id_cliente)
    references usuario(CodUsuario)	
);
create table if not exists pedidoDetalhes(
	codigo int not null auto_increment primary key,
    id_produto int not null,
    id_pedido int not null,
	quantidade int,
    hora varchar(20),  
    foreign key(id_produto)
    references produto(CodProduto),
    foreign key (id_pedido)
    references pedido(codigo)
);
show tables;
drop table pedidoDetalhes;

alter table pedido
add  estado varchar(50);

desc itens_pedido;
alter table itens_pedido
add data date;

alter table pedidodetalhes
rename itens_pedido;
-- -------------------------------------------
desc pedido;
select * from pedido;
insert into pedido
values
(default, 1, now(), "Observacao", "Pendente");


INSERT INTO `itens_pedido` ( `id_produto`, `id_pedido`, `quantidade`, `hora`, `data`) 
VALUES 
("1", "1", "3", current_time, current_date()),
("1", "2", "3", current_time, current_date()),
("1", "3", "3", current_time, current_date()),
("1", "4", "3", current_time, current_date()),
("1", "5", "3", current_time, current_date()),
("1", "6", "3", current_time, current_date()),
("1", "7", "3", current_time, current_date()),
("1", "8", "3", current_time, current_date()),
("1", "9", "3", current_time, current_date()),
("1", "2", "3", current_time, current_date()),
("1", "3", "3", current_time, current_date());

insert into pedido
values
(default, "3", current_date(), "", "Pendente"),
(default, "4", current_date(), "", "Pendente"),
(default, "5", current_date(), "", "Pendente"),
(default, "6", current_date(), "", "Pendente"),
(default, "7", current_date(), "", "Pendente"),
(default, "8", current_date(), "", "Pendente"),
(default, "9", current_date(), "", "Pendente");

SELECT current_time();
select * from produto;
desc itens_pedido;

select produto.codProduto, produto.nome, produto.descricao, produto.codigo, produto.preco, produto.categoria, produto.imagem,
	itens_pedido.quantidade, itens_pedido.data, itens_pedido.hora
    from produto
    inner join itens_pedido
    on produto.codProduto = itens_pedido.id_produto;
    



-- -----------------------------------------
select produto.codProduto, produto.nome, produto.descricao, produto.codigo, produto.preco, produto.categoria, produto.imagem,
	itens_pedido.quantidade, itens_pedido.data, itens_pedido.hora,
    pedido.estado
    from itens_pedido
    inner join produto
    on produto.codProduto = itens_pedido.id_produto
    inner join pedido
    on itens_pedido.id_pedido = pedido.codigo;

-- Inner Join com o usuario
select produto.codProduto, produto.nome, produto.descricao, produto.codigo, produto.preco, produto.categoria,
	itens_pedido.quantidade, itens_pedido.data, itens_pedido.hora,
    pedido.estado,
    usuario.Nome, usuario.CodUsuario
    from itens_pedido
    inner join produto
    on produto.codProduto = itens_pedido.id_produto
    inner join pedido
    on itens_pedido.id_pedido = pedido.codigo
    inner join usuario
    on pedido.id_cliente = usuario.CodUsuario;
    
    
    
    
    
    
    
    
select produto.codProduto, produto.nome, produto.descricao, produto.preco, produto.categoria,
	itens_pedido.quantidade, itens_pedido.data, itens_pedido.hora
    from itens_pedido
    inner join produto
    on produto.codProduto = itens_pedido.id_produto
    inner join pedido
    on itens_pedido.id_pedido = pedido.codigo	
    inner join usuario
    on pedido.id_cliente = usuario.CodUsuario
    where usuario.CodUsuario = "1" and pedido.estado = "Pendente";
    
    
    
    
    select * from pedido;
    
    select * from itens_pedido;
    delete from itens_pedido where codigo = 3;
    
    
    UPDATE `ecommerce`.`pedido`
    SET `estado` = 'Feito'
    WHERE `codigo` = '1'
    and id_cliente = '1';

    UPDATE `ecommerce`.`pedido`
    SET `estado` = 'Pendente'
    WHERE `codigo` = 1
    and id_cliente = '1';
    
    select max(codigo) from pedido
    where id_cliente = 1 and estado = 'Pendente';
    
    select * from pedido;	
    
    INSERT INTO `ecommerce`.`pedido` (`id_cliente`, `data`, `estado`) VALUES ('1', '2023-05-28', 'Pendente');
    
    
    select max(codigo) from pedido where id_cliente = '1' and estado = 'Pendente';