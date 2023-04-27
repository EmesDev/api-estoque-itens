CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelQuatidadeEstoque`()
BEGIN
set @qts := (SELECT COUNT(*) FROM itens);

select @qts as quantidade;

END