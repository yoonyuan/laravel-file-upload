-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2023 at 02:13 PM
-- Server version: 5.7.40
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `UNIQUE_KEY` int(11) DEFAULT NULL,
  `PRODUCT_TITLE` varchar(255) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` text,
  `STYLE#` varchar(255) DEFAULT NULL,
  `COLOR_NAME` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `PIECE_PRICE` double DEFAULT NULL,
  `SANMAR_MAINFRAME_COLOR` varchar(255) DEFAULT NULL,
  KEY `UNIQUE_KEY` (`UNIQUE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_07_070547_create_uploads_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `UNIQUE_KEY` int(11) DEFAULT NULL,
  `PRODUCT_TITLE` varchar(255) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` text,
  `STYLE#` varchar(255) DEFAULT NULL,
  `AVAILABLE_SIZES` varchar(255) DEFAULT NULL,
  `BRAND_LOGO_IMAGE` varchar(255) DEFAULT NULL,
  `THUMBNAIL_IMAGE` varchar(255) DEFAULT NULL,
  `COLOR_SWATCH_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  `SPEC_SHEET` varchar(255) DEFAULT NULL,
  `PRICE_TEXT` varchar(255) DEFAULT NULL,
  `SUGGESTED_PRICE` double DEFAULT NULL,
  `CATEGORY_NAME` varchar(255) DEFAULT NULL,
  `SUBCATEGORY_NAME` varchar(255) DEFAULT NULL,
  `COLOR_NAME` varchar(255) DEFAULT NULL,
  `COLOR_SQUARE_IMAGE` varchar(255) DEFAULT NULL,
  `COLOR_PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  `COLOR_PRODUCT_IMAGE_THUMBNAIL` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `QTY` double DEFAULT NULL,
  `PIECE_WEIGHT` double DEFAULT NULL,
  `PIECE_PRICE` double DEFAULT NULL,
  `DOZENS_PRICE` double DEFAULT NULL,
  `CASE_PRICE` double DEFAULT NULL,
  `PRICE_GROUP` varchar(255) DEFAULT NULL,
  `CASE_SIZE` double DEFAULT NULL,
  `INVENTORY_KEY` double DEFAULT NULL,
  `SIZE_INDEX` double DEFAULT NULL,
  `SANMAR_MAINFRAME_COLOR` varchar(255) DEFAULT NULL,
  `MILL` varchar(255) DEFAULT NULL,
  `PRODUCT_STATUS` varchar(255) DEFAULT NULL,
  `COMPANION_STYLES` varchar(255) DEFAULT NULL,
  `MSRP` double DEFAULT NULL,
  `MAP_PRICING` varchar(255) DEFAULT NULL,
  `FRONT_MODEL_IMAGE_URL` varchar(255) DEFAULT NULL,
  `BACK_MODEL_IMAGE` varchar(255) DEFAULT NULL,
  `FRONT_FLAT_IMAGE` varchar(255) DEFAULT NULL,
  `BACK_FLAT_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_MEASUREMENTS` varchar(255) DEFAULT NULL,
  `PMS_COLOR` varchar(255) DEFAULT NULL,
  `GTIN` double DEFAULT NULL,
  KEY `UNIQUE_KEY` (`UNIQUE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
