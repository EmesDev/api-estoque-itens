-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/04/2023 às 19:17
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_estoque`
--
CREATE DATABASE IF NOT EXISTS `db_estoque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_estoque`;

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pDelEstoqueItem` (IN `idItem` INT(10))   BEGIN
	DELETE FROM `estoque_itens` WHERE `estoque_itens`.`idItem` = idItem;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pInsEstoqueItem` (IN `itemNome` VARCHAR(45), IN `itemDescricao` VARCHAR(45), IN `itemQuantidade` INT(10), IN `itemStatus` VARCHAR(45))   BEGIN

	set @id := (Select Max( idItem ) From estoque_itens) ;
	insert into `estoque_itens` values ( @id + 1, itemNome, itemDescricao, itemQuantidade, itemStatus);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelQuatidadeEstoque` ()   BEGIN
set @qts := (SELECT COUNT(*) FROM `estoque_itens`);

select @qts as quantidade;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelQuatidadeStatus` ()   BEGIN
	set @emEstoque := (SELECT COUNT(itemStatus) FROM `estoque_itens` WHERE itemStatus = 'Em Estoque');
    set @semEstoque :=  (SELECT COUNT(itemStatus) FROM `estoque_itens` WHERE itemStatus = 'Sem Estoque');
    
    SELECT @emEstoque AS 'emEstoque', @semEstoque AS 'semEstoque';


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pSelTodosItens` ()   BEGIN
	SELECT * FROM `estoque_itens`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pUptQuantidadeItem` (IN `idItem` INT(10), IN `itemNome` VARCHAR(45), IN `itemDescricao` VARCHAR(45), IN `itemQuantidade` INT(10), IN `itemStatus` VARCHAR(45))   BEGIN

UPDATE `estoque_itens` SET `itemNome` = itemNome WHERE `estoque_itens`.`idItem` = idItem;
UPDATE `estoque_itens` SET `itemDescricao` = itemDescricao WHERE `estoque_itens`.`idItem` = idItem;
UPDATE `estoque_itens` SET `itemQuantidade` = itemQuantidade WHERE `estoque_itens`.`idItem` = idItem;
UPDATE `estoque_itens` SET `itemStatus` = itemStatus WHERE `estoque_itens`.`idItem` = idItem;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pUptStatusItem` (IN `itmStatus` VARCHAR(45), IN `idItem` INT(10))   BEGIN
	UPDATE `estoque_item` SET `itemStatus` = itmStatus WHERE `estoque_itens`.`idItem` = idItem;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_itens`
--

CREATE TABLE `estoque_itens` (
  `idItem` int(10) UNSIGNED NOT NULL,
  `itemNome` varchar(45) NOT NULL,
  `itemDescricao` varchar(45) NOT NULL,
  `itemQuantidade` int(11) NOT NULL,
  `itemStatus` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `estoque_itens`
--

INSERT INTO `estoque_itens` (`idItem`, `itemNome`, `itemDescricao`, `itemQuantidade`, `itemStatus`) VALUES
(1, 'Caixa d\'qua', 'azul', 0, 'Sem Estoque');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estoque_itens`
--
ALTER TABLE `estoque_itens`
  ADD PRIMARY KEY (`idItem`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
