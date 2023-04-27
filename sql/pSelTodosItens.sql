CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelTodosItens`()
BEGIN
	SELECT * FROM `itens`;
END