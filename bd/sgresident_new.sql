-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 06:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgresident`
--

-- --------------------------------------------------------

--
-- Table structure for table `domicilio`
--

CREATE TABLE `domicilio` (
  `CALLE` varchar(50) NOT NULL,
  `NO_CASA` int(11) NOT NULL,
  `VIALIDAD_1` varchar(50) NOT NULL,
  `VIALIDAD_2` varchar(50) NOT NULL,
  `REFERENCIAS` varchar(50) DEFAULT NULL,
  `ID_TITULAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `domicilio`
--

INSERT INTO `domicilio` (`CALLE`, `NO_CASA`, `VIALIDAD_1`, `VIALIDAD_2`, `REFERENCIAS`, `ID_TITULAR`) VALUES
('Boulevard Marcelino Barragan', 252, 'Calle Pedrito Sola', 'Calle Paty Cantu', 'Vive en la escuela', 3),
('Fray Antonio de Segovia', 713, 'COLORES', 'CAMICHINES', 'Casa amarilla', 1),
('Ruben Romero', 225, 'Miguel Hidalgo', 'Sor Juana Ines de la Cruz', 'Casa verde', 2);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usuario` varchar(20) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `respuesta` varchar(15) DEFAULT NULL,
  `tipo_usuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`usuario`, `contrasena`, `respuesta`, `tipo_usuario`) VALUES
('root', '3488e28acfe4abe097e1f4d501d4b49a', 'sgresident', 'ADMINISTRADOR'),
('Pablito', 'f26cea7ff09c4e1e6b094844ed4d1c8d', 'sgresident', 'USUARIO');

-- --------------------------------------------------------

--
-- Table structure for table `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `TIPO` varchar(20) NOT NULL,
  `NO_CUENTA` varchar(20) DEFAULT NULL,
  `NO_CHEQUE` varchar(20) DEFAULT NULL,
  `NO_TARJETA` varchar(20) DEFAULT NULL,
  `COD_TARJETA` varchar(7) DEFAULT NULL,
  `FCHA_EXP` varchar(8) DEFAULT NULL,
  `NO_TRANSFERENCIA` varchar(20) DEFAULT NULL,
  `ID_PAGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metodo_pago`
--

INSERT INTO `metodo_pago` (`TIPO`, `NO_CUENTA`, `NO_CHEQUE`, `NO_TARJETA`, `COD_TARJETA`, `FCHA_EXP`, `NO_TRANSFERENCIA`, `ID_PAGO`) VALUES
('Cheque', NULL, NULL, NULL, NULL, NULL, NULL, 3),
('Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('Tarejta de Credito', NULL, NULL, '4000 00012 3456 7899', '9898', '12/22', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `ID_PAGO` int(11) NOT NULL,
  `MES` varchar(20) NOT NULL,
  `MONTO` decimal(6,2) DEFAULT 320.00,
  `RECIBIDO` decimal(6,2) DEFAULT NULL,
  `FCHA_PAGO` timestamp NOT NULL DEFAULT current_timestamp(),
  `NOM_PAGADOR` varchar(50) DEFAULT NULL,
  `PAG_APELL_1` varchar(50) DEFAULT NULL,
  `PAG_APELL_2` varchar(50) DEFAULT NULL,
  `ADEUDO` bit(1) DEFAULT b'0',
  `INACTIVO` bit(1) DEFAULT b'0',
  `ID_TITULAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pago`
--

INSERT INTO `pago` (`ID_PAGO`, `MES`, `MONTO`, `RECIBIDO`, `FCHA_PAGO`, `NOM_PAGADOR`, `PAG_APELL_1`, `PAG_APELL_2`, `ADEUDO`, `INACTIVO`, `ID_TITULAR`) VALUES
(1, 'Octubre', 320.00, 320.00, '2023-04-28 07:21:08', 'Camila', 'Cabello', NULL, b'0', b'0', 1),
(2, 'Octubre', 320.00, 350.00, '2023-04-28 07:21:08', 'Stephen', 'Hawking', 'Gutierrez', b'0', b'0', 2),
(3, 'Octubre', 350.00, 320.00, '2023-04-28 07:21:08', 'Andres', 'Lopez', 'Obrador', b'0', b'0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `titular`
--

CREATE TABLE `titular` (
  `ID_TITULAR` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `PR_APELL` varchar(50) NOT NULL,
  `SEG_APELL` varchar(50) NOT NULL,
  `SEXO` varchar(1) DEFAULT NULL,
  `EDAD` int(11) NOT NULL,
  `CELULAR` varchar(25) DEFAULT NULL,
  `TEL_CASA` varchar(25) DEFAULT NULL,
  `INACTIVO` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titular`
--

INSERT INTO `titular` (`ID_TITULAR`, `NOMBRE`, `PR_APELL`, `SEG_APELL`, `SEXO`, `EDAD`, `CELULAR`, `TEL_CASA`, `INACTIVO`) VALUES
(1, 'Valeria', 'Gonzalez', 'Segura', 'M', 20, '3531040025', NULL, b'0'),
(2, 'Diego Tristán', 'Dominguez', 'Dueñas', 'H', 20, '3531040056', '3256142205', b'0'),
(3, 'Samir', 'Algo', 'Algo', 'H', 20, '3531040514', '5426125523', b'0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`CALLE`,`NO_CASA`),
  ADD KEY `FK_DOM_DEL` (`ID_TITULAR`);

--
-- Indexes for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`TIPO`,`ID_PAGO`),
  ADD KEY `FK_METPAGO_DEL` (`ID_PAGO`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_PAGO`),
  ADD KEY `FKPago` (`ID_TITULAR`);

--
-- Indexes for table `titular`
--
ALTER TABLE `titular`
  ADD PRIMARY KEY (`ID_TITULAR`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_PAGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `titular`
--
ALTER TABLE `titular`
  MODIFY `ID_TITULAR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FK_DOM_DEL` FOREIGN KEY (`ID_TITULAR`) REFERENCES `titular` (`ID_TITULAR`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD CONSTRAINT `FK_METPAGO_DEL` FOREIGN KEY (`ID_PAGO`) REFERENCES `pago` (`ID_PAGO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `FKPago` FOREIGN KEY (`ID_TITULAR`) REFERENCES `titular` (`ID_TITULAR`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
