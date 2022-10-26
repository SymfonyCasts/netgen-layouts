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
-- Table structure for table `contentful_entry`
--

DROP TABLE IF EXISTS `contentful_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentful_entry` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentful_entry`
--

LOCK TABLES `contentful_entry` WRITE;
/*!40000 ALTER TABLE `contentful_entry` DISABLE KEYS */;
INSERT INTO `contentful_entry` VALUES ('uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn','Julienne like a pro','{\"sys\":{\"id\":\"26CWT8pwt6mRWWrSb0vtfn\",\"type\":\"Entry\",\"revision\":2,\"createdAt\":\"2022-10-20T19:47:28.852Z\",\"updatedAt\":\"2022-10-24T13:51:42.057Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"skill\",\"linkType\":\"ContentType\"}}},\"fields\":{\"title\":{\"en-US\":\"Julienne like a pro\"},\"shortDescription\":{\"en-US\":\"If you want a cut that\'ll impress your friends, say hello to julienne\"},\"technique\":{\"en-US\":{\"nodeType\":\"document\",\"content\":[{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Julienne, or french for \\\"tiny little sticks\\\" (I\'m kidding!) is a cutting technique... to make little sticks! Typically, you do this by first cutting edges off your target to make a square shape. Then, chop, chop, chop carefully to get the desired shape. Watch those fingers, and give yourself plenty of time.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Lazy or in a rush? Try a mandoline slicer. This can take the process down from minutes to seconds. Though, while with chopping you might lose a finger, with a mandoline, you might lose your entire hand. Be careful!\",\"marks\":[],\"content\":[]}],\"data\":{}}]}},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"52d6VPJKfEUrSD3cRkKWCP\",\"linkType\":\"Asset\"}}},\"advertisement\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"linkType\":\"Entry\"}}}}}',1,0),('uvx9svgj8l12|28zrrzEHE9IcpbSKAaAVt8','https://example.com/honey-street-team','{\"sys\":{\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"type\":\"Entry\",\"revision\":1,\"createdAt\":\"2022-10-24T13:49:47.256Z\",\"updatedAt\":\"2022-10-24T13:49:47.256Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"advertisement\",\"linkType\":\"ContentType\"}}},\"fields\":{\"url\":{\"en-US\":\"https:\\/\\/example.com\\/honey-street-team\"},\"shortText\":{\"en-US\":\"The Drizzle Technique is brought to you by the honey street team\"},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"1fu9npxQ0zmdjQIAfXYxzx\",\"linkType\":\"Asset\"}}}}}',1,0),('uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','Folding in Cheese','{\"sys\":{\"id\":\"2Ajye4zzW8cQ0s70b82KXj\",\"type\":\"Entry\",\"revision\":2,\"createdAt\":\"2022-10-20T19:43:38.216Z\",\"updatedAt\":\"2022-10-24T13:51:53.464Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"skill\",\"linkType\":\"ContentType\"}}},\"fields\":{\"title\":{\"en-US\":\"Folding in Cheese\"},\"shortDescription\":{\"en-US\":\"If you know how to fold paper... and think that will be helpful, you\'re in trouble!\"},\"technique\":{\"en-US\":{\"nodeType\":\"document\",\"content\":[{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Ah, folding in cheese: the art of doing something (folding) that is never applied to the context of a liquid, except for now. To \",\"marks\":[],\"content\":[]},{\"nodeType\":\"hyperlink\",\"data\":{\"uri\":\"https:\\/\\/www.youtube.com\\/watch?v=NywzrUJnmTo\",\"title\":\"\"},\"content\":[{\"nodeType\":\"text\",\"value\":\"paraphrase one amazing TV family\",\"marks\":[],\"content\":[]}]},{\"nodeType\":\"text\",\"value\":\", I can\'t show you everything, but I *can* show you this one thing.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Folding in the cheese is basically a fancy way of saying that you should gently mix an ingredient by stirring the spatula around the bowl and then turning it up and over, as if \\\"folding\\\" the cheese (or whatever you\'re missing) onto itself.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"And of course, like with any cheese, you should sample liberally.\",\"marks\":[],\"content\":[]}],\"data\":{}}]}},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"2cvM9E3Y9okCQSN1yO3hN2\",\"linkType\":\"Asset\"}}},\"advertisement\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"linkType\":\"Entry\"}}}}}',1,0),('uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc','Basic Chop','{\"sys\":{\"id\":\"2CMx2vRvhqYvygnIen1hpc\",\"type\":\"Entry\",\"revision\":2,\"createdAt\":\"2022-10-20T19:23:35.680Z\",\"updatedAt\":\"2022-10-24T13:52:02.279Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"skill\",\"linkType\":\"ContentType\"}}},\"fields\":{\"title\":{\"en-US\":\"Basic Chop\"},\"shortDescription\":{\"en-US\":\"Easy, but watch those fingers!!!!\"},\"technique\":{\"en-US\":{\"nodeType\":\"document\",\"content\":[{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Ah, the basic chop. First, grab your weapon (the knife). But, this is no blunt tool: it\'s a gentle instrument. So instead of pushing down on the knife, let it do the work: gently work the knife back and forth with minimal pressure. If the knife is sharp, it\'ll do the heavy lifting for you.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Of course, the most important rule is to mind your fingers. If you started with 10, we\'d like you to finish with just as many.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Good luck!\",\"marks\":[],\"content\":[]}],\"data\":{}}]}},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"4IBDUZaE2RimJKD1mtozO2\",\"linkType\":\"Asset\"}}},\"advertisement\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"linkType\":\"Entry\"}}}}}',1,0),('uvx9svgj8l12|EjKxMFWeUgHXjvKcKKLjN','Mashing!!!','{\"sys\":{\"id\":\"EjKxMFWeUgHXjvKcKKLjN\",\"type\":\"Entry\",\"revision\":3,\"createdAt\":\"2022-10-20T19:49:39.393Z\",\"updatedAt\":\"2022-10-24T13:50:47.304Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"skill\",\"linkType\":\"ContentType\"}}},\"fields\":{\"title\":{\"en-US\":\"Mashing!!!\"},\"shortDescription\":{\"en-US\":\"Is it a cooking technique? Or a form of therapy? You decide!\"},\"technique\":{\"en-US\":{\"nodeType\":\"document\",\"content\":[{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Ah, you\'ve had a long day in this fast-paced modern world. You\'re tired. You\'re stressed. And now, it\'s time to cook dinner.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Fear not! Just find some potatoes and get ready to SMASH them! I mean, mash them! There\'s not too much to mashing: it\'s 50% having the right tool and 50% directed rage. Enjoy!\",\"marks\":[],\"content\":[]}],\"data\":{}}]}},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"2L8LFpuG9OPGYxmhbfkeax\",\"linkType\":\"Asset\"}}},\"advertisement\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"linkType\":\"Entry\"}}}}}',1,0),('uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB','Weighing your Ingredients','{\"sys\":{\"id\":\"PXKvUy2bWslVs3W1gHIqB\",\"type\":\"Entry\",\"revision\":2,\"createdAt\":\"2022-10-20T19:53:55.066Z\",\"updatedAt\":\"2022-10-24T13:51:15.383Z\",\"environment\":{\"sys\":{\"type\":\"Link\",\"id\":\"master\",\"linkType\":\"Environment\"}},\"space\":{\"sys\":{\"type\":\"Link\",\"id\":\"uvx9svgj8l12\",\"linkType\":\"Space\"}},\"contentType\":{\"sys\":{\"type\":\"Link\",\"id\":\"skill\",\"linkType\":\"ContentType\"}}},\"fields\":{\"title\":{\"en-US\":\"Weighing your Ingredients\"},\"shortDescription\":{\"en-US\":\"Did that recipe just tell you measure 250mL of flour! It\'s SO fired\"},\"technique\":{\"en-US\":{\"nodeType\":\"document\",\"content\":[{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"What better way to enjoy an afternoon than baking some bread... or some cookies? So, you find a recipe and start measuring out the 250 mL of flour needed. It is, at this point, if you\'re a truly elite baker, you should throw that recipe straight in the trash.\",\"marks\":[],\"content\":[]}],\"data\":{}},{\"nodeType\":\"paragraph\",\"content\":[{\"nodeType\":\"text\",\"value\":\"Listen, measuring your dry ingredients via a volume measurement might be ok as a hobby, but if there\'s anything that Great British Bake-Off has taught us is that, you can do better. Dry ingredients should be measured in weight. So, put that measuring up away, grab your scale, and wait for Great British Bake Off to call you for an audition.\",\"marks\":[],\"content\":[]}],\"data\":{}}]}},\"image\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"4olctkspZ7U9BnsoLr9bmG\",\"linkType\":\"Asset\"}}},\"advertisement\":{\"en-US\":{\"sys\":{\"type\":\"Link\",\"id\":\"28zrrzEHE9IcpbSKAaAVt8\",\"linkType\":\"Entry\"}}}}}',1,0);
/*!40000 ALTER TABLE `contentful_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentful_entry_route`
--

DROP TABLE IF EXISTS `contentful_entry_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentful_entry_route` (
  `contentful_entry_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`contentful_entry_id`,`route_id`),
  KEY `IDX_58B6BC6E877C153C` (`contentful_entry_id`),
  KEY `IDX_58B6BC6E34ECB4E6` (`route_id`),
  CONSTRAINT `FK_58B6BC6E34ECB4E6` FOREIGN KEY (`route_id`) REFERENCES `orm_routes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_58B6BC6E877C153C` FOREIGN KEY (`contentful_entry_id`) REFERENCES `contentful_entry` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentful_entry_route`
--

LOCK TABLES `contentful_entry_route` WRITE;
/*!40000 ALTER TABLE `contentful_entry_route` DISABLE KEYS */;
INSERT INTO `contentful_entry_route` VALUES ('uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc',1),('uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj',2),('uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn',3),('uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB',4),('uvx9svgj8l12|EjKxMFWeUgHXjvKcKKLjN',5),('uvx9svgj8l12|28zrrzEHE9IcpbSKAaAVt8',6);
/*!40000 ALTER TABLE `contentful_entry_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20221024142144','2022-10-24 14:22:51',76),('DoctrineMigrations\\Version20221024142326','2022-10-24 14:26:26',310);
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout_id` int NOT NULL,
  `depth` int NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `definition_identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_view_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translatable` tinyint NOT NULL,
  `main_locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `always_available` tinyint NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_block_uuid` (`uuid`,`status`),
  KEY `idx_ngl_layout` (`layout_id`,`status`),
  KEY `idx_ngl_parent_block` (`parent_id`,`placeholder`,`status`),
  CONSTRAINT `fk_ngl_block_layout` FOREIGN KEY (`layout_id`, `status`) REFERENCES `nglayouts_layout` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_block`
