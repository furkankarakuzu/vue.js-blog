-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 03 Eyl 2020, 17:21:26
-- Sunucu sürümü: 5.7.24
-- PHP Sürümü: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `vueblog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` text COLLATE utf8_unicode_ci NOT NULL,
  `soyad` text COLLATE utf8_unicode_ci NOT NULL,
  `kullaniciadi` text COLLATE utf8_unicode_ci NOT NULL,
  `sifre` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `ad`, `soyad`, `kullaniciadi`, `sifre`) VALUES
(1, 'Furkan', 'Karakuzu', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazilar`
--

DROP TABLE IF EXISTS `yazilar`;
CREATE TABLE IF NOT EXISTS `yazilar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci,
  `descc` text COLLATE utf8_unicode_ci,
  `imgSrc` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `category` text COLLATE utf8_unicode_ci,
  `tarih` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `yazilar`
--

INSERT INTO `yazilar` (`id`, `title`, `descc`, `imgSrc`, `content`, `category`, `tarih`) VALUES
(1, 'Bu bir başlık', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'uzay', '24/8/2020 17:16:0'),
(2, 'Bu bir başlık2', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'vue', '24/8/2020 17:16:0'),
(3, 'Bu bir başlık3', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'node', '24/8/2020 17:16:0'),
(4, 'Bu bir başlık4', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'nuxt', '24/8/2020 17:16:0'),
(5, 'Bu bir başlık5', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'ingilizce', '24/8/2020 17:16:0'),
(6, 'Bu bir başlık6', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'gundem', '24/8/2020 17:16:0'),
(7, 'Bu bir başlık7', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'uzay', '24/8/2020 17:16:0'),
(8, 'Bu bir başlık8', 'Bu bir açıklama', '2.jpg', '<p>bu bir içerik metnidir.</p>', 'uzay', '24/8/2020 17:16:0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
