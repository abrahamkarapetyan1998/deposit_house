 -- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2022 at 09:58 PM
-- Server version: 10.3.22-MariaDB-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoroyal_devgenius_depoitzq_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`, `shop_address`) VALUES
(1, 'Marjan', 'admin@gmail.com', '077530056', 0, '1640796815Untitled-1.jpg', '$2y$10$u.93l4y6wOz6vq3BlAxvU.LuJ16/uBQ9s2yesRGTWUtLRiQSwoH1C', 1, 'eRo7iV0U4Ma4cLdvSLBdL9dWSAG6WthwppV7B7XeoPKvWU8eIEzw2bs78hNs', '2018-02-28 23:27:08', '2022-02-21 01:48:28', 'Deposit House Market', NULL),
(11, 'Ana Marija', 'deposithouse99@gmail.com', '077574440', 19, '1646475030icon-doctor-blue-530x530.png', '$2y$10$U7CTGsiS5hfJ6wlZcbaAVuFyAtMi2/6cvkqwNzJTm8pCvtkYsCz.W', 1, NULL, '2022-02-27 20:11:35', '2022-03-05 18:10:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0),
(2, 0, 'RTL English', '1584887310NzfWDhO8.json', '1584887310NzfWDhO8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(20, 4, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-24 00:41:46', '2019-10-03 00:18:54'),
(21, 4, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2019-09-24 00:44:13', '2019-10-03 00:19:13'),
(22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-24 00:45:45', '2019-09-24 00:45:45'),
(24, 1, 'App\\Models\\Childcategory', 'Display Size', 'display_size', 1, 1, '2019-09-24 00:54:17', '2019-09-24 00:54:17'),
(25, 12, 'App\\Models\\Subcategory', 'demo', 'demo', 1, 1, '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(31, 8, 'App\\Models\\Childcategory', 'Temperature', 'temperature', 1, 1, '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(33, 4, 'App\\Models\\Category', 'RAM', 'ram', 1, 1, '2019-10-12 03:22:03', '2019-10-12 23:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(107, 14, 'No Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(108, 14, 'Local seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(109, 14, 'Non local warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(110, 14, 'International Manufacturer Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(111, 14, 'International Seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(157, 22, 'Black', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(158, 22, 'White', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(159, 22, 'Sliver', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(160, 22, 'Red', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(161, 22, 'Dark Grey', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(162, 22, 'Dark Blue', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(163, 22, 'Brown', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(172, 24, '40', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(173, 24, '22', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(174, 24, '24', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(175, 24, '32', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(176, 24, '21', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(177, 25, 'demo 1', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(178, 25, 'demo 2', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(187, 30, 'Yellow', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(188, 30, 'White', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(189, 31, '22', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(190, 31, '34', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(191, 31, '45', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(195, 20, 'Local seller warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(196, 20, 'No warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(197, 20, 'international manufacturer warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(198, 20, 'Non-local warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(199, 21, 'Symphony', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(200, 21, 'Oppo', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(201, 21, 'EStore', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(202, 21, 'Infinix', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(203, 21, 'Apple', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(243, 33, '1 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(244, 33, '2 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(245, 33, '3 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`, `language_id`) VALUES
(1, '1646392801English_728X90.png', 'https://deposithousemarket.com/category/fashion-and-Beauty/shoes', 'TopSmall', 1),
(2, '1646393277English_Besplatno.png', 'https://deposithousemarket.com/category/smart-phone-and-table', 'TopSmall', 1),
(3, '16463290541641000180Shop_girl_green_right-miin77.jpg', 'https://www.google.com/', 'Large', 3),
(4, '16409078981564398600side-triple3-min.jpg', 'https://www.google.com/', 'BottomSmall', 1),
(5, '16409079771564398579side-triple2-min.jpg', 'https://www.google.com/', 'BottomSmall', 1),
(6, '16409047641564298464side-triple1.jpg', 'https://www.google.com/', 'BottomSmall', 1),
(7, '164632914416409047641564298464side-triple1.jpg', 'facebook.com', 'BottomSmall', 3),
(8, '164632915116409078981564398600side-triple3-min.jpg', 'facebook.com', 'BottomSmall', 3),
(9, '16441377981568889164bottom1.jpg', NULL, 'Large', 1),
(10, '16441377921568889164bottom1.jpg', NULL, 'Large', 13),
(11, '16460516401644920463Prodavaj.png', 'https://dev.geniusocean.net/depoitzq/vendor/login', 'TopSmall', 3),
(12, '16460516541644919769Besplatno.png', 'https://dev.geniusocean.net/depoitzq/vendor/login', 'TopSmall', 3),
(13, '164632916416409079771564398579side-triple2-min.jpg', 'https://dev.geniusocean.net/depoitzq/category/fashion-and-Beauty', 'BottomSmall', 3);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `language_id`, `created_at`) VALUES
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'http://deposithouse.com/', 17, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'http://deposithouse.com/', 21, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'http://deposithouse.com/', 67, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'http://deposithouse.com/', 190, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'http://deposithouse.com/', 25, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'http://deposithouse.com/', 52, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'http://deposithouse.com/', 90, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'http://deposithouse.com/', 19, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'http://deposithouse.com/', 49, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 1, '2019-01-03 06:03:37'),
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'http://deposithouse.com/', 86, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', 3, '2019-01-03 06:03:59'),
(27, 3, 'test', 'test', '16437896151565150264banner3.jpg', 'test', 3, 1, NULL, NULL, 'a,b,c,d', 3, '2022-02-02 02:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `language`) VALUES
(2, 'Oil & gas', 'oil-and-gas', '{\"3\":\"\\u041d\\u0430\\u0444\\u0442\\u0430 \\u0438 \\u0433\\u0430\\u0441\"}'),
(3, 'Manufacturing', 'manufacturing', '{\"3\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e\"}'),
(4, 'Chemical Research', 'chemical_research', '{\"3\":\"\\u0425\\u0435\\u043c\\u0438\\u0441\\u043a\\u043e \\u0438\\u0441\\u0442\\u0440\\u0430\\u0436\\u0443\\u0432\\u0430\\u045a\\u0435\"}'),
(5, 'Agriculture', 'agriculture', '{\"3\":\"\\u0417\\u0435\\u043c\\u0458\\u043e\\u0434\\u0435\\u043b\\u0441\\u0442\\u0432\\u043e\"}'),
(6, 'Mechanical', 'mechanical', '{\"3\":\"\\u041c\\u0435\\u0445\\u0430\\u043d\\u0438\\u0447\\u043a\\u0438\"}'),
(7, 'Entrepreneurs', 'entrepreneurs', '{\"3\":\"\\u043f\\u0440\\u0435\\u0442\\u043f\\u0440\\u0438\\u0435\\u043c\\u0430\\u0447\\u0438\"}'),
(8, 'Technology', 'technology', '{\"3\":\"\\u0422\\u0435\\u0445\\u043d\\u043e\\u043b\\u043e\\u0433\\u0438\\u0458\\u0430\"}');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `language`, `slug`, `status`, `photo`, `is_featured`, `image`, `serial`) VALUES
(4, 'Electronics', '{\"3\":\"\\u0415\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u0438\\u043a\\u0430\"}', 'electronics', 1, '1557807287light.png', 1, '1568709131f6.jpg', 4),
(5, 'Cosmetics', '{\"3\":\"\\u041a\\u043e\\u0437\\u043c\\u0435\\u0442\\u0438\\u043a\\u0430\"}', 'cosmetics', 1, '1557807279fashion.png', 1, '1640889894fashionandbeaty.jpg', 8),
(7, 'Phones and Accessories', '{\"3\":\"\\u041c\\u043e\\u0431\\u0438\\u043b\\u043d\\u0438 \\u0438 \\u0414\\u043e\\u0434\\u0430\\u0442\\u043e\\u0446\\u0438\"}', 'phones-and-accessories', 1, '1557377810mobile.png', 1, '1568709597f4.jpg', 6),
(8, 'Sports equipment', '{\"3\":\"\\u0421\\u043f\\u043e\\u0440\\u0442\\u0441\\u043a\\u0430 \\u041e\\u043f\\u0440\\u0435\\u043c\\u0430\"}', 'sports-equipment', 1, '1557807258sports.png', 1, '1640890551sport.jpg', 11),
(9, 'Jewellery and Accessories', '{\"3\":\"\\u041d\\u0430\\u043a\\u0438\\u0442 \\u0438 \\u0414\\u043e\\u0434\\u0430\\u0442\\u043e\\u0446\\u0438\"}', 'jewellery-and-accessories', 1, '1557807252furniture.png', 1, '1568709077f7.jpg', 9),
(10, 'Food', '{\"3\":\"\\u0425\\u0440\\u0430\\u043d\\u0430\"}', 'food', 1, '1557807228trends.png', 1, '1640890063beauty.jpg', 15),
(11, 'Office', '{\"3\":\"\\u041a\\u0430\\u043d\\u0446\\u0435\\u043b\\u0430\\u0440\\u0438\\u0458\\u0430\"}', 'office', 1, '1557377917bags.png', 1, '1640890384office.jpg', 12),
(12, 'Kids Toys', '{\"3\":\"\\u0414\\u0435\\u0442\\u0441\\u043a\\u0438 \\u0418\\u0433\\u0440\\u0430\\u0447\\u043a\\u0438\"}', 'kids-toys', 1, '1557807214sports.png', 1, '1640888910Toys.jpg', 10),
(13, 'Books', '{\"3\":\"\\u041a\\u043d\\u0438\\u0433\\u0438\"}', 'books', 1, '1557807208bags.png', 1, '1640888964books.jpg', 13),
(15, 'Auto-Moto Accessories', '{\"3\":\"\\u0410\\u0432\\u0442\\u043e-\\u041c\\u043e\\u0442\\u043e \\u041e\\u043f\\u0440\\u0435\\u043c\\u0430\"}', 'auto', 1, '1568708648motor.car.png', 1, '1640889113cars.jpg', 17),
(16, 'Home and Garden', '{\"3\":\"\\u0414\\u043e\\u043c \\u0438 \\u0413\\u0440\\u0430\\u0434\\u0438\\u043d\\u0430\"}', 'home-and-garden', 1, '1568708757home.png', 1, '1640890198homedecorations.jpg', 16),
(17, 'Computers', '{\"3\":\"\\u041a\\u043e\\u043c\\u043f\\u0458\\u0443\\u0442\\u0435\\u0440\\u0438\"}', 'computers', 1, '16409125721557807287light.png', 0, NULL, 7),
(23, 'Women Clothes', '{\"3\":\"\\u0416\\u0435\\u043d\\u0441\\u043a\\u0430 \\u041e\\u0431\\u043b\\u0435\\u043a\\u0430\"}', 'women-clothes', 1, '16464008281557807287light.png', 0, NULL, 0),
(24, 'Man Clothes', '{\"3\":\"\\u041c\\u0430\\u0448\\u043a\\u0430 \\u041e\\u0431\\u043b\\u0435\\u043a\\u0430\"}', 'man-clothes', 1, '16464008491557807287light.png', 0, NULL, 1),
(25, 'Kids And Baby Clothes', '{\"3\":\"\\u0414\\u0435\\u0442\\u0441\\u043a\\u0430 \\u0438 \\u0411\\u0435\\u0431\\u0435\\u0448\\u043a\\u0430 \\u041e\\u0431\\u043b\\u0435\\u043a\\u0430\"}', 'kids-clothes', 1, '16464010681557807287light.png', 0, NULL, 2),
(26, 'Hardware Tools', '{\"3\":\"\\u0410\\u043b\\u0430\\u0442\"}', 'hardware-tools', 1, '16464016191557807287light.png', 0, NULL, 5),
(27, 'Pets', '{\"3\":\"\\u041c\\u0438\\u043b\\u0435\\u043d\\u0438\\u0447\\u0438\\u045a\\u0430\"}', 'pets', 1, '16464030871557807287light.png', 0, NULL, 3),
(28, 'Art and Design', '{\"3\":\"\\u0423\\u043c\\u0435\\u0442\\u043d\\u043e\\u0441\\u0442 \\u0438 \\u0414\\u0438\\u0437\\u0430\\u0458\\u043d\"}', 'art-and-design', 1, '16464038601557807287light.png', 0, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`, `language`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 1, NULL),
(2, 2, 'LED TV', 'led-tv', 1, NULL),
(3, 2, 'Curved TV', 'curved-tv', 1, NULL),
(4, 2, 'Plasma TV', 'plasma-tv', 1, NULL),
(5, 3, 'Top Freezer', 'top-freezer', 1, '{\"3\":\"\\u0413\\u043e\\u0440\\u0435\\u043d \\u0437\\u0430\\u043c\\u0440\\u0437\\u043d\\u0443\\u0432\\u0430\\u0447\",\"4\":\"\\u09b6\\u09c0\\u09b0\\u09cd\\u09b7 \\u09ab\\u09cd\\u09b0\\u09bf\\u099c\\u09be\\u09b0\"}'),
(6, 3, 'Side-by-Side', 'side-by-side', 1, '{\"3\":\"\\u0415\\u0434\\u0435\\u043d \\u0434\\u043e \\u0434\\u0440\\u0443\\u0433\",\"4\":\"\\u09aa\\u09be\\u09b6\\u09be\\u09aa\\u09be\\u09b6\\u09bf\"}'),
(7, 3, 'Counter-Depth', 'counter-depth', 1, NULL),
(8, 3, 'Mini Fridge', 'mini-fridge', 1, NULL),
(9, 4, 'Front Loading', 'front-loading', 1, NULL),
(10, 4, 'Top Loading', 'top-loading', 1, NULL),
(11, 4, 'Washer Dryer Combo', 'washer-dryer-combo', 1, NULL),
(12, 4, 'Laundry Center', 'laundry-center', 1, NULL),
(13, 5, 'Central Air', 'central-air', 1, NULL),
(14, 5, 'Window Air', 'window-air', 1, NULL),
(15, 5, 'Portable Air', 'portable-air', 1, NULL),
(16, 5, 'Hybrid Air', 'hybrid-air', 1, NULL),
(17, 19, 'Blouses', 'blouses', 1, '{\"3\":\"\\u0411\\u043b\\u0443\\u0437\\u0438\"}'),
(18, 19, 'T-Shirts', 'tshirts', 1, '{\"3\":\"\\u041c\\u0430\\u0438\\u0446\\u0438\"}'),
(19, 19, 'Jackets', 'jacekts', 1, '{\"3\":\"\\u0408\\u0430\\u043a\\u043d\\u0438\"}'),
(20, 19, 'Blazers', 'blazers', 1, '{\"3\":\"\\u0421\\u0430\\u043a\\u043e\\u0430\"}'),
(21, 19, 'Shirts', 'Shirts', 1, '{\"3\":\"\\u041a\\u043e\\u0448\\u0443\\u043b\\u0438\"}'),
(22, 20, 'Jeans', 'jeans', 1, '{\"3\":\"\\u0424\\u0430\\u0440\\u043c\\u0435\\u0440\\u043a\\u0438\"}'),
(23, 20, 'Pants', 'pants', 1, '{\"3\":\"\\u041f\\u0430\\u043d\\u0442\\u043e\\u043b\\u043e\\u043d\\u0438\"}'),
(24, 21, 'Pijamas', 'pijamas', 1, '{\"3\":\"\\u041f\\u0438\\u0436\\u0430\\u043c\\u0438\"}'),
(25, 21, 'Suits', 'suits', 1, '{\"3\":\"\\u041a\\u043e\\u0441\\u0442\\u0438\\u043c\\u0438\"}'),
(26, 20, 'Jogging Pants', 'jogging-pants', 1, '{\"3\":\"\\u0422\\u0440\\u0435\\u043d\\u0435\\u0440\\u043a\\u0438\"}'),
(27, 20, 'Skirts', 'skirts', 1, '{\"3\":\"\\u0421\\u0443\\u043a\\u045a\\u0438\"}'),
(29, 19, 'Sweaters', 'sweaters', 1, '{\"3\":\"\\u040f\\u0435\\u043c\\u043f\\u0435\\u0440\\u0438\"}'),
(30, 20, 'Shorts', 'shorts', 1, '{\"3\":\"\\u0411\\u0435\\u0440\\u043c\\u0443\\u0434\\u0438\"}'),
(31, 20, 'Socks', 'socks', 1, '{\"3\":\"\\u0427\\u043e\\u0440\\u0430\\u043f\\u0438\"}'),
(32, 22, 'Mini', 'mini', 1, '{\"3\":\"\\u041c\\u0438\\u043d\\u0438\"}'),
(33, 22, 'Maxi', 'maxi', 1, '{\"3\":\"\\u041c\\u0430\\u043a\\u0441\\u0438\"}'),
(34, 23, 'Blouses', 'manblouses', 1, '{\"3\":\"\\u0411\\u043b\\u0443\\u0437\\u0438\"}'),
(35, 23, 'T-Shirts', 'mant-shirts', 1, '{\"3\":\"\\u041c\\u0430\\u0438\\u0446\\u0438\"}'),
(36, 23, 'Jackets', 'manjackets', 1, '{\"3\":\"\\u0408\\u0430\\u043a\\u043d\\u0438\"}'),
(37, 23, 'Blazers', 'manblazers', 1, '{\"3\":\"\\u0421\\u0430\\u043a\\u043e\\u0430\"}'),
(38, 23, 'Shirts', 'manshirts', 1, '{\"3\":\"\\u041a\\u043e\\u0448\\u0443\\u043b\\u0438\"}'),
(39, 23, 'Sweaters', 'mansweaters', 1, '{\"3\":\"\\u040f\\u0435\\u043c\\u043f\\u0435\\u0440\\u0438\"}'),
(40, 24, 'Jeans', 'manjeans', 1, '{\"3\":\"\\u0424\\u0430\\u0440\\u043c\\u0435\\u0440\\u043a\\u0438\"}'),
(41, 24, 'Pants', 'manpants', 1, '{\"3\":\"\\u041f\\u0430\\u043d\\u0442\\u043e\\u043b\\u043e\\u043d\\u0438\"}'),
(42, 24, 'Jogging Pants', 'manjoggingpants', 1, '{\"3\":\"\\u0422\\u0440\\u0435\\u043d\\u0435\\u0440\\u043a\\u0438\"}'),
(43, 24, 'Shorts', 'manshorts', 1, '{\"3\":\"\\u0411\\u0435\\u0440\\u043c\\u0443\\u0434\\u0438\"}'),
(44, 24, 'Socks', 'mansocks', 1, '{\"3\":\"\\u0427\\u043e\\u0440\\u0430\\u043f\\u0438\"}'),
(45, 25, 'Suits', 'mansuits', 1, '{\"3\":\"\\u041a\\u043e\\u0441\\u0442\\u0438\\u043c\\u0438\"}'),
(46, 25, 'Pijamas', 'manpijamas', 1, '{\"3\":\"\\u041f\\u0438\\u0436\\u0430\\u043c\\u0438\"}'),
(47, 19, 'Hoodies', 'hoodies', 1, '{\"3\":\"\\u0414\\u0443\\u043a\\u0441\\u0435\\u0440\\u0438\"}'),
(48, 20, 'Underwear', 'underwear', 1, '{\"3\":\"\\u0418\\u043d\\u0442\\u0438\\u043c\\u043d\\u0430\"}'),
(49, 24, 'Underwear', 'manunderwear', 1, '{\"3\":\"\\u0418\\u043d\\u0442\\u0438\\u043c\\u043d\\u0430\"}');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `text`, `created_at`, `updated_at`) VALUES
(3, 35, 101, 'Hgfdd', '2021-12-07 17:39:12', '2021-12-07 17:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `subject`, `sent_user`, `recieved_user`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Проба тест', 31, 13, 'Ај да видиме', '2021-12-05 04:18:42', '2021-12-05 04:18:42'),
(2, 'prakam poraka na OBLEKA dukjan', 13, 31, 'Da vidime dali kje ja dobie vendorot ili pak korisnikot', '2021-12-30 22:53:38', '2021-12-30 22:53:38'),
(3, 'Probvam da pratam poraka do prodavnica', 33, 31, 'probvcam na Obleka od 553 i 553 treba da dobie email ili ne?', '2021-12-31 01:50:24', '2021-12-31 01:50:24'),
(4, 'Vtora proba za reply', 33, 13, 'Probvam dali kje stigni i dali kje mozam reply da napram', '2021-12-31 02:35:26', '2021-12-31 02:35:26'),
(5, 'Vtora proba', 33, 31, 'Uste ednas 553 do 2016', '2021-12-31 02:40:49', '2021-12-31 02:40:49'),
(6, '3ta proba', 33, 31, '553 go povikuva 2016 , reply ne treba da ravboti veli nevestata od namech', '2021-12-31 02:47:23', '2021-12-31 02:47:23'),
(7, 'Local proba', 33, 31, 'Local proba', '2021-12-31 03:01:34', '2021-12-31 03:01:34'),
(8, 'Remote', 33, 31, 'Remote', '2021-12-31 03:03:51', '2021-12-31 03:03:51'),
(9, 'Pak Remote prtoba', 33, 31, 'Ajde da vidime', '2021-12-31 03:11:23', '2021-12-31 03:11:23'),
(10, 'Proba Ime', 33, 31, 'Ajde', '2021-12-31 03:36:20', '2021-12-31 03:36:20'),
(11, 'Ime poubo', 33, 31, 'Koe', '2021-12-31 03:39:09', '2021-12-31 03:39:09'),
(12, 'Probvam dali stiga', 33, 31, 'Aj da vidime 553 do 2016', '2022-01-02 04:23:10', '2022-01-02 04:23:10'),
(13, 'Proba Local', 33, 31, 'Probvam ovaj ljokot smena na Local', '2022-01-02 04:35:29', '2022-01-02 04:35:29'),
(14, 'Proba na local', 33, 31, '553 do 2016', '2022-01-02 05:20:40', '2022-01-02 05:20:40'),
(15, 'Proba od mojo', 31, 31, 'dghrth', '2022-02-21 01:20:15', '2022-02-21 01:20:15'),
(16, 'poroba', 33, 31, '112345', '2022-02-21 23:39:33', '2022-02-21 23:39:33'),
(17, 'Проба од гениус', 81, 31, 'Test', '2022-02-25 03:54:45', '2022-02-25 03:54:45'),
(18, 'Проба од гениус', 82, 31, 'Проба за порака', '2022-02-25 22:42:53', '2022-02-25 22:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 1499, 0, NULL),
(4, 'browser', 'Linux', 318, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 975, 0, NULL),
(6, 'browser', 'Windows 7', 490, 0, NULL),
(7, 'referral', 'yandex.ru', 15, 0, NULL),
(8, 'browser', 'Windows 8.1', 539, 0, NULL),
(9, 'referral', 'www.google.com', 31, 0, NULL),
(10, 'browser', 'Android', 518, 0, NULL),
(11, 'browser', 'Mac OS X', 658, 0, NULL),
(12, 'referral', 'l.facebook.com', 2, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 17, 0, NULL),
(15, 'browser', 'Windows 8', 7, 0, NULL),
(16, 'browser', 'iPad', 41, 0, NULL),
(17, 'browser', 'Ubuntu', 18, 0, NULL),
(18, 'browser', 'iPhone', 39, 0, NULL),
(19, 'referral', 'baidu.com', 4, 0, NULL),
(20, 'referral', NULL, 43, 0, NULL),
(21, 'referral', 'deposithousemarket.com', 4, 0, NULL),
(22, 'browser', 'Windows Vista', 3, 0, NULL),
(23, 'referral', '162.0.209.70', 5, 0, NULL),
(24, 'referral', 'www.google.com.hk', 1, 0, NULL),
(25, 'referral', 'com.all-url.info', 1, 0, NULL),
(26, 'referral', 'business87.web-hosting.com', 1, 0, NULL),
(27, 'referral', 'm.facebook.com', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `status`) VALUES
(1, 'AF', 'Afghanistan', 0),
(2, 'AL', 'Albania', 0),
(3, 'DZ', 'Algeria', 0),
(4, 'DS', 'American Samoa', 0),
(5, 'AD', 'Andorra', 0),
(6, 'AO', 'Angola', 0),
(7, 'AI', 'Anguilla', 0),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua and Barbuda', 0),
(10, 'AR', 'Argentina', 0),
(11, 'AM', 'Armenia', 0),
(12, 'AW', 'Aruba', 0),
(13, 'AU', 'Australia', 0),
(14, 'AT', 'Austria', 0),
(15, 'AZ', 'Azerbaijan', 0),
(16, 'BS', 'Bahamas', 0),
(17, 'BH', 'Bahrain', 0),
(18, 'BD', 'Bangladesh', 0),
(19, 'BB', 'Barbados', 0),
(20, 'BY', 'Belarus', 0),
(21, 'BE', 'Belgium', 0),
(22, 'BZ', 'Belize', 0),
(23, 'BJ', 'Benin', 0),
(24, 'BM', 'Bermuda', 0),
(25, 'BT', 'Bhutan', 0),
(26, 'BO', 'Bolivia', 0),
(27, 'BA', 'Bosnia and Herzegovina', 0),
(28, 'BW', 'Botswana', 0),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 0),
(31, 'IO', 'British Indian Ocean Territory', 0),
(32, 'BN', 'Brunei Darussalam', 0),
(33, 'BG', 'Bulgaria', 0),
(34, 'BF', 'Burkina Faso', 0),
(35, 'BI', 'Burundi', 0),
(36, 'KH', 'Cambodia', 0),
(37, 'CM', 'Cameroon', 0),
(38, 'CA', 'Canada', 0),
(39, 'CV', 'Cape Verde', 0),
(40, 'KY', 'Cayman Islands', 0),
(41, 'CF', 'Central African Republic', 0),
(42, 'TD', 'Chad', 0),
(43, 'CL', 'Chile', 0),
(44, 'CN', 'China', 0),
(45, 'CX', 'Christmas Island', 0),
(46, 'CC', 'Cocos (Keeling) Islands', 0),
(47, 'CO', 'Colombia', 0),
(48, 'KM', 'Comoros', 0),
(49, 'CD', 'Democratic Republic of the Congo', 0),
(50, 'CG', 'Republic of Congo', 0),
(51, 'CK', 'Cook Islands', 0),
(52, 'CR', 'Costa Rica', 0),
(53, 'HR', 'Croatia (Hrvatska)', 0),
(54, 'CU', 'Cuba', 0),
(55, 'CY', 'Cyprus', 0),
(56, 'CZ', 'Czech Republic', 0),
(57, 'DK', 'Denmark', 0),
(58, 'DJ', 'Djibouti', 0),
(59, 'DM', 'Dominica', 0),
(60, 'DO', 'Dominican Republic', 0),
(61, 'TP', 'East Timor', 0),
(62, 'EC', 'Ecuador', 0),
(63, 'EG', 'Egypt', 0),
(64, 'SV', 'El Salvador', 0),
(65, 'GQ', 'Equatorial Guinea', 0),
(66, 'ER', 'Eritrea', 0),
(67, 'EE', 'Estonia', 0),
(68, 'ET', 'Ethiopia', 0),
(69, 'FK', 'Falkland Islands (Malvinas)', 0),
(70, 'FO', 'Faroe Islands', 0),
(71, 'FJ', 'Fiji', 0),
(72, 'FI', 'Finland', 0),
(73, 'FR', 'France', 0),
(74, 'FX', 'France, Metropolitan', 0),
(75, 'GF', 'French Guiana', 0),
(76, 'PF', 'French Polynesia', 0),
(77, 'TF', 'French Southern Territories', 0),
(78, 'GA', 'Gabon', 0),
(79, 'GM', 'Gambia', 0),
(80, 'GE', 'Georgia', 0),
(81, 'DE', 'Germany', 0),
(82, 'GH', 'Ghana', 0),
(83, 'GI', 'Gibraltar', 0),
(84, 'GK', 'Guernsey', 0),
(85, 'GR', 'Greece', 0),
(86, 'GL', 'Greenland', 0),
(87, 'GD', 'Grenada', 0),
(88, 'GP', 'Guadeloupe', 0),
(89, 'GU', 'Guam', 0),
(90, 'GT', 'Guatemala', 0),
(91, 'GN', 'Guinea', 0),
(92, 'GW', 'Guinea-Bissau', 0),
(93, 'GY', 'Guyana', 0),
(94, 'HT', 'Haiti', 0),
(95, 'HM', 'Heard and Mc Donald Islands', 0),
(96, 'HN', 'Honduras', 0),
(97, 'HK', 'Hong Kong', 0),
(98, 'HU', 'Hungary', 0),
(99, 'IS', 'Iceland', 0),
(100, 'IN', 'India', 0),
(101, 'IM', 'Isle of Man', 0),
(102, 'ID', 'Indonesia', 0),
(103, 'IR', 'Iran (Islamic Republic of)', 0),
(104, 'IQ', 'Iraq', 0),
(105, 'IE', 'Ireland', 0),
(106, 'IL', 'Israel', 0),
(107, 'IT', 'Italy', 0),
(108, 'CI', 'Ivory Coast', 0),
(109, 'JE', 'Jersey', 0),
(110, 'JM', 'Jamaica', 0),
(111, 'JP', 'Japan', 0),
(112, 'JO', 'Jordan', 0),
(113, 'KZ', 'Kazakhstan', 0),
(114, 'KE', 'Kenya', 0),
(115, 'KI', 'Kiribati', 0),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 0),
(117, 'KR', 'Korea, Republic of', 0),
(118, 'XK', 'Kosovo', 0),
(119, 'KW', 'Kuwait', 0),
(120, 'KG', 'Kyrgyzstan', 0),
(121, 'LA', 'Lao People\'s Democratic Republic', 0),
(122, 'LV', 'Latvia', 0),
(123, 'LB', 'Lebanon', 0),
(124, 'LS', 'Lesotho', 0),
(125, 'LR', 'Liberia', 0),
(126, 'LY', 'Libyan Arab Jamahiriya', 0),
(127, 'LI', 'Liechtenstein', 0),
(128, 'LT', 'Lithuania', 0),
(129, 'LU', 'Luxembourg', 0),
(130, 'MO', 'Macau', 0),
(131, 'MK', 'North Macedonia', 1),
(132, 'MG', 'Madagascar', 0),
(133, 'MW', 'Malawi', 0),
(134, 'MY', 'Malaysia', 0),
(135, 'MV', 'Maldives', 0),
(136, 'ML', 'Mali', 0),
(137, 'MT', 'Malta', 0),
(138, 'MH', 'Marshall Islands', 0),
(139, 'MQ', 'Martinique', 0),
(140, 'MR', 'Mauritania', 0),
(141, 'MU', 'Mauritius', 0),
(142, 'TY', 'Mayotte', 0),
(143, 'MX', 'Mexico', 0),
(144, 'FM', 'Micronesia, Federated States of', 0),
(145, 'MD', 'Moldova, Republic of', 0),
(146, 'MC', 'Monaco', 0),
(147, 'MN', 'Mongolia', 0),
(148, 'ME', 'Montenegro', 0),
(149, 'MS', 'Montserrat', 0),
(150, 'MA', 'Morocco', 0),
(151, 'MZ', 'Mozambique', 0),
(152, 'MM', 'Myanmar', 0),
(153, 'NA', 'Namibia', 0),
(154, 'NR', 'Nauru', 0),
(155, 'NP', 'Nepal', 0),
(156, 'NL', 'Netherlands', 0),
(157, 'AN', 'Netherlands Antilles', 0),
(158, 'NC', 'New Caledonia', 0),
(159, 'NZ', 'New Zealand', 0),
(160, 'NI', 'Nicaragua', 0),
(161, 'NE', 'Niger', 0),
(162, 'NG', 'Nigeria', 0),
(163, 'NU', 'Niue', 0),
(164, 'NF', 'Norfolk Island', 0),
(165, 'MP', 'Northern Mariana Islands', 0),
(166, 'NO', 'Norway', 0),
(167, 'OM', 'Oman', 0),
(168, 'PK', 'Pakistan', 0),
(169, 'PW', 'Palau', 0),
(170, 'PS', 'Palestine', 0),
(171, 'PA', 'Panama', 0),
(172, 'PG', 'Papua New Guinea', 0),
(173, 'PY', 'Paraguay', 0),
(174, 'PE', 'Peru', 0),
(175, 'PH', 'Philippines', 0),
(176, 'PN', 'Pitcairn', 0),
(177, 'PL', 'Poland', 0),
(178, 'PT', 'Portugal', 0),
(179, 'PR', 'Puerto Rico', 0),
(180, 'QA', 'Qatar', 0),
(181, 'RE', 'Reunion', 0),
(182, 'RO', 'Romania', 0),
(183, 'RU', 'Russian Federation', 0),
(184, 'RW', 'Rwanda', 0),
(185, 'KN', 'Saint Kitts and Nevis', 0),
(186, 'LC', 'Saint Lucia', 0),
(187, 'VC', 'Saint Vincent and the Grenadines', 0),
(188, 'WS', 'Samoa', 0),
(189, 'SM', 'San Marino', 0),
(190, 'ST', 'Sao Tome and Principe', 0),
(191, 'SA', 'Saudi Arabia', 0),
(192, 'SN', 'Senegal', 0),
(193, 'RS', 'Serbia', 0),
(194, 'SC', 'Seychelles', 0),
(195, 'SL', 'Sierra Leone', 0),
(196, 'SG', 'Singapore', 0),
(197, 'SK', 'Slovakia', 0),
(198, 'SI', 'Slovenia', 0),
(199, 'SB', 'Solomon Islands', 0),
(200, 'SO', 'Somalia', 0),
(201, 'ZA', 'South Africa', 0),
(202, 'GS', 'South Georgia South Sandwich Islands', 0),
(203, 'SS', 'South Sudan', 0),
(204, 'ES', 'Spain', 0),
(205, 'LK', 'Sri Lanka', 0),
(206, 'SH', 'St. Helena', 0),
(207, 'PM', 'St. Pierre and Miquelon', 0),
(208, 'SD', 'Sudan', 0),
(209, 'SR', 'Suriname', 0),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 0),
(211, 'SZ', 'Swaziland', 0),
(212, 'SE', 'Sweden', 0),
(213, 'CH', 'Switzerland', 0),
(214, 'SY', 'Syrian Arab Republic', 0),
(215, 'TW', 'Taiwan', 0),
(216, 'TJ', 'Tajikistan', 0),
(217, 'TZ', 'Tanzania, United Republic of', 0),
(218, 'TH', 'Thailand', 0),
(219, 'TG', 'Togo', 0),
(220, 'TK', 'Tokelau', 0),
(221, 'TO', 'Tonga', 0),
(222, 'TT', 'Trinidad and Tobago', 0),
(223, 'TN', 'Tunisia', 0),
(224, 'TR', 'Turkey', 0),
(225, 'TM', 'Turkmenistan', 0),
(226, 'TC', 'Turks and Caicos Islands', 0),
(227, 'TV', 'Tuvalu', 0),
(228, 'UG', 'Uganda', 0),
(229, 'UA', 'Ukraine', 0),
(230, 'AE', 'United Arab Emirates', 0),
(231, 'GB', 'United Kingdom', 0),
(232, 'US', 'United States', 0),
(233, 'UM', 'United States minor outlying islands', 0),
(234, 'UY', 'Uruguay', 0),
(235, 'UZ', 'Uzbekistan', 0),
(236, 'VU', 'Vanuatu', 0),
(237, 'VA', 'Vatican City State', 0),
(238, 'VE', 'Venezuela', 0),
(239, 'VN', 'Vietnam', 0),
(240, 'VG', 'Virgin Islands (British)', 0),
(241, 'VI', 'Virgin Islands (U.S.)', 0),
(242, 'WF', 'Wallis and Futuna Islands', 0),
(243, 'EH', 'Western Sahara', 0),
(244, 'YE', 'Yemen', 0),
(245, 'ZM', 'Zambia', 0),
(246, 'ZW', 'Zimbabwe', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20'),
(6, 'rererere', 1, 9, '664', 2, 1, '2019-05-23', '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'MKD', 'MKD', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`, `language_id`) VALUES
(1, 'new_order', 'Вашата нарачка е примена!', 'Здраво {customer_name},&nbsp;<div>Вашата нарачка {order_number} е примена.</div>', 1, 3),
(2, 'new_registration', 'Добредојдовте во Deposit House', '<p>Добредојдовте {customer_name},<br>Успешно се регистриравте {website_title}, ве молиме кликнете на линкот за верификација.&nbsp;<br></p> {verification_link}', 1, 3),
(3, 'vendor_accept', 'Vendor Account Activated', '<p>Hello {customer_name},<br>You successfully activated your account. Please Login to your account and build your own shop without any charges.</p><p>Thank You.<br></p>', 1, 1),
(5, 'vendor_verification', 'Verification', '<p>Hello {customer_name},</p><p>Please verify your account. Please send us a picture of your Passport/ ID / Driving license.</p><p>Thank you!</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br><br></p><p><br></p><p><br></p>', 1, 1),
(6, 'vendor_order', 'Нова нарачка', '<p>Здраво {vendor_name},<br>Вашата продавница има нова нарачка со број {order_number}. Ве молиме спремете ја вашата нарчка и нашиот транспортер ќе ја подигне од вашата адреса.</p>', 1, 3),
(7, 'vendor_order', 'New order', '<p>Hello {vendor_name},<br>Your Vendor account has a new order {order_number}. Please pack your order and wait for our shipper to pick the order up.</p>', 1, 1),
(8, 'new_order', 'Вашата нарачка е примена!', '<p>Здраво {customer_name},<br>Вашата нарачка {order_number} е примена.<br><br></p>', 1, 3),
(9, 'new_registration', 'Welcome To Deposit House', '<p>Welcome {customer_name},<br>You have successfully registered to {website_title}. Please click on the link below for verification.<br></p><p>{verification_link}<br></p>', 1, 1),
(10, 'ship_order', 'DHM Нарачка', '<p>Примена е нарачка на Deposit House Market со број {order_number} за кој е потребен транспорт, во атачмент се деталите за нарачката.</p><p><br></p><p><br></p>', 1, 1),
(11, 'vendor_withdraw', 'Withdraw Requested', '<p>Hello {vendor_name},<br>Your withdraw request {amount} {currency} is submitted successfully. If you didn\'t requested this withdraw, please contact us.<br></p><p><br></p>', 1, 1),
(12, 'vendor_accept', 'Продавницата е активна', 'Здраво {customer_name},<div>Вашата продавница е активирана. Најавете се на вашиот профил и изградете своја продавница бесплатно.</div><div>Ви благодариме.<br><div><div><br></div></div></div>', 1, 3),
(13, 'ship_order', 'DHM Нарачка', '<p>Примена е нарачка на Deposit House Market со број {order_number} за кој е потребен транспорт, во атачмент се деталите за нарачката.</p>', 1, 3),
(14, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your order {order_number} has been placed successfully.&nbsp;<br><br></p>', 1, 1),
(15, 'vendor_withdraw', 'Повлекување', '<p>Здраво {vendor_name},<br>Поднесено е барање за повлекување на {amount} {currency} на вашата Deposit House Market продавница.&nbsp;<br>Доколку вие не го поднесовте ова барење ве молиме да не контактирате.</p>', 1, 1),
(16, 'subscription_warning', 'Subscription warning', 'Hello,&nbsp;<div>Your subscription is ending in 5 days, please login and renew your free subscription.&nbsp;&nbsp;<br><div><br></div><div><br></div></div>', 1, 1),
(17, 'subscription_warning', 'Обновување на претплата', 'Здраво,<div>Вашата претплата истекува за 5 дена. Ве молиме најавете се и обновете ја вашата претплата бесплатно.</div>', 1, 3),
(18, 'withdraw_accept', 'Успешно повлекување', '<div>Здраво,</div><div>Барањето за повлекување на средства во износ од {order_amount} е успешно.&nbsp;</div>', 1, 3),
(19, 'withdraw_reject', 'Повлекувањето е одбиено', 'Здраво,<div>Барањето за повлекување на средства во износ од {order_amount} е одбиено.</div>', 1, 3),
(20, 'withdraw_reject', 'Withdraw Reject', 'Hello,<div>Unfortunately, the withdraw that you requested in amount of {order_amount} has been rejected.</div>', 1, 1),
(21, 'withdraw_accept', 'Withdraw Accept', 'Hello,<div>Withdraw request in amount of {order_amount} has been successful.&nbsp;</div>', 1, 1),
(22, 'vendor_verification', 'Верификација', '<p>Здраво {customer_name},</p><p>Потребна е верификација на вашиот профил. Ве молиме испрате слика од вашиот пасош/ лична карта/ возачка дозвола.</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br><br></p><p><br></p><p><br></p>', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`, `language_id`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1, 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1, 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0, 1),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0, 1),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0, 3),
(10, 'Proba', 'Proba test&nbsp;', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_stock` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wish_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compare_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_change` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_found` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT 0,
  `paypal_business` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_merchant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_industry` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `molly_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_langauge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpay_check` tinyint(4) NOT NULL DEFAULT 1,
  `merchant_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpay_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpay_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_language` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_langauge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_trams` tinyint(4) NOT NULL DEFAULT 1,
  `trams_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sms_verification` tinyint(4) NOT NULL DEFAULT 0,
  `is_sms` tinyint(4) NOT NULL DEFAULT 0,
  `sms_server` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_business`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`, `language`, `popup_langauge`, `cpay_check`, `merchant_key`, `merchant_name`, `cpay_password`, `cpay_text`, `footer_language`, `contact_langauge`, `is_trams`, `trams_link`, `invoice_footer_text`, `is_sms_verification`, `is_sms`, `sms_server`, `sms_api_key`) VALUES
(1, '1641002179deposit_house_market_logo_small_50-min.png', '1638358623favicon.png', 'Deposit House Market', 'smtp', '0123 456789', 'Footer Tex', 'DSFAFASDF', '#6bc12f', '1564224328loading3.gif', '1564224329loading3.gif', 0, '<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/61a2ed6b53b398095a66675d/1fli6urqe\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>\r\n<!--End of Tawk.to Script-->', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 1, 0, 1, 'pk_test_51KAIPGCWYHUPF7yEM7Awgzl2AIdiZh969lEJ8oqx0T8gg11fgObcP14LadcDI6ORQnvOc0fpI6OWdeU2jItGX6sv0024aVmFow', 'sk_test_51KAIPGCWYHUPF7yEXhjVWvGfgpMjuWgeVIMupriumRJGadGdlivrnAhQQQkpBooJ3OIqJKFIqvAc1rLWqIE6KEcg00yHjLzamQ', 1, 10, 5, 0, 5, 'mail.dev.geniusocean.net', '465', 'test@dev.geniusocean.net', 'QQ-cwi{%;F2~', 'test@dev.geniusocean.net', 'DEPOSIT HOUSE MARKET', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 0, 0, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 30, 7.8, 1, 1, 1, 1, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#383838', '#383838', 1, '#ff5500', '#02020c', 1, 1, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 1, 0, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 1, '1566878455404.png', 1, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '16409109911584934329adv-banner-min.jpg', '1641002231deposit_house_market_logo.png', '16463319674PE-nlL_PdMD5PrFNLnjurHQ1QKPnCvg368LTDnfM-M.png', '#81c753', 0, 1, 0, 'shaon143-facilitator-1@gmail.com', '1641002219deposit_house_market_logo_small_50-min.png', 'ssl', 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 0, 'Pay via your Paytm account.', 'sandbox', 0, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 0, 'rzp_test_xDH74d48cwl8DF', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 1, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', '{\"1\":\"Deposit House Market\",\"3\":\"Deposit House Markettt\",\"11\":\"Deposit House Marketttt\",\"12\":\"Deposit House Marketttt\"}', '{\"1\":{\"popup_title\":\"test e\",\"popup_text\":\"test e\"},\"3\":{\"popup_title\":\"test ee\",\"popup_text\":\"TEST\"}}', 1, '1000001834', 'DEPOZIT HAUS DOO', 'TEST_PASS', 'Pay via your Cpay account.', '{\"1\":{\"footer\":\"test\",\"copyright\":\"test\"},\"3\":{\"footer\":\"test  ttt\",\"copyright\":\"testttt\"}}', '{\"1\":{\"contact_title\":\"<h4 class=\\\"subtitle\\\" style=\\\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\\\">\\u041a\\u041e\\u041d\\u0422\\u0410\\u041a\\u0422\\u0418\\u0420\\u0410\\u0408\\u0422\\u0415 \\u041d\\u0415<\\/h4><h4 class=\\\"subtitle\\\" style=\\\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\\\">\\u0412\\u041e \\u0421\\u0415\\u041a\\u041e\\u0415 \\u0412\\u0420\\u0415\\u041c\\u0415! (Englisht)<\\/h4>\",\"contact_text\":\"<span style=\\\"color: rgb(119, 119, 119); font-size: 16px;\\\">\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0438\\u0440\\u0430\\u0458\\u0442\\u0435 \\u043d\\u0435 \\u0432\\u043e \\u0431\\u0438\\u043b\\u043e \\u043a\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u0435 \\u045c\\u0435 \\u0432\\u0438 \\u043e\\u0434\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043c\\u0435 \\u0432\\u043e \\u043d\\u0430\\u0458\\u0431\\u0440\\u0437 \\u043c\\u043e\\u0436\\u0435\\u043d \\u0440\\u043e\\u043a!&nbsp;<\\/span><h4 class=\\\"subtitle\\\" style=\\\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\\\">(ENGLISHT)<\\/h4>\",\"contact_success\":\"\\u0423\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e! \\r\\n\\u0411\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u0438\\u043c\\u0435, \\r\\n\\u040c\\u0435 \\u0432\\u0438 \\u0432\\u0440\\u0430\\u0442\\u0438\\u043c\\u0435 \\u0432\\u043e \\u043d\\u0430\\u0458\\u0431\\u0440\\u0437 \\u043c\\u043e\\u0436\\u0435\\u043d \\u0440\\u043e\\u043a  (ENGLISHT)\",\"street\":\"\\u0423\\u043b. \\u0411\\u0443\\u043b\\u0435\\u0432\\u0430\\u0440 1 \\u043c\\u0430\\u0458 \\u0431\\u0440 152 \\u0411\\u0438\\u0442\\u043e\\u043b\\u0430 \\u0420\\u0435\\u043f\\u0443\\u0431\\u043b\\u0438\\u043a\\u0430 \\u041c\\u0430\\u043a\\u0435\\u0434\\u043e\\u043d\\u0438\\u0458\\u0430  (ENGLISHT)\"},\"3\":{\"contact_title\":\"<h4 class=\\\"subtitle\\\" style=\\\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\\\">\\u041a\\u041e\\u041d\\u0422\\u0410\\u041a\\u0422\\u0418\\u0420\\u0410\\u0408\\u0422\\u0415 \\u041d\\u0415<\\/h4><h4 class=\\\"subtitle\\\" style=\\\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\\\">\\u0412\\u041e \\u0421\\u0415\\u041a\\u041e\\u0415 \\u0412\\u0420\\u0415\\u041c\\u0415! (\\u041c\\u0430\\u043a\\u0435\\u0434\\u043e\\u043d\\u0441\\u043a\\u0438)<\\/h4>\",\"contact_text\":\"<span style=\\\"color: rgb(119, 119, 119); font-size: 16px;\\\">\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0438\\u0440\\u0430\\u0458\\u0442\\u0435 \\u043d\\u0435 \\u0432\\u043e \\u0431\\u0438\\u043b\\u043e \\u043a\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u0435 \\u045c\\u0435 \\u0432\\u0438 \\u043e\\u0434\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043c\\u0435 \\u0432\\u043e \\u043d\\u0430\\u0458\\u0431\\u0440\\u0437 \\u043c\\u043e\\u0436\\u0435\\u043d \\u0440\\u043e\\u043a!&nbsp;&nbsp;<\\/span><font color=\\\"#777777\\\"><span style=\\\"font-size: 16px;\\\">(\\u041c\\u0430\\u043a\\u0435\\u0434\\u043e\\u043d\\u0441\\u043a\\u0438)<\\/span><\\/font>\",\"contact_success\":\"\\u0423\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e! \\r\\n\\u0411\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u0438\\u043c\\u0435, \\r\\n\\u040c\\u0435 \\u0432\\u0438 \\u0432\\u0440\\u0430\\u0442\\u0438\\u043c\\u0435 \\u0432\\u043e \\u043d\\u0430\\u0458\\u0431\\u0440\\u0437 \\u043c\\u043e\\u0436\\u0435\\u043d \\u0440\\u043e\\u043a  (\\u041c\\u0430\\u043a\\u0435\\u0434\\u043e\\u043d\\u0441\\u043a\\u0438)\",\"street\":\"\\u0423\\u043b. \\u0411\\u0443\\u043b\\u0435\\u0432\\u0430\\u0440 1 \\u043c\\u0430\\u0458 \\u0431\\u0440 152 \\u0411\\u0438\\u0442\\u043e\\u043b\\u0430 \\u0420\\u0435\\u043f\\u0443\\u0431\\u043b\\u0438\\u043a\\u0430 \\u041c\\u0430\\u043a\\u0435\\u0434\\u043e\\u043d\\u0438\\u0458\\u0430\"},\"18\":{\"contact_title\":\"Test\",\"contact_text\":\"Test\",\"contact_success\":\"Test\",\"street\":\"Test 1\"},\"19\":{\"contact_title\":null,\"contact_text\":\"eng\",\"contact_success\":\"eng\",\"street\":\"eng\"}}', 1, 'https://dev.geniusocean.net/depoitzq/terms-r', 'Во ценaтa е вклучен ДДВ', 1, 1, 'https://deposithousesms.com', 'd23a6e43e909065502424a0ed5fed4c210a04e10');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 0, 'English', '1579926860LzpDa1Y7.json'),
(3, 1, 'Македонски', 'X2rHdzyIc5.json'),
(18, 0, 'MK', 'hd7sm6XTnW.json'),
(19, 0, 'English', '4iwdDsJ5b5.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `message`, `sent_user`, `recieved_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ај да видиме', 31, NULL, '2021-12-05 04:18:42', '2021-12-05 04:18:42'),
(2, 1, 'hello', 31, NULL, '2021-12-05 23:14:31', '2021-12-05 23:14:31'),
(3, 1, 'Zdravo jas sum Mr Vendor od test vendor', NULL, 13, '2021-12-30 22:51:49', '2021-12-30 22:51:49'),
(4, 2, 'Da vidime dali kje ja dobie vendorot ili pak korisnikot', 13, NULL, '2021-12-30 22:53:38', '2021-12-30 22:53:38'),
(5, 2, 'Ja dobi korsnikot namesto vendorot', NULL, 31, '2021-12-30 22:55:29', '2021-12-30 22:55:29'),
(6, 3, 'probvcam na Obleka od 553 i 553 treba da dobie email ili ne?', 33, NULL, '2021-12-31 01:50:24', '2021-12-31 01:50:24'),
(7, 4, 'Probvam dali kje stigni i dali kje mozam reply da napram', 33, NULL, '2021-12-31 02:35:26', '2021-12-31 02:35:26'),
(8, 5, 'Uste ednas 553 do 2016', 33, NULL, '2021-12-31 02:40:49', '2021-12-31 02:40:49'),
(9, 6, '553 go povikuva 2016 , reply ne treba da ravboti veli nevestata od namech', 33, NULL, '2021-12-31 02:47:23', '2021-12-31 02:47:23'),
(10, 7, 'Local proba', 33, NULL, '2021-12-31 03:01:34', '2021-12-31 03:01:34'),
(11, 8, 'Remote', 33, NULL, '2021-12-31 03:03:51', '2021-12-31 03:03:51'),
(12, 9, 'Ajde da vidime', 33, NULL, '2021-12-31 03:11:23', '2021-12-31 03:11:23'),
(13, 10, 'Ajde', 33, NULL, '2021-12-31 03:36:20', '2021-12-31 03:36:20'),
(14, 11, 'Koe', 33, NULL, '2021-12-31 03:39:09', '2021-12-31 03:39:09'),
(15, 3, 'Probvam pak ovaj da ne izmesto nesto', 33, NULL, '2022-01-02 04:22:26', '2022-01-02 04:22:26'),
(16, 12, 'Aj da vidime 553 do 2016', 33, NULL, '2022-01-02 04:23:10', '2022-01-02 04:23:10'),
(17, 13, 'Probvam ovaj ljokot smena na Local', 33, NULL, '2022-01-02 04:35:29', '2022-01-02 04:35:29'),
(18, 14, '553 do 2016', 33, NULL, '2022-01-02 05:20:40', '2022-01-02 05:20:40'),
(19, 15, 'dghrth', 31, NULL, '2022-02-21 01:20:15', '2022-02-21 01:20:15'),
(20, 16, '112345', 33, NULL, '2022-02-21 23:39:33', '2022-02-21 23:39:33'),
(21, 17, 'Test', 81, NULL, '2022-02-25 03:54:45', '2022-02-25 03:54:45'),
(22, 18, 'Проба за порака', 82, NULL, '2022-02-25 22:42:53', '2022-02-25 22:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0,
  `whole_discount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0,
  `language_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`, `language_id`) VALUES
(1, 'За нас', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number&nbsp;</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 0, 1, 1),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><br></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\"><br></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\">Сериозно ја сфаќаме безбедноста на\r\nВашите лични податоци. Ве охрабруваме внимателно да ја прегледате Политиката за\r\nзаштита на лични податоци за да се информирате за важни правила под кои ние\r\nможе да собираме, користиме и споделуваме лични податоци.</span><br></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Политиката за заштита на лични\r\nподатоци ги содржи практиките за приватност на веб страната&nbsp;и објаснува\r\nкако </span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;mso-ansi-language:MK\">ДЕПОЗИТ ХАУС ДОО</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">\r\nги користи вашите податоци, а се однесува на нашиот веб сајт</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">,</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\"> електронските услуги, нашите\r\nсоцијални мрежи и испратените електронски пораки од нас. Со Политиката за\r\nзаштита на личните податоци се уредува правото на приватност и сигурност на\r\nличните податоци кои се цел на обработка. Ве молиме прочитајте ја Политиката за\r\nзаштита на лични податоци и повремено проверувајте ја истата за најновите\r\nподатоци од нашата практика за приватност. Со пристaпување или со користење на\r\nнашиот веб сајт се согласувате со сите услови дефинирани во оваа Политика за\r\nзаштитa на лични податоци и Условите за користење на нашата веб страна. Доколку\r\nне се согласувате со овие услови, напуштете ја оваа страна и не го\r\nупотребувајте нашиот сајт.&nbsp;&nbsp;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Повремено ќе ја менуваме и\r\nдополнуваме Политиката за заштита на лични податоци за да ги содржи нашите нови\r\nпрактики, како на пример кога додаваме нова услуга, функционалност или опција\r\nна сајтот. Прибирањето на личните податоци на оваа веб страница е во согласност\r\nсо прописите за заштита на лични податоци.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Оваа Политика за заштита на лични\r\nподатоци се однесува на користењето и откривањето на податоците кои ние ги\r\nсобираме од Вас на www.</span><span style=\"font-family: Arial, &quot;sans-serif&quot;;\">deposithousemarket.com</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">. Други веб-сајтови кои може да бидат\r\nпристапени преку линкови од нашиот сајт може да имаат сопствени политики за\r\nзаштита на лични податоци, собирање на податоци, нивна употреба и практики на\r\nоткривање на податоците. Доколку преку линк на нашиот сајт пристапите до друг\r\nвеб сајт Ве повикуваме да ги видите политиките за заштита на лични податоци на\r\nтаа веб страна. Ние не сме одговорни за политиките или практиките на трети\r\nлица.&nbsp;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Податоците кои ги собираме се чуваат\r\nво согласност со закон и периодот потребен за постигнување на целта на\r\nобработката. Податоците за корисниците и купувачите кои се собираат во\r\nдефинираните збирки на податоци се чуваат во рок од 30 дена од денот на\r\nподнесено барање за бришење на податоците од корисникот.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Вашите права во однос на обработката\r\nна лични податоци се:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nда бидете информирани за обработката на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна пристап до личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна исправка и бришење на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна ограничување на обработката на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна приговор<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Политиката за приватност редовно ќе\r\nсе менува и дополнува соодветно на настанатите промени и нашите активности. Ве\r\nмолиме посетувајте ги политиките за информираност при евенутални промени.<o:p></o:p></span></p></h2></div>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1, 1),
(6, 'За нас', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 0, 1, 3),
(7, 'Приватност', 'privacyt', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><br></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\"><br></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family: Arial, &quot;sans-serif&quot;;\">Сериозно ја сфаќаме безбедноста на\r\nВашите лични податоци. Ве охрабруваме внимателно да ја прегледате Политиката за\r\nзаштита на лични податоци за да се информирате за важни правила под кои ние\r\nможе да собираме, користиме и споделуваме лични податоци.</span><br></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Политиката за заштита на лични\r\nподатоци ги содржи практиките за приватност на веб страната&nbsp;и објаснува\r\nкако </span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;mso-ansi-language:MK\">ДЕПОЗИТ ХАУС ДОО</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">\r\nги користи вашите податоци, а се однесува на нашиот веб сајт</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">,</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\"> електронските услуги, нашите\r\nсоцијални мрежи и испратените електронски пораки од нас. Со Политиката за\r\nзаштита на личните податоци се уредува правото на приватност и сигурност на\r\nличните податоци кои се цел на обработка. Ве молиме прочитајте ја Политиката за\r\nзаштита на лични податоци и повремено проверувајте ја истата за најновите\r\nподатоци од нашата практика за приватност. Со пристaпување или со користење на\r\nнашиот веб сајт се согласувате со сите услови дефинирани во оваа Политика за\r\nзаштитa на лични податоци и Условите за користење на нашата веб страна. Доколку\r\nне се согласувате со овие услови, напуштете ја оваа страна и не го\r\nупотребувајте нашиот сајт.&nbsp;&nbsp;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Повремено ќе ја менуваме и\r\nдополнуваме Политиката за заштита на лични податоци за да ги содржи нашите нови\r\nпрактики, како на пример кога додаваме нова услуга, функционалност или опција\r\nна сајтот. Прибирањето на личните податоци на оваа веб страница е во согласност\r\nсо прописите за заштита на лични податоци.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Оваа Политика за заштита на лични\r\nподатоци се однесува на користењето и откривањето на податоците кои ние ги\r\nсобираме од Вас на www.</span><span style=\"font-family: Arial, &quot;sans-serif&quot;;\">deposithousemarket.com</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">. Други веб-сајтови кои може да бидат\r\nпристапени преку линкови од нашиот сајт може да имаат сопствени политики за\r\nзаштита на лични податоци, собирање на податоци, нивна употреба и практики на\r\nоткривање на податоците. Доколку преку линк на нашиот сајт пристапите до друг\r\nвеб сајт Ве повикуваме да ги видите политиките за заштита на лични податоци на\r\nтаа веб страна. Ние не сме одговорни за политиките или практиките на трети\r\nлица.&nbsp;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Податоците кои ги собираме се чуваат\r\nво согласност со закон и периодот потребен за постигнување на целта на\r\nобработката. Податоците за корисниците и купувачите кои се собираат во\r\nдефинираните збирки на податоци се чуваат во рок од 30 дена од денот на\r\nподнесено барање за бришење на податоците од корисникот.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Вашите права во однос на обработката\r\nна лични податоци се:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nда бидете информирани за обработката на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна пристап до личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна исправка и бришење на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна ограничување на обработката на личните податоци<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">право\r\nна приговор<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">Политиката за приватност редовно ќе\r\nсе менува и дополнува соодветно на настанатите промени и нашите активности. Ве\r\nмолиме посетувајте ги политиките за информираност при евенутални промени.<o:p></o:p></span></p></h2></div>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1, 3);
INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`, `language_id`) VALUES
(8, 'Услови за користење', 'terms-r', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Добрејдовте\r\nна Deposit House веб сајтот. Со негово користење Вие се согласувате со Условите\r\nна користење. Ве молиме прочитајте ги внимателно. Ако имате некои прашања\r\nобратете ни се.&nbsp;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><b><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">ПРИФАЌАЊЕ\r\nНА УСЛОВИТЕ НА УПОТРЕБА</span></b><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">ДЕПОЗИТ ХАУС ДОО</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">, го поседува и менаџира сајтот\r\nwww.deposithousemarket.com. Со употреба на овој сајт и неговите услуги Вие\r\n(\"Вие\" или \"крајниот корисник\") се согласувате со Условите\r\nна користење. Исто така се согласувате и со нашата Политика за заштита на лични\r\nподатоци и се согласувате дека повремено ќе ги посетувате Условите на употреба\r\nза да сте во тек доколку истите претрпат измени. Политиката за заштита на лични\r\nподатоци заедно со овие Услови на употреба, збирно се нарекуваат Услови на\r\nкористење. &nbsp;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">АКО\r\nНЕ СЕ СОГЛАСУВАТЕ СО ОВИЕ УСЛОВИ НА УПОТРЕБА, ВЕДНАШ ПРЕСТАНЕТЕ ДА ГО КОРИСТИТЕ\r\nВЕБ САЈТОТ И НЕ ГИ КОРИСТЕТЕ УСЛУГИТЕ КОИ ГИ НУДИ DEPIST HOUSE, НЕ УЧЕСТВУВАЈТЕ\r\nВО НИТУ ЕДНА ПРОГРАМА, НЕ ВРШЕТЕ КУПУВАЊА </span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">Н</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">А ПРОИЗВОДИ ИЛИ УСЛУГИ КОИ СЕ НУДАТ\r\nПРЕКУ САЈТОТ.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">За\r\nвеб сајтот<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Deposit\r\nHouseовозможува интерактивна онлајн услуга преку веб-страната на домеинот</span><span style=\"font-family: Arial, &quot;sans-serif&quot;;\">deposithousemarket.com</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">,\r\nсо кој дејствува фирмата</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:MK\">ДЕПОЗИТ ХАУС\r\nДОО</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;\">. Преку сајтот deposithousemarket.com одредени компании (\"Продавачи\")\r\nпродаваат услуги или производи. Единствено продавачот е одговорен пред вас за\r\nквалитетот на услугите и производите кои ги нуди и продава. Сите понуди и цени\r\nна сајтот може да се променат во било кое време, без претходно известување.\r\nСите цени се со вклучен ДДВ.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Сопственост\r\nна веб сајтот<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Сајтот,\r\nцелата содржина на сајтот и инфраструктурата која се користи за да го направи\r\nсајтот достапен се наша сопственост, на продавачите и на други даватели на\r\nуслуги. Со користење на овој сајт крајниот корисник и согласување со сите\r\nправила и услови изнесени во продолжение на овој текст (a) Deposit Houseви\r\nовозможува лимитирана, лична, непреносилива, не-ексклузивна лиценца за да го\r\nкористите сајтот во согласност со овие Услови на користење и со сите\r\nдополнителни политики и правила поставени од Deposit House; и (б) се\r\nсогласувате дека нема да ја репродуцирате, дистрибуирате, пренесувате,\r\nпрепродавате било која содржина, софтвер или производи или услуги добиени преку\r\nсајтот без претходно одобрување од Deposit House.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Употребување\r\nна сајтот<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Како\r\nпредуслов на сајтот, Вие се согласувате дека:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Имате\r\nнајмалку 18 години<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Сте\r\nво можност да направите правна обврска<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Не\r\nви е законски забрането да користите одредени услуги или производи<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Нема\r\nда се обидете да вршите било какво дејство врз сајтот за вадење на информации\r\nод него како пуштање robots, crawlers и други алатки за вадење информации<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Вашето\r\nкористење на сајтот во секое време ќе биде во согласност со овие Услови на\r\nкористење<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ќе\r\nправите легитимни купувања кои се во согласност со условите дадени во секоја\r\nпонуда<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ќе\r\nвршите купувања само за Ваша лична употреба или за подароци на пријатели<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ќе\r\nоставате точни информации за Вас во било кое место на сајтот каде оставате\r\nподатоци<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ќе\r\nги променувате податоците за вас по потреба за да се осигурате дека се точни во\r\nбило кое време<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ќе\r\nкупувате само од понудите на Продавачите преку сајтот со креирање на профил на\r\nсајтот и било кое купување ќе биде предмет на Условите за купување, образложени\r\nподолу во овие Услови за користење<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Вие\r\nсте одговорни за Вашата лозинка и нејзино доверливо чување<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Пристап\r\nдо сајтот<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Deposit\r\nHouseго задржува правото да одбие давање на услуга или пристап на сајтот или на\r\nпрофилот на било кое лице, во било кое време поради било која причина. Крајниот\r\nкорисник признава дека иако интернетот е често безбедно место, понекогаш има\r\nпречки во службата или настани кои се надвор од контрола на Deposit House, и\r\nDeposit House не е одговорен за кои било податоци изгубени додека се врши\r\nпренесување на информација преку Интернет. Иако цел на Deposit House е да биде\r\nдостапен 24 часа на ден, 7 дена во неделата, сајтот може да е недостапен од\r\nвреме на време поради било каква причина, вклучувајќи, без ограничување,\r\nрутински одржувања. Вие разбирате и признавате дека во зависност од\r\nоколностите, во рамките и надвор од контрола на Deposit House, пристапот до веб\r\nстраницата може да биде прекинат или суспендиран од време на време.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Deposit\r\nHouse има право во секое време да го промени или прекине било кој аспект или\r\nфункција на сајтот, вклучувајќи, но не и ограничено на, содржина, часови на\r\nдостапност и опрема потребна за пристап или употреба на сајтот.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Измена\r\nна Условите на користење<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Deposit\r\nHouse го задржува правото во било кое време да го прекине или измени било кој\r\nаспект од Условите на користење и/или од Политиката за заштита на лични\r\nподатоци како што смета дека е неопходно или пожелно. Таквите промени може да\r\nвклучуваат, меѓу другото, додавање на одредени такси или давачки. Ако Deposit\r\nHouse прави било какви суштински промени, ние ќе ве известиме со испраќање на\r\ne-mail, на e-mail адресата која е регистрирана со вашиот профил и/или со\r\nобјавување на известување за промена на веб-сајтот. Било какви промени на овие\r\nУслови на користење ќе стапат на сила откако претходно ќе ве известиме со\r\nиспраќање на e-mail до Вас или претходно објавиме известување за промените на\r\nнашиот сајт. Ако не се сложувате со промените можете да го избришете Вашиот\r\nпрофил без било каков надоместок и да не ги користите во иднина услугите на\r\nсајтот по промената на условите. Овие промени ќе бидат важечки за новите\r\nкорисници на нашиот сајт. Затоа Ви препорачуваме да ги пре-прочитате овие важни\r\nинформации кои ги содржат нашите Услови на користење и Политиката за заштита на\r\nлични податоци од време на време, со цел да останете информирани за било какви\r\nпромени. Секое користење на сајтот од страна на крајниот корисник ќе се смета\r\nдека претставува прифаќање од страна на крајниот корисник на тие измени<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Опрема\r\nза употреба на сајтот<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Крајниот\r\nкорисник е одговорен за снабдување и одржување со телефонска опрема,\r\nкомпјутерски хардвер и друга опрема потребна за пристап и користење на овој\r\nсајт и сите трошоци поврзани со тоа. Deposit House не е одговорен за било каква\r\nштета на опремата на крајниот корисник како резултат од користењето на овој\r\nсајт.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Кодекс\r\nна однесување на крајниот корисник<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Сите\r\nинтеракции на сајтот мора да се во согласност со овие Услови на ко</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">р</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">истење. Доколку забележиме дека\r\nВашето однесување му попречува или му забранува на било кој друг корисник да го\r\nупотребува било кој дел од сајтот, може да го ограничиме Вашиот пристап и\r\nкористење на сајтот.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Следните\r\nактивности се забранети&nbsp;на сајтот и означуваат кршење и непочитување на\r\nУсловите на користење:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Поставување\r\nбило каква содржина на сајтот која:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ги\r\nкрши применливите закони (вклучувајќи, но не ограничено на: закони за\r\nинтелектуална сопственост, закони кои се однесуваат на заштита на лични\r\nподатоци и закони кои се однесуваат на клевета);<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Содржи\r\nлични податоци, освен ако ние јасно не побараме од вас такви информации;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Содржи\r\nвируси или лош софтвер кој може да наштети;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Нуди\r\nпреземање на заштитени, доверливи или лични податоци;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Има\r\nефект на наметнување на другите;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Содржи\r\nпораки од неовластени лица од Deposit House, кои наводно зборуваат во име на\r\nDeposit House или даваат доверливи информации поврзани со Deposit House;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Намерно\r\nе несоодветна, претставува измама, или фалсификува податоци; или<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Е\r\nзаштитена со авторски права, трговска марка или било кој друг тип на\r\nинтелектуална сопственост без јасна изречита согласност од сопственикот на\r\nавторското право, трговската марка или друга интелектуална сопственост<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Обидот\r\nда се направи или всушност да се направи било што од од следното:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Пристапување\r\nдо податоци кои не се наменети за вас, како и логирање на сервер или профил\r\nкоја не се овластени за пристап;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Скенирање\r\nили следење на сајтот со цел собирање на податоци, во обид да се прати\r\nпродажбата, користењето, агрегирани информации за понудите, информации за\r\nцените или слични податоци;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Скенирање\r\nили тестирање на безбедноста или конфигурацијата на сајтот или да се прекрши\r\nбезбедноста или мерките за автентикација; или<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Мешање\r\nво употребата на сајтот на било кој корисник на било кој начин, вклучувајќи, без\r\nограничување, по пат на поднесување на вирус на сајтот обид да се направи\r\nпреоптоварување &nbsp;со \"спам\", или да се напраив прекин на сајтот.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Собирање\r\nна било кои од следните наведени работи:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Содржина\r\nод сајтот, вклучувајќи, но не и ограничена на тековните или претходните\r\nпонудени промотивни понуди на сајтот и потоа прикажување на корисниците на\r\nтаква содржина на било кој начин со цел да се пренасочат корисниците од сајтот\r\nкој друг трета страна, без наша писмена дозвола;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Лични\r\nподатоци (дефинирани во Политиката за заштита на лични податоци), <o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Вклучување\r\nво било која од следните активности:<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Упаѓање\r\nили попречување на правилното функционирање на кој било дел, страница или\r\nобласт на сајтот или на било кои функции или услуги обезбедени од страна наDeposit\r\nHouse;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Преземање\r\nбило каква акција што создава прекумерна побарувачка за нашите услуги или\r\nналожува, или може да наметне, неразумно или несразмерно големи оптоварувања на\r\nнашите сервери или други делови од нашата инфраструктура;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Препродавање\r\nна било кои купувања направени преку сајтот;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Пристапување,\r\nследење или копирање на било која содржина од сајтот, користење на било кој\r\n\"робот\", \"пајак\", или други автоматски средства или било\r\nкој рачен процес за било каква цел, без нашa писмена дозвола;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Агрегирање\r\nи прикажување на било кои актуелни или претходни понуди или содржина или други\r\nинформации од сајтот (без разлика дали користите линкови или други технички\r\nсредства или физички записи поврзани со купувања направени преку сајтот), со\r\nматеријали од други сајтови без наша писмена дозвола;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Длабоко\r\nповрзување со кој било дел од сајтот (вклучувајќи, без ограничување, патеката\r\nза купување за секој ваучер) без наша писмена дозвола;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Поврзување\r\nдо сајтот од било кој друг веб-сајт без наша почетна и тековна согласност; или<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Дејствување\r\nнезаконски или злонамерно против бизнис интересите или угледот на Deposit House,\r\nнашите продавачи или нашите услуги.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Корисничка\r\nсодржина<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Сајтот\r\nим овозможува на регистрирани корисници и посетители повеќе можности да ги\r\nпрегледаат или постават мислења, совети, рејтинзи, дискусии, коментари, пораки,\r\nодговори и други комуникации, како и поставување на датотеки, слики,\r\nфотографии, видео, аудио снимки, музички дела и други содржини (колективно,\r\n\"содржини\") преку форуми, огласни табли, групи за дискусија,\r\nвиртуелни простории за разговор, анкети, блогови или други комуникациски\r\nобјекти кои можат да бидат понудени на, преку, или во врска со овој сајт од\r\nвреме на време. Може да се бара од Вас да имате профил за да може да поставите\r\nсодржина.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ако\r\nпоставите било какви содржини, гарантирате дека: (а) Вие сте ​​креаторот на\r\nсодржините; или (б) ако делувате во име на креаторот, дека имате (i) изречна\r\nсолгасност од креаторот, да поставувате и променувате содржин, и (ii) сите\r\nправа неопходни за доделување на лиценци во овие Услови за користење. Понатаму\r\nгарантирате (или, ако се делува во име на креаторот на содржини, сте го увериле\r\nкреаторот дека изјавува и гарантира) дека споделувањето на содржини за целите\r\nкои сте ги одбрале не прекршуваат авторски права, трговски марки или други\r\nправа на интелектуална сопственост или права на трети страни, вклучувајќи ги и\r\nправата на публицитет или приватност. Вие гарантирате дека нема да поставувате,\r\nиспраќате, пренесувате или на друг начин ставате на располагање содржини што се\r\nнезаконски, штетни, заканувачки, навредливи, расистички, порнографски,\r\nнепристојни, насилни, невистинити, клевети, инвазивни на приватноста на друго\r\nлице или штетни за било која трета страна; или ако содржините содржат било\r\nкаков материјал кој крие вируси или било кој друг компјутерски кодови, фајлови\r\nили програми дизајнирани да се прекине, уништи или ограничи функционалноста на\r\nбило кој софтвер или на компјутерска опрема.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Deposit\r\nHouse има единствено и апсолутно право, но не и обврска, да ги прегледа, промени,\r\nпостави, да одбие објавување, да отстрани, да ги следи корисничките содржини и\r\nда ги открива содржините и околностите на нивниот пренос на било која трета\r\nстрана, во било кое време, од било која причина, вклучувајќи да се утврди\r\nусогласеноста со овие Услови на користење и сите оперативни правила\r\nвоспоставени од страна Deposit House, како и да ги задоволи сите применливи\r\nзакони, регулативи или овластени владини барањa. Без ограничување на\r\nгоренаведеното, Deposit House има право да ги отстрани било кои содржини од\r\nзаедници или било кој друг сајт, во својата единствена и апсолутна дискреција.\r\nDeposit House не превзема никаква одговорност за било кои содржини или други\r\nинформации кои се појавуваат или се отстранети од сајтот или на друго место.\r\nDeposit House нема обврска да ги користите корисничките содржините и може да не\r\nго прави тоа воопшто.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Кориснички\r\nсодржини од јавна природа<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Вие\r\nразбирате и се согласувате дека корисничката содржина е јавна. Сите дискусии за\r\nрејтингот, коментари, огласни табли, виртуелни простории за разговор и / или\r\nдруги пораки или средствата за комуникација се јавни, а не приватни пораки, и\r\nспоред тоа, другите може да ги прочитаат комуникациите.&nbsp;Секое лице (без\r\nразлика дали е или не е корисник на услугите на Deposit House) може да ги\r\nпрочита Вашите содржини без Ваше знаење. Ве молиме да не вклучувате какви било\r\nлични информации во Вашите содржини, освен ако не сакате тие да бидат јавно\r\nобјавени. Deposit House не е одговорен за употреба или откривање на какви било\r\nлични информации кои виe ги објавувате како корисничка содржина.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Одобрување/лиценцирање<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Некои\r\nкориснички содржини кои ги оставате на Deposit House може да бидат прикажани\r\nили може да ви биде дадена опција да се прикажат заедно со вашите лични\r\nинформации, или дел од вашите лични информации, вклучувајќи, но не\r\nограничувајќи се на вашето име, иницијали, корисничко име, корисничко име на\r\nсоцијална мрежа, слика, допаѓања, преференци, глас и локација. Вие му давате на\r\nDeposit House бесплатно, неповратно, неотповикливо, не-ексклузивно, преносливо,\r\nважечко низ целиот свет право на користење, прикажување, дистрибуција, понуда\r\nза продажба и продажба на лични информации поврзани со вашите содржини, без\r\nразлика дали содржините се појавуваат самостојно или како дел од други работи,\r\nкако и во било која форма, медиум или технологија, дали сега познат или во\r\nпонатамошниот период развиен, без надоместок за Вас. Сепак, Deposit House нема\r\nда има обврска да ги користи Вашите лични информации во врска со било која\r\nкорисничка содржина.&nbsp;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Што\r\nсе однесува на врската помеѓу Вас и Deposit House, Вие го задржувате\r\nсопственичкото право над содржината која ја поставувате. Во секој случај, со\r\nоставањето корисничка содржина на сајтот Вие&nbsp;му давате на Grouper\r\nбесплатно, неповратно, неотповикливо, не-ексклузивно, преносливо, важечко низ\r\nцелиот свет право на користење, прикажување, дистрибуција, понуда за продажба и\r\nпродажба на лични информации поврзани со вашите содржини, без разлика дали\r\nсодржините се појавуваат самостојно или како дел од други работи, како и во\r\nбило која форма, медиум или технологија, дали сега познат или во понатамошниот\r\nпериод развиен, да ги користи сите без надоместок за Вас. Ви му давате на\r\nDeposit House морално право и сите други права кои може да ги имате согласно\r\nзаконите, а кои произлегуваат од авторство на содржината или интегритетот на\r\nматеријалите во врска со Вашата поставена корисничка содржина. Лиценцата на\r\nDeposit House за употреба на корисничката содржина или личните податоци\r\nподнесени со неа, вклучува, но не е ограничена на користење на истата за\r\nрекламирање, маркетинг, промоции, истражување на пазарот, овозможување фидбек\r\nна продавачите, контрола на квалитет и за други законски цели.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Како\r\nшто беше претходно наведено, оставање корисничка содржина е дозволено само за\r\nлица над 18 години. Сајтот е наменет и дизајниран за возрасни лица. Со\r\nоставањето содржина на Deposit House Вие потврдувате дека сте полнолетни. Ние\r\nведнаш ќе ја отстраниме корисничката содржина од лица помали од 18 години.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Општи\r\nуслови за гаранција<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">КРАЈНИОТ\r\nКОРИСНИК ЕКСПЛИЦИТНО СЕ СОГЛАСУВА ДЕКА КОРИСТЕЊЕТО НА ОВОЈ САЈТ Е ПОД НЕГОВА\r\nОДГОВОРНОСТ. НИТУ Deposit House, НИТУ ВРАБОТЕНИ</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">ТЕ</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">, АГЕНТИ</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">ТЕ</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">, ПРОДАВАЧИ</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">ТЕ</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\">, ДАВАТЕЛИ</span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\nmso-ansi-language:MK\">ТЕ</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;\"> НА УСЛУГИ, СОРАБОТНИЦИ,\r\nПРОВАЈДЕРИТЕ НА СОДРЖИНА ИЛИ ДАВАТЕЛИ НА ЛИЦЕНЦА ИЛИ НЕКОЈ ОД НИВНИТЕ\r\nВРАБОТЕНИ, ДИРЕКТОРИ, АГЕНТИ, НЕ ГАРАНТИРААТ ДЕКА КОРИСТЕЊЕТО НА САЈТОТ ЌЕ БИДЕ\r\nНЕПРЕКИНАТО, БЕЗГРЕШНО, БЕЗ ВИРУСИ ИЛИ БЕЗ ГРЕШКИ; НИТУ ПАК ГАРАНТИРААТ ЗА (А)\r\nРЕЗУЛТАТИТЕ, КОИ МОЖАТ ДА СЕ ДОБИЈАТ ОД УПОТРЕБА НА ОВОЈ САЈТ, ИЛИ БИЛО КОЈА\r\nМИКРОСТРАНА, ИЛИ ЗА (Б) ТОЧНОСТА, ВЕРОДОСТОЈНОСТА ИЛИ ЦЕЛОСНОСТА НА (1)\r\nСОДРЖИНАТА НА СТРАНАТА, ВКЛУЧИТЕЛНО, БЕЗ ОГРАНИЧУВАЊЕ НА ПОНУДИТЕ ОД\r\nПРОДАВАЧИТЕ, УСЛУГИТЕ И ПРОИЗВОДИТЕ КОИ СЕ НУДАТ; (2) ОПИСОТ НА ПОНУДИТЕ ОД\r\nПРОДАВАЧИТЕ, ПРОИЗВОДИТЕ ИЛИ ДРУГИ ПРОГРАМИ; ИЛИ (3) КОРИСНИЧКА СОДРЖИНА ДАДЕНА\r\nПРЕКУ САЈТОТ.&nbsp;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Ограничување\r\nна одговорноста<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">ВО\r\nНИКОЈ СЛУЧАЈ Deposit House, НЕГОВИТЕ СОРАБОТИЦНИ И НИВНИТЕ ВРАБОТЕНИ,\r\nДИРЕКТОРИ, АГЕНТИ ИЛИ ПРОДАВАЧИ, ДАВАТЕЛИ НА УСЛУГИ И ПРОВАЈДЕРИ НА СОДРЖИНА НЕ\r\nСЕ ОДГОВОРНИ ЗА БИЛО КОИ ПОСРЕДНИ, СЛУЧАЈНИ, СПЕЦИЈАЛНИ, ПОСЛЕДОВАТЕЛНИ ИЛИ\r\nКАЗНЕНИ ШТЕТИ КОИ ПРОИЗЛЕГУВААТ ОД, ИЛИ СЕ ПОВРЗАНИ СО (А) ВАШЕТО КОРИСТЕЊЕ НА\r\nСАЈТОТ, СОДРЖИНАТА, КОРИСНИЧКАТА СОДРЖИНА И ДРУГИ ИНФОРМАЦИИ СОДРЖАНИ НА\r\nСАЈТОТ, (Б) ВАШАТА НЕМОЖНОСТ ДА ГО КОРИСТИТЕ САЈТОТ, (В) ПРОМЕНА ИЛИ\r\nОТСТРАНУВАЊЕ НА СОДРЖИНА ПОСТАВЕНА НА САЈТОТ, (Г) ПОНУДИТЕ ОД ПРОДАВАЧИТЕ,\r\nПРОИЗВОДИТЕ, УСЛУГИТЕ ИЛИ ДРУГИ ПРОГРАМИ ПОНУДЕНИ ПРЕКУ САЈТОТ, ИЛИ (Д) ОВИЕ\r\nУСЛОВИ НА УПОТРЕБА. <o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Електронска\r\nкомуникација<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Кога\r\nго користите сајтот или испраќате електронски (е-маил) пораки до Deposit House,\r\nВие комуницирате со нас по електронски пат и се согласувате да примате\r\nелектронски пораки од нас во врска со Вашата употреба на сајтот. Ние ќе\r\nкомуницираме со Вас преку е-маил или преку поставување нотификации или коментари\r\nна сајтот. Вие се согласувате дека сите спогодби, забелешки или друга\r\nкомуникација која ви е пренесена по електронски пат ги задоволува правните\r\nзакони и барања како да е пренесена во писмена форма и може да послужи како\r\nверодостоен доказ. Известувања од нас ќе се сметаат за уредно доставени на\r\nденот на испратената електронска порака од наша страна, на Вашата е-маил адреса\r\nкоја сте ја оставиле на Вашиот профил или сте ни ја дале низ друга форма на\r\nкомуникација со Вас.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">21.\r\nНадоместок на штети/ослободување<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Само\r\nВие сте одговорни за интеракцијата со Продавачите или другите корисници на\r\nсајтот. До степен до кој применливиот закон дозволува, Вие тука се согласувате\r\nдека го ослободувате Deposit House од било кои обвинувања кои се поврзани или\r\nпроизлегуваат од </span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:MK\">производи и\r\nуслуги </span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;\">од Продавачи , било која активност на Продавачот,\r\nвклучувајќи, но не и ограничено на било каква штета која може да ви е направена\r\nод страна на Продавачот.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\ntext-align:justify;line-height:normal\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\r\nmargin-left:.25in;text-align:justify;line-height:normal\"><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;\">Крајниот\r\nкорисник се согласува дека ќе ја обештети и нема да ја смета за одговорна\r\nкомпанијата </span><span lang=\"MK\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:MK\">ДЕПОЗИТ ХАУС\r\nДОО</span><span style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;\">, неговите одговорни лица, вработени и агенти за сите\r\nпобарувања за отштета и трошоци, вклучувајќи трошоци за правно застапување, кои\r\nможат да произлезат од користењето на оваа веб страна од страна на крајниот\r\nкорисник.<o:p></o:p></span></p></h2></div>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_category` int(1) NOT NULL DEFAULT 0,
  `info_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`, `info_banner`) VALUES
(1, 'Успешно! \r\nБлагодариме, \r\nЌе ви вратиме во најбрз можен рок', 'test@deposithouse.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">КОНТАКТИРАЈТЕ НЕ</h4><h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">ВО СЕКОЕ ВРЕМЕ!</h4>', '<span style=\"color: rgb(119, 119, 119); font-size: 16px;\">Контактирајте не во било кое време ќе ви одговориме во најбрз можен рок!</span>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'Ул. Булевар 1 мај бр 152 Битола Република Македонија', '047 612 625', '00 000', 'test@deposithouse.com', 'https://deposithouse.com/', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, NULL, NULL, '16409110761565150264banner3-min.jpg', 'http://google.com', 1, 1, '{\"1\":\"CNqI16441406121568889138banner1.jpg\",\"3\":\"mvFT16441406121568889138banner2.jpg\",\"11\":\"HMHu16441406121568889138banner1.jpg\",\"12\":\"R7bz16441406121568889138banner1.jpg\"}', '{\"1\":\"http:\\/\\/google.com\",\"3\":\"http:\\/\\/google.com\",\"11\":\"http:\\/\\/google.com\",\"12\":\"http:\\/\\/google.com\"}', '16409110761565150264banner4-min.jpg', 'http://google.com', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(6, '1641233713LOGO-DEPOSIT-HOUSE-Rectangle-min.png', 'https://deposithouse.com/'),
(7, '1646049106164131671384_Karamel-min.png', 'https://www.instagram.com/karamelcaffe/?hl=en');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Pay via Deposit House Money.', 'Deposit House Money', '<font size=\"3\"><b>Go to&nbsp;<a href=\"http:/deposithouse.com/user/makeEscrow\" title=\"PAyDEpositMoney\" target=\"_blank\">https://deposithouse.com/ </a>and pay secure&nbsp;</b><br></font>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(191) DEFAULT NULL,
  `weght` double NOT NULL DEFAULT 1,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `sale_count` int(11) DEFAULT 0,
  `click_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(19, 'ANA MARIJA', 'categories , home_page_settings , emails_settings , language_settings');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-ZGPVGW5GB1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-ZGPVGW5GB1\');\r\n</script>', 'deposit house shop online депозит хаус');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`, `language_id`) VALUES
(2, 0, 'SHOP SHIPPING', 'Different shop different shipping', '1561348133service1.png', 1),
(3, 0, 'PAYMENT METHOD', 'Credit Card', '1561348138service2.png', 1),
(4, 0, 'SHOP RETURN POLICY', 'Different Shop \r\nDifferent Return Policy', '1561348143service3.png', 1),
(5, 0, 'HELP CENTER', 'Telephone agent service', '1561348147service4.png', 1),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png', 1),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png', 1),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png', 1),
(9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png', 1),
(14, 0, 'Транспорт', 'Различна продавница, различен транспорт', '16463935171561348133service1.png', 3),
(15, 0, 'Начин на плаќање', 'Кредитна картичка', '16463935771561348138service2.png', 3),
(16, 0, 'Политика на враќање', 'Различна продавница, различна политика на враќање.', '16463936641561348143service3.png', 3),
(17, 0, 'Центар за помош', 'Телефонска поддршка', '16463875921561348147service4.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `form_weght` double NOT NULL DEFAULT 0,
  `to_weght` double NOT NULL DEFAULT 0,
  `email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`, `form_weght`, `to_weght`, `email`) VALUES
(1, 0, '1gm - 2kg', '5 days', 5.99, 0, 2, 'marjan.krsteski553@gmail.com'),
(2, 0, '2kg -5kg', '5 days', 6.99, 2, 5, 'marjan.krsteski553@gmail.com'),
(3, 0, '5kg - 10kg', '5 days', 7.99, 5, 10, 'marjan.krsteski553@gmail.com'),
(4, 0, '10kg - 15kg', '5 days', 9.99, 10, 15, 'marjan.krsteski553@gmail.com'),
(5, 0, '15kg - 22kg', '5 days', 23.99, 15, 22, 'marjan.krsteski553@gmail.com'),
(6, 0, 'test', '5', 5, 5, 55, 'marjan.krsteski553@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `side_banners`
--

CREATE TABLE `side_banners` (
  `id` bigint(20) NOT NULL,
  `best_seller_banner` varchar(255) DEFAULT NULL,
  `best_seller_banner_link` varchar(255) DEFAULT NULL,
  `best_seller_banner1` varchar(255) DEFAULT NULL,
  `best_seller_banner_link1` varchar(255) DEFAULT NULL,
  `big_save_banner` varchar(250) DEFAULT NULL,
  `big_save_banner_link` varchar(250) DEFAULT NULL,
  `big_save_banner1` varchar(250) DEFAULT NULL,
  `big_save_banner_link1` varchar(250) DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `side_banners`
--

INSERT INTO `side_banners` (`id`, `best_seller_banner`, `best_seller_banner_link`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner`, `big_save_banner_link`, `big_save_banner1`, `big_save_banner_link1`, `language_id`) VALUES
(1, 'BpQwA1646394386Alat-Zeleno-min(1).jpg', 'fdgsdfg', 'jJtze1646394386Alat-Zeleno-min(1).jpg', 'rree', 'goSiK1646396170Alat-Zeleno-min(1).jpg', 'yrty', 'QRBzv1646396170Alat-Zeleno-min(1).jpg', 'tr', 3),
(2, 'rlnh91646394371English_Alat-Zeleno-min.jpg', 'fdgsdfg', '4wDzZ1646394371English_Alat-Zeleno-min.jpg', 'rree', 'nMkZC1646394410English_Alat-Zeleno-min.jpg', 'yrty', 'uBcYE1646394410English_Alat-Zeleno-min.jpg', 'tr', 1),
(3, 'qf0UB16442104021565150264banner4.jpg', 'fdgsdfg', 'nZaBW1644210402noimage.png', 'rree', NULL, NULL, NULL, NULL, 11),
(4, '2vpIH16442106631565150264banner3.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 12),
(5, NULL, NULL, NULL, NULL, 'TF4N316442112761565150264banner4.jpg', 'yrty', 'NIcaY16442112761565150264banner3.jpg', 'tr', 11),
(6, NULL, NULL, NULL, NULL, 'rbc9g16442113081568889138banner2.jpg', '#', 'SS09216442113081568889138banner1.jpg', '#', 1),
(7, NULL, NULL, NULL, NULL, 'rIAcO16442113241568889138banner2.jpg', '#', 'zkIEH16442113241568889138banner1.jpg', '#', 1),
(8, NULL, 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 1),
(9, 'IUojt16460480181644911299Alat-Zeleno.jpg', 'fdgsdfg', 'dgqfk16460480181644911299Alat-Zeleno.jpg', 'rree', NULL, NULL, NULL, NULL, 3),
(10, 'IoFt716460480471644911299Alat-Zeleno.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 3),
(11, NULL, NULL, NULL, NULL, 'KDSln16460480641644911299Alat-Zeleno.jpg', 'yrty', NULL, 'tr', 3),
(12, NULL, NULL, NULL, NULL, 'EmNAY16460480851644911299Alat-Zeleno.jpg', 'yrty', '65Q6b16460480851644911299Alat-Zeleno.jpg', 'tr', 3),
(13, 'UpPqg16460481181644911299Alat-Zeleno.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 1),
(14, 'Bi9EU16460485881644911299Alat-Zeleno.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 3),
(15, 'qAtGl16460544661644911299Alat-Zeleno.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 3),
(16, 'blAjQ1646157024Alati.jpg', 'fdgsdfg', NULL, 'rree', NULL, NULL, NULL, NULL, 3),
(17, NULL, 'fdgsdfg', 'VQGZd16462812651584934329adv-banner.jpg', 'rree', NULL, NULL, NULL, NULL, 1),
(18, NULL, NULL, NULL, NULL, NULL, 'yrty', 'jhY6i16462812781567655174profile.jpg', 'tr', 3),
(19, NULL, NULL, NULL, NULL, 'g0hrV16462812931584934329adv-banner.jpg', 'yrty', 'fNzTk16462812931584934329adv-banner.jpg', 'tr', 1),
(20, 'jGJHv16464646381642766777img-17.jpg', '#', 'ssPQM16464646381642871763delivery-order.png', '#', NULL, NULL, NULL, NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`, `language_id`) VALUES
(8, 'Fashion', '24', '#ffffff', 'slideInUp', '40% OFF', '60', '#ffffff', 'slideInDown', 'Man and women wardrobe, shoes and accessories.', '16', '#ffffff', 'slideInRight', '1641000180Shop_girl_green_right-miin77.jpg', 'slide-three', 'https://deposithousemarket.com/category/fashion-and-Beauty', 1),
(9, 'Electronics', '23', '#ffffff', 'slideInUp', '30% OFF', '60', '#ffffff', 'slideInDown', 'Electronics, multimedia, laptops and computer equipment.', '16', '#ffffff', 'slideInDown', '1641055024girl_headphones-m.jpg', 'slide-one', 'https://deposithousemarket.com/category/electric', 1),
(10, 'Kids', '24', '#ffffff', 'slideInDown', '50% OFF', '60', '#ffffff', 'slideInDown', 'Toys, wardrobe, shoes and accessories for toddlers and babies.', '16', '#ffffff', 'slideInLeft', '16463977551641058424baby_shoes-min-min.jpg', 'slide-three', 'https://deposithousemarket.com/category/toys-and-hobbies', 1),
(15, 'Мода', '24', '#ffffff', 'fadeIn', 'Попусти до 40%', '60', '#ffffff', 'fadeIn', 'Секаков вид на женска и машка гардероба, обувки, модни додатоци.', '16', '#ffffff', 'fadeIn', '16463287161641000180Shop_girl_green_right-miin77.jpg', 'slide-three', 'https://dev.geniusocean.net/depoitzq/category/fashion-and-Beauty', 3),
(16, 'Техника', '24', '#ffffff', 'fadeIn', 'Попусти до 30%', '60', '#ffffff', 'fadeIn', 'Компјутерска галантерија, мултимедија, лаптопи и секаков вид на комјутерска опрема.', '16', '#ffffff', 'fadeIn', '16463287501641055024girl_headphones-m.jpg', 'slide-one', 'https://dev.geniusocean.net/depoitzq/category/fashion-and-Beauty', 3),
(17, 'Се за дете', '24', '#ffffff', 'fadeIn', 'Попусти до 50%', '60', '#ffffff', 'fadeIn', 'Голем избор на играчки, гардероба, \r\nпатики, додатоци за деца и бебиња.', '16', '#ffffff', 'fadeIn', '16463977191641058424baby_shoes-min-min.jpg', 'slide-three', 'https://dev.geniusocean.net/depoitzq/category/fashion-and-Beauty', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sms_templetes`
--

CREATE TABLE `sms_templetes` (
  `id` bigint(20) NOT NULL,
  `sms_type` varchar(255) DEFAULT NULL,
  `sms_subject` varchar(255) DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_templetes`
--

INSERT INTO `sms_templetes` (`id`, `sms_type`, `sms_subject`, `sms_body`, `language_id`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1, 1),
(2, 'new_registration', 'Welcome To Deposit House', 'Hello {customer_name}, You have successfully registered to {website_title}, We wish you will have a wonderful experience using our serviceThank You your verification OTP {otp_number}', 1, 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1, 1),
(5, 'vendor_verification', 'Request for verification.', 'Hello {customer_name}, You are requested verify your account. Please send us photo of your passport. Thank You {customer_name}, TREBA DA PODNESITE DOKUMENTI . Please send us photo of your passport. Thank You Yes pls do.', 1, 1),
(6, 'vendor_order', 'Имаш нарачка.', 'Здраво {vendor_name},<br>Имаш нарачка. <br>број на нарачка&nbsp; {order_number}\r\n</p>', 3, 1),
(7, 'vendor_order', 'Имаш нарачка.', '<p>Hello {vendor_name},<br>You you got a order. <br>\r\norder number {order_number}\r\n</p>', 1, 1),
(8, 'new_order', 'Your Order Placed Successfully', 'Hello {customer_name}, Your Order Number is {order_number} Your order has been placed successfully', 1, 1),
(9, 'new_registration', 'Welcome To Deposit House', 'Hello {customer_name}, You have successfully registered to {website_title}, We wish you will have a wonderful experience using our serviceThank You your verification OTP  {otp_number}', 1, 1),
(10, 'ship_order', 'Имаш нарачка.', 'Hello  You you got a order.\r\norder number {order_number}', 1, 1),
(11, 'new_registration', 'Welcome To Deposit House', 'Добредојдовте {customer_name}, Успешно се регистриравте на {website_title}, Ви посакуваме пријатно искуство Вашиот верификационен ОТП број  е  {otp_number}', 3, 1),
(12, 'ship_order', 'Имаш нарачка.', 'Hello  You you got a order.\r\norder number {order_number}', 3, 1),
(13, 'vendor_accept', 'Активација на продавница', 'Hello {customer_name},Your Vendor Account Activated Successfully. Please Login to your account and build your own shop. Thank You', 3, 1),
(14, 'vendor_withdraw', 'Повлекување', 'Здраво {vendor_name},\r\nПоднесено е барање за повлекување на {order_amount}  на вашата Deposit House Market продавница.&nbsp;Доколку вие не го поднесовте ова барење ве молиме да не контактирате.', 3, 1),
(15, 'subscription_warning', 'Повлекување', 'subscriptionwarning', 3, 1),
(16, 'withdraw_accept', 'Withdraw Accept', 'Withdray accept {order_amount}', 3, 1),
(17, 'withdraw_reject', 'Withdraw Reject', 'Withdray Reject{order_amount}', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 0, 1, 0, 0, 0, 0, '503140663', '8tt', 'https://deposithousemarket.com/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'https://deposithousemarket.com/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `language` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`, `language`) VALUES
(2, 4, 'TELEVISION', 'television', 1, '{\"3\":\"\\u0422\\u0415\\u041b\\u0415\\u0412\\u0418\\u0417\\u0418\\u0408\\u0410\",\"4\":\"\\u099f\\u09c7\\u09b2\\u09bf\\u09ad\\u09bf\\u09b6\\u09a8\"}'),
(3, 4, 'REFRIGERATOR', 'refrigerator', 1, '{\"3\":\"\\u0424\\u0420\\u0418\\u0416\\u0418\\u0414\\u0415\\u0420\",\"4\":\"\\u09b0\\u09c7\\u09ab\\u09cd\\u09b0\\u09bf\\u099c\\u09be\\u09b0\\u09c7\\u099f\\u09b0\"}'),
(4, 4, 'WASHING MACHINE', 'washing-machine', 1, NULL),
(5, 4, 'AIR CONDITIONERS', 'air-conditioners', 1, NULL),
(6, 5, 'ACCESSORIES', 'accessories', 1, NULL),
(7, 5, 'BAGS', 'bags', 1, NULL),
(8, 5, 'CLOTHINGS', 'clothings', 1, NULL),
(9, 5, 'SHOES', 'shoes', 1, NULL),
(10, 7, 'APPLE', 'apple', 1, NULL),
(11, 7, 'SAMSUNG', 'samsung', 1, NULL),
(12, 7, 'LG', 'lg', 1, NULL),
(13, 7, 'SONY', 'sony', 1, NULL),
(19, 23, 'WAIST UP', 'waist-up', 1, '{\"3\":\"\\u0413\\u041e\\u0420\\u041d\\u0410 \\u041e\\u0411\\u041b\\u0415\\u041a\\u0410\"}'),
(20, 23, 'WAIST DOWN', 'waist-down', 1, '{\"3\":\"\\u0414\\u041e\\u041b\\u041d\\u0410 \\u041e\\u0411\\u041b\\u0415\\u041a\\u0410\"}'),
(21, 23, 'SETS', 'setss', 1, '{\"3\":\"\\u041a\\u041e\\u041c\\u041f\\u041b\\u0415\\u0422\\u0418\"}'),
(22, 23, 'DRESSES', 'dresses', 1, '{\"3\":\"\\u0424\\u0423\\u0421\\u0422\\u0410\\u041d\\u0418\"}'),
(23, 24, 'WAIST UP', 'waist-up', 1, '{\"3\":\"\\u0413\\u041e\\u0420\\u041d\\u0410 \\u041e\\u0411\\u041b\\u0415\\u041a\\u0410\"}'),
(24, 24, 'WAIST DOWN', 'manwaist-down', 1, '{\"3\":\"\\u0414\\u041e\\u041b\\u041d\\u0410 \\u041e\\u0411\\u041b\\u0415\\u041a\\u0410\"}'),
(25, 24, 'SETS', 'sets', 1, '{\"3\":\"\\u041a\\u041e\\u041c\\u041f\\u041b\\u0415\\u0422\\u0418\"}');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(8, 'Free / Бесплатен', 'MKD', 'MKD', 0, 365, 0, '<div style=\"text-align: center;\"><font size=\"4\">Free 365 days /</font></div><div><div style=\"text-align: center;\"><font size=\"4\">&nbsp;Бесплатни 365 дена</font></div><div style=\"text-align: center;\"><font size=\"4\">Unlimited products /&nbsp;</font></div><div><div style=\"text-align: center;\"><font size=\"4\">Неограничен број производи</font></div><div style=\"text-align: center;\"><font size=\"4\">Verification needed /&nbsp;</font></div><div style=\"text-align: center;\"><font size=\"4\">Верификација задолжителна</font></div></div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_otp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_verifiy` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_charge` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `title`, `status`, `name`) VALUES
(1, 'Skrill', 0, 'Skrill'),
(2, 'Bank Account', 1, 'Bank'),
(3, 'Paypal', 0, 'Paypal'),
(4, 'Payoneer', 0, 'Payoneer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `side_banners`
--
ALTER TABLE `side_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templetes`
--
ALTER TABLE `sms_templetes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `side_banners`
--
ALTER TABLE `side_banners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sms_templetes`
--
ALTER TABLE `sms_templetes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