--

LOCK TABLES `nglayouts_block` WRITE;
/*!40000 ALTER TABLE `nglayouts_block` DISABLE KEYS */;
INSERT INTO `nglayouts_block` VALUES (1,1,'ff316891-9a2f-481a-bbe4-89d084a28f17',1,0,'/1/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(2,1,'0fd3d5b1-5aad-4194-995a-f854c1878cc3',1,0,'/2/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(3,1,'9598300c-f4ae-456f-9080-113cc8c0cb71',1,0,'/3/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(4,1,'57e38ae6-9772-4421-bc9d-1b8fada135f3',1,0,'/4/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(5,1,'20b61bf8-a3f6-4ff0-838f-8436553ecd5e',1,0,'/5/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(6,1,'0edad672-c782-4667-b529-8f3c79d5d816',1,1,'/1/6/',1,'root',0,'twig_block','twig_block','standard','Top Nav','[]',0,'en',1),(7,1,'0cb5e7d2-c1a4-4fc4-b890-a39148fadc9f',1,1,'/5/7/',5,'root',0,'twig_block','twig_block','standard','Footer','[]',0,'en',1),(8,1,'2511ba39-d621-4b64-88ad-b137aabf07de',2,0,'/8/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(8,2,'2511ba39-d621-4b64-88ad-b137aabf07de',2,0,'/8/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(9,1,'bba2dd3d-444f-4fbc-94f8-6271e5c4328f',2,0,'/9/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(9,2,'bba2dd3d-444f-4fbc-94f8-6271e5c4328f',2,0,'/9/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(10,1,'cf1a740c-1a10-4fc4-9ec9-b55bcb2132dd',2,0,'/10/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(10,2,'cf1a740c-1a10-4fc4-9ec9-b55bcb2132dd',2,0,'/10/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(11,1,'a7c996e9-b074-4868-9a28-4180c06ffbcb',2,0,'/11/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(11,2,'a7c996e9-b074-4868-9a28-4180c06ffbcb',2,0,'/11/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(12,1,'ad35e4aa-32e5-40b0-9eba-799ee5c49243',2,0,'/12/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(12,2,'ad35e4aa-32e5-40b0-9eba-799ee5c49243',2,0,'/12/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(13,1,'9ece6229-cdc4-4d10-8435-2b8b587e895e',2,1,'/9/13/',9,'root',0,'twig_block','twig_block','standard','Hero','[]',0,'en',1),(13,2,'9ece6229-cdc4-4d10-8435-2b8b587e895e',2,1,'/9/13/',9,'root',0,'twig_block','twig_block','standard','Hero','[]',0,'en',1),(14,1,'c12bd9ac-2b9a-44ea-856f-6f633a1ef29d',2,2,'/9/23/14/',23,'main',1,'list','grid','standard','Latest Recipes','[]',0,'en',1),(14,2,'c12bd9ac-2b9a-44ea-856f-6f633a1ef29d',2,2,'/9/23/14/',23,'main',1,'list','grid','standard','Latest Recipes','[]',0,'en',1),(15,1,'0a731d81-a5c2-442c-a48c-af33bbb75a00',2,1,'/9/15/',9,'root',2,'twig_block','twig_block','standard','Subscribe Newsletter','[]',0,'en',1),(15,2,'0a731d81-a5c2-442c-a48c-af33bbb75a00',2,1,'/9/15/',9,'root',2,'twig_block','twig_block','standard','Subscribe Newsletter','[]',0,'en',1),(16,1,'bfefc253-1219-48c4-b255-cc06170c9cb8',2,1,'/10/16/',10,'root',0,'twig_block','twig_block','standard','Featured Skills','[]',0,'en',1),(16,2,'bfefc253-1219-48c4-b255-cc06170c9cb8',2,1,'/10/16/',10,'root',0,'twig_block','twig_block','standard','Featured Skills','[]',0,'en',1),(17,1,'064c98a1-fa3b-4add-b76c-35823270cb5c',3,0,'/17/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(17,2,'064c98a1-fa3b-4add-b76c-35823270cb5c',3,0,'/17/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(18,1,'b92154bf-4c47-47a0-93b8-3e0af1d0e2a5',3,0,'/18/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(18,2,'b92154bf-4c47-47a0-93b8-3e0af1d0e2a5',3,0,'/18/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(19,1,'5611fff1-9f88-4c9f-b067-d252750a902a',3,0,'/19/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(19,2,'5611fff1-9f88-4c9f-b067-d252750a902a',3,0,'/19/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(20,1,'e8a59800-8c44-4b71-92f7-578276829115',3,0,'/20/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(20,2,'e8a59800-8c44-4b71-92f7-578276829115',3,0,'/20/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(21,1,'26d18183-685f-46d5-9e0b-3ce4929cb307',3,0,'/21/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(21,2,'26d18183-685f-46d5-9e0b-3ce4929cb307',3,0,'/21/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(22,1,'68696d8c-4ec4-4e88-b028-a9696ecc851e',3,1,'/18/22/',18,'root',1,'full_view','full_view','standard','','[]',0,'en',1),(22,2,'68696d8c-4ec4-4e88-b028-a9696ecc851e',3,1,'/18/22/',18,'root',1,'full_view','full_view','standard','','[]',0,'en',1),(23,1,'3626f422-3129-42dd-a6a8-1742a068afb5',2,1,'/9/23/',9,'root',1,'column','column','standard','','[]',1,'en',1),(23,2,'3626f422-3129-42dd-a6a8-1742a068afb5',2,1,'/9/23/',9,'root',1,'column','column','standard','','[]',1,'en',1),(24,1,'d7e4cb32-86f0-46c2-8126-0889e2cac086',2,2,'/9/23/24/',23,'main',0,'title','title','standard','','[]',1,'en',1),(24,2,'d7e4cb32-86f0-46c2-8126-0889e2cac086',2,2,'/9/23/24/',23,'main',0,'title','title','standard','','[]',1,'en',1),(25,1,'a0c8a48f-9c65-4618-bff0-469a06b61c94',3,2,'/18/28/25/',28,'main',0,'title','title','standard','','[]',1,'en',1),(25,2,'a0c8a48f-9c65-4618-bff0-469a06b61c94',3,2,'/18/28/25/',28,'main',0,'title','title','standard','','[]',1,'en',1),(26,1,'03757510-9acb-4e2c-b0bb-7f9416cb546f',3,2,'/18/28/26/',28,'main',1,'text','text','standard','','[]',1,'en',1),(26,2,'03757510-9acb-4e2c-b0bb-7f9416cb546f',3,2,'/18/28/26/',28,'main',1,'text','text','standard','','[]',1,'en',1),(28,1,'697ab551-8864-45a7-9645-9f4357b5f253',3,1,'/18/28/',18,'root',0,'column','column','standard','','[]',1,'en',1),(28,2,'697ab551-8864-45a7-9645-9f4357b5f253',3,1,'/18/28/',18,'root',0,'column','column','standard','','[]',1,'en',1),(29,0,'23b67d69-f40a-4c0f-95b2-10a347d5f70f',4,0,'/29/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(29,1,'23b67d69-f40a-4c0f-95b2-10a347d5f70f',4,0,'/29/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(29,2,'23b67d69-f40a-4c0f-95b2-10a347d5f70f',4,0,'/29/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(30,0,'50574edb-44a9-478e-95be-667eb5544904',4,0,'/30/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(30,1,'50574edb-44a9-478e-95be-667eb5544904',4,0,'/30/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(30,2,'50574edb-44a9-478e-95be-667eb5544904',4,0,'/30/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(31,0,'f8fe5f1c-5d93-410b-a4f8-2fe4d23a09d3',4,0,'/31/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(31,1,'f8fe5f1c-5d93-410b-a4f8-2fe4d23a09d3',4,0,'/31/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(31,2,'f8fe5f1c-5d93-410b-a4f8-2fe4d23a09d3',4,0,'/31/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(32,0,'394967c5-1e82-4f28-b042-0ee103a7783f',4,0,'/32/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(32,1,'394967c5-1e82-4f28-b042-0ee103a7783f',4,0,'/32/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(32,2,'394967c5-1e82-4f28-b042-0ee103a7783f',4,0,'/32/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(33,0,'35efc136-f18e-411e-97ac-e4ed8e41ace1',4,0,'/33/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(33,1,'35efc136-f18e-411e-97ac-e4ed8e41ace1',4,0,'/33/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(33,2,'35efc136-f18e-411e-97ac-e4ed8e41ace1',4,0,'/33/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(34,0,'a68c5f26-a1cb-4128-9c31-dbe4b6b62a89',4,0,'/34/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(34,1,'a68c5f26-a1cb-4128-9c31-dbe4b6b62a89',4,0,'/34/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(34,2,'a68c5f26-a1cb-4128-9c31-dbe4b6b62a89',4,0,'/34/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(36,0,'5bf87057-f29e-4245-a4a5-2152feb68495',4,2,'/30/37/36/',37,'main',0,'contentful_entry_field','string','standard','Title','[]',0,'en',1),(36,1,'5bf87057-f29e-4245-a4a5-2152feb68495',4,2,'/30/37/36/',37,'main',0,'contentful_entry_field','string','standard','Title','[]',0,'en',1),(36,2,'5bf87057-f29e-4245-a4a5-2152feb68495',4,2,'/30/37/36/',37,'main',0,'contentful_entry_field','string','standard','Title','[]',0,'en',1),(37,0,'07a347df-1fff-44d5-b895-7e0df6f45a38',4,1,'/30/37/',30,'root',0,'column','column','standard','','[]',1,'en',1),(37,1,'07a347df-1fff-44d5-b895-7e0df6f45a38',4,1,'/30/37/',30,'root',0,'column','column','standard','','[]',1,'en',1),(37,2,'07a347df-1fff-44d5-b895-7e0df6f45a38',4,1,'/30/37/',30,'root',0,'column','column','standard','','[]',1,'en',1),(38,0,'7ac1e488-c09e-483d-b0bc-31767111a844',4,2,'/30/37/38/',37,'main',1,'contentful_entry_field','string','standard','Short Description','[]',0,'en',1),(38,1,'7ac1e488-c09e-483d-b0bc-31767111a844',4,2,'/30/37/38/',37,'main',1,'contentful_entry_field','string','standard','Short Description','[]',0,'en',1),(38,2,'7ac1e488-c09e-483d-b0bc-31767111a844',4,2,'/30/37/38/',37,'main',1,'contentful_entry_field','string','standard','Short Description','[]',0,'en',1),(39,0,'a426c989-cef1-4d42-9e71-37ba108bbef6',4,2,'/30/37/39/',37,'main',2,'contentful_entry_field','assets','standard','Image','[]',0,'en',1),(39,1,'a426c989-cef1-4d42-9e71-37ba108bbef6',4,2,'/30/37/39/',37,'main',2,'contentful_entry_field','assets','standard','Image','[]',0,'en',1),(39,2,'a426c989-cef1-4d42-9e71-37ba108bbef6',4,2,'/30/37/39/',37,'main',2,'contentful_entry_field','assets','standard','Image','[]',0,'en',1),(45,0,'947a0454-ba68-41ef-9208-e2fbeba10ffa',4,2,'/33/66/45/',66,'left',1,'contentful_entry_field','richtext','standard','Technique HTML','[]',0,'en',1),(45,1,'947a0454-ba68-41ef-9208-e2fbeba10ffa',4,2,'/33/66/45/',66,'left',1,'contentful_entry_field','richtext','standard','Technique HTML','[]',0,'en',1),(45,2,'947a0454-ba68-41ef-9208-e2fbeba10ffa',4,2,'/33/66/45/',66,'left',1,'contentful_entry_field','richtext','standard','Technique HTML','[]',0,'en',1),(46,0,'d9d6cc96-4582-4b63-9d66-7b18a4cb3b46',4,2,'/33/66/46/',66,'left',0,'title','title','standard','','[]',1,'en',1),(46,1,'d9d6cc96-4582-4b63-9d66-7b18a4cb3b46',4,2,'/33/66/46/',66,'left',0,'title','title','standard','','[]',1,'en',1),(46,2,'d9d6cc96-4582-4b63-9d66-7b18a4cb3b46',4,2,'/33/66/46/',66,'left',0,'title','title','standard','','[]',1,'en',1),(48,0,'fb0c601e-11fe-4f04-a188-9190c5563c09',4,2,'/33/66/48/',66,'right',0,'contentful_entry_field','entries','standard','Advertisement','[]',0,'en',1),(48,1,'fb0c601e-11fe-4f04-a188-9190c5563c09',4,2,'/33/66/48/',66,'right',0,'contentful_entry_field','entries','standard','Advertisement','[]',0,'en',1),(48,2,'fb0c601e-11fe-4f04-a188-9190c5563c09',4,2,'/33/66/48/',66,'right',0,'contentful_entry_field','entries','standard','Advertisement','[]',0,'en',1),(49,1,'ef97adad-8e86-4ac3-aeee-e8cd3de5d220',2,1,'/10/49/',10,'root',1,'list','grid','standard','Featured Skills','[]',0,'en',1),(49,2,'ef97adad-8e86-4ac3-aeee-e8cd3de5d220',2,1,'/10/49/',10,'root',1,'list','grid','standard','Featured Skills','[]',0,'en',1),(50,1,'4baea75c-135f-49d9-8cab-7ca3a688efc3',5,0,'/50/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(50,2,'4baea75c-135f-49d9-8cab-7ca3a688efc3',5,0,'/50/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(51,1,'9e3bb131-3ef6-4017-a9fd-ca0018c1ed19',5,0,'/51/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(51,2,'9e3bb131-3ef6-4017-a9fd-ca0018c1ed19',5,0,'/51/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(52,1,'9335ba8e-c073-4262-9575-46e6b6f01ea7',5,0,'/52/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(52,2,'9335ba8e-c073-4262-9575-46e6b6f01ea7',5,0,'/52/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(53,1,'fe9470d7-209b-4796-87cc-1522addcd9d5',5,0,'/53/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(53,2,'fe9470d7-209b-4796-87cc-1522addcd9d5',5,0,'/53/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(54,1,'4ba44e5b-aee4-4c14-961a-e1f1703e3dc8',5,0,'/54/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(54,2,'4ba44e5b-aee4-4c14-961a-e1f1703e3dc8',5,0,'/54/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(55,1,'d919d44b-a16e-4bc3-bba1-e7ddba2631d8',5,1,'/51/55/',51,'root',0,'column','column','standard','','[]',1,'en',1),(55,2,'d919d44b-a16e-4bc3-bba1-e7ddba2631d8',5,1,'/51/55/',51,'root',0,'column','column','standard','','[]',1,'en',1),(56,1,'df13de37-57fd-4578-8e0e-9e8cc04f5382',5,2,'/51/55/56/',55,'main',0,'title','title','standard','','[]',1,'en',1),(56,2,'df13de37-57fd-4578-8e0e-9e8cc04f5382',5,2,'/51/55/56/',55,'main',0,'title','title','standard','','[]',1,'en',1),(57,1,'0dc719e6-85b9-4a7f-9bee-f27ae4771294',5,2,'/51/55/57/',55,'main',1,'text','text','standard','','[]',1,'en',1),(57,2,'0dc719e6-85b9-4a7f-9bee-f27ae4771294',5,2,'/51/55/57/',55,'main',1,'text','text','standard','','[]',1,'en',1),(58,1,'d1a48494-cb2f-40b3-8855-7ae5d4fbad7f',5,1,'/52/58/',52,'root',0,'list','grid','skill_big_view','Skills','[]',0,'en',1),(58,2,'d1a48494-cb2f-40b3-8855-7ae5d4fbad7f',5,1,'/52/58/',52,'root',0,'list','grid','skill_big_view','Skills','[]',0,'en',1),(59,0,'aecc6a7d-f7ae-4b88-b708-b6826302a4ef',6,0,'/59/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(59,1,'aecc6a7d-f7ae-4b88-b708-b6826302a4ef',6,0,'/59/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(59,2,'aecc6a7d-f7ae-4b88-b708-b6826302a4ef',6,0,'/59/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(60,0,'a9e54fa2-7e53-45e0-96a1-f73104fce083',6,0,'/60/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(60,1,'a9e54fa2-7e53-45e0-96a1-f73104fce083',6,0,'/60/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(60,2,'a9e54fa2-7e53-45e0-96a1-f73104fce083',6,0,'/60/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(61,0,'2f246baf-bf3a-4104-bbd0-fe584b081ee9',6,0,'/61/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(61,1,'2f246baf-bf3a-4104-bbd0-fe584b081ee9',6,0,'/61/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(61,2,'2f246baf-bf3a-4104-bbd0-fe584b081ee9',6,0,'/61/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(62,0,'cc7ddf4b-fb96-4051-8218-fe8d10bdeea3',6,0,'/62/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(62,1,'cc7ddf4b-fb96-4051-8218-fe8d10bdeea3',6,0,'/62/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(62,2,'cc7ddf4b-fb96-4051-8218-fe8d10bdeea3',6,0,'/62/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(63,0,'87f7d1d7-5add-42ff-97ca-f5a7c80db9fc',6,0,'/63/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(63,1,'87f7d1d7-5add-42ff-97ca-f5a7c80db9fc',6,0,'/63/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(63,2,'87f7d1d7-5add-42ff-97ca-f5a7c80db9fc',6,0,'/63/',NULL,NULL,NULL,'','','','','[]',0,'en',1),(64,0,'66b2cc0d-43c2-4241-98d8-252b02e9caaf',6,1,'/60/64/',60,'root',0,'full_view','full_view','standard','','[]',0,'en',1),(64,1,'66b2cc0d-43c2-4241-98d8-252b02e9caaf',6,1,'/60/64/',60,'root',0,'full_view','full_view','standard','','[]',0,'en',1),(64,2,'66b2cc0d-43c2-4241-98d8-252b02e9caaf',6,1,'/60/64/',60,'root',0,'full_view','full_view','standard','','[]',0,'en',1),(65,0,'00e54173-44c9-4475-86bb-70ec10e25834',6,1,'/61/65/',61,'root',0,'list','one_by_two','standard','','[]',0,'en',1),(65,1,'00e54173-44c9-4475-86bb-70ec10e25834',6,1,'/61/65/',61,'root',0,'list','one_by_two','standard','','[]',0,'en',1),(65,2,'00e54173-44c9-4475-86bb-70ec10e25834',6,1,'/61/65/',61,'root',0,'list','one_by_two','standard','','[]',0,'en',1),(66,0,'e8bae6bc-06f4-4432-8fdd-d2cb4ca2f2ba',4,1,'/33/66/',33,'root',0,'two_columns','two_columns_66_33','standard','','[]',1,'en',1),(66,1,'e8bae6bc-06f4-4432-8fdd-d2cb4ca2f2ba',4,1,'/33/66/',33,'root',0,'two_columns','two_columns_66_33','standard','','[]',1,'en',1),(66,2,'e8bae6bc-06f4-4432-8fdd-d2cb4ca2f2ba',4,1,'/33/66/',33,'root',0,'two_columns','two_columns_66_33','standard','','[]',1,'en',1);
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
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `nglayouts_block_collection` VALUES (14,1,'default',1,1),(14,2,'default',1,2),(49,1,'default',2,1),(49,2,'default',2,2),(58,1,'default',3,1),(58,2,'default',3,2),(65,0,'default',4,0),(65,1,'default',4,1),(65,2,'default',4,2);
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
INSERT INTO `nglayouts_block_translation` VALUES (1,1,'en','[]'),(2,1,'en','[]'),(3,1,'en','[]'),(4,1,'en','[]'),(5,1,'en','[]'),(6,1,'en','{\"block_name\":\"nav\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(7,1,'en','{\"block_name\":\"footer\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(8,1,'en','[]'),(8,2,'en','[]'),(9,1,'en','[]'),(9,2,'en','[]'),(10,1,'en','[]'),(10,2,'en','[]'),(11,1,'en','[]'),(11,2,'en','[]'),(12,1,'en','[]'),(12,2,'en','[]'),(13,1,'en','{\"block_name\":\"hero\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(13,2,'en','{\"block_name\":\"hero\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(14,1,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":true,\"paged_collections:type\":\"load_more\",\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(14,2,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":true,\"paged_collections:type\":\"load_more\",\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(15,1,'en','{\"block_name\":\"subscribe_newsletter\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(15,2,'en','{\"block_name\":\"subscribe_newsletter\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(16,1,'en','{\"block_name\":\"featured_skills\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(16,2,'en','{\"block_name\":\"featured_skills\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(17,1,'en','[]'),(17,2,'en','[]'),(18,1,'en','[]'),(18,2,'en','[]'),(19,1,'en','[]'),(19,2,'en','[]'),(20,1,'en','[]'),(20,2,'en','[]'),(21,1,'en','[]'),(21,2,'en','[]'),(22,1,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(22,2,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(23,1,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(23,2,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(24,1,'en','{\"tag\":\"h2\",\"title\":\"Latest Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":\"text-center my-5\",\"css_id\":null,\"set_container\":false}'),(24,2,'en','{\"tag\":\"h2\",\"title\":\"Latest Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":\"text-center my-5\",\"css_id\":null,\"set_container\":false}'),(25,1,'en','{\"tag\":\"h1\",\"title\":\"Doggone Good Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(25,2,'en','{\"tag\":\"h1\",\"title\":\"Doggone Good Recipes\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(26,1,'en','{\"content\":\"Recipes your pup will love!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(26,2,'en','{\"content\":\"Recipes your pup will love!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(28,1,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(28,2,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(29,0,'en','[]'),(29,1,'en','[]'),(29,2,'en','[]'),(30,0,'en','[]'),(30,1,'en','[]'),(30,2,'en','[]'),(31,0,'en','[]'),(31,1,'en','[]'),(31,2,'en','[]'),(32,0,'en','[]'),(32,1,'en','[]'),(32,2,'en','[]'),(33,0,'en','[]'),(33,1,'en','[]'),(33,2,'en','[]'),(34,0,'en','[]'),(34,1,'en','[]'),(34,2,'en','[]'),(36,0,'en','{\"field_identifier\":\"title\",\"width\":0.0,\"height\":0.0,\"html_element\":\"h1\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(36,1,'en','{\"field_identifier\":\"title\",\"width\":0.0,\"height\":0.0,\"html_element\":\"h1\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(36,2,'en','{\"field_identifier\":\"title\",\"width\":0.0,\"height\":0.0,\"html_element\":\"h1\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(37,0,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(37,1,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(37,2,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(38,0,'en','{\"field_identifier\":\"shortDescription\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(38,1,'en','{\"field_identifier\":\"shortDescription\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(38,2,'en','{\"field_identifier\":\"shortDescription\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(39,0,'en','{\"field_identifier\":\"image\",\"width\":200.0,\"height\":200.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":\"rounded\",\"css_id\":null,\"set_container\":false}'),(39,1,'en','{\"field_identifier\":\"image\",\"width\":200.0,\"height\":200.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":\"rounded\",\"css_id\":null,\"set_container\":false}'),(39,2,'en','{\"field_identifier\":\"image\",\"width\":200.0,\"height\":200.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":\"rounded\",\"css_id\":null,\"set_container\":false}'),(45,0,'en','{\"field_identifier\":\"technique\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(45,1,'en','{\"field_identifier\":\"technique\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(45,2,'en','{\"field_identifier\":\"technique\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(46,0,'en','{\"tag\":\"h3\",\"title\":\"The Technique:\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(46,1,'en','{\"tag\":\"h3\",\"title\":\"The Technique:\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(46,2,'en','{\"tag\":\"h3\",\"title\":\"The Technique:\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(48,0,'en','{\"field_identifier\":\"advertisement\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(48,1,'en','{\"field_identifier\":\"advertisement\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(48,2,'en','{\"field_identifier\":\"advertisement\",\"width\":0.0,\"height\":0.0,\"html_element\":\"div\",\"datetime_format\":\"Y-m-d\",\"zoom\":\"5\",\"map_type\":\"block.contentful_entry_field.map_type.roadmap\",\"show_marker\":true,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(49,1,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(49,2,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(50,1,'en','[]'),(50,2,'en','[]'),(51,1,'en','[]'),(51,2,'en','[]'),(52,1,'en','[]'),(52,2,'en','[]'),(53,1,'en','[]'),(53,2,'en','[]'),(54,1,'en','[]'),(54,2,'en','[]'),(55,1,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(55,2,'en','{\"css_class\":\"hero-wrapper\",\"css_id\":null,\"set_container\":false}'),(56,1,'en','{\"tag\":\"h1\",\"title\":\"All Skills\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(56,2,'en','{\"tag\":\"h1\",\"title\":\"All Skills\",\"use_link\":false,\"link\":{\"link_type\":null,\"link\":null,\"link_suffix\":null,\"new_window\":false},\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(57,1,'en','{\"content\":\"Dog turning up his nose? Improve your skills!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(57,2,'en','{\"content\":\"Dog turning up his nose? Improve your skills!\",\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(58,1,'en','{\"number_of_columns\":2,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(58,2,'en','{\"number_of_columns\":2,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(59,0,'en','[]'),(59,1,'en','[]'),(59,2,'en','[]'),(60,0,'en','[]'),(60,1,'en','[]'),(60,2,'en','[]'),(61,0,'en','[]'),(61,1,'en','[]'),(61,2,'en','[]'),(62,0,'en','[]'),(62,1,'en','[]'),(62,2,'en','[]'),(63,0,'en','[]'),(63,1,'en','[]'),(63,2,'en','[]'),(64,0,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(64,1,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(64,2,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":null}'),(65,0,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(65,1,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":true}'),(65,2,'en','{\"number_of_columns\":3,\"paged_collections:enabled\":false,\"paged_collections:type\":null,\"paged_collections:max_pages\":null,\"paged_collections:ajax_first\":false,\"css_class\":null,\"css_id\":null,\"set_container\":false}'),(66,0,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":true,\"vertical_whitespace:enabled\":true,\"vertical_whitespace:top\":\"medium\",\"vertical_whitespace:bottom\":\"none\"}'),(66,1,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":true,\"vertical_whitespace:enabled\":true,\"vertical_whitespace:top\":\"medium\",\"vertical_whitespace:bottom\":\"none\"}'),(66,2,'en','{\"css_class\":null,\"css_id\":null,\"set_container\":true}');
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` int NOT NULL,
  `length` int DEFAULT NULL,
  `translatable` tinyint NOT NULL,
  `main_locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `always_available` tinyint NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_uuid` (`uuid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection`
--

LOCK TABLES `nglayouts_collection` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection` DISABLE KEYS */;
INSERT INTO `nglayouts_collection` VALUES (1,1,'af1cf318-b213-4d99-b78b-2f6c58724725',0,3,0,'en',1),(1,2,'af1cf318-b213-4d99-b78b-2f6c58724725',0,3,0,'en',1),(2,1,'bcc031b3-580b-43d9-b979-39bbb26208b6',0,NULL,0,'en',1),(2,2,'bcc031b3-580b-43d9-b979-39bbb26208b6',0,NULL,0,'en',1),(3,1,'f70232ae-41dd-4bc9-a756-04623035267b',0,3,0,'en',1),(3,2,'f70232ae-41dd-4bc9-a756-04623035267b',0,3,0,'en',1),(4,0,'64a49c5f-951a-48bc-b75a-54f164ea8f26',0,NULL,0,'en',1),(4,1,'64a49c5f-951a-48bc-b75a-54f164ea8f26',0,NULL,0,'en',1),(4,2,'64a49c5f-951a-48bc-b75a-54f164ea8f26',0,NULL,0,'en',1);
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int NOT NULL,
  `position` int NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_item_uuid` (`uuid`,`status`),
  KEY `idx_ngl_collection` (`collection_id`,`status`),
  CONSTRAINT `fk_ngl_item_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_item`
--

LOCK TABLES `nglayouts_collection_item` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_item` DISABLE KEYS */;
INSERT INTO `nglayouts_collection_item` VALUES (1,1,'8dbe46bb-cf1c-41a1-a775-9779a6e45064',2,1,'uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB','contentful_entry',NULL,'[]'),(1,2,'8dbe46bb-cf1c-41a1-a775-9779a6e45064',2,1,'uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB','contentful_entry',NULL,'[]'),(2,1,'82645f51-2e97-4e41-bb3e-3e4aafb1f8fe',2,0,'uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','contentful_entry',NULL,'[]'),(2,2,'82645f51-2e97-4e41-bb3e-3e4aafb1f8fe',2,0,'uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','contentful_entry',NULL,'[]'),(6,0,'8ad35906-9395-40b1-80fa-c1a2825bb610',4,2,'uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn','contentful_entry',NULL,'[]'),(6,1,'8ad35906-9395-40b1-80fa-c1a2825bb610',4,2,'uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn','contentful_entry',NULL,'[]'),(6,2,'8ad35906-9395-40b1-80fa-c1a2825bb610',4,2,'uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn','contentful_entry',NULL,'[]'),(7,0,'31a1e44f-7793-4a06-a243-c265bad75b6a',4,1,'uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc','contentful_entry',NULL,'[]'),(7,1,'31a1e44f-7793-4a06-a243-c265bad75b6a',4,1,'uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc','contentful_entry',NULL,'[]'),(7,2,'31a1e44f-7793-4a06-a243-c265bad75b6a',4,1,'uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc','contentful_entry',NULL,'[]'),(8,0,'10500423-e343-4597-8a53-bfcf0c14e411',4,0,'uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','contentful_entry',NULL,'[]'),(8,1,'10500423-e343-4597-8a53-bfcf0c14e411',4,0,'uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','contentful_entry',NULL,'[]'),(8,2,'10500423-e343-4597-8a53-bfcf0c14e411',4,0,'uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj','contentful_entry',NULL,'[]');
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_collection_query_uuid` (`uuid`,`status`),
  KEY `idx_ngl_collection` (`collection_id`,`status`),
  CONSTRAINT `fk_ngl_query_collection` FOREIGN KEY (`collection_id`, `status`) REFERENCES `nglayouts_collection` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_collection_query`
--

LOCK TABLES `nglayouts_collection_query` WRITE;
/*!40000 ALTER TABLE `nglayouts_collection_query` DISABLE KEYS */;
INSERT INTO `nglayouts_collection_query` VALUES (1,1,'9a880437-620a-4493-a9f7-1ea8695c871a',1,'latest_recipes'),(1,2,'9a880437-620a-4493-a9f7-1ea8695c871a',1,'latest_recipes'),(3,1,'b0d9fb2d-4294-4d69-89bd-664afb095120',3,'contentful_search'),(3,2,'b0d9fb2d-4294-4d69-89bd-664afb095120',3,'contentful_search');
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
INSERT INTO `nglayouts_collection_query_translation` VALUES (1,1,'en','{\"term\":null}'),(1,2,'en','{\"term\":null}'),(3,1,'en','{\"client\":\"main|skill\",\"sort_type\":\"sys.createdAt\",\"sort_direction\":true,\"search_text\":null}'),(3,2,'en','{\"client\":\"main|skill\",\"sort_type\":\"sys.createdAt\",\"sort_direction\":true,\"search_text\":null}');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `nglayouts_collection_translation` VALUES (1,1,'en'),(1,2,'en'),(2,1,'en'),(2,2,'en'),(3,1,'en'),(3,2,'en'),(4,0,'en'),(4,1,'en'),(4,2,'en');
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int NOT NULL,
  `modified` int NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `main_locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_layout_uuid` (`uuid`,`status`),
  KEY `idx_ngl_layout_name` (`name`),
  KEY `idx_ngl_layout_type` (`type`),
  KEY `idx_ngl_layout_shared` (`shared`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_layout`
--

LOCK TABLES `nglayouts_layout` WRITE;
/*!40000 ALTER TABLE `nglayouts_layout` DISABLE KEYS */;
INSERT INTO `nglayouts_layout` VALUES (1,1,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','layout_2','Header & Footer','',1666615470,1666615503,1,'en'),(2,1,'7841f3ca-485f-46bd-8cae-374f868d4212','layout_2','Homepage','',1666615533,1666629460,0,'en'),(2,2,'7841f3ca-485f-46bd-8cae-374f868d4212','layout_2','','',1666615533,1666622302,0,'en'),(3,1,'ae3495b2-038e-4705-9569-b892bca35de4','layout_2','Recipes','',1666615923,1666616692,0,'en'),(3,2,'ae3495b2-038e-4705-9569-b892bca35de4','layout_2','','',1666615923,1666616457,0,'en'),(4,0,'391b215f-e32a-41da-88a8-89465a07e3cf','layout_5','Individual Skill Page','',1666616828,1666640264,0,'en'),(4,1,'391b215f-e32a-41da-88a8-89465a07e3cf','layout_5','Individual Skill Page','',1666616828,1666640264,0,'en'),(4,2,'391b215f-e32a-41da-88a8-89465a07e3cf','layout_5','','',1666616828,1666640054,0,'en'),(5,1,'f21da41a-9afb-4bd8-bb7a-c97940b6e7d1','layout_2','Skills List','',1666622310,1666638440,0,'en'),(5,2,'f21da41a-9afb-4bd8-bb7a-c97940b6e7d1','layout_2','','',1666622310,1666637818,0,'en'),(6,0,'ad3a1697-92e6-4633-a1a4-0cb1c84dc501','layout_2','Individual Recipe Layout','',1666634232,1666635814,0,'en'),(6,1,'ad3a1697-92e6-4633-a1a4-0cb1c84dc501','layout_2','Individual Recipe Layout','',1666634232,1666635814,0,'en'),(6,2,'ad3a1697-92e6-4633-a1a4-0cb1c84dc501','layout_2','','',1666634232,1666635075,0,'en');
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
INSERT INTO `nglayouts_layout_translation` VALUES (1,1,'en'),(2,1,'en'),(2,2,'en'),(3,1,'en'),(3,2,'en'),(4,0,'en'),(4,1,'en'),(4,2,'en'),(5,1,'en'),(5,2,'en'),(6,0,'en'),(6,1,'en'),(6,2,'en');
/*!40000 ALTER TABLE `nglayouts_layout_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_migration_versions`
--

DROP TABLE IF EXISTS `nglayouts_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
INSERT INTO `nglayouts_migration_versions` VALUES ('Netgen\\Layouts\\Migrations\\Doctrine\\Version000700','2022-10-24 12:39:39',1434),('Netgen\\Layouts\\Migrations\\Doctrine\\Version000800','2022-10-24 12:39:40',299),('Netgen\\Layouts\\Migrations\\Doctrine\\Version000900','2022-10-24 12:39:41',460),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001000','2022-10-24 12:39:41',240),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001100','2022-10-24 12:39:41',182),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001200','2022-10-24 12:39:42',88),('Netgen\\Layouts\\Migrations\\Doctrine\\Version001300','2022-10-24 12:39:42',177),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010000','2022-10-24 12:39:42',1283),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010200','2022-10-24 12:39:43',934),('Netgen\\Layouts\\Migrations\\Doctrine\\Version010300','2022-10-24 12:39:44',279);
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limitations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group_id` int NOT NULL,
  `layout_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_uuid` (`uuid`,`status`),
  KEY `idx_ngl_related_layout` (`layout_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule`
--

LOCK TABLES `nglayouts_rule` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule` DISABLE KEYS */;
INSERT INTO `nglayouts_rule` VALUES (1,1,'cca4cb3e-3ae5-433a-b4ce-5fd23b173194',1,'7841f3ca-485f-46bd-8cae-374f868d4212',''),(1,2,'cca4cb3e-3ae5-433a-b4ce-5fd23b173194',1,'7841f3ca-485f-46bd-8cae-374f868d4212',''),(2,1,'4d0577b9-8d82-4680-a48e-f626f2cf23f0',1,'ae3495b2-038e-4705-9569-b892bca35de4',''),(2,2,'4d0577b9-8d82-4680-a48e-f626f2cf23f0',1,NULL,''),(3,1,'488945ee-a692-4ecc-96c7-0af6d6e407bd',1,'391b215f-e32a-41da-88a8-89465a07e3cf',''),(3,2,'488945ee-a692-4ecc-96c7-0af6d6e407bd',1,'391b215f-e32a-41da-88a8-89465a07e3cf',''),(4,1,'023b0bcc-3956-4ae9-bea5-109ca8dc021a',1,'f21da41a-9afb-4bd8-bb7a-c97940b6e7d1',''),(4,2,'023b0bcc-3956-4ae9-bea5-109ca8dc021a',1,'f21da41a-9afb-4bd8-bb7a-c97940b6e7d1',''),(5,1,'13318b37-aced-4a59-9412-9ee917b948dc',1,'ad3a1697-92e6-4633-a1a4-0cb1c84dc501',''),(5,2,'13318b37-aced-4a59-9412-9ee917b948dc',1,'ad3a1697-92e6-4633-a1a4-0cb1c84dc501','');
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_condition_uuid` (`uuid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_condition`
--

LOCK TABLES `nglayouts_rule_condition` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_condition` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_condition` VALUES (1,1,'bff4ba02-58b2-4b02-b51f-dfd62917cd5c','contentful_content_type','[\"skill\"]');
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
INSERT INTO `nglayouts_rule_condition_rule` VALUES (1,1,3,1);
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
INSERT INTO `nglayouts_rule_data` VALUES (1,1,0),(2,1,-10),(3,1,-20),(4,1,-30),(5,1,-40);
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
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `idx_ngl_rule_target_uuid` (`uuid`,`status`),
  KEY `idx_ngl_rule` (`rule_id`,`status`),
  KEY `idx_ngl_target_type` (`type`),
  CONSTRAINT `fk_ngl_target_rule` FOREIGN KEY (`rule_id`, `status`) REFERENCES `nglayouts_rule` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nglayouts_rule_target`
--

LOCK TABLES `nglayouts_rule_target` WRITE;
/*!40000 ALTER TABLE `nglayouts_rule_target` DISABLE KEYS */;
INSERT INTO `nglayouts_rule_target` VALUES (1,2,'5eac0d3e-5565-46e3-9568-eb2819c56d2e',1,'path_info','app_homepage'),(2,1,'3518dbd0-948f-40c6-bc71-a3bb945a681f',1,'route','app_homepage'),(3,1,'9cbe3641-f728-426b-b024-2107a0b238cb',2,'path_info','/recipes'),(3,2,'9cbe3641-f728-426b-b024-2107a0b238cb',2,'path_info','/recipes'),(4,1,'310cd4dc-7db7-447d-ad62-029fe3250db9',3,'contentful_space','uvx9svgj8l12'),(4,2,'310cd4dc-7db7-447d-ad62-029fe3250db9',3,'contentful_space','uvx9svgj8l12'),(5,1,'c01d6d85-d30a-45f7-b40a-263f0c317131',4,'route','app_skills'),(6,1,'fc0b9cd9-3ab2-4be8-95ee-d2e299e2dcdc',5,'route','app_recipes_show'),(6,2,'fc0b9cd9-3ab2-4be8-95ee-d2e299e2dcdc',5,'route','app_recipe_show');
/*!40000 ALTER TABLE `nglayouts_rule_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nglayouts_zone`
--

DROP TABLE IF EXISTS `nglayouts_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nglayouts_zone` (
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout_id` int NOT NULL,
  `status` int NOT NULL,
  `root_block_id` int NOT NULL,
  `linked_layout_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked_zone_identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `nglayouts_zone` VALUES ('footer',1,1,5,NULL,NULL),('footer',2,1,12,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',2,2,12,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',3,1,21,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',3,2,21,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',4,0,34,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',4,1,34,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',4,2,34,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',5,1,54,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',5,2,54,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',6,0,63,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',6,1,63,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('footer',6,2,63,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','footer'),('header',1,1,1,NULL,NULL),('header',2,1,8,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',2,2,8,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',3,1,17,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',3,2,17,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',4,0,29,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',4,1,29,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',4,2,29,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',5,1,50,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',5,2,50,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',6,0,59,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',6,1,59,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('header',6,2,59,'808ec12b-66e7-41d4-8a8b-2e274305eaa3','header'),('left',4,0,31,NULL,NULL),('left',4,1,31,NULL,NULL),('left',4,2,31,NULL,NULL),('main',1,1,3,NULL,NULL),('main',2,1,10,NULL,NULL),('main',2,2,10,NULL,NULL),('main',3,1,19,NULL,NULL),('main',3,2,19,NULL,NULL),('main',5,1,52,NULL,NULL),('main',5,2,52,NULL,NULL),('main',6,0,61,NULL,NULL),('main',6,1,61,NULL,NULL),('main',6,2,61,NULL,NULL),('post_header',1,1,2,NULL,NULL),('post_header',2,1,9,NULL,NULL),('post_header',2,2,9,NULL,NULL),('post_header',3,1,18,NULL,NULL),('post_header',3,2,18,NULL,NULL),('post_header',4,0,30,NULL,NULL),('post_header',4,1,30,NULL,NULL),('post_header',4,2,30,NULL,NULL),('post_header',5,1,51,NULL,NULL),('post_header',5,2,51,NULL,NULL),('post_header',6,0,60,NULL,NULL),('post_header',6,1,60,NULL,NULL),('post_header',6,2,60,NULL,NULL),('pre_footer',1,1,4,NULL,NULL),('pre_footer',2,1,11,NULL,NULL),('pre_footer',2,2,11,NULL,NULL),('pre_footer',3,1,20,NULL,NULL),('pre_footer',3,2,20,NULL,NULL),('pre_footer',4,0,33,NULL,NULL),('pre_footer',4,1,33,NULL,NULL),('pre_footer',4,2,33,NULL,NULL),('pre_footer',5,1,53,NULL,NULL),('pre_footer',5,2,53,NULL,NULL),('pre_footer',6,0,62,NULL,NULL),('pre_footer',6,1,62,NULL,NULL),('pre_footer',6,2,62,NULL,NULL),('right',4,0,32,NULL,NULL),('right',4,1,32,NULL,NULL),('right',4,2,32,NULL,NULL);
/*!40000 ALTER TABLE `nglayouts_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orm_redirects`
--

DROP TABLE IF EXISTS `orm_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orm_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemes` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `methods` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `defaults` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `requirements` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `condition_expr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staticPrefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent` tinyint(1) NOT NULL,
  `routeTargetId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6CA17E0391F30BA8` (`routeName`),
  KEY `IDX_6CA17E034C0848C6` (`routeTargetId`),
  KEY `IDX_6CA17E03A5B5867E` (`staticPrefix`),
  CONSTRAINT `FK_6CA17E034C0848C6` FOREIGN KEY (`routeTargetId`) REFERENCES `orm_routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orm_redirects`
--

LOCK TABLES `orm_redirects` WRITE;
/*!40000 ALTER TABLE `orm_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `orm_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orm_routes`
--

DROP TABLE IF EXISTS `orm_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orm_routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemes` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `methods` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `defaults` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `requirements` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `condition_expr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staticPrefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`),
  KEY `IDX_5793FCA5B5867E` (`staticPrefix`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orm_routes`
--

LOCK TABLES `orm_routes` WRITE;
/*!40000 ALTER TABLE `orm_routes` DISABLE KEYS */;
INSERT INTO `orm_routes` VALUES (1,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:84:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc\";}','a:0:{}','a:0:{}','',NULL,'/skills/basic-chop','uvx9svgj8l12|2CMx2vRvhqYvygnIen1hpc',0),(2,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:84:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj\";}','a:0:{}','a:0:{}','',NULL,'/skills/folding-in-cheese','uvx9svgj8l12|2Ajye4zzW8cQ0s70b82KXj',0),(3,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:84:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn\";}','a:0:{}','a:0:{}','',NULL,'/skills/julienne-like-a-pro','uvx9svgj8l12|26CWT8pwt6mRWWrSb0vtfn',0),(4,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:83:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB\";}','a:0:{}','a:0:{}','',NULL,'/skills/weighing-your-ingredients','uvx9svgj8l12|PXKvUy2bWslVs3W1gHIqB',0),(5,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:83:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|EjKxMFWeUgHXjvKcKKLjN\";}','a:0:{}','a:0:{}','',NULL,'/skills/mashing','uvx9svgj8l12|EjKxMFWeUgHXjvKcKKLjN',0),(6,'','a:0:{}','a:0:{}','a:1:{s:11:\"_content_id\";s:84:\"Netgen\\Layouts\\Contentful\\Entity\\ContentfulEntry:uvx9svgj8l12|28zrrzEHE9IcpbSKAaAVt8\";}','a:0:{}','a:0:{}','',NULL,'/_ad','uvx9svgj8l12|28zrrzEHE9IcpbSKAaAVt8',0);
/*!40000 ALTER TABLE `orm_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` json NOT NULL,
  `instructions` json NOT NULL,
  `total_time` int NOT NULL,
  `source_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `recipe` VALUES (1,'Dolorem vel hic incidunt','Ipsam veniam corrupti doloribus sit magni sed.','dolorem-vel-hic-incidunt','saepe-molestias-provident.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',30,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:23','2022-10-19 19:37:23'),(2,'Blanditiis quia vero dolor','Sed accusamus repellat alias.','blanditiis-quia-vero-dolor','voluptate-qui.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',85,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(3,'Aut non perspiciatis ut','Quia iure quod delectus tempora enim voluptatem assumenda sequi.','aut-non-perspiciatis-ut','commodi-ea.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',46,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(4,'Similique quo corrupti autem','Et optio nisi qui odio sequi.','similique-quo-corrupti-autem','ut-eum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',38,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(5,'Unde ipsa aliquid vero','Ipsum assumenda maiores nihil porro non saepe esse.','unde-ipsa-aliquid-vero','nesciunt-quam-dolore.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',47,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(6,'Iure dolore repellendus modi','Quia aut quis tenetur sed similique tenetur.','iure-dolore-repellendus-modi','ut-illum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',52,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(7,'Explicabo animi ut recusandae','Nihil doloribus vitae modi vel illum.','explicabo-animi-ut-recusandae','minima-voluptatem.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',77,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(8,'Doloremque doloribus et recusandae','Natus temporibus omnis dolores quam.','doloremque-doloribus-et-recusandae','cupiditate-perferendis-repudiandae.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',49,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(9,'Nesciunt dolor expedita animi','Repellat similique eos voluptatem sequi qui.','nesciunt-dolor-expedita-animi','voluptatibus-id.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',78,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(10,'Exercitationem cupiditate id et','Distinctio quaerat sint quia ex.','exercitationem-cupiditate-id-et','cum-dolor.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',19,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(11,'Similique velit quis rerum','Vitae enim animi nihil porro nam voluptatem.','similique-velit-quis-rerum','doloremque-vel.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',64,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(12,'Repellendus fugit facilis facere','Quasi dolores in dolores ea.','repellendus-fugit-facilis-facere','ea-sequi-omnis.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',29,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(13,'Voluptatum ut quia est','Maiores rerum ex molestiae.','voluptatum-ut-quia-est','voluptas-aut-sunt.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',29,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(14,'Ducimus voluptate quo maxime','Veniam sed voluptatem eum reprehenderit.','ducimus-voluptate-quo-maxime','illo-quaerat.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',57,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(15,'Ut dolorum quasi maiores','Eaque et voluptatem perferendis voluptatem.','ut-dolorum-quasi-maiores','culpa-quas.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',30,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(16,'Ex ab quasi sit','Atque a rerum reiciendis exercitationem eum aut dolore accusamus.','ex-ab-quasi-sit','reprehenderit-qui-excepturi.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',64,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(17,'Fugit est nostrum assumenda','Sed sed delectus deserunt sunt atque distinctio.','fugit-est-nostrum-assumenda','aut-qui.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',72,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(18,'Iusto ipsa cum quia','Ut voluptatum voluptas odit vel et nostrum.','iusto-ipsa-cum-quia','voluptatem-aliquid-laborum.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',64,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(19,'Id quo tempora quia','Numquam quaerat omnis asperiores maiores praesentium.','id-quo-tempora-quia','corporis-eos.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',63,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(20,'Dignissimos vel dolores et','Quia consequatur ut et totam facilis qui cumque.','dignissimos-vel-dolores-et','dolores-velit-ipsam.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',36,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(21,'Et temporibus quis odio','Eum voluptatum est harum omnis voluptatem quae laborum ullam.','et-temporibus-quis-odio','quia-cum-et.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',78,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(22,'Et eos et ea','Quisquam maiores debitis in sit necessitatibus optio.','et-eos-et-ea','blanditiis-exercitationem.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',34,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(23,'Debitis ea illo officia','Tempora et saepe quasi optio aperiam cumque.','debitis-ea-illo-officia','aspernatur-hic-alias.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',66,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(24,'Ex maiores officiis eos','Enim ea labore delectus molestiae voluptas quas sed ullam.','ex-maiores-officiis-eos','enim-qui-perspiciatis.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',34,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24'),(25,'Alias aperiam repudiandae quia','Iure sunt dolor sit consequuntur.','alias-aperiam-repudiandae-quia','quasi-voluptas-accusantium.png','[\"1 cup flour\", \"1/2 tsp baking soda\", \"1/8 cup vegetable oil\", \"1/4 cup natural peanut butter\", \"1/2 cup applesauce go with plain, unsweetened\", \"1/2 cup pumpkin puree make sure you use pure pumpkin, not canned pumpkin pie mix\", \"1 egg\"]','[\"Preheat oven to 177°C (350 °F)\", \"In a large bowl, combine flour and baking soda.\", \"In a separate bowl mix together vegetable oil, peanut butter, applesauce and pumpkin puree. Once combined, mix in egg and mix until combined.\\n                Combine wet and dry ingredients and stir until combined.\", \"Pour mixture into an 8\\\" round pan (a square pan can also be used) that has been greased with oil.\", \"Bake for approximately 25-30 minutes or until a toothpick inserted into the center comes out clean and the cake springs back when pressed lightly.\", \"Allow to cool on a wire rack prior to removing from pan.\", \"After cooling, add frosting if desired.\"]',19,'https://www.lovefromtheoven.com/spoiled-dog-cake-recipe/','2022-10-19 19:37:24','2022-10-19 19:37:24');
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
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'doggo@barkbite.com','[\"ROLE_ADMIN\"]','$2y$13$lf2giEwUgegTDe9MvNG/eu6PeEvbhIV/DkqCq47fT092C5LNLaAHS');
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

-- Dump completed on 2022-10-26 15:07:54
