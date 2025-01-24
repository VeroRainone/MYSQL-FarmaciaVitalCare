-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacia_vitalcare
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_precios`
--

DROP TABLE IF EXISTS `auditoria_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precios` (
  `Id_auditoria` int NOT NULL AUTO_INCREMENT,
  `Id_medicamento` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Precio_Anterior` decimal(10,2) NOT NULL,
  `Precio_Nuevo` decimal(10,2) NOT NULL,
  `Fecha_Cambio` datetime NOT NULL,
  PRIMARY KEY (`Id_auditoria`),
  KEY `Id_medicamento` (`Id_medicamento`),
  CONSTRAINT `auditoria_precios_ibfk_1` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precios`
--

LOCK TABLES `auditoria_precios` WRITE;
/*!40000 ALTER TABLE `auditoria_precios` DISABLE KEYS */;
INSERT INTO `auditoria_precios` VALUES (1,1,'Paracetamol',10.00,50.00,'2025-01-22 11:52:51');
/*!40000 ALTER TABLE `auditoria_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `Id_categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Analgesicos'),(2,'Antibioticos'),(3,'Antiacidos'),(4,'Antihistaminicos'),(5,'Broncodilatadores'),(6,'Antidiarreicos'),(7,'Antiparasitarios'),(8,'Suplementos vitaminicos'),(9,'Anticolesterolemicos'),(10,'Antihipertensivos'),(11,'AntidiabÃ©ticos'),(12,'Antivirales'),(13,'Anticonvulsivos'),(14,'Hormonas'),(15,'Descongestionantes');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Id_cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Direccion` varchar(250) DEFAULT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan',' Perez','Calle 123','15876655','juanperez@mail.com'),(2,'Maria',' Garcia','Calle 456','11765544','mariagarcia@mail.com'),(3,'Pedro',' Fernandez','Avenida 789','15654433','pedrofernandez@mail.com'),(4,'Ana',' Sanchez','Calle 101','15543322','anasanchez@mail.com'),(5,'Luis',' Rodriguez','Carretera 202','11432211','luisrodriguez@mail.com'),(6,'Maria',' Gonzalez','Avenida Central 45','11456701','mariagonzalez@mail.com  '),(7,'Carlos',' Perez','Calle Luna 12','11236789','carlosperez@mail.com  '),(8,'Sofia',' Ramirez','Barrio Las Flores 89','11396543','sofiaramirez@mail.com  '),(9,'Juan',' Martinez','Plaza Mayor 7','11412334','juanmartinez@mail.com  '),(10,'Ana',' Lopez','Paseo del RÃ­o 33','11223344','analopez@mail.com  '),(11,'Pedro',' Garcia','CallejÃ³n del Sol 15','11456778','pedrogarcia@mail.com  '),(12,'Laura',' Torres','Boulevard Norte 50','11334556','lauratorres@mail.com  '),(13,'Diego',' Sanchez','Calle Victoria 22','11478990','diegosanchez@mail.com  '),(14,'Elena',' Morales','Carretera Sur 99','11267889','elenamorales@mail.com  '),(15,'Andres',' Herrera','Parque Central 3','11321445','andresherrera@mail.com  ');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosis`
--

