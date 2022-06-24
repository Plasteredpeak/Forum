-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2022 at 04:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'General', 'general', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(2, 'Gaming', 'gaming', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(3, 'Tech', 'tech', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(4, 'Coding Questions', 'coding-questions', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(5, 'Anime', 'anime', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(6, 'Announcements', 'announcements', '2022-01-15 14:37:05', '2022-01-15 14:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_id` int(10) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(1, 2, 18, 'threads', '2022-01-17 17:30:41', '2022-01-17 17:30:41'),
(2, 2, 19, 'threads', '2022-01-18 10:30:01', '2022-01-18 10:30:01'),
(3, 2, 17, 'replies', '2022-01-18 10:30:02', '2022-01-18 10:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_06_07_082644_create_sessions_table', 1),
(7, '2021_12_26_000001_create_categories_table', 1),
(8, '2021_12_26_000002_create_threads_table', 1),
(9, '2021_12_26_172132_create_likes_table', 1),
(10, '2021_12_26_172147_create_replies_table', 1),
(11, '2021_12_26_172209_create_subscriptions_table', 1),
(12, '2021_12_26_172221_create_tags_table', 1),
(13, '2022_01_01_162540_create_taggables_table', 1),
(14, '2022_01_12_050452_create_notifications_table', 1),
(15, '2022_01_15_185105_create_views_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00817e74-5a6a-46fc-8531-114a42144dd1', 'App\\Notifications\\NewReplyNotification', 'users', 3, '{\"type\":\"new_reply\",\"reply\":14,\"replyable_id\":10,\"replyable_type\":\"threads\",\"replyable_subject\":\"Nobis dolores.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('03415507-cf46-4c89-bfdd-66c04ba61467', 'App\\Notifications\\NewReplyNotification', 'users', 2, '{\"type\":\"new_reply\",\"reply\":17,\"replyable_id\":19,\"replyable_type\":\"threads\",\"replyable_subject\":\"Toxic Gamers\"}', '2022-01-18 10:32:57', '2022-01-18 10:29:51', '2022-01-18 10:32:57'),
('1c897709-5113-4044-a593-fa82660d48c8', 'App\\Notifications\\NewReplyNotification', 'users', 2, '{\"type\":\"new_reply\",\"reply\":12,\"replyable_id\":12,\"replyable_type\":\"threads\",\"replyable_subject\":\"Suscipit eum et.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('254a87b8-2130-4d1d-8909-61da16b11745', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":9,\"replyable_id\":9,\"replyable_type\":\"threads\",\"replyable_subject\":\"Aut at nisi.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('3cb616af-3f35-41f0-ac99-edfa4a22a44f', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":1,\"replyable_id\":11,\"replyable_type\":\"threads\",\"replyable_subject\":\"Delectus soluta.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('42cb7bc4-99d4-40d1-8641-55e46574df05', 'App\\Notifications\\NewReplyNotification', 'users', 3, '{\"type\":\"new_reply\",\"reply\":13,\"replyable_id\":6,\"replyable_type\":\"threads\",\"replyable_subject\":\"Earum et autem.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('4d53113b-3018-4687-9733-290d72a43e9e', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":6,\"replyable_id\":1,\"replyable_type\":\"threads\",\"replyable_subject\":\"Qui distinctio.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('6a454c32-963b-47f1-b8f4-f62ae707645b', 'App\\Notifications\\NewReplyNotification', 'users', 3, '{\"type\":\"new_reply\",\"reply\":11,\"replyable_id\":3,\"replyable_type\":\"threads\",\"replyable_subject\":\"Quo facilis in.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('83467665-8c11-4d2d-89da-add09778ba60', 'App\\Notifications\\NewReplyNotification', 'users', 1, '{\"type\":\"new_reply\",\"reply\":16,\"replyable_id\":18,\"replyable_type\":\"threads\",\"replyable_subject\":\"Best Pokemon\"}', NULL, '2022-01-17 17:30:32', '2022-01-17 17:30:32'),
('871dd965-4fa3-4198-bd8f-026e00678a83', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":2,\"replyable_id\":9,\"replyable_type\":\"threads\",\"replyable_subject\":\"Aut at nisi.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('876f4451-ee28-43bf-9034-89d2040ac601', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":3,\"replyable_id\":2,\"replyable_type\":\"threads\",\"replyable_subject\":\"Aut nihil est ea.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('a9108b5c-c453-41f5-ad39-f7b2357bcc3f', 'App\\Notifications\\NewReplyNotification', 'users', 3, '{\"type\":\"new_reply\",\"reply\":15,\"replyable_id\":9,\"replyable_type\":\"threads\",\"replyable_subject\":\"Aut at nisi.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('ab277030-fdf5-49a6-89e3-a47fe37258a4', 'App\\Notifications\\NewReplyNotification', 'users', 2, '{\"type\":\"new_reply\",\"reply\":5,\"replyable_id\":5,\"replyable_type\":\"threads\",\"replyable_subject\":\"Ad distinctio.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('b9e55c43-624b-46bd-b699-0a3a1d452eb4', 'App\\Notifications\\NewReplyNotification', 'users', 2, '{\"type\":\"new_reply\",\"reply\":7,\"replyable_id\":6,\"replyable_type\":\"threads\",\"replyable_subject\":\"Earum et autem.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('bafe45f1-177d-4794-8c9b-148ef49375e5', 'App\\Notifications\\NewReplyNotification', 'users', 2, '{\"type\":\"new_reply\",\"reply\":4,\"replyable_id\":8,\"replyable_type\":\"threads\",\"replyable_subject\":\"Iste aliquam qui.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('dc605d6c-a7b0-4ab9-891f-83692820a10d', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":8,\"replyable_id\":3,\"replyable_type\":\"threads\",\"replyable_subject\":\"Quo facilis in.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00'),
('f60686a7-2bb4-4fca-a7cd-8d6b694ee162', 'App\\Notifications\\NewReplyNotification', 'users', 4, '{\"type\":\"new_reply\",\"reply\":10,\"replyable_id\":7,\"replyable_type\":\"threads\",\"replyable_subject\":\"Ad voluptatem.\"}', NULL, '2015-01-21 19:00:00', '2015-01-21 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `replyable_id` int(11) NOT NULL,
  `replyable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `body`, `replyable_id`, `replyable_type`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Ratione nesciunt nulla in voluptas aut qui. Impedit laudantium laborum voluptatem et. Occaecati officiis corporis placeat consectetur laborum enim.', 11, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(2, 'Non qui dolor velit odit vel. Consequatur et atque ea laudantium molestiae ea in. Sint voluptatem aut suscipit beatae.', 9, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(3, 'Sint tempora sed odio dolores rem aperiam. Incidunt velit esse ea. Rerum tempore dolorem quia. Soluta laudantium qui et ipsam reprehenderit blanditiis aut et. Porro sint sunt architecto velit quis.', 2, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(4, 'Adipisci tenetur quod consequuntur et cupiditate dolor. Harum corporis in qui repudiandae quam voluptatem. Aliquid omnis nesciunt eum placeat.', 8, 'threads', 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(5, 'Voluptatem repellat ut doloribus ut distinctio sint nihil qui. Ut consequatur quia ipsum beatae aut maiores.', 5, 'threads', 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(6, 'Recusandae dolor quae doloremque modi vero consequatur unde. Ex qui iure praesentium ut. Illo voluptates porro itaque dolorum ipsam aut.', 1, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(7, 'Dignissimos laudantium dicta magnam libero veritatis sed. Maxime laboriosam eos eius et vel velit. Et sit ipsam ea. Neque sapiente sequi rerum molestias dolor. Nemo enim nostrum veritatis.', 6, 'threads', 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(8, 'Natus voluptas et deleniti numquam magni porro quas. Quos soluta alias necessitatibus. Consequatur nihil aspernatur aut unde debitis.', 3, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(9, 'Quia magnam perspiciatis dolorum veritatis consequatur. Nemo cum ex est omnis qui atque exercitationem. Placeat aut aut sit dolorum quos doloremque sed.', 9, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(10, 'Et reprehenderit ipsum magnam earum tempora. Est voluptatibus ad sint iure harum atque. Perspiciatis odit error tenetur deserunt commodi non.', 7, 'threads', 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(11, 'Excepturi voluptates quis velit quos in nesciunt. Ipsum pariatur repellendus error sequi. Praesentium quos temporibus non. Illo culpa at provident esse autem necessitatibus corporis.', 3, 'threads', 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(12, 'Inventore optio nulla cupiditate consequuntur. Nihil voluptas est sapiente dolores autem. Eligendi consequatur nam asperiores laudantium. Soluta asperiores fugit quibusdam aut.', 12, 'threads', 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(13, 'Nesciunt voluptatem ea beatae ipsam voluptatem. Asperiores dignissimos esse laudantium sequi. Vel voluptatem quis aut et consequatur maxime.', 6, 'threads', 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(14, 'Voluptas totam dolorem facilis possimus magni molestias. Velit pariatur ipsam velit at. Similique iure hic nesciunt quis.', 10, 'threads', 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(15, 'Pariatur non dolor et aliquid et itaque itaque. Molestiae magnam similique esse magnam laboriosam. Veniam ut corrupti et sit consectetur quas non. Eum similique ipsum sunt ducimus quod.', 9, 'threads', 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(16, 'i think charizard is the best pokemon', 18, 'threads', 2, '2022-01-17 17:30:24', '2022-01-17 17:30:24'),
(17, 'hello', 19, 'threads', 2, '2022-01-18 10:29:44', '2022-01-18 10:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3pp3Rb6suTGAWANlDyoGOKEgbplJxgudfnnGpu1V', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.50', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibmdQVHdKSWVMTzhDcXJUc3pCbk9tRWhYd2VINk1LZHZsaTA5c2gyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkMTBtRHJncjZRbi9EdVZpeE1idEFadWczajhQUTE1cnh2dXkuRW1vNksuRWZVOS9pcmZYSmEiO3M6MTA6ImN5cmlsZGV3aXQiO2E6MTp7czoxNzoiZWxvcXVlbnQtdmlld2FibGUiO2E6MTp7czo5OiJjb29sZG93bnMiO2E6MTp7czo3OiJ0aHJlYWRzIjthOjI6e2k6MTk7YToyOntzOjExOiJ2aWV3YWJsZV9pZCI7aToxOTtzOjEwOiJleHBpcmVzX2F0IjtPOjI1OiJJbGx1bWluYXRlXFN1cHBvcnRcQ2FyYm9uIjozOntzOjQ6ImRhdGUiO3M6MjY6IjIwMjItMDEtMTggMjA6Mjk6MjQuMzkwODM0IjtzOjEzOiJ0aW1lem9uZV90eXBlIjtpOjM7czo4OiJ0aW1lem9uZSI7czozOiJVVEMiO319aToxMjthOjI6e3M6MTE6InZpZXdhYmxlX2lkIjtpOjEyO3M6MTA6ImV4cGlyZXNfYXQiO086MjU6IklsbHVtaW5hdGVcU3VwcG9ydFxDYXJib24iOjM6e3M6NDoiZGF0ZSI7czoyNjoiMjAyMi0wMS0xOCAyMDozMzowMC4yNzkwNzIiO3M6MTM6InRpbWV6b25lX3R5cGUiO2k6MztzOjg6InRpbWV6b25lIjtzOjM6IlVUQyI7fX19fX19fQ==', 1642519988),
('9PYeFjmpCqjEf9n0omfibffwjx7U1WPIW0zSsyGm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.50', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTUUxNjBBUXNGdWJTMFpaUWhITklneExOZlpWS0hjbWF2V1lqQkpKRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90aHJlYWRzL2FuaW1lL2Jlc3QtcG9rZW1vbiI7fXM6MTA6ImN5cmlsZGV3aXQiO2E6MTp7czoxNzoiZWxvcXVlbnQtdmlld2FibGUiO2E6MTp7czo5OiJjb29sZG93bnMiO2E6MTp7czo3OiJ0aHJlYWRzIjthOjE6e2k6MTg7YToyOntzOjExOiJ2aWV3YWJsZV9pZCI7aToxODtzOjEwOiJleHBpcmVzX2F0IjtPOjI1OiJJbGx1bWluYXRlXFN1cHBvcnRcQ2FyYm9uIjozOntzOjQ6ImRhdGUiO3M6MjY6IjIwMjItMDEtMTggMDM6NDU6NDAuODYwMDE2IjtzOjEzOiJ0aW1lem9uZV90eXBlIjtpOjM7czo4OiJ0aW1lem9uZSI7czozOiJVVEMiO319fX19fX0=', 1642459540),
('hGh262Q2j3TaZfHsQYVAynmqAeFv1h5t1ILeG0yc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 OPR/82.0.4227.50', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDFVSU5QbHI5WlBLS3pXaFg4YW8xejhzNWdzNlh1QjBKdGJ6TzRDUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642519744);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscriptionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriptionable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `subscriptionable_type`, `subscriptionable_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'threads', 18, '2022-01-17 17:32:25', '2022-01-17 17:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taggables`
--

INSERT INTO `taggables` (`id`, `tag_id`, `taggable_type`, `taggable_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'threads', 16, '2022-01-17 17:22:05', '2022-01-17 17:22:05'),
(2, 4, 'threads', 17, '2022-01-17 17:23:06', '2022-01-17 17:23:06'),
(3, 1, 'threads', 17, '2022-01-17 17:23:06', '2022-01-17 17:23:06'),
(4, 1, 'threads', 18, '2022-01-17 17:25:02', '2022-01-17 17:25:02'),
(5, 5, 'threads', 18, '2022-01-17 17:25:02', '2022-01-17 17:25:02'),
(6, 1, 'threads', 19, '2022-01-17 17:28:15', '2022-01-17 17:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Gossip', 'gossip', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(2, 'Valorant', 'valorant', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(3, 'Java', 'java', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(4, 'MHA', 'mha', '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(5, 'Pokemon', 'pokemon', '2022-01-17 17:24:12', '2022-01-17 17:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `title`, `body`, `slug`, `author_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Qui distinctio.', 'Beatae quidem expedita dignissimos est nulla labore. Minima dolores eum tempore dolor totam. Error quos consequatur quam quos vel minima mollitia.', 'quo-illo-sapiente-et-reiciendis-ducimus', 4, 6, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(2, 'Aut nihil est ea.', 'Ut iure expedita doloremque similique optio. Odio aut et optio.', 'et-dolore-quaerat-aliquid-magni-architecto-voluptas-aut-eveniet', 2, 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(3, 'Quo facilis in.', 'Modi dolores ut porro sapiente neque distinctio nemo. Deserunt eos expedita consectetur modi molestiae. Iusto accusantium suscipit quia quos est eos est.', 'porro-itaque-ea-ratione-ut', 2, 6, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(4, 'Rerum temporibus.', 'Culpa repudiandae et expedita et corrupti fuga. Rerum incidunt ad est enim impedit.', 'id-incidunt-nihil-molestiae-voluptatem-dolorem', 3, 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(5, 'Ad distinctio.', 'Ratione officiis iusto quia molestiae. Quas ex magni enim maiores sapiente qui qui culpa.', 'eaque-minus-aliquam-omnis-nihil-qui-enim-autem-tenetur', 3, 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(6, 'Earum et autem.', 'Et aut provident maiores qui harum ut. Sapiente magni est ut aut dolores itaque.', 'quo-voluptas-suscipit-dicta-itaque-facere-cupiditate-consectetur-qui', 4, 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(7, 'Ad voluptatem.', 'Qui inventore et explicabo at. Necessitatibus enim velit et quae dolore veritatis fuga. Fugiat velit aut unde sit velit nulla.', 'dicta-quia-enim-tempore-nisi', 2, 3, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(8, 'Iste aliquam qui.', 'Facere dolores facere voluptates eum odit officia aut. Esse saepe at aut iusto velit rem.', 'tenetur-rerum-ipsum-sequi-nam-eos-nulla', 4, 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(9, 'Aut at nisi.', 'Est ut nesciunt molestias sed suscipit. Repellat laborum suscipit labore fugit cumque reiciendis.', 'sunt-laudantium-sed-nostrum-fugiat', 2, 5, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(10, 'Nobis dolores.', 'Dicta necessitatibus tempore et qui. Excepturi est fugit qui aliquam distinctio. Sit tempore qui sapiente deserunt voluptates sit.', 'quae-praesentium-minima-aliquid', 2, 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(11, 'Delectus soluta.', 'Perspiciatis aperiam id eaque voluptatem. Voluptates non quasi consequatur quam possimus laboriosam et.', 'et-eos-aut-neque', 3, 2, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(12, 'Suscipit eum et.', 'Sed dolores veritatis est voluptas quis at sunt. Sequi inventore consequuntur ea et quam. Numquam similique ipsum vel dolores distinctio tempore odio ut.', 'dolor-aperiam-eaque-vel-aut-laudantium-iusto-ullam', 4, 4, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(13, 'Reiciendis.', 'Illo alias eum accusamus ipsa. Explicabo iste quis eveniet earum alias nulla excepturi. Voluptatum dolor possimus maiores non.', 'dolorum-nihil-doloribus-perferendis-commodi', 3, 5, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(14, 'Cupiditate omnis.', 'Possimus laborum iste fuga distinctio. Aliquam possimus perferendis pariatur velit dolorem. Velit non illo voluptates eum officiis corrupti qui.', 'voluptas-quo-placeat-aperiam-est-aut-nihil', 2, 1, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(15, 'Iusto soluta aut.', 'Officia voluptatem odio eaque cum aut quos nihil. Dolor quaerat unde aliquid voluptates. Ad optio quis pariatur ea quibusdam ea dolorum.', 'et-voluptas-amet-provident', 2, 1, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(16, 'Raze Supremecy', '<div>Raze is the best Agent in <strong>Valorant.</strong>&nbsp;No Agent even Compares to her</div>', 'raze-supremecy', 2, 2, '2022-01-17 17:22:05', '2022-01-17 17:22:05'),
(17, 'My Hero Academia', '<div>Deku is the best anime character ever created he is the best</div>', 'my-hero-academia', 2, 5, '2022-01-17 17:23:06', '2022-01-17 17:23:06'),
(18, 'Best Pokemon', '<div>Pikachu is a species of Pokémon, fictional creatures that appear in an assortment of media of the Pokémon franchise by The Pokémon Company. Pikachu is a yellow mouse-like Pokémon with powerful electrical abilities.</div>', 'best-pokemon', 1, 5, '2022-01-17 17:25:02', '2022-01-17 17:25:02'),
(19, 'Toxic Gamers', '<div>A toxic gamer is a <strong>player who has a bad attitude in an online gaming context</strong>. These players are players who are constantly swearing, being rude, acting out towards other payers, and bringing other players down.&nbsp;</div>', 'toxic-gamers', 2, 2, '2022-01-17 17:28:15', '2022-01-17 17:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `bio`, `email`, `type`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '', 'admin@pp.com', 3, '2022-01-15 14:37:05', '$2y$10$rdzyWMPGIkxoE3PCibwaPOJrJD3lhq1eiMjIrynaKRlndVo8Q.j2a', NULL, NULL, 'HYxNIuffGwkRHB6OO9SNqLylcEBDJBQPXItfjWSoNGKw58T0pDqKdhwq2QMJ', NULL, NULL, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(2, 'Pepe', '', 'pepe@pp.com', 1, '2022-01-15 14:37:05', '$2y$10$10mDrgr6Qn/DuVixMbtAZug3j8PQ15rxvuy.Emo6K.EfU9/irfXJa', NULL, NULL, 'Nn2s9JcuH1Tcc23JBUja5IjFcsadsaOu7FNUgC0SWF75wiZPOBX9fG0IBRG4', NULL, NULL, '2022-01-15 14:37:05', '2022-01-17 17:35:52'),
(3, 'Ali', '', 'ali@pp.com', 1, '2022-01-15 14:37:05', '$2y$10$8OtL5TLCWOJGKHFqJ3MdNupRBYl4ehogNMR55MQjq1iKSR9GhNmEm', NULL, NULL, 'G3sc1PNt9c', NULL, NULL, '2022-01-15 14:37:05', '2022-01-15 14:37:05'),
(4, 'Hamza', '', 'hamza@pp.com', 1, '2022-01-15 14:37:05', '$2y$10$NPhMWCRfmIUONTyyeeCsBOuXwnf.koiVLuQ4OUk7dHO1PwxCO3Nyu', NULL, NULL, 'yVhc7l6Tlc', NULL, NULL, '2022-01-15 14:37:05', '2022-01-15 14:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `viewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewable_id` bigint(20) UNSIGNED NOT NULL,
  `visitor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `viewable_type`, `viewable_id`, `visitor`, `collection`, `viewed_at`) VALUES
(1, 'threads', 9, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-15 14:37:14'),
(2, 'threads', 15, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-15 14:38:06'),
(3, 'threads', 15, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-17 17:29:55'),
(4, 'threads', 18, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-17 17:30:09'),
(5, 'threads', 19, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-17 17:43:28'),
(6, 'threads', 19, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-17 17:43:39'),
(7, 'threads', 18, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-17 17:45:40'),
(8, 'threads', 19, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-18 10:29:24'),
(9, 'threads', 12, 'Owx5CiWc0rAtcShgPVDj0fUXBRa6dsHkYW2XwNLNqMeV9qvaF1tbF7EgmEUL07EjRdli66SBN3Q8z1PL', NULL, '2022-01-18 10:33:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

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
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_author_id_foreign` (`author_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `subscriptions_subscriptionable_type_subscriptionable_id_index` (`subscriptionable_type`,`subscriptionable_id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggables_tag_id_foreign` (`tag_id`),
  ADD KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_author_id_foreign` (`author_id`),
  ADD KEY `threads_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_viewable_type_viewable_id_index` (`viewable_type`,`viewable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `threads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
