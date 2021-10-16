-- MariaDB dump 10.19  Distrib 10.6.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: flarum_evase
-- ------------------------------------------------------
-- Server version	10.6.3-MariaDB-1:10.6.3+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_tokens`
--

DROP TABLE IF EXISTS `access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_tokens_token_unique` (`token`),
  KEY `access_tokens_user_id_foreign` (`user_id`),
  KEY `access_tokens_type_index` (`type`),
  CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_tokens`
--

LOCK TABLES `access_tokens` WRITE;
/*!40000 ALTER TABLE `access_tokens` DISABLE KEYS */;
INSERT INTO `access_tokens` VALUES (5,'FhtmdePJCnXevSq0AoOD3tGRs5IiuYGX9K9BfzET',4,'2021-10-01 23:22:30','2021-10-01 23:20:37','session_remember',NULL,NULL,NULL),(12,'7Rc6qTOgD5EOL6YT6EkrIZfVDH2zzrMADBdjbX3J',1,'2021-10-02 12:20:07','2021-10-02 12:19:30','session_remember',NULL,NULL,NULL),(13,'nkRGGwTYyy4gLRESvPmTENsAcvTYtyQoqepRuGeH',1,'2021-10-07 18:10:54','2021-10-02 18:24:48','session_remember',NULL,NULL,NULL),(14,'sSJ2kZLg86Yi4C36xN63JCAC88Rnpd9HeTFdNmYN',6,'2021-10-02 18:43:36','2021-10-02 18:26:08','session_remember',NULL,NULL,NULL),(15,'Y1pocphSWNPWFipnY5mY0dheLKEQGCOP7oQAgYN1',6,'2021-10-02 18:28:23','2021-10-02 18:26:33','session',NULL,'172.225.203.93','Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1'),(16,'pzXVi0nPYU1Tlx1MOgkoGTDvcVDN1S053agWT8i4',6,'2021-10-02 18:43:55','2021-10-02 18:28:23','session',NULL,'104.28.92.225','Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1');
/*!40000 ALTER TABLE `access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allowed_ips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_key_unique` (`key`),
  KEY `api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catchthefish_fishes`
--

DROP TABLE IF EXISTS `catchthefish_fishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catchthefish_fishes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `round_id` int(10) unsigned NOT NULL,
  `discussion_id_placement` int(10) unsigned DEFAULT NULL,
  `post_id_placement` int(10) unsigned DEFAULT NULL,
  `user_id_placement` int(10) unsigned DEFAULT NULL,
  `user_id_last_catch` int(10) unsigned DEFAULT NULL,
  `user_id_last_placement` int(10) unsigned DEFAULT NULL,
  `user_id_last_naming` int(10) unsigned DEFAULT NULL,
  `placement_valid_since` timestamp NULL DEFAULT NULL,
  `last_caught_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catchthefish_fishes_round_id_foreign` (`round_id`),
  KEY `catchthefish_fishes_discussion_id_placement_foreign` (`discussion_id_placement`),
  KEY `catchthefish_fishes_post_id_placement_foreign` (`post_id_placement`),
  KEY `catchthefish_fishes_user_id_placement_foreign` (`user_id_placement`),
  KEY `catchthefish_fishes_user_id_last_catch_foreign` (`user_id_last_catch`),
  KEY `catchthefish_fishes_user_id_last_placement_foreign` (`user_id_last_placement`),
  KEY `catchthefish_fishes_user_id_last_naming_foreign` (`user_id_last_naming`),
  KEY `catchthefish_fishes_placement_valid_since_index` (`placement_valid_since`),
  KEY `catchthefish_fishes_last_caught_at_index` (`last_caught_at`),
  CONSTRAINT `catchthefish_fishes_discussion_id_placement_foreign` FOREIGN KEY (`discussion_id_placement`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catchthefish_fishes_post_id_placement_foreign` FOREIGN KEY (`post_id_placement`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catchthefish_fishes_round_id_foreign` FOREIGN KEY (`round_id`) REFERENCES `catchthefish_rounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catchthefish_fishes_user_id_last_catch_foreign` FOREIGN KEY (`user_id_last_catch`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catchthefish_fishes_user_id_last_naming_foreign` FOREIGN KEY (`user_id_last_naming`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catchthefish_fishes_user_id_last_placement_foreign` FOREIGN KEY (`user_id_last_placement`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catchthefish_fishes_user_id_placement_foreign` FOREIGN KEY (`user_id_placement`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catchthefish_fishes`
--

LOCK TABLES `catchthefish_fishes` WRITE;
/*!40000 ALTER TABLE `catchthefish_fishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `catchthefish_fishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catchthefish_rankings`
--

DROP TABLE IF EXISTS `catchthefish_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catchthefish_rankings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `round_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `catch_count` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catchthefish_rankings_round_id_foreign` (`round_id`),
  KEY `catchthefish_rankings_user_id_foreign` (`user_id`),
  KEY `catchthefish_rankings_catch_count_index` (`catch_count`),
  CONSTRAINT `catchthefish_rankings_round_id_foreign` FOREIGN KEY (`round_id`) REFERENCES `catchthefish_rounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catchthefish_rankings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catchthefish_rankings`
--

LOCK TABLES `catchthefish_rankings` WRITE;
/*!40000 ALTER TABLE `catchthefish_rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `catchthefish_rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catchthefish_rounds`
--

DROP TABLE IF EXISTS `catchthefish_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catchthefish_rounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catchthefish_rounds_starts_at_index` (`starts_at`),
  KEY `catchthefish_rounds_ends_at_index` (`ends_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catchthefish_rounds`
--

LOCK TABLES `catchthefish_rounds` WRITE;
/*!40000 ALTER TABLE `catchthefish_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `catchthefish_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_tag`
--

DROP TABLE IF EXISTS `discussion_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_tag` (
  `discussion_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discussion_id`,`tag_id`),
  KEY `discussion_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_tag`
--

LOCK TABLES `discussion_tag` WRITE;
/*!40000 ALTER TABLE `discussion_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_user`
--

DROP TABLE IF EXISTS `discussion_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_user` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `discussion_user_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_user`
--

LOCK TABLES `discussion_user` WRITE;
/*!40000 ALTER TABLE `discussion_user` DISABLE KEYS */;
INSERT INTO `discussion_user` VALUES (1,2,'2021-10-01 22:30:43',3,NULL),(1,3,'2021-10-06 22:30:22',4,NULL),(1,4,'2021-10-06 22:41:23',2,'follow'),(5,2,'2021-10-02 00:18:18',3,'follow'),(5,3,'2021-10-02 00:40:11',3,'follow');
/*!40000 ALTER TABLE `discussion_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_views`
--

DROP TABLE IF EXISTS `discussion_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visited_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_views_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_views_user_id_foreign` (`user_id`),
  CONSTRAINT `discussion_views_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussion_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_views`
--

LOCK TABLES `discussion_views` WRITE;
/*!40000 ALTER TABLE `discussion_views` DISABLE KEYS */;
INSERT INTO `discussion_views` VALUES (1,1,2,'5.65.55.21','2021-10-01 23:48:08'),(2,1,2,'5.65.55.21','2021-10-01 23:48:35'),(3,1,2,'5.65.55.21','2021-10-01 23:48:40'),(4,1,2,'5.65.55.21','2021-10-01 23:49:55'),(5,1,2,'5.65.55.21','2021-10-02 00:03:49'),(6,1,2,'5.65.55.21','2021-10-02 00:03:56'),(7,1,2,'5.65.55.21','2021-10-02 00:03:56'),(8,1,2,'5.65.55.21','2021-10-02 00:03:58'),(9,1,2,'5.65.55.21','2021-10-02 00:04:00'),(10,1,2,'5.65.55.21','2021-10-02 00:04:02'),(11,1,2,'5.65.55.21','2021-10-02 00:04:09'),(12,1,2,'5.65.55.21','2021-10-02 00:05:45'),(13,1,2,'5.65.55.21','2021-10-02 00:05:49'),(14,1,2,'5.65.55.21','2021-10-02 00:06:04'),(15,1,2,'5.65.55.21','2021-10-02 00:06:08'),(16,1,2,'5.65.55.21','2021-10-02 00:07:30'),(17,1,2,'5.65.55.21','2021-10-02 00:07:33'),(18,1,2,'5.65.55.21','2021-10-02 00:07:37'),(19,1,2,'5.65.55.21','2021-10-02 00:07:41'),(20,1,2,'5.65.55.21','2021-10-02 00:10:06'),(21,1,2,'5.65.55.21','2021-10-02 00:10:10'),(22,1,2,'5.65.55.21','2021-10-02 00:10:14'),(23,NULL,2,'5.65.55.21','2021-10-02 00:10:35'),(24,NULL,2,'5.65.55.21','2021-10-02 00:10:43'),(25,NULL,2,'5.65.55.21','2021-10-02 00:10:46'),(26,NULL,2,'5.65.55.21','2021-10-02 00:10:49'),(27,1,2,'5.65.55.21','2021-10-02 00:11:06'),(28,5,2,'5.65.55.21','2021-10-02 00:18:17'),(29,5,3,'5.65.55.21','2021-10-02 00:22:55'),(30,1,2,'5.65.55.21','2021-10-02 00:23:22'),(31,1,3,'5.65.55.21','2021-10-02 00:23:28'),(32,NULL,3,'5.65.55.21','2021-10-02 00:24:41'),(33,1,3,'5.65.55.21','2021-10-02 00:35:50'),(34,NULL,3,'5.65.55.21','2021-10-02 00:38:23'),(35,NULL,3,'5.65.55.21','2021-10-02 00:38:36'),(36,1,3,'5.65.55.21','2021-10-02 00:38:44'),(37,NULL,3,'5.65.55.21','2021-10-02 00:39:10'),(38,5,3,'5.65.55.21','2021-10-02 00:39:33'),(39,5,3,'5.65.55.21','2021-10-02 00:40:34'),(40,1,3,'5.65.55.21','2021-10-02 00:40:45'),(41,5,2,'5.65.55.21','2021-10-02 00:40:58'),(42,1,2,'5.65.55.21','2021-10-02 00:41:04'),(43,1,3,'5.65.55.21','2021-10-02 00:41:40'),(44,5,3,'5.65.55.21','2021-10-02 00:41:52'),(45,5,3,'5.65.55.21','2021-10-02 00:41:56'),(46,5,3,'5.65.55.21','2021-10-02 00:42:04'),(47,NULL,3,'5.65.55.21','2021-10-02 09:58:56'),(48,NULL,3,'5.65.55.21','2021-10-02 12:18:24'),(49,1,3,'5.65.55.21','2021-10-02 12:19:40'),(50,1,3,'5.65.55.21','2021-10-02 22:37:20'),(51,1,3,'5.65.55.21','2021-10-02 22:39:47'),(52,NULL,2,'192.99.10.170','2021-10-03 06:46:40'),(53,NULL,3,'192.99.10.170','2021-10-03 06:47:09'),(54,NULL,2,'54.39.29.64','2021-10-03 17:27:33'),(55,NULL,3,'5.9.144.234','2021-10-03 17:40:26'),(56,NULL,2,'54.39.29.64','2021-10-03 17:43:18'),(57,1,3,'5.65.55.21','2021-10-03 18:13:40'),(58,1,3,'5.65.55.21','2021-10-03 18:26:58'),(59,1,3,'5.65.55.21','2021-10-03 18:51:26'),(60,1,3,'5.65.55.21','2021-10-03 18:52:20'),(61,1,3,'5.65.55.21','2021-10-03 18:52:40'),(62,1,3,'5.65.55.21','2021-10-03 18:53:20'),(63,1,3,'5.65.55.21','2021-10-03 18:53:25'),(64,NULL,2,'54.39.29.64','2021-10-03 23:57:31'),(65,NULL,2,'54.39.29.64','2021-10-05 06:44:07'),(66,NULL,2,'54.39.29.64','2021-10-05 07:30:56'),(67,NULL,2,'54.39.29.64','2021-10-05 18:29:14'),(68,NULL,2,'54.39.29.64','2021-10-05 23:36:53'),(69,NULL,2,'54.39.29.64','2021-10-06 10:38:42'),(70,1,3,'5.65.55.21','2021-10-06 22:30:21'),(71,1,4,'5.65.55.21','2021-10-06 22:38:42'),(72,1,4,'5.65.55.21','2021-10-06 22:41:22'),(73,1,3,'5.65.55.21','2021-10-06 22:57:41'),(74,1,3,'5.65.55.21','2021-10-06 22:58:19'),(75,1,3,'5.65.55.21','2021-10-06 22:58:20'),(76,1,3,'5.65.55.21','2021-10-06 22:58:20'),(77,1,3,'5.65.55.21','2021-10-06 22:58:20'),(78,1,3,'5.65.55.21','2021-10-06 22:58:20'),(79,1,3,'5.65.55.21','2021-10-06 22:58:25'),(80,1,4,'5.65.55.21','2021-10-06 22:59:21'),(81,1,4,'5.65.55.21','2021-10-06 22:59:34'),(82,1,2,'5.65.55.21','2021-10-06 23:16:54');
/*!40000 ALTER TABLE `discussion_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT 1,
  `participant_count` int(10) unsigned NOT NULL DEFAULT 0,
  `post_number_index` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `first_post_id` int(10) unsigned DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_post_number` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_sticky` tinyint(1) NOT NULL DEFAULT 0,
  `view_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `discussions_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `discussions_first_post_id_foreign` (`first_post_id`),
  KEY `discussions_last_post_id_foreign` (`last_post_id`),
  KEY `discussions_last_posted_at_index` (`last_posted_at`),
  KEY `discussions_last_posted_user_id_index` (`last_posted_user_id`),
  KEY `discussions_created_at_index` (`created_at`),
  KEY `discussions_user_id_index` (`user_id`),
  KEY `discussions_comment_count_index` (`comment_count`),
  KEY `discussions_participant_count_index` (`participant_count`),
  KEY `discussions_hidden_at_index` (`hidden_at`),
  KEY `discussions_is_locked_index` (`is_locked`),
  KEY `discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  KEY `discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (2,'Forum Rules',1,1,3,'2021-10-01 22:29:43',1,2,'2021-10-01 22:29:43',1,2,1,NULL,NULL,'forum-rules',0,1,1,1,41),(3,'How can I create a nextjs website using a premade template?',3,2,4,'2021-10-02 00:22:54',5,5,'2021-10-02 00:40:10',5,7,3,NULL,NULL,'how-can-i-create-a-nextjs-website-using-a-premade-template',0,1,1,0,37),(4,'Welcome to Introductions Thread',1,1,2,'2021-10-06 22:38:41',1,9,'2021-10-06 22:38:41',1,9,1,NULL,NULL,'welcome-to-introductions-thread',0,1,0,1,4);
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_tokens`
--

DROP TABLE IF EXISTS `email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `email_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_tokens`
--

LOCK TABLES `email_tokens` WRITE;
/*!40000 ALTER TABLE `email_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_post_id_foreign` (`post_id`),
  KEY `flags_user_id_foreign` (`user_id`),
  KEY `flags_created_at_index` (`created_at`),
  CONSTRAINT `flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission`
--

DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission` (
  `group_id` int(10) unsigned NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission`
--

LOCK TABLES `group_permission` WRITE;
/*!40000 ALTER TABLE `group_permission` DISABLE KEYS */;
INSERT INTO `group_permission` VALUES (2,'viewForum'),(3,'discussion.flagPosts'),(3,'discussion.likePosts'),(3,'discussion.reply'),(3,'discussion.replyWithoutApproval'),(3,'discussion.startWithoutApproval'),(3,'searchUsers'),(3,'startDiscussion'),(4,'discussion.approvePosts'),(4,'discussion.editPosts'),(4,'discussion.hide'),(4,'discussion.hidePosts'),(4,'discussion.lock'),(4,'discussion.rename'),(4,'discussion.sticky'),(4,'discussion.tag'),(4,'discussion.viewFlags'),(4,'user.suspend'),(4,'user.viewLastSeenAt');
/*!40000 ALTER TABLE `group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_user_group_id_foreign` (`group_id`),
  CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1),(1,4),(1,5),(1,7),(1,9),(1,10),(4,4),(4,5),(5,10),(6,4),(6,5);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admin','Administrator','#B72A2A','fas fa-wrench',0),(2,'Guest','Guests',NULL,NULL,0),(3,'Member','Members',NULL,NULL,0),(4,'Moderator','Moderator','	#9370DB','fas fa-lightbulb',0),(5,'Support','Support','#FFA500','fas fa-headset',0),(6,'Banned','Banned','#FF0000','fas fa-user-slash',0),(7,'Community Advocate','Community Advocate','#00BFFF','fas fa-cube',0),(8,'Suspension','Suspension','#696969','fas fa-comment-slash',0),(9,'Developer','Developer','#FF00FF','fas fa-code',0),(10,'Verified','Verified','#7FFFD4','fas fa-user-check',0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kilowhat_audit_log`
--

DROP TABLE IF EXISTS `kilowhat_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kilowhat_audit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(10) unsigned DEFAULT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kilowhat_audit_log_actor_id_index` (`actor_id`),
  KEY `kilowhat_audit_log_client_index` (`client`),
  KEY `kilowhat_audit_log_ip_address_index` (`ip_address`),
  KEY `kilowhat_audit_log_action_index` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kilowhat_audit_log`
--

LOCK TABLES `kilowhat_audit_log` WRITE;
/*!40000 ALTER TABLE `kilowhat_audit_log` DISABLE KEYS */;
INSERT INTO `kilowhat_audit_log` VALUES (1,1,'session','5.65.55.21','discussion.created','{\"discussion_id\":4}','2021-10-06 22:38:41'),(2,1,'session','5.65.55.21','post.revised','{\"discussion_id\":4,\"post_id\":9}','2021-10-06 22:40:36'),(3,1,'session','5.65.55.21','discussion.stickied','{\"discussion_id\":4}','2021-10-06 22:41:13'),(4,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:53:06'),(5,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:54:48'),(6,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:55:07'),(7,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:57:20'),(8,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:58:22'),(9,1,'session','5.65.55.21','post.revised','{\"discussion_id\":3,\"post_id\":6}','2021-10-06 22:58:38'),(10,1,'session','5.65.55.21','post.revised','{\"discussion_id\":2,\"post_id\":2}','2021-10-06 23:17:33'),(11,1,'session','5.65.55.21','post.revised','{\"discussion_id\":2,\"post_id\":2}','2021-10-06 23:17:52');
/*!40000 ALTER TABLE `kilowhat_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_providers`
--

DROP TABLE IF EXISTS `login_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_providers_provider_identifier_unique` (`provider`,`identifier`),
  KEY `login_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_providers`
--

LOCK TABLES `login_providers` WRITE;
/*!40000 ALTER TABLE `login_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2015_02_24_000000_create_access_tokens_table',NULL),(2,'2015_02_24_000000_create_api_keys_table',NULL),(3,'2015_02_24_000000_create_config_table',NULL),(4,'2015_02_24_000000_create_discussions_table',NULL),(5,'2015_02_24_000000_create_email_tokens_table',NULL),(6,'2015_02_24_000000_create_groups_table',NULL),(7,'2015_02_24_000000_create_notifications_table',NULL),(8,'2015_02_24_000000_create_password_tokens_table',NULL),(9,'2015_02_24_000000_create_permissions_table',NULL),(10,'2015_02_24_000000_create_posts_table',NULL),(11,'2015_02_24_000000_create_users_discussions_table',NULL),(12,'2015_02_24_000000_create_users_groups_table',NULL),(13,'2015_02_24_000000_create_users_table',NULL),(14,'2015_09_15_000000_create_auth_tokens_table',NULL),(15,'2015_09_20_224327_add_hide_to_discussions',NULL),(16,'2015_09_22_030432_rename_notification_read_time',NULL),(17,'2015_10_07_130531_rename_config_to_settings',NULL),(18,'2015_10_24_194000_add_ip_address_to_posts',NULL),(19,'2015_12_05_042721_change_access_tokens_columns',NULL),(20,'2015_12_17_194247_change_settings_value_column_to_text',NULL),(21,'2016_02_04_095452_add_slug_to_discussions',NULL),(22,'2017_04_07_114138_add_is_private_to_discussions',NULL),(23,'2017_04_07_114138_add_is_private_to_posts',NULL),(24,'2018_01_11_093900_change_access_tokens_columns',NULL),(25,'2018_01_11_094000_change_access_tokens_add_foreign_keys',NULL),(26,'2018_01_11_095000_change_api_keys_columns',NULL),(27,'2018_01_11_101800_rename_auth_tokens_to_registration_tokens',NULL),(28,'2018_01_11_102000_change_registration_tokens_rename_id_to_token',NULL),(29,'2018_01_11_102100_change_registration_tokens_created_at_to_datetime',NULL),(30,'2018_01_11_120604_change_posts_table_to_innodb',NULL),(31,'2018_01_11_155200_change_discussions_rename_columns',NULL),(32,'2018_01_11_155300_change_discussions_add_foreign_keys',NULL),(33,'2018_01_15_071700_rename_users_discussions_to_discussion_user',NULL),(34,'2018_01_15_071800_change_discussion_user_rename_columns',NULL),(35,'2018_01_15_071900_change_discussion_user_add_foreign_keys',NULL),(36,'2018_01_15_072600_change_email_tokens_rename_id_to_token',NULL),(37,'2018_01_15_072700_change_email_tokens_add_foreign_keys',NULL),(38,'2018_01_15_072800_change_email_tokens_created_at_to_datetime',NULL),(39,'2018_01_18_130400_rename_permissions_to_group_permission',NULL),(40,'2018_01_18_130500_change_group_permission_add_foreign_keys',NULL),(41,'2018_01_18_130600_rename_users_groups_to_group_user',NULL),(42,'2018_01_18_130700_change_group_user_add_foreign_keys',NULL),(43,'2018_01_18_133000_change_notifications_columns',NULL),(44,'2018_01_18_133100_change_notifications_add_foreign_keys',NULL),(45,'2018_01_18_134400_change_password_tokens_rename_id_to_token',NULL),(46,'2018_01_18_134500_change_password_tokens_add_foreign_keys',NULL),(47,'2018_01_18_134600_change_password_tokens_created_at_to_datetime',NULL),(48,'2018_01_18_135000_change_posts_rename_columns',NULL),(49,'2018_01_18_135100_change_posts_add_foreign_keys',NULL),(50,'2018_01_30_112238_add_fulltext_index_to_discussions_title',NULL),(51,'2018_01_30_220100_create_post_user_table',NULL),(52,'2018_01_30_222900_change_users_rename_columns',NULL),(53,'2018_07_21_000000_seed_default_groups',NULL),(54,'2018_07_21_000100_seed_default_group_permissions',NULL),(55,'2018_09_15_041340_add_users_indicies',NULL),(56,'2018_09_15_041828_add_discussions_indicies',NULL),(57,'2018_09_15_043337_add_notifications_indices',NULL),(58,'2018_09_15_043621_add_posts_indices',NULL),(59,'2018_09_22_004100_change_registration_tokens_columns',NULL),(60,'2018_09_22_004200_create_login_providers_table',NULL),(61,'2018_10_08_144700_add_shim_prefix_to_group_icons',NULL),(62,'2019_06_24_145100_change_posts_content_column_to_mediumtext',NULL),(63,'2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),(64,'2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),(65,'2017_07_22_000000_add_default_permissions','flarum-approval'),(66,'2018_09_29_060444_replace_emoji_shorcuts_with_unicode','flarum-emoji'),(67,'2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),(68,'2015_09_02_000000_create_flags_table','flarum-flags'),(69,'2017_07_22_000000_add_default_permissions','flarum-flags'),(70,'2018_06_27_101500_change_flags_rename_time_to_created_at','flarum-flags'),(71,'2018_06_27_101600_change_flags_add_foreign_keys','flarum-flags'),(72,'2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at','flarum-flags'),(73,'2018_09_15_043621_add_flags_indices','flarum-flags'),(74,'2015_05_11_000000_create_posts_likes_table','flarum-likes'),(75,'2015_09_04_000000_add_default_like_permissions','flarum-likes'),(76,'2018_06_27_100600_rename_posts_likes_to_post_likes','flarum-likes'),(77,'2018_06_27_100700_change_post_likes_add_foreign_keys','flarum-likes'),(78,'2015_02_24_000000_add_locked_to_discussions','flarum-lock'),(79,'2017_07_22_000000_add_default_permissions','flarum-lock'),(80,'2018_09_15_043621_add_discussions_indices','flarum-lock'),(81,'2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),(82,'2015_05_11_000000_create_mentions_users_table','flarum-mentions'),(83,'2018_06_27_102000_rename_mentions_posts_to_post_mentions_post','flarum-mentions'),(84,'2018_06_27_102100_rename_mentions_users_to_post_mentions_user','flarum-mentions'),(85,'2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id','flarum-mentions'),(86,'2018_06_27_102300_change_post_mentions_post_add_foreign_keys','flarum-mentions'),(87,'2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id','flarum-mentions'),(88,'2018_06_27_102500_change_post_mentions_user_add_foreign_keys','flarum-mentions'),(89,'2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),(90,'2017_07_22_000000_add_default_permissions','flarum-sticky'),(91,'2018_09_15_043621_add_discussions_indices','flarum-sticky'),(92,'2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),(93,'2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),(94,'2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),(95,'2017_07_22_000000_add_default_permissions','flarum-suspend'),(96,'2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until','flarum-suspend'),(97,'2015_02_24_000000_create_discussions_tags_table','flarum-tags'),(98,'2015_02_24_000000_create_tags_table','flarum-tags'),(99,'2015_02_24_000000_create_users_tags_table','flarum-tags'),(100,'2015_02_24_000000_set_default_settings','flarum-tags'),(101,'2015_10_19_061223_make_slug_unique','flarum-tags'),(102,'2017_07_22_000000_add_default_permissions','flarum-tags'),(103,'2018_06_27_085200_change_tags_columns','flarum-tags'),(104,'2018_06_27_085300_change_tags_add_foreign_keys','flarum-tags'),(105,'2018_06_27_090400_rename_users_tags_to_tag_user','flarum-tags'),(106,'2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at','flarum-tags'),(107,'2018_06_27_100200_change_tag_user_add_foreign_keys','flarum-tags'),(108,'2018_06_27_103000_rename_discussions_tags_to_discussion_tag','flarum-tags'),(109,'2018_06_27_103100_add_discussion_tag_foreign_keys','flarum-tags'),(110,'2019_04_21_000000_add_icon_to_tags_table','flarum-tags'),(111,'2019_10_12_195349_change_posts_add_discussion_foreign_key',NULL),(112,'2019_10_22_000000_change_reason_text_col_type','flarum-flags'),(113,'2020_03_19_134512_change_discussions_default_comment_count',NULL),(114,'2020_04_21_130500_change_permission_groups_add_is_hidden',NULL),(115,'2021_03_02_040000_change_access_tokens_add_type',NULL),(116,'2021_03_02_040500_change_access_tokens_add_id',NULL),(117,'2021_03_02_041000_change_access_tokens_add_title_ip_agent',NULL),(118,'2021_01_13_000000_add_discussion_last_posted_at_indices','flarum-sticky'),(119,'2021_03_25_000000_default_settings','flarum-markdown'),(120,'2021_04_18_040500_change_migrations_add_id_primary_key',NULL),(121,'2021_04_18_145100_change_posts_content_column_to_mediumtext',NULL),(122,'2021_05_10_000000_rename_permissions',NULL),(123,'2021_04_19_000000_set_default_settings','flarum-mentions'),(124,'2021_05_10_094200_add_created_at_to_post_likes_table','flarum-likes'),(125,'2020_06_07_000000_set_default','fof-sitemap'),(126,'2019_04_01_01_create_catchthefish_rounds_table','clarkwinkelmann-catch-the-fish'),(127,'2019_04_01_02_create_catchthefish_fishes_table','clarkwinkelmann-catch-the-fish'),(128,'2019_04_01_03_create_catchthefish_rankings','clarkwinkelmann-catch-the-fish'),(129,'2017_11_07_223624_discussions_add_views','michaelbelgium-discussion-views'),(130,'2018_11_30_141817_discussions_rename_views','michaelbelgium-discussion-views'),(131,'2020_01_11_220612_add_discussionviews_table','michaelbelgium-discussion-views'),(132,'2020_01_17_110823_add_default_settings','michaelbelgium-discussion-views'),(133,'2020_01_19_131055_add_viewlist_settings','michaelbelgium-discussion-views'),(134,'2021_09_15_000000_add_extra_settings','michaelbelgium-discussion-views'),(135,'2019_06_17_000000_add_settings_social_list','fof-share-social'),(136,'2020_06_12_create_log_table','kilowhat-audit-free');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_from_user_id_foreign` (`from_user_id`),
  KEY `notifications_user_id_index` (`user_id`),
  CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,5,1,'newPost',3,'{\"postNumber\":2}','2021-10-02 00:35:41',0,NULL),(2,5,1,'postMentioned',5,'{\"replyNumber\":2}','2021-10-02 00:36:37',0,NULL),(3,1,5,'newPost',3,'{\"postNumber\":3}','2021-10-02 00:40:10',0,'2021-10-02 18:24:59'),(4,1,5,'postLiked',2,NULL,'2021-10-02 00:40:40',0,'2021-10-02 18:24:59'),(5,5,1,'discussionLocked',3,'{\"postNumber\":4}','2021-10-03 18:53:35',0,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_tokens`
--

DROP TABLE IF EXISTS `password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `password_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_tokens`
--

LOCK TABLES `password_tokens` WRITE;
/*!40000 ALTER TABLE `password_tokens` DISABLE KEYS */;
INSERT INTO `password_tokens` VALUES ('Ehlpt6NyZi7R63bTPlbQB2ZBbAtaNkLbuVhLDACR',1,'2021-10-01 22:13:21');
/*!40000 ALTER TABLE `password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (2,1,'2021-10-02 00:41:07'),(2,5,'2021-10-02 00:40:40'),(6,1,'2021-10-02 00:40:47');
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mentions_post`
--

DROP TABLE IF EXISTS `post_mentions_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_mentions_post` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_post_id`),
  KEY `post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`),
  CONSTRAINT `post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mentions_post`
--

LOCK TABLES `post_mentions_post` WRITE;
/*!40000 ALTER TABLE `post_mentions_post` DISABLE KEYS */;
INSERT INTO `post_mentions_post` VALUES (6,5);
/*!40000 ALTER TABLE `post_mentions_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mentions_user`
--

DROP TABLE IF EXISTS `post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_mentions_user` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mentions_user`
--

LOCK TABLES `post_mentions_user` WRITE;
/*!40000 ALTER TABLE `post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_user` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_user`
--

LOCK TABLES `post_user` WRITE;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  KEY `posts_edited_user_id_foreign` (`edited_user_id`),
  KEY `posts_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `posts_discussion_id_number_index` (`discussion_id`,`number`),
  KEY `posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  KEY `posts_user_id_created_at_index` (`user_id`,`created_at`),
  FULLTEXT KEY `content` (`content`),
  CONSTRAINT `posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,2,1,'2021-10-01 22:29:43',1,'comment','<t><p>Forum Rules:<br/>\n(Note: Any forum containing the following elements and/or behaviours will be deleted)<br/>\n1) Sexual and/or pornographic content<br/>\n 2) Hateful or abusive content<br/>\n 3) Defamatory content and / or affecting the integrity of a person<br/>\n 4) Sale or exchange of medication that requires a prescription from a licensed practitioner, or medicines without prescription<br/>\n 5) Drugs and any other illicit substance<br/>\n 6) Copyright infringment<br/>\n 7) Doxing / DDoS<br/>\n 8) Spam<br/>\n 9) Phishing and/ or malware website<br/>\n 10) Credit card fraud</p></t>','2021-10-06 23:17:52',1,NULL,NULL,'5.65.55.21',0,1),(3,2,2,'2021-10-01 22:30:15',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,0,1),(4,2,3,'2021-10-01 22:30:16',1,'discussionLocked','{\"locked\":true}',NULL,NULL,NULL,NULL,NULL,0,1),(5,3,1,'2021-10-02 00:22:54',5,'comment','<t><p>Hi,</p>\n\n<p>I\'m new to the community, I\'m trying to use a downloaded ready made nextjs template and publish it using netlify. How can I create publish this template?</p></t>',NULL,NULL,NULL,NULL,'5.65.55.21',0,1),(6,3,2,'2021-10-02 00:35:41',1,'comment','<r><p>Welcome <POSTMENTION discussionid=\"3\" displayname=\"James290\" id=\"5\" number=\"1\">@\"James290\"#p5</POSTMENTION> to the Evase Forums,</p>\n\n<p>I see you\'re having an issue trying to deploy a Next.js template with Netlify.</p>\n\n<p>Follow this article step-by-step to guide you through how to publish your template using Netlify.<br/>\n<URL url=\"https://evase.net/docs/getting-started/nextjs\">https://evase.net/docs/getting-started/nextjs</URL></p>\n\n<p>What you need to do is the following:</p>\n\n<p><STRONG><s>**</s>1)<e>**</e></STRONG> Create a Github repository and link your template into that repository using Github Desktop.<br/>\n<STRONG><s>**</s>2)<e>**</e></STRONG> Once that\'s completed, go to to netlify.com and sign up<br/>\n<STRONG><s>**</s>3)<e>**</e></STRONG> Create a new site by logging into Github and selecting existing repository that holds your template<br/>\n<STRONG><s>**</s>4)<e>**</e></STRONG> Fill in the necessary run commands,</p>\n\n<p><STRONG><s>**</s>Build command:<e>**</e></STRONG> should be</p>\n\n<QUOTE><i>&gt; </i> <p><EM><s>_</s><STRONG><s>**</s>npm run build<e>**</e></STRONG><e>_</e></EM></p>  </QUOTE>\n\n<p>, <STRONG><s>**</s>Publish directory:<e>**</e></STRONG> should be</p> \n\n<QUOTE><i>&gt; </i><p><EM><s>_</s><STRONG><s>**</s>out<e>**</e></STRONG><e>_</e></EM></p></QUOTE>\n\n \n <p><STRONG><s>**</s><EM><s>_</s>Base Directory:<e>_</e></EM><e>**</e></STRONG></p> \n\n<QUOTE><i>&gt; </i><p><STRONG><s>**</s>does not need to be set<e>**</e></STRONG></p></QUOTE>\n\n<p><STRONG><s>**</s>5)<e>**</e></STRONG> Netlify should build and deploy your template! Success!</p>\n\n<p><URL url=\"https://gyazo.com/8ea44bf567b08a2a01596660910acad9\"><s>[</s>Preview image example<e>](https://gyazo.com/8ea44bf567b08a2a01596660910acad9)</e></URL></p>\n\n<p><EM><s>_</s>Please notify us if you require any further help.<e>_</e></EM></p>\n\n<p>For additional support use the Netlify Guide:<br/>\n<URL url=\"https://docs.netlify.com/site-deploys/create-deploys/\">https://docs.netlify.com/site-deploys/create-deploys/</URL></p></r>','2021-10-06 22:58:38',1,NULL,NULL,'5.65.55.21',0,1),(7,3,3,'2021-10-02 00:40:10',5,'comment','<t><p>Thanks for you help.</p></t>',NULL,NULL,NULL,NULL,'5.65.55.21',0,1),(8,3,4,'2021-10-03 18:53:35',1,'discussionLocked','{\"locked\":true}',NULL,NULL,NULL,NULL,NULL,0,1),(9,4,1,'2021-10-06 22:38:41',1,'comment','<r><H3><s>### </s>Introductions thread</H3>\n\n<QUOTE><i>&gt; </i><p>The community thread ( Introductions) is the way for all users to interact ~ Rasib</p></QUOTE>\n\n<p><STRONG><s>**</s>This thread is created for all new and existing users to introduce themselves.<e>**</e></STRONG></p>\n\n<p>Hello, I\'m the evase administrator.</p>\n\n<p>My role is to manage the forums and staff. To create and regulate rules and threads with the addition of assigning roles and removing users for misuse of our forums.</p> \n\n</r>','2021-10-06 22:40:36',1,NULL,NULL,'5.65.55.21',0,1),(10,4,2,'2021-10-06 22:41:13',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_tokens`
--

DROP TABLE IF EXISTS `registration_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_tokens`
--

LOCK TABLES `registration_tokens` WRITE;
/*!40000 ALTER TABLE `registration_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('custom_header',''),('custom_less',''),('default_locale','en'),('default_route','/all'),('extensions_enabled','[\"flarum-suspend\",\"flarum-sticky\",\"flarum-lock\",\"flarum-flags\",\"kilowhat-audit-free\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-lang-english\",\"flarum-likes\",\"flarum-markdown\",\"flarum-mentions\",\"flarum-statistics\",\"flarum-subscriptions\",\"fof-sitemap\",\"fof-default-user-preferences\",\"migratetoflarum-canonical\",\"justoverclock-custom-header\",\"michaelbelgium-discussion-views\"]'),('favicon_path','favicon-6qvrj893.png'),('flarum-markdown.mdarea','1'),('flarum-mentions.allow_username_format','1'),('flarum-tags.max_primary_tags','1'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','0'),('flarum-tags.min_secondary_tags','0'),('fof-share-social.canonical-urls',''),('fof-share-social.networks.facebook','1'),('fof-share-social.networks.linkedin',''),('fof-share-social.networks.my_mail',''),('fof-share-social.networks.odnoklassniki',''),('fof-share-social.networks.qq',''),('fof-share-social.networks.qzone',''),('fof-share-social.networks.reddit',''),('fof-share-social.networks.telegram',''),('fof-share-social.networks.twitter','1'),('fof-share-social.networks.vkontakte',''),('fof-share-social.networks.whatsapp',''),('fof-sitemap.frequency','daily'),('fof-sitemap.mode','run'),('forum_description','Evase Forums'),('forum_title','Evase Forums'),('justoverclock-custom-header.button2Text','Instagram'),('justoverclock-custom-header.buttonText','Return Home'),('justoverclock-custom-header.facebookIcon','https://www.facebook.com/officialevase/'),('justoverclock-custom-header.githubIcon','https://github.com/Ksgz'),('justoverclock-custom-header.headerTagline','Learn | Build | Share skills.'),('justoverclock-custom-header.headerTitle','Evase Forums'),('justoverclock-custom-header.LinkButtonOne','https://evase.net/'),('justoverclock-custom-header.LinkButtonTwo','https://www.instagram.com/officialevase/'),('justoverclock-custom-header.twitterIcon','https://twitter.com/officialevase'),('justoverclock-custom-header.youtubeIcon',''),('logo_path','logo-78g7fj1b.png'),('mail_driver','smtp'),('mail_from','noreply+evase@freeflarum.com'),('mail_host','127.0.0.1'),('mail_port','25'),('michaelbelgium-discussionviews.abbr_numbers','0'),('michaelbelgium-discussionviews.max_listcount','5'),('michaelbelgium-discussionviews.show_filter','1'),('michaelbelgium-discussionviews.show_footer_viewlist','0'),('michaelbelgium-discussionviews.show_viewlist','0'),('michaelbelgium-discussionviews.track_guests','1'),('michaelbelgium-discussionviews.track_unique','0'),('migratetoflarum-canonical.status','301'),('slug_driver_Flarum\\User\\User',''),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#4D698E'),('theme_secondary_color','#4D698E'),('version','1.0.4'),('welcome_message','The forums is built to discuss issues, ask for support, and share new innovative ideas with like-minds'),('welcome_title','Welcome to Evase\'s forums!');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_user`
--

DROP TABLE IF EXISTS `tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_user` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `tag_user_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_user`
--

LOCK TABLES `tag_user` WRITE;
/*!40000 ALTER TABLE `tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `discussion_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) unsigned DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`),
  KEY `tags_parent_id_foreign` (`parent_id`),
  KEY `tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`),
  CONSTRAINT `tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General','general',NULL,'#888',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_count` int(10) unsigned NOT NULL DEFAULT 0,
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_joined_at_index` (`joined_at`),
  KEY `users_last_seen_at_index` (`last_seen_at`),
  KEY `users_discussion_count_index` (`discussion_count`),
  KEY `users_comment_count_index` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@evase.net',1,'$2b$12$i1CkAbk49x1AH0jsJV9wIOPjtDyiEw0TAnglPoksnvUgO1z1zQlva',NULL,'c3mIo2GJL5t9NHLm.png','{\"notify_discussionRenamed_alert\":true,\"notify_postLiked_alert\":true,\"notify_discussionLocked_alert\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"followAfterReply\":true,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2021-10-01 22:13:21','2021-10-07 18:10:54','2021-10-03 18:53:54','2021-10-02 18:24:54',2,3,'2021-10-02 18:24:57',NULL),(4,'Golam','golam3taco@gmail.com',1,'$2y$10$O6yHJalht4TBkNrb8Wk07ugRvEX7QMIxjeyM18itO9McTQWa0uVLa',NULL,NULL,'{\"followAfterReply\":true,\"notify_discussionRenamed_alert\":true,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":true,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":true,\"notify_discussionLocked_alert\":true,\"notify_postLiked_alert\":true,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2021-10-01 23:20:37','2021-10-01 23:22:30',NULL,NULL,0,0,NULL,NULL),(5,'James290','jamesmay981@gmail.com',1,'$2y$10$HY2Y47kIz9dxuYx9x7NFpOuhyFhietiwWa.l3Q/AwoHAjZawhzgWO',NULL,'6iyRDGgHEvSuxZgK.png','{\"followAfterReply\":true,\"notify_discussionRenamed_alert\":true,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":true,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":true,\"notify_discussionLocked_alert\":true,\"notify_postLiked_alert\":true,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2021-10-02 00:18:10','2021-10-02 00:42:04',NULL,'2021-10-02 00:40:20',1,2,NULL,NULL),(6,'Foza5','bishop381@gmail.com',1,'$2y$10$7rcpGx5.MSW3x/MONRJQB.uN2KXHuSAc8TxZgWhez8yEDnAsCZWVy',NULL,'qPrLeGiRY2NYxJDy.png','{\"followAfterReply\":true,\"notify_discussionRenamed_alert\":true,\"notify_userSuspended_alert\":true,\"notify_userUnsuspended_alert\":true,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":true,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":true,\"notify_discussionLocked_alert\":true,\"notify_postLiked_alert\":true,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":null}','2021-10-02 18:26:08','2021-10-02 18:43:55',NULL,'2021-10-02 18:33:10',0,0,'2021-10-02 18:43:55',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 18:15:48