CREATE DEFINER=`root`@`localhost` PROCEDURE `pUptQuantidadeItem`(in quantidade int(10), in idItem int(10))
BEGIN

UPDATE `itens` SET `itemQuantidade` = quantidade WHERE `itens`.`idItem` = idItem;


END