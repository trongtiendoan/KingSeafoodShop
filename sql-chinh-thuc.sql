CREATE DATABASE  IF NOT EXISTS `pav_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `pav_shop`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: pav_shop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (2,'Hải sản cà mau','Haisancamau@gmail.com','0915767465'),(3,'Hải sản bạc liêu','Haisanbaclieu@gmail.com','0915999999'),(4,'Hải sản vũng tàu','Haisanvungtau@gmail.com','0915868565'),(5,'Hải sản nha trang','Haisannhatrang@gamil.com','0496586526'),(6,'Hải sản bình định','Haisanbinhdinh@gmail.com','0915636598'),(7,'Hải sản kiêng giang','Haisankienggiang@gmail.com','0945265869'),(8,'Hai sản phu quoc','Haisanphuquoc@gmail.com','0915732659'),(9,'Nông sản Việt','NongsanViet@gmail.com','0909258963');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tôm 1'),(2,'Cua'),(3,'Cá'),(4,'Mực'),(6,'Ốc'),(7,'Rau'),(8,'Củ'),(9,'Trái Cây'),(10,'Cầu Gai');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customerId` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('admin123','admin@gmail.com',_binary '','Tôi là admin','$2a$10$k.G4fI0RgEhHJ/N..t2.aeG7x3j85dmlDbT.pWS2fxUGLSg1ddnkS','','1',NULL),('dat123','tiendat150701@gmail.com',_binary '','Lê Trường An','$2a$10$Xt9dDzvJyZ/J5W2/3l4MNOayaCnXnina48BIxNefdDfH1qjmLOLZq','','0','2021-11-11 00:00:00.000000'),('dong123','huudong297@gmail.com',_binary '','Trần Hữu Đồng','$2a$10$IDE4k.qiCIsG9VyuNOg6xuwbXhVgUWxmL/.SfTlJDAkr9255d77aS','','0',NULL),('tiendat2001','datkieu2001@gmail.com',_binary '','Tien Dat','$2a$10$f5ESZNetsnCE/dY8H7zBr.GIxi/6LWedFLQAdanuc2OQ4ASZ2pz.S','','0','2021-12-02 00:00:00.000000'),('user1','user@gmail.com',_binary '','user1','$2a$10$SPtdBxlm6KlezNspMl4CJ.oI//T8KezTFTrOy/bYV7cvsFm7tosbe','','0',NULL),('user2','user2@gmail.com',_binary '','user2','$2a$10$EZ6Gfb81tiM5NW3LCgcCyeZH88MHCj7KbDuYUqZhWXNPu07Nm1/Yq','','0',NULL),('user3','user3@gmail.com',_binary '','user3','$2a$10$/u.ChRiSn3mib4AO420qZubfV0.vIF0vI2L/bvlgAAYP6klZfd6qW','','0',NULL),('user4','user4@gmail.com',_binary '','Tôi là user4','$2a$10$Jf7UNOWOZQOscFf2rMcAN.jnZts.XEGh0pikVhjlP/Eo7qd2co/86','','0','2021-09-08 18:31:23.670000'),('user5','user5@gmail.com',_binary '','Tôi là user5','$2a$10$j3HPDFAdIYg7Hw8JGO0DFunCJ8L58rFZfCQ8Y6QFH4rXn44prmIoa','','0','2021-09-08 00:00:00.000000'),('user6','user6@gmail.com',_binary '','user6','$2a$10$rtMtZVWN6qCLQam0.jCZDe1Bm/lB5MRlXzsk0C2uHUgnebSt7NOQW','','0','2021-09-09 00:00:00.000000');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetails` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`),
  KEY `FK3ohml2o6a85wh1nn65snnaind` (`orderId`),
  KEY `FK5pie1uapfd704usnm2loi3tex` (`productId`),
  CONSTRAINT `FK3ohml2o6a85wh1nn65snnaind` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `FK5pie1uapfd704usnm2loi3tex` FOREIGN KEY (`productId`) REFERENCES `products` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (2,NULL,460,1,'Đã Thanh Toán<3',368,2,2),(3,NULL,460,1,'Đã Thanh Toán<3',368,3,2),(4,NULL,650,1,'Đang Giao Dịch^^!',650,4,19),(5,NULL,650,1,'Đã Thanh Toán<3',585,5,11),(6,NULL,750,1,'Đã Thanh Toán<3',675,6,10),(7,NULL,650,1,'Đã Thanh Toán<3',585,7,5),(8,NULL,750,1,'Đang Chờ Xử Lý',675,8,7),(9,NULL,300,1,'Đang Chờ Xử Lý',300,8,25),(10,NULL,750,1,'Đang Chờ Xử Lý',600,8,13),(11,NULL,650,1,'Đang Chờ Xử Lý',585,9,11),(12,NULL,650,1,'Đang Chờ Xử Lý',585,10,5),(23,NULL,460,1,'Đang Chờ Xử Lý',368,11,2),(24,NULL,550,1,'Đang Chờ Xử Lý',522.5,11,8),(25,NULL,750,1,'Đang Chờ Xử Lý',675,11,10),(26,NULL,300,1,'Đã Thanh Toán<3',300,12,25),(27,NULL,650,1,'Đã Thanh Toán<3',585,12,11),(28,NULL,550,1,'Đã Thanh Toán<3',522.5,13,8),(29,NULL,460,1,'Đang Chờ Xử Lý',368,14,2),(30,NULL,750,1,'Đang Chờ Xử Lý',675,15,7),(31,NULL,650,1,'Đang Chờ Xử Lý',585,16,11),(32,NULL,750,1,'Đang Chờ Xử Lý',675,17,10),(33,NULL,750,1,'Đã Thanh Toán<3',600,17,13),(34,NULL,750,1,'Đang Chờ Xử Lý',675,18,7),(35,NULL,550,1,'Đang Chờ Xử Lý',522.5,19,8);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `requireDate` date DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `orderscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK1bpj2iini89gbon333nm7tvht` (`customerId`),
  CONSTRAINT `FK1bpj2iini89gbon333nm7tvht` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'TP. Hà Tĩnh',0,'Túi Xách','2021-09-08','0915767465','Trần Hữu Đồng',NULL,368,NULL,2,NULL),(2,'TP. Hà Tĩnh',0,'Túi Xách','2021-09-08','0915767465','Trần Hữu Đồng',NULL,368,NULL,2,NULL),(3,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-08','0915999999','Trần Hữu Đồng',NULL,368,NULL,2,NULL),(4,'266 Dũng sĩ Thanh Khê -  Đà Nẵng',0,'Demo mô tả','2021-09-08','0915999999','Nguyễn Ngọc Khánh',NULL,650,NULL,2,NULL),(5,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-08','0915999999','Trần Hoài Nam',NULL,585,'user5',2,NULL),(6,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-08','0915999999','Trần Hoài Nam',NULL,675,'user5',2,NULL),(7,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-08','0915999999','Trần Hữu Đồng',NULL,585,'dong123',2,NULL),(8,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-08','0915999999','Nguyễn Văn Tú',NULL,1575,'user2',2,NULL),(9,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-09','0915999999','Trần Hoài Nam',NULL,585,'user1',2,NULL),(10,'Tp.Huế',0,'Demo mô tả','2021-09-09','0915999999','Nguyễn Thanh Lam',NULL,585,'user6',2,NULL),(11,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-10','0915999999','Trần Hoài Nam',NULL,1565.5,'user2',2,NULL),(12,'Tp.Huế',0,'Demo mô tả','2021-09-10','0915767465','Nguyễn Thanh Lam',NULL,885,'user3',2,NULL),(13,'TP. Hà Tĩnh',0,'Demo mô tả','2021-09-10','0915767465','Nguyễn Văn Tú',NULL,522.5,'user4',NULL,NULL),(14,'TP. Cà Mau',0,'hello','2021-11-11','0945696835','kiều tiến đạt',NULL,368,'dat123',NULL,NULL),(15,'TP. Cà Mau',0,'hello','2021-11-11','0945696835','Kieu Tien Dat',NULL,675,'admin123',NULL,NULL),(16,'TP. Cà Mau',0,'helo các bạn','2021-11-17','0945696835','kiều tiến đạt',NULL,585,'dat123',NULL,NULL),(17,'quang trung',0,'giao nhanh nha','2021-11-23','0945696835','Leon',NULL,1275,'dat123',NULL,NULL),(18,'TP. Cà Mau',0,'hello','2021-12-02','0945696835','kiều tiến đạt',NULL,675,'dat123',2,NULL),(19,'TP. Cà Mau',0,'giao nhanh nha','2021-12-18','0945696835','kiều tiến đạt',NULL,522.5,'admin123',3,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(455) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FKh5l4pix4d0mc61aibdt3gj898` (`brandId`),
  KEY `FKej2ob3ifydf846t2a2tntna4e` (`categoryId`),
  CONSTRAINT `FKej2ob3ifydf846t2a2tntna4e` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryid`),
  CONSTRAINT `FKh5l4pix4d0mc61aibdt3gj898` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Tôm sú biển là loài tôm sú lớn sống ở vùng khơi xa và được đánh bắt trực tiếp nên nguồn cung với số lượng không nhiều, vì thế giá tôm sú biển cao hơn tôm sú nuôi. Tôm sú nhỏ gần đây được nuôi ở các đìa tôm ven biển, phổ biến nhất ở các tỉnh duyên hải miền trung, nhưng giá trị không bằng tôm sú biển. Tôm sú nhiều chất dinh dưỡng, rất ngon, thịt săn chắc, dễ chế biến và mang hương thơm đậm đà đặc trưng của biển.',20,'2021-09-15','Tomsu.jpg','Tôm sú biển',460,300,2,1),(5,'Tôm thẻ chân trắng là một dạng của tôm panđan của vùng đông Thái Bình Dương thường được đánh bắt hoặc nuôi làm thực phẩm. Tôm thẻ chân trắng là loài bản địa ở đông Thái Bình Dương từ Sonora ở México đến bắc Peru.',10,'2021-09-06','Tomthe.jpg','Tôm thẻ',650,300,2,1),(6,'Tôm bạc - loại tôm đất sống ở những vùng nước lợ, phân bố rộng tại Đông Nam Bộ. Tôm bạc có nhiều tên gọi như tôm đất, tôm bầu, tép bạc bông, tép đất. ',10,'2021-09-07','Tombac.jpg','Tôm bạc',500,200,2,1),(7,'Tôm càng xanh, còn được gọi là tôm sông khổng lồ hay tôm nước ngọt khổng lồ là một loài tôm thuộc họ Tôm gai quan trọng về mặt thương mại. Nó được tìm thấy ở khắp các khu vực nhiệt đới và cận nhiệt đới của khu vực Ấn Độ Dương - Thái Bình Dương, từ Ấn Độ đến Đông Nam Á và Bắc Úc',10,'2021-09-07','Tomcangxanh.jpg','Tôm càng xanh',750,299,2,1),(8,'Nhắc đến Tôm Hùm, chúng ta thường nghĩ đây là một món ăn đắt đỏ phổ biến nhất là trong các nhà hàng sang trọng. Tôm hùm được mệnh danh là vua của các loại hải sản chính bởi vì đẳng cấp dinh dưỡng mà chúng mang lại. Hiệp hội tim mạch Mỹ từng có nghiên cứu chỉ ra rằng, chất béo omega-3 có tác dụng ngăn ngừa bệnh tim, giảm huyết áp, phòng chống bệnh mãn tính và tăng cường năng lượng.',5,'2021-09-03','Tomhum.jpg','Tôm hùm',550,300,3,1),(9,'Họ Tôm he là một họ tôm mang cành. Họ này chứa nhiều loài tôm có tầm quan trọng kinh tế, chẳng hạn như tôm sú, tôm thẻ chân trắng, tôm thẻ trắng Đại Tây Dương và tôm he Ấn Độ. Xem thêm Chăn nuôi tôm để có thêm thông tin về việc chăn nuôi các loại tôm sú hay tôm thẻ',0,'2021-09-15','Tomhe.jpg','Tôm he',650,300,3,1),(10,'Điểm nhận diện của tôm sắt là có lớp vỏ dày, hơi cứng, có màu xanh đen đậm trên vỏ có các vân trắng nổi lên giữa các tốt. Cơ thể của tôm sắt dài từ 60 – 95mm, khoảng bằng hoặc lớn hơn ngón tay út của người trưởng thành một chút. Đặc biệt khi tôm chết hay khi nấu chín vỏ tôm sắt sẽ rất cứng nên người ta thường bóc nõn tôm để chế biến thực phẩm. ',10,'2020-09-06','Tomsat.jpg','Tôm sắt',750,300,3,1),(11,'Tôm tích (hay tôm tít, tôm thuyền, bề bề) là một loại tôm biển, thường sống ở vùng biển ấm như Thái Bình Dương. Ở Việt Nam, tôm tích thường xuất hiện ở vùng duyên hải miền Trung. Tôm tích có hình dáng khác với những loại tôm khác, phần bụng giống tôm nhưng lại có càng giống bọ ngựa.',10,'2021-09-23','Tomtit.jpg','Tôm tít',650,300,3,1),(13,'Tôm mũ ni thuộc họ động vật giáp xác mười chân. Loài hải sản này thường sống ở những vùng biển khá xa hay tại các rạn đá ngầm, rạn san hô nằm sâu dưới đáy biển. Do đó việc khai thác tôm mũ ni khó khăn hơn nhiều so với các loài tôm khác.',20,'2020-07-08','Tommuni.jpg','Tôm mũ ni',750,300,2,1),(14,'Tôm hùm đất (Tên tiếng anh là Crawfish, Crayfish, Crawdads, Mudbugs hoặc Red Swamp Crayfish), có nguồn gốc từ Trung Quốc và Mỹ.Bề ngoài tôm hùm đất này có màu đỏ nên nhiều người còn gọi là tôm hùm đỏ. Chúng có kích thước khoảng bằng ngón tay cái, có con lớn hơn.',5,'2020-08-20','Tomhumdat.jpg','Tôm hùm đất',500,300,2,1),(15,'Cua có nhiều ở đảo Lý Sơn (Quảng Ngãi), ưu điểm nổi bật của món cua đá đó là thịt có vị ngọt, béo ngậy, có mùi thơm ít có mùi tanh, thịt dai hơn các loại cua biển khác, đặc biệt cua này càng cua rất to, chắc gạch 100% ăn không quen có thể bị “say” gạch.',0,'2020-08-13','Cuadalyson.jpg','Cua đá lý sơn',800,300,4,2),(16,'Cua mặt trăng loại cua nổi tiếng ở vùng đất Ninh Thuận hay Côn Đảo (Phú Quốc). Đặc điểm của cua mặt trăng đó là mai loại cua này có nhiều hình tròn màu đỏ đậm, pha vào màu hồng tươi như mặt trăng.',0,'2021-07-15','Cuamattrang.jpg','Cua mặt trăng',650,300,4,2),(19,'Côn Đảo là nơi duy nhất có cua xe tăng sinh sống, loại cua này ở trên cạn và có kích thước khổng lồ, những con trưởng thành có mai dài hơn 10 cm và nặng lên tới 1 kg. Đặc điểm của giống cua này là 2 càng to chắc khỏe, khi bò nó có hình dáng trông giống như cỗ xe tăng đang di chuyển vì thế nó được gọi là cua xe tăng.',0,'2021-10-01','Cuaxetang.jpg','Cua xe tăng',650,300,5,2),(20,'Cua biển Năm Căn là một đặc sản độc đáo ở vùng rừng ngập mặn Cà Mau. Loại cua này sở hữu độ mặn vừa đủ, vị ngọt đậm đà mà không phải loài cua biển nào cũng có được. Mua cua biển Năm Căn về bạn có thể chế biến thành nhiều món ăn khác nhau như: nướng, rang muối, cua nấu chao,…',5,'2021-03-18','Cuacamau.jpg','Cua cà mau',500,300,5,2),(21,'Cua Alaska được biết đến là một trong những loài cua mắc và có giá trị dinh dưỡng cao nhất hiện nay.',10,'2021-09-10','CuaAlaska.jpg','Cua Alaska',550,300,5,2),(22,'Cua huỳnh đế được biết đến với thân hình to, kiểu dáng độc đáo và thú vị khi mình cua khum tròn giống con bọ khổng lồ. Cơ thể có màu đỏ, mai cua hình vuông.',15,'2021-02-18','Cuahoangde.jpg','Cua huỳnh đế',600,300,5,2),(23,'Cua đá biển là một loài cua đá sinh sống ở những hang, hốc, khe đá sâu ở vùng biển. Nhìn từ bên ngoài chúng rất giống ghẹ biển',10,'2021-06-24','Cuada.jpg','Cua đá',300,300,6,2),(24,'Chúng là loài có nhiều ở vùng Nam bộ ở Việt Nam, là loài đặc trưng ở vùng Nam bộ, sống tập trung ở vùng nước lợ, mặn, trải từ Cần Thơ đến Sóc Trăng, Cà Mau, nhiều nhất ở U Minh. Ba khía là loài sống trong bãi bồi nước lợ, mặn, dưới những tán đước, mắm rậm rạp, có mặt nhiều ở các vùng Cần Giờ (TP.HCM), Gò Công (Tiền Giang), nhưng nhiều người thích ba khía Rạch Gốc (Cà Mau) vì cho rằng ngon hơn các nơi kia.',10,'2021-08-11','Bakhia.jpg','Ba khía',300,200,6,2),(25,'Chúng là loài có nhiều ở vùng Nam bộ ở Việt Nam, là loài đặc trưng ở vùng Nam bộ, sống tập trung ở vùng nước lợ, mặn, trải từ Cần Thơ đến Sóc Trăng, Cà Mau, nhiều nhất ở U Minh. Ba khía là loài sống trong bãi bồi nước lợ, mặn, dưới những tán đước, mắm rậm rạp, có mặt nhiều ở các vùng Cần Giờ (TP.HCM), Gò Công (Tiền Giang), nhưng nhiều người thích ba khía Rạch Gốc (Cà Mau) vì cho rằng ngon hơn các nơi kia.',0,'2021-09-24','Ghexanh.jpg','Ghẹ',300,300,6,2),(26,'Cua đồng phân bố rộng ở vùng nước ngọt, từ đồng bằng, trung du, miền núi. Là động vật sống ở tầng đáy, ưa nước sạch, đào hang thích nghi với bùn sét, bùn cát. Chúng sinh sản quanh năm nếu môi trường thuận lợi, tập trung vào mùa xuân, mùa hè, mùa thu. ',0,'2021-09-15','Cuadong.jpg','Cua đồng',350,300,7,2),(27,'Cá rô phi là tên thông thường của một nhóm loài cá nước ngọt phổ biến, nhưng một số loài trong chúng cũng có thể sống trong các môi trường nước lợ hoặc nước mặn, chúng sống chủ yếu tại sông suối, kênh rạch, ao hồ',5,'2021-09-10','Carophi.jpg','Cá rô phi',320,200,7,3),(28,'Họ Cá quả là các loài cá thuộc họ Channidae. Họ này có 2 chi còn loài sinh tồn là Channa hiện biết 39 loài, Parachanna hiện biết có 3 loài ở châu Phi. Ở Việt Nam chủ yếu là Channa maculata và Channa argus.',20,'2021-11-17','Caloc.jpg','Cá lóc',455,300,7,3),(29,'Cá rô đồng là một loài cá thuộc họ Cá rô đồng sống ở môi trường nước ngọt và nước lợ. Chúng có thịt béo, thơm, dai, ngon, có giá trị thương phẩm cao tuy rằng hơi nhiều xương. Kích thước cực đại của chúng có thể tới 250 mm.',10,'2021-09-04','Caro.jpg','Cá rô đồng',350,300,3,3),(31,'ọ Cá ngát là một họ cá da trơn có danh pháp khoa học Plotosidae với đuôi kéo dài giống như đuôi lươn. Các loài cá này có nguồn gốc từ Ấn Độ Dương và miền tây Thái Bình Dương, từ Nhật Bản tới Australia và Fiji. Họ này bao gồm khoảng 35 loài trong 10 chi.',10,'2021-09-04','Cangat.jpg','Cá ngát',400,300,3,3),(35,' Cá chốt - cá ngạnh (tên tiếng anh: Naked catfishes) là một loại cá da trơn thuộc họ cá lăng. Chúng thường sinh sống ở các vùng nước ngọt, nước ...',10,'2021-09-04','Cachot.jpg','Cá chốt',400,300,3,3),(36,'Cá vồ cờ là một loài cá nước ngọt thuộc họ Cá tra của bộ Cá da trơn, sinh sống trong lưu vực sông Chao Phraya và Mê Kông. Loài cá này là cá ăn đáy. Cá được mệnh danh là \"thủy quái\" trên dòng Mekong vì vóc dáng khổng lồ và sự hung hãn.',10,'2021-09-04','Cavo.jpg','Cá vồ',400,300,3,3),(37,'Cá chẽm hay cá vược là một loài cá sống cả trong nước mặn lẫn nước ngọt, thuộc về phân họ Cá chẽm của họ Centropomidae.',10,'2021-09-04','Cachem.jpg','Cá chẻm',400,300,3,3),(38,'Cá nhụ bốn râu, cá chét, cá chét bùn hay cá nhụ lớn là loài cá thuộc họ Cá vây tua. Đây là loài cá nuôi có giá trị thương phẩm cao sống ở tầng đáy vùng ven biển, tạo thành các đàn cá lẻ nhỏ. Cá trưởng thành của loài dễ bị thương tổn này bơi vào các con sông trong mùa đông',10,'2021-09-04','Cachet.jpg','Cá chét',400,300,3,3),(39,'Cá nâu hay còn gọi là cá dĩa thái, cá hói là một loài cá trong họ Scatophagidae Phân bố ở Ấn Độ – Thái Bình Dương, Đông Nam Á và Việt Nam, chúng những nét hoa văn da beo trên cơ thể nên còn gọi là dĩa beo. Cá ăn tạp thiên về thực vật, thức ăn bao gồm rong tảo, rau xanh, côn trùng, giáp xác, và thức ăn viên.',10,'2021-09-04','Canau.jpg','Cá nâu',320,300,3,3),(40,'Cá diêu hồng hay cá điêu hồng hay còn gọi là cá rô phi đỏ là một loài cá nước ngọt thuộc họ Cá rô phi có nguồn gốc hình thành từ lai tạo. Thuật ngữ diêu hồng hay điêu hồng được xuất phát từ việc dịch từ tiếng Trung Quốc',10,'2021-09-04','Cadieuhong.jpg','Cá điêu hồng',400,300,3,3),(41,'Giống trắm cỏ đang được nuôi nhiều ở nước ta là giống có nguồn gốc từ Trung Quốc và được nhập vào nước ta từ năm 1958. Thân thon bụng tròn, thót đuôi, hàm rộng dài, vảy lớn tròn. ',10,'2021-09-04','Catramco.jpg','Cá trám cỏ ',400,300,3,3),(42,'Cùng là giống cá xương nhưng so với cá sặc hay cá rô phi thì cá tai tượng có kích thước lớn hơn cả. Một con có thể nặng đến 50 cân. Giống cá này ngoài nuôi lấy thịt trong ao hồ hay đầm lầy thì nó còn được nuôi cảnh nữa.',10,'2021-09-04','Cataituong.jpg','Cá tai tượng',400,300,3,3),(43,'Đây là giống cá thuộc họ cá chép được nuôi nhiều ở phía Nam, chiều dài cá có thể đạt từ 12 đến 20cm. Giống cá này ăn tạp, thức ăn cũng dẽ kiếm và phong phú. Nhưng chủ yếu là mùn bã hữu cơ hay sinh vật phù du. 6 tháng sau nuôi đã có thể đạt từ 150 đến 240g 1 con rồi.',10,'2021-09-04','camevinh.jpg','Cá mè vinh',400,300,3,3),(44,'Ốc hương đảm bảo các tiêu chí dễ tìm,cực ngon và dễ dàng chế biến, ốc hương luôn thu hút mọi người đến thưởng thức dù là thực khách khó tính nhất . Bên cạnh đó, ốc hương cũng cung cấp nhiều chất dinh dưỡng có lợi đối với sức khỏe như canxi, các loại vitamin A, vitamin C, chất xơ, chất béo, sắt,..',10,'2021-09-04','Ochuong.jpg','Ốc hương',400,300,2,6),(45,'Ốc cà na nhỏ bằng ngón áp út, sở hữu đầu xoắn nhọn và vỏ ngoài màu xanh nên được dân địa phương lấy tên là ốc cà na.',10,'2021-09-04','Occana.jpg','Ốc cà na',400,300,2,6),(46,'Như tên gọi của nó, hình dạng của loài ốc này giống móng tay người trưởng thành, có chiều dài 7- 10 cm. Lớp thịt bên trong được bao bởi lớp vỏ màu nâu xám nhạt vỏ ngoài.',10,'2021-09-04','ocmongtay.jpg','Ốc móng tay',400,300,3,6),(47,'Ốc vú nàng là đặc sản biển khá quý hiếm với vỏ hình chóp, có một núm nhỏ trên đỉnh cùng phần vỏ sần sùi màu đen nhám, to bằng 3 ngón tay người lớn.',10,'2021-09-04','Ocvunang.jpg','Ốc vú nàng',400,300,4,6),(48,'Khoác lên mình lớp vỏ trắng tinh, phát sáng nên được người dân Nha Trang đặt cho một cái tên mỹ miều “bạch ngọc “.',10,'2021-09-04','Ocbachngoc.jpg','Ốc bạch ngọc',400,300,3,6),(49,'Ốc len to cỡ ngón tay trỏ, có vỏ màu nâu đen xen vân trắng với những đường gân nhỏ dọc quanh.',10,'2021-09-04','Oclen.jpg','Ốc len',400,300,3,6),(50,'Loại ốc phân bố khắp nơi trong nước từ Cát Bà, Đồ Sơn đến Cà Mau chính vì thế có đặc điểm khá đa dạng giữa các vùng.',10,'2021-09-04','Ocmo.jpg','Ốc mỡ',400,300,3,6),(51,'Là 1 trong những đặc sản nổi tiếng của Phú Quốc, với vỏ ngoài sần sùi nhiều gai nhưng phần thịt ốc gai xương rồng lại rất nhiều và khá mềm.',10,'2021-09-04','ocsuongrong.jpg','Ốc gai sương rồng',400,300,3,6),(52,'Đúng với tên gọi “Ốc hoàng hậu” nên hình dạng cũng rất độc đáo,với kích thước khổng lồ so với các loại khác từ 800g đến 4kg, từng thớ thịt ốc màu vàng cam cực kì bắt mặt, thu hút người nhìn thưởng thức ngay từ cái nhìn đầu tiên.',10,'2021-09-04','Ochoanghau.jpg','Ốc hoàng hậu',400,300,3,6),(53,'Ốc khế có kích thước trung bình, những khía ngoài vỏ ốc giống khía của quả khế với các gân, gạch màu trắng nâu mờ. Ốc phân bố chủ yếu ở các vùng biển miền Trung.',10,'2021-09-04','Ockhe.jpg','Ốc khế',400,300,3,6),(54,'Thật là thiếu sót nếu không biết đến ốc bươu, một loại ốc nước ngọt thường sống ở sông hồ, kênh rạch. Với vỏ ngoài đen tròn, phần thịt ngọt, mềm, ăn sần sật. Đây chính là 1 trong những món ăn dân dã, cực ngon miệng của người Việt Nam.',10,'2021-09-04','Ocbuu.jpg','Ốc bưu',400,300,3,6),(55,'Ốc dừa chủ yếu sống ở miền Tây. Với lớp vỏ nhẵn, dày cùng kích thước khá nhỏ ốc dừa cũng là một trong những món ăn khoái khẩu của giới trẻ hiện nay.',10,'2021-09-04','Ocdua.jpg','Ốc dừa',400,300,3,6),(56,'Hình dạng giống củ tỏi chính là lý do loại ốc này có tên là ốc tỏi. Thường phân bố chủ yếu ở các vùng đảo và có màu xám trắng sẫm, ốc tỏi cũng mang lại những giá trị dinh dưỡng khá cao',10,'2021-09-04','Octoi.jpg','Ốc tỏi',400,300,3,6),(57,'Ốc gạo đặc biệt khác so với những loại ốc khác ở chỗ không có nhớt. Ốc có phần vỏ trắng xanh, lớn bằng đầu ngón tay. Thịt ốc màu trắng đục, ăn vào giòn thơm.',10,'2021-09-04','Ocgao.jpg','Ốc gạo',400,300,3,6),(58,'Mực lá được nhiều người đánh giá là loại mực ngon nhất. Mực lá dễ dàng để phân biệt với mực khác ở chỗ chúng có vây dày hình bầu dục khỏe mở rộng xung quanh gần như toàn bộ lớp áo',10,'2021-09-04','Mucla.jpg','Mực lá',400,300,3,4),(59,'Mực ống là loại mực mọi người thường ăn mỗi dịp đi du lịch hay mua ở siêu thị, các chợ. Cách nhận biết đó là, loại mực thân dài, hình ống có 8 râu nhỏ và 2 xúc tu dài, da có nhiều đốm hồng, mắt to trong suốt, đặc biệt là phần vây đuôi rất dễ nhận biết nó xuất phát từ giữa thân kéo dài xuống cuối thân hình thoi. Có túi mực đen dùng để phòng thân khi bi kẻ thù tấn công.',10,'2021-09-04','Mucong.jpg','Mực ống',3000,200,3,4),(60,'Mực trứng (hay còn gọi là mực sữa), là loại mực nhỏ màu đỏ cánh gián, bên trong thân mực chứa toàn là trứng. Đây là loại hải sản rất giàu chất dinh dưỡng, ăn rất ngon.',10,'2021-09-04','Muctrung.jpg','Mực trứng',300,200,3,4),(61,'Mực sim là loại có kích thước nhỏ nhất trong các loại mực, con to nhất cũng chỉ bằng 2ngón tay khi đã trưởng thành. Loại mực này có rất nhiều trứng khi ăn rất ngọt và bùi.',10,'2021-09-04','Mucsim.jpg','Mực sim',300,200,3,4),(62,'Mực nang (mực mai, mực bầu) là loại có kích thước to, cơ thể hình chữ W, cõng trên lưng cái mai cứng nặng nề.Loại mực này thịt rất dày và giòn nhưng vị nhạt. Do đó không được dùng ăn tươi mà chủ yếu để giã chả mực, khi hòa trộn với các hương liệu, gia vị sẽ cho ra một món ăn rất đặc sắc. Ngoài ra, mực nang cũng rất phù hợp cho các bà nội trợ chế biến các món tươi sống như lẩu, gỏi, salad.',10,'2021-09-04','Mucnang.jpg','Mực nang',300,200,3,4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcotftqap7by5m4ibph3ss3xvo` (`customerId`),
  CONSTRAINT `FKcotftqap7by5m4ibph3ss3xvo` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN','admin123');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-21 22:10:12
