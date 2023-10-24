-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2023 at 06:06 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u558152278_scoremaxdash`
--

-- --------------------------------------------------------

--
-- Table structure for table `agreement_histories`
--

CREATE TABLE `agreement_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recipient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bulk_envelope_status` varchar(191) DEFAULT NULL,
  `envelope_id` varchar(191) DEFAULT NULL,
  `error_details` varchar(191) DEFAULT NULL,
  `recipient_signing_uri` varchar(191) DEFAULT NULL,
  `recipient_signing_uri_error` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `status_date_time` varchar(191) DEFAULT NULL,
  `uri` varchar(191) DEFAULT NULL,
  `is_test` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `details` tinytext DEFAULT NULL,
  `account_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_pages`
--

CREATE TABLE `core_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `summary` tinytext DEFAULT NULL,
  `content` tinytext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `currency_placement` varchar(191) NOT NULL DEFAULT 'before' COMMENT 'before, after',
  `current_currency` varchar(191) NOT NULL DEFAULT 'on' COMMENT 'on, off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `symbol`, `currency_placement`, `current_currency`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', '$', 'before', 'off', '2023-02-02 14:17:04', '2023-10-20 14:28:23', NULL),
(4, 'GBP', '£', 'after', 'off', '2023-02-02 14:17:04', '2023-10-20 14:28:23', NULL),
(7, 'NGN', '₦', 'before', 'on', '2023-10-20 14:28:23', '2023-10-20 14:28:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) NOT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `owner_user_id` int(10) UNSIGNED DEFAULT NULL,
  `tenant_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'owner user id',
  `category` tinyint(4) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for active 0 for default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `responsibilities` varchar(191) NOT NULL COMMENT '1=tenant, 2=owner',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `tax` decimal(8,3) NOT NULL DEFAULT 0.000,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '0=deactivate,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) NOT NULL,
  `answer` tinytext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `summary` tinytext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_managers`
--

CREATE TABLE `file_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder_name` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_size` varchar(191) DEFAULT NULL,
  `origin_type` varchar(191) DEFAULT NULL,
  `origin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_managers`
--

INSERT INTO `file_managers` (`id`, `folder_name`, `file_name`, `file_size`, `origin_type`, `origin_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'files/Gateway', 'paypal.png', NULL, 'App\\Models\\Gateway', 1, NULL, NULL, NULL),
(2, 'files/Gateway', 'stripe.png', NULL, 'App\\Models\\Gateway', 2, NULL, NULL, NULL),
(3, 'files/Gateway', 'razorpay.png', NULL, 'App\\Models\\Gateway', 3, NULL, NULL, NULL),
(4, 'files/Gateway', 'instamojo.png', NULL, 'App\\Models\\Gateway', 4, NULL, NULL, NULL),
(5, 'files/Gateway', 'mollie.png', NULL, 'App\\Models\\Gateway', 5, NULL, NULL, NULL),
(6, 'files/Gateway', 'paystack.png', NULL, 'App\\Models\\Gateway', 6, NULL, NULL, NULL),
(7, 'files/Gateway', 'sslcommerz.png', NULL, 'App\\Models\\Gateway', 7, NULL, NULL, NULL),
(8, 'files/Gateway', 'flutterwave.png', NULL, 'App\\Models\\Gateway', 8, NULL, NULL, NULL),
(9, 'files/Gateway', 'mercadopago.png', NULL, 'App\\Models\\Gateway', 9, NULL, NULL, NULL),
(10, 'files/Gateway', 'bank.png', NULL, 'App\\Models\\Gateway', 10, NULL, NULL, NULL),
(11, 'files/Setting', 'logo-1697811850.png', NULL, 'App\\Models\\Setting', 30, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(12, 'files/Setting', 'logo-white-1697811850.png', NULL, 'App\\Models\\Setting', 31, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(13, 'files/Setting', 'favicon-1697811850.png', NULL, 'App\\Models\\Setting', 32, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(14, 'files/Setting', 'login-1697811850.png', NULL, 'App\\Models\\Setting', 33, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(15, 'files/Property', '1697812850.jpeg', NULL, 'App\\Models\\Property', NULL, '2023-10-20 14:40:50', '2023-10-20 14:40:50', NULL),
(16, 'files/PropertyImage', '1697812884.jpeg', NULL, 'App\\Models\\PropertyImage', 1, '2023-10-20 14:41:24', '2023-10-20 14:41:24', NULL),
(17, 'files/User', '1697814367.jpg', NULL, 'App\\Models\\User', 3, '2023-10-20 15:06:07', '2023-10-20 15:06:07', NULL),
(18, 'files/Tenant', '1697814797.png', NULL, 'App\\Models\\Tenant', NULL, '2023-10-20 15:13:17', '2023-10-20 15:13:17', NULL),
(19, 'files/Tenant', '1697814888.jpg', NULL, 'App\\Models\\Tenant', 1, '2023-10-20 15:14:48', '2023-10-20 15:14:48', NULL),
(20, 'files/User', '1697815031.png', NULL, 'App\\Models\\User', 4, '2023-10-20 15:17:11', '2023-10-20 15:17:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Active,0=Disable',
  `mode` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1=live,2=sandbox',
  `url` varchar(191) DEFAULT NULL,
  `key` varchar(191) DEFAULT NULL COMMENT 'client id, public key, key, store id, api key',
  `secret` varchar(191) DEFAULT NULL COMMENT 'client secret, secret, store password, auth token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `owner_user_id`, `title`, `slug`, `image`, `status`, `mode`, `url`, `key`, `secret`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Paypal', 'paypal', 'assets/images/gateway-icon/paypal.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(2, 2, 'Stripe', 'stripe', 'assets/images/gateway-icon/stripe.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(3, 2, 'Razorpay', 'razorpay', 'assets/images/gateway-icon/razorpay.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(4, 2, 'Instamojo', 'instamojo', 'assets/images/gateway-icon/instamojo.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(5, 2, 'Mollie', 'mollie', 'assets/images/gateway-icon/mollie.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(6, 2, 'Paystack', 'paystack', 'assets/images/gateway-icon/paystack.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(7, 2, 'Sslcommerz', 'sslcommerz', 'assets/images/gateway-icon/sslcommerz.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(8, 2, 'Flutterwave', 'flutterwave', 'assets/images/gateway-icon/flutterwave.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(9, 2, 'Mercadopago', 'mercadopago', 'assets/images/gateway-icon/mercadopago.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(10, 2, 'Bank', 'bank', 'assets/images/gateway-icon/bank.jpg', 1, 2, '', '', '', NULL, NULL, NULL),
(11, 2, 'Cash', 'cash', 'assets/images/gateway-icon/cash.jpg', 1, 2, '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(191) NOT NULL DEFAULT 'USD',
  `conversion_rate` decimal(12,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `gateway_id`, `owner_user_id`, `currency`, `conversion_rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'USD', '1.00', NULL, NULL, NULL),
(2, 2, NULL, 'USD', '1.00', NULL, NULL, NULL),
(3, 3, NULL, 'INR', '80.00', NULL, NULL, NULL),
(4, 4, NULL, 'INR', '80.00', NULL, NULL, NULL),
(5, 5, NULL, 'USD', '1.00', NULL, NULL, NULL),
(6, 6, NULL, 'NGN', '464.00', NULL, NULL, NULL),
(7, 7, NULL, 'BDT', '100.00', NULL, NULL, NULL),
(8, 8, NULL, 'NGN', '464.00', NULL, NULL, NULL),
(9, 9, NULL, 'BRL', '5.00', NULL, NULL, NULL),
(10, 10, NULL, 'USD', '1.00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `how_it_works`
--

CREATE TABLE `how_it_works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `summary` tinytext DEFAULT NULL,
  `content` tinytext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `distance` varchar(191) DEFAULT NULL,
  `additional_information` varchar(191) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_recurring_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `property_unit_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `invoice_no` varchar(191) NOT NULL,
  `month` varchar(191) NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `tax_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=paid,2=overdue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `tax_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring_settings`
--

CREATE TABLE `invoice_recurring_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `property_unit_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL DEFAULT '2023-05-21 13:36:41',
  `recurring_type` tinyint(4) NOT NULL DEFAULT 1,
  `cycle_day` int(11) DEFAULT NULL,
  `due_day_after` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(191) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=deactivate,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring_setting_items`
--

CREATE TABLE `invoice_recurring_setting_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_recurring_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_types`
--

CREATE TABLE `invoice_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `tax` decimal(8,3) NOT NULL DEFAULT 0.000,
  `status` tinyint(4) DEFAULT 1 COMMENT '0=deactivate,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_configs`
--

CREATE TABLE `kyc_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `is_both` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_verifications`
--

CREATE TABLE `kyc_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_config_id` bigint(20) UNSIGNED NOT NULL,
  `front_id` bigint(20) UNSIGNED DEFAULT NULL,
  `back_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'accepted, pending, rejected',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `font_id` int(11) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Active,0=Disable',
  `default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=yes,0=no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `font_id`, `icon`, `rtl`, `status`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', NULL, NULL, 0, 1, 1, '2023-02-02 14:17:04', '2023-10-20 14:24:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_duration_type` tinyint(4) NOT NULL DEFAULT 1,
  `bed_room` varchar(191) DEFAULT NULL,
  `bath_room` varchar(191) DEFAULT NULL,
  `kitchen_room` varchar(191) DEFAULT NULL,
  `dining_room` varchar(191) DEFAULT NULL,
  `living_room` varchar(191) DEFAULT NULL,
  `storage_room` varchar(191) DEFAULT NULL,
  `other_room` text DEFAULT NULL,
  `interior` varchar(191) DEFAULT NULL,
  `slug` text NOT NULL,
  `amenities` varchar(191) DEFAULT NULL,
  `advantage` varchar(191) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listing_contacts`
--

CREATE TABLE `listing_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `listing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `profession` varchar(191) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listing_images`
--

CREATE TABLE `listing_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listing_information`
--

CREATE TABLE `listing_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `listing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `distance` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_histories`
--

CREATE TABLE `mail_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `error` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintainers`
--

CREATE TABLE `maintainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintainers`
--

INSERT INTO `maintainers` (`id`, `user_id`, `property_id`, `owner_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 0, 2, '2023-10-20 15:06:07', '2023-10-20 15:06:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_issues`
--

CREATE TABLE `maintenance_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `issue_id` bigint(20) UNSIGNED NOT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 3,
  `attach_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `is_view` tinyint(1) NOT NULL DEFAULT 0,
  `message` tinytext DEFAULT NULL,
  `reply` tinytext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `page_name` varchar(191) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_14_123059_create_metas_table', 1),
(6, '2022_06_23_121213_create_settings_table', 1),
(7, '2022_06_25_110824_create_currencies_table', 1),
(8, '2022_06_25_111037_create_languages_table', 1),
(9, '2022_10_03_070043_create_transactions_table', 1),
(10, '2022_11_26_183258_create_file_managers_table', 1),
(11, '2022_11_30_040739_create_gateways_table', 1),
(12, '2022_11_30_043112_create_invoice_types_table', 1),
(13, '2022_11_30_043152_create_ticket_topics_table', 1),
(14, '2022_12_02_143113_create_properties_table', 1),
(15, '2022_12_02_143115_create_property_details_table', 1),
(16, '2022_12_02_150206_create_property_units_table', 1),
(17, '2022_12_02_151705_create_property_images_table', 1),
(18, '2022_12_12_120950_create_expense_types_table', 1),
(19, '2022_12_12_121023_create_expenses_table', 1),
(20, '2022_12_14_124619_create_tenants_table', 1),
(21, '2022_12_14_152333_create_invoices_table', 1),
(22, '2022_12_15_072303_create_tenant_details_table', 1),
(23, '2022_12_19_184746_create_invoice_items_table', 1),
(24, '2022_12_24_055810_create_information_table', 1),
(25, '2022_12_24_134905_create_maintainers_table', 1),
(26, '2022_12_26_093722_create_notice_boards_table', 1),
(27, '2022_12_26_112846_create_notice_user_table', 1),
(28, '2023_01_03_075827_create_gateway_currencies_table', 1),
(29, '2023_01_07_120244_create_banks_table', 1),
(30, '2023_01_08_093333_create_kyc_verifications_table', 1),
(31, '2023_01_08_101846_create_kyc_configs_table', 1),
(32, '2023_01_11_113946_create_maintenance_issues_table', 1),
(33, '2023_01_11_130025_create_maintenance_requests_table', 1),
(34, '2023_01_12_131452_create_tickets_table', 1),
(35, '2023_01_22_070829_create_ticket_replies_table', 1),
(36, '2023_01_30_071830_create_orders_table', 1),
(37, '2023_02_01_094211_create_notifications_table', 1),
(38, '2023_02_07_131801_create_invoice_recurring_settings_table', 1),
(39, '2023_02_07_132102_create_invoice_recurring_setting_items_table', 1),
(40, '2023_02_08_070028_add_field_to_invoices_table', 1),
(41, '2023_02_11_130034_create_packages_table', 1),
(42, '2023_02_26_123728_create_owners_table', 1),
(43, '2023_02_27_051537_add_field_to_users_table', 1),
(44, '2023_02_27_134555_create_owner_packages_table', 1),
(45, '2023_02_28_060601_add_dependency_field_for_multi_owner_saas', 1),
(46, '2023_03_06_115256_change_filed_to_tenant_details_table', 1),
(47, '2023_03_06_125634_add_field_to_invoice_types_table', 1),
(48, '2023_03_06_131839_add_field_to_expense_types_table', 1),
(49, '2023_03_06_140942_add_field_to_invoice_items_table', 1),
(50, '2023_03_06_141916_add_field_to_invoices_table', 1),
(51, '2023_03_20_071848_create_features_table', 1),
(52, '2023_03_20_100913_create_how_it_works_table', 1),
(53, '2023_03_20_122923_create_core_pages_table', 1),
(54, '2023_03_21_090904_create_testimonials_table', 1),
(55, '2023_03_21_095818_create_faqs_table', 1),
(56, '2023_03_23_130158_create_subscription_orders_table', 1),
(57, '2023_03_28_063823_create_tax_settings_table', 1),
(58, '2023_05_15_105919_add_field_font_id_to_languages_table', 1),
(59, '2023_06_12_095437_create_sms_histories_table', 1),
(60, '2023_06_14_062807_create_mail_histories_table', 1),
(61, '2023_06_19_120927_create_messages_table', 1),
(62, '2023_06_20_094453_add_field_type_to_tenants_table', 1),
(63, '2023_07_05_074548_create_agreement_histories_table', 1),
(64, '2023_07_12_062906_add_field_to_users_table', 1),
(65, '2023_07_12_112338_add_field_to_properties_table', 1),
(66, '2023_07_20_061535_change_decimal_number', 1),
(67, '2023_07_20_065853_add_field_verify_token_to_users_table', 1),
(68, '2023_07_31_070327_add_field_otp_to_users_table', 1),
(69, '2023_07_19_074820_create_tenancies_table', 1),
(70, '2023_07_19_074850_create_domains_table', 1),
(71, '2023_08_17_065719_create_email_templates_table', 1),
(72, '2023_08_26_074018_create_listings_table', 1),
(73, '2023_08_26_075152_create_listing_information_table', 1),
(74, '2023_08_27_071047_create_listing_images_table', 1),
(75, '2023_08_29_092825_create_listing_contacts_table', 1),
(76, '2023_09_04_061231_add_fields_to_owners_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `details` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_all` tinyint(4) NOT NULL DEFAULT 0,
  `unit_all` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_user`
--

CREATE TABLE `notice_user` (
  `notice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_seen` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT 0.00,
  `tax_amount` double(8,2) DEFAULT NULL,
  `tax_percentage` double(8,2) DEFAULT NULL,
  `system_currency` varchar(191) DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_currency` varchar(191) DEFAULT NULL,
  `conversion_rate` double(8,2) DEFAULT 1.00,
  `subtotal` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) DEFAULT 0.00,
  `transaction_amount` double(8,2) DEFAULT 0.00,
  `payment_status` tinyint(4) DEFAULT 0 COMMENT '0=pending, 1=paid, 2=cancelled',
  `bank_id` tinyint(4) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `deposit_by` varchar(191) DEFAULT NULL,
  `deposit_slip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `print_name` varchar(191) NOT NULL,
  `print_address` varchar(191) NOT NULL,
  `print_contact` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `user_id`, `status`, `print_name`, `print_address`, `print_contact`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '', '', '', '2023-03-27 15:21:38', '2023-03-27 15:21:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owner_packages`
--

CREATE TABLE `owner_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `max_maintainer` int(11) NOT NULL DEFAULT 0,
  `max_property` int(11) NOT NULL DEFAULT 0,
  `max_unit` int(11) NOT NULL DEFAULT 0,
  `max_tenant` int(11) NOT NULL DEFAULT 0,
  `max_invoice` int(11) NOT NULL DEFAULT 0,
  `max_auto_invoice` int(11) NOT NULL DEFAULT 0,
  `ticket_support` tinyint(4) NOT NULL DEFAULT 0,
  `notice_support` tinyint(4) NOT NULL DEFAULT 0,
  `monthly_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `yearly_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_trail` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'default for 1 , not default for 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `max_maintainer` int(11) NOT NULL DEFAULT 0,
  `max_property` int(11) NOT NULL DEFAULT 0,
  `max_unit` int(11) NOT NULL DEFAULT 0,
  `max_tenant` int(11) NOT NULL DEFAULT 0,
  `max_invoice` int(11) NOT NULL DEFAULT 0,
  `max_auto_invoice` int(11) NOT NULL DEFAULT 0,
  `ticket_support` tinyint(4) NOT NULL DEFAULT 0,
  `notice_support` tinyint(4) NOT NULL DEFAULT 0,
  `monthly_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `yearly_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'active for 1 , deactivate for 0',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'default for 1 , not default for 0',
  `is_trail` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'default for 1 , not default for 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `maintainer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_type` tinyint(4) NOT NULL COMMENT '1=Own, 2=Lease',
  `name` varchar(191) NOT NULL,
  `number_of_unit` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_image` varchar(191) DEFAULT NULL,
  `unit_type` tinyint(4) DEFAULT NULL COMMENT '1=Single, 2=Multiple',
  `status` tinyint(4) DEFAULT 4 COMMENT '1=Active, 2=Inactive, 3=Cancelled, 4=Draft',
  `thumbnail_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `owner_user_id`, `maintainer_id`, `property_type`, `name`, `number_of_unit`, `description`, `thumbnail_image`, `unit_type`, `status`, `thumbnail_image_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, 'The Crystal Residence', 2, 'The Crystal Residence is an older technology that contains some security flaws. Transport Layer Security (TLS) is the upgraded version of SSL that fixes existing SSL vulnerabilities. TLS authenticates more efficiently and continues to support encrypted communication channels.', NULL, 2, 4, 15, NULL, '2023-10-20 14:33:29', '2023-10-20 15:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `property_details`
--

CREATE TABLE `property_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `lease_amount` decimal(12,2) DEFAULT 0.00,
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `country_id` varchar(191) DEFAULT NULL,
  `state_id` varchar(191) DEFAULT NULL,
  `city_id` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `map_link` mediumtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_details`
--

INSERT INTO `property_details` (`id`, `property_id`, `lease_amount`, `lease_start_date`, `lease_end_date`, `country_id`, `state_id`, `city_id`, `zip_code`, `address`, `map_link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '0.00', NULL, NULL, 'Nigeria', 'Edo', 'Benin', '300251', '27 Airport Road Benin City', 'https://maps.app.goo.gl/cM58j9E1Km2Rc5dk8', NULL, '2023-10-20 14:33:29', '2023-10-20 14:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `file_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 16, '2023-10-20 14:41:24', '2023-10-20 14:41:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_units`
--

CREATE TABLE `property_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `bedroom` int(11) NOT NULL,
  `bath` int(11) NOT NULL,
  `kitchen` int(11) NOT NULL,
  `general_rent` decimal(12,2) DEFAULT 0.00,
  `security_deposit_type` tinyint(4) DEFAULT 0,
  `security_deposit` decimal(12,2) DEFAULT 0.00,
  `late_fee_type` tinyint(4) DEFAULT 0,
  `late_fee` decimal(12,2) DEFAULT 0.00,
  `incident_receipt` decimal(12,2) DEFAULT 0.00,
  `rent_type` tinyint(4) DEFAULT NULL COMMENT '1=monthly,2=yearly,3=custom',
  `monthly_due_day` int(11) DEFAULT NULL,
  `yearly_due_day` int(11) DEFAULT NULL,
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `lease_payment_due_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_units`
--

INSERT INTO `property_units` (`id`, `property_id`, `unit_name`, `bedroom`, `bath`, `kitchen`, `general_rent`, `security_deposit_type`, `security_deposit`, `late_fee_type`, `late_fee`, `incident_receipt`, `rent_type`, `monthly_due_day`, `yearly_due_day`, `lease_start_date`, `lease_end_date`, `lease_payment_due_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Top front', 3, 3, 1, '100000.00', 0, '10000.00', 0, '1000.00', '5000.00', 2, NULL, 1, NULL, NULL, NULL, NULL, '2023-10-20 14:37:39', '2023-10-20 14:38:41'),
(2, 1, 'Bottom front', 3, 2, 1, '150000.00', 0, '10000.00', 0, '1000.00', '5000.00', 2, NULL, 1, NULL, NULL, NULL, NULL, '2023-10-20 14:37:39', '2023-10-20 14:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_key` varchar(191) NOT NULL,
  `option_value` text DEFAULT NULL,
  `label` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option_key`, `option_value`, `label`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'build_version', '13', NULL, '2023-02-02 11:34:12', '2023-02-02 11:34:12', NULL),
(2, 'current_version', '3.0', NULL, '2023-02-02 11:34:12', '2023-02-02 11:34:12', NULL),
(3, 'app_name', 'Score Maxten Properties Nigeria Ltd.', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(4, 'app_email', 'info@scoremaxten.com', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(5, 'app_contact_number', '551728282', NULL, '2023-02-02 17:51:06', '2023-02-04 09:45:55', NULL),
(6, 'app_location', 'Nigeria', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(7, 'app_copyright', 'Score Maxten Properties © 2018 All right reserved', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(8, 'app_developed_by', 'THC', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(9, 'currency_id', '1', NULL, '2023-02-02 17:51:06', '2023-02-06 07:09:23', NULL),
(10, 'language_id', '1', NULL, '2023-02-02 17:51:06', '2023-02-02 17:51:06', NULL),
(11, 'app_preloader_status', '2', NULL, '2023-02-02 17:51:06', '2023-02-02 17:51:06', NULL),
(12, 'sign_in_text_title', 'Login', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(13, 'sign_in_text_subtitle', 'You are signing in Score Maxten Properties Ltd.', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(14, 'meta_keyword', 'ZaiprotyScore Maxten Property Ltd.', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(15, 'meta_author', 'Score Maxten Property Ltd.', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(16, 'revisit', NULL, NULL, '2023-02-02 17:51:06', '2023-02-02 17:51:06', NULL),
(17, 'sitemap_link', NULL, NULL, '2023-02-02 17:51:06', '2023-02-02 17:51:06', NULL),
(18, 'meta_description', 'Score Maxten Property Ltd.', NULL, '2023-02-02 17:51:06', '2023-10-20 14:24:10', NULL),
(23, 'website_primary_color', '#72bf01', NULL, '2023-02-04 09:46:20', '2023-10-20 14:26:07', NULL),
(24, 'website_secondary_color', '#0e2e50', NULL, '2023-02-04 09:46:20', '2023-10-20 14:26:07', NULL),
(25, 'button_primary_color', '#72bf01', NULL, '2023-02-04 09:46:20', '2023-10-20 14:26:07', NULL),
(26, 'button_hover_color', '#0e2e50', NULL, '2023-02-04 09:46:20', '2023-10-20 14:26:07', NULL),
(27, 'website_color_mode', '1', NULL, '2023-02-04 09:46:20', '2023-10-20 14:26:07', NULL),
(28, 'gateway_settings', '{\"paypal\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Client ID\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Secret\",\"name\":\"secret\",\"is_show\":1}],\"stripe\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Public Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Secret Key\",\"name\":\"secret\",\"is_show\":0}],\"razorpay\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Secret\",\"name\":\"secret\",\"is_show\":1}],\"instamojo\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Api Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Auth Token\",\"name\":\"secret\",\"is_show\":1}],\"mollie\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Mollie Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Secret\",\"name\":\"secret\",\"is_show\":0}],\"paystack\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Public Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Secret Key\",\"name\":\"secret\",\"is_show\":0}],\"mercadopago\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Client ID\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Client Secret\",\"name\":\"secret\",\"is_show\":1}],\"sslcommerz\":[{\"label\":\"Url\",\"name\":\"url\",\"is_show\":0},{\"label\":\"Store ID\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Store Password\",\"name\":\"secret\",\"is_show\":1}],\"flutterwave\":[{\"label\":\"Hash\",\"name\":\"url\",\"is_show\":1},{\"label\":\"Public Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Client Secret\",\"name\":\"secret\",\"is_show\":1}],\"coinbase\":[{\"label\":\"Hash\",\"name\":\"url\",\"is_show\":0},{\"label\":\"API Key\",\"name\":\"key\",\"is_show\":1},{\"label\":\"Client Secret\",\"name\":\"secret\",\"is_show\":0}]}', NULL, '2023-02-22 20:49:54', '2023-02-22 20:49:54', NULL),
(29, 'app_card_data_show', '1', NULL, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(30, 'app_logo', '11', NULL, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(31, 'app_logo_white', '12', NULL, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(32, 'app_fav_icon', '13', NULL, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL),
(33, 'sign_in_image', '14', NULL, '2023-10-20 14:24:10', '2023-10-20 14:24:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_histories`
--

CREATE TABLE `sms_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED NOT NULL,
  `api` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `message` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `error` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_orders`
--

CREATE TABLE `subscription_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT 1,
  `amount` double(8,2) DEFAULT 0.00,
  `tax_amount` double(8,2) DEFAULT NULL,
  `tax_percentage` double(8,2) DEFAULT NULL,
  `system_currency` varchar(191) DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_currency` varchar(191) DEFAULT NULL,
  `conversion_rate` double(8,2) DEFAULT 1.00,
  `subtotal` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) DEFAULT 0.00,
  `transaction_amount` double(8,2) DEFAULT 0.00,
  `payment_status` tinyint(4) DEFAULT 0 COMMENT '0=pending, 1=paid, 2=cancelled',
  `bank_id` tinyint(4) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `deposit_by` varchar(191) DEFAULT NULL,
  `deposit_slip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

CREATE TABLE `tax_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenancies`
--

CREATE TABLE `tenancies` (
  `id` varchar(191) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job` varchar(191) NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `family_member` int(11) NOT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rent_type` tinyint(4) NOT NULL DEFAULT 1,
  `due_date` tinyint(4) DEFAULT NULL,
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `general_rent` decimal(12,2) NOT NULL DEFAULT 0.00,
  `security_deposit_type` tinyint(4) DEFAULT 0,
  `security_deposit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `late_fee_type` tinyint(4) DEFAULT 0,
  `late_fee` decimal(12,2) NOT NULL DEFAULT 0.00,
  `incident_receipt` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 3,
  `close_refund_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `close_charge` decimal(12,2) NOT NULL DEFAULT 0.00,
  `close_date` date DEFAULT NULL,
  `close_reason` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `user_id`, `owner_user_id`, `job`, `image_id`, `age`, `family_member`, `property_id`, `unit_id`, `rent_type`, `due_date`, `lease_start_date`, `lease_end_date`, `general_rent`, `security_deposit_type`, `security_deposit`, `late_fee_type`, `late_fee`, `incident_receipt`, `status`, `close_refund_amount`, `close_charge`, `close_date`, `close_reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 2, 'Technician', 18, 40, 2, 1, 1, 1, 1, '2023-10-20', '2024-10-20', '100000.00', 0, '10000.00', 0, '1000.00', '5000.00', 1, '0.00', '0.00', NULL, NULL, '2023-10-20 15:13:17', '2023-10-20 15:14:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_details`
--

CREATE TABLE `tenant_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `previous_address` varchar(191) DEFAULT NULL,
  `previous_country_id` varchar(191) DEFAULT NULL,
  `previous_state_id` varchar(191) DEFAULT NULL,
  `previous_city_id` varchar(191) DEFAULT NULL,
  `previous_zip_code` varchar(191) DEFAULT NULL,
  `permanent_address` varchar(191) DEFAULT NULL,
  `permanent_country_id` varchar(191) DEFAULT NULL,
  `permanent_state_id` varchar(191) DEFAULT NULL,
  `permanent_city_id` varchar(191) DEFAULT NULL,
  `permanent_zip_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_details`
--

INSERT INTO `tenant_details` (`id`, `tenant_id`, `previous_address`, `previous_country_id`, `previous_state_id`, `previous_city_id`, `previous_zip_code`, `permanent_address`, `permanent_country_id`, `permanent_state_id`, `permanent_city_id`, `permanent_zip_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'heareae', 'Nigeria', 'Edo', 'Benin', '3232423', 'this place', 'Nigeria', 'Edo', 'Auchi', '444444', '2023-10-20 15:13:17', '2023-10-20 15:13:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `comment` tinytext DEFAULT NULL,
  `star` tinyint(4) NOT NULL DEFAULT 5,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `ticket_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_topics`
--

CREATE TABLE `ticket_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '0=deactivate,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `txn_id` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `payment_details` longtext DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `status` enum('initiate','pending','completed','cancelled') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Active = true, Inactive = false',
  `created_by` bigint(20) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `date_of_birth` datetime DEFAULT NULL,
  `otp` varchar(191) DEFAULT NULL,
  `otp_expire` datetime DEFAULT NULL,
  `nid_number` varchar(191) DEFAULT NULL,
  `verify_token` varchar(191) DEFAULT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `contact_number`, `status`, `created_by`, `role`, `date_of_birth`, `otp`, `otp_expire`, `nid_number`, `verify_token`, `owner_user_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mr', 'Admin', 'admin@gmail.com', '2023-02-02 17:34:12', '$2y$10$QJ79PGQOQgVetj9TVY/ow.qPyGm7nFD9N91y4Tl6pJy50C9wIFa/i', '01951973806', 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'y9Y1BsGS37rcQaN6ObR0lKh52aF8aB3XnqG4faxd88pOjGBnnwlPuGeyKCKh', NULL, NULL, '2023-02-04 13:54:59'),
(2, 'Mr', 'Owner', 'owner@gmail.com', '2023-02-02 17:34:12', '$2y$10$QJ79PGQOQgVetj9TVY/ow.qPyGm7nFD9N91y4Tl6pJy50C9wIFa/i', '01952973806', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 'wsyx2SMUtyhftDk0ssNAC7NTUP66VTYczSOvNvqLi3UYrqRIv0gy4BBTrKH5', NULL, NULL, '2023-02-04 13:54:59'),
(3, 'Landlord', 'John', 'landlord@gmail.com', NULL, '$2y$10$NhUYOiSOdjmDLhNlpWu2QeCLhxxQVWJGcure6VBzJVJGQWIyt30sy', '123412341234', 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2023-10-20 15:06:07', '2023-10-20 15:06:07'),
(4, 'Mr', 'Tenant', 'tenant@gmail.com', NULL, '$2y$10$LmAAhyMw.WRosCyaUEZwoeEw.ADpE5dMZLQYLsZx8YUTNab9h.b4C', '09021319961', 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2023-10-20 15:13:17', '2023-10-20 15:13:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_pages`
--
ALTER TABLE `core_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domains_domain_unique` (`domain`),
  ADD KEY `domains_tenant_id_foreign` (`tenant_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_managers_origin_type_origin_id_index` (`origin_type`,`origin_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `how_it_works`
--
ALTER TABLE `how_it_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_no_unique` (`invoice_no`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_recurring_settings`
--
ALTER TABLE `invoice_recurring_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_recurring_setting_items`
--
ALTER TABLE `invoice_recurring_setting_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_types`
--
ALTER TABLE `invoice_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_configs`
--
ALTER TABLE `kyc_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_verifications`
--
ALTER TABLE `kyc_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_contacts`
--
ALTER TABLE `listing_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_images`
--
ALTER TABLE `listing_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_information`
--
ALTER TABLE `listing_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintainers`
--
ALTER TABLE `maintainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_issues`
--
ALTER TABLE `maintenance_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_packages`
--
ALTER TABLE `owner_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `packages_name_unique` (`name`),
  ADD UNIQUE KEY `packages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_details`
--
ALTER TABLE `property_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_details_property_id_foreign` (`property_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_images_property_id_foreign` (`property_id`);

--
-- Indexes for table `property_units`
--
ALTER TABLE `property_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_units_property_id_foreign` (`property_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_settings`
--
ALTER TABLE `tax_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenancies`
--
ALTER TABLE `tenancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_ticket_no_unique` (`ticket_no`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_topics`
--
ALTER TABLE `ticket_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_txn_id_unique` (`txn_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_contact_number_unique` (`contact_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_pages`
--
ALTER TABLE `core_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_managers`
--
ALTER TABLE `file_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `how_it_works`
--
ALTER TABLE `how_it_works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring_settings`
--
ALTER TABLE `invoice_recurring_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring_setting_items`
--
ALTER TABLE `invoice_recurring_setting_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_types`
--
ALTER TABLE `invoice_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_configs`
--
ALTER TABLE `kyc_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_verifications`
--
ALTER TABLE `kyc_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `listing_contacts`
--
ALTER TABLE `listing_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `listing_images`
--
ALTER TABLE `listing_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `listing_information`
--
ALTER TABLE `listing_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `maintainers`
--
ALTER TABLE `maintainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_issues`
--
ALTER TABLE `maintenance_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `owner_packages`
--
ALTER TABLE `owner_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_details`
--
ALTER TABLE `property_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_units`
--
ALTER TABLE `property_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_settings`
--
ALTER TABLE `tax_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenant_details`
--
ALTER TABLE `tenant_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_topics`
--
ALTER TABLE `ticket_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property_details`
--
ALTER TABLE `property_details`
  ADD CONSTRAINT `property_details_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property_units`
--
ALTER TABLE `property_units`
  ADD CONSTRAINT `property_units_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
