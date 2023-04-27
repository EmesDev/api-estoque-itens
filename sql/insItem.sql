CREATE DEFINER=`root`@`localhost` PROCEDURE `insItem`( IN itemNome varchar(45), IN itemDescricao varchar(45), IN itemQuantidade INT(10), IN itemStatus varchar(45))
BEGIN

	set @id := (Select Max( idItem ) From itens) ;
	insert into `itens` values (@id + 1, itemNome, itemDescricao, itemQuantidade, itemStatus);
END