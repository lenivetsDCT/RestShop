-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.26 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for RestAPI
DROP DATABASE IF EXISTS `RestAPI`;
CREATE DATABASE IF NOT EXISTS `RestAPI` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `RestAPI`;


-- Dumping structure for table RestAPI.authtoken_token
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_296afd6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.authtoken_token: ~1 rows (approximately)
DELETE FROM `authtoken_token`;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
	('c845a331f332271339760c929b4679adaaeb1497', '2017-05-29 10:14:59.990132', 1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_group
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_group: ~0 rows (approximately)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_4b0d78a2_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_4b0d78a2_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_381811a9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_group_permissions: ~0 rows (approximately)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_53445d30_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_permission: ~27 rows (approximately)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add Token', 7, 'add_token'),
	(20, 'Can change Token', 7, 'change_token'),
	(21, 'Can delete Token', 7, 'delete_token'),
	(22, 'Can add movie', 8, 'add_movie'),
	(23, 'Can change movie', 8, 'change_movie'),
	(24, 'Can delete movie', 8, 'delete_movie'),
	(25, 'Can add cart', 9, 'add_cart'),
	(26, 'Can change cart', 9, 'change_cart'),
	(27, 'Can delete cart', 9, 'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_user
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_user: ~1 rows (approximately)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$20000$jiHoTncLWLm8$muogdNuK6lddQQBMfvvRSoWHIUUpdaJE65Vs0rXe9/Y=', NULL, 0, 'test', '', '', 'some@good.mail', 0, 1, '2017-05-29 10:14:36.780168');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_41a3f2b2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_41a3f2b2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4e05e81f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_user_groups: ~0 rows (approximately)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Dumping structure for table RestAPI.auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_4c8a1992_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_4c8a1992_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_3e5cf1a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.auth_user_user_permissions: ~0 rows (approximately)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Dumping structure for table RestAPI.catalog_cart
DROP TABLE IF EXISTS `catalog_cart`;
CREATE TABLE IF NOT EXISTS `catalog_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_cart_e8701ad4` (`user_id`),
  CONSTRAINT `catalog_cart_user_id_1610aa78_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.catalog_cart: ~1 rows (approximately)
DELETE FROM `catalog_cart`;
/*!40000 ALTER TABLE `catalog_cart` DISABLE KEYS */;
INSERT INTO `catalog_cart` (`id`, `date_created`, `comment`, `user_id`) VALUES
	(1, '2017-05-29 10:17:31.271644', 'Hello', 1);
/*!40000 ALTER TABLE `catalog_cart` ENABLE KEYS */;


-- Dumping structure for table RestAPI.catalog_cart_items
DROP TABLE IF EXISTS `catalog_cart_items`;
CREATE TABLE IF NOT EXISTS `catalog_cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_id` (`cart_id`,`movie_id`),
  KEY `catalog_cart_items_movie_id_4c171e2_fk_catalog_movie_id` (`movie_id`),
  CONSTRAINT `catalog_cart_items_cart_id_2579402f_fk_catalog_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `catalog_cart` (`id`),
  CONSTRAINT `catalog_cart_items_movie_id_4c171e2_fk_catalog_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `catalog_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.catalog_cart_items: ~1 rows (approximately)
DELETE FROM `catalog_cart_items`;
/*!40000 ALTER TABLE `catalog_cart_items` DISABLE KEYS */;
INSERT INTO `catalog_cart_items` (`id`, `cart_id`, `movie_id`) VALUES
	(4, 1, 3);
/*!40000 ALTER TABLE `catalog_cart_items` ENABLE KEYS */;


-- Dumping structure for table RestAPI.catalog_movie
DROP TABLE IF EXISTS `catalog_movie`;
CREATE TABLE IF NOT EXISTS `catalog_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.catalog_movie: ~3 rows (approximately)
DELETE FROM `catalog_movie`;
/*!40000 ALTER TABLE `catalog_movie` DISABLE KEYS */;
INSERT INTO `catalog_movie` (`id`, `name`, `desc`, `stock`, `price`) VALUES
	(1, 'Tile1', 'Some cool movie desc', 2, 8.50),
	(2, 'Tile2', 'Some bad movie desc', 3, 8.50),
	(3, 'Tile3', 'Some fat movie desc', 1, 8.00);
/*!40000 ALTER TABLE `catalog_movie` ENABLE KEYS */;


-- Dumping structure for table RestAPI.django_admin_log
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_1e5f20a7_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_7eefa747_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_1e5f20a7_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_7eefa747_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.django_admin_log: ~0 rows (approximately)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Dumping structure for table RestAPI.django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3f77a5a4_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.django_content_type: ~9 rows (approximately)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(7, 'authtoken', 'token'),
	(9, 'catalog', 'cart'),
	(8, 'catalog', 'movie'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Dumping structure for table RestAPI.django_migrations
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.django_migrations: ~13 rows (approximately)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2017-05-29 10:14:01.413779'),
	(2, 'auth', '0001_initial', '2017-05-29 10:14:06.698049'),
	(3, 'admin', '0001_initial', '2017-05-29 10:14:09.216707'),
	(4, 'contenttypes', '0002_remove_content_type_name', '2017-05-29 10:14:09.821319'),
	(5, 'auth', '0002_alter_permission_name_max_length', '2017-05-29 10:14:10.350532'),
	(6, 'auth', '0003_alter_user_email_max_length', '2017-05-29 10:14:10.817266'),
	(7, 'auth', '0004_alter_user_username_opts', '2017-05-29 10:14:10.951882'),
	(8, 'auth', '0005_alter_user_last_login_null', '2017-05-29 10:14:11.533988'),
	(9, 'auth', '0006_require_contenttypes_0002', '2017-05-29 10:14:11.541654'),
	(10, 'authtoken', '0001_initial', '2017-05-29 10:14:12.440007'),
	(11, 'authtoken', '0002_auto_20160226_1747', '2017-05-29 10:14:13.428128'),
	(12, 'catalog', '0001_initial', '2017-05-29 10:14:19.852326'),
	(13, 'sessions', '0001_initial', '2017-05-29 10:14:20.819583');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- Dumping structure for table RestAPI.django_session
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table RestAPI.django_session: ~0 rows (approximately)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
