-- MySQL dump 10.13  Distrib 8.0.30, for macos12.4 (x86_64)
--
-- Host: 127.0.0.1    Database: main
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20221024142144','2022-10-25 17:32:51',149);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_block`
--

DROP TABLE IF EXISTS `nglayouts_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout_id` int NOT NULL,
  `depth` int NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `definition_identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_view_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `translatable` tinyint NOT NULL,
  `main_locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `always_available` tinyint NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_block_uuid` (`uuid`,`status`),
  KEY `idx_ngl_layout` (`layout_id`,`status`),
  KEY `idx_ngl_parent_block` (`parent_id`,`placeholder`,`status`),
  CONSTRAINT `fk_ngl_block_layout` FOREIGN KEY (`layout_id`, `status`) REFERENCES `nglayouts_layout` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_block`
--

LOCK TABLES `nglayouts_block` WRITE;
/*!40000 ALTER TABLE `nglayouts_block` DISABLE KEYS */;
INSERT INTO `nglayouts_block` VALUES (1,1,'8b0ca2bc-30aa-46f6-a47c-71e5cdd218ed',1,0,'/1/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(1,2,'8b0ca2bc-30aa-46f6-a47c-71e5cdd218ed',1,0,'/1/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(2,1,'c8f657cb-c6ac-42be-ae1d-5d8ea90a3a32',1,0,'/2/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(2,2,'c8f657cb-c6ac-42be-ae1d-5d8ea90a3a32',1,0,'/2/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(3,1,'31661996-6826-46ba-9e95-159aedc08f60',1,0,'/3/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(3,2,'31661996-6826-46ba-9e95-159aedc08f60',1,0,'/3/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(4,1,'23baba30-4436-4ded-bbe7-3b10d0360e98',1,0,'/4/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(4,2,'23baba30-4436-4ded-bbe7-3b10d0360e98',1,0,'/4/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(5,1,'3fe4422a-f630-4231-b821-ec3afc15dc1b',1,0,'/5/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(5,2,'3fe4422a-f630-4231-b821-ec3afc15dc1b',1,0,'/5/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(7,1,'fbbac73c-17bb-4edd-a576-8e1a1d03c26a',1,1,'/2/7/',2,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(7,2,'fbbac73c-17bb-4edd-a576-8e1a1d03c26a',1,1,'/2/7/',2,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(8,1,'b1d61fa0-28a6-4453-928b-f07b18ae8130',1,1,'/2/8/',2,'root',1,'twig_block','twig_block','standard','Latest Recipes','[]',0,'en',1),(8,2,'b1d61fa0-28a6-4453-928b-f07b18ae8130',1,1,'/2/8/',2,'root',1,'twig_block','twig_block','standard','Latest Recipes','[]',0,'en',1),(9,1,'8ce6745f-3039-447c-8b5f-02b046af2051',1,1,'/2/9/',2,'root',2,'twig_block','twig_block','standard','','[]',0,'en',1),(9,2,'8ce6745f-3039-447c-8b5f-02b046af2051',1,1,'/2/9/',2,'root',2,'twig_block','twig_block','standard','','[]',0,'en',1),(10,1,'d2b538f2-106c-4a22-b9cd-367223646187',1,1,'/2/10/',2,'root',3,'twig_block','twig_block','standard','','[]',0,'en',1),(10,2,'d2b538f2-106c-4a22-b9cd-367223646187',1,1,'/2/10/',2,'root',3,'twig_block','twig_block','standard','','[]',0,'en',1),(11,1,'bc5df73e-96ec-4ba7-99c8-3a8896817915',1,1,'/1/11/',1,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(11,2,'bc5df73e-96ec-4ba7-99c8-3a8896817915',1,1,'/1/11/',1,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(12,1,'14b1a83b-756b-402c-a37e-a45b3d166f02',1,1,'/5/12/',5,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(12,2,'14b1a83b-756b-402c-a37e-a45b3d166f02',1,1,'/5/12/',5,'root',0,'twig_block','twig_block','standard','','[]',0,'en',1),(13,1,'43ecad04-f737-4cea-ad52-68c8c62bac9d',2,0,'/13/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(13,2,'43ecad04-f737-4cea-ad52-68c8c62bac9d',2,0,'/13/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(14,1,'3eacf94b-bcda-4a31-bc46-7551da35fbc2',2,0,'/14/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(14,2,'3eacf94b-bcda-4a31-bc46-7551da35fbc2',2,0,'/14/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(15,1,'55344859-5604-4ff1-87d3-71b27ebf6439',2,0,'/15/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(15,2,'55344859-5604-4ff1-87d3-71b27ebf6439',2,0,'/15/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(16,1,'16748803-f1c3-4f49-af5a-e30eb8592fbb',2,0,'/16/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(16,2,'16748803-f1c3-4f49-af5a-e30eb8592fbb',2,0,'/16/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(17,1,'31ce8b56-b95f-42b0-a517-699e64abd26c',2,0,'/17/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(17,2,'31ce8b56-b95f-42b0-a517-699e64abd26c',2,0,'/17/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(18,1,'ff079bb4-895a-4b9a-840b-9e6292521f81',2,1,'/14/18/',14,'root',1,'full_view','full_view','standard','','[]',0,'en',1),(18,2,'ff079bb4-895a-4b9a-840b-9e6292521f81',2,1,'/14/18/',14,'root',1,'full_view','full_view','standard','','[]',0,'en',1),(19,1,'07da5703-c6c1-4727-bb6a-a976414dc4ad',3,0,'/19/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(20,1,'e882dff7-7a9b-4953-ad51-b08987dde743',3,0,'/20/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(21,1,'6dcd9546-8262-4df3-9971-94c1004e57b4',3,0,'/21/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(22,1,'4ecf164c-9029-4490-ba39-7494b08a9731',3,0,'/22/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(23,1,'6c392f89-cd40-40de-81c7-c51facb56bc0',3,0,'/23/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(24,1,'6ba3a1cb-71af-45d4-a89d-2498fa587480',3,1,'/19/24/',19,'root',0,'twig_block','twig_block','standard','Top Nav','[]',0,'en',1),(25,1,'292d7bc2-86d2-45f2-a395-022d70b4622c',3,1,'/20/25/',20,'root',0,'twig_block','twig_block','standard','Footer','[]',0,'en',1),(26,1,'e1aa8e9b-aa59-49bf-9cb2-c745d49de205',2,2,'/14/27/26/',27,'main',0,'title','title','standard','','[]',1,'en',1),(26,2,'e1aa8e9b-aa59-49bf-9cb2-c745d49de205',2,2,'/14/27/26/',27,'main',0,'title','title','standard','','[]',1,'en',1),(27,1,'888f9d6f-ccfd-495f-a20b-74ef96382e45',2,1,'/14/27/',14,'root',0,'column','column','standard','','[]',1,'en',1),(27,2,'888f9d6f-ccfd-495f-a20b-74ef96382e45',2,1,'/14/27/',14,'root',0,'column','column','standard','','[]',1,'en',1),(28,1,'9f4e77b0-1296-4483-a393-34b8515c4726',2,2,'/14/27/28/',27,'main',1,'text','text','standard','','[]',1,'en',1),(28,2,'9f4e77b0-1296-4483-a393-34b8515c4726',2,2,'/14/27/28/',27,'main',1,'text','text','standard','','[]',1,'en',1);
/*!40000 ALTER TABLE `nglayouts_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_block_collection`
--

DROP TABLE IF EXISTS `nglayouts_block_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_block_collection` (
  `block_id` int NOT NULL,
  `block_status` int NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int NOT NULL,
  `collection_status` int NOT NULL,
  PRIMARY KEY (`block_id`,`block_status`,`identifier`),
  KEY `idx_ngl_block` (`block_id`,`block_status`),
  KEY `idx_ngl_collection` (`collection_id`,`collection_status`),
  CONSTRAINT `fk_ngl_block_collection_block` FOREIGN KEY (`block_id`, `block_status`) REFERENCES `nglayouts_block` (`id`, `status`),
  CONSTRAINT `fk_ngl_block_collection_collection` FOREIGN KEY (`collection_id`, `collection_status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_block_collection`
--

LOCK TABLES `nglayouts_block_collection` WRITE;
/*!40000 ALTER TABLE `nglayouts_block_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_block_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_block_translation`
--

DROP TABLE IF EXISTS `nglayouts_block_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_block_translation` (
  `block_id` int NOT NULL,
  `status` int NOT NULL,
  `locale` varchar(191) NOT NULL,
  `parameters` longtext NOT NULL,
  PRIMARY KEY (`block_id`,`status`,`locale`),
  CONSTRAINT `fk_ngl_block_translation_block` FOREIGN KEY (`block_id`, `status`) REFERENCES `nglayouts_block` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_block_translation`
--

LOCK TABLES `nglayouts_block_translation` WRITE;
/*!40000 ALTER TABLE `nglayouts_block_translation` DISABLE KEYS */;
INSERT INTO `nglayouts_block_translation` VALUES (1,1,'en','[]'),(1,2,'en','[]'),(2,1,'en','[]'),(2,2,'en','[]'),(3,1,'en','[]'),(3,2,'en','[]'),(4,1,'en','[]'),(4,2,'en','[]'),(5,1,'en','[]'),(5,2,'en','[]'),(7,1,'en','{\"block_name\":\"hero\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(7,2,'en','{\"block_name\":\"hero\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(8,1,'en','{\"block_name\":\"latest_recipes\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(8,2,'en','{\"block_name\":\"latest_recipes\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(9,1,'en','{\"block_name\":\"subscribe_newsletter\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(9,2,'en','{\"block_name\":\"subscribe_newsletter\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(10,1,'en','{\"block_name\":\"featured_skills\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(10,2,'en','{\"block_name\":\"featured_skills\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(11,1,'en','{\"block_name\":\"navigation\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(11,2,'en','{\"block_name\":\"navigation\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(12,1,'en','{\"block_name\":\"footer\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(12,2,'en','{\"block_name\":\"footer\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(13,1,'en','[]'),(13,2,'en','[]'),(14,1,'en','[]'),(14,2,'en','[]'),(15,1,'en','[]'),(15,2,'en','[]'),(16,1,'en','[]'),(16,2,'en','[]'),(17,1,'en','[]'),(17,2,'en','[]'),(18,1,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(18,2,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(19,1,'en','[]'),(20,1,'en','[]'),(21,1,'en','[]'),(22,1,'en','[]'),(23,1,'en','[]'),(24,1,'en','{\"block_name\":\"navigation\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(25,1,'en','{\"block_name\":\"footer\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(26,1,'en','{\"tag\":\"h1\",\"title\":\"Doggone Good Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(26,2,'en','{\"tag\":\"h1\",\"title\":\"Doggone Good Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(27,1,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(27,2,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(28,1,'en','{\"content\":\"Recipes your pup will love!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(28,2,'en','{\"content\":\"Recipes your pup will love!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}');
/*!40000 ALTER TABLE `nglayouts_block_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection`
--

DROP TABLE IF EXISTS `nglayouts_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` int NOT NULL,
  `length` int DEFAULT NULL,
  `translatable` tinyint NOT NULL,
  `main_locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `always_available` tinyint NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_uuid` (`uuid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection`
--

LOCK TABLES `nglayouts_collection` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection_item`
--

DROP TABLE IF EXISTS `nglayouts_collection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int NOT NULL,
  `position` int NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_item_uuid` (`uuid`,`status`),
  KEY `idx_ngl_collection` (`collection_id`,`status`),
  CONSTRAINT `fk_ngl_item_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_item`
--

LOCK TABLES `nglayouts_collection_item` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection_query`
--

DROP TABLE IF EXISTS `nglayouts_collection_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_query_uuid` (`uuid`,`status`),
  KEY `idx_ngl_collection` (`collection_id`,`status`),
  CONSTRAINT `fk_ngl_query_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_query`
--

LOCK TABLES `nglayouts_collection_query` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection_query_translation`
--

DROP TABLE IF EXISTS `nglayouts_collection_query_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection_query_translation` (
  `query_id` int NOT NULL,
  `status` int NOT NULL,
  `locale` varchar(191) NOT NULL,
  `parameters` longtext NOT NULL,
  PRIMARY KEY (`query_id`,`status`,`locale`),
  CONSTRAINT `fk_ngl_query_translation_query` FOREIGN KEY (`query_id`, `status`) REFERENCES `nglayouts_collection_query` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_query_translation`
--

LOCK TABLES `nglayouts_collection_query_translation` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_query_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection_query_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection_slot`
--

DROP TABLE IF EXISTS `nglayouts_collection_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) NOT NULL,
  `collection_id` int NOT NULL,
  `position` int NOT NULL,
  `view_type` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_slot_uuid` (`uuid`,`status`),
  KEY `idx_ngl_collection` (`collection_id`,`status`),
  KEY `idx_ngl_position` (`collection_id`,`position`),
  CONSTRAINT `fk_ngl_slot_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_slot`
--

LOCK TABLES `nglayouts_collection_slot` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_collection_translation`
--

DROP TABLE IF EXISTS `nglayouts_collection_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_collection_translation` (
  `collection_id` int NOT NULL,
  `status` int NOT NULL,
  `locale` varchar(191) NOT NULL,
  PRIMARY KEY (`collection_id`,`status`,`locale`),
  CONSTRAINT `fk_ngl_collection_translation_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_translation`
--

LOCK TABLES `nglayouts_collection_translation` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_collection_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_layout`
--

DROP TABLE IF EXISTS `nglayouts_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_layout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int NOT NULL,
  `modified` int NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `main_locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_layout_uuid` (`uuid`,`status`),
  KEY `idx_ngl_layout_name` (`name`),
  KEY `idx_ngl_layout_type` (`type`),
  KEY `idx_ngl_layout_shared` (`shared`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_layout`
--

LOCK TABLES `nglayouts_layout` WRITE;
/*!40000 ALTER TABLE `nglayouts_layout` DISABLE KEYS */;
INSERT INTO `nglayouts_layout` VALUES (1,1,'111009fe-5e10-4e75-b5ce-fdc5c7a87d4f','layout_2','Homepage Layout','',1666721413,1666724988,0,'en'),(1,2,'111009fe-5e10-4e75-b5ce-fdc5c7a87d4f','layout_2','','',1666721413,1666724477,0,'en'),(2,1,'1bea7c41-241a-4107-a482-2e307875b840','layout_2','Recipes List Layout','',1666724118,1666724716,0,'en'),(2,2,'1bea7c41-241a-4107-a482-2e307875b840','layout_2','','',1666724118,1666724610,0,'en'),(3,1,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','layout_2','Nav & Footer Layout','',1666724289,1666724319,1,'en');
/*!40000 ALTER TABLE `nglayouts_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_layout_translation`
--

DROP TABLE IF EXISTS `nglayouts_layout_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_layout_translation` (
  `layout_id` int NOT NULL,
  `status` int NOT NULL,
  `locale` varchar(191) NOT NULL,
  PRIMARY KEY (`layout_id`,`status`,`locale`),
  CONSTRAINT `fk_ngl_layout_translation_layout` FOREIGN KEY (`layout_id`, `status`) REFERENCES `nglayouts_layout` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_layout_translation`
--

LOCK TABLES `nglayouts_layout_translation` WRITE;
/*!40000 ALTER TABLE `nglayouts_layout_translation` DISABLE KEYS */;
INSERT INTO `nglayouts_layout_translation` VALUES (1,1,'en'),(1,2,'en'),(2,1,'en'),(2,2,'en'),(3,1,'en');
/*!40000 ALTER TABLE `nglayouts_layout_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_migration_versions`
--

DROP TABLE IF EXISTS `nglayouts_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_migration_versions`
--

LOCK TABLES `nglayouts_migration_versions` WRITE;
/*!40000 ALTER TABLE `nglayouts_migration_versions` DISABLE KEYS */;
INSERT INTO `nglayouts_migration_versions` VALUES ('Netgen\\Layouts\\Migrations\\Doctrine\\Version000700','2022-10-25 17:58:03',1201),('Netgen\\Layouts\\Migrations\\Doctrine\\Version000800','2022-10-25 17:58:04',281),('Netgen\\Layouts\\Migrations\\Doctrine\\Version000900','2022-10-25 17:58:04',525),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001000','2022-10-25 17:58:05',342),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001100','2022-10-25 17:58:05',207),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001200','2022-10-25 17:58:05',118),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001300','2022-10-25 17:58:05',287),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010000','2022-10-25 17:58:06',1452),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010200','2022-10-25 17:58:07',1057),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010300','2022-10-25 17:58:08',372);
/*!40000 ALTER TABLE `nglayouts_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_role`
--

DROP TABLE IF EXISTS `nglayouts_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_role_uuid` (`uuid`,`status`),
  KEY `idx_ngl_role_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_role`
--

LOCK TABLES `nglayouts_role` WRITE;
/*!40000 ALTER TABLE `nglayouts_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_role_policy`
--

DROP TABLE IF EXISTS `nglayouts_role_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_role_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `component` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitations` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_role_policy_uuid` (`uuid`,`status`),
  KEY `idx_ngl_role` (`role_id`,`status`),
  KEY `idx_ngl_policy_component` (`component`),
  KEY `idx_ngl_policy_component_permission` (`component`,`permission`),
  CONSTRAINT `fk_ngl_policy_role` FOREIGN KEY (`role_id`, `status`) REFERENCES `nglayouts_role` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_role_policy`
--

LOCK TABLES `nglayouts_role_policy` WRITE;
/*!40000 ALTER TABLE `nglayouts_role_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_role_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule`
--

DROP TABLE IF EXISTS `nglayouts_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group_id` int NOT NULL,
  `layout_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_uuid` (`uuid`,`status`),
  KEY `idx_ngl_related_layout` (`layout_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule`
--

LOCK TABLES `nglayouts_rule` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule` DISABLE KEYS */;
INSERT INTO `nglayouts_rule` VALUES (1,1,'e313247a-1aa8-4eb7-8091-ba7acc924f8d',1,'111009fe-5e10-4e75-b5ce-fdc5c7a87d4f',''),(1,2,'e313247a-1aa8-4eb7-8091-ba7acc924f8d',1,NULL,''),(2,1,'e66be6a9-9c6e-4451-be09-f5af796608cc',1,'1bea7c41-241a-4107-a482-2e307875b840',''),(2,2,'e66be6a9-9c6e-4451-be09-f5af796608cc',1,'1bea7c41-241a-4107-a482-2e307875b840','');
/*!40000 ALTER TABLE `nglayouts_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_condition`
--

DROP TABLE IF EXISTS `nglayouts_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_condition_uuid` (`uuid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_condition`
--

LOCK TABLES `nglayouts_rule_condition` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_condition_rule`
--

DROP TABLE IF EXISTS `nglayouts_rule_condition_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_condition_rule` (
  `condition_id` int NOT NULL,
  `condition_status` int NOT NULL,
  `rule_id` int NOT NULL,
  `rule_status` int NOT NULL,
  PRIMARY KEY (`condition_id`,`condition_status`),
  KEY `idx_ngl_rule` (`rule_id`,`rule_status`),
  CONSTRAINT `fk_ngl_rule_condition_rule_rule` FOREIGN KEY (`rule_id`, `rule_status`) REFERENCES `nglayouts_rule` (`id`, `status`),
  CONSTRAINT `fk_ngl_rule_condition_rule_rule_condition` FOREIGN KEY (`condition_id`, `condition_status`) REFERENCES `nglayouts_rule_condition` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_condition_rule`
--

LOCK TABLES `nglayouts_rule_condition_rule` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_condition_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_rule_condition_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_condition_rule_group`
--

DROP TABLE IF EXISTS `nglayouts_rule_condition_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_condition_rule_group` (
  `condition_id` int NOT NULL,
  `condition_status` int NOT NULL,
  `rule_group_id` int NOT NULL,
  `rule_group_status` int NOT NULL,
  PRIMARY KEY (`condition_id`,`condition_status`),
  KEY `idx_ngl_rule_group` (`rule_group_id`,`rule_group_status`),
  CONSTRAINT `fk_ngl_rule_condition_rule_group_rule_condition` FOREIGN KEY (`condition_id`, `condition_status`) REFERENCES `nglayouts_rule_condition` (`id`, `status`),
  CONSTRAINT `fk_ngl_rule_condition_rule_group_rule_group` FOREIGN KEY (`rule_group_id`, `rule_group_status`) REFERENCES `nglayouts_rule_group` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_condition_rule_group`
--

LOCK TABLES `nglayouts_rule_condition_rule_group` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_condition_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `nglayouts_rule_condition_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_data`
--

DROP TABLE IF EXISTS `nglayouts_rule_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_data` (
  `rule_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_data`
--

LOCK TABLES `nglayouts_rule_data` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_data` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_data` VALUES (1,1,0),(2,1,-10);
/*!40000 ALTER TABLE `nglayouts_rule_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_group`
--

DROP TABLE IF EXISTS `nglayouts_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) NOT NULL,
  `depth` int NOT NULL,
  `path` varchar(191) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_group_uuid` (`uuid`,`status`),
  KEY `idx_ngl_parent_rule_group` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_group`
--

LOCK TABLES `nglayouts_rule_group` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_group` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_group` VALUES (1,1,'00000000-0000-0000-0000-000000000000',0,'/1/',NULL,'Root','');
/*!40000 ALTER TABLE `nglayouts_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_group_data`
--

DROP TABLE IF EXISTS `nglayouts_rule_group_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_group_data` (
  `rule_group_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`rule_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_group_data`
--

LOCK TABLES `nglayouts_rule_group_data` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_group_data` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_group_data` VALUES (1,1,0);
/*!40000 ALTER TABLE `nglayouts_rule_group_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_rule_target`
--

DROP TABLE IF EXISTS `nglayouts_rule_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_rule_target` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_target_uuid` (`uuid`,`status`),
  KEY `idx_ngl_rule` (`rule_id`,`status`),
  KEY `idx_ngl_target_type` (`type`),
  CONSTRAINT `fk_ngl_target_rule` FOREIGN KEY (`rule_id`, `status`) REFERENCES `nglayouts_rule` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_target`
--

LOCK TABLES `nglayouts_rule_target` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_target` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_target` VALUES (1,1,'424a6fdf-202e-4c88-bc5f-95123202d585',1,'route','app_homepage'),(1,2,'424a6fdf-202e-4c88-bc5f-95123202d585',1,'route','app_homepage'),(2,1,'3f19ee15-71ad-4047-92b0-caaebd96b522',2,'path_info','/recipes');
/*!40000 ALTER TABLE `nglayouts_rule_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_zone`
--

DROP TABLE IF EXISTS `nglayouts_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_zone` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout_id` int NOT NULL,
  `status` int NOT NULL,
  `root_block_id` int NOT NULL,
  `linked_layout_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked_zone_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`identifier`,`layout_id`,`status`),
  KEY `idx_ngl_layout` (`layout_id`,`status`),
  KEY `idx_ngl_root_block` (`root_block_id`,`status`),
  KEY `idx_ngl_linked_zone` (`linked_layout_uuid`,`linked_zone_identifier`),
  CONSTRAINT `fk_ngl_zone_block` FOREIGN KEY (`root_block_id`, `status`) REFERENCES `nglayouts_block` (`id`, `status`),
  CONSTRAINT `fk_ngl_zone_layout` FOREIGN KEY (`layout_id`, `status`) REFERENCES `nglayouts_layout` (`id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_zone`
--

LOCK TABLES `nglayouts_zone` WRITE;
/*!40000 ALTER TABLE `nglayouts_zone` DISABLE KEYS */;
INSERT INTO `nglayouts_zone` VALUES ('footer',1,1,5,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','post_header'),('footer',1,2,5,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','post_header'),('footer',2,1,17,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','post_header'),('footer',2,2,17,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','post_header'),('footer',3,1,23,NULL,NULL),('header',1,1,1,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','header'),('header',1,2,1,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','header'),('header',2,1,13,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','header'),('header',2,2,13,'ca0e7535-78d0-4401-b306-0d4ac56db6d7','header'),('header',3,1,19,NULL,NULL),('main',1,1,3,NULL,NULL),('main',1,2,3,NULL,NULL),('main',2,1,15,NULL,NULL),('main',2,2,15,NULL,NULL),('main',3,1,21,NULL,NULL),('post_header',1,1,2,NULL,NULL),('post_header',1,2,2,NULL,NULL),('post_header',2,1,14,NULL,NULL),('post_header',2,2,14,NULL,NULL),('post_header',3,1,20,NULL,NULL),('pre_footer',1,1,4,NULL,NULL),('pre_footer',1,2,4,NULL,NULL),('pre_footer',2,1,16,NULL,NULL),('pre_footer',2,2,16,NULL,NULL),('pre_footer',3,1,22,NULL,NULL);
/*!40000 ALTER TABLE `nglayouts_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` json NOT NULL,
  `instructions` json NOT NULL,
  `total_time` int NOT NULL,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DA88B137989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Fuga veniam voluptas in','Aliquid dolorum qui non ipsam commodi ab et voluptatibus.','fuga-veniam-voluptas-in','hic-ut-voluptatum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',21,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(2,'Ex blanditiis dolorem illo','Molestiae officiis dolore sit sed cumque.','ex-blanditiis-dolorem-illo','quam-quas.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',84,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(3,'Ut inventore amet et','Iste in iure quia.','ut-inventore-amet-et','necessitatibus-est.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',79,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(4,'Possimus officia ipsum nihil','Quaerat et vel ut et.','possimus-officia-ipsum-nihil','et-laboriosam.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',31,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(5,'At quisquam et consequuntur','Eaque quod et doloremque expedita quo.','at-quisquam-et-consequuntur','ea-consequuntur-quisquam.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',68,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(6,'Et aperiam est nemo','In et consequatur ipsa ullam rerum.','et-aperiam-est-nemo','similique-repudiandae.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',57,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(7,'Inventore neque cum qui','Quia ad pariatur officia aut nisi et sit.','inventore-neque-cum-qui','dolor-inventore.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',46,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(8,'Neque voluptates voluptatum molestiae','Nam expedita eos qui asperiores facere quidem.','neque-voluptates-voluptatum-molestiae','veritatis-inventore.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',23,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(9,'Repellat autem aperiam voluptate','Dolore cupiditate aspernatur enim et ex provident nulla sint.','repellat-autem-aperiam-voluptate','voluptates-esse-dolorum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',73,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(10,'Enim cumque eos cupiditate','Saepe alias fuga aut tenetur ea aut qui.','enim-cumque-eos-cupiditate','iusto-aut-aut.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',18,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(11,'Magnam minus quod minima','Quasi rem molestiae quos omnis.','magnam-minus-quod-minima','et-voluptas-qui.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',52,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(12,'Rerum atque vitae ut','Possimus nemo saepe exercitationem natus odio officia et.','rerum-atque-vitae-ut','sint-ratione-praesentium.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',59,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(13,'Et qui soluta deleniti','In molestiae culpa voluptatibus natus.','et-qui-soluta-deleniti','adipisci-sint.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',43,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(14,'Cumque ipsum deleniti eveniet','Iure soluta sit delectus beatae quibusdam non molestias aut.','cumque-ipsum-deleniti-eveniet','consequatur-maiores.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',90,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(15,'Perferendis officia eum nostrum','Culpa dicta iusto molestias dolor.','perferendis-officia-eum-nostrum','reiciendis-esse.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',29,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(16,'Quisquam et architecto qui','Quis aspernatur hic labore voluptas autem.','quisquam-et-architecto-qui','quia-ad.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',57,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(17,'Aut dolores sed tempore','Voluptatem accusantium id est ad deleniti aut.','aut-dolores-sed-tempore','ut-quo.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',31,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(18,'Sunt praesentium et animi','Dolore nulla doloremque aliquid officiis id.','sunt-praesentium-et-animi','autem-quo-dicta.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',57,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(19,'Veritatis repellendus suscipit recusandae','Eos debitis deleniti et delectus dolore.','veritatis-repellendus-suscipit-recusandae','laborum-at-voluptatum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',21,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(20,'Odit aliquam est ut','Et deleniti ut ex.','odit-aliquam-est-ut','reiciendis-voluptate-ipsam.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',18,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(21,'Dolores in nisi eos','Porro aliquam qui ut adipisci animi.','dolores-in-nisi-eos','quae-possimus-sapiente.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',41,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(22,'Optio ut exercitationem recusandae','Officiis eum rerum est quo.','optio-ut-exercitationem-recusandae','quibusdam-sequi.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',84,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(23,'Eveniet id quidem et','Suscipit voluptate totam voluptatem pariatur maxime.','eveniet-id-quidem-et','quia-porro.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',27,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(24,'Voluptatem non eum magni','Veritatis explicabo provident ipsa est et.','voluptatem-non-eum-magni','tenetur-et.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',52,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58'),(25,'Eaque nihil ea accusantium','Repudiandae minima minima est ut voluptate dolores ea.','eaque-nihil-ea-accusantium','quod-fugit-aut.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',80,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-25 17:32:58','2022-10-25 17:32:58');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'doggo@barkbite.com','[\"ROLE_ADMIN\"]','$2y$13$x46Q5P/.2YGizIo65sALrul9AWgvt02sBAJ4Bm6/tVoG5kZyaQdRq');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 15:16:24
