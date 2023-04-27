CREATE DEFINER=`root`@`localhost` PROCEDURE `pUptStatusItem`(in itmStatus varchar(45),  in idItem int(10))
BEGIN
	UPDATE `itens` SET `itemStatus` = itmStatus WHERE `itens`.`idItem` = idItem;

END