DROP TABLE IF EXISTS `dosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosis` (
  `Id_dosis` int NOT NULL AUTO_INCREMENT,
  `Cantidad` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_dosis`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosis`
--

LOCK TABLES `dosis` WRITE;
/*!40000 ALTER TABLE `dosis` DISABLE KEYS */;
INSERT INTO `dosis` VALUES (1,'5 mg'),(2,'10 mg'),(3,'20 mg'),(4,'50 mg'),(5,'100 mg'),(6,'250 mg'),(7,'500 mg'),(8,'1 g'),(9,'5 ml'),(10,'10 ml'),(11,'15 ml'),(12,'20 ml'),(13,'25 ml'),(14,'30 ml'),(15,'50 ml');
/*!40000 ALTER TABLE `dosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Id_empleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Puesto` varchar(100) DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  PRIMARY KEY (`Id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Carlos','Gomez','cgomez@mail.com','12334455','Gerente',35000),(2,'Ana','Lopez','alopez@mail.com','13445566','Farmaceutica',25000),(3,'Luis','Martinez','lmartinez@mail.com','14556677','Contador',28000),(4,'Laura','Perez','lpeerez@mail.com','15667788','Asistente',20000),(5,'Pedro','Suarez','psuarez@mail.com','11778899','Vendedor',18000),(6,'MarÃ­a','Lopez','mlopez@mail.com','11541987','Cajera',16500),(7,'Carlos','Fernandez','cfernandez@mail.com','11473290','Supervisor',24000),(8,'Ana','Gomez','agomez@mail.com','11198765','Vendedor',18000),(9,'Diego','Ramirez','dramirez@mail.com','11445566','Reponedor',15000),(10,'Laura','Martinez','lmartinez@mail.com','11876543','Cajera',17000),(11,'Sofia','Romero','sromero@mail.com','11788990','Gerente',32000),(12,'Juan','Gonzalez','jgonzalez@mail.com','11988776','Vendedor',18500),(13,'Andres','Torres','atorres@mail.com','11677889','Supervisor',25000),(14,'Elena','Perez','eperez@mail.com','11244665','Cajera',16000),(15,'Ricardo','Morales','rmorales@mail.com','11122334','Reponedor',15500);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaspago`
--

DROP TABLE IF EXISTS `formaspago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formaspago` (
  `Id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaspago`
--

LOCK TABLES `formaspago` WRITE;
/*!40000 ALTER TABLE `formaspago` DISABLE KEYS */;
INSERT INTO `formaspago` VALUES (1,'Efectivo'),(2,'Tarjeta de credito'),(3,'Transferencia bancaria');
/*!40000 ALTER TABLE `formaspago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorios`
--

DROP TABLE IF EXISTS `laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorios` (
  `Id_laboratorio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(250) DEFAULT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorios`
--

LOCK TABLES `laboratorios` WRITE;
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
INSERT INTO `laboratorios` VALUES (1,'Bayer','Santa Fe 123','12334455','bayer@mail.com'),(2,'Novartis','Avenida 456','23445566','novartis@mail.com'),(3,'Sandoz','Calle 789','34556677','sandoz@mail.com'),(4,'GlaxoSmithKline','Calle 21 1000','45667788','gsk@mail.com'),(5,'Merck','Sarmiento 214','56778899','merck@mail.com');
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `Id_medicamento` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`Id_medicamento`),
  KEY `Id_categoria` (`Id_categoria`),
  CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`Id_categoria`) REFERENCES `categorias` (`Id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Paracetamol','2025-12-31',50,98,1),(2,'Ibuprofeno','2024-06-30',12,150,1),(3,'Aspirina','2025-03-15',8,200,1),(4,'Amoxicilina','2027-09-10',15,120,2),(5,'Azitromicina','2026-01-05',25,80,2),(6,'Omeprazol','2027-04-20',18,90,3),(7,'Loratadina','2026-11-25',14.5,70,4),(8,'Clorfenamina','2026-07-18',9,60,4),(9,'Dipirona','2025-05-10',7.5,140,1),(10,'Cetirizina','2026-08-30',13,65,4),(11,'Salbutamol','2024-09-12',20,110,5),(12,'Budesonida','2027-12-30',30,50,5),(13,'Loperamida','2026-02-28',6.5,95,6),(14,'Metronidazol','2025-06-15',11,85,7),(15,'Diclofenaco','2026-10-30',10,180,1),(16,'Naproxeno','2027-03-25',15,160,1),(17,'Vitamina C','2025-08-20',5,300,8),(18,'Vitamina D','2024-01-10',12,250,8),(19,'Hierro','2026-09-15',18,100,8),(20,'Simvastatina','2025-04-12',22,70,9),(21,'Atorvastatina','2026-07-08',25,65,9),(22,'Losartan','2027-11-10',20,90,10),(23,'Captopril','2025-12-05',15.5,110,10),(24,'Metformina','2027-02-25',12,130,11),(25,'Insulina','2026-03-30',35,50,11),(26,'Aciclovir','2025-01-15',18,75,12),(27,'Clotrimazol','2026-05-18',22,90,12),(28,'Ibuprofeno Infantil','2027-08-30',8.5,120,1),(29,'Amoxicilina Infantil','2026-04-10',12,80,2),(30,'Dexametasona','2025-09-12',15,60,5),(31,'Prednisona','2027-11-15',12.5,45,5),(32,'Albendazol','2025-02-20',9,130,7),(33,'Mebendazol','2026-06-25',7.5,140,7),(34,'Enalapril','2024-07-05',14.5,95,10),(35,'Amlodipino','2026-10-12',19,80,10),(36,'Carbamazepina','2025-05-18',22,40,13),(37,'Valproato','2026-01-22',28,35,13),(38,'Clonazepam','2025-12-11',18.5,50,13),(39,'Diazepam','2027-04-10',15,60,13),(40,'Levotiroxina','2025-08-25',25,70,14),(41,'Tramadol','2026-02-12',30,55,1),(42,'Morfina','2025-12-22',50,20,1),(43,'Oximetazolina','2025-06-05',12,90,15),(44,'Xilometazolina','2027-08-30',14,85,15),(45,'Ambroxol','2025-01-30',11.5,100,5),(46,'Bromhexina','2026-12-18',10,110,5),(47,'Acetilcisteina','2026-10-12',20,75,5);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_dosis`
--

DROP TABLE IF EXISTS `medicamentos_dosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_dosis` (
  `Id_medicamento` int NOT NULL,
  `Id_dosis` int NOT NULL,
  PRIMARY KEY (`Id_medicamento`,`Id_dosis`),
  KEY `Id_dosis` (`Id_dosis`),
  CONSTRAINT `medicamentos_dosis_ibfk_1` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`),
  CONSTRAINT `medicamentos_dosis_ibfk_2` FOREIGN KEY (`Id_dosis`) REFERENCES `dosis` (`Id_dosis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_dosis`
--

LOCK TABLES `medicamentos_dosis` WRITE;
/*!40000 ALTER TABLE `medicamentos_dosis` DISABLE KEYS */;
INSERT INTO `medicamentos_dosis` VALUES (1,1),(9,1),(17,1),(30,1),(45,1),(1,2),(10,2),(17,2),(32,2),(46,2),(2,3),(9,3),(18,3),(31,3),(47,3),(2,4),(10,4),(18,4),(33,4),(3,5),(11,5),(19,5),(34,5),(3,6),(12,6),(20,6),(35,6),(4,7),(12,7),(21,7),(36,7),(4,8),(13,8),(22,8),(37,8),(5,9),(13,9),(23,9),(38,9),(5,10),(14,10),(24,10),(39,10),(6,11),(14,11),(25,11),(40,11),(6,12),(15,12),(26,12),(41,12),(7,13),(15,13),(27,13),(42,13),(7,14),(16,14),(28,14),(43,14),(8,15),(16,15),(29,15),(44,15);
/*!40000 ALTER TABLE `medicamentos_dosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_laboratorios`
--

DROP TABLE IF EXISTS `medicamentos_laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_laboratorios` (
  `Id_laboratorio` int NOT NULL,
  `Id_medicamento` int NOT NULL,
  PRIMARY KEY (`Id_medicamento`,`Id_laboratorio`),
  KEY `Id_laboratorio` (`Id_laboratorio`),
  CONSTRAINT `medicamentos_laboratorios_ibfk_1` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`),
  CONSTRAINT `medicamentos_laboratorios_ibfk_2` FOREIGN KEY (`Id_laboratorio`) REFERENCES `laboratorios` (`Id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_laboratorios`
--

LOCK TABLES `medicamentos_laboratorios` WRITE;
/*!40000 ALTER TABLE `medicamentos_laboratorios` DISABLE KEYS */;
INSERT INTO `medicamentos_laboratorios` VALUES (1,1),(1,2),(1,3),(1,4),(1,21),(1,22),(1,31),(1,32),(1,41),(1,46),(2,5),(2,6),(2,7),(2,8),(2,23),(2,24),(2,33),(2,34),(2,42),(2,47),(3,9),(3,10),(3,11),(3,12),(3,25),(3,26),(3,35),(3,36),(3,43),(4,13),(4,14),(4,15),(4,16),(4,27),(4,28),(4,37),(4,38),(4,44),(5,17),(5,18),(5,19),(5,20),(5,29),(5,30),(5,39),(5,40),(5,45);
/*!40000 ALTER TABLE `medicamentos_laboratorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_pedidos`
--

DROP TABLE IF EXISTS `medicamentos_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_pedidos` (
  `Id_pedido` int NOT NULL,
  `Id_medicamento` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`Id_pedido`,`Id_medicamento`),
  KEY `Id_medicamento` (`Id_medicamento`),
  CONSTRAINT `medicamentos_pedidos_ibfk_1` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`),
  CONSTRAINT `medicamentos_pedidos_ibfk_2` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_pedidos`
--

LOCK TABLES `medicamentos_pedidos` WRITE;
/*!40000 ALTER TABLE `medicamentos_pedidos` DISABLE KEYS */;
INSERT INTO `medicamentos_pedidos` VALUES (1,1,100,12.5),(1,2,50,10),(1,3,75,15),(2,4,60,8),(2,5,40,9.5),(3,1,80,11),(3,6,55,13),(3,7,90,12),(4,8,65,14.5),(4,9,45,10.5),(4,10,70,12),(5,11,35,9),(5,12,50,10),(5,13,60,8.5),(6,14,75,13.5),(6,15,80,15),(6,16,40,9),(7,17,45,11),(7,18,50,10),(8,19,55,14),(8,20,65,12),(9,21,70,13.5),(9,22,80,15.5),(10,23,35,8.5),(10,24,45,9.5),(10,25,60,10.5),(11,26,75,14),(11,27,40,9),(12,28,50,12.5),(13,29,55,13),(14,30,70,10),(15,31,45,11.5),(15,32,65,14),(16,33,75,12.5),(17,34,35,9.5),(18,35,50,10),(19,36,80,15),(20,37,60,12.5);
/*!40000 ALTER TABLE `medicamentos_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_presentaciones`
--

DROP TABLE IF EXISTS `medicamentos_presentaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_presentaciones` (
  `Id_medicamento` int NOT NULL,
  `Id_presentacion` int NOT NULL,
  PRIMARY KEY (`Id_medicamento`,`Id_presentacion`),
  KEY `Id_presentacion` (`Id_presentacion`),
  CONSTRAINT `medicamentos_presentaciones_ibfk_1` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`),
  CONSTRAINT `medicamentos_presentaciones_ibfk_2` FOREIGN KEY (`Id_presentacion`) REFERENCES `presentaciones` (`Id_presentacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_presentaciones`
--

LOCK TABLES `medicamentos_presentaciones` WRITE;
/*!40000 ALTER TABLE `medicamentos_presentaciones` DISABLE KEYS */;
INSERT INTO `medicamentos_presentaciones` VALUES (1,1),(10,1),(19,1),(28,1),(37,1),(46,1),(2,2),(11,2),(20,2),(29,2),(38,2),(47,2),(3,3),(12,3),(21,3),(30,3),(39,3),(4,4),(13,4),(22,4),(31,4),(40,4),(5,5),(14,5),(23,5),(32,5),(41,5),(6,6),(15,6),(24,6),(33,6),(42,6),(7,7),(16,7),(25,7),(34,7),(43,7),(8,8),(17,8),(26,8),(35,8),(44,8),(9,9),(18,9),(27,9),(36,9),(45,9);
/*!40000 ALTER TABLE `medicamentos_presentaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_ventas`
--

DROP TABLE IF EXISTS `medicamentos_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_ventas` (
  `Id_medicamento` int NOT NULL,
  `Id_venta` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`Id_medicamento`,`Id_venta`),
  KEY `Id_venta` (`Id_venta`),
  CONSTRAINT `medicamentos_ventas_ibfk_1` FOREIGN KEY (`Id_medicamento`) REFERENCES `medicamentos` (`Id_medicamento`),
  CONSTRAINT `medicamentos_ventas_ibfk_2` FOREIGN KEY (`Id_venta`) REFERENCES `ventas` (`Id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_ventas`
--

LOCK TABLES `medicamentos_ventas` WRITE;
/*!40000 ALTER TABLE `medicamentos_ventas` DISABLE KEYS */;
INSERT INTO `medicamentos_ventas` VALUES (1,1,20),(2,1,15),(3,1,8),(4,2,7),(5,2,24),(6,2,45),(7,3,9),(8,3,12),(9,4,31),(10,4,28),(11,5,52),(12,5,45),(13,6,45),(14,6,40),(15,7,35),(16,7,35),(17,8,45),(18,8,35),(19,9,30),(20,9,25),(21,10,20),(22,10,20),(23,11,30),(24,11,30),(25,12,25),(26,12,25),(27,13,20),(28,14,20),(29,14,20),(30,15,20),(31,15,15),(32,16,15),(33,17,15),(34,18,12),(35,19,10),(36,20,10),(37,20,5),(38,21,5),(39,21,5),(40,22,5),(41,23,5),(42,24,5),(43,24,5),(44,25,5),(45,25,5),(46,25,5),(47,25,5);
/*!40000 ALTER TABLE `medicamentos_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `Estado_pedido` varchar(50) DEFAULT NULL,
  `Id_forma_pago` int DEFAULT NULL,
  `Observaciones` text,
  `Id_laboratorio` int DEFAULT NULL,
  `Id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`Id_pedido`),
  KEY `Id_forma_pago` (`Id_forma_pago`),
  KEY `Id_laboratorio` (`Id_laboratorio`),
  KEY `Id_empleado` (`Id_empleado`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Id_forma_pago`) REFERENCES `formaspago` (`Id_forma_pago`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`Id_laboratorio`) REFERENCES `laboratorios` (`Id_laboratorio`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`Id_empleado`) REFERENCES `empleados` (`Id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-11-01','Procesando',1,'Pedido urgente',1,5),(2,'2024-11-02','Enviado',2,'Entrega en 3 dias',2,7),(3,'2024-11-03','Completado',1,'',3,9),(4,'2024-11-04','Cancelado',3,'Cliente cambio de opinion',4,6),(5,'2024-11-05','Procesando',2,'Entrega en tienda',5,8),(6,'2024-11-06','Enviado',1,'Revisar disponibilidad',1,10),(7,'2024-11-07','Completado',3,'Pedido para reposicion',2,11),(8,'2024-11-08','Cancelado',2,'Pago rechazado',3,13),(9,'2024-11-09','Procesando',1,'Agregar muestras gratuitas',4,12),(10,'2024-11-10','Enviado',3,'Entrega express',5,14),(11,'2024-11-11','Completado',2,'',1,15),(12,'2024-11-12','Cancelado',1,'Producto descontinuado',2,9),(13,'2024-11-13','Procesando',2,'Verificar precios',3,7),(14,'2024-11-14','Enviado',3,'Entrega parcial',4,6),(15,'2024-11-15','Completado',1,'Pedido recurrente',5,8),(16,'2024-11-16','Cancelado',2,'Error en la direccion',1,13),(17,'2024-11-17','Procesando',3,'Pendiente de confirmacion',2,10),(18,'2024-11-18','Enviado',1,'Pedido internacional',3,11),(19,'2024-11-19','Completado',2,'Descuento aplicado',4,12),(20,'2024-11-20','Cancelado',3,'Problema con el inventario',5,14);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentaciones`
--

DROP TABLE IF EXISTS `presentaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentaciones` (
  `Id_presentacion` int NOT NULL AUTO_INCREMENT,
  `Tipo_presentacion` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_presentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentaciones`
--

LOCK TABLES `presentaciones` WRITE;
/*!40000 ALTER TABLE `presentaciones` DISABLE KEYS */;
INSERT INTO `presentaciones` VALUES (1,'Comprimidos'),(2,'Jarabe'),(3,'Capsulas'),(4,'Inyeccion'),(5,'Crema'),(6,'Gel'),(7,'Gotas'),(8,'Polvo para solucion'),(9,'Parche transdermico');
/*!40000 ALTER TABLE `presentaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_estado_pedidos`
--

DROP TABLE IF EXISTS `v_estado_pedidos`;
/*!50001 DROP VIEW IF EXISTS `v_estado_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_estado_pedidos` AS SELECT 
 1 AS `Estado_pedido`,
 1 AS `Cantidad_Pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_laboratorios_pedidos`
--

DROP TABLE IF EXISTS `v_laboratorios_pedidos`;
/*!50001 DROP VIEW IF EXISTS `v_laboratorios_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_laboratorios_pedidos` AS SELECT 
 1 AS `Nombre_Laboratorio`,
 1 AS `Cantidad_Pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_medicamentos_laboratorios`
--

DROP TABLE IF EXISTS `v_medicamentos_laboratorios`;
/*!50001 DROP VIEW IF EXISTS `v_medicamentos_laboratorios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_medicamentos_laboratorios` AS SELECT 
 1 AS `Nombre_Medicamento`,
 1 AS `Nombre_Laboratorio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_medicamentos_stock_categorias`
--

DROP TABLE IF EXISTS `v_medicamentos_stock_categorias`;
/*!50001 DROP VIEW IF EXISTS `v_medicamentos_stock_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_medicamentos_stock_categorias` AS SELECT 
 1 AS `Nombre_Medicamento`,
 1 AS `Stock`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_medicamentos_ventas`
--

DROP TABLE IF EXISTS `v_medicamentos_ventas`;
/*!50001 DROP VIEW IF EXISTS `v_medicamentos_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_medicamentos_ventas` AS SELECT 
 1 AS `Nombre_Medicamento`,
 1 AS `Cantidad_vendida`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `Id_venta` int NOT NULL AUTO_INCREMENT,
  `Id_cliente` int DEFAULT NULL,
  `Id_empleado` int DEFAULT NULL,
  `Importe_total` double DEFAULT NULL,
  PRIMARY KEY (`Id_venta`),
  KEY `Id_cliente` (`Id_cliente`),
  KEY `Id_empleado` (`Id_empleado`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`Id_cliente`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`Id_empleado`) REFERENCES `empleados` (`Id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,5,320.5),(2,3,7,150.75),(3,2,9,450),(4,4,6,220.25),(5,5,8,310),(6,6,10,170),(7,7,11,380.5),(8,8,13,240),(9,9,12,125.75),(10,10,14,300),(11,11,15,410.25),(12,12,9,275.5),(13,13,7,500),(14,14,1,360.75),(15,15,8,150),(16,1,13,200.25),(17,2,10,310.75),(18,3,11,120),(19,4,5,400.5),(20,5,12,225),(21,6,6,320),(22,7,2,240.5),(23,8,3,180),(24,9,4,210.75),(25,10,4,390);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_estado_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `v_estado_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_estado_pedidos` AS select `pedidos`.`Estado_pedido` AS `Estado_pedido`,count(`pedidos`.`Id_pedido`) AS `Cantidad_Pedidos` from `pedidos` group by `pedidos`.`Estado_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_laboratorios_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `v_laboratorios_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_laboratorios_pedidos` AS select `l`.`Nombre` AS `Nombre_Laboratorio`,count(`p`.`Id_pedido`) AS `Cantidad_Pedidos` from (`laboratorios` `l` left join `pedidos` `p` on((`l`.`Id_laboratorio` = `p`.`Id_laboratorio`))) group by `l`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_medicamentos_laboratorios`
--

/*!50001 DROP VIEW IF EXISTS `v_medicamentos_laboratorios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_medicamentos_laboratorios` AS select `m`.`Nombre` AS `Nombre_Medicamento`,`l`.`Nombre` AS `Nombre_Laboratorio` from ((`medicamentos_laboratorios` `ml` join `medicamentos` `m` on((`ml`.`Id_medicamento` = `m`.`Id_medicamento`))) join `laboratorios` `l` on((`ml`.`Id_laboratorio` = `l`.`Id_laboratorio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_medicamentos_stock_categorias`
--

/*!50001 DROP VIEW IF EXISTS `v_medicamentos_stock_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_medicamentos_stock_categorias` AS select `m`.`Nombre` AS `Nombre_Medicamento`,`m`.`Stock` AS `Stock`,`c`.`Nombre` AS `Categoria` from (`medicamentos` `m` left join `categorias` `c` on((`m`.`Id_categoria` = `c`.`Id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_medicamentos_ventas`
--

/*!50001 DROP VIEW IF EXISTS `v_medicamentos_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_medicamentos_ventas` AS select `m`.`Nombre` AS `Nombre_Medicamento`,sum(`mv`.`Cantidad`) AS `Cantidad_vendida` from (`medicamentos_ventas` `mv` join `medicamentos` `m` on((`m`.`Id_medicamento` = `mv`.`Id_medicamento`))) group by `m`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 14:39:45
