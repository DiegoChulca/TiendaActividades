SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `tiendaactividades.php` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `tiendaactividades.php`;

DROP TABLE IF EXISTS `actividades`;
CREATE TABLE `actividades` (
  `idActividad` int NOT NULL,
  `descripcionActividad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `horarioActividad` time NOT NULL,
  `idAgenciaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `actividades` (`idActividad`, `descripcionActividad`, `horarioActividad`, `idAgenciaFK`) VALUES
(1, 'senderismo', '11:00:00', 1),
(2, 'Barranquismo', '12:00:00', 1);

DROP TABLE IF EXISTS `administradores`;
CREATE TABLE `administradores` (
  `idAdministrativo` int NOT NULL,
  `nivelOfficeAdministrativo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `atencionCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `administradores` (`idAdministrativo`, `nivelOfficeAdministrativo`, `atencionCliente`, `idEmpleadoFK`) VALUES
(1, 'Principiante', 'Asesoria online', 1),
(2, 'Básico', 'Asesoria telefónica', 2);

DROP TABLE IF EXISTS `agencia`;
CREATE TABLE `agencia` (
  `idAgencia` int NOT NULL,
  `direccionAgencia` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoAgencia` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `correoElectronicoAgencia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `agencia` (`idAgencia`, `direccionAgencia`, `telefonoAgencia`, `correoElectronicoAgencia`) VALUES
(1, 'Calle Carmelo 17', '687659345', 'agenciat@gmail.com');

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `primerApellidoCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `segundoApellidoCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `dniCliente` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionCliente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `correoCliente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `primerApellidoCliente`, `segundoApellidoCliente`, `dniCliente`, `direccionCliente`, `telefonoCliente`, `correoCliente`) VALUES
(1, 'Juan', 'Torres', 'Galván', '73164701E', 'Calle Moras 1', '667282483', 'jtg@gmail.com'),
(2, 'Oscar', 'Rico', 'Tello', '76547651A', 'Calle Pardo 7', '676892233', 'ort@gmail.com');

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `primerApellidoEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `segundoApellidoEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoEmpleado` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `idAgenciaFK` int NOT NULL,
  `idJefeFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `primerApellidoEmpleado`, `segundoApellidoEmpleado`, `telefonoEmpleado`, `idAgenciaFK`, `idJefeFK`) VALUES
(1, 'Alejandro', 'Pasamon', 'Bernal', '672597123', 1, 1),
(2, 'Jose', 'Santamaria', 'Ferreiro', '623455691', 1, 1);

DROP TABLE IF EXISTS `monitores`;
CREATE TABLE `monitores` (
  `idMonitor` int NOT NULL,
  `tituloEspecializado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `monitores` (`idMonitor`, `tituloEspecializado`, `idEmpleadoFK`) VALUES
(1, 'Monitor de senderismo', 1),
(2, 'Monitor de barranquismo', 2);

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `idReserva` int NOT NULL,
  `fechaReserva` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idActividadFK` int NOT NULL,
  `idClienteFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `reservas` (`idReserva`, `fechaReserva`, `idActividadFK`, `idClienteFK`) VALUES
(1, '2022/03/22', 1, 1),
(2, '2022/03/22', 2, 2);


ALTER TABLE `actividades`
  ADD PRIMARY KEY (`idActividad`),
  ADD KEY `idAgenciaFK` (`idAgenciaFK`);

ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idAdministrativo`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

ALTER TABLE `agencia`
  ADD PRIMARY KEY (`idAgencia`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idAgenciaFK` (`idAgenciaFK`),
  ADD KEY `idJefeFK` (`idJefeFK`);

ALTER TABLE `monitores`
  ADD PRIMARY KEY (`idMonitor`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idActividadFK` (`idActividadFK`),
  ADD KEY `idClienteFK` (`idClienteFK`);


ALTER TABLE `actividades`
  MODIFY `idActividad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `administradores`
  MODIFY `idAdministrativo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `agencia`
  MODIFY `idAgencia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `clientes`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `empleados`
  MODIFY `idEmpleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `monitores`
  MODIFY `idMonitor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `reservas`
  MODIFY `idReserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`idAgenciaFK`) REFERENCES `agencia` (`idAgencia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idAgenciaFK`) REFERENCES `agencia` (`idAgencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`idJefeFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `monitores`
  ADD CONSTRAINT `monitores_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idActividadFK`) REFERENCES `actividades` (`idActividad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;
USE `phpmyadmin`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
