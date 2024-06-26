-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 04:36 AM
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
-- Database: `tugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_code` varchar(255) NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `appointment_code`, `cart_id`, `user_id`, `service_id`, `date`, `time_slot_id`, `start_time`, `end_time`, `location_id`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 'APP-1', 2, 19, 2, '2024-05-22', 9, '17:00:00', '18:00:00', 1, 3000.00, 0, '2024-05-22 06:39:30', '2024-05-22 06:48:39'),
(2, 'APP-2', 3, 21, 1, '2024-06-03', 1, '09:00:00', '10:00:00', 5, 1250.00, 1, '2024-05-31 10:31:49', '2024-05-31 10:31:49'),
(3, 'APP-3', 4, 23, 1, '2024-06-12', 1, '09:00:00', '10:00:00', 3, 1250.00, 1, '2024-06-07 01:05:49', '2024-06-07 01:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `is_abandoned` tinyint(1) NOT NULL DEFAULT 0,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `uuid`, `user_id`, `is_paid`, `is_cancelled`, `is_abandoned`, `total`, `created_at`, `updated_at`) VALUES
(1, '1e3a02bb-24d7-4edc-a37a-b8046cde085f', 17, 0, 0, 0, 9500.00, '2024-05-22 06:07:31', '2024-05-22 06:48:56'),
(2, '9073eec9-f231-4cc8-ac2b-d752d90d4a72', 19, 1, 0, 0, 3000.00, '2024-05-22 06:39:22', '2024-05-22 06:39:30'),
(3, '7768e12f-f4c3-4d8c-bfc0-14ea237e77e5', 21, 1, 0, 0, 1250.00, '2024-05-31 10:31:44', '2024-05-31 10:31:49'),
(4, '5f48578e-e00e-4014-bf13-1afdede15212', 23, 1, 0, 0, 1250.00, '2024-06-07 01:05:44', '2024-06-07 01:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `cart_service`
--

CREATE TABLE `cart_service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `time_slot_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_service`
--

INSERT INTO `cart_service` (`id`, `cart_id`, `service_id`, `time_slot_id`, `date`, `start_time`, `end_time`, `location_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5, '2024-05-23', '13:00:00', '14:00:00', 2, 3000.00, NULL, NULL),
(2, 2, 2, 9, '2024-05-22', '17:00:00', '18:00:00', 1, 3000.00, NULL, NULL),
(3, 1, 1, 7, '2024-05-22', '15:00:00', '16:00:00', 1, 1250.00, NULL, NULL),
(4, 1, 1, 8, '2024-05-22', '16:00:00', '17:00:00', 1, 1250.00, NULL, NULL),
(5, 1, 3, 6, '2024-05-22', '14:00:00', '15:00:00', 5, 4000.00, NULL, NULL),
(6, 3, 1, 1, '2024-06-03', '09:00:00', '10:00:00', 5, 1250.00, NULL, NULL),
(7, 4, 1, 1, '2024-06-12', '09:00:00', '10:00:00', 3, 1250.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'field', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(2, 'ball', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(3, 'seat', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(4, 'change room', '2024-05-21 15:08:53', '2024-05-21 15:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `name`, `description`, `discount`, `start_date`, `end_date`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Deal 1', 'Deal Dengan Flora', 10, '2024-05-22', '2024-05-25', 0, '2024-05-21 15:08:53', '2024-05-22 06:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"43e79391-9f34-4319-a972-4e61a3ddd910\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-ee06-4c4b-b2de-e4e487f97e0a\"}', 0, NULL, 1716309533, 1716309533),
(2, 'default', '{\"uuid\":\"3add5db3-bae0-46f9-b8cd-f0ebd25942bb\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-f1fc-400e-bff4-1c98a3bb05a8\"}', 0, NULL, 1716309533, 1716309533),
(3, 'default', '{\"uuid\":\"38ceeca1-d7c4-4a97-920f-4265ebfaaee0\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-f495-4a40-8495-f5d0396aa82a\"}', 0, NULL, 1716309533, 1716309533),
(4, 'default', '{\"uuid\":\"53b6851a-634b-44c9-a180-fe8405ecc6df\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-f9b2-4c3c-b7b1-090f4e56168e\"}', 0, NULL, 1716309533, 1716309533),
(5, 'default', '{\"uuid\":\"cec844df-4b2d-4c89-a61f-fb819d7dcfb0\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-fb13-43d4-afa9-48ee1a4411af\"}', 0, NULL, 1716309533, 1716309533),
(6, 'default', '{\"uuid\":\"50b259d2-019f-4312-adeb-7f8c7d115da1\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-fc69-47e5-bd0a-b7927bf34792\"}', 0, NULL, 1716309533, 1716309533),
(7, 'default', '{\"uuid\":\"1004bec8-5372-4a05-a82a-f15fac6e7934\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f201-ff98-4c96-a92b-78739063868b\"}', 0, NULL, 1716309533, 1716309533),
(8, 'default', '{\"uuid\":\"ab6d2a5a-44b1-4f3c-ab1e-25d07018f6c2\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f202-00f3-4032-992e-120c11fd48fe\"}', 0, NULL, 1716309533, 1716309533),
(9, 'default', '{\"uuid\":\"1f9297d4-cf2e-4883-af2f-8692a7045a4a\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f202-0206-4111-b8a0-fdaf3fc59655\"}', 0, NULL, 1716309533, 1716309533),
(10, 'default', '{\"uuid\":\"c7c1f59f-2a64-4b88-803a-220969224208\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f202-0576-4ea1-8f61-9a777e7ce9dd\"}', 0, NULL, 1716309533, 1716309533),
(11, 'default', '{\"uuid\":\"620507fd-3bf7-4bd1-ac41-27bef593590b\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f202-0747-456a-ba85-d60eaf6db1e0\"}', 0, NULL, 1716309533, 1716309533),
(12, 'default', '{\"uuid\":\"ed00af55-78a5-46a0-89d6-5144b7454020\",\"displayName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewServicePromoMailJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendNewServicePromoMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"service\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Service\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c18f202-0924-4547-8333-6c65d36fb8f4\"}', 0, NULL, 1716309533, 1716309533),
(13, 'default', '{\"uuid\":\"c3615d55-4a67-4017-8b0e-d4b5687a1ba8\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:2;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19eec9-9caf-4fe2-b6b5-bfe180408525\"}', 0, NULL, 1716351943, 1716351943),
(14, 'default', '{\"uuid\":\"6a74c409-6deb-42ee-82da-039bfe1771c7\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f137-35fc-42b0-b864-093741b69d75\"}', 0, NULL, 1716352350, 1716352350),
(15, 'default', '{\"uuid\":\"43b0b987-e6a6-433b-91e2-d8b5d2e238b5\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f16a-ba2c-4839-a9b8-fbfcba7724f1\"}', 0, NULL, 1716352384, 1716352384),
(16, 'default', '{\"uuid\":\"b4398cc0-c844-43b8-914b-b0fd39f2569b\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f18c-a72f-4130-94b3-4b6a23ec2f27\"}', 0, NULL, 1716352406, 1716352406),
(17, 'default', '{\"uuid\":\"0fcc5f25-b123-4b5a-85ee-88ea0b2745c4\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f190-8dcf-45e1-a408-014bf5e8e7de\"}', 0, NULL, 1716352408, 1716352408),
(18, 'default', '{\"uuid\":\"43ccf12e-700d-4585-ba9f-d361e656b708\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f191-687c-487f-b5a1-5a15199fa16c\"}', 0, NULL, 1716352409, 1716352409),
(19, 'default', '{\"uuid\":\"27eb27d5-42eb-4527-88d0-f9683dede3ba\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f234-bdc7-44d6-8243-d989f6775038\"}', 0, NULL, 1716352516, 1716352516),
(20, 'default', '{\"uuid\":\"6f9a4dd7-dff8-4626-bbcd-068e678efc96\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f286-87f2-45f4-b0f7-32cf0aa8e2a8\"}', 0, NULL, 1716352570, 1716352570),
(21, 'default', '{\"uuid\":\"a0689eac-fbef-48d0-b282-5824421d02c9\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f287-5750-4bb7-9de9-0fe3d51cc36f\"}', 0, NULL, 1716352570, 1716352570),
(22, 'default', '{\"uuid\":\"f243fba5-8105-40d3-8055-39cf38537a2f\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f28a-8980-48ea-9edd-902f8ac12811\"}', 0, NULL, 1716352572, 1716352572),
(23, 'default', '{\"uuid\":\"3d99070d-0345-43c9-b111-e31d67af24ea\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f28b-9029-4634-8f9a-00eb5f3e1119\"}', 0, NULL, 1716352573, 1716352573),
(24, 'default', '{\"uuid\":\"f7f67586-ea15-4bac-afd8-7c33a07911ae\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f28c-7743-4e68-8fd1-176bc6daddd2\"}', 0, NULL, 1716352574, 1716352574),
(25, 'default', '{\"uuid\":\"38512664-2c66-4797-b2a9-ddccdb41a8f2\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f28f-847b-45ea-bf53-58856264bb0f\"}', 0, NULL, 1716352576, 1716352576),
(26, 'default', '{\"uuid\":\"7b1a9666-8a49-4467-bb1d-522a5180891a\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f2a8-02d5-4c74-8a4f-02e455b591a6\"}', 0, NULL, 1716352592, 1716352592),
(27, 'default', '{\"uuid\":\"6c967429-4f6d-49a0-8b47-a87cde0552a4\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f2a8-cfb5-4ef3-83a2-d4c4f694bfc5\"}', 0, NULL, 1716352592, 1716352592),
(28, 'default', '{\"uuid\":\"92843ef1-2fc7-4807-bfe9-9fbd61d4d681\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f2ac-04a4-4ef3-a882-afac0dc4053b\"}', 0, NULL, 1716352594, 1716352594),
(29, 'default', '{\"uuid\":\"7050899b-924f-43ba-a065-04009771174a\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c19f372-7d48-4f10-a97f-bc10de4ebb5f\"}', 0, NULL, 1716352724, 1716352724),
(30, 'default', '{\"uuid\":\"e60f55d5-9b58-474e-9a83-b9f8d9b56562\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:2;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a3956-13e8-47a6-90c2-6cdb1c6cf442\"}', 0, NULL, 1716364450, 1716364450),
(31, 'default', '{\"uuid\":\"cad3af51-6b07-4333-ac55-325b586bc5d4\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a3a87-c2b0-484f-a685-d2ea0fc735e6\"}', 0, NULL, 1716364650, 1716364650),
(32, 'default', '{\"uuid\":\"2420f796-06cc-4ef0-8e9d-f5ff2a05cc89\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a3cf1-f91d-47e0-9fce-77e1732f4f96\"}', 0, NULL, 1716365055, 1716365055),
(33, 'default', '{\"uuid\":\"61257d01-e88f-46d2-a8bd-2926721bd84e\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:2;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a3e17-139c-465e-8178-dfc0f9ce3e08\"}', 0, NULL, 1716365247, 1716365247),
(34, 'default', '{\"uuid\":\"e6bc0202-9b28-4316-82d3-6924bd5d726c\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:2;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a3eb4-6280-458b-9c01-d56446fc5ecb\"}', 0, NULL, 1716365350, 1716365350),
(35, 'default', '{\"uuid\":\"9178c87f-c20b-4743-843b-99f87aa7bace\",\"displayName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"command\":\"O:43:\\\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:11:\\\"appointment\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Appointment\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c1a3ed1-a249-41b6-9a7b-ee7afc9626b3\"}', 0, NULL, 1716365370, 1716365370),
(36, 'default', '{\"uuid\":\"c6ddd485-c9d1-4ff6-89d1-7676e4ccf82f\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a41b6-8aa5-498d-9563-d229b7ef9a4d\"}', 0, NULL, 1716365855, 1716365855),
(37, 'default', '{\"uuid\":\"a25785a7-aa44-40cd-a2be-9c207e8dd4d5\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a41e6-4e04-4d2f-8ebd-6987d6d7fd3b\"}', 0, NULL, 1716365886, 1716365886),
(38, 'default', '{\"uuid\":\"d9e5ed82-b0b4-44bd-9d19-1932dc5026c8\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a41fd-4f2b-4711-9d41-d8e7bc18aa69\"}', 0, NULL, 1716365902, 1716365902),
(39, 'default', '{\"uuid\":\"436c827b-f281-480d-b386-e890ebc854db\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a420b-02ed-4b59-9ce6-909b8df2bc0e\"}', 0, NULL, 1716365911, 1716365911),
(40, 'default', '{\"uuid\":\"68c83c50-3635-4a12-9dae-d39874f8e5d7\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:3;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c1a4220-4625-4b32-87bc-c9baa95732ed\"}', 0, NULL, 1716365924, 1716365924),
(41, 'default', '{\"uuid\":\"2bfcd89a-d3df-4e7a-995e-3c4c45e6f573\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:3;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c2c2fac-e920-4718-8c6c-f2ec47844146\"}', 0, NULL, 1717135923, 1717135923),
(42, 'default', '{\"uuid\":\"21b24dae-9d07-4a64-a1e6-c7ab5f0bdfd9\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c2cac8f-e8dd-4904-82f2-2fc9d6b71292\"}', 0, NULL, 1717156876, 1717156876),
(43, 'default', '{\"uuid\":\"477b285b-b19a-457f-8839-ca0410e3c3f3\",\"displayName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"command\":\"O:43:\\\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:11:\\\"appointment\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Appointment\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c2cacc2-b36d-4048-a902-066336bdb7d6\"}', 0, NULL, 1717156909, 1717156909),
(44, 'default', '{\"uuid\":\"9db4f4cc-9ec9-49b9-a27a-dbd0879e95c4\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:3;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c39e07e-21bc-49ce-89c2-defc366b04b8\"}', 0, NULL, 1717723934, 1717723934),
(45, 'default', '{\"uuid\":\"9cd325c7-d3a0-4427-97c7-a65346965879\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:2;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c39e08d-6f06-42eb-bf14-6cd6fd15ff1e\"}', 0, NULL, 1717723944, 1717723944),
(46, 'default', '{\"uuid\":\"b3a7677f-1062-4695-9f37-5c022bd33558\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c39e0a6-2bf2-4e30-aa86-e74a9512467b\"}', 0, NULL, 1717723960, 1717723960),
(47, 'default', '{\"uuid\":\"c364de91-f739-4159-8027-86d53a3c77e3\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c39e0c2-9d9b-4a92-8ede-5cca32e75e22\"}', 0, NULL, 1717723979, 1717723979),
(48, 'default', '{\"uuid\":\"4260962a-8290-4ffe-874b-28fc9cc8e13e\",\"displayName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AnalyticsJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\AnalyticsJob\\\":3:{s:5:\\\"model\\\";s:7:\\\"Service\\\";s:2:\\\"id\\\";i:1;s:13:\\\"analytic_type\\\";s:4:\\\"view\\\";}\"},\"telescope_uuid\":\"9c39f71d-90af-4ed1-b5d1-b83ed7ff8fc9\"}', 0, NULL, 1717727729, 1717727729),
(49, 'default', '{\"uuid\":\"79989cf4-18f8-4b2d-ac85-7b3fa0d4e3d6\",\"displayName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\",\"command\":\"O:43:\\\"App\\\\Jobs\\\\SendAppointmentConfirmationMailJob\\\":2:{s:8:\\\"customer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:11:\\\"appointment\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Appointment\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"telescope_uuid\":\"9c39f73c-650f-47b9-b248-994f4e33c970\"}', 0, NULL, 1717727749, 1717727749);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `telephone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Location 1', 'Laguboti', '1234567890', 1, '2024-05-21 15:08:53', '2024-05-22 06:04:29'),
(2, 'Location 2', 'Porsea', '1234567890', 1, '2024-05-21 15:08:53', '2024-05-22 06:04:39'),
(3, 'Location 3', 'Balige', '1234567890', 1, '2024-05-21 15:08:53', '2024-05-22 06:04:57'),
(4, 'Location 4', 'Jalur Gaza', '1234567890', 1, '2024-05-21 15:08:53', '2024-05-22 06:05:24'),
(5, 'Location 5', 'Lumban Julu', '1234567890', 1, '2024-05-22 06:05:52', '2024-05-22 06:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_05_08_135614_create_sessions_table', 1),
(7, '2023_05_13_144600_create_roles_table', 1),
(8, '2023_05_13_155544_add_role_id_to_users_table', 1),
(9, '2023_06_01_114923_create_locations_table', 1),
(10, '2023_06_03_121845_create_services_table', 1),
(11, '2023_06_07_091657_create_deals_table', 1),
(12, '2023_09_18_134208_create_categories_table', 1),
(13, '2023_09_26_040647_create_jobs_table', 1),
(14, '2023_09_26_085642_create_service_hits_table', 1),
(15, '2023_09_26_185410_create_time_slots_table', 1),
(16, '2023_09_27_021712_create_carts_table', 1),
(17, '2023_09_27_023637_create_appointments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--


--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(2, 'Employee', 1, '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(3, 'Customer', 1, '2024-05-21 15:08:53', '2024-05-21 15:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `allergens` varchar(255) DEFAULT NULL,
  `benefits` varchar(255) DEFAULT NULL,
  `aftercare_tips` varchar(255) DEFAULT NULL,
  `cautions` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `description`, `image`, `price`, `notes`, `allergens`, `benefits`, `aftercare_tips`, `cautions`, `category_id`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Field Cleaning', 'Field-Cleaning', 'Get great service cleaning extensions for a stylish field \r\n look.', 'hair.jpg', 1250.00, 'Choose from a variety of Field Cleaning.', NULL, 'Adds length and clean to your field.', 'Avoid harsh chemicals on your nails to maintain the extensions.', NULL, 1, 0, '2024-05-21 15:08:53', '2024-05-22 06:06:40'),
(2, 'seat', 'seat', 'Add vibrant highlights to your field view for most experince of view.', 'skin.jpg', 3000.00, 'Consult with our staff for the best shade selection.', '', 'Transform your field look with our staff.', '', 'Patch test required for new clients with new recomend.', 3, 0, '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(3, 'new-ball', 'new-ball', 'Revitalize your ball with deep conditioning service.', 'nails.jpg', 4000.00, 'Recommended for dry and damaged ball.', NULL, 'Nourish and repair your ball for improved texture and shine.', 'Use recommended ball masks for ongoing maintenance.', NULL, 3, 0, '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(4, 'Changes room', 'Changes-room', 'Relaxing scalp massage to rejuvenate your foot.', 'makeup.jpg', 3500.00, 'Enjoy a soothing massage with aromatic oils.', 'Massage oils may contain allergens; inform us of any allergies.', 'Promote scalp health and reduce stress with this pampering treatment.', 'Take time to relax and destress after the treatment.', NULL, 3, 0, '2024-05-21 15:08:53', '2024-05-21 15:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `service_hits`
--

CREATE TABLE `service_hits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `hit_time` timestamp NOT NULL DEFAULT '2024-05-21 14:35:35',
  `analytic_data_type` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7gqHlqt7tBhhLZYG6UFjdmChfBJSTTlgTZqshSty', 23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZHlZUHE0N2lJM21lYWFOTTlSMWltZ2JIdmMwd1NiZWNYdWszUDQ1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIzO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGJYOEthT0tzR2IyV2hqOU5qLmhKTWVMUS5OLmRINW5EbFBZSndJRzdXTkVSMkxQQU9CUmR5Ijt9', 1717727775),
('Wv7keul8SoHitSuqVLS13rVqLPkFJdb7HH6zpdZf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0JzUmZnM1E0bEMyWHNQT1U4T05heDlqTUdqbnhVQUdzMkpYbEtMQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717727587);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '09:00:00', '10:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(2, '10:00:00', '11:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(3, '11:00:00', '12:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(4, '12:00:00', '13:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(5, '13:00:00', '14:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(6, '14:00:00', '15:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(7, '15:00:00', '16:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(8, '16:00:00', '17:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53'),
(9, '17:00:00', '18:00:00', '2024-05-21 15:08:53', '2024-05-21 15:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `phone_number`, `remember_token`, `current_team_id`, `profile_photo_path`, `status`, `created_at`, `updated_at`, `role_id`) VALUES
(17, 'olaa', 'olanainggolan\r\n@gmail.com', NULL, '$2y$10$F/Lps72Yob/mpLMvP000puhOE3xRJ7xiAd2eO2eItMP9u0drl91k6', NULL, NULL, NULL, '0812609704', NULL, NULL, NULL, 1, '2024-05-21 15:26:41', '2024-05-21 15:26:41', 1),
(19, 'elga', 'elga\r\n@gmail.com', NULL, '$2y$10$YptJnkBMVUDMMDylByIyQOp3kgwAIxTxECZT6eY77OwinnKTT7gKi', NULL, NULL, NULL, '1234567890', NULL, NULL, NULL, 1, '2024-05-22 06:13:34', '2024-05-22 06:13:34', 3),
(21, 'test', 'test@gmail.com', NULL, '$2y$10$ewJES6WTbwbLDZhHDzEo/.kug11WSmhsCvzCwUhH91BidlLXBWOPq', NULL, NULL, NULL, '0112121212', NULL, NULL, NULL, 1, '2024-05-31 10:31:00', '2024-05-31 10:31:00', 3),
(22, 'flora', 'floranainggolan@gmail.com', NULL, ' $2a$12$5jv7KnVVIb4ZH4sSb7D.MeHfFtYT3i/VkbSRw6LI2zKtXhB57G1r6 ', NULL, NULL, NULL, '0895612219', NULL, NULL, NULL, 1, '2024-06-07 02:25:44', '2024-06-07 02:25:44', 1),
(23, 'siholmarito10', 'siholmarito100905@gmail.com', NULL, '$2y$10$bX8KaOKsGb2Whj9Nj.hJMeLQ.N.dH5nDlPYJwIG7WNER2LPAOBRdy', NULL, NULL, NULL, '0112121211', NULL, NULL, NULL, 1, '2024-06-07 01:04:57', '2024-06-07 01:04:57', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointments_appointment_code_unique` (`appointment_code`),
  ADD KEY `appointments_cart_id_foreign` (`cart_id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`),
  ADD KEY `appointments_service_id_foreign` (`service_id`),
  ADD KEY `appointments_time_slot_id_foreign` (`time_slot_id`),
  ADD KEY `appointments_location_id_foreign` (`location_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_uuid_unique` (`uuid`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_service`
--
ALTER TABLE `cart_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_service_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_service_service_id_foreign` (`service_id`),
  ADD KEY `cart_service_time_slot_id_foreign` (`time_slot_id`),
  ADD KEY `cart_service_location_id_foreign` (`location_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_category_id_index` (`category_id`);

--
-- Indexes for table `service_hits`
--
ALTER TABLE `service_hits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_service`
--
ALTER TABLE `cart_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_hits`
--
ALTER TABLE `service_hits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `appointments_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `appointments_time_slot_id_foreign` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`),
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_service`
--
ALTER TABLE `cart_service`
  ADD CONSTRAINT `cart_service_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_service_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `cart_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `cart_service_time_slot_id_foreign` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
