CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelQuatidadeStatus`()
BEGIN
	set @emEstoque := (SELECT COUNT(itemStatus) FROM itens WHERE itemStatus = 'Em Estoque');
    set @semEstoque :=  (SELECT COUNT(itemStatus) FROM itens WHERE itemStatus = 'Sem Estoque');
    
    SELECT @emEstoque AS 'emEstoque', @semEstoque AS 'semEstoque';


END