-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 08 Jul 2025 pada 03.23
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diousdonuts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dious Donuts', 'dious-donuts', '/storage/photos/1/Banner/banner1.jpg', NULL, 'active', '2025-06-23 04:40:13', '2025-06-23 04:40:13'),
(2, 'Delicious And Tasty', 'delicious-and-tasty', '/storage/photos/1/Banner/banner2.jpg', NULL, 'active', '2025-06-23 04:40:52', '2025-06-23 04:40:52'),
(3, 'Lots Of Discounts', 'lots-of-discounts', '/storage/photos/1/Banner/banner3.jpg', NULL, 'active', '2025-06-23 04:41:09', '2025-06-23 04:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 9000.00, 'new', 1, 9000.00, '2025-06-23 04:55:05', '2025-06-23 05:02:25'),
(2, 7, 2, 1, 9000.00, 'new', 1, 9000.00, '2025-06-24 01:44:57', '2025-06-24 01:45:38'),
(3, 7, 3, 1, 9000.00, 'new', 1, 9000.00, '2025-06-25 09:08:33', '2025-06-25 09:09:24'),
(4, 7, NULL, 2, 9000.00, 'new', 1, 9000.00, '2025-06-26 01:44:20', '2025-06-26 01:44:20'),
(5, 7, 4, 3, 9000.00, 'new', 1, 9000.00, '2025-06-26 01:58:07', '2025-06-26 01:58:51'),
(6, 8, NULL, 4, 10000.00, 'new', 3, 30000.00, '2025-06-26 02:57:00', '2025-06-26 02:58:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Classic Donuts', 'classic-donuts', '<p><span style=\"color: rgb(133, 135, 150);\">Traditional glazed donuts, chocolate-covered, and sugar-coated.</span></p>', '/storage/photos/1/Category/category.jpg', NULL, 'active', '2025-06-23 04:42:06', '2025-06-23 04:42:06'),
(2, 'Frosted Donuts', 'frosted-donuts', '<p><span style=\"color: rgb(133, 135, 150);\">Donuts with various frosting flavors like vanilla, chocolate, strawberry, or lemon.</span></p>', '/storage/photos/1/Category/category2.jpg', NULL, 'active', '2025-06-23 04:42:31', '2025-06-23 04:42:31'),
(3, 'Seasonal Donuts', 'seasonal-donuts', '<p><span style=\"color: rgb(133, 135, 150);\">Donuts available only during certain seasons or holidays, like pumpkin spice for fall or peppermint for Christmas.</span></p>', '/storage/photos/1/Category/category3.jpg', NULL, 'active', '2025-06-23 04:42:58', '2025-06-23 04:42:58'),
(4, 'Specialty Donuts', 'specialty-donuts', '<p><span style=\"color: rgb(133, 135, 150);\">Donuts with unique flavors or toppings, like maple bacon, salted caramel, or matcha.</span></p>', '/storage/photos/1/Category/spesial.jpg', NULL, 'active', '2025-06-23 04:43:23', '2025-06-23 04:43:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'karina', 'order', 'karina@gmail.com', NULL, '1234556788966', 'apakah bisa chekout donat 100 biji', NULL, '2025-06-26 02:26:58', '2025-06-26 02:26:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2025_06_23_100555_create_banners_table', 1),
(5, '2025_06_23_100712_create_categories_table', 1),
(6, '2025_06_23_100815_create_products_table', 1),
(7, '2025_06_23_100930_create_messages_table', 1),
(8, '2025_06_23_101033_create_shippings_table', 1),
(9, '2025_06_23_101127_create_orders_table', 1),
(10, '2025_06_23_101200_create_carts_table', 1),
(11, '2025_06_23_101256_create_notifications_table', 1),
(12, '2025_06_23_101417_create_wishlists_table', 1),
(13, '2025_06_23_101505_create_product_reviews_table', 1),
(14, '2025_06_23_101555_create_settings_table', 1),
(15, '2025_06_23_101753_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('40d1b7d0-f17d-4725-a438-9b78dc67a4e5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-24 01:45:40', '2025-06-24 01:45:40'),
('acd9f626-7f84-459f-b08d-b3ce3839d01d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-25 09:09:25', '2025-06-25 09:09:25'),
('b43c2b5f-8de0-41bb-aeb6-e047572b7082', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-26 01:58:54', '2025-06-26 01:58:54'),
('d773f9be-0c9b-41ff-972f-f43661044ce0', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-23 05:02:26', '2025-06-23 05:02:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `snap_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `snap_token`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'ORD-CMOJUDV6KQ', 1, 9000.00, NULL, 29000.00, 1, 'cod', 'unpaid', 'new', NULL, 'bhfdjfh', 'dnsbj', 'admin@gmail.com', '343433454', 'gfdgfdgf', '2025-06-23 05:02:25', '2025-06-23 05:02:25'),
(2, 'ORD-OKFM4YMGXU', 1, 9000.00, NULL, 29000.00, 1, 'midtrans', 'unpaid', 'new', 'a5f9f6c4-37ba-43c5-b7fe-c775a7511efd', 'haechan', 'lee', 'haechan@gmail.com', '72184328947324', 'kwangya', '2025-06-24 01:45:38', '2025-06-24 01:45:38'),
(3, 'ORD-AFPAO4K52D', 1, 9000.00, NULL, 39000.00, 1, 'midtrans', 'unpaid', 'new', '7faf4ece-47f6-4df1-96cd-43e7fc0dd6f9', 'haechan', 'nct', 'haechan@gmail.com', '1234567896', 'kwangya', '2025-06-25 09:09:24', '2025-06-25 09:09:24'),
(4, 'ORD-4K1NLBFJYO', 3, 9000.00, NULL, 29000.00, 1, 'midtrans', 'unpaid', 'delivered', '3c7af8a1-ea30-434e-bce2-1f4d476d60dc', 'karina', 'aespa', 'karina@gmail.com', '123456679897', 'kwangya', '2025-06-26 01:58:51', '2025-06-26 02:21:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `cat_id`, `price`, `discount`, `stock`, `summary`, `is_featured`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chocolate Glazed Donut with Crushed Peanuts', 'chocolate-glazed-donut-with-crushed-peanuts', 1, 10000.00, 0.00, 10, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">This ring-shaped donut is topped with a luscious layer of chocolate glaze and finished with a generous handful of crunchy crushed peanuts on one side.</span></p>', 1, '/storage/photos/1/Products/best4.jpg', 'active', '2025-06-23 04:44:53', '2025-06-23 04:44:53'),
(2, 'Chocolate Glazed Donut with Sprinkles', 'chocolate-glazed-donut-with-sprinkles', 1, 9000.00, 0.00, 20, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">This is a classic ring-shaped donut topped with a smooth, rich chocolate glaze and generously sprinkled with colorful candy sprinkles.</span></p>', 1, '/storage/photos/1/Products/clas.jpeg', 'active', '2025-06-23 04:45:35', '2025-06-23 04:45:35'),
(3, 'Hot Chocolate Donuts', 'hot-chocolate-donuts', 2, 10000.00, 0.00, 9, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">The Hot Chocolate Donut is a cozy, indulgent treat perfect for cold weather or any chocolate lover.</span></p>', 1, '/storage/photos/1/Products/hot.png', 'active', '2025-06-23 04:46:14', '2025-06-23 04:46:14'),
(4, 'Greentea Donuts', 'greentea-donuts', 2, 12000.00, 3.00, 10, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">The Green Tea Donut is a delightful fusion of tradition and modern indulgence.</span></p>', 1, '/storage/photos/1/Products/best2.jpg', 'active', '2025-06-23 04:46:54', '2025-06-23 04:46:54'),
(5, 'Crispy Kreme Donust', 'crispy-kreme-donust', 3, 15000.00, 0.00, 29, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">Krispy Kreme Donuts are iconic for their irresistibly soft, melt-in-your-mouth texture and signature glaze.</span></p>', 1, '/storage/photos/1/Products/best6.jpg', 'active', '2025-06-23 04:47:33', '2025-06-23 04:47:33'),
(6, 'Ube Donuts', 'ube-donuts', 4, 10000.00, 2.00, 21, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">The Ube Donut is a vibrant and flavorful delight inspired by the rich taste of purple yam.</span></p>', 1, '/storage/photos/1/Products/best1-removebg-preview.png', 'active', '2025-06-23 04:48:25', '2025-06-23 04:48:25'),
(7, 'Oreo Donuts', 'oreo-donuts', 4, 9000.00, 0.00, 20, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">Our Oreo Donut is a delicious treat for cookie lovers! This fluffy donut is generously coated with rich chocolate glaze and topped with crumbled Oreo cookies for that perfect crunchy texture.</span></p>', 1, '/storage/photos/1/Products/oreo donust.jpg', 'active', '2025-06-23 04:49:08', '2025-06-26 02:21:44'),
(8, 'Donuts Purple Huze', 'donuts-purple-huze', 4, 10000.00, 0.00, 12, '<p><span style=\"color: rgb(133, 135, 150); text-align: center;\">This eye-catching donut features a rich purple glaze, likely made from fresh berries or purple yam.</span></p>', 1, '/storage/photos/1/Products/donust purple huze.jpg', 'active', '2025-06-23 04:50:15', '2025-06-23 04:50:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `description`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Dious Donuts is a donut shop dedicated to delivering sweet flavors and memorable culinary experiences through high-quality products. \r\n                            Founded by a passionate and experienced team of bakers, we believe that every bite of a donut should bring joy. \r\n                            With a variety of unique flavors and eye-catching designs, \r\n                            Dious Donuts offers more than just desserts — we create special moments to be shared with your loved ones. \r\n                            We use only the finest ingredients and carefully crafted recipes to ensure a soft texture and unforgettable taste. \r\n                            Dious Donuts — where sweet moments begin!', '/storage/photos/1/oke.png', '/storage/photos/1/oke.png', 'Kemanggisan, Jakarta Barat', '+621234567890', 'DiousDonuts@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Jakarta', 0.00, 'active', '2025-07-07 20:19:58', '2025-07-07 20:19:58'),
(6, 'Bogor', 30000.00, 'active', '2025-07-07 20:20:31', '2025-07-07 20:20:31'),
(7, 'Depok', 20000.00, 'active', '2025-07-07 20:21:08', '2025-07-07 20:21:08'),
(8, 'Tangerang', 20000.00, 'active', '2025-07-07 20:21:20', '2025-07-07 20:21:20'),
(9, 'Bekasi', 20000.00, 'active', '2025-07-07 20:21:38', '2025-07-07 20:21:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$OKk3GRA4cwg5y/J4r/0pcOJ0/cVH0fIVBOz308/DAHvSjFJVcdT4W', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$lHzrb5zRmR3aIiSEl/gs8OIIh9l4kF/uV7A7kjV8Gr6JJIWmgVIBu', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'karina', 'karina@gmail.com', NULL, '$2y$10$BN/g477gHWaF7nRBCrPmn.5u0cZFffYXEiQyXGQwSneZokuC6R4sC', NULL, 'user', NULL, NULL, 'active', NULL, '2025-06-26 01:37:37', '2025-06-26 01:37:37'),
(4, 'haechan', 'haechan@gmail.com', NULL, '$2y$10$NkOUZYC02cMHo7SRbg8N6uFbPz.Hxm.XL3ACqDbV3Hs7A1qzr9foS', NULL, 'user', NULL, NULL, 'active', NULL, '2025-06-26 02:52:55', '2025-06-26 02:52:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Indeks untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
