-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 17, 2021 at 01:31 PM
-- Server version: 5.7.30-log
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `membership`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `customers` (
  `id` bigint(25) UNSIGNED NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mobile` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `district_id` varchar(25) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `id_number` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `id_issue_date` date DEFAULT NULL,
  `id_issue_province` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_vietnamese_ci,
  `gender` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `point_balance` int(255) DEFAULT NULL,
  `point_expires_at` date DEFAULT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  `dealer_id` bigint(25) UNSIGNED DEFAULT NULL,
  `creator` mediumint(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `mobile`, `email`, `district_id`, `address`, `birthday`, `id_number`, `id_issue_date`, `id_issue_province`, `image`, `note`, `gender`, `status`, `point_balance`, `point_expires_at`, `user_id`, `dealer_id`, `creator`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nguyễn Trần Duy Phương', '0987955990', 'phuongntd@vietnamsuzuki.com.vn', '572', '14/8 Street No. 9, Ward 9, Go Vap District', '1990-11-06', '225390811', '2006-03-16', '56', NULL, NULL, 1, NULL, 155, '2021-08-24', 1, 400015, NULL, '2020-11-01 01:42:39', '2021-04-12 02:29:44', NULL),
(38, 'Nguyen Tran Duy Phuong', '0987955991', 'duy@phuong.vn', '87', '14/8 Street No. 9, Ward 9, Go Vap District', '2020-11-09', '1234567890', '2020-11-11', '12', NULL, NULL, 1, NULL, 0, NULL, 22, 400012, NULL, '2020-11-24 07:44:18', '2021-04-09 00:46:02', NULL),
(66, 'Nguyễn Việt Hoàng', '0912333444', 'viethoang@gmail.com', '766', '02 Phổ Quang', '1990-09-05', '123456654321', '2021-02-03', '37', NULL, NULL, 1, NULL, 0, NULL, 34, 400015, NULL, '2021-04-06 09:54:52', '2021-04-06 10:05:18', NULL),
(67, 'Nguyễn Việt Hùng', '0909023523', 'zulik.nguyen@gmail.com', '769', '23 Đường 10, phường Cát Lái', '1984-12-11', '079084004945', '2016-10-21', '79', NULL, NULL, 1, NULL, 125, '2021-08-01', 35, 400015, NULL, '2021-04-09 11:14:55', '2021-04-12 01:48:20', NULL),
(68, 'Testing', '0909090909', 'hungnv@vietnamsuzuki.com.vn', '886', 'Testing', '1988-04-11', '123456789', '2021-04-01', '89', NULL, NULL, 1, NULL, 0, NULL, 36, 400015, NULL, '2021-04-11 03:27:45', '2021-04-11 03:27:45', NULL),
(69, 'Đỗ Trần Bảo Ngọc', '0937800078', 'ngocdtb@vietnamsuzuki.com.vn', '764', '22/79 đường 21, phường', '1987-11-01', '02417707', '2015-09-01', '79', NULL, NULL, 2, NULL, 0, NULL, 37, 8, NULL, '2021-04-12 11:10:56', '2021-04-12 11:10:56', NULL),
(70, 'PHAN NGUYEN HONG PHUC', '0984706863', 'PHUCPNH@VIETNAMSUZUKI.COM.VN', '766', 'SO 2,PHO QUANG', '1988-08-03', '311990509', '2000-09-05', '79', NULL, NULL, 1, NULL, 0, NULL, 38, 8, NULL, '2021-04-16 06:36:32', '2021-04-16 06:36:32', NULL),
(71, 'HỒ PHƯỚC ĐẠT', '0933574462', 'dathp@vietnamsuzuki.com.vn', '762', '23/4 KHU PHỐ 6 ,ĐƯỜNG HIỆP BÌNH,PHƯỜNG HIỆP BÌNH PHƯỚC', '1990-03-15', '079090015221', '2019-11-26', '79', NULL, NULL, 1, NULL, 0, NULL, 39, 8, NULL, '2021-04-16 09:14:14', '2021-04-16 09:14:14', NULL),
(72, 'TRẦN QUỐC TRUNG', '0326293820', 'trungtq@vietnamsuzuki.com.vn', '712', 'GIA HUỲNH, PHƯỜNG TRẢNG BÀNG, TÂY NINH', '1994-06-04', '291071545', '2009-07-13', '72', NULL, NULL, 1, NULL, 0, NULL, 40, 8, NULL, '2021-04-16 09:23:26', '2021-04-16 09:23:26', NULL),
(73, 'NGUYỄN HOÀNG VIỆT', '0586002181', 'vietnh@vietnamsuzuki.com.vn', '766', '107/27 PHẠM VĂN HAI, P3', '1995-12-28', '025241496', '2012-05-13', '79', NULL, NULL, 1, NULL, 0, NULL, 41, 8, NULL, '2021-04-16 09:32:50', '2021-04-16 09:32:50', NULL),
(74, 'Đặng Đình Chung', '0982343379', 'dinhchung1976@gmail.com', '777', '38d Đường số 1, Khu phố 7, Phường Tân Tạo A', '1976-10-07', '025367363', '2012-04-17', '79', NULL, NULL, 1, NULL, 7, '2021-10-26', 42, 40, NULL, '2021-04-26 01:49:30', '2021-05-04 10:31:16', NULL),
(75, 'Nguyễn Anh Tuấn', '0937802568', 'tuanhn1970@gmail.com', '766', '47 thang long tan binh', '1970-05-18', '160151800', '2012-09-28', '79', NULL, NULL, 1, NULL, 7, '2021-12-09', 43, 8, NULL, '2021-04-26 03:35:16', '2021-06-10 02:26:43', NULL),
(76, 'Đỗ Văn Thọ', '0911391156', 'doquangvinh1@gmail.com', '815', '121b nguyễn văn giác', '1957-04-06', '035057000725', '2016-11-16', '79', NULL, NULL, 1, NULL, 6, '2021-11-05', 44, 8, NULL, '2021-04-26 03:50:16', '2021-05-06 06:56:23', NULL),
(77, 'Lê Minh Hiền', '0898985759', 'lxhien0808@gmail.com', '765', '259 bui huu nghia', '1975-01-08', '052075000497', '2020-07-07', '79', NULL, NULL, 1, NULL, 7, '2021-10-26', 45, 8, NULL, '2021-04-26 07:59:53', '2021-05-04 10:32:24', NULL),
(78, 'Trần Quốc Hậu', '0982944438', 'tranquochau2008@gmail.com', '777', '14/4 Đường Số 21', '1979-11-24', '082079000590', '2020-05-14', '79', NULL, NULL, 1, NULL, 5, '2021-10-26', 46, 7, NULL, '2021-04-26 08:20:47', '2021-05-04 10:32:50', NULL),
(79, 'Nguyễn Công Nguyên', '0907313833', 'dongphuckhaihung@gmail.com', '777', '52 đường số 4 phường bình hưng hoà', '1992-09-09', '241198477', '2014-07-14', '66', NULL, NULL, 1, NULL, 6, '2021-10-26', 47, 8, NULL, '2021-04-26 08:29:29', '2021-05-05 09:23:09', NULL),
(80, 'Đặng Quốc  Huy', '0931323007', 'lifeofdqh@gmail.com', '589', 'Lạc Nghiệp 1 cà ná', '2014-01-20', '264494857', '2011-08-02', '58', NULL, NULL, 1, NULL, 0, '2021-11-05', 48, 8, NULL, '2021-04-26 09:10:41', '2021-05-05 09:23:32', NULL),
(81, 'Pham Nhat Hoang', '0354620820', 'hoangpn@vietnamsuzuki.com.vn', '724', '442 nguyen tri phuong', '1992-02-03', '8468923487325', '2020-03-22', '79', NULL, NULL, 1, NULL, 0, NULL, 49, 8, NULL, '2021-04-26 10:49:30', '2021-04-26 10:49:30', NULL),
(82, 'Nguyên Thị Diệu Thuý', '0913152802', 'nguyenduythuy28@gmail.com', '767', '61/4a lê liễu', '1979-02-28', '025325949', '2010-07-21', '79', NULL, NULL, 1, NULL, 120, '2021-10-27', 50, 8, NULL, '2021-04-27 01:39:02', '2021-05-04 10:29:47', NULL),
(83, 'Lữ Ngọc Kim', '0906892025', 'lukimngoc89@gmail.com', '770', '14/24 kỳ dong', '1989-05-20', '024347048', '2014-04-04', '79', NULL, NULL, 1, NULL, 0, NULL, 51, 8, NULL, '2021-04-27 02:14:32', '2021-04-27 02:14:32', NULL),
(84, 'Nguyễn Diệp Thịnh', '0988818105', 'ftum5147@gmail.com', '772', '70 lu gia phuong 15', '1981-04-03', '082081000386', '2018-09-20', '79', NULL, NULL, 1, NULL, 7, '2021-11-11', 52, 8, NULL, '2021-04-27 02:32:16', '2021-05-12 03:28:08', NULL),
(85, 'Phạm Tuấn Anh', '0906835810', 'phamtuananh0107@gmail.com', '761', '103/2tl08', '1977-07-01', '025866125', '2013-11-20', '79', NULL, NULL, 1, NULL, 0, NULL, 53, 8, NULL, '2021-04-27 02:56:00', '2021-04-27 02:56:00', NULL),
(86, 'Nguyễn thanh binh', '0902370850', 'dangthuyhue@gmail.com', '777', '44/7 truong phuoc phan', '1987-05-24', '079087003307', '2016-08-22', '79', NULL, NULL, 1, NULL, 0, NULL, 54, 8, NULL, '2021-04-27 03:07:16', '2021-04-27 03:07:16', NULL),
(87, 'Bì Văn Thuận', '0869835373', 'hoangraulaodai14@gmail.com', '766', '118ngô thị thu minh', '1973-11-14', '300814844', '2017-12-27', '80', NULL, NULL, 1, NULL, 28, '2021-12-01', 55, 8, NULL, '2021-04-27 03:20:36', '2021-06-01 03:10:14', NULL),
(88, 'Nguyễn Tấn Hoà', '0334846764', 'tanhoanguyen@gmail.com', '783', 'Ấp 5 xã phước vinh an', '1976-05-15', '023194348', '2012-12-06', '79', NULL, NULL, 1, NULL, 9, '2021-10-27', 56, 8, NULL, '2021-04-27 03:30:41', '2021-05-04 10:27:58', NULL),
(89, 'Đặng Hoàng Quốc Kha', '0903962883', 'khadang2608@gmail.com', '772', '449/2le dai hanh p11', '1974-08-26', '025574574', '2012-02-13', '79', NULL, NULL, 1, NULL, 6, '2021-10-28', 57, 8, NULL, '2021-04-28 01:14:55', '2021-05-04 10:26:50', NULL),
(90, 'Nguyễn Quốc Hiệp', '0945679669', 'quoc16@gmail.com', '769', 'Chung cu krista', '1991-03-16', '001091004100', '2018-10-31', '79', NULL, NULL, 1, NULL, 0, NULL, 58, 8, NULL, '2021-04-28 02:30:29', '2021-04-28 02:30:29', NULL),
(91, 'Bế Mạnh Tú', '0705553627', 'dangkhoa17977@gmail.com', '764', '417/69/26c quang trung phuog 10', '1977-09-17', '023204635', '2015-08-14', '79', NULL, NULL, 1, NULL, 0, NULL, 59, 8, NULL, '2021-04-28 02:52:39', '2021-04-28 02:52:39', NULL),
(92, 'Nguyễn Việt Hồng', '0918062502', 'viethong0303@gmail.com', '762', '32/9 khu phố', '1978-03-03', '023108752', '2012-04-11', '79', NULL, NULL, 1, NULL, 7, '2021-10-28', 60, 8, NULL, '2021-04-28 04:26:45', '2021-05-04 10:27:23', NULL),
(93, 'Nguyễn Xuân Luân', '0906663719', 'nguyenluan319@gmail.com', '764', '44 nguyen thanh dung', '1988-01-03', '250717773', '2013-08-10', '68', NULL, NULL, 1, NULL, 0, NULL, 61, 8, NULL, '2021-04-29 00:42:58', '2021-04-29 00:42:58', NULL),
(94, 'Trần Kim Thu Liễu', '0778747055', 'kimthulieuvdq@gmail.com', '766', 'Số 2 Phổ Quang,Phường 02,Quận Tân Bình,TP.Hồ Chí Minh', '1965-04-01', '021634974', '2009-04-02', '79', NULL, NULL, 2, NULL, 12, '2021-11-04', 62, 8, NULL, '2021-04-29 03:32:28', '2021-05-19 09:45:43', NULL),
(95, 'Cao Đăng Tiến', '0909345001', 'caotiendang130583@gmail.com', '764', '788/24c nguyen kiẹm p3', '1983-04-13', '023487701', '2012-09-19', '79', NULL, NULL, 1, NULL, 4, '2021-10-29', 63, 8, NULL, '2021-04-29 06:40:14', '2021-05-04 10:38:27', NULL),
(96, 'CHÂU VĂN BẢO', '0906677068', 'chauvanbao@lttc.edu.vn', '771', 'G1C Trường Sơn Cư Xá Bắc Hải,Phường 15,Quận 10,Tp.Hồ Chí Minh', '1974-06-07', '025661153', '2012-03-10', '79', NULL, NULL, 1, NULL, 0, NULL, 64, 8, NULL, '2021-05-04 08:22:23', '2021-05-04 08:22:23', NULL),
(97, 'Nguyễn Quốc Anh', '0971005676', 'nquocanh1967@gmail.com', '760', '18a /41 nguyen thi minh khai', '1967-11-17', '079067003586', '2016-11-19', '79', NULL, NULL, 1, NULL, 0, NULL, 65, 8, NULL, '2021-05-05 01:48:39', '2021-05-05 01:48:39', NULL),
(98, 'Vũ Đức Cường', '0909298969', 'Cuongthanhnam73@gmail.com', '761', '118/5tch 10 quan 12', '1978-11-08', '024644253', '2015-05-04', '79', NULL, NULL, 1, NULL, 0, NULL, 66, 8, NULL, '2021-05-05 01:58:52', '2021-05-05 01:58:52', NULL),
(99, 'Trương Văn Xuân', '0937710050', 'xuanca58@gmail.com', '785', '84/6huynh thị hai p tan thoi hiep', '1958-07-01', '044058001090', '2019-01-04', '79', NULL, NULL, 1, NULL, 7, '2021-11-05', 67, 8, NULL, '2021-05-05 02:14:58', '2021-05-19 10:03:15', NULL),
(100, 'DƯơng Thanh Đạm', '0962599799', 'dtd1977@gmail.com', '763', 'C2 0310 chung cu safira khang dien', '1977-09-05', '182246302', '2010-02-22', '40', NULL, NULL, 1, NULL, 0, NULL, 68, 8, NULL, '2021-05-05 02:24:15', '2021-05-05 02:24:15', NULL),
(101, 'Chu Văn Trọng', '0988995473', 'khongco@gmail', '771', '117/36thanh thai p14', '1945-04-14', '020406346', '2009-03-03', '79', NULL, NULL, 1, NULL, 10, '2021-11-05', 69, 8, NULL, '2021-05-05 02:31:54', '2021-05-06 06:56:23', NULL),
(102, 'Lê Minh Triết', '0888560015', 'minhtrl@outlook.com', '768', '210/3 hồ văn huê p9', '1989-11-11', '079089009431', '2018-05-08', '79', NULL, NULL, 1, NULL, 6, '2021-11-05', 70, 8, NULL, '2021-05-05 02:36:49', '2021-05-06 06:56:23', NULL),
(103, 'BÙI ĐÌNH TRỌNG', '0975126546', 'dinhtrong603@gmail.com', '772', '204 Lô 6, CC Phú Thọ, Phường 15, Quận 11', '1983-03-06', '034083012492', '2019-07-05', '34', NULL, NULL, 1, NULL, 7, '2021-11-05', 71, 8, NULL, '2021-05-05 08:21:33', '2021-05-06 06:56:23', NULL),
(104, 'Trần Duy Khoa', '0907460209', 'tranduykhoa16121985@gmail.com', '764', '103/11 Nguyễn du p7 q. Gò vấp', '1985-12-16', '025236584', '2010-01-02', '79', NULL, NULL, 1, NULL, 14, '2021-11-10', 72, 8, NULL, '2021-05-05 08:37:21', '2021-05-21 01:44:32', NULL),
(105, 'Nguyễn Văn Phúc', '0932129479', 'nguyenphuc841976@gmail.com', '777', '16/29/11 duong so 16 binh hung hoa', '1976-04-08', '075078000740', '2018-12-20', '79', NULL, NULL, 1, NULL, 0, NULL, 73, 8, NULL, '2021-05-06 02:06:18', '2021-05-06 02:06:18', NULL),
(106, 'Đỗ Thị Nữ', '0963365391', 'chamsockhachhang@vietnamsuzuki.com.vn', '785', '2 phổ quang', '1991-11-24', '033191001131', '1991-11-24', '79', NULL, NULL, 2, NULL, 0, NULL, 74, 8, NULL, '2021-05-07 08:48:01', '2021-05-07 08:53:55', NULL),
(107, 'Bùi Thành Tâm', '0909346545', 'buithanhtamca@gmail.com', '785', 'Chung cư Conic Gảden, Ấp 5, Phong Phú, Bình Chánh, Thành phố Hồ Chí Minh', '1991-09-23', '301389138', '2006-09-26', '80', NULL, NULL, 1, NULL, 11, '2021-11-08', 75, 8, NULL, '2021-05-08 01:39:59', '2021-05-10 07:30:34', NULL),
(108, 'Phạm Minh Nhựt', '0989302655', 'nhut53578@gmail.com', '777', '117/80 hồ văn long .Phường tân tạo', '1993-10-30', '281046491', '2014-10-28', '79', NULL, NULL, 1, NULL, 6, '2021-11-10', 76, 8, NULL, '2021-05-10 01:45:57', '2021-05-11 03:33:12', NULL),
(109, 'Nguyễn Đình Sinh', '0975039179', 'sinhdnguyenn@gmail.com', '766', '324/2pham van bach p 15', '1950-07-23', '034050003828', '2018-04-19', '79', NULL, NULL, 1, NULL, 0, NULL, 77, 8, NULL, '2021-05-10 01:51:44', '2021-05-10 01:51:44', NULL),
(110, 'Lê Thiện', '0937076276', 'lethien.sushiworldrest@gmail.com', '767', '58/31 thạch lam', '2021-07-07', '024798355', '2021-08-21', '79', NULL, NULL, 1, NULL, 0, NULL, 78, 8, NULL, '2021-05-11 04:48:49', '2021-05-11 04:48:49', NULL),
(111, 'Trần Quang Khánh', '0908124799', 'tqkhanhpcbd77@gmail.com', '763', '2.03C chung cư C6 đường Man Thiện', '1989-09-02', '052089000252', '2020-01-07', '79', NULL, NULL, 1, NULL, 0, NULL, 79, 8, NULL, '2021-05-11 06:18:04', '2021-05-11 06:18:04', NULL),
(112, 'Tran van quy', '0938037704', 'vaithunphusang@gmail.com', '777', '47/28 đường số 8', '1989-07-10', '060089000013', '2016-10-11', '79', NULL, NULL, 1, NULL, 0, NULL, 80, 8, NULL, '2021-05-11 06:31:40', '2021-05-11 06:31:40', NULL),
(113, 'Phan đăng tráng', '0985118383', 'gdmn@tamadong.com', '766', '48/11 nguyễn hiến lê.p13.QTb', '1990-06-20', '001090008948', '2015-10-02', '1', NULL, NULL, 1, NULL, 0, NULL, 81, 8, NULL, '2021-05-11 06:34:24', '2021-05-11 06:34:24', NULL),
(114, 'Nhàn Thanh', '0985516613', 'nhanmercedes@gmail.com', '785', '38 tran cao van', '2021-05-11', '285066710', '2021-05-11', '70', NULL, NULL, 2, NULL, 0, NULL, 82, 8, NULL, '2021-05-11 12:01:34', '2021-05-11 12:01:34', NULL),
(115, 'Nguyễn Duy Long', '0396983187', 'duylong1872@gmail.com', '761', '206/10 Huỳnh Thị Hai', '2001-07-18', '079201006177', '2016-05-04', '79', NULL, NULL, 1, NULL, 0, NULL, 83, 8, NULL, '2021-05-12 02:47:49', '2021-05-12 02:47:49', NULL),
(116, 'PHÙNG HỮU HẢO', '0909093948', 'huuhao@gmail.com', '766', '185/20/7Ni Sư Huỳnh Liên P.10', '1983-07-25', '023730787', '2015-03-12', '79', NULL, NULL, 1, NULL, 28, '2021-11-12', 84, 8, NULL, '2021-05-12 04:19:42', '2021-05-13 02:48:02', NULL),
(117, 'NGUYEN CONG TRU', '0903996520', 'dothinudo@gmail.com', '777', 'HCMC', '1111-11-11', '09039965200', '2021-02-11', '79', NULL, NULL, 1, NULL, 0, NULL, 85, 8, NULL, '2021-05-12 07:44:25', '2021-05-12 07:44:25', NULL),
(118, 'nữ', '0963365390', 'dothinu@vietnamsuzuki.com.vn', '785', '2 spectross', '1991-11-24', '0963365390', '1991-11-24', '79', NULL, NULL, 1, NULL, 0, NULL, 86, 8, NULL, '2021-05-12 09:13:50', '2021-05-12 09:13:50', NULL),
(119, 'CTY TNHH MTV HOA NHÀ BẾP', '0903044896', 'lethukitchenflower@gmail.com', '765', 'H18 Đường D2, P.25, Q. Bình Thạnh, TP. HCM', '2013-05-15', '0312279332', '2010-01-01', '79', NULL, NULL, 1, NULL, 0, NULL, 87, 8, NULL, '2021-05-13 00:13:01', '2021-05-13 00:13:01', NULL),
(120, 'Trần Minh Quân', '0903033595', 'minhquan2009@gmail.com', '784', '36/5E ấp chánh 2, tân xuân', '1980-04-19', '051080000363', '2019-02-21', '79', NULL, NULL, 1, NULL, 0, NULL, 88, 8, NULL, '2021-05-13 02:31:37', '2021-05-13 02:31:37', NULL),
(121, 'Đặng Thị Minh Thúy', '0938920495', 'thuy.thiminh.dang@gmail.com', '768', '30c3 Thích Quảng Đức', '1982-09-26', '023575115', '2014-06-11', '79', NULL, NULL, 2, NULL, 3, '2021-11-13', 89, 8, NULL, '2021-05-13 08:17:00', '2021-05-14 04:33:18', NULL),
(122, 'CTY TNHH THỰC PHẨM HUY ANH', '0938199882', 'phuongnguyen.huyanh@gmail.com', '785', 'E9/204 Ấp 6, Xã Tân Nhựt, Huyện Bình Chánh, TP. HCM', '1982-05-05', '0316272264', '2020-05-18', '79', NULL, NULL, 1, NULL, 0, NULL, 90, 8, NULL, '2021-05-13 08:25:43', '2021-05-13 08:25:43', NULL),
(123, 'Nguyễn trọng nghĩa', '0939386568', 'uyennhu0610@gmail.com', '821', 'Lòng hưng', '1981-08-08', '311733327', '2013-10-11', '82', NULL, NULL, 1, NULL, 7, '2021-11-13', 91, 8, NULL, '2021-05-13 08:29:05', '2021-05-14 04:33:18', NULL),
(124, 'PHAN DUY CƯỜNG', '0908333431', 'cuongphanduy979@gmail.com', '766', '259/28c, CMT8, P7, Q. Tân Bình', '1979-10-19', '023175871', '2008-03-13', '79', NULL, NULL, 1, NULL, 7, '2021-11-19', 92, 8, NULL, '2021-05-13 08:29:58', '2021-05-21 02:22:07', NULL),
(125, 'NGUYỄN HỮU ANH', '0902582044', 'huyanh986@gmail.com', '784', '96/3Q, Ấp Mỹ Hòa 1, Xã Trung Chánh, Huyện Hốc Môn, TP. HCM', '1986-09-22', '051086000195', '2017-12-07', '79', NULL, NULL, 1, NULL, 0, NULL, 93, 8, NULL, '2021-05-13 08:36:14', '2021-05-13 08:36:14', NULL),
(126, 'CTY TNHH BNB HÀ NỘI TẠI VŨNG TÀU', '0912441895', 'chinhanhvungtau@bnbhanoi.vn', '748', '46 Huỳnh Khương Ninh, Phường 03, TP. Vũng Tàu', '2019-07-25', '01064544726-001', '2019-07-25', '77', NULL, NULL, 1, NULL, 0, NULL, 94, 8, NULL, '2021-05-13 08:45:24', '2021-05-13 08:45:24', NULL),
(127, 'VÕ TRƯƠNG BẰNG', '0983788078', 'ttnbang84@gmail.com', '760', '280 Lầu 5, Cống Quỳnh, Phường Phạm Ngũ Lão, Quận 1, TP. HCM', '1984-11-05', '023599065', '2009-12-14', '79', NULL, NULL, 1, NULL, 0, NULL, 95, 8, NULL, '2021-05-13 08:51:28', '2021-05-13 08:51:28', NULL),
(128, 'ĐẶNG BÁ PHƯỚC', '0972826682', 'dbphuoc@gmail.com', '672', '54A Nguyễn Siêu, Phường 7, Đà Lạt, Lâm Đồng', '1977-03-03', '250388408', '2010-12-13', '68', NULL, NULL, 1, NULL, 0, NULL, 96, 8, NULL, '2021-05-14 00:47:41', '2021-05-14 00:47:41', NULL),
(129, 'VÕ THỊ BÍCH NA', '0938458076', 'tuyennam84@gmail.com', '763', '267/28 Lê Văn Việt, P. Hiệp Phú, Quận 9', '1985-03-15', '077185000339', '1985-03-15', '79', NULL, NULL, 2, NULL, 0, NULL, 97, 8, NULL, '2021-05-14 00:51:20', '2021-05-14 00:51:20', NULL),
(130, 'TRỊNH LỆ QUÂN', '0984238899', 'vietpt31785@gmail.com', '785', '238 Hải Thượng Lãn Ông, Phường 14, Quận 5, TP. HCM', '1966-08-13', '079166001761', '2018-08-08', '79', NULL, NULL, 2, NULL, 0, NULL, 98, 8, NULL, '2021-05-14 00:56:54', '2021-05-14 00:56:54', NULL),
(131, 'TRẦN TUẤN VIỆT', '0912878686', 'vietviba@yahoo.com', '778', '119 đƯỜNG 10, Khu Nam Long, P. Tân Thuận Đông, Quận 7', '1983-11-16', '001083038646', '2020-07-24', '79', NULL, NULL, 1, NULL, 0, NULL, 99, 8, NULL, '2021-05-14 01:04:48', '2021-05-14 01:04:48', NULL),
(132, 'CTY TNHH CALM SEA', '0903949529', 'ops@c-calm.com', '785', '28E Nguyễn Hữu Cảnh, Phường 22, Quận Bình Thạnh', '1969-02-14', '0314149787', '2016-12-08', '79', NULL, NULL, 1, NULL, 0, NULL, 100, 8, NULL, '2021-05-14 01:24:50', '2021-05-14 01:24:50', NULL),
(133, 'NGUYỄN VĂN CHÚNG', '0981822034', 'trung1967@gmail.com', '768', '419/4D Phan Xích Long, Phường 02, Quận Phú  Nhuận', '1967-06-24', '021874276', '2005-10-18', '79', NULL, NULL, 1, NULL, 5, '2021-11-29', 101, 8, NULL, '2021-05-14 01:28:44', '2021-05-31 03:46:16', NULL),
(134, 'TRẦN THỊ HUẾ', '0931877833', 'huentt93@gmail.com', '771', '2.04 Lô 6, Chung Cư Phú Thọ, Phường 15, Quận 11, TP. HCM', '1993-02-16', '025839228', '2014-03-05', '79', NULL, NULL, 2, NULL, 0, NULL, 102, 8, NULL, '2021-05-14 01:42:33', '2021-05-14 01:42:33', NULL),
(135, 'NGUYỄN MẠNH CƯỜNG', '0982555367', 'cuongnt@gmail.com', '764', 'Phòng số 108B tầng 2 nhà N01, Chung Cư K26, Dương Quảng Hàm,  Phường 7, Q.Gò Vấp, TP. HCM', '1972-08-22', '024190189', '2008-07-05', '79', NULL, NULL, 1, NULL, 8, '2021-11-20', 103, 8, NULL, '2021-05-14 02:37:38', '2021-05-21 06:18:57', NULL),
(136, 'TRƯƠNG VĂN TRUNG', '0989157539', 'tvtrung7@gmail.com', '774', '21A Kim Biên, Phường 13, Quận 5, TP. HCM', '1969-11-09', '022384217', '2013-03-23', '79', NULL, NULL, 1, NULL, 0, NULL, 104, 8, NULL, '2021-05-14 02:40:21', '2021-05-14 02:40:21', NULL),
(137, 'CTY CP DƯỢC PHẨM IP', '0983995971', 'ledaiduong1985@gmail.com', '766', '58/101 Nguyễn Minh Hoàng, Phường 12, Quận Tân Bình, TP. HCM', '1960-01-01', '0312401092', '2016-08-24', '79', NULL, NULL, 1, NULL, 0, NULL, 105, 8, NULL, '2021-05-14 02:44:12', '2021-05-14 02:44:12', NULL),
(138, 'NGUYỄN HẢI NGỌC TRÂM', '0902838664', 'Nhntram@gmail.com', '770', '107/21 Trương Định, Phường 06, Quận 3, TP. HCM', '1989-07-03', '024237971', '2010-10-23', '79', NULL, NULL, 2, NULL, 0, NULL, 106, 8, NULL, '2021-05-14 02:55:13', '2021-05-14 02:55:13', NULL),
(139, 'CTY TNHH GIAI PHAP ZIMICO', '0838982515', 'hoangthanhminh80@gmail.com', '762', '31 Đường 49b, Khu Phố 4, Phường Thảo Điền, TP. Thủ Đức, TP. HCM', '2021-03-25', '0313861014', '2021-03-25', '79', NULL, NULL, 1, NULL, 8, '2021-12-14', 107, 8, NULL, '2021-05-14 02:59:49', '2021-06-15 02:43:59', NULL),
(140, 'CÔNG TY TNHH CÔNG NGHỆ TRUNG SƠN', '0838119991', 'account@tschem.com.vn', '766', '403 Nguyễn Thái Bình, Phường 12, Quận Tân Bình, Tp.Hồ Chí Minh', '2012-06-14', '0311835273', '2012-06-14', '79', NULL, NULL, 1, NULL, 5, '2021-11-21', 108, 8, NULL, '2021-05-14 03:05:27', '2021-05-24 02:47:55', NULL),
(141, 'Nguyễn Long An', '0917079944', 'longanpiano@gmail.com', '778', 'Số 77 Phố Tiểu Nam. Mỹ Gia 1. Phú Mỹ Hưng', '1978-08-12', '011820567', '2010-12-09', '1', NULL, NULL, 1, NULL, 0, NULL, 109, 8, NULL, '2021-05-14 04:33:41', '2021-05-14 04:33:41', NULL),
(142, 'Nguyên Văn Minh', '0908990807', 'nguyenvanminh151985@gmail.com', '764', 'Chung cư Osimi', '1985-11-15', '079085014401', '2018-11-30', '79', NULL, NULL, 1, NULL, 5, '2021-11-14', 110, 8, NULL, '2021-05-14 06:20:32', '2021-05-17 05:44:55', NULL),
(143, 'đỗ văn thượng', '0931107848', 'le_phuong1402@gmail.com', '762', '39/2x đường số1 phường linh trung', '1985-06-06', '025339505', '2010-09-08', '79', NULL, NULL, 1, NULL, 47, '2021-11-14', 111, 8, NULL, '2021-05-14 06:30:07', '2021-05-17 05:44:55', NULL),
(144, 'Nguyễn Phi Hoàng Bảo', '0373031719', 'nguyenphihoangbao17031980@gmail.com', '768', '89/45 huỳnh văn bánh, p17, quận Phú Nhuận', '1980-03-17', '211762264', '2017-01-24', '52', NULL, NULL, 1, NULL, 4, '2021-11-17', 112, 8, NULL, '2021-05-17 02:19:09', '2021-05-18 02:11:50', NULL),
(145, 'Võ Dương Anh Huy', '0904081093', 'voduonganhhuy@gmail.com', '766', '22 Trà Khúc phường 2', '1993-10-08', '312195626', '2008-09-24', '82', NULL, NULL, 1, NULL, 0, NULL, 113, 8, NULL, '2021-05-17 02:55:22', '2021-05-17 02:55:22', NULL),
(146, 'Nguyễn Hải Bình', '0983839404', 'sonybinh2612@gmail.com', '763', '29C đường 898', '1981-03-25', '211758043', '2017-06-26', '52', NULL, NULL, 1, NULL, 9, '2021-11-17', 114, 8, NULL, '2021-05-17 03:33:39', '2021-05-18 02:11:51', NULL),
(147, 'Nguyễn Quang Vinh', '0358010191', 'nguenvinh684@gmail.com', '766', '87/90/2b nguyễn sỹ sách .phường 15.quận tân bình', '1991-01-01', '230833541', '2007-02-27', '79', NULL, NULL, 1, NULL, 0, NULL, 115, 8, NULL, '2021-05-17 03:55:43', '2021-05-17 03:55:43', NULL),
(148, 'Hoàng Quốc Nhật', '0911233332', 'arthome@arthome.com.vn', '764', '42/1A Trương Đăng Quế , F1 , Q Gò Vấp', '1983-10-02', '023446391', '2010-05-28', '79', NULL, NULL, 1, NULL, 180, '2021-12-08', 116, 8, NULL, '2021-05-17 06:22:00', '2021-06-09 02:17:24', NULL),
(149, 'Dương Khương Duy', '0901040402', 'duongkhuongduy90@gmail.com', '767', '710/53/7 Luỹ Bán Bích, P Tân Thành, Q Tân Phú', '1990-02-20', '066090000058', '2017-04-17', '79', NULL, NULL, 1, NULL, 13, '2021-11-17', 117, 8, NULL, '2021-05-17 07:10:15', '2021-05-18 02:11:51', NULL),
(150, 'Tô chung lâm', '0898929686', 'tochunglam1985@gmail.com', '771', '457/79 cmt8 p13 q10', '1985-07-05', '079085006987', '2017-01-13', '79', NULL, NULL, 1, NULL, 4, '2021-11-17', 118, 8, NULL, '2021-05-17 07:25:03', '2021-05-18 02:11:50', NULL),
(151, 'Nguyễn Huỳnh Quang Vũ', '0976415621', 'nguyenvu31011301@gmail.com', '783', '38/4A đường 360 ấp Xóm Chùa xã Tân An Hội', '1991-01-31', '024761745', '2013-12-13', '79', NULL, NULL, 1, NULL, 0, NULL, 119, 8, NULL, '2021-05-17 07:31:05', '2021-05-17 07:31:05', NULL),
(152, 'Nguyên thành lâm', '0901411012', 'nguyenthanhlam11@gmail.com', '778', '30 đường số 2 tân kiểng quân 7 HCM', '1992-09-27', '087092000131', '2019-05-11', '79', NULL, NULL, 1, NULL, 0, NULL, 120, 8, NULL, '2021-05-17 08:38:04', '2021-05-17 08:38:04', NULL),
(153, 'Trịnh Hoài Nam', '0918211101', 'Trinhhoainam@icloud.com', '786', '179 Nguyễn Văn Tạo', '1976-08-08', '087076000136', '2020-02-05', '79', NULL, NULL, 1, NULL, 0, NULL, 121, 8, NULL, '2021-05-18 02:01:56', '2021-05-18 02:01:56', NULL),
(154, 'Trần Văn Huân', '0972704388', 'huantran@gmail.com', '697', 'Xã Minh Lập,', '1974-07-02', '131281924', '2015-05-27', '25', NULL, NULL, 1, NULL, 7, '2021-11-18', 122, 8, NULL, '2021-05-18 02:28:28', '2021-05-19 04:05:18', NULL),
(155, 'ĐẶNG MINH TRÍ', '0909674886', 'anhtrith@gmail.com', '778', '160/57 Nguyễn Văn Quỳ, phường Phú Thuận, quận 7,', '1996-06-27', '321584487', '2013-03-31', '83', NULL, NULL, 1, NULL, 0, NULL, 123, 8, NULL, '2021-05-18 07:29:39', '2021-05-18 07:29:39', NULL),
(156, 'Lương Chí Năng', '0938913009', 'chinangluong@gmail.com', '760', '7/9B Nguyễn Thị Minh Khai P. Bến Nghé Quận 1', '1985-03-11', '075085000825', '2019-05-08', '79', NULL, NULL, 1, NULL, 1, '2021-11-18', 124, 8, NULL, '2021-05-18 08:44:11', '2021-05-19 04:05:18', NULL),
(157, 'CUNG THẾ BÌNH', '0917957939', 'billycung6868@gmail.com', '778', '380/15 Lê Văn Lương', '1990-10-18', '079090007474', '2017-10-18', '79', NULL, NULL, 1, NULL, 5, '2021-11-18', 125, 8, NULL, '2021-05-18 09:05:09', '2021-05-19 04:05:17', NULL),
(158, 'Quân Đoàn Lê', '0938191273', 'doanlequan@gmail.com', '764', '80/15 đường số 3', '1979-08-22', '051079000416', '2018-09-27', '79', NULL, NULL, 1, NULL, 0, NULL, 126, 8, NULL, '2021-05-19 06:32:52', '2021-05-19 06:32:52', NULL),
(159, 'DUONG VAN KY THINH', '0908114495', 'kythinh@yahoo.com', '761', 'B7-09 chung cư Tín Phong (12 view)', '1977-02-10', '025777593', '2013-05-16', '79', NULL, NULL, 1, NULL, 0, NULL, 127, 8, NULL, '2021-05-19 07:09:32', '2021-05-19 07:09:32', NULL),
(160, 'Nguyễn Thị Ngọc Mai', '0933994323', 'kristennguyen1609@gmail.com', '767', '725/57/31 Trường Chinh', '1991-05-18', '024968824', '2009-02-17', '79', NULL, NULL, 2, NULL, 4, '2021-11-20', 128, 8, NULL, '2021-05-20 01:33:58', '2021-05-21 06:18:57', NULL),
(161, 'Đỗ Quang Tươi', '0909441230', 'quangtuoido1972@gmail.com', '761', '154 TTH 21 Tân Thới Hiệp Q 12', '1972-10-02', '035072001302', '2017-02-17', '79', NULL, NULL, 1, NULL, 12, '2021-11-20', 129, 8, NULL, '2021-05-20 02:01:09', '2021-05-21 06:18:57', NULL),
(162, 'Nguyễn Văn Quyền', '0836919231', 'jimmythanh2005@gmail.com', '807', 'Ấp 2/6 Long Hậu, Cần Giuộc, Long An', '1987-12-26', '312248627', '2009-10-14', '82', NULL, NULL, 1, NULL, 0, NULL, 130, 8, NULL, '2021-05-20 02:33:25', '2021-05-20 02:33:25', NULL),
(163, 'Trần Duy Thái', '0988567222', 'duythaitran78@gmail.com', '770', '410/2A CMT8', '1978-02-12', '077078001360', '2019-07-24', '79', NULL, NULL, 1, NULL, 4, '2021-11-20', 131, 8, NULL, '2021-05-20 02:50:06', '2021-05-21 06:18:57', NULL),
(164, 'HUỲNH PHÁT LỢI', '0918134742', 'hploi1977@gmail.com', '777', '36/34/5 Bùi Tư Toàn, P. An Lạc, Quận Bình Tân', '1977-08-20', '049077000025', '2016-03-15', '79', NULL, NULL, 1, NULL, 8, '2021-11-20', 132, 8, NULL, '2021-05-20 02:58:02', '2021-05-21 06:18:57', NULL),
(165, 'LÊ VĨNH AN', '0906267888', 'anpeter2003@yahoo.con', '786', '60 đường 21 khu ninesouth', '1981-08-23', '023651505', '2012-12-06', '79', NULL, NULL, 1, NULL, 6, '2021-11-20', 133, 8, NULL, '2021-05-20 03:34:45', '2021-05-21 06:18:57', NULL),
(166, 'Nguyễn Văn Quyết', '0989087092', 'quyetsatsco2016@gmail.com', '761', '12/31/18 TL 27', '1985-06-10', '025143166', '2009-08-03', '79', NULL, NULL, 1, NULL, 6, '2021-11-20', 134, 8, NULL, '2021-05-20 03:38:16', '2021-05-21 06:18:57', NULL),
(167, 'Nguyễn văn phụng', '0918999571', 'nguyenvanphung_ts2003@yahoo.com', '785', '4/15b Đinh Đức thiện ap 4 xa tan qui tay huyện bình Chánh tphcm', '1985-05-05', '321204861', '2019-11-11', '83', NULL, NULL, 1, NULL, 0, NULL, 135, 8, NULL, '2021-05-20 06:15:23', '2021-05-20 06:15:23', NULL),
(168, 'Nguyễn Bá Tùng', '0914491911', 'avo.vietnam@gmail.com', '764', '20/13 Nguyễn Văn Dung', '1987-09-27', '025628420', '2012-07-11', '79', NULL, NULL, 1, NULL, 0, NULL, 136, 8, NULL, '2021-05-20 07:03:23', '2021-05-20 07:03:23', NULL),
(169, 'Tran Minh Huy', '0906334833', 'vick_hs1987@yahoo.com', '785', '59 ca văn thỉnh', '1987-12-15', '025189441', '2015-07-07', '79', NULL, NULL, 1, NULL, 35, '2021-11-20', 137, 8, NULL, '2021-05-20 07:08:29', '2021-05-21 06:18:57', NULL),
(170, 'Phạm Đình Minh Hải', '0965151257', 'giaydabilly@gmail.com', '777', '29/18 đường số 20, P.BHHA', '1980-06-26', '079080008303', '2018-12-06', '79', NULL, NULL, 1, NULL, 22, '2021-12-01', 138, 8, NULL, '2021-05-20 08:18:21', '2021-06-04 01:30:21', NULL),
(171, 'Nguyễn minh trí', '0909309535', 'nguyentri2010@yahoo.com', '767', '16/24, b3', '1986-10-20', '086086000081', '2016-12-05', '79', NULL, NULL, 1, NULL, 7, '2021-11-26', 139, 8, NULL, '2021-05-21 01:53:44', '2021-05-27 03:09:04', NULL),
(172, 'Trần Hữu Lập', '0983886914', 'tranhuulap750601@gmail.com', '786', '12 Lô A, KDC Long Thới, Nhà Bè, Tp. HCM', '1975-06-01', '025054738', '2009-08-26', '79', NULL, NULL, 1, NULL, 8, '2021-11-21', 140, 8, NULL, '2021-05-21 03:47:12', '2021-05-24 02:47:55', NULL),
(173, 'Nguyen Ngoc Phuong', '0918306271', 'phuong.12a3@gmail.com', '761', 'E41 Duong C3, KP. 4, P. Tan Thoi Nhat', '1971-02-16', '025473622', '2013-06-24', '79', NULL, NULL, 1, NULL, 5, '2021-11-22', 141, 8, NULL, '2021-05-22 00:44:01', '2021-05-24 02:47:55', NULL),
(174, 'ĐẶNG QUỐC CƯỜNG', '0326666779', 'dangquoccuong1988@gmail.com', '763', '39 đường 265 phường hiệp phú , tp thủ đức', '1988-02-03', '331610193', '2018-04-02', '86', NULL, NULL, 1, NULL, 0, NULL, 142, 8, NULL, '2021-05-22 01:07:00', '2021-05-22 01:07:00', NULL),
(175, 'Nguyễn tôn hoà', '0913329410', 'nguyentonhoa2012@gmail.com', '778', '60 đường 85 Tân quy, Quận 7', '1970-05-07', '025005178', '2008-03-10', '79', NULL, NULL, 1, NULL, 0, NULL, 143, 8, NULL, '2021-05-22 02:12:15', '2021-05-22 02:12:15', NULL),
(176, 'Nguyễn Xuân Quyết', '0933406994', 'quyetx285@gmail.com', '771', '64 nguyễn giản thanh, phường 15', '1988-05-28', '001088026982', '2019-04-26', '79', NULL, NULL, 1, NULL, 9, '2021-11-22', 144, 8, NULL, '2021-05-22 02:47:42', '2021-05-24 02:47:55', NULL),
(177, 'Nguyen tan tai', '0915508527', 'tai.nguyent@wgroup.com.vn', '785', 'Vo van van', '1979-11-01', '311549568', '2011-08-22', '79', NULL, NULL, 1, NULL, 0, NULL, 145, 8, NULL, '2021-05-22 03:12:42', '2021-05-22 03:12:42', NULL),
(178, 'Trần Anh Tuấn', '0983132374', 'trantuan187@gmail.com', '767', '20/46 Hồ Đắc Di, phường Tây Thạnh', '1987-01-05', '079087002041', '2016-05-24', '79', NULL, NULL, 1, NULL, 3, '2021-11-22', 146, 8, NULL, '2021-05-22 07:06:56', '2021-05-24 02:47:55', NULL),
(179, 'Lê nho Quốc', '0989007282', 'Galaxy3110note5@gmail.com', '770', '420/8 Lê Văn Sỹ', '1976-07-27', '023162172', '2006-04-20', '79', NULL, NULL, 1, NULL, 12, '2021-11-22', 147, 8, NULL, '2021-05-22 07:20:58', '2021-05-24 02:47:55', NULL),
(180, 'Bùi Văn Giang', '0937366984', 'baokhang2303@gmail.com', '768', '200/22A Nguyễn Trọng Tuyển', '1984-06-21', '285066415', '2014-03-10', '79', NULL, NULL, 1, NULL, 6, '2021-11-22', 148, 8, NULL, '2021-05-22 07:41:46', '2021-05-24 02:47:55', NULL),
(181, 'Nguyễn Công Khán', '0903379761', 'congkhan@gmail.com', '761', '60J1 Đường DD7-1, P. Tân Hưng Thuận, Quận 12', '1977-07-30', '089077000120', '2019-09-11', '79', NULL, NULL, 1, NULL, 4, '2021-11-22', 149, 8, NULL, '2021-05-22 08:38:18', '2021-05-24 02:47:55', NULL),
(182, 'Nguyễn Việt Dũng', '0908512470', 'vietdung.86.bt@gmail.com', '724', 'Kp thông nhất', '1986-05-04', '260967527', '2012-05-25', '74', NULL, NULL, 1, NULL, 6, '2021-11-24', 150, 8, NULL, '2021-05-24 00:42:36', '2021-05-25 03:56:23', NULL),
(183, 'Hồ hưu tường', '0934129867', 'hohuutuong260788@gmail.com', '764', '310/15/29a dương quảng hàm phường 5 gò vấp', '1988-07-26', '351695542', '2017-02-15', '89', NULL, NULL, 1, NULL, 7, '2021-11-24', 151, 8, NULL, '2021-05-24 01:15:34', '2021-05-25 03:56:23', NULL),
(184, 'Đinh Văn Duy', '0901275745', 'khanhduyinfo@gmail.com', '761', '33/9 đông hưng thuận 21', '1985-11-28', '025181623', '2009-09-17', '79', NULL, NULL, 1, NULL, 4, '2021-11-24', 152, 8, NULL, '2021-05-24 01:32:45', '2021-05-25 03:56:22', NULL),
(185, 'Nguyen Thanh Kim', '0901493774', 'nguyenthanhkim092@gmail.com', '764', '280/28/4, phạm văn chiêu', '1965-10-10', '490052001229', '2020-10-22', '79', NULL, NULL, 1, NULL, 0, NULL, 153, 8, NULL, '2021-05-24 04:33:56', '2021-05-24 04:33:56', NULL),
(186, 'Phạm minh đạt', '0789201289', 'minhdat768@yahoo.com', '767', '138', '1989-12-20', '079089003499', '2016-10-20', '79', NULL, NULL, 1, NULL, 0, NULL, 154, 8, NULL, '2021-05-24 07:05:59', '2021-05-24 07:05:59', NULL),
(187, 'Võ Việt Lập', '0934012460', 'vietlap@labconn.com', '760', '10/19 Trần Nhật Duật, Q1', '1975-04-19', '079075006261', '2017-10-09', '79', NULL, NULL, 1, NULL, 0, NULL, 155, 8, NULL, '2021-05-25 00:45:39', '2021-05-25 00:45:39', NULL),
(188, 'Lai Đại Quang', '0901396836', 'stquang@gmail.com', '785', '40 đường 7A khu dân cư Camellia Garden', '1982-12-07', '095082000095', '2018-04-26', '79', NULL, NULL, 1, NULL, 4, '2021-11-25', 156, 8, NULL, '2021-05-25 02:03:32', '2021-05-26 02:24:43', NULL),
(189, 'Nguyễn Sơn Tùng', '0973678579', 'sontung2904@gmail.com', '765', 'số 98/5 đường Vạn Kiếp', '1985-04-29', '091085000302', '2020-04-16', '79', NULL, NULL, 1, NULL, 4, '2021-11-25', 157, 8, NULL, '2021-05-25 03:29:29', '2021-05-26 02:24:43', NULL),
(190, 'Nguyễn Duy Long', '0981779999', 'nguyenduylong2010@gmail.com', '766', '1002 Âu Cơ, Phường 14, Quận Tân Bình', '1986-11-12', '022086004870', '2019-01-17', '79', NULL, NULL, 1, NULL, 4, '2021-11-26', 158, 8, NULL, '2021-05-26 01:26:50', '2021-05-27 03:09:03', NULL),
(191, 'Đỗ minh vũ', '0967686959', 'vudohcm@gmail.com', '762', '27, Đường 22 Khu Phố 4', '1987-12-19', '145355408', '2001-05-29', '33', NULL, NULL, 1, NULL, 10, '2021-11-26', 159, 8, NULL, '2021-05-26 01:55:32', '2021-05-27 03:09:04', NULL),
(192, 'Trương Ngọc Khánh', '0902711885', 'khanhtruongmon82@gmail.com', '760', '137 Lê Thị Hồng Gấm', '1982-04-17', '023822206', '2011-04-14', '79', NULL, NULL, 1, NULL, 3, '2021-11-26', 160, 8, NULL, '2021-05-26 03:05:55', '2021-05-27 03:09:04', NULL),
(193, 'Phạm Duy Lân', '0903748343', 'benny672002@gmail.com', '769', 'Xa Lo Ha Noi, Estella 1a1801', '1974-10-11', '022714276', '2010-01-26', '79', NULL, NULL, 1, NULL, 0, NULL, 161, 8, NULL, '2021-05-27 01:55:46', '2021-05-27 01:55:46', NULL),
(194, 'Nguyễn ngọc nhẫn', '0367979739', 'kimtinan.739@gmail.com', '740', 'Long phú phước thái', '1985-12-25', '271736568', '2013-03-07', '75', NULL, NULL, 1, NULL, 0, NULL, 162, 8, NULL, '2021-05-27 02:39:40', '2021-05-27 02:39:40', NULL),
(195, 'Phạm Duy Khánh', '0773577899', 'black05mask@gmail.com', '775', '235 mai xuân thưởng', '1983-09-05', '023527572', '2014-01-08', '79', NULL, NULL, 1, NULL, 16, '2021-11-27', 163, 8, NULL, '2021-05-27 03:17:24', '2021-05-28 02:38:08', NULL),
(196, 'Nguyen su thien chuong', '0938103445', 'thienchuongns@gmail.com', '767', '40/8/7 tan thanh', '1981-02-09', '025765329', '2013-07-10', '79', NULL, NULL, 1, NULL, 12, '2021-11-27', 164, 8, NULL, '2021-05-27 07:07:33', '2021-05-28 02:38:08', NULL),
(197, 'Nguyễn tấn lộc', '0977383114', 'lethimongtuyen00@gmail.com', '760', '209 nguyễn thái bình Q1', '1975-04-26', '079075003676', '2011-06-29', '79', NULL, NULL, 1, NULL, 9, '2021-11-27', 165, 8, NULL, '2021-05-27 07:56:36', '2021-05-28 02:38:08', NULL),
(198, 'Duong hoang luon', '0376472304', 'toiluon1996@gmail.com', '765', 'Chung cu 234 phan van tri p11 binh thanh', '1996-11-04', '371725710', '2017-03-14', '91', NULL, NULL, 1, NULL, 18, '2021-11-28', 166, 8, NULL, '2021-05-28 03:14:44', '2021-05-31 03:46:16', NULL),
(199, 'Bùi Xuân Thắng', '0908606614', 'thangkhtn071@gmail.com', '786', 'C27 Kdc Trần Thái', '1985-01-30', '079085009362', '2017-07-07', '79', NULL, NULL, 1, NULL, 0, NULL, 167, 8, NULL, '2021-05-28 03:36:47', '2021-05-28 03:36:47', NULL),
(200, 'lê quốc hùng', '0913620026', 'quochung74lck@gmail.com', '760', '74 lê công kiều', '1971-01-23', 'i022640443', '2008-11-24', '79', NULL, NULL, 1, NULL, 5, '2021-11-28', 168, 8, NULL, '2021-05-28 08:29:42', '2021-05-31 03:46:16', NULL),
(201, 'Lê Minh Nguyện', '0888907886', 'leminhnguyen88@gmail.com', '761', '163A Trường Chinh,P. TTN, Q.12', '1988-11-07', '082088000394', '2020-02-18', '79', NULL, NULL, 1, NULL, 9, '2021-12-01', 169, 8, NULL, '2021-05-31 01:45:22', '2021-06-01 03:10:14', NULL),
(202, 'Huỳnh Văn Tính', '0903326405', 'hvtinh55@gmail.com', '766', '373/1/69D Lý Thường Kiệt, phường 9', '1955-11-16', '080055000065', '2016-07-06', '79', NULL, NULL, 1, NULL, 4, '2021-12-01', 170, 8, NULL, '2021-05-31 02:24:12', '2021-06-01 03:10:14', NULL),
(203, 'Nguyễn Trung Hiếu', '0946440084', 'hieuhuong0811@gmail.com', '773', 'B159/17a xóm chiếu', '1982-09-02', '079082003158', '2016-09-13', '79', NULL, NULL, 1, NULL, 0, NULL, 171, 8, NULL, '2021-05-31 05:52:40', '2021-05-31 05:52:40', NULL),
(204, 'Võ hoàng linh', '0933400400', 'dvhoanglinh2909@yahoo.com', '770', '274/3 nam kỳ khởi nghĩa', '1987-09-29', '024038071', '2011-09-11', '79', NULL, NULL, 1, NULL, 8, '2021-12-01', 172, 8, NULL, '2021-05-31 05:58:17', '2021-06-01 03:10:14', NULL),
(205, 'Nguyễn Phước Thiện', '0918929766', 'phuocthien2209@gmail.com', '785', '625/7a ql1a', '1983-09-22', '079083000292', '2015-12-31', '79', NULL, NULL, 1, NULL, 0, NULL, 173, 8, NULL, '2021-06-01 02:33:35', '2021-06-01 02:33:35', NULL),
(206, 'Phan lê minh', '0903572000', 'tieuauau@gmail.com', '777', '22 đường số 2 kdc vĩnh lộc', '1984-02-01', '225309794', '2013-09-14', '56', NULL, NULL, 1, NULL, 8, '2021-12-01', 174, 8, NULL, '2021-06-01 02:49:42', '2021-06-02 02:30:42', NULL),
(207, 'Trần Nguyễn Song Khánh', '0983447763', 'morpheusvn456@gmail.com', '768', '134/25A Đào Duy Anh P9 Phú Nhuận', '1980-09-18', '023312297', '2008-03-11', '79', NULL, NULL, 1, NULL, 4, '2021-12-02', 175, 8, NULL, '2021-06-02 07:55:50', '2021-06-03 02:10:20', NULL),
(208, 'Nguyễn thái hiệp', '0937345634', 'nthiep2014@gmail.com', '973', 'Ấp tắc biển', '1991-09-02', '381519283', '2018-02-23', '96', NULL, NULL, 1, NULL, 8, '2021-12-02', 176, 8, NULL, '2021-06-02 08:21:10', '2021-06-03 02:10:20', NULL),
(209, 'Nguyễn Thành Chung', '0986424812', 'trungt6886@gmail.com', '785', '100/1 tổ 3 kp 10 f tân chánh hiệp q12', '1968-11-29', '0750668000334', '2020-02-18', '79', NULL, NULL, 1, NULL, 4, '2021-12-03', 177, 8, NULL, '2021-06-03 02:27:00', '2021-06-04 02:11:40', NULL),
(210, 'LÊ PHI NGỌC', '0914879012', 'lephongocld@gmail.com', '676', 'Đống Đa, Nam Ban, Lâm Hà, Lâm Đồng', '1975-08-09', '250361145', '2016-03-31', '68', NULL, NULL, 1, NULL, 7, '2021-12-05', 178, 8, NULL, '2021-06-03 02:49:19', '2021-06-07 03:20:23', NULL),
(211, 'LÊ THỊ HẠO NHIÊN', '0974370321', 'lethihaonhien@gmail.com', '769', 'Căn hộ B4-T27.06, KDC Cao cấp Masteri Thảo Điền, Số 19 Xa Lộ Hà Nội, Q2, TP. HCM', '1990-07-11', '0261168114', '2005-01-01', '79', NULL, NULL, 2, NULL, 0, NULL, 179, 8, NULL, '2021-06-03 02:55:35', '2021-06-03 02:55:35', NULL),
(212, 'NGUYỄN VĂN TÝ', '0908409182', 'nguyenvanty@mail.com', '764', '294 Nguyễn Oanh, P17, Quận Gò Vấp, TP. HCM', '1958-08-05', '044058000457', '2005-01-01', '79', NULL, NULL, 1, NULL, 0, NULL, 180, 8, NULL, '2021-06-03 03:31:55', '2021-06-03 03:31:55', NULL),
(213, 'LE THI THUY', '0388899402', 'lethithuy@gmail.com', '833', 'ẤP An Trạch Đông, Xã Xuân Thới A, Mỏ Cày, Bến Tre', '1990-01-01', '321173171', '2005-01-01', '83', NULL, NULL, 2, NULL, 0, NULL, 181, 8, NULL, '2021-06-03 04:45:03', '2021-06-03 04:45:03', NULL),
(214, 'Nguyễn đại', '0909206393', 'dainguyen812012@gmail.com', '770', '308/20 CMT8', '1981-09-20', '023661236', '2014-08-19', '79', NULL, NULL, 1, NULL, 10, '2021-12-03', 182, 8, NULL, '2021-06-03 06:22:04', '2021-06-04 02:11:40', NULL),
(215, 'PHẠM MINH TRUNG', '0961532632', 'dkshopp7@gmail.com', '768', '95 Lầu 2, Lê Văn Sỹ, Phường 13, Quận Phú Nhuận, TP. HCM', '1991-07-18', '072091005848', '2005-01-01', '79', NULL, NULL, 1, NULL, 0, NULL, 183, 8, NULL, '2021-06-03 07:15:55', '2021-06-03 07:15:55', NULL),
(216, 'NGUYỄN THÀNH TÀI', '0988239379', 'taint.toc@gmail.com', '768', '80 Đào Duy Anh, Phường 09, Quận Phú Nhuận, TP. HCM', '1982-04-03', '079082013662', '2005-01-01', '79', NULL, NULL, 1, NULL, 0, NULL, 184, 8, NULL, '2021-06-03 07:19:27', '2021-06-03 07:19:27', NULL),
(217, 'TRẦN VĂN HIỆP', '0938771730', 'hiepvetinh@gmail.com', '783', 'ấp Phú An, Xã Phú Hòa Đông, Huyện Củ Chi, TP. HCM', '1972-10-01', '79072011581', '2018-12-27', '79', NULL, NULL, 1, NULL, 0, NULL, 185, 8, NULL, '2021-06-03 07:46:39', '2021-06-03 07:46:39', NULL),
(218, 'Phung quoc Thai', '0983979115', 'bsthai2552@gmail.com', '777', '198a Ma lo Binh tri Dong Binh tan', '1970-10-29', '079070010320', '2018-09-18', '79', NULL, NULL, 1, NULL, 7, '2021-12-03', 186, 8, NULL, '2021-06-03 09:30:09', '2021-06-04 02:11:40', NULL),
(219, 'Trần Kim Hải', '0908701964', 'trankimhai1964@gmail.com', '761', 'B413 tô ký, phường Đông Hưng Thuận', '1964-12-10', '021499184', '2014-08-04', '79', NULL, NULL, 1, NULL, 7, '2021-12-04', 187, 8, NULL, '2021-06-04 02:00:22', '2021-06-07 03:20:23', NULL),
(220, 'NGUYỄN HỮU TRÍ', '0911113300', 'congtycafethetown@gmail.com', '771', '525 Tô Hiến Thành P.14', '1881-06-04', '025218969', '2012-04-24', '79', NULL, NULL, 1, NULL, 0, NULL, 188, 8, NULL, '2021-06-04 06:58:45', '2021-06-04 06:58:45', NULL),
(221, 'Phan thanh trung', '0987098728', 'organtrung92@gmail.com', '802', 'Khu đô thị phúc an city.', '1991-01-18', '024285652', '2009-09-08', '79', NULL, NULL, 2, NULL, 11, '2021-12-04', 189, 8, NULL, '2021-06-04 07:16:34', '2021-06-07 03:20:23', NULL),
(222, 'NGŨ QUỐC DŨNG', '0778878807', 'o933386366@gmail.com', '774', '120/23 TRẦN BÌNH TRỌNG', '1977-08-12', '079077012811', '2020-02-26', '79', NULL, NULL, 1, NULL, 8, '2021-12-04', 190, 8, NULL, '2021-06-04 08:02:25', '2021-06-07 03:20:23', NULL),
(223, 'Nguyễn văn hiền', '0938176796', 'vanhien2605@gmail.com', '778', '36 nguyễn hữu thọ', '1985-05-26', '070085000083', '2017-03-01', '79', NULL, NULL, 1, NULL, 7, '2021-12-07', 191, 8, NULL, '2021-06-07 01:45:13', '2021-06-08 02:05:43', NULL),
(224, 'Thai Thanh Tan', '0902468941', 'aloneboy08051988@gmail.com', '772', '607/10 Ba Dinh P9 Q8', '1988-05-08', '024077280', '2011-11-15', '79', NULL, NULL, 1, NULL, 8, '2021-12-07', 192, 8, NULL, '2021-06-07 08:23:22', '2021-06-08 02:05:43', NULL),
(225, 'HUỲNH NGỌC HỚN', '0913686268', 'bshuynhngochon@gmail.com', '771', '266 Lý Thường Kiệt, P14, Q10', '1970-09-27', '025639296', '2012-05-30', '79', NULL, NULL, 1, NULL, 4, '2021-12-08', 193, 8, NULL, '2021-06-08 07:29:18', '2021-06-09 02:17:24', NULL),
(226, 'Nguyễn Thế Vinh', '0901321369', 'vincentnguyen2704@gmail.com', '762', '619/1 Tỉnh Lộ 43, P. Tam Bình', '1982-04-27', '023427637', '2010-10-25', '79', NULL, NULL, 1, NULL, 0, NULL, 194, 8, NULL, '2021-06-08 07:42:13', '2021-06-08 07:42:13', NULL),
(227, 'Đặng văn lịch', '0931858679', 'dangvanlich1985@gmail.com', '764', '79/83 Bùi Quang là', '1985-06-01', '036085007438', '2017-10-30', '36', NULL, NULL, 1, NULL, 4, '2021-12-09', 195, 8, NULL, '2021-06-09 02:16:03', '2021-06-10 02:26:43', NULL),
(228, 'Hoàng Hoài Đức', '0932056059', 'alehere2006@gmail.com', '766', '157 Cộng Hòa', '1985-07-16', '023913723', '2009-08-07', '79', NULL, NULL, 1, NULL, 0, NULL, 196, 8, NULL, '2021-06-09 02:29:46', '2021-06-09 02:29:46', NULL),
(229, 'Lương Vạn Thành', '0906614799', 'luongnguyenco.int@gmai.com', '768', '304/5 Nguyễn Thượng Hiền', '1977-10-30', '022994742', '2004-05-14', '79', NULL, NULL, 1, NULL, 6, '2021-12-09', 197, 8, NULL, '2021-06-09 03:14:23', '2021-06-10 02:26:43', NULL),
(230, 'Lý Văn Quỳnh', '0942225239', 'lyquynh130482@gmail.com', '784', '44/1ấp hậu lân xã bà Điểm', '1982-04-13', '090868542', '2016-03-28', '19', NULL, NULL, 1, NULL, 5, '2021-12-09', 198, 8, NULL, '2021-06-09 04:25:24', '2021-06-10 02:26:43', NULL),
(231, 'Nguyễn Huy Hoàng Sơn', '0326867592', 'hoangsonnguyenhuy@gmail.com', '766', '247/3 Nguyễn Thái bình', '1991-09-14', '001091033028', '2020-07-01', '79', NULL, NULL, 1, NULL, 13, '2021-12-09', 199, 8, NULL, '2021-06-09 07:09:03', '2021-06-10 02:26:43', NULL),
(232, 'Đặng Hữu Nghĩa', '0907981799', 'dhnghia981799@gmail.com', '771', '457/42 CMT8', '1979-09-21', '023168069', '2010-06-09', '79', NULL, NULL, 1, NULL, 0, NULL, 200, 8, NULL, '2021-06-10 07:17:27', '2021-06-10 07:17:27', NULL),
(233, 'Nguyễn đức hải', '0907817857', 'haibvpn@gmail.com', '766', '236A/1 Lê Văn Sỹ', '1965-06-06', '038065005629', '2018-10-01', '79', NULL, NULL, 1, NULL, 47, '2021-12-11', 201, 8, NULL, '2021-06-11 00:49:51', '2021-06-14 02:47:15', NULL),
(234, 'Phạm Thành Tín', '0984882528', 'thanhtin88@gmail.com', '784', '180/3b Ấp Tam Đông, xã Thới Tam Thôn', '1988-01-19', '271952621', '2013-06-24', '79', NULL, NULL, 1, NULL, 8, '2021-12-11', 202, 8, NULL, '2021-06-11 07:17:41', '2021-06-14 02:47:15', NULL),
(235, 'Phan Thế Khôi Nguyên', '0948558887', 'khoinguyen1410@gmail.com', '772', '1416 3/2', '1990-10-14', '079090022209', '2021-04-16', '79', NULL, NULL, 1, NULL, 7, '2021-12-11', 203, 8, NULL, '2021-06-11 07:27:22', '2021-06-14 02:47:15', NULL),
(236, 'Nguyen Song Thanh Hien', '0937598043', 'nguyensongthanhhien@gmail.com', '768', '343/46 phan xich long f1 phú nhuận', '1985-08-02', '290784709', '2008-08-20', '72', NULL, NULL, 1, NULL, 4, '2021-12-11', 204, 8, NULL, '2021-06-11 07:30:05', '2021-06-14 02:47:15', NULL),
(237, 'DƯƠNG VĂN BỔNG', '0979099216', 'duongvanbong.vietbac@gmail.com', '761', '79 Lâm Thị Hố', '1982-08-24', '091089608', '2014-06-05', '19', NULL, NULL, 1, NULL, 0, NULL, 205, 8, NULL, '2021-06-11 09:08:22', '2021-06-11 09:08:22', NULL),
(238, 'Nguyễn Minh Khôi', '0902620090', 'thuydemon@gmail.com', '776', '82/40 Dương Bá Trạc P2, Q8', '1990-02-26', '024348305', '2005-01-05', '79', NULL, NULL, 1, NULL, 4, '2021-12-12', 206, 8, NULL, '2021-06-12 01:43:58', '2021-06-14 02:47:15', NULL),
(239, 'Lý Trung Kiên', '0937728999', 'kien.ccb@gmail.com', '771', '629/57B CMT8, f15,', '1971-12-09', '033071001793', '2017-02-17', '79', NULL, NULL, 1, NULL, 16, '2021-12-12', 207, 8, NULL, '2021-06-12 03:30:18', '2021-06-14 02:47:15', NULL),
(240, 'Nguyễn Đồng Hải', '0938149634', 'nguyendongh@gmail.com', '778', 'Hưng Vượng 2, p. Tân Phong,q.7', '1973-05-07', '024397248', '2015-05-10', '79', NULL, NULL, 1, NULL, 7, '2021-12-12', 208, 8, NULL, '2021-06-12 06:57:10', '2021-06-14 02:47:15', NULL),
(241, 'Vũ Hoàng Nguyên', '0918604677', 'haidiepdinh@gmail.com', '771', '256 Lý Thường Kiệt F14', '1984-10-20', '023470467', '2014-04-19', '79', NULL, NULL, 1, NULL, 10, '2021-12-14', 209, 8, NULL, '2021-06-14 01:18:45', '2021-06-15 02:43:59', NULL),
(242, 'Trịnh xuân Điền', '0903554557', 'dientrinh.041185@gmail.com', '764', '91/9/5 nguyễn văn nghi', '1985-11-04', '024933942', '2008-05-05', '79', NULL, NULL, 1, NULL, 4, '2021-12-14', 210, 8, NULL, '2021-06-14 03:16:18', '2021-06-15 02:43:59', NULL),
(243, 'Đoàn Ái Quốc', '0918011007', 'doanaiquoc0402@gmail.com', '771', '594/33 sư vạn hạnh', '1981-02-04', '079081015525', '2021-04-15', '79', NULL, NULL, 1, NULL, 8, '2021-12-14', 211, 8, NULL, '2021-06-14 03:51:17', '2021-06-15 02:43:59', NULL),
(244, 'Nguyễn Quốc Phi', '0939078094', 'quocphi185@gmail.com', '767', '36 Lê Văn Phan, Phường Phú Thọ Hòa, quận Tân Phú', '1998-05-18', '241792962', '2014-10-09', '66', NULL, NULL, 1, NULL, 0, NULL, 212, 8, NULL, '2021-06-14 04:27:56', '2021-06-14 04:27:56', NULL),
(245, 'Trần Minh Tâm', '0903940939', 'tranminhtam939@gmail.com', '777', '600/12/9/13 kinh dương Vương, P.An Lạc', '1955-09-09', '096055000023', '2017-01-09', '79', NULL, NULL, 1, NULL, 5, '2021-12-15', 213, 8, NULL, '2021-06-15 01:41:02', '2021-06-16 02:24:46', NULL),
(246, 'Võ Xuân Tú', '0908589906', 'e.hoangminh@gmail.com', '739', 'Ấp 8 , xã Xuân Tây', '1983-07-19', '271505033', '2011-03-31', '75', NULL, NULL, 1, NULL, 22, '2021-12-15', 214, 8, NULL, '2021-06-15 03:23:44', '2021-06-16 02:24:46', NULL),
(247, 'nguyễn đại phú', '0902835027', 'nguyenphu1706@gmail.com', '785', '337/34 Lê Văn Sỹ, Phường 1, Quận Tân Bình', '1998-06-17', '079099007993', '2017-06-15', '79', NULL, NULL, 1, NULL, 8, '2021-12-15', 215, 8, NULL, '2021-06-15 06:15:30', '2021-06-16 02:24:46', NULL),
(248, 'Nguyễn Xuân Trung', '0908604325', 'xuantrung189@gmail.com', '765', '395/5 Lê Quang Định P5', '1990-09-18', '024347725', '2010-01-30', '79', NULL, NULL, 1, NULL, 0, NULL, 216, 8, NULL, '2021-06-15 08:46:33', '2021-06-15 08:46:33', NULL),
(249, 'Trần Hữu Nguyên Hảo', '0913916601', 'nguyenhaovn@yahoo.com', '768', '164A/8 Nguyen Van Troi street ,ward 8, Phu Nhuan', '1985-11-06', '023827526', '2015-04-07', '79', NULL, NULL, 1, NULL, 0, NULL, 217, 8, NULL, '2021-06-16 02:28:46', '2021-06-16 02:28:46', NULL),
(250, 'Nguyễn Minh Hoàng', '0938270785', 'minhhoangcc@gmail.com', '765', '188 Nguyễn Xí, F26, Q. Bình Thạnh', '1985-07-27', '024062505', '2013-09-27', '79', NULL, NULL, 1, NULL, 6, '2021-12-16', 218, 8, NULL, '2021-06-16 03:49:00', '2021-06-17 02:13:41', NULL),
(251, 'Tưởng Thiên Lý', '0907772782', 'tuongthienly@gmail.com', '767', '7 hoa bằng, tân sơn nhì', '1985-11-12', '023841091', '2011-09-05', '79', NULL, NULL, 1, NULL, 10, '2021-12-16', 219, 8, NULL, '2021-06-16 08:13:10', '2021-06-17 02:13:41', NULL),
(252, 'Trương Tấn Phát', '0909890528', 'truongtanphat0406@gmail.com', '777', '169 đường số 6', '1991-12-01', '024734030', '2007-07-23', '79', NULL, NULL, 1, NULL, 0, NULL, 220, 8, NULL, '2021-06-16 08:39:42', '2021-06-16 08:39:42', NULL),
(253, 'Nguyễn Thị Kim Hên', '0933118686', 'ptduc.binhthanh@gmail.com', '765', '264D Bạch Đằng, Phường 24', '1980-02-15', '023380524', '2010-04-10', '79', NULL, NULL, 2, NULL, 0, NULL, 221, 8, NULL, '2021-06-16 09:44:09', '2021-06-16 09:44:09', NULL),
(254, 'Trương Vĩnh Thọ', '0707949265', 'tho0500@caodangvietmy.edu.vn', '778', '159/20 Phạm Thế Hiển Phường 3 Quận 8', '1999-05-19', '025938335', '2014-07-18', '79', NULL, NULL, 1, NULL, 0, NULL, 222, 8, NULL, '2021-06-17 00:53:25', '2021-06-17 00:53:25', NULL),
(255, 'Lê Đức Hoài', '0909243832', 'leduchoai1975@gmail.com', '764', 'B501 cc khang gia p14', '1975-03-05', '171718036', '2015-08-19', '79', NULL, NULL, 1, NULL, 0, NULL, 223, 8, NULL, '2021-06-17 01:50:25', '2021-06-17 01:50:25', NULL),
(256, 'nguyễn văn xiêm', '0986786763', 'thienphusondong@gmail.com', '277', 'tiên phương', '1980-09-18', '111605725', '2012-04-21', '1', NULL, NULL, 1, NULL, 0, NULL, 224, 8, NULL, '2021-06-17 03:28:08', '2021-06-17 03:28:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` bigint(25) UNSIGNED NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `province_id` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `website` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `logo` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `longitude` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `latitude` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `creator` mediumint(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `phone`, `email`, `province_id`, `address`, `website`, `logo`, `longitude`, `latitude`, `creator`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Suzuki Việt Anh', '0932 273 435', NULL, NULL, 'Km14+600, Quốc lộ 6, P. Yên Nghĩa, Hà Đông, Hà Nội', 'http://suzukivietanh.vn', NULL, '105.7607978', '20.959263', NULL, '2020-03-26 09:35:21', NULL, NULL),
(2, 'Thịnh Hưng', '0911 858 001', NULL, NULL, '456A Nguyễn Hữu Thọ, P. Khuê Trung, Q. Cẩm Lệ, Đà Nẵng', 'https://suzukidanang.com.vn', NULL, '108.2084816', '16.0315324', NULL, '2020-03-26 09:36:39', NULL, NULL),
(3, 'Vân Đạo - Thái Nguyên', '0988 302 882', NULL, NULL, 'Km5, Đường CMT8, Tp. Thái Nguyên', 'https://suzukivandao.com', NULL, '105.8514929', '21.5310361', NULL, '2020-03-26 09:37:49', NULL, NULL),
(4, 'Trọng Thiện - Hải Phòng', '0911 908 988', NULL, NULL, 'Khu Đô Thị Mới Sở Dầu, P. Sở Dầu, Hồng Bàng, Hải Phòng', 'https://suzukitrongthien.com', NULL, '106.6561964', '20.8645711', NULL, '2020-03-26 09:38:44', NULL, NULL),
(5, 'An Việt', '0901 783 583', NULL, NULL, 'Km12+300, QL1A, Vĩnh Quỳnh, H. Thanh Trì, Hà Nội', 'http://suzuki-anviet.com', NULL, '105.8468224', '20.9321872', NULL, '2020-03-26 09:39:40', NULL, NULL),
(7, 'Sài Gòn Ngôi Sao', '0936 311 318', NULL, NULL, '510 Quốc Lộ 13, P. Hiệp Bình Phước, Q. Thủ Đức, Tp.HCM', 'https://saigonngoisao.com.vn', NULL, '106.7175594', '10.8415432', NULL, '2020-03-26 09:41:25', NULL, NULL),
(8, 'Suzuki World', '0909 903 282', NULL, NULL, '2 Phổ Quang, P. 2, Q. Tân Bình, Tp.HCM', 'http://suzuki-world.com.vn', NULL, '106.6662279', '10.8029984', NULL, '2020-03-26 09:42:00', '2021-04-13 04:04:13', NULL),
(9, 'Quảng Bình', '0943 112 255', NULL, NULL, 'QL1A - Quang Trung, Phú Hải, Đồng Hới, Quảng Bình', 'https://suzukiquangbinh.com.vn', NULL, '106.6247677', '17.4618594', NULL, '2020-03-26 09:42:49', NULL, NULL),
(10, 'Thanh Hóa', '0912 293 389', NULL, NULL, 'Số 631B Lê Lai, P. Quảng Hưng, Tp. Thanh Hóa', 'http://suzukithanhhoa.com.vn', NULL, '105.8026837', '19.7860441', NULL, '2020-03-26 09:43:33', NULL, NULL),
(11, 'Huy Phương', '0913 291 525', NULL, NULL, 'Khu Thương mại, Đ. Võ Nguyên Giáp, P. Hoàng Diệu, Tp. Thái Bình, Tỉnh Thái Bình', 'https://suzukihuyphuong.com.vn/', NULL, '106.3595641', '20.4691646', NULL, '2020-03-26 09:44:08', NULL, NULL),
(12, 'NISU - Long Biên', '0948 316 868', NULL, NULL, '449 Nguyễn Văn Linh, Phúc Đồng, Long Biên, Hà Nội', 'http://www.suzukilongbien.vn', NULL, '105.9054833', '21.0345271', NULL, '2020-03-26 09:44:44', NULL, NULL),
(13, 'Hồng Phương', '0909 275 011', NULL, NULL, '1950 Võ Văn Kiệt, P. An Lạc, Q. Bình Tân, Tp.HCM', 'http://suzukihongphuong.vn', NULL, '106.6128798', '10.7231953', NULL, '2020-03-26 09:45:17', NULL, NULL),
(14, 'Việt Nhật', '0913 797 051', NULL, NULL, 'Số 01, Xa lộ Hà Nội, Khu phố 5B, P. Tân Biên, Biên Hòa, Đồng Nai', 'https://www.suzukivietnhat.com', NULL, '106.8876168', '10.9670728', NULL, '2020-03-26 09:45:59', NULL, NULL),
(15, 'Cầu Giấy', '0936 318 958', NULL, NULL, '171 Xuân Thủy, P. Dịch Vọng Hậu, Q. Cầu Giấy, Hà Nội', 'https://otocaugiay.vn', NULL, '105.785736', '21.0359788', NULL, '2020-04-17 21:29:42', NULL, NULL),
(16, 'Quý Hạnh', ' 0903 412 219', NULL, NULL, 'QL3, Phù Lỗ, Sóc Sơn, Hà Nội', 'http://suzukiquyhanh.com.vn', NULL, '105.8485851', '21.1988746', NULL, '2020-04-17 21:33:01', NULL, NULL),
(18, 'Hùng Phượng - Bắc Giang', '0944 630 666', NULL, NULL, 'Cụm CN Dĩnh Kế, Thôn Riễu, Xã Dĩnh Trì, Tp. Bắc Giang, Tỉnh Bắc Giang', 'http://suzukibacgiang.com', NULL, '106.2198553', '21.2815841', NULL, '2020-04-17 21:36:47', NULL, NULL),
(19, 'Việt Pháp', '0913 272 743', NULL, NULL, 'Số 5B Nguyễn Trãi, Tp. Vinh, Nghệ An', 'http://suzukivinh.com.vn', NULL, '105.6734214', '18.7015449', NULL, '2020-06-02 07:35:30', NULL, NULL),
(20, 'Quốc Di', '0916 205 279', NULL, NULL, '391 Đường 23/10, Vĩnh Hiệp, Nha Trang', '', NULL, '109.168502', '12.254751', NULL, '2020-06-02 07:36:40', NULL, NULL),
(21, 'Hưng Vượng', '0912 206 002', NULL, NULL, 'Số 01, KP6, Liên Nghĩa, Đức Trọng, Lâm Đồng', 'http://suzukidalat.com', NULL, '108.3944389', '11.7568881', NULL, '2020-06-02 07:38:03', NULL, NULL),
(22, 'Nam Á', '1900 8034', NULL, NULL, '63 Đại Lộ Bình Dương, P. Hiệp Thành, Tp. Thủ Dầu Một, Bình Dương', 'https://suzukinama.vn', NULL, '106.6545917', '10.9933936', NULL, '2020-06-02 07:38:48', NULL, NULL),
(23, 'Đại Việt', '0934 078 991', NULL, NULL, '438 Nguyễn Duy Trinh, P. Bình Trưng Đông, Quận 2, Tp.HCM', 'https://suzukidaiviet.com.vn', NULL, '106.7778003', '10.7887525', NULL, '2020-06-02 07:39:37', NULL, NULL),
(24, 'Đại Lợi Vĩnh Long', '0703 915 999', NULL, NULL, '116, QL1A, Tân Xuân, Tân Ngãi, Vĩnh Long', 'http://suzukidailoivinhlong.com.vn', NULL, '105.926242', '10.262651', NULL, '2020-06-02 07:41:28', NULL, NULL),
(25, 'Tây Đô Cần Thơ', '0939 173 866', NULL, NULL, '86 Lê Hồng Phong, P. Trà An, Q. Bình Thủy, Tp. Cần Thơ', 'https://suzukitaydo.com', NULL, '105.7344824', '10.0857758', NULL, '2020-06-02 07:42:59', NULL, NULL),
(26, 'Ngọc Anh', '0948 868 339', NULL, NULL, '111 Lý Thường Kiệt, Phường 6, Tp. Cà Mau', 'http://suzukicamau.vn', NULL, '105.155981', '9.173502', NULL, '2020-06-02 07:43:41', NULL, NULL),
(27, 'Thịnh Phát', '0937 969 955', NULL, NULL, '3718B QL51, P. Phước Trung, Tp. Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu', 'https://suzukivungtau.com.vn', NULL, '107.1725815', '10.4807655', NULL, '2020-06-08 08:58:36', NULL, NULL),
(28, 'Việt Đức', '0903 443 097', NULL, NULL, 'Km50+500, QL5A, An Định, P. Cẩm Thượng, Tp. Hải Dương, Hải Dương', 'https://suzukihaiduong.com', NULL, '106.3133744', '20.9484671', NULL, '2020-06-17 02:03:05', NULL, NULL),
(30, 'Tây Nguyên', '0858 698 798', NULL, NULL, '159 Nguyễn Chí Thanh, P. Tân An, Tp. Buôn Mê Thuột, Đắk Lắk', 'https://suzukitaynguyen.vn', NULL, '108.0806395', '12.7068903', NULL, '2020-06-25 07:16:41', NULL, NULL),
(31, 'Việt Long', '0904 138 039', NULL, NULL, '936 Quốc lộ 1A, P. Thạnh Xuân, Q.12, Tp.HCM', 'http://www.suzukivietlong.com.vn', NULL, '106.6691619', '10.8623147', NULL, '2020-06-25 07:18:16', NULL, NULL),
(32, 'SODINHA Quảng Trị', '0986 325 999', NULL, NULL, 'Km753, QL1A, Cam Thanh, Cam Lộ, Quảng Trị', '', NULL, '107.0791302', '16.8500562', NULL, '2020-07-15 06:29:09', NULL, NULL),
(33, 'Cẩm Phong - Sóc Trăng', '0961 714 888', NULL, NULL, '179 QL1A, Phụng Hiệp, An Hiệp, Châu Thành, Sóc Trăng', 'http://suzukisoctrang.com', NULL, '105.9603721', '9.623105599999999', NULL, '2020-07-22 10:09:31', NULL, NULL),
(34, 'Vinh Tùng', '0948 383 336', NULL, NULL, 'Đường Tây Sơn (Quốc lộ 1D), Tổ 9, KV8, P. Nhơn Phú, Tp. Quy Nhơn, Bình Định', 'https://suzukivinhtung.com.vn', NULL, '109.194763', '13.768286', NULL, '2020-07-31 08:22:38', NULL, NULL),
(35, 'Tây Đô Kiên Giang', '0939 173 866', NULL, NULL, '68 Võ Văn Kiệt, Xã Thạnh Lộc, Châu Thành, Kiên Giang', 'https://suzukitaydo.com', NULL, '105.112016', '10.008299', NULL, '2020-08-03 00:49:03', NULL, NULL),
(36, 'Song Hào', '0938 244 772', NULL, NULL, '20/04 Trần Hưng Đạo, Mỹ Quý, Tp. Long Xuyên, An Giang', 'https://suzukiangiang.com.vn', NULL, '105.452331', '10.362017', NULL, '2020-08-05 02:28:39', NULL, NULL),
(37, 'Vân Đạo - Hà Nội', '0988 302 882', NULL, NULL, 'Đường 32, Khu Công nghiệp Lai Xá, Kim Chung, Hoài Đức, Hà Nội', 'https://suzukivandao.com', NULL, '105.725680', '21.059726', NULL, '2020-08-05 02:36:16', NULL, NULL),
(38, 'Hoàng Hiền', '0868 950 999', NULL, NULL, '285 Phạm Bạch Hổ, P. Hiến Nam, Hưng Yên', 'http://suzukihoanghien.vn', NULL, '106.051613', '20.665170', NULL, '2020-08-14 01:02:58', NULL, NULL),
(39, 'NISU - Hưng Yên', '0902 233 516', NULL, NULL, '1018 Nguyễn Văn Linh, Tổ dân phố Đọ, P. Bạch Sam, TX. Mỹ Hào, Hưng Yên', 'http://www.suzukihungyen.vn', NULL, '106.104726', '20.915777', NULL, '2020-08-14 01:07:02', NULL, NULL),
(40, 'Đại Lợi TP. HCM', NULL, NULL, '79', 'Trường Chinh, Tân Phú', NULL, NULL, NULL, NULL, NULL, '2021-04-26 02:52:09', '2021-04-26 06:13:16', NULL),
(400015, 'Suzuki Phổ Quang', '0', '@', '766', 'Số 02, Ðường Phổ Quang, Phường 02, Quận Tân Bình, Thành Phố Hồ Chí Minh', 'www.', 'default.jpg', '0', '0', 8388607, '2020-10-09 09:06:07', '2021-04-12 01:02:48', '2021-04-12 01:02:48');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` varchar(25) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name_with_type` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `province_id` varchar(25) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `name_with_type`, `province_id`, `created_at`, `updated_at`) VALUES
('1', 'Ba Đình', 'Quận Ba Đình', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('100', 'Điện Biên', 'Huyện Điện Biên', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('101', 'Điện Biên Đông', 'Huyện Điện Biên Đông', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('102', 'Mường Ảng', 'Huyện Mường Ảng', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('103', 'Nậm Pồ', 'Huyện Nậm Pồ', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('105', 'Lai Châu', 'Thành phố Lai Châu', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('106', 'Tam Đường', 'Huyện Tam Đường', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('107', 'Mường Tè', 'Huyện Mường Tè', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('108', 'Sìn Hồ', 'Huyện Sìn Hồ', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('109', 'Phong Thổ', 'Huyện Phong Thổ', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('110', 'Than Uyên', 'Huyện Than Uyên', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('111', 'Tân Uyên', 'Huyện Tân Uyên', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('112', 'Nậm Nhùn', 'Huyện Nậm Nhùn', '12', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('116', 'Sơn La', 'Thành phố Sơn La', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('118', 'Quỳnh Nhai', 'Huyện Quỳnh Nhai', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('119', 'Thuận Châu', 'Huyện Thuận Châu', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('120', 'Mường La', 'Huyện Mường La', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('121', 'Bắc Yên', 'Huyện Bắc Yên', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('122', 'Phù Yên', 'Huyện Phù Yên', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('123', 'Mộc Châu', 'Huyện Mộc Châu', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('124', 'Yên Châu', 'Huyện Yên Châu', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('125', 'Mai Sơn', 'Huyện Mai Sơn', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('126', 'Sông Mã', 'Huyện Sông Mã', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('127', 'Sốp Cộp', 'Huyện Sốp Cộp', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('128', 'Vân Hồ', 'Huyện Vân Hồ', '14', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('132', 'Yên Bái', 'Thành phố Yên Bái', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('133', 'Nghĩa Lộ', 'Thị xã Nghĩa Lộ', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('135', 'Lục Yên', 'Huyện Lục Yên', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('136', 'Văn Yên', 'Huyện Văn Yên', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('137', 'Mù Căng Chải', 'Huyện Mù Căng Chải', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('138', 'Trấn Yên', 'Huyện Trấn Yên', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('139', 'Trạm Tấu', 'Huyện Trạm Tấu', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('140', 'Văn Chấn', 'Huyện Văn Chấn', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('141', 'Yên Bình', 'Huyện Yên Bình', '15', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('148', 'Hòa Bình', 'Thành phố Hòa Bình', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('150', 'Đà Bắc', 'Huyện Đà Bắc', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('151', 'Kỳ Sơn', 'Huyện Kỳ Sơn', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('152', 'Lương Sơn', 'Huyện Lương Sơn', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('153', 'Kim Bôi', 'Huyện Kim Bôi', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('154', 'Cao Phong', 'Huyện Cao Phong', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('155', 'Tân Lạc', 'Huyện Tân Lạc', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('156', 'Mai Châu', 'Huyện Mai Châu', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('157', 'Lạc Sơn', 'Huyện Lạc Sơn', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('158', 'Yên Thủy', 'Huyện Yên Thủy', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('159', 'Lạc Thủy', 'Huyện Lạc Thủy', '17', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('16', 'Sóc Sơn', 'Huyện Sóc Sơn', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('164', 'Thái Nguyên', 'Thành phố Thái Nguyên', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('165', 'Sông Công', 'Thành phố Sông Công', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('167', 'Định Hóa', 'Huyện Định Hóa', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('168', 'Phú Lương', 'Huyện Phú Lương', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('169', 'Đồng Hỷ', 'Huyện Đồng Hỷ', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('17', 'Đông Anh', 'Huyện Đông Anh', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('170', 'Võ Nhai', 'Huyện Võ Nhai', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('171', 'Đại Từ', 'Huyện Đại Từ', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('172', 'Phổ Yên', 'Thị xã Phổ Yên', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('173', 'Phú Bình', 'Huyện Phú Bình', '19', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('178', 'Lạng Sơn', 'Thành phố Lạng Sơn', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('18', 'Gia Lâm', 'Huyện Gia Lâm', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('180', 'Tràng Định', 'Huyện Tràng Định', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('181', 'Bình Gia', 'Huyện Bình Gia', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('182', 'Văn Lãng', 'Huyện Văn Lãng', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('183', 'Cao Lộc', 'Huyện Cao Lộc', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('184', 'Văn Quan', 'Huyện Văn Quan', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('185', 'Bắc Sơn', 'Huyện Bắc Sơn', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('186', 'Hữu Lũng', 'Huyện Hữu Lũng', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('187', 'Chi Lăng', 'Huyện Chi Lăng', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('188', 'Lộc Bình', 'Huyện Lộc Bình', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('189', 'Đình Lập', 'Huyện Đình Lập', '20', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('19', 'Nam Từ Liêm', 'Quận Nam Từ Liêm', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('193', 'Hạ Long', 'Thành phố Hạ Long', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('194', 'Móng Cái', 'Thành phố Móng Cái', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('195', 'Cẩm Phả', 'Thành phố Cẩm Phả', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('196', 'Uông Bí', 'Thành phố Uông Bí', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('198', 'Bình Liêu', 'Huyện Bình Liêu', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('199', 'Tiên Yên', 'Huyện Tiên Yên', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('2', 'Hoàn Kiếm', 'Quận Hoàn Kiếm', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('20', 'Thanh Trì', 'Huyện Thanh Trì', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('200', 'Đầm Hà', 'Huyện Đầm Hà', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('201', 'Hải Hà', 'Huyện Hải Hà', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('202', 'Ba Chẽ', 'Huyện Ba Chẽ', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('203', 'Vân Đồn', 'Huyện Vân Đồn', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('204', 'Hoành Bồ', 'Huyện Hoành Bồ', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('205', 'Đông Triều', 'Thị xã Đông Triều', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('206', 'Quảng Yên', 'Thị xã Quảng Yên', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('207', 'Cô Tô', 'Huyện Cô Tô', '22', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('21', 'Bắc Từ Liêm', 'Quận Bắc Từ Liêm', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('213', 'Bắc Giang', 'Thành phố Bắc Giang', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('215', 'Yên Thế', 'Huyện Yên Thế', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('216', 'Tân Yên', 'Huyện Tân Yên', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('217', 'Lạng Giang', 'Huyện Lạng Giang', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('218', 'Lục Nam', 'Huyện Lục Nam', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('219', 'Lục Ngạn', 'Huyện Lục Ngạn', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('220', 'Sơn Động', 'Huyện Sơn Động', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('221', 'Yên Dũng', 'Huyện Yên Dũng', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('222', 'Việt Yên', 'Huyện Việt Yên', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('223', 'Hiệp Hòa', 'Huyện Hiệp Hòa', '24', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('227', 'Việt Trì', 'Thành phố Việt Trì', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('228', 'Phú Thọ', 'Thị xã Phú Thọ', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('230', 'Đoan Hùng', 'Huyện Đoan Hùng', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('231', 'Hạ Hoà', 'Huyện Hạ Hoà', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('232', 'Thanh Ba', 'Huyện Thanh Ba', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('233', 'Phù Ninh', 'Huyện Phù Ninh', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('234', 'Yên Lập', 'Huyện Yên Lập', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('235', 'Cẩm Khê', 'Huyện Cẩm Khê', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('236', 'Tam Nông', 'Huyện Tam Nông', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('237', 'Lâm Thao', 'Huyện Lâm Thao', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('238', 'Thanh Sơn', 'Huyện Thanh Sơn', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('239', 'Thanh Thuỷ', 'Huyện Thanh Thuỷ', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('24', 'Hà Giang', 'Thành phố Hà Giang', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('240', 'Tân Sơn', 'Huyện Tân Sơn', '25', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('243', 'Vĩnh Yên', 'Thành phố Vĩnh Yên', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('244', 'Phúc Yên', 'Thị xã Phúc Yên', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('246', 'Lập Thạch', 'Huyện Lập Thạch', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('247', 'Tam Dương', 'Huyện Tam Dương', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('248', 'Tam Đảo', 'Huyện Tam Đảo', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('249', 'Bình Xuyên', 'Huyện Bình Xuyên', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('250', 'Mê Linh', 'Huyện Mê Linh', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('251', 'Yên Lạc', 'Huyện Yên Lạc', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('252', 'Vĩnh Tường', 'Huyện Vĩnh Tường', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('253', 'Sông Lô', 'Huyện Sông Lô', '26', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('256', 'Bắc Ninh', 'Thành phố Bắc Ninh', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('258', 'Yên Phong', 'Huyện Yên Phong', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('259', 'Quế Võ', 'Huyện Quế Võ', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('26', 'Đồng Văn', 'Huyện Đồng Văn', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('260', 'Tiên Du', 'Huyện Tiên Du', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('261', 'Từ Sơn', 'Thị xã Từ Sơn', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('262', 'Thuận Thành', 'Huyện Thuận Thành', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('263', 'Gia Bình', 'Huyện Gia Bình', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('264', 'Lương Tài', 'Huyện Lương Tài', '27', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('268', 'Hà Đông', 'Quận Hà Đông', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('269', 'Sơn Tây', 'Thị xã Sơn Tây', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('27', 'Mèo Vạc', 'Huyện Mèo Vạc', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('271', 'Ba Vì', 'Huyện Ba Vì', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('272', 'Phúc Thọ', 'Huyện Phúc Thọ', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('273', 'Đan Phượng', 'Huyện Đan Phượng', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('274', 'Hoài Đức', 'Huyện Hoài Đức', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('275', 'Quốc Oai', 'Huyện Quốc Oai', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('276', 'Thạch Thất', 'Huyện Thạch Thất', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('277', 'Chương Mỹ', 'Huyện Chương Mỹ', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('278', 'Thanh Oai', 'Huyện Thanh Oai', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('279', 'Thường Tín', 'Huyện Thường Tín', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('28', 'Yên Minh', 'Huyện Yên Minh', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('280', 'Phú Xuyên', 'Huyện Phú Xuyên', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('281', 'Ứng Hòa', 'Huyện Ứng Hòa', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('282', 'Mỹ Đức', 'Huyện Mỹ Đức', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('288', 'Hải Dương', 'Thành phố Hải Dương', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('29', 'Quản Bạ', 'Huyện Quản Bạ', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('290', 'Chí Linh', 'Thị xã Chí Linh', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('291', 'Nam Sách', 'Huyện Nam Sách', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('292', 'Kinh Môn', 'Huyện Kinh Môn', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('293', 'Kim Thành', 'Huyện Kim Thành', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('294', 'Thanh Hà', 'Huyện Thanh Hà', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('295', 'Cẩm Giàng', 'Huyện Cẩm Giàng', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('296', 'Bình Giang', 'Huyện Bình Giang', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('297', 'Gia Lộc', 'Huyện Gia Lộc', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('298', 'Tứ Kỳ', 'Huyện Tứ Kỳ', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('299', 'Ninh Giang', 'Huyện Ninh Giang', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('3', 'Tây Hồ', 'Quận Tây Hồ', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('30', 'Vị Xuyên', 'Huyện Vị Xuyên', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('300', 'Thanh Miện', 'Huyện Thanh Miện', '30', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('303', 'Hồng Bàng', 'Quận Hồng Bàng', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('304', 'Ngô Quyền', 'Quận Ngô Quyền', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('305', 'Lê Chân', 'Quận Lê Chân', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('306', 'Hải An', 'Quận Hải An', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('307', 'Kiến An', 'Quận Kiến An', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('308', 'Đồ Sơn', 'Quận Đồ Sơn', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('309', 'Dương Kinh', 'Quận Dương Kinh', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('31', 'Bắc Mê', 'Huyện Bắc Mê', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('311', 'Thuỷ Nguyên', 'Huyện Thuỷ Nguyên', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('312', 'An Dương', 'Huyện An Dương', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('313', 'An Lão', 'Huyện An Lão', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('314', 'Kiến Thuỵ', 'Huyện Kiến Thuỵ', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('315', 'Tiên Lãng', 'Huyện Tiên Lãng', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('316', 'Vĩnh Bảo', 'Huyện Vĩnh Bảo', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('317', 'Cát Hải', 'Huyện Cát Hải', '31', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('32', 'Hoàng Su Phì', 'Huyện Hoàng Su Phì', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('323', 'Hưng Yên', 'Thành phố Hưng Yên', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('325', 'Văn Lâm', 'Huyện Văn Lâm', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('326', 'Văn Giang', 'Huyện Văn Giang', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('327', 'Yên Mỹ', 'Huyện Yên Mỹ', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('328', 'Mỹ Hào', 'Huyện Mỹ Hào', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('329', 'Ân Thi', 'Huyện Ân Thi', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('33', 'Xín Mần', 'Huyện Xín Mần', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('330', 'Khoái Châu', 'Huyện Khoái Châu', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('331', 'Kim Động', 'Huyện Kim Động', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('332', 'Tiên Lữ', 'Huyện Tiên Lữ', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('333', 'Phù Cừ', 'Huyện Phù Cừ', '33', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('336', 'Thái Bình', 'Thành phố Thái Bình', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('338', 'Quỳnh Phụ', 'Huyện Quỳnh Phụ', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('339', 'Hưng Hà', 'Huyện Hưng Hà', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('34', 'Bắc Quang', 'Huyện Bắc Quang', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('340', 'Đông Hưng', 'Huyện Đông Hưng', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('341', 'Thái Thụy', 'Huyện Thái Thụy', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('342', 'Tiền Hải', 'Huyện Tiền Hải', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('343', 'Kiến Xương', 'Huyện Kiến Xương', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('344', 'Vũ Thư', 'Huyện Vũ Thư', '34', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('347', 'Phủ Lý', 'Thành phố Phủ Lý', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('349', 'Duy Tiên', 'Huyện Duy Tiên', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('35', 'Quang Bình', 'Huyện Quang Bình', '2', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('350', 'Kim Bảng', 'Huyện Kim Bảng', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('351', 'Thanh Liêm', 'Huyện Thanh Liêm', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('352', 'Bình Lục', 'Huyện Bình Lục', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('353', 'Lý Nhân', 'Huyện Lý Nhân', '35', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('356', 'Nam Định', 'Thành phố Nam Định', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('358', 'Mỹ Lộc', 'Huyện Mỹ Lộc', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('359', 'Vụ Bản', 'Huyện Vụ Bản', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('360', 'Ý Yên', 'Huyện Ý Yên', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('361', 'Nghĩa Hưng', 'Huyện Nghĩa Hưng', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('362', 'Nam Trực', 'Huyện Nam Trực', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('363', 'Trực Ninh', 'Huyện Trực Ninh', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('364', 'Xuân Trường', 'Huyện Xuân Trường', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('365', 'Giao Thủy', 'Huyện Giao Thủy', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('366', 'Hải Hậu', 'Huyện Hải Hậu', '36', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('369', 'Ninh Bình', 'Thành phố Ninh Bình', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('370', 'Tam Điệp', 'Thành phố Tam Điệp', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('372', 'Nho Quan', 'Huyện Nho Quan', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('373', 'Gia Viễn', 'Huyện Gia Viễn', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('374', 'Hoa Lư', 'Huyện Hoa Lư', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('375', 'Yên Khánh', 'Huyện Yên Khánh', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('376', 'Kim Sơn', 'Huyện Kim Sơn', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('377', 'Yên Mô', 'Huyện Yên Mô', '37', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('380', 'Thanh Hóa', 'Thành phố Thanh Hóa', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('381', 'Bỉm Sơn', 'Thị xã Bỉm Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('382', 'Sầm Sơn', 'Thành phố Sầm Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('384', 'Mường Lát', 'Huyện Mường Lát', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('385', 'Quan Hóa', 'Huyện Quan Hóa', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('386', 'Bá Thước', 'Huyện Bá Thước', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('387', 'Quan Sơn', 'Huyện Quan Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('388', 'Lang Chánh', 'Huyện Lang Chánh', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('389', 'Ngọc Lặc', 'Huyện Ngọc Lặc', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('390', 'Cẩm Thủy', 'Huyện Cẩm Thủy', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('391', 'Thạch Thành', 'Huyện Thạch Thành', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('392', 'Hà Trung', 'Huyện Hà Trung', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('393', 'Vĩnh Lộc', 'Huyện Vĩnh Lộc', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('394', 'Yên Định', 'Huyện Yên Định', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('395', 'Thọ Xuân', 'Huyện Thọ Xuân', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('396', 'Thường Xuân', 'Huyện Thường Xuân', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('397', 'Triệu Sơn', 'Huyện Triệu Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('398', 'Thiệu Hóa', 'Huyện Thiệu Hóa', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('399', 'Hoằng Hóa', 'Huyện Hoằng Hóa', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('4', 'Long Biên', 'Quận Long Biên', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('40', 'Cao Bằng', 'Thành phố Cao Bằng', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('400', 'Hậu Lộc', 'Huyện Hậu Lộc', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('401', 'Nga Sơn', 'Huyện Nga Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('402', 'Như Xuân', 'Huyện Như Xuân', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('403', 'Như Thanh', 'Huyện Như Thanh', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('404', 'Nông Cống', 'Huyện Nông Cống', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('405', 'Đông Sơn', 'Huyện Đông Sơn', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('406', 'Quảng Xương', 'Huyện Quảng Xương', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('407', 'Tĩnh Gia', 'Huyện Tĩnh Gia', '38', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('412', 'Vinh', 'Thành phố Vinh', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('413', 'Cửa Lò', 'Thị xã Cửa Lò', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('414', 'Thái Hoà', 'Thị xã Thái Hoà', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('415', 'Quế Phong', 'Huyện Quế Phong', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('416', 'Quỳ Châu', 'Huyện Quỳ Châu', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('417', 'Kỳ Sơn', 'Huyện Kỳ Sơn', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('418', 'Tương Dương', 'Huyện Tương Dương', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('419', 'Nghĩa Đàn', 'Huyện Nghĩa Đàn', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('42', 'Bảo Lâm', 'Huyện Bảo Lâm', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('420', 'Quỳ Hợp', 'Huyện Quỳ Hợp', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('421', 'Quỳnh Lưu', 'Huyện Quỳnh Lưu', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('422', 'Con Cuông', 'Huyện Con Cuông', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('423', 'Tân Kỳ', 'Huyện Tân Kỳ', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('424', 'Anh Sơn', 'Huyện Anh Sơn', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('425', 'Diễn Châu', 'Huyện Diễn Châu', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('426', 'Yên Thành', 'Huyện Yên Thành', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('427', 'Đô Lương', 'Huyện Đô Lương', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('428', 'Thanh Chương', 'Huyện Thanh Chương', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('429', 'Nghi Lộc', 'Huyện Nghi Lộc', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('43', 'Bảo Lạc', 'Huyện Bảo Lạc', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('430', 'Nam Đàn', 'Huyện Nam Đàn', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('431', 'Hưng Nguyên', 'Huyện Hưng Nguyên', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('432', 'Hoàng Mai', 'Thị xã Hoàng Mai', '40', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('436', 'Hà Tĩnh', 'Thành phố Hà Tĩnh', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('437', 'Hồng Lĩnh', 'Thị xã Hồng Lĩnh', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('439', 'Hương Sơn', 'Huyện Hương Sơn', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('44', 'Thông Nông', 'Huyện Thông Nông', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('440', 'Đức Thọ', 'Huyện Đức Thọ', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('441', 'Vũ Quang', 'Huyện Vũ Quang', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('442', 'Nghi Xuân', 'Huyện Nghi Xuân', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('443', 'Can Lộc', 'Huyện Can Lộc', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('444', 'Hương Khê', 'Huyện Hương Khê', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('445', 'Thạch Hà', 'Huyện Thạch Hà', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('446', 'Cẩm Xuyên', 'Huyện Cẩm Xuyên', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('447', 'Kỳ Anh', 'Huyện Kỳ Anh', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('448', 'Lộc Hà', 'Huyện Lộc Hà', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('449', 'Kỳ Anh', 'Thị xã Kỳ Anh', '42', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('45', 'Hà Quảng', 'Huyện Hà Quảng', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('450', 'Đồng Hới', 'Thành Phố Đồng Hới', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('452', 'Minh Hóa', 'Huyện Minh Hóa', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('453', 'Tuyên Hóa', 'Huyện Tuyên Hóa', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('454', 'Quảng Trạch', 'Huyện Quảng Trạch', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('455', 'Bố Trạch', 'Huyện Bố Trạch', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('456', 'Quảng Ninh', 'Huyện Quảng Ninh', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('457', 'Lệ Thủy', 'Huyện Lệ Thủy', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('458', 'Ba Đồn', 'Thị xã Ba Đồn', '44', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('46', 'Trà Lĩnh', 'Huyện Trà Lĩnh', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('461', 'Đông Hà', 'Thành phố Đông Hà', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('462', 'Quảng Trị', 'Thị xã Quảng Trị', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('464', 'Vĩnh Linh', 'Huyện Vĩnh Linh', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('465', 'Hướng Hóa', 'Huyện Hướng Hóa', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('466', 'Gio Linh', 'Huyện Gio Linh', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('467', 'Đa Krông', 'Huyện Đa Krông', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('468', 'Cam Lộ', 'Huyện Cam Lộ', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('469', 'Triệu Phong', 'Huyện Triệu Phong', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('47', 'Trùng Khánh', 'Huyện Trùng Khánh', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('470', 'Hải Lăng', 'Huyện Hải Lăng', '45', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('474', 'Huế', 'Thành phố Huế', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('476', 'Phong Điền', 'Huyện Phong Điền', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('477', 'Quảng Điền', 'Huyện Quảng Điền', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('478', 'Phú Vang', 'Huyện Phú Vang', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('479', 'Hương Thủy', 'Thị xã Hương Thủy', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('48', 'Hạ Lang', 'Huyện Hạ Lang', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('480', 'Hương Trà', 'Thị xã Hương Trà', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('481', 'A Lưới', 'Huyện A Lưới', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('482', 'Phú Lộc', 'Huyện Phú Lộc', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('483', 'Nam Đông', 'Huyện Nam Đông', '46', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('49', 'Quảng Uyên', 'Huyện Quảng Uyên', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('490', 'Liên Chiểu', 'Quận Liên Chiểu', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('491', 'Thanh Khê', 'Quận Thanh Khê', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('492', 'Hải Châu', 'Quận Hải Châu', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('493', 'Sơn Trà', 'Quận Sơn Trà', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('494', 'Ngũ Hành Sơn', 'Quận Ngũ Hành Sơn', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('495', 'Cẩm Lệ', 'Quận Cẩm Lệ', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('497', 'Hòa Vang', 'Huyện Hòa Vang', '48', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('5', 'Cầu Giấy', 'Quận Cầu Giấy', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('50', 'Phục Hoà', 'Huyện Phục Hoà', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('502', 'Tam Kỳ', 'Thành phố Tam Kỳ', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('503', 'Hội An', 'Thành phố Hội An', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('504', 'Tây Giang', 'Huyện Tây Giang', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('505', 'Đông Giang', 'Huyện Đông Giang', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('506', 'Đại Lộc', 'Huyện Đại Lộc', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('507', 'Điện Bàn', 'Thị xã Điện Bàn', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('508', 'Duy Xuyên', 'Huyện Duy Xuyên', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('509', 'Quế Sơn', 'Huyện Quế Sơn', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('51', 'Hoà An', 'Huyện Hoà An', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('510', 'Nam Giang', 'Huyện Nam Giang', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('511', 'Phước Sơn', 'Huyện Phước Sơn', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('512', 'Hiệp Đức', 'Huyện Hiệp Đức', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('513', 'Thăng Bình', 'Huyện Thăng Bình', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('514', 'Tiên Phước', 'Huyện Tiên Phước', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('515', 'Bắc Trà My', 'Huyện Bắc Trà My', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('516', 'Nam Trà My', 'Huyện Nam Trà My', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('517', 'Núi Thành', 'Huyện Núi Thành', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('518', 'Phú Ninh', 'Huyện Phú Ninh', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('519', 'Nông Sơn', 'Huyện Nông Sơn', '49', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('52', 'Nguyên Bình', 'Huyện Nguyên Bình', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('522', 'Quảng Ngãi', 'Thành phố Quảng Ngãi', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('524', 'Bình Sơn', 'Huyện Bình Sơn', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('525', 'Trà Bồng', 'Huyện Trà Bồng', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('526', 'Tây Trà', 'Huyện Tây Trà', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('527', 'Sơn Tịnh', 'Huyện Sơn Tịnh', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('528', 'Tư Nghĩa', 'Huyện Tư Nghĩa', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('529', 'Sơn Hà', 'Huyện Sơn Hà', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('53', 'Thạch An', 'Huyện Thạch An', '4', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('530', 'Sơn Tây', 'Huyện Sơn Tây', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('531', 'Minh Long', 'Huyện Minh Long', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('532', 'Nghĩa Hành', 'Huyện Nghĩa Hành', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('533', 'Mộ Đức', 'Huyện Mộ Đức', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('534', 'Đức Phổ', 'Huyện Đức Phổ', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('535', 'Ba Tơ', 'Huyện Ba Tơ', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('536', 'Lý Sơn', 'Huyện Lý Sơn', '51', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('540', 'Qui Nhơn', 'Thành phố Qui Nhơn', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('542', 'An Lão', 'Huyện An Lão', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('543', 'Hoài Nhơn', 'Huyện Hoài Nhơn', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('544', 'Hoài Ân', 'Huyện Hoài Ân', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('545', 'Phù Mỹ', 'Huyện Phù Mỹ', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('546', 'Vĩnh Thạnh', 'Huyện Vĩnh Thạnh', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('547', 'Tây Sơn', 'Huyện Tây Sơn', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('548', 'Phù Cát', 'Huyện Phù Cát', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('549', 'An Nhơn', 'Thị xã An Nhơn', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('550', 'Tuy Phước', 'Huyện Tuy Phước', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('551', 'Vân Canh', 'Huyện Vân Canh', '52', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('555', 'Tuy Hoà', 'Thành phố Tuy Hoà', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('557', 'Sông Cầu', 'Thị xã Sông Cầu', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('558', 'Đồng Xuân', 'Huyện Đồng Xuân', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('559', 'Tuy An', 'Huyện Tuy An', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('560', 'Sơn Hòa', 'Huyện Sơn Hòa', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('561', 'Sông Hinh', 'Huyện Sông Hinh', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('562', 'Tây Hoà', 'Huyện Tây Hoà', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('563', 'Phú Hoà', 'Huyện Phú Hoà', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('564', 'Đông Hòa', 'Huyện Đông Hòa', '54', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('568', 'Nha Trang', 'Thành phố Nha Trang', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('569', 'Cam Ranh', 'Thành phố Cam Ranh', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('570', 'Cam Lâm', 'Huyện Cam Lâm', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('571', 'Vạn Ninh', 'Huyện Vạn Ninh', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('572', 'Ninh Hòa', 'Thị xã Ninh Hòa', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('573', 'Khánh Vĩnh', 'Huyện Khánh Vĩnh', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('574', 'Diên Khánh', 'Huyện Diên Khánh', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('575', 'Khánh Sơn', 'Huyện Khánh Sơn', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('576', 'Trường Sa', 'Huyện Trường Sa', '56', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('58', 'Bắc Kạn', 'Thành Phố Bắc Kạn', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('582', 'Phan Rang-Tháp Chàm', 'Thành phố Phan Rang-Tháp Chàm', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('584', 'Bác Ái', 'Huyện Bác Ái', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('585', 'Ninh Sơn', 'Huyện Ninh Sơn', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('586', 'Ninh Hải', 'Huyện Ninh Hải', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('587', 'Ninh Phước', 'Huyện Ninh Phước', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('588', 'Thuận Bắc', 'Huyện Thuận Bắc', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('589', 'Thuận Nam', 'Huyện Thuận Nam', '58', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('593', 'Phan Thiết', 'Thành phố Phan Thiết', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('594', 'La Gi', 'Thị xã La Gi', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('595', 'Tuy Phong', 'Huyện Tuy Phong', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('596', 'Bắc Bình', 'Huyện Bắc Bình', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('597', 'Hàm Thuận Bắc', 'Huyện Hàm Thuận Bắc', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('598', 'Hàm Thuận Nam', 'Huyện Hàm Thuận Nam', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('599', 'Tánh Linh', 'Huyện Tánh Linh', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('6', 'Đống Đa', 'Quận Đống Đa', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('60', 'Pác Nặm', 'Huyện Pác Nặm', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('600', 'Đức Linh', 'Huyện Đức Linh', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('601', 'Hàm Tân', 'Huyện Hàm Tân', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('602', 'Phú Quí', 'Huyện Phú Quí', '60', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('608', 'Kon Tum', 'Thành phố Kon Tum', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('61', 'Ba Bể', 'Huyện Ba Bể', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('610', 'Đắk Glei', 'Huyện Đắk Glei', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('611', 'Ngọc Hồi', 'Huyện Ngọc Hồi', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('612', 'Đắk Tô', 'Huyện Đắk Tô', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('613', 'Kon Plông', 'Huyện Kon Plông', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('614', 'Kon Rẫy', 'Huyện Kon Rẫy', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('615', 'Đắk Hà', 'Huyện Đắk Hà', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('616', 'Sa Thầy', 'Huyện Sa Thầy', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('617', 'Tu Mơ Rông', 'Huyện Tu Mơ Rông', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('618', 'Ia H\' Drai', 'Huyện Ia H\' Drai', '62', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('62', 'Ngân Sơn', 'Huyện Ngân Sơn', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('622', 'Pleiku', 'Thành phố Pleiku', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('623', 'An Khê', 'Thị xã An Khê', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('624', 'Ayun Pa', 'Thị xã Ayun Pa', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('625', 'KBang', 'Huyện KBang', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('626', 'Đăk Đoa', 'Huyện Đăk Đoa', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('627', 'Chư Păh', 'Huyện Chư Păh', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('628', 'Ia Grai', 'Huyện Ia Grai', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('629', 'Mang Yang', 'Huyện Mang Yang', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('63', 'Bạch Thông', 'Huyện Bạch Thông', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('630', 'Kông Chro', 'Huyện Kông Chro', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('631', 'Đức Cơ', 'Huyện Đức Cơ', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('632', 'Chư Prông', 'Huyện Chư Prông', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('633', 'Chư Sê', 'Huyện Chư Sê', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('634', 'Đăk Pơ', 'Huyện Đăk Pơ', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('635', 'Ia Pa', 'Huyện Ia Pa', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('637', 'Krông Pa', 'Huyện Krông Pa', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('638', 'Phú Thiện', 'Huyện Phú Thiện', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('639', 'Chư Pưh', 'Huyện Chư Pưh', '64', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('64', 'Chợ Đồn', 'Huyện Chợ Đồn', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('643', 'Buôn Ma Thuột', 'Thành phố Buôn Ma Thuột', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('644', 'Buôn Hồ', 'Thị xã Buôn Hồ', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('645', 'Ea H\'leo', 'Huyện Ea H\'leo', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('646', 'Ea Súp', 'Huyện Ea Súp', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('647', 'Buôn Đôn', 'Huyện Buôn Đôn', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('648', 'Cư M\'gar', 'Huyện Cư M\'gar', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('649', 'Krông Búk', 'Huyện Krông Búk', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('65', 'Chợ Mới', 'Huyện Chợ Mới', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('650', 'Krông Năng', 'Huyện Krông Năng', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('651', 'Ea Kar', 'Huyện Ea Kar', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('652', 'M\'Đrắk', 'Huyện M\'Đrắk', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('653', 'Krông Bông', 'Huyện Krông Bông', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('654', 'Krông Pắc', 'Huyện Krông Pắc', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('655', 'Krông A Na', 'Huyện Krông A Na', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('656', 'Lắk', 'Huyện Lắk', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('657', 'Cư Kuin', 'Huyện Cư Kuin', '66', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('66', 'Na Rì', 'Huyện Na Rì', '6', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('660', 'Gia Nghĩa', 'Thị xã Gia Nghĩa', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('661', 'Đăk Glong', 'Huyện Đăk Glong', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('662', 'Cư Jút', 'Huyện Cư Jút', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('663', 'Đắk Mil', 'Huyện Đắk Mil', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('664', 'Krông Nô', 'Huyện Krông Nô', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('665', 'Đắk Song', 'Huyện Đắk Song', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('666', 'Đắk R\'Lấp', 'Huyện Đắk R\'Lấp', '67', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('667', 'Tuy Đức', 'Huyện Tuy Đức', '67', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('672', 'Đà Lạt', 'Thành phố Đà Lạt', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('673', 'Bảo Lộc', 'Thành phố Bảo Lộc', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('674', 'Đam Rông', 'Huyện Đam Rông', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('675', 'Lạc Dương', 'Huyện Lạc Dương', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('676', 'Lâm Hà', 'Huyện Lâm Hà', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('677', 'Đơn Dương', 'Huyện Đơn Dương', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('678', 'Đức Trọng', 'Huyện Đức Trọng', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('679', 'Di Linh', 'Huyện Di Linh', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('680', 'Bảo Lâm', 'Huyện Bảo Lâm', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('681', 'Đạ Huoai', 'Huyện Đạ Huoai', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('682', 'Đạ Tẻh', 'Huyện Đạ Tẻh', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('683', 'Cát Tiên', 'Huyện Cát Tiên', '68', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('688', 'Phước Long', 'Thị xã Phước Long', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('689', 'Đồng Xoài', 'Thị xã Đồng Xoài', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('690', 'Bình Long', 'Thị xã Bình Long', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('691', 'Bù Gia Mập', 'Huyện Bù Gia Mập', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('692', 'Lộc Ninh', 'Huyện Lộc Ninh', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('693', 'Bù Đốp', 'Huyện Bù Đốp', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('694', 'Hớn Quản', 'Huyện Hớn Quản', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('695', 'Đồng Phú', 'Huyện Đồng Phú', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('696', 'Bù Đăng', 'Huyện Bù Đăng', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('697', 'Chơn Thành', 'Huyện Chơn Thành', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('698', 'Phú Riềng', 'Huyện Phú Riềng', '70', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('7', 'Hai Bà Trưng', 'Quận Hai Bà Trưng', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('70', 'Tuyên Quang', 'Thành phố Tuyên Quang', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('703', 'Tây Ninh', 'Thành phố Tây Ninh', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('705', 'Tân Biên', 'Huyện Tân Biên', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('706', 'Tân Châu', 'Huyện Tân Châu', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('707', 'Dương Minh Châu', 'Huyện Dương Minh Châu', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('708', 'Châu Thành', 'Huyện Châu Thành', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('709', 'Hòa Thành', 'Huyện Hòa Thành', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('71', 'Lâm Bình', 'Huyện Lâm Bình', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('710', 'Gò Dầu', 'Huyện Gò Dầu', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('711', 'Bến Cầu', 'Huyện Bến Cầu', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('712', 'Trảng Bàng', 'Huyện Trảng Bàng', '72', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('718', 'Thủ Dầu Một', 'Thành phố Thủ Dầu Một', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('719', 'Bàu Bàng', 'Huyện Bàu Bàng', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('72', 'Nà Hang', 'Huyện Nà Hang', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('720', 'Dầu Tiếng', 'Huyện Dầu Tiếng', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('721', 'Bến Cát', 'Thị xã Bến Cát', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('722', 'Phú Giáo', 'Huyện Phú Giáo', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('723', 'Tân Uyên', 'Thị xã Tân Uyên', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('724', 'Dĩ An', 'Thị xã Dĩ An', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('725', 'Thuận An', 'Thị xã Thuận An', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('726', 'Bắc Tân Uyên', 'Huyện Bắc Tân Uyên', '74', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('73', 'Chiêm Hóa', 'Huyện Chiêm Hóa', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('731', 'Biên Hòa', 'Thành phố Biên Hòa', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('732', 'Long Khánh', 'Thị xã Long Khánh', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('734', 'Tân Phú', 'Huyện Tân Phú', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('735', 'Vĩnh Cửu', 'Huyện Vĩnh Cửu', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('736', 'Định Quán', 'Huyện Định Quán', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('737', 'Trảng Bom', 'Huyện Trảng Bom', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('738', 'Thống Nhất', 'Huyện Thống Nhất', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('739', 'Cẩm Mỹ', 'Huyện Cẩm Mỹ', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('74', 'Hàm Yên', 'Huyện Hàm Yên', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('740', 'Long Thành', 'Huyện Long Thành', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('741', 'Xuân Lộc', 'Huyện Xuân Lộc', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('742', 'Nhơn Trạch', 'Huyện Nhơn Trạch', '75', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('747', 'Vũng Tàu', 'Thành phố Vũng Tàu', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('748', 'Bà Rịa', 'Thành phố Bà Rịa', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('75', 'Yên Sơn', 'Huyện Yên Sơn', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('750', 'Châu Đức', 'Huyện Châu Đức', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('751', 'Xuyên Mộc', 'Huyện Xuyên Mộc', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('752', 'Long Điền', 'Huyện Long Điền', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('753', 'Đất Đỏ', 'Huyện Đất Đỏ', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('754', 'Tân Thành', 'Huyện Tân Thành', '77', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('76', 'Sơn Dương', 'Huyện Sơn Dương', '8', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('760', 'Quận 1', 'Quận 1', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('761', 'Quận 12', 'Quận 12', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('762', 'Thủ Đức', 'Quận Thủ Đức', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('763', 'Quận 9', 'Quận 9', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('764', 'Gò Vấp', 'Quận Gò Vấp', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('765', 'Bình Thạnh', 'Quận Bình Thạnh', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('766', 'Tân Bình', 'Quận Tân Bình', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('767', 'Tân Phú', 'Quận Tân Phú', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('768', 'Phú Nhuận', 'Quận Phú Nhuận', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('769', 'Quận 2', 'Quận 2', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('770', 'Quận 3', 'Quận 3', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('771', 'Quận 10', 'Quận 10', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('772', 'Quận 11', 'Quận 11', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('773', 'Quận 4', 'Quận 4', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('774', 'Quận 5', 'Quận 5', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('775', 'Quận 6', 'Quận 6', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('776', 'Quận 8', 'Quận 8', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('777', 'Bình Tân', 'Quận Bình Tân', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('778', 'Quận 7', 'Quận 7', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('783', 'Củ Chi', 'Huyện Củ Chi', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('784', 'Hóc Môn', 'Huyện Hóc Môn', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('785', 'Bình Chánh', 'Huyện Bình Chánh', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('786', 'Nhà Bè', 'Huyện Nhà Bè', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('787', 'Cần Giờ', 'Huyện Cần Giờ', '79', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('794', 'Tân An', 'Thành phố Tân An', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31');
INSERT INTO `districts` (`id`, `name`, `name_with_type`, `province_id`, `created_at`, `updated_at`) VALUES
('795', 'Kiến Tường', 'Thị xã Kiến Tường', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('796', 'Tân Hưng', 'Huyện Tân Hưng', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('797', 'Vĩnh Hưng', 'Huyện Vĩnh Hưng', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('798', 'Mộc Hóa', 'Huyện Mộc Hóa', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('799', 'Tân Thạnh', 'Huyện Tân Thạnh', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('8', 'Hoàng Mai', 'Quận Hoàng Mai', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('80', 'Lào Cai', 'Thành phố Lào Cai', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('800', 'Thạnh Hóa', 'Huyện Thạnh Hóa', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('801', 'Đức Huệ', 'Huyện Đức Huệ', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('802', 'Đức Hòa', 'Huyện Đức Hòa', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('803', 'Bến Lức', 'Huyện Bến Lức', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('804', 'Thủ Thừa', 'Huyện Thủ Thừa', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('805', 'Tân Trụ', 'Huyện Tân Trụ', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('806', 'Cần Đước', 'Huyện Cần Đước', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('807', 'Cần Giuộc', 'Huyện Cần Giuộc', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('808', 'Châu Thành', 'Huyện Châu Thành', '80', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('815', 'Mỹ Tho', 'Thành phố Mỹ Tho', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('816', 'Gò Công', 'Thị xã Gò Công', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('817', 'Cai Lậy', 'Thị xã Cai Lậy', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('818', 'Tân Phước', 'Huyện Tân Phước', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('819', 'Cái Bè', 'Huyện Cái Bè', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('82', 'Bát Xát', 'Huyện Bát Xát', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('820', 'Cai Lậy', 'Huyện Cai Lậy', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('821', 'Châu Thành', 'Huyện Châu Thành', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('822', 'Chợ Gạo', 'Huyện Chợ Gạo', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('823', 'Gò Công Tây', 'Huyện Gò Công Tây', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('824', 'Gò Công Đông', 'Huyện Gò Công Đông', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('825', 'Tân Phú Đông', 'Huyện Tân Phú Đông', '82', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('829', 'Bến Tre', 'Thành phố Bến Tre', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('83', 'Mường Khương', 'Huyện Mường Khương', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('831', 'Châu Thành', 'Huyện Châu Thành', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('832', 'Chợ Lách', 'Huyện Chợ Lách', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('833', 'Mỏ Cày Nam', 'Huyện Mỏ Cày Nam', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('834', 'Giồng Trôm', 'Huyện Giồng Trôm', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('835', 'Bình Đại', 'Huyện Bình Đại', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('836', 'Ba Tri', 'Huyện Ba Tri', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('837', 'Thạnh Phú', 'Huyện Thạnh Phú', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('838', 'Mỏ Cày Bắc', 'Huyện Mỏ Cày Bắc', '83', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('84', 'Si Ma Cai', 'Huyện Si Ma Cai', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('842', 'Trà Vinh', 'Thành phố Trà Vinh', '84', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('844', 'Càng Long', 'Huyện Càng Long', '84', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('845', 'Cầu Kè', 'Huyện Cầu Kè', '84', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('846', 'Tiểu Cần', 'Huyện Tiểu Cần', '84', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('847', 'Châu Thành', 'Huyện Châu Thành', '84', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('848', 'Cầu Ngang', 'Huyện Cầu Ngang', '84', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('849', 'Trà Cú', 'Huyện Trà Cú', '84', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('85', 'Bắc Hà', 'Huyện Bắc Hà', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('850', 'Duyên Hải', 'Huyện Duyên Hải', '84', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('851', 'Duyên Hải', 'Thị xã Duyên Hải', '84', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('855', 'Vĩnh Long', 'Thành phố Vĩnh Long', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('857', 'Long Hồ', 'Huyện Long Hồ', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('858', 'Mang Thít', 'Huyện Mang Thít', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('859', 'Vũng Liêm', 'Huyện  Vũng Liêm', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('86', 'Bảo Thắng', 'Huyện Bảo Thắng', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('860', 'Tam Bình', 'Huyện Tam Bình', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('861', 'Bình Minh', 'Thị xã Bình Minh', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('862', 'Trà Ôn', 'Huyện Trà Ôn', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('863', 'Bình Tân', 'Huyện Bình Tân', '86', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('866', 'Cao Lãnh', 'Thành phố Cao Lãnh', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('867', 'Sa Đéc', 'Thành phố Sa Đéc', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('868', 'Hồng Ngự', 'Thị xã Hồng Ngự', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('869', 'Tân Hồng', 'Huyện Tân Hồng', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('87', 'Bảo Yên', 'Huyện Bảo Yên', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('870', 'Hồng Ngự', 'Huyện Hồng Ngự', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('871', 'Tam Nông', 'Huyện Tam Nông', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('872', 'Tháp Mười', 'Huyện Tháp Mười', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('873', 'Cao Lãnh', 'Huyện Cao Lãnh', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('874', 'Thanh Bình', 'Huyện Thanh Bình', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('875', 'Lấp Vò', 'Huyện Lấp Vò', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('876', 'Lai Vung', 'Huyện Lai Vung', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('877', 'Châu Thành', 'Huyện Châu Thành', '87', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('88', 'Sa Pa', 'Huyện Sa Pa', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('883', 'Long Xuyên', 'Thành phố Long Xuyên', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('884', 'Châu Đốc', 'Thành phố Châu Đốc', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('886', 'An Phú', 'Huyện An Phú', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('887', 'Tân Châu', 'Thị xã Tân Châu', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('888', 'Phú Tân', 'Huyện Phú Tân', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('889', 'Châu Phú', 'Huyện Châu Phú', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('89', 'Văn Bàn', 'Huyện Văn Bàn', '10', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('890', 'Tịnh Biên', 'Huyện Tịnh Biên', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('891', 'Tri Tôn', 'Huyện Tri Tôn', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('892', 'Châu Thành', 'Huyện Châu Thành', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('893', 'Chợ Mới', 'Huyện Chợ Mới', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('894', 'Thoại Sơn', 'Huyện Thoại Sơn', '89', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('899', 'Rạch Giá', 'Thành phố Rạch Giá', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('9', 'Thanh Xuân', 'Quận Thanh Xuân', '1', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('900', 'Hà Tiên', 'Thị xã Hà Tiên', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('902', 'Kiên Lương', 'Huyện Kiên Lương', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('903', 'Hòn Đất', 'Huyện Hòn Đất', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('904', 'Tân Hiệp', 'Huyện Tân Hiệp', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('905', 'Châu Thành', 'Huyện Châu Thành', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('906', 'Giồng Riềng', 'Huyện Giồng Riềng', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('907', 'Gò Quao', 'Huyện Gò Quao', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('908', 'An Biên', 'Huyện An Biên', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('909', 'An Minh', 'Huyện An Minh', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('910', 'Vĩnh Thuận', 'Huyện Vĩnh Thuận', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('911', 'Phú Quốc', 'Huyện Phú Quốc', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('912', 'Kiên Hải', 'Huyện Kiên Hải', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('913', 'U Minh Thượng', 'Huyện U Minh Thượng', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('914', 'Giang Thành', 'Huyện Giang Thành', '91', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('916', 'Ninh Kiều', 'Quận Ninh Kiều', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('917', 'Ô Môn', 'Quận Ô Môn', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('918', 'Bình Thuỷ', 'Quận Bình Thuỷ', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('919', 'Cái Răng', 'Quận Cái Răng', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('923', 'Thốt Nốt', 'Quận Thốt Nốt', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('924', 'Vĩnh Thạnh', 'Huyện Vĩnh Thạnh', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('925', 'Cờ Đỏ', 'Huyện Cờ Đỏ', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('926', 'Phong Điền', 'Huyện Phong Điền', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('927', 'Thới Lai', 'Huyện Thới Lai', '92', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('930', 'Vị Thanh', 'Thành phố Vị Thanh', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('931', 'Ngã Bảy', 'Thị xã Ngã Bảy', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('932', 'Châu Thành A', 'Huyện Châu Thành A', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('933', 'Châu Thành', 'Huyện Châu Thành', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('934', 'Phụng Hiệp', 'Huyện Phụng Hiệp', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('935', 'Vị Thuỷ', 'Huyện Vị Thuỷ', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('936', 'Long Mỹ', 'Huyện Long Mỹ', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('937', 'Long Mỹ', 'Thị xã Long Mỹ', '93', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('94', 'Điện Biên Phủ', 'Thành phố Điện Biên Phủ', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('941', 'Sóc Trăng', 'Thành phố Sóc Trăng', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('942', 'Châu Thành', 'Huyện Châu Thành', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('943', 'Kế Sách', 'Huyện Kế Sách', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('944', 'Mỹ Tú', 'Huyện Mỹ Tú', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('945', 'Cù Lao Dung', 'Huyện Cù Lao Dung', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('946', 'Long Phú', 'Huyện Long Phú', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('947', 'Mỹ Xuyên', 'Huyện Mỹ Xuyên', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('948', 'Ngã Năm', 'Thị xã Ngã Năm', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('949', 'Thạnh Trị', 'Huyện Thạnh Trị', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('95', 'Mường Lay', 'Thị xã Mường Lay', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('950', 'Vĩnh Châu', 'Thị xã Vĩnh Châu', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('951', 'Trần Đề', 'Huyện Trần Đề', '94', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('954', 'Bạc Liêu', 'Thành phố Bạc Liêu', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('956', 'Hồng Dân', 'Huyện Hồng Dân', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('957', 'Phước Long', 'Huyện Phước Long', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('958', 'Vĩnh Lợi', 'Huyện Vĩnh Lợi', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('959', 'Giá Rai', 'Thị xã Giá Rai', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('96', 'Mường Nhé', 'Huyện Mường Nhé', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('960', 'Đông Hải', 'Huyện Đông Hải', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('961', 'Hoà Bình', 'Huyện Hoà Bình', '95', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('964', 'Cà Mau', 'Thành phố Cà Mau', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('966', 'U Minh', 'Huyện U Minh', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('967', 'Thới Bình', 'Huyện Thới Bình', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('968', 'Trần Văn Thời', 'Huyện Trần Văn Thời', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('969', 'Cái Nước', 'Huyện Cái Nước', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('97', 'Mường Chà', 'Huyện Mường Chà', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('970', 'Đầm Dơi', 'Huyện Đầm Dơi', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('971', 'Năm Căn', 'Huyện Năm Căn', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('972', 'Phú Tân', 'Huyện Phú Tân', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('973', 'Ngọc Hiển', 'Huyện Ngọc Hiển', '96', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('98', 'Tủa Chùa', 'Huyện Tủa Chùa', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('99', 'Tuần Giáo', 'Huyện Tuần Giáo', '11', '2020-11-05 09:45:30', '2020-11-05 09:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `connection` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `queue` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bảo hành', NULL, '2020-11-27 04:34:42', '2020-11-27 04:34:42', NULL),
(2, 'Bảo dưỡng', NULL, '2020-11-27 04:35:02', '2020-11-27 04:35:02', NULL),
(3, 'Sửa chữa chung', NULL, '2020-11-27 04:35:53', '2020-11-27 04:35:53', NULL),
(4, 'Sửa chữa thân xe  và sơn', NULL, '2020-11-27 04:36:25', '2020-11-27 04:36:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_order`
--

CREATE TABLE `item_order` (
  `order_id` bigint(7) UNSIGNED ZEROFILL NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `item_order`
--

INSERT INTO `item_order` (`order_id`, `item_id`, `created_at`, `updated_at`) VALUES
(0000001, 3, NULL, NULL),
(0000002, 3, NULL, NULL),
(0000002, 4, NULL, NULL),
(0000003, 3, NULL, NULL),
(0000003, 4, NULL, NULL),
(0000004, 1, NULL, NULL),
(0000004, 2, NULL, NULL),
(0000005, 2, NULL, NULL),
(0000005, 3, NULL, NULL),
(0000006, 1, NULL, NULL),
(0000006, 2, NULL, NULL),
(0000006, 3, NULL, NULL),
(0000006, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `remaining_quota` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `period_started_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `creator` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `customer_id`, `ended_at`, `remaining_quota`, `created_at`, `period_started_at`, `updated_at`, `deleted_at`, `creator`) VALUES
(1, 67, '2022-04-12 00:55:55', 5000000, '2021-04-12 00:55:55', NULL, '2021-04-12 00:55:55', NULL, 1),
(2, 1, '2022-04-12 02:12:12', 5000000, '2021-04-12 02:12:12', NULL, '2021-04-12 02:12:12', NULL, 1),
(3, 79, '2022-04-26 10:54:55', 5000000, '2021-04-26 10:54:55', NULL, '2021-04-26 10:54:55', NULL, 49),
(4, 78, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(6, 77, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(8, 75, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(9, 74, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(10, 82, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(11, 87, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(12, 88, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(13, 92, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(14, 89, '2022-04-29 10:52:21', 5000000, '2021-04-29 10:52:21', NULL, '2021-04-29 10:52:21', NULL, 1),
(15, 94, '2022-05-04 07:04:16', 5000000, '2021-05-04 07:04:16', NULL, '2021-05-04 07:04:16', NULL, 1),
(16, 95, '2022-05-04 10:38:27', 5000000, '2021-05-04 10:38:27', NULL, '2021-05-04 10:38:27', NULL, 1),
(17, 104, '2022-05-06 06:56:23', 5000000, '2021-05-06 06:56:23', NULL, '2021-05-06 06:56:23', NULL, 1),
(18, 103, '2022-05-06 06:56:23', 5000000, '2021-05-06 06:56:23', NULL, '2021-05-06 06:56:23', NULL, 1),
(19, 101, '2022-05-06 06:56:23', 5000000, '2021-05-06 06:56:23', NULL, '2021-05-06 06:56:23', NULL, 1),
(20, 102, '2022-05-06 06:56:23', 5000000, '2021-05-06 06:56:23', NULL, '2021-05-06 06:56:23', NULL, 1),
(21, 76, '2022-05-06 06:56:23', 5000000, '2021-05-06 06:56:23', NULL, '2021-05-06 06:56:23', NULL, 1),
(22, 107, '2022-05-10 07:30:34', 5000000, '2021-05-10 07:30:34', NULL, '2021-05-10 07:30:34', NULL, 74),
(23, 108, '2022-05-11 03:33:12', 5000000, '2021-05-11 03:33:12', NULL, '2021-05-11 03:33:12', NULL, 74),
(24, 84, '2022-05-12 03:28:08', 5000000, '2021-05-12 03:28:08', NULL, '2021-05-12 03:28:08', NULL, 74),
(25, 116, '2022-05-13 02:48:02', 5000000, '2021-05-13 02:48:02', NULL, '2021-05-13 02:48:02', NULL, 74),
(26, 121, '2022-05-14 04:33:17', 5000000, '2021-05-14 04:33:17', NULL, '2021-05-14 04:33:17', NULL, 74),
(27, 123, '2022-05-14 04:33:18', 5000000, '2021-05-14 04:33:18', NULL, '2021-05-14 04:33:18', NULL, 74),
(28, 143, '2022-05-17 05:44:55', 5000000, '2021-05-17 05:44:55', NULL, '2021-05-17 05:44:55', NULL, 74),
(29, 142, '2022-05-17 05:44:55', 5000000, '2021-05-17 05:44:55', NULL, '2021-05-17 05:44:55', NULL, 74),
(30, 150, '2022-05-18 02:11:50', 5000000, '2021-05-18 02:11:50', NULL, '2021-05-18 02:11:50', NULL, 74),
(31, 144, '2022-05-18 02:11:50', 5000000, '2021-05-18 02:11:50', NULL, '2021-05-18 02:11:50', NULL, 74),
(32, 149, '2022-05-18 02:11:50', 5000000, '2021-05-18 02:11:50', NULL, '2021-05-18 02:11:50', NULL, 74),
(33, 146, '2022-05-18 02:11:51', 5000000, '2021-05-18 02:11:51', NULL, '2021-05-18 02:11:51', NULL, 74),
(34, 157, '2022-05-19 04:05:17', 5000000, '2021-05-19 04:05:17', NULL, '2021-05-19 04:05:17', NULL, 74),
(35, 148, '2022-05-19 04:05:17', 5000000, '2021-05-19 04:05:17', NULL, '2021-05-19 04:05:17', NULL, 74),
(36, 156, '2022-05-19 04:05:18', 5000000, '2021-05-19 04:05:18', NULL, '2021-05-19 04:05:18', NULL, 74),
(37, 154, '2022-05-19 04:05:18', 5000000, '2021-05-19 04:05:18', NULL, '2021-05-19 04:05:18', NULL, 74),
(38, 99, '2022-05-19 10:03:15', 5000000, '2021-05-19 10:03:15', NULL, '2021-05-19 10:03:15', NULL, 74),
(39, 124, '2022-05-21 02:22:07', 5000000, '2021-05-21 02:22:07', NULL, '2021-05-21 02:22:07', NULL, 74),
(40, 169, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(41, 170, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(42, 135, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(43, 164, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(44, 163, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(45, 161, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(46, 160, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(47, 166, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(48, 165, '2022-05-21 06:18:57', 5000000, '2021-05-21 06:18:57', NULL, '2021-05-21 06:18:57', NULL, 74),
(49, 140, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(50, 172, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(51, 181, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(52, 180, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(53, 178, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(54, 173, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(55, 176, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(56, 179, '2022-05-24 02:47:55', 5000000, '2021-05-24 02:47:55', NULL, '2021-05-24 02:47:55', NULL, 74),
(57, 184, '2022-05-25 03:56:22', 5000000, '2021-05-25 03:56:22', NULL, '2021-05-25 03:56:22', NULL, 74),
(58, 183, '2022-05-25 03:56:23', 5000000, '2021-05-25 03:56:23', NULL, '2021-05-25 03:56:23', NULL, 74),
(59, 182, '2022-05-25 03:56:23', 5000000, '2021-05-25 03:56:23', NULL, '2021-05-25 03:56:23', NULL, 74),
(60, 189, '2022-05-26 02:24:43', 5000000, '2021-05-26 02:24:43', NULL, '2021-05-26 02:24:43', NULL, 74),
(61, 188, '2022-05-26 02:24:43', 5000000, '2021-05-26 02:24:43', NULL, '2021-05-26 02:24:43', NULL, 74),
(62, 190, '2022-05-27 03:09:03', 5000000, '2021-05-27 03:09:03', NULL, '2021-05-27 03:09:03', NULL, 74),
(63, 191, '2022-05-27 03:09:04', 5000000, '2021-05-27 03:09:04', NULL, '2021-05-27 03:09:04', NULL, 74),
(64, 192, '2022-05-27 03:09:04', 5000000, '2021-05-27 03:09:04', NULL, '2021-05-27 03:09:04', NULL, 74),
(65, 171, '2022-05-27 03:09:04', 5000000, '2021-05-27 03:09:04', NULL, '2021-05-27 03:09:04', NULL, 74),
(66, 195, '2022-05-28 02:38:08', 5000000, '2021-05-28 02:38:08', NULL, '2021-05-28 02:38:08', NULL, 74),
(67, 197, '2022-05-28 02:38:08', 5000000, '2021-05-28 02:38:08', NULL, '2021-05-28 02:38:08', NULL, 74),
(68, 196, '2022-05-28 02:38:08', 5000000, '2021-05-28 02:38:08', NULL, '2021-05-28 02:38:08', NULL, 74),
(69, 200, '2022-05-31 03:46:16', 5000000, '2021-05-31 03:46:16', NULL, '2021-05-31 03:46:16', NULL, 74),
(70, 198, '2022-05-31 03:46:16', 5000000, '2021-05-31 03:46:16', NULL, '2021-05-31 03:46:16', NULL, 74),
(71, 133, '2022-05-31 03:46:16', 5000000, '2021-05-31 03:46:16', NULL, '2021-05-31 03:46:16', NULL, 74),
(72, 202, '2022-06-01 03:10:14', 5000000, '2021-06-01 03:10:14', NULL, '2021-06-01 03:10:14', NULL, 74),
(73, 204, '2022-06-01 03:10:14', 5000000, '2021-06-01 03:10:14', NULL, '2021-06-01 03:10:14', NULL, 74),
(74, 201, '2022-06-01 03:10:14', 5000000, '2021-06-01 03:10:14', NULL, '2021-06-01 03:10:14', NULL, 74),
(75, 206, '2022-06-02 02:30:42', 5000000, '2021-06-02 02:30:42', NULL, '2021-06-02 02:30:42', NULL, 74),
(76, 208, '2022-06-03 02:10:20', 5000000, '2021-06-03 02:10:20', NULL, '2021-06-03 02:10:20', NULL, 74),
(77, 207, '2022-06-03 02:10:20', 5000000, '2021-06-03 02:10:20', NULL, '2021-06-03 02:10:20', NULL, 74),
(78, 218, '2022-06-04 02:11:40', 5000000, '2021-06-04 02:11:40', NULL, '2021-06-04 02:11:40', NULL, 74),
(79, 209, '2022-06-04 02:11:40', 5000000, '2021-06-04 02:11:40', NULL, '2021-06-04 02:11:40', NULL, 74),
(80, 214, '2022-06-04 02:11:40', 5000000, '2021-06-04 02:11:40', NULL, '2021-06-04 02:11:40', NULL, 74),
(81, 219, '2022-06-07 03:20:22', 5000000, '2021-06-07 03:20:22', NULL, '2021-06-07 03:20:22', NULL, 74),
(82, 221, '2022-06-07 03:20:23', 5000000, '2021-06-07 03:20:23', NULL, '2021-06-07 03:20:23', NULL, 74),
(83, 222, '2022-06-07 03:20:23', 5000000, '2021-06-07 03:20:23', NULL, '2021-06-07 03:20:23', NULL, 74),
(84, 210, '2022-06-07 03:20:23', 5000000, '2021-06-07 03:20:23', NULL, '2021-06-07 03:20:23', NULL, 74),
(85, 224, '2022-06-08 02:05:43', 5000000, '2021-06-08 02:05:43', NULL, '2021-06-08 02:05:43', NULL, 74),
(86, 223, '2022-06-08 02:05:43', 5000000, '2021-06-08 02:05:43', NULL, '2021-06-08 02:05:43', NULL, 74),
(87, 225, '2022-06-09 02:17:24', 5000000, '2021-06-09 02:17:24', NULL, '2021-06-09 02:17:24', NULL, 74),
(88, 231, '2022-06-10 02:26:43', 5000000, '2021-06-10 02:26:43', NULL, '2021-06-10 02:26:43', NULL, 74),
(89, 230, '2022-06-10 02:26:43', 5000000, '2021-06-10 02:26:43', NULL, '2021-06-10 02:26:43', NULL, 74),
(90, 227, '2022-06-10 02:26:43', 5000000, '2021-06-10 02:26:43', NULL, '2021-06-10 02:26:43', NULL, 74),
(91, 229, '2022-06-10 02:26:43', 5000000, '2021-06-10 02:26:43', NULL, '2021-06-10 02:26:43', NULL, 74),
(92, 236, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(93, 234, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(94, 235, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(95, 233, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(96, 240, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(97, 238, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(98, 239, '2022-06-14 02:47:15', 5000000, '2021-06-14 02:47:15', NULL, '2021-06-14 02:47:15', NULL, 74),
(99, 139, '2022-06-15 02:43:59', 5000000, '2021-06-15 02:43:59', NULL, '2021-06-15 02:43:59', NULL, 74),
(100, 243, '2022-06-15 02:43:59', 5000000, '2021-06-15 02:43:59', NULL, '2021-06-15 02:43:59', NULL, 74),
(101, 242, '2022-06-15 02:43:59', 5000000, '2021-06-15 02:43:59', NULL, '2021-06-15 02:43:59', NULL, 74),
(102, 241, '2022-06-15 02:43:59', 5000000, '2021-06-15 02:43:59', NULL, '2021-06-15 02:43:59', NULL, 74),
(103, 247, '2022-06-16 02:24:46', 5000000, '2021-06-16 02:24:46', NULL, '2021-06-16 02:24:46', NULL, 74),
(104, 245, '2022-06-16 02:24:46', 5000000, '2021-06-16 02:24:46', NULL, '2021-06-16 02:24:46', NULL, 74),
(105, 246, '2022-06-16 02:24:46', 5000000, '2021-06-16 02:24:46', NULL, '2021-06-16 02:24:46', NULL, 74),
(106, 250, '2022-06-17 02:13:41', 5000000, '2021-06-17 02:13:41', NULL, '2021-06-17 02:13:41', NULL, 74),
(107, 251, '2022-06-17 02:13:41', 5000000, '2021-06-17 02:13:41', NULL, '2021-06-17 02:13:41', NULL, 74);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_03_081715_create_permission_tables', 2),
(5, '2020_03_31_114745_remove_backpackuser_model', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 34),
(1, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 51),
(2, 'App\\Models\\User', 52),
(2, 'App\\Models\\User', 53),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 55),
(2, 'App\\Models\\User', 56),
(2, 'App\\Models\\User', 57),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 59),
(2, 'App\\Models\\User', 60),
(2, 'App\\Models\\User', 61),
(2, 'App\\Models\\User', 62),
(2, 'App\\Models\\User', 63),
(2, 'App\\Models\\User', 64),
(2, 'App\\Models\\User', 65),
(2, 'App\\Models\\User', 66),
(2, 'App\\Models\\User', 67),
(2, 'App\\Models\\User', 68),
(2, 'App\\Models\\User', 69),
(2, 'App\\Models\\User', 70),
(2, 'App\\Models\\User', 71),
(2, 'App\\Models\\User', 72),
(2, 'App\\Models\\User', 73),
(2, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 74),
(2, 'App\\Models\\User', 75),
(2, 'App\\Models\\User', 76),
(2, 'App\\Models\\User', 77),
(2, 'App\\Models\\User', 78),
(2, 'App\\Models\\User', 79),
(2, 'App\\Models\\User', 80),
(2, 'App\\Models\\User', 81),
(2, 'App\\Models\\User', 82),
(2, 'App\\Models\\User', 83),
(2, 'App\\Models\\User', 84),
(2, 'App\\Models\\User', 85),
(2, 'App\\Models\\User', 86),
(2, 'App\\Models\\User', 87),
(2, 'App\\Models\\User', 88),
(2, 'App\\Models\\User', 89),
(2, 'App\\Models\\User', 90),
(2, 'App\\Models\\User', 91),
(2, 'App\\Models\\User', 92),
(2, 'App\\Models\\User', 93),
(2, 'App\\Models\\User', 94),
(2, 'App\\Models\\User', 95),
(2, 'App\\Models\\User', 96),
(2, 'App\\Models\\User', 97),
(2, 'App\\Models\\User', 98),
(2, 'App\\Models\\User', 99),
(2, 'App\\Models\\User', 100),
(2, 'App\\Models\\User', 101),
(2, 'App\\Models\\User', 102),
(2, 'App\\Models\\User', 103),
(2, 'App\\Models\\User', 104),
(2, 'App\\Models\\User', 105),
(2, 'App\\Models\\User', 106),
(2, 'App\\Models\\User', 107),
(2, 'App\\Models\\User', 108),
(2, 'App\\Models\\User', 109),
(2, 'App\\Models\\User', 110),
(2, 'App\\Models\\User', 111),
(2, 'App\\Models\\User', 112),
(2, 'App\\Models\\User', 113),
(2, 'App\\Models\\User', 114),
(2, 'App\\Models\\User', 115),
(2, 'App\\Models\\User', 116),
(2, 'App\\Models\\User', 117),
(2, 'App\\Models\\User', 118),
(2, 'App\\Models\\User', 119),
(2, 'App\\Models\\User', 120),
(2, 'App\\Models\\User', 121),
(2, 'App\\Models\\User', 122),
(2, 'App\\Models\\User', 123),
(2, 'App\\Models\\User', 124),
(2, 'App\\Models\\User', 125),
(2, 'App\\Models\\User', 126),
(2, 'App\\Models\\User', 127),
(2, 'App\\Models\\User', 128),
(2, 'App\\Models\\User', 129),
(2, 'App\\Models\\User', 130),
(2, 'App\\Models\\User', 131),
(2, 'App\\Models\\User', 132),
(2, 'App\\Models\\User', 133),
(2, 'App\\Models\\User', 134),
(2, 'App\\Models\\User', 135),
(2, 'App\\Models\\User', 136),
(2, 'App\\Models\\User', 137),
(2, 'App\\Models\\User', 138),
(2, 'App\\Models\\User', 139),
(2, 'App\\Models\\User', 140),
(2, 'App\\Models\\User', 141),
(2, 'App\\Models\\User', 142),
(2, 'App\\Models\\User', 143),
(2, 'App\\Models\\User', 144),
(2, 'App\\Models\\User', 145),
(2, 'App\\Models\\User', 146),
(2, 'App\\Models\\User', 147),
(2, 'App\\Models\\User', 148),
(2, 'App\\Models\\User', 149),
(2, 'App\\Models\\User', 150),
(2, 'App\\Models\\User', 151),
(2, 'App\\Models\\User', 152),
(2, 'App\\Models\\User', 153),
(2, 'App\\Models\\User', 154),
(2, 'App\\Models\\User', 155),
(2, 'App\\Models\\User', 156),
(2, 'App\\Models\\User', 157),
(2, 'App\\Models\\User', 158),
(2, 'App\\Models\\User', 159),
(2, 'App\\Models\\User', 160),
(2, 'App\\Models\\User', 161),
(2, 'App\\Models\\User', 162),
(2, 'App\\Models\\User', 163),
(2, 'App\\Models\\User', 164),
(2, 'App\\Models\\User', 165),
(2, 'App\\Models\\User', 166),
(2, 'App\\Models\\User', 167),
(2, 'App\\Models\\User', 168),
(2, 'App\\Models\\User', 169),
(2, 'App\\Models\\User', 170),
(2, 'App\\Models\\User', 171),
(2, 'App\\Models\\User', 172),
(2, 'App\\Models\\User', 173),
(2, 'App\\Models\\User', 174),
(2, 'App\\Models\\User', 175),
(2, 'App\\Models\\User', 176),
(2, 'App\\Models\\User', 177),
(2, 'App\\Models\\User', 178),
(2, 'App\\Models\\User', 179),
(2, 'App\\Models\\User', 180),
(2, 'App\\Models\\User', 181),
(2, 'App\\Models\\User', 182),
(2, 'App\\Models\\User', 183),
(2, 'App\\Models\\User', 184),
(2, 'App\\Models\\User', 185),
(2, 'App\\Models\\User', 186),
(2, 'App\\Models\\User', 187),
(2, 'App\\Models\\User', 188),
(2, 'App\\Models\\User', 189),
(2, 'App\\Models\\User', 190),
(2, 'App\\Models\\User', 191),
(2, 'App\\Models\\User', 192),
(2, 'App\\Models\\User', 193),
(2, 'App\\Models\\User', 194),
(2, 'App\\Models\\User', 195),
(2, 'App\\Models\\User', 196),
(2, 'App\\Models\\User', 197),
(2, 'App\\Models\\User', 198),
(2, 'App\\Models\\User', 199),
(2, 'App\\Models\\User', 200),
(2, 'App\\Models\\User', 201),
(2, 'App\\Models\\User', 202),
(2, 'App\\Models\\User', 203),
(2, 'App\\Models\\User', 204),
(2, 'App\\Models\\User', 205),
(2, 'App\\Models\\User', 206),
(2, 'App\\Models\\User', 207),
(2, 'App\\Models\\User', 208),
(2, 'App\\Models\\User', 209),
(2, 'App\\Models\\User', 210),
(2, 'App\\Models\\User', 211),
(2, 'App\\Models\\User', 212),
(2, 'App\\Models\\User', 213),
(2, 'App\\Models\\User', 214),
(2, 'App\\Models\\User', 215),
(2, 'App\\Models\\User', 216),
(2, 'App\\Models\\User', 217),
(2, 'App\\Models\\User', 218),
(2, 'App\\Models\\User', 219),
(2, 'App\\Models\\User', 220),
(2, 'App\\Models\\User', 221),
(2, 'App\\Models\\User', 222),
(2, 'App\\Models\\User', 223),
(2, 'App\\Models\\User', 224);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(7) UNSIGNED ZEROFILL NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `dealer_id` bigint(20) DEFAULT NULL,
  `vehicle_id` bigint(20) DEFAULT NULL,
  `original_value` bigint(20) DEFAULT NULL,
  `discounted_value` bigint(255) DEFAULT NULL,
  `invoice_code` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `voucher_code_id` bigint(25) DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_vietnamese_ci,
  `ordered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `detail` mediumtext COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `dealer_id`, `vehicle_id`, `original_value`, `discounted_value`, `invoice_code`, `voucher_code_id`, `note`, `ordered_at`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `detail`) VALUES
(0000001, 67, 8, 1, 20000000, 20000000, '123456', NULL, 'Hóa đơn tạo ra để test hệ thống.', '2021-02-01 00:55:16', '2021-04-12 00:55:55', '2021-04-12 00:55:55', '2021-05-03 00:49:01', 1, NULL),
(0000002, 1, 8, 2, 20000000, 20000000, '123456', NULL, NULL, '2021-02-24 02:11:51', '2021-04-12 02:12:12', '2021-04-12 02:12:12', '2021-05-03 00:49:06', 1, NULL),
(0000003, 79, 8, 9, 651318, 651318, 'BH20900', NULL, NULL, '2021-04-25 06:49:59', '2021-04-26 10:54:55', '2021-05-05 09:23:09', '2021-05-05 09:23:09', 49, NULL),
(0000004, 78, 8, 8, 519454, 519454, '4PT7693', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:32:50', NULL, 1, NULL),
(0000005, 80, 8, 11, 1157900, 1157900, 'BH20901', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-05 09:23:32', '2021-05-05 09:23:32', 1, NULL),
(0000006, 77, 8, 7, 765000, 765000, '4TH29', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:32:24', NULL, 1, NULL),
(0000007, 76, 8, 6, 2391300, 2391300, 'BH20883', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-05 09:23:34', '2021-05-05 09:23:34', 1, NULL),
(0000008, 75, 8, 5, 455000, 455000, '4PT7681', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:31:50', NULL, 1, NULL),
(0000009, 74, 8, 4, 759818, 759818, '4TG804', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:31:16', NULL, 1, NULL),
(0000010, 79, 8, 9, 651318, 651318, '4TG803', NULL, NULL, '2021-04-25 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:30:55', NULL, 1, NULL),
(0000011, 82, 8, 12, 12046727, 12046727, '4TH31', NULL, NULL, '2021-04-26 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:29:47', NULL, 1, NULL),
(0000012, 87, 8, 17, 1690454, 1690454, '4PT7702', NULL, NULL, '2021-04-26 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:28:58', NULL, 1, NULL),
(0000013, 88, 8, 18, 998918, 998918, '4PT7697', NULL, NULL, '2021-04-26 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:27:58', NULL, 1, NULL),
(0000014, 92, 8, 22, 726318, 726318, '4PT7724', NULL, NULL, '2021-04-27 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:27:23', NULL, 1, NULL),
(0000015, 89, 8, 19, 612318, 612318, '4PT7718', NULL, NULL, '2021-04-27 17:00:00', '2021-04-29 10:52:21', '2021-05-04 10:26:50', NULL, 1, NULL),
(0000016, 94, 8, 24, 485000, 485000, '4PT7742', NULL, NULL, '2021-04-29 07:03:44', '2021-05-04 07:04:16', '2021-05-04 07:04:16', NULL, 1, NULL),
(0000017, 95, 8, 25, 455000, 455000, '4PT7748', NULL, NULL, '2021-04-28 17:00:00', '2021-05-04 10:38:27', '2021-05-04 10:38:27', NULL, 1, 'NHỚT MÁY, LỌC NHỚT'),
(0000018, 104, 8, 34, 509000, 509000, '4PT7805', NULL, NULL, '2021-05-04 17:00:00', '2021-05-06 06:56:23', '2021-05-06 06:56:23', NULL, 1, 'NHỚT MÁY, RỬA KÍNH, LỌC NHỚT, SƠN BH TAY CỬA'),
(0000019, 103, 8, 33, 765000, 765000, '4TH50', NULL, NULL, '2021-05-04 17:00:00', '2021-05-06 06:56:23', '2021-05-06 06:56:23', NULL, 1, 'NHỚT MÁY, LỌC NHỚT'),
(0000020, 101, 8, 31, 1045000, 1045000, '4PT7791', NULL, NULL, '2021-05-04 17:00:00', '2021-05-06 06:56:23', '2021-05-06 06:56:23', NULL, 1, 'NHỚT MÁY, LỌC NHỚT, LỌC GIÓ'),
(0000021, 102, 8, 32, 690909, 690909, '4TG821', NULL, NULL, '2021-05-04 17:00:00', '2021-05-06 06:56:23', '2021-05-06 06:56:23', NULL, 1, 'VS THẮNG, DD VS, ĐẢO VỎ, VS HỌNG GA'),
(0000022, 76, 8, 6, 650000, 650000, '4PT7804', NULL, NULL, '2021-05-04 17:00:00', '2021-05-06 06:56:23', '2021-05-06 06:56:23', NULL, 1, 'SƠN XE, LÀM ĐỒNG'),
(0000023, 107, 8, 36, 1118727, 1118727, '4TG826', NULL, NULL, '2021-05-07 17:00:00', '2021-05-10 07:30:34', '2021-05-10 07:30:34', NULL, 74, 'NHỚT MÁY, LỌC DẦU, DẦU THẮNG'),
(0000024, 108, 8, 37, 684000, 684000, '4PT7864', NULL, NULL, '2021-05-09 17:00:00', '2021-05-11 03:33:12', '2021-05-11 03:33:12', NULL, 74, 'NHỚT MÁY ĐỘNG CƠ'),
(0000025, 84, 8, 14, 765000, 765000, '4TH60', NULL, NULL, '2021-05-10 17:00:00', '2021-05-12 03:28:08', '2021-05-12 03:28:08', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000026, 116, 8, 42, 2856645, 2856645, '4PT7896', NULL, NULL, '2021-05-11 17:00:00', '2021-05-13 02:48:02', '2021-05-13 02:48:02', NULL, 74, 'NHỚT MÁY, LỌC GIÓ, DẦU, BULONG, LỌC GIÓ, VST, ĐẢO VỎ'),
(0000027, 121, 8, 46, 374000, 374000, '4PT7916', NULL, NULL, '2021-05-12 17:00:00', '2021-05-14 04:33:17', '2021-05-14 04:33:17', NULL, 74, 'NHỚT MÁY ĐỘNG CƠ, BH SƠN TAY CỬA'),
(0000028, 123, 8, 49, 794286, 794286, '4PT7917', NULL, NULL, '2021-05-12 17:00:00', '2021-05-14 04:33:18', '2021-05-14 04:33:18', NULL, 74, 'THAY NHỚT, DẦU, BUGI'),
(0000029, 143, 8, 67, 4786645, 4786645, '4TG847', NULL, NULL, '2021-05-13 17:00:00', '2021-05-17 05:44:55', '2021-05-17 05:44:55', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, LỌC GIÓ, BUGI, VS BUỒNG ĐỐT, ĐẢO VỎ'),
(0000030, 142, 8, 66, 576318, 576318, '4PT7929', NULL, NULL, '2021-05-13 17:00:00', '2021-05-17 05:44:55', '2021-05-17 05:44:55', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000031, 150, 8, 73, 455000, 455000, '4TH74', NULL, NULL, '2021-05-16 17:00:00', '2021-05-18 02:11:50', '2021-05-18 02:11:50', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000032, 144, 8, 68, 455000, 455000, '4PT7943', NULL, NULL, '2021-05-16 17:00:00', '2021-05-18 02:11:50', '2021-05-18 02:11:50', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000033, 149, 8, 72, 1321647, 1321647, '4PT7949', NULL, NULL, '2021-05-16 17:00:00', '2021-05-18 02:11:50', '2021-05-18 02:11:50', NULL, 74, 'NHỚT MÁY, LỌC DẦU, BUGI, LỌC GIÓ, CHẮN BÙN'),
(0000034, 146, 8, 69, 905418, 905418, '4PT7947', NULL, NULL, '2021-05-16 17:00:00', '2021-05-18 02:11:51', '2021-05-18 02:11:51', NULL, 74, 'NHỚT MÁY, NƯỚC LÀM MÁT'),
(0000035, 157, 8, 80, 519454, 519454, '4TH75', NULL, NULL, '2021-05-17 17:00:00', '2021-05-19 04:05:17', '2021-05-19 04:05:17', NULL, 74, 'NHỚT MÁY ĐÔỘNG CƠ'),
(0000036, 148, 8, 71, 10349054, 10349054, '4PT7960', NULL, NULL, '2021-05-17 17:00:00', '2021-05-19 04:05:17', '2021-05-19 04:05:17', NULL, 74, 'GAS LANH, DẦU LẠNH, RON, DÂY ĐAI, MIẾNG CHEM'),
(0000037, 156, 8, 79, 190909, 190909, '4PT7959', NULL, NULL, '2021-05-17 17:00:00', '2021-05-19 04:05:18', '2021-05-19 04:05:18', NULL, 74, 'BULONG, VST'),
(0000038, 154, 8, 77, 736318, 736318, '4PT7955', NULL, NULL, '2021-05-17 17:00:00', '2021-05-19 04:05:18', '2021-05-19 04:05:18', NULL, 74, 'NHOỚT MÁY, DẦU THẮNG'),
(0000039, 94, 8, 24, 882000, 882000, '4PT7849', NULL, NULL, '2021-05-03 17:00:00', '2021-05-19 09:45:43', '2021-05-19 09:45:43', NULL, 74, 'NHỚT MÁY, LỌC DẦU'),
(0000040, 99, 8, 29, 756999, 756999, '4PT7795', NULL, NULL, '2021-05-04 17:00:00', '2021-05-19 10:03:15', '2021-05-19 10:03:15', NULL, 74, 'NHỚT MÁY ĐỘNG CƠ, BH CÒI ÂM LƯỢNG, BH SƠN TAY CỬA'),
(0000041, 104, 8, 34, 909091, 909091, '4PT7974', NULL, NULL, '2021-05-09 17:00:00', '2021-05-21 01:44:32', '2021-05-21 01:44:32', NULL, 74, 'SƠN XE, LÀM ĐỒNG'),
(0000042, 124, 8, 48, 765000, 765000, '4PT7963', NULL, NULL, '2021-05-18 17:00:00', '2021-05-21 02:22:07', '2021-05-21 02:22:07', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000043, 169, 8, 92, 3509645, 3509645, '4TG854', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:56', '2021-05-21 06:18:56', NULL, 74, 'NHỚT MÁY, DẦU, BUGI, VS BUỒNG ĐỐT, LÀM MÁT, SƠN BH TAY CỬA'),
(0000044, 170, 8, 93, 455000, 455000, '4TH81', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000045, 135, 8, 61, 859000, 859000, '4PT7995', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, GÒ ĐÈN SƯƠNG MÙ'),
(0000046, 164, 8, 87, 819000, 819000, '4PT7984', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RỬA KÍNH'),
(0000047, 163, 8, 86, 471000, 471000, '4PT7983', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, ĐEÈN SƯƠNG MÙ'),
(0000048, 161, 8, 84, 1261818, 1261818, '4PT7982', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'DẦU HỘP SỐ, BH TAY CỬA'),
(0000049, 160, 8, 83, 428000, 428000, '4PT7980', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, RỬA KÍNH'),
(0000050, 166, 8, 89, 636818, 636818, '4PT7987', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000051, 165, 8, 88, 636818, 636818, '4PT7985', NULL, NULL, '2021-05-19 17:00:00', '2021-05-21 06:18:57', '2021-05-21 06:18:57', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000052, 140, 8, 65, 542920, 542920, '4PT8003', NULL, NULL, '2021-05-20 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, LỌC DẦU'),
(0000053, 172, 8, 95, 899818, 899818, '4PT7996', NULL, NULL, '2021-05-20 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, VST, DÂY ĐAI, BH SƠN TAY CỬA'),
(0000054, 181, 8, 104, 455000, 455000, '4PT8018', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, SƠN BH TAY CỬA'),
(0000055, 180, 8, 103, 684000, 684000, '4PT8017', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY ĐÔỘNG CƠ'),
(0000056, 178, 8, 101, 374000, 374000, '4PT8016', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY ĐÔỘNG CƠ'),
(0000057, 173, 8, 96, 509000, 509000, '4PT8006', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RỬA KÍNH, SƠN BH TAY CỬA'),
(0000058, 176, 8, 99, 919818, 919818, '4TH83', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, NƯỚC RỬA KÍNH'),
(0000059, 179, 8, 102, 1206727, 1206727, '4PT8015', NULL, NULL, '2021-05-21 17:00:00', '2021-05-24 02:47:55', '2021-05-24 02:47:55', NULL, 74, 'NHỚT MÁY, BUGI'),
(0000060, 184, 8, 107, 455000, 455000, '4TH85', NULL, NULL, '2021-05-23 17:00:00', '2021-05-25 03:56:22', '2021-05-25 03:56:22', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000061, 183, 8, 106, 765000, 765000, '4PT8022', NULL, NULL, '2021-05-23 17:00:00', '2021-05-25 03:56:22', '2021-05-25 03:56:22', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000062, 182, 8, 105, 605000, 605000, '4PT8021', NULL, NULL, '2021-05-23 17:00:00', '2021-05-25 03:56:23', '2021-05-25 03:56:23', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, VST'),
(0000063, 189, 8, 112, 455000, 455000, '4PT8039', NULL, NULL, '2021-05-24 17:00:00', '2021-05-26 02:24:43', '2021-05-26 02:24:43', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, SƠN BH TAY CỬA'),
(0000064, 188, 8, 111, 455000, 455000, '4PT8038', NULL, NULL, '2021-05-24 17:00:00', '2021-05-26 02:24:43', '2021-05-26 02:24:43', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, SƠN BH TAY CỬA'),
(0000065, 190, 8, 113, 455000, 455000, '4PT8044', NULL, NULL, '2021-05-25 17:00:00', '2021-05-27 03:09:03', '2021-05-27 03:09:03', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000066, 191, 8, 114, 1065818, 1065818, '4TH90', NULL, NULL, '2021-05-25 17:00:00', '2021-05-27 03:09:03', '2021-05-27 03:09:03', NULL, 74, 'VS BUỒNG ĐỐT, BUGI'),
(0000067, 192, 8, 115, 353727, 353727, '4PT8046', NULL, NULL, '2021-05-25 17:00:00', '2021-05-27 03:09:04', '2021-05-27 03:09:04', NULL, 74, 'LỌC NHỚT, TĂNG LOXO GHÉ'),
(0000068, 171, 8, 94, 765000, 765000, '4TH82', NULL, NULL, '2021-05-25 17:00:00', '2021-05-27 03:09:04', '2021-05-27 03:09:04', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000069, 195, 8, 118, 1601560, 1601560, '4PT8059', NULL, NULL, '2021-05-26 17:00:00', '2021-05-28 02:38:08', '2021-05-28 02:38:08', NULL, 74, 'NHỚT MÁY, DẦU, BÓNG ĐÈN, VST, sơn bh tay cửa'),
(0000070, 197, 8, 120, 946818, 946818, '4PT8074', NULL, NULL, '2021-05-26 17:00:00', '2021-05-28 02:38:08', '2021-05-28 02:38:08', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000071, 196, 8, 119, 1287727, 1287727, '4PT8073', NULL, NULL, '2021-05-26 17:00:00', '2021-05-28 02:38:08', '2021-05-28 02:38:08', NULL, 74, 'NHỚT MÁY, LỌC, BUGI'),
(0000072, 200, 8, 123, 509000, 509000, '4PT8086', NULL, NULL, '2021-05-27 17:00:00', '2021-05-31 03:46:16', '2021-05-31 03:46:16', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RỬA KÍNH, BH TAY CỬA'),
(0000073, 198, 8, 121, 1804454, 1804454, '4PT8080', NULL, NULL, '2021-05-27 17:00:00', '2021-05-31 03:46:16', '2021-05-31 03:46:16', NULL, 74, 'NHỚT MÁY, LỌC DẦU, ÁC QUY'),
(0000074, 133, 8, 60, 542920, 542920, '4PT8101', NULL, NULL, '2021-05-28 17:00:00', '2021-05-31 03:46:16', '2021-05-31 03:46:16', NULL, 74, 'NHỚT MÁY, LỌC DẦU'),
(0000075, 202, 8, 125, 468000, 468000, '4PT8108', NULL, NULL, '2021-05-30 17:00:00', '2021-06-01 03:10:14', '2021-06-01 03:10:14', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON, BH TAY CỬA'),
(0000076, 87, 8, 17, 1285727, 1285727, '4TH97', NULL, NULL, '2021-05-30 17:00:00', '2021-06-01 03:10:14', '2021-06-01 03:10:14', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, DẦU, BUGI'),
(0000077, 204, 8, 126, 812818, 812818, '4PT8110', NULL, NULL, '2021-05-30 17:00:00', '2021-06-01 03:10:14', '2021-06-01 03:10:14', NULL, 74, 'NHỚT MÁY, RUWAT KÍNH, LỌC DẦU'),
(0000078, 201, 8, 124, 989454, 989454, '4PT8107', NULL, NULL, '2021-05-30 17:00:00', '2021-06-01 03:10:14', '2021-06-01 03:10:14', NULL, 74, 'NHỚT MÁY, LỌC DẦU, RON, VST, ĐẢO VỎ'),
(0000079, 206, 8, 127, 840818, 840818, '4PT8113', NULL, NULL, '2021-05-31 17:00:00', '2021-06-02 02:30:42', '2021-06-02 02:30:42', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, VST, RỬA KÍNH'),
(0000080, 208, 8, 129, 845818, 845818, '4PT8126', NULL, NULL, '2021-06-01 17:00:00', '2021-06-03 02:10:20', '2021-06-03 02:10:20', NULL, 74, 'NHỚT MÁY, LỌC GIÓ, SƠN BH TAY CỬA'),
(0000081, 207, 8, 128, 455000, 455000, '4PT8125', NULL, NULL, '2021-06-01 17:00:00', '2021-06-03 02:10:20', '2021-06-03 02:10:20', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000082, 170, 8, 93, 1818182, 1818182, '4PT8137', NULL, NULL, '2021-05-30 17:00:00', '2021-06-04 01:30:21', '2021-06-04 01:30:21', NULL, 74, 'BH TAY CỬA, SƠN XE'),
(0000083, 218, 8, 139, 738000, 738000, '4PT8138', NULL, NULL, '2021-06-02 17:00:00', '2021-06-04 02:11:40', '2021-06-04 02:11:40', NULL, 74, 'NHỚT MÁY, RỬA KÍNH'),
(0000084, 209, 8, 130, 468000, 468000, '4PT8129', NULL, NULL, '2021-06-02 17:00:00', '2021-06-04 02:11:40', '2021-06-04 02:11:40', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON,'),
(0000085, 214, 8, 135, 1040818, 1040818, '4PT8136', NULL, NULL, '2021-06-02 17:00:00', '2021-06-04 02:11:40', '2021-06-04 02:11:40', NULL, 74, 'NHỚT MÁY, BÓNG ĐÈN, LỌC NHỚT, VST, ĐENKIM, BULONG'),
(0000086, 219, 8, 140, 735000, 735000, '4PT8147', NULL, NULL, '2021-06-03 17:00:00', '2021-06-07 03:20:22', '2021-06-07 03:20:22', NULL, 74, 'NHỚT MÁY, LỌC NHỚT ,LỌC GIÓ, SƠN BH TAY CỬA'),
(0000087, 221, 8, 141, 1131227, 1131227, '4TG880', NULL, NULL, '2021-06-03 17:00:00', '2021-06-07 03:20:23', '2021-06-07 03:20:23', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RON, VST'),
(0000088, 222, 8, 142, 829454, 829454, '4PT8143', NULL, NULL, '2021-06-03 17:00:00', '2021-06-07 03:20:23', '2021-06-07 03:20:23', NULL, 74, 'NHỚT MÁY ĐÔỘNG CƠ'),
(0000089, 210, 8, 131, 765000, 765000, '4PT8145', NULL, NULL, '2021-06-04 17:00:00', '2021-06-07 03:20:23', '2021-06-07 03:20:23', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000090, 224, 8, 144, 819000, 819000, '4TG881', NULL, NULL, '2021-06-06 17:00:00', '2021-06-08 02:05:43', '2021-06-08 02:05:43', NULL, 74, 'nhớt máy, LỌC NHỚT, RỬA KÍNH'),
(0000091, 223, 8, 143, 799818, 799818, '4PT8151', NULL, NULL, '2021-06-06 17:00:00', '2021-06-08 02:05:43', '2021-06-08 02:05:43', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON, VST, ĐẢO VỎ'),
(0000092, 225, 8, 145, 428000, 428000, '4PT8161', NULL, NULL, '2021-06-07 17:00:00', '2021-06-09 02:17:24', '2021-06-09 02:17:24', NULL, 74, 'NHỚT MÁY, RỬA KÍNH'),
(0000093, 148, 8, 71, 7778727, 7778727, '4PT8162', NULL, NULL, '2021-06-07 17:00:00', '2021-06-09 02:17:24', '2021-06-09 02:17:24', NULL, 74, 'thay mắt XÍCH BÁNH XE'),
(0000094, 231, 8, 151, 1318818, 1318818, '4PG884', NULL, NULL, '2021-06-08 17:00:00', '2021-06-10 02:26:43', '2021-06-10 02:26:43', NULL, 74, 'NHỚT MÁY, LỌC DẦU, RON, LỌC GIÓ, BH PHUỘC SAU TRÁI'),
(0000095, 230, 8, 150, 563000, 563000, '4PT8171', NULL, NULL, '2021-06-08 17:00:00', '2021-06-10 02:26:43', '2021-06-10 02:26:43', NULL, 74, 'NHỚT MÁY, LỌC DẦU'),
(0000096, 75, 8, 5, 374000, 374000, '4PT8166', NULL, NULL, '2021-06-08 17:00:00', '2021-06-10 02:26:43', '2021-06-10 02:26:43', NULL, 74, 'NHỚT MÁY ĐÔỘNG CƠ'),
(0000097, 227, 8, 147, 495000, 495000, '4PT8164', NULL, NULL, '2021-06-08 17:00:00', '2021-06-10 02:26:43', '2021-06-10 02:26:43', NULL, 74, 'NHỚT MÁY, LỌC DẦU, RON, NÚT XÃ'),
(0000098, 229, 8, 149, 613454, 613454, '4PT8169', NULL, NULL, '2021-06-08 17:00:00', '2021-06-10 02:26:43', '2021-06-10 02:26:43', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON,'),
(0000099, 236, 8, 155, 428000, 428000, '4PT8190', NULL, NULL, '2021-06-10 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'nhớt máy, RỬA KÍNH, BH TAY CỬA'),
(0000100, 234, 8, 153, 868909, 868909, '4PT8194', NULL, NULL, '2021-06-10 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MASYY, RỬA KÍNH, RON, SƠN BH TAY CỬA'),
(0000101, 235, 8, 154, 738000, 738000, '4TH105', NULL, NULL, '2021-06-10 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MÁY, RỬA KÍNH'),
(0000102, 233, 8, 152, 4795645, 4795645, '4PT8187', NULL, NULL, '2021-06-10 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MÁY, LỌC DẦU, BUGI, LỌC GIÓ, BỘ CẦN GẠT,DD VS'),
(0000103, 240, 8, 158, 778000, 778000, '4PT8200', NULL, NULL, '2021-06-11 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON, BH TAY CỬA'),
(0000104, 238, 8, 156, 468000, 468000, '4PT8195', NULL, NULL, '2021-06-11 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, RON, BH TAY CỬA'),
(0000105, 239, 8, 157, 1641454, 1641454, '4PT8196', NULL, NULL, '2021-06-11 17:00:00', '2021-06-14 02:47:15', '2021-06-14 02:47:15', NULL, 74, 'NHỚT MÁY, ÁC QUY, RON, NÚT DẦU'),
(0000106, 139, 8, 64, 819000, 819000, '4PT8213', NULL, NULL, '2021-06-13 17:00:00', '2021-06-15 02:43:59', '2021-06-15 02:43:59', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, LỌC NHỚT'),
(0000107, 243, 8, 161, 841000, 841000, '4PT8203', NULL, NULL, '2021-06-13 17:00:00', '2021-06-15 02:43:59', '2021-06-15 02:43:59', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RỬA KÍNH'),
(0000108, 242, 8, 160, 455000, 455000, '4PT8204', NULL, NULL, '2021-06-13 17:00:00', '2021-06-15 02:43:59', '2021-06-15 02:43:59', NULL, 74, 'NHỚT MÁY, LỌC NHỚT'),
(0000109, 241, 8, 159, 1073454, 1073454, '4PT8209', NULL, NULL, '2021-06-13 17:00:00', '2021-06-15 02:43:59', '2021-06-15 02:43:59', NULL, 74, 'NHỚT MÁY, RỬA KÍNH, VST, ĐẢO VỎ'),
(0000110, 247, 8, 165, 819000, 819000, '4PT8220', NULL, NULL, '2021-06-14 17:00:00', '2021-06-16 02:24:46', '2021-06-16 02:24:46', NULL, 74, 'nhớt máy, LỌC NHỚT, RỬA KÍNH, bh trục len lọc nhớt'),
(0000111, 245, 8, 163, 549000, 549000, '4PT8217', NULL, NULL, '2021-06-14 17:00:00', '2021-06-16 02:24:46', '2021-06-16 02:24:46', NULL, 74, 'NHỚT MÁY, LỌC NHỚT, RON, NƯỚC RỬA KÍNH'),
(0000112, 246, 8, 164, 2224569, 2224569, '4PT8218', NULL, NULL, '2021-06-14 17:00:00', '2021-06-16 02:24:46', '2021-06-16 02:24:46', NULL, 74, 'NHỚT MÁY, RON, NƯỚC LÀM MÁT, LỌC NHỚT, BUGI'),
(0000113, 250, 8, 168, 684000, 684000, '4TH113', NULL, NULL, '2021-06-15 17:00:00', '2021-06-17 02:13:41', '2021-06-17 02:13:41', NULL, 74, 'NHỚT MÁY ĐỘNG CƠ, SƠN BH TAY CỬA'),
(0000114, 251, 8, 169, 1079818, 1079818, '4PT8229', NULL, NULL, '2021-06-15 17:00:00', '2021-06-17 02:13:41', '2021-06-17 02:13:41', NULL, 74, 'NHỚT MÁY, LỌC GIÓ, RON, RỬA KÍNH, VST');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ftum5147@gmail.com', '$2y$10$FZjvuyXjx6/CsoI.N8/dYO2BdDPgYa40BnEKbBoXqlvnklYwM4/Cy', '2021-05-11 07:59:01');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Create Customer', 'web', '2020-11-03 02:02:38', '2020-11-24 07:21:35'),
(2, 'Create Membership', 'web', '2020-11-24 07:21:27', '2020-11-24 07:21:27'),
(3, 'Create Order', 'web', '2021-04-12 03:20:56', '2021-04-12 03:20:56'),
(4, 'View Order', 'web', '2021-04-12 03:21:41', '2021-04-12 03:21:41'),
(5, 'Edit Order', 'web', '2021-04-12 03:21:56', '2021-04-12 03:21:56'),
(6, 'View Customer', 'web', '2021-04-12 03:22:20', '2021-04-12 03:22:20'),
(7, 'Edit Customer', 'web', '2021-04-12 03:22:24', '2021-04-12 03:22:24'),
(8, 'Delete Customer', 'web', '2021-04-12 03:22:31', '2021-04-12 03:22:31'),
(9, 'Delete Order', 'web', '2021-04-12 03:22:35', '2021-04-12 03:22:35'),
(10, 'Create Vehicle', 'web', '2021-04-12 06:09:11', '2021-04-12 06:09:11'),
(11, 'Delete Vehicle', 'web', '2021-04-12 06:09:20', '2021-04-12 06:09:35'),
(12, 'View Vehicle', 'web', '2021-04-12 06:10:29', '2021-04-12 06:10:29'),
(13, 'Edit Vehicle', 'web', '2021-04-12 06:10:35', '2021-04-12 06:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `point_histories`
--

CREATE TABLE `point_histories` (
  `id` int(25) NOT NULL,
  `customer_id` bigint(25) UNSIGNED NOT NULL,
  `voucher_code_id` bigint(25) UNSIGNED DEFAULT NULL,
  `amount` bigint(2) DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `sufficiency_reached` tinyint(4) DEFAULT NULL COMMENT 'Check if point balance is enough to buy discount vouchers.',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `point_histories`
--

INSERT INTO `point_histories` (`id`, `customer_id`, `voucher_code_id`, `amount`, `type`, `sufficiency_reached`, `order_id`, `created_at`, `updated_at`, `expired_at`, `deleted_at`) VALUES
(1, 67, NULL, 200, '3', 45, 1, '2021-02-01 00:55:16', '2021-04-12 00:55:55', NULL, NULL),
(2, 67, 1, -45, '1', NULL, NULL, '2021-04-12 01:47:27', '2021-04-12 01:47:27', NULL, NULL),
(3, 67, 2, -30, '1', NULL, NULL, '2021-04-12 01:48:20', '2021-04-12 01:48:20', NULL, NULL),
(4, 1, NULL, 200, '3', 45, 2, '2021-02-24 02:11:51', '2021-04-12 02:12:12', NULL, NULL),
(5, 1, 3, -45, '1', NULL, NULL, '2021-04-12 02:29:44', '2021-04-12 02:29:44', NULL, NULL),
(6, 79, NULL, 7, '3', NULL, 3, '2021-04-25 06:49:59', '2021-05-05 09:23:09', NULL, '2021-05-05 09:23:09'),
(7, 78, NULL, 5, '3', NULL, 4, '2021-04-25 17:00:00', '2021-04-29 10:52:21', NULL, NULL),
(8, 80, NULL, 11, '3', NULL, 5, '2021-04-25 17:00:00', '2021-05-05 09:23:32', NULL, '2021-05-05 09:23:32'),
(9, 77, NULL, 7, '3', NULL, 6, '2021-04-25 17:00:00', '2021-05-04 10:32:24', NULL, NULL),
(10, 76, NULL, 23, '3', NULL, 7, '2021-04-25 17:00:00', '2021-05-05 09:23:34', NULL, '2021-05-05 09:23:34'),
(11, 75, NULL, 4, '3', NULL, 8, '2021-04-25 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(12, 74, NULL, 7, '3', NULL, 9, '2021-04-25 17:00:00', '2021-05-04 10:31:16', NULL, NULL),
(13, 79, NULL, 6, '3', NULL, 10, '2021-04-25 17:00:00', '2021-05-04 10:30:55', NULL, NULL),
(14, 82, NULL, 120, '3', 45, 11, '2021-04-26 17:00:00', '2021-05-04 10:29:47', NULL, NULL),
(15, 87, NULL, 16, '3', NULL, 12, '2021-04-26 17:00:00', '2021-06-01 03:10:14', NULL, NULL),
(16, 88, NULL, 9, '3', NULL, 13, '2021-04-26 17:00:00', '2021-05-04 10:27:58', NULL, NULL),
(17, 92, NULL, 7, '3', NULL, 14, '2021-04-27 17:00:00', '2021-04-29 10:52:21', NULL, NULL),
(18, 89, NULL, 6, '3', NULL, 15, '2021-04-27 17:00:00', '2021-04-29 10:52:21', NULL, NULL),
(19, 94, NULL, 4, '3', NULL, 16, '2021-04-29 07:03:44', '2021-05-19 09:45:43', NULL, NULL),
(20, 95, NULL, 4, '3', NULL, 17, '2021-04-28 17:00:00', '2021-05-04 10:38:27', NULL, NULL),
(21, 104, NULL, 5, '3', NULL, 18, '2021-05-04 17:00:00', '2021-05-21 01:44:32', NULL, NULL),
(22, 103, NULL, 7, '3', NULL, 19, '2021-05-04 17:00:00', '2021-05-06 06:56:23', NULL, NULL),
(23, 101, NULL, 10, '3', NULL, 20, '2021-05-04 17:00:00', '2021-05-06 06:56:23', NULL, NULL),
(24, 102, NULL, 6, '3', NULL, 21, '2021-05-04 17:00:00', '2021-05-06 06:56:23', NULL, NULL),
(25, 76, NULL, 6, '3', NULL, 22, '2021-05-04 17:00:00', '2021-05-06 06:56:23', NULL, NULL),
(26, 107, NULL, 11, '3', NULL, 23, '2021-05-07 17:00:00', '2021-05-10 07:30:34', NULL, NULL),
(27, 108, NULL, 6, '3', NULL, 24, '2021-05-09 17:00:00', '2021-05-11 03:33:12', NULL, NULL),
(28, 84, NULL, 7, '3', NULL, 25, '2021-05-10 17:00:00', '2021-05-12 03:28:08', NULL, NULL),
(29, 116, NULL, 28, '3', NULL, 26, '2021-05-11 17:00:00', '2021-05-13 02:48:02', NULL, NULL),
(30, 121, NULL, 3, '3', NULL, 27, '2021-05-12 17:00:00', '2021-05-14 04:33:17', NULL, NULL),
(31, 123, NULL, 7, '3', NULL, 28, '2021-05-12 17:00:00', '2021-05-14 04:33:18', NULL, NULL),
(32, 143, NULL, 47, '3', NULL, 29, '2021-05-13 17:00:00', '2021-05-17 05:44:55', NULL, NULL),
(33, 142, NULL, 5, '3', NULL, 30, '2021-05-13 17:00:00', '2021-05-17 05:44:55', NULL, NULL),
(34, 150, NULL, 4, '3', NULL, 31, '2021-05-16 17:00:00', '2021-05-18 02:11:50', NULL, NULL),
(35, 144, NULL, 4, '3', NULL, 32, '2021-05-16 17:00:00', '2021-05-18 02:11:50', NULL, NULL),
(36, 149, NULL, 13, '3', NULL, 33, '2021-05-16 17:00:00', '2021-05-18 02:11:51', NULL, NULL),
(37, 146, NULL, 9, '3', NULL, 34, '2021-05-16 17:00:00', '2021-05-18 02:11:51', NULL, NULL),
(38, 157, NULL, 5, '3', NULL, 35, '2021-05-17 17:00:00', '2021-05-19 04:05:17', NULL, NULL),
(39, 148, NULL, 103, '3', NULL, 36, '2021-05-17 17:00:00', '2021-05-19 04:05:17', NULL, NULL),
(40, 156, NULL, 1, '3', NULL, 37, '2021-05-17 17:00:00', '2021-05-19 04:05:18', NULL, NULL),
(41, 154, NULL, 7, '3', NULL, 38, '2021-05-17 17:00:00', '2021-05-19 04:05:18', NULL, NULL),
(42, 94, NULL, 8, '3', NULL, 39, '2021-05-03 17:00:00', '2021-05-19 09:45:43', NULL, NULL),
(43, 99, NULL, 7, '3', NULL, 40, '2021-05-04 17:00:00', '2021-05-19 10:03:15', NULL, NULL),
(44, 104, NULL, 9, '3', NULL, 41, '2021-05-09 17:00:00', '2021-05-21 01:44:32', NULL, NULL),
(45, 124, NULL, 7, '3', NULL, 42, '2021-05-18 17:00:00', '2021-05-21 02:22:07', NULL, NULL),
(46, 169, NULL, 35, '3', NULL, 43, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(47, 170, NULL, 4, '3', NULL, 44, '2021-05-19 17:00:00', '2021-06-04 01:30:21', NULL, NULL),
(48, 135, NULL, 8, '3', NULL, 45, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(49, 164, NULL, 8, '3', NULL, 46, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(50, 163, NULL, 4, '3', NULL, 47, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(51, 161, NULL, 12, '3', NULL, 48, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(52, 160, NULL, 4, '3', NULL, 49, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(53, 166, NULL, 6, '3', NULL, 50, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(54, 165, NULL, 6, '3', NULL, 51, '2021-05-19 17:00:00', '2021-05-21 06:18:57', NULL, NULL),
(55, 140, NULL, 5, '3', NULL, 52, '2021-05-20 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(56, 172, NULL, 8, '3', NULL, 53, '2021-05-20 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(57, 181, NULL, 4, '3', NULL, 54, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(58, 180, NULL, 6, '3', NULL, 55, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(59, 178, NULL, 3, '3', NULL, 56, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(60, 173, NULL, 5, '3', NULL, 57, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(61, 176, NULL, 9, '3', NULL, 58, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(62, 179, NULL, 12, '3', NULL, 59, '2021-05-21 17:00:00', '2021-05-24 02:47:55', NULL, NULL),
(63, 184, NULL, 4, '3', NULL, 60, '2021-05-23 17:00:00', '2021-05-25 03:56:22', NULL, NULL),
(64, 183, NULL, 7, '3', NULL, 61, '2021-05-23 17:00:00', '2021-05-25 03:56:23', NULL, NULL),
(65, 182, NULL, 6, '3', NULL, 62, '2021-05-23 17:00:00', '2021-05-25 03:56:23', NULL, NULL),
(66, 189, NULL, 4, '3', NULL, 63, '2021-05-24 17:00:00', '2021-05-26 02:24:43', NULL, NULL),
(67, 188, NULL, 4, '3', NULL, 64, '2021-05-24 17:00:00', '2021-05-26 02:24:43', NULL, NULL),
(68, 190, NULL, 4, '3', NULL, 65, '2021-05-25 17:00:00', '2021-05-27 03:09:03', NULL, NULL),
(69, 191, NULL, 10, '3', NULL, 66, '2021-05-25 17:00:00', '2021-05-27 03:09:04', NULL, NULL),
(70, 192, NULL, 3, '3', NULL, 67, '2021-05-25 17:00:00', '2021-05-27 03:09:04', NULL, NULL),
(71, 171, NULL, 7, '3', NULL, 68, '2021-05-25 17:00:00', '2021-05-27 03:09:04', NULL, NULL),
(72, 195, NULL, 16, '3', NULL, 69, '2021-05-26 17:00:00', '2021-05-28 02:38:08', NULL, NULL),
(73, 197, NULL, 9, '3', NULL, 70, '2021-05-26 17:00:00', '2021-05-28 02:38:08', NULL, NULL),
(74, 196, NULL, 12, '3', NULL, 71, '2021-05-26 17:00:00', '2021-05-28 02:38:08', NULL, NULL),
(75, 200, NULL, 5, '3', NULL, 72, '2021-05-27 17:00:00', '2021-05-31 03:46:16', NULL, NULL),
(76, 198, NULL, 18, '3', NULL, 73, '2021-05-27 17:00:00', '2021-05-31 03:46:16', NULL, NULL),
(77, 133, NULL, 5, '3', NULL, 74, '2021-05-28 17:00:00', '2021-05-31 03:46:16', NULL, NULL),
(78, 202, NULL, 4, '3', NULL, 75, '2021-05-30 17:00:00', '2021-06-01 03:10:14', NULL, NULL),
(79, 87, NULL, 12, '3', NULL, 76, '2021-05-30 17:00:00', '2021-06-01 03:10:14', NULL, NULL),
(80, 204, NULL, 8, '3', NULL, 77, '2021-05-30 17:00:00', '2021-06-01 03:10:14', NULL, NULL),
(81, 201, NULL, 9, '3', NULL, 78, '2021-05-30 17:00:00', '2021-06-01 03:10:14', NULL, NULL),
(82, 206, NULL, 8, '3', NULL, 79, '2021-05-31 17:00:00', '2021-06-02 02:30:42', NULL, NULL),
(83, 208, NULL, 8, '3', NULL, 80, '2021-06-01 17:00:00', '2021-06-03 02:10:20', NULL, NULL),
(84, 207, NULL, 4, '3', NULL, 81, '2021-06-01 17:00:00', '2021-06-03 02:10:20', NULL, NULL),
(85, 170, NULL, 18, '3', NULL, 82, '2021-05-30 17:00:00', '2021-06-04 01:30:21', NULL, NULL),
(86, 218, NULL, 7, '3', NULL, 83, '2021-06-02 17:00:00', '2021-06-04 02:11:40', NULL, NULL),
(87, 209, NULL, 4, '3', NULL, 84, '2021-06-02 17:00:00', '2021-06-04 02:11:40', NULL, NULL),
(88, 214, NULL, 10, '3', NULL, 85, '2021-06-02 17:00:00', '2021-06-04 02:11:40', NULL, NULL),
(89, 219, NULL, 7, '3', NULL, 86, '2021-06-03 17:00:00', '2021-06-07 03:20:23', NULL, NULL),
(90, 221, NULL, 11, '3', NULL, 87, '2021-06-03 17:00:00', '2021-06-07 03:20:23', NULL, NULL),
(91, 222, NULL, 8, '3', NULL, 88, '2021-06-03 17:00:00', '2021-06-07 03:20:23', NULL, NULL),
(92, 210, NULL, 7, '3', NULL, 89, '2021-06-04 17:00:00', '2021-06-07 03:20:23', NULL, NULL),
(93, 224, NULL, 8, '3', NULL, 90, '2021-06-06 17:00:00', '2021-06-08 02:05:43', NULL, NULL),
(94, 223, NULL, 7, '3', NULL, 91, '2021-06-06 17:00:00', '2021-06-08 02:05:43', NULL, NULL),
(95, 225, NULL, 4, '3', NULL, 92, '2021-06-07 17:00:00', '2021-06-09 02:17:24', NULL, NULL),
(96, 148, NULL, 77, '3', 45, 93, '2021-06-07 17:00:00', '2021-06-09 02:17:24', NULL, NULL),
(97, 231, NULL, 13, '3', NULL, 94, '2021-06-08 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(98, 230, NULL, 5, '3', NULL, 95, '2021-06-08 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(99, 75, NULL, 3, '3', NULL, 96, '2021-06-08 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(100, 227, NULL, 4, '3', NULL, 97, '2021-06-08 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(101, 229, NULL, 6, '3', NULL, 98, '2021-06-08 17:00:00', '2021-06-10 02:26:43', NULL, NULL),
(102, 236, NULL, 4, '3', NULL, 99, '2021-06-10 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(103, 234, NULL, 8, '3', NULL, 100, '2021-06-10 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(104, 235, NULL, 7, '3', NULL, 101, '2021-06-10 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(105, 233, NULL, 47, '3', NULL, 102, '2021-06-10 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(106, 240, NULL, 7, '3', NULL, 103, '2021-06-11 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(107, 238, NULL, 4, '3', NULL, 104, '2021-06-11 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(108, 239, NULL, 16, '3', NULL, 105, '2021-06-11 17:00:00', '2021-06-14 02:47:15', NULL, NULL),
(109, 139, NULL, 8, '3', NULL, 106, '2021-06-13 17:00:00', '2021-06-15 02:43:59', NULL, NULL),
(110, 243, NULL, 8, '3', NULL, 107, '2021-06-13 17:00:00', '2021-06-15 02:43:59', NULL, NULL),
(111, 242, NULL, 4, '3', NULL, 108, '2021-06-13 17:00:00', '2021-06-15 02:43:59', NULL, NULL),
(112, 241, NULL, 10, '3', NULL, 109, '2021-06-13 17:00:00', '2021-06-15 02:43:59', NULL, NULL),
(113, 247, NULL, 8, '3', NULL, 110, '2021-06-14 17:00:00', '2021-06-16 02:24:46', NULL, NULL),
(114, 245, NULL, 5, '3', NULL, 111, '2021-06-14 17:00:00', '2021-06-16 02:24:46', NULL, NULL),
(115, 246, NULL, 22, '3', NULL, 112, '2021-06-14 17:00:00', '2021-06-16 02:24:46', NULL, NULL),
(116, 250, NULL, 6, '3', NULL, 113, '2021-06-15 17:00:00', '2021-06-17 02:13:41', NULL, NULL),
(117, 251, NULL, 10, '3', NULL, 114, '2021-06-15 17:00:00', '2021-06-17 02:13:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` varchar(25) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name_with_type` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `name_with_type`, `created_at`, `updated_at`) VALUES
('1', 'Hà Nội', 'Thành phố Hà Nội', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('10', 'Lào Cai', 'Tỉnh Lào Cai', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('11', 'Điện Biên', 'Tỉnh Điện Biên', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('12', 'Lai Châu', 'Tỉnh Lai Châu', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('14', 'Sơn La', 'Tỉnh Sơn La', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('15', 'Yên Bái', 'Tỉnh Yên Bái', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('17', 'Hoà Bình', 'Tỉnh Hoà Bình', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('19', 'Thái Nguyên', 'Tỉnh Thái Nguyên', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('2', 'Hà Giang', 'Tỉnh Hà Giang', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('20', 'Lạng Sơn', 'Tỉnh Lạng Sơn', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('22', 'Quảng Ninh', 'Tỉnh Quảng Ninh', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('24', 'Bắc Giang', 'Tỉnh Bắc Giang', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('25', 'Phú Thọ', 'Tỉnh Phú Thọ', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('26', 'Vĩnh Phúc', 'Tỉnh Vĩnh Phúc', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('27', 'Bắc Ninh', 'Tỉnh Bắc Ninh', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('30', 'Hải Dương', 'Tỉnh Hải Dương', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('31', 'Hải Phòng', 'Thành phố Hải Phòng', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('33', 'Hưng Yên', 'Tỉnh Hưng Yên', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('34', 'Thái Bình', 'Tỉnh Thái Bình', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('35', 'Hà Nam', 'Tỉnh Hà Nam', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('36', 'Nam Định', 'Tỉnh Nam Định', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('37', 'Ninh Bình', 'Tỉnh Ninh Bình', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('38', 'Thanh Hóa', 'Tỉnh Thanh Hóa', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('4', 'Cao Bằng', 'Tỉnh Cao Bằng', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('40', 'Nghệ An', 'Tỉnh Nghệ An', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('42', 'Hà Tĩnh', 'Tỉnh Hà Tĩnh', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('44', 'Quảng Bình', 'Tỉnh Quảng Bình', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('45', 'Quảng Trị', 'Tỉnh Quảng Trị', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('46', 'Thừa Thiên Huế', 'Tỉnh Thừa Thiên Huế', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('48', 'Đà Nẵng', 'Thành phố Đà Nẵng', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('49', 'Quảng Nam', 'Tỉnh Quảng Nam', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('51', 'Quảng Ngãi', 'Tỉnh Quảng Ngãi', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('52', 'Bình Định', 'Tỉnh Bình Định', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('54', 'Phú Yên', 'Tỉnh Phú Yên', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('56', 'Khánh Hòa', 'Tỉnh Khánh Hòa', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('58', 'Ninh Thuận', 'Tỉnh Ninh Thuận', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('6', 'Bắc Kạn', 'Tỉnh Bắc Kạn', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('60', 'Bình Thuận', 'Tỉnh Bình Thuận', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('62', 'Kon Tum', 'Tỉnh Kon Tum', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('64', 'Gia Lai', 'Tỉnh Gia Lai', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('66', 'Đắk Lắk', 'Tỉnh Đắk Lắk', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('67', 'Đắk Nông', 'Tỉnh Đắk Nông', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('68', 'Lâm Đồng', 'Tỉnh Lâm Đồng', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('70', 'Bình Phước', 'Tỉnh Bình Phước', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('72', 'Tây Ninh', 'Tỉnh Tây Ninh', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('74', 'Bình Dương', 'Tỉnh Bình Dương', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('75', 'Đồng Nai', 'Tỉnh Đồng Nai', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('77', 'Bà Rịa - Vũng Tàu', 'Tỉnh Bà Rịa - Vũng Tàu', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('79', 'TP. Hồ Chí Minh', 'Thành phố Hồ Chí Minh', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('8', 'Tuyên Quang', 'Tỉnh Tuyên Quang', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('80', 'Long An', 'Tỉnh Long An', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('82', 'Tiền Giang', 'Tỉnh Tiền Giang', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('83', 'Bến Tre', 'Tỉnh Bến Tre', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('84', 'Trà Vinh', 'Tỉnh Trà Vinh', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('86', 'Vĩnh Long', 'Tỉnh Vĩnh Long', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('87', 'Đồng Tháp', 'Tỉnh Đồng Tháp', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('89', 'An Giang', 'Tỉnh An Giang', '2020-11-05 09:45:29', '2020-11-05 09:45:29'),
('91', 'Kiên Giang', 'Tỉnh Kiên Giang', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('92', 'Cần Thơ', 'Thành phố Cần Thơ', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('93', 'Hậu Giang', 'Tỉnh Hậu Giang', '2020-11-05 09:45:31', '2020-11-05 09:45:31'),
('94', 'Sóc Trăng', 'Tỉnh Sóc Trăng', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('95', 'Bạc Liêu', 'Tỉnh Bạc Liêu', '2020-11-05 09:45:30', '2020-11-05 09:45:30'),
('96', 'Cà Mau', 'Tỉnh Cà Mau', '2020-11-05 09:45:30', '2020-11-05 09:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-11-03 02:02:15', '2020-11-24 07:11:04'),
(2, 'Customer', 'web', '2020-11-08 14:30:08', '2020-11-24 07:11:40'),
(3, 'Dealer', 'web', '2020-11-08 14:30:18', '2020-11-24 07:11:30'),
(4, 'Staff', 'web', '2020-11-08 14:30:27', '2020-11-13 11:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(1, 3),
(3, 3),
(4, 3),
(6, 3),
(7, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` mediumint(25) NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mobile` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `creator` mediumint(25) DEFAULT NULL,
  `dealer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `email`, `mobile`, `status`, `creator`, `dealer_id`, `created_at`, `updated_at`, `deleted_at`, `email_verified_at`, `remember_token`, `last_login_at`) VALUES
(1, '$2y$10$q0OmsUETdKdqAkJ2JhybkuOzBdi8r7O.zvtTNGpcwoHvvp4jU78MK', 'phuongntd@vietnamsuzuki.com.vn', '0987955990', NULL, NULL, NULL, '2020-10-12 19:18:15', '2021-04-08 10:06:09', NULL, NULL, 'IKhUsBsfxPbRLGSohGrSJhoik9YUcAauQu2ekRLmfGeIyd0Gz9zCuzAW1uIU', NULL),
(21, '$2y$10$OmwMzBKCGrp2AVKhsdrreu1d7mEwDn06sG0YTwSqntynCxCtcRiXq', 'dealer@vietnamsuzuki.com.vn', NULL, 1, 1, 400015, '2020-11-17 06:05:14', '2020-11-17 06:12:51', NULL, NULL, NULL, NULL),
(22, '$2y$10$0o2LCVhkTxmj9A4mjLten.bjcETGK13bSRxjFzLZ2UUvOjjIM/9ii', 'duy@phuong.vn', '0987955991', 1, 1, NULL, '2020-11-24 07:44:18', '2020-11-24 07:44:18', NULL, NULL, NULL, NULL),
(34, '$2y$10$V6Hbpf.sZuLu0Smc/Ly2tO20grLc8Usgrt/A5IfIHj8hLL7W8zQli', 'viethoang@gmail.com', '0912333444', 1, NULL, NULL, '2021-04-06 09:54:52', '2021-04-06 09:54:52', NULL, NULL, NULL, NULL),
(35, '$2y$10$1OX82uHVEpEQUHIxid6SO.Kyg.IBqUhs.HS0kpIfB1gAp9azqQKMS', 'zulik.nguyen@gmail.com', '0909023523', 1, NULL, NULL, '2021-04-09 11:14:55', '2021-04-19 07:33:23', NULL, NULL, 'WMPDCawh4plmZVQfxEFhjI4W64RbAC2C1pVNEfZ7eWyBdjzraUqlDmfs85wn', NULL),
(36, '$2y$10$3YzPPD1r8QLNnGnoVH9fS.z7.eAIxv7vdAdPdk0ldB4PkoBI.n1A6', 'hungnv@vietnamsuzuki.com.vn', '0909090909', 1, NULL, NULL, '2021-04-11 03:27:45', '2021-04-11 03:27:45', NULL, NULL, NULL, NULL),
(37, '$2y$10$gqIwckqF9hNl.PBRMr87c.p/DRHKuwbHsz4wFpR7MdLP4JPHYiPgu', 'ngocdtb@vietnamsuzuki.com.vn', '0937800078', 1, NULL, NULL, '2021-04-12 11:10:56', '2021-04-12 11:10:56', NULL, NULL, '8SzmL8rAxBWvSo3eBQZeVrG8j4ohaqWH21iethslwKknukDiIwwFI1a0SoWA', NULL),
(38, '$2y$10$02j2dJ6jZwsn1UmvsdKjKOMc9yzTM0vea52Q62mb2sGSMinyoaXPS', 'PHUCPNH@VIETNAMSUZUKI.COM.VN', '0984706863', 1, NULL, NULL, '2021-04-16 06:36:32', '2021-06-03 02:37:09', NULL, NULL, 'QqHXNOTpApCHHuReKXVXMbHE1tmf4LsuS0T0yv3VxlqZhhaYP7tppJvGE3pI', NULL),
(39, '$2y$10$6yHymifC8L4IOcr9M8Y5MenE71ACEHSwcsTInGhfC9Fh8GYnwGj6O', 'dathp@vietnamsuzuki.com.vn', '0933574462', 1, NULL, 8, '2021-04-16 09:14:13', '2021-05-07 08:58:49', NULL, NULL, 'G2KJ37AhrIz84RtGVOrnvmHdFIGqZL9qAkECuRV8dzdJiIXQaQrmcptaE0xq', NULL),
(40, '$2y$10$wFSMNZCr4fTHDp/zr6LwReJ6YbEvCZkTDJ4pVb5705ErGLKLXvQPS', 'trungtq@vietnamsuzuki.com.vn', '0326293820', 1, NULL, 8, '2021-04-16 09:23:26', '2021-04-19 07:46:25', NULL, NULL, NULL, NULL),
(41, '$2y$10$eJKM6aE.YVOLsKEcB6lQ/epVzJ4BrSGaNhbLZgw/tU2HEFv5aQ316', 'vietnh@vietnamsuzuki.com.vn', '0586002181', 1, NULL, 8, '2021-04-16 09:32:50', '2021-04-19 07:46:12', NULL, NULL, 'U761VYHylY75H7Pext9m81bAhe53OLTNUess5p0G0gEsrysUJ7lZXvMNj81i', NULL),
(42, '$2y$10$3KvosvRTRS5SLRdg94JgoeWz00LnLnaWLyEsdlBm1hIG1zB.BKW8C', 'dinhchung1976@gmail.com', '0982343379', 1, NULL, NULL, '2021-04-26 01:49:30', '2021-04-26 01:49:30', NULL, NULL, 'RTUGikdZAe9aFhUXX3z9kdp2UFMdcFfIJXzCWv8xoxPTZfzgBZBBv5m94Fnn', NULL),
(43, '$2y$10$JPAg2kpRfe2u9Ap87o8uF.N3Emv2leMAJPOf1LSkZCJkR9HIPVSRO', 'tuanhn1970@gmail.com', '0937802568', 1, NULL, NULL, '2021-04-26 03:35:16', '2021-04-26 03:35:16', NULL, NULL, NULL, NULL),
(44, '$2y$10$Ih4SydO.VQ3esVlbHkwKhe99yc0Jm2cOT1McqYWAC//NkRe9PyubC', 'doquangvinh1@gmail.com', '0911391156', 1, NULL, NULL, '2021-04-26 03:50:16', '2021-04-26 03:50:16', NULL, NULL, NULL, NULL),
(45, '$2y$10$6ajGEv2z2DGocsYFY6HKw.QuNj/s1SljyplxCI/dgZ0a0nQJj/ddu', 'lxhien0808@gmail.com', '0898985759', 1, NULL, NULL, '2021-04-26 07:59:52', '2021-04-26 07:59:52', NULL, NULL, 'ym5gXcDX78vMsToTjyTEp0PViGZLBTGmFcNmtbVjPw2K3N5UvB6TbfAbutrk', NULL),
(46, '$2y$10$.xVGUcCajjsfBmGha7GcM.joQ5NuQ4qBLQqmSIf7jeP.4astfrP2C', 'tranquochau2008@gmail.com', '0982944438', 1, NULL, NULL, '2021-04-26 08:20:47', '2021-04-26 08:20:47', NULL, NULL, NULL, NULL),
(47, '$2y$10$eF4LiOC0JKx9sIB6lbDX5e0uokDM4AG/R7T.I322LWffJ9CMsts1O', 'dongphuckhaihung@gmail.com', '0907313833', 1, NULL, NULL, '2021-04-26 08:29:29', '2021-04-26 08:29:29', NULL, NULL, NULL, NULL),
(48, '$2y$10$dDG7SI9hdvCgLm0hPIuluejhf0zs/epo1r.VZp.CyNLGcRHP0C/7e', 'lifeofdqh@gmail.com', '0931323007', 1, NULL, NULL, '2021-04-26 09:10:41', '2021-04-26 09:10:41', NULL, NULL, NULL, NULL),
(49, '$2y$10$sx4tId6A6ljpYjlunepYAurlodnpW1CyWLcYBFM.AGmTA5xg0UHb2', 'hoangpn@vietnamsuzuki.com.vn', '0354620820', 1, NULL, 8, '2021-04-26 10:49:30', '2021-04-26 10:50:14', NULL, NULL, 'hh2bT3JZ9tNHcOfNNjlMMojinzXhM61Z8pKQKjvRJ9XaxceR5LyTVHiMwU84', NULL),
(50, '$2y$10$KeaTsM4RJHkU.SG1VVA7AuhNXSsO3YcLMoQt/0lMIaD4uio7uRJG2', 'nguyenduythuy28@gmail.com', '0913152802', 1, NULL, NULL, '2021-04-27 01:39:02', '2021-04-27 01:39:02', NULL, NULL, 'XoplVOx4cneJbA9z0wAqPlXRsb5cPKnxLmoZvgv4fZ8KkPwA5mgPqcKsvkso', NULL),
(51, '$2y$10$7VG.bG0l3vXC7XPqjtKpveAgkx.WAHoNV/PZhu3mfkchqs9b3O5.e', 'lukimngoc89@gmail.com', '0906892025', 1, NULL, NULL, '2021-04-27 02:14:32', '2021-04-27 02:14:32', NULL, NULL, NULL, NULL),
(52, '$2y$10$lTLIp6lga4JikebyCbTYd.RTMdelAi8Ek7CxyLWyKJDgM8FU.XQb2', 'ftum5147@gmail.com', '0988818105', 1, NULL, NULL, '2021-04-27 02:32:16', '2021-04-27 02:32:16', NULL, NULL, NULL, NULL),
(53, '$2y$10$iVd4d0AKh.h9JXFlCmdf2.qNWtOlrygUvH1FILHPsMocxZuYgjhJ.', 'phamtuananh0107@gmail.com', '0906835810', 1, NULL, NULL, '2021-04-27 02:56:00', '2021-04-27 02:56:00', NULL, NULL, NULL, NULL),
(54, '$2y$10$crjUsKfPkVKRjXaILlvb.u496hayQUwGP1MoCoUs4rsadvF8BnGBO', 'dangthuyhue@gmail.com', '0902370850', 1, NULL, NULL, '2021-04-27 03:07:16', '2021-04-27 03:07:16', NULL, NULL, NULL, NULL),
(55, '$2y$10$9Ppf46YostbHghQG1nLuuuD67utFQfKR2zQKRazLggbwHkg8bP/2u', 'hoangraulaodai14@gmail.com', '0869835373', 1, NULL, NULL, '2021-04-27 03:20:35', '2021-04-27 03:20:35', NULL, NULL, NULL, NULL),
(56, '$2y$10$pIXWVwBaBStgYslAYpzAWuqoPRpXJTaauJLg5qHLuuhWxperWRzje', 'tanhoanguyen@gmail.com', '0334846764', 1, NULL, NULL, '2021-04-27 03:30:41', '2021-04-27 03:30:41', NULL, NULL, 'bDF6S4ahgaxiWM96oB6T35a3F0cRzplugtpd38lY0KX7y4iVuIu8CmKLTJki', NULL),
(57, '$2y$10$jOa.If6ViUw50h6oAdX.IuV7flUJm4BH8yjL.ve9XDiq610bAINky', 'khadang2608@gmail.com', '0903962883', 1, NULL, NULL, '2021-04-28 01:14:55', '2021-04-28 01:14:55', NULL, NULL, NULL, NULL),
(58, '$2y$10$cOc3UaManDo1ciO7rhjXvu8hTDgL9c.OwbJZs92h.rUp/xHtbkL3C', 'quoc16@gmail.com', '0945679669', 1, NULL, NULL, '2021-04-28 02:30:29', '2021-04-28 02:30:29', NULL, NULL, NULL, NULL),
(59, '$2y$10$1.2o3.6zhfcL1Zz3ijmDTO1dIrrN.qcKPKUsdjmaeGEO8MP7vcWEu', 'dangkhoa17977@gmail.com', '0705553627', 1, NULL, NULL, '2021-04-28 02:52:39', '2021-04-28 02:52:39', NULL, NULL, NULL, NULL),
(60, '$2y$10$kXnzFHWxAjGq6BorJP1gwudKzw0et0z83LMNN6AiV3/aLA9xfKfWi', 'viethong0303@gmail.com', '0918062502', 1, NULL, NULL, '2021-04-28 04:26:45', '2021-04-28 04:26:45', NULL, NULL, NULL, NULL),
(61, '$2y$10$yMLl8PzjAONuGhdkuPeMgekC0.MqSZU8bqx87N.h66FMnuTDikNca', 'nguyenluan319@gmail.com', '0906663719', 1, NULL, NULL, '2021-04-29 00:42:58', '2021-04-29 00:42:58', NULL, NULL, NULL, NULL),
(62, '$2y$10$NjV94HDePJNoQfJWrDNmj.JA1ncfaX0cQfx3xgTc6vMWYoRYLawv6', 'kimthulieuvdq@gmail.com', '0778747055', 1, NULL, NULL, '2021-04-29 03:32:28', '2021-04-29 03:32:28', NULL, NULL, 'Q2wfLpYB51o8GnjsQMSZHsW5Db212EswlxPvsUbtXrcaQfMnLvfs8fVHYzdn', NULL),
(63, '$2y$10$eWHGCdYYTaeHf5NF.M4zVOvLeOpauLyRcVVNLjR.pO3hCAlQX0K8K', 'caotiendang130583@gmail.com', '0909345001', 1, NULL, NULL, '2021-04-29 06:40:13', '2021-04-29 06:40:13', NULL, NULL, NULL, NULL),
(64, '$2y$10$Nry4bb6IpnyjnTZfDALGDOkns3BSt0Rt3wEWC8OTwpoaC9GyQbFS6', 'chauvanbao@lttc.edu.vn', '0906677068', 1, NULL, NULL, '2021-05-04 08:22:23', '2021-05-04 08:22:23', NULL, NULL, '6Y3A1sHLNaYL4IHfY3m41W3kDQrFWhwYYdhQn0HNJcha1RIpYQ3dE04Fax3V', NULL),
(65, '$2y$10$aWpDcJZ7PrXNdvf5vmmTEuCr2z9D/Lqg9qFZNBXo1rfE2djO/ddxm', 'nquocanh1967@gmail.com', '0971005676', 1, NULL, NULL, '2021-05-05 01:48:39', '2021-05-05 01:48:39', NULL, NULL, NULL, NULL),
(66, '$2y$10$UxQPCum3UehyPyeyCs.z5OfG4gKwo2D2ZZ6Dy7C4BDPLNKETodhKG', 'Cuongthanhnam73@gmail.com', '0909298969', 1, NULL, NULL, '2021-05-05 01:58:52', '2021-05-05 01:58:52', NULL, NULL, NULL, NULL),
(67, '$2y$10$5tQbDohg1ZMQeihb/DZfU.z3M2wsaAxmTqjrmAxe8vlw9SVLibWsO', 'xuanca58@gmail.com', '0937710050', 1, NULL, NULL, '2021-05-05 02:14:58', '2021-05-05 02:14:58', NULL, NULL, NULL, NULL),
(68, '$2y$10$nrwhqDu6Y4JhB.9YHZnmyuP.rBRLeaHmqNRCbohx7ODTT3H6DfzmK', 'dtd1977@gmail.com', '0962599799', 1, NULL, NULL, '2021-05-05 02:24:15', '2021-05-05 02:24:15', NULL, NULL, '9Q9V58E5IRTEbW2CbqyrbQxXq9VcqtR0p3qkKf3RVkFD9RTyWRqFLQEMDwCR', NULL),
(69, '$2y$10$f5JirlSmaKR.PK6/IgYtOOS0qNjCdT.QWRJMd1.5Z5osh8aPR2m0a', 'khongco@gmail', '0988995473', 1, NULL, NULL, '2021-05-05 02:31:54', '2021-05-05 02:31:54', NULL, NULL, NULL, NULL),
(70, '$2y$10$uqx8plwJOFAMyplBmSPcDuQWY8CWMggy.HcF7jRdh4jaiGVwHYqgG', 'minhtrl@outlook.com', '0888560015', 1, NULL, NULL, '2021-05-05 02:36:49', '2021-05-05 02:36:49', NULL, NULL, NULL, NULL),
(71, '$2y$10$M.cwdd/TG2fI6oUJLP3bveDqmCBvcf5S/uMA7pTE3SzfoNdv0QIg6', 'dinhtrong603@gmail.com', '0975126546', 1, NULL, NULL, '2021-05-05 08:21:33', '2021-05-05 08:21:33', NULL, NULL, NULL, NULL),
(72, '$2y$10$wF0tSg.5RIoP/WYEtcwwxecNAZzsBG7EwShhMkN/HYrgatpGagi.a', 'tranduykhoa16121985@gmail.com', '0907460209', 1, NULL, NULL, '2021-05-05 08:37:21', '2021-05-05 08:37:21', NULL, NULL, 'FZTKKBdoEy2w3JxZEqhJ33s8Bt4TDpExmsbbZ7SDRReRgHr62ORcWwlfQoiA', NULL),
(73, '$2y$10$JrLOymb7eFhGSLtr5CelLeVdDkPoQipfNsusF0UB6S.0j9oOZEdwW', 'nguyenphuc841976@gmail.com', '0932129479', 1, NULL, NULL, '2021-05-06 02:06:18', '2021-05-06 02:06:18', NULL, NULL, 'EMJUDUxXS745SErnNZDyRTrrR2S60e4OOGYRTojlH2lOTbT9qKxfWgz03SE0', NULL),
(74, '$2y$10$lGUKQTx73aelMU559qcPIOwDfYCvOdER1qa5YJIOEr.e6O2hDKNK6', 'chamsockhachhang@vietnamsuzuki.com.vn', '0963365391', 1, NULL, 8, '2021-05-07 08:48:01', '2021-05-12 01:00:18', NULL, NULL, 'jQFPDwzPkouDpuDJYOaw4laDWKVL4zVM9joVqQttAuvEknCD4RvmgKIjTf9P', NULL),
(75, '$2y$10$JLCtvg5emwhSqroSLcOOIezRBWUsmVITLOniTVM9o8KGc9ij3UJb6', 'buithanhtamca@gmail.com', '0909346545', 1, NULL, NULL, '2021-05-08 01:39:57', '2021-05-08 01:39:57', NULL, NULL, NULL, NULL),
(76, '$2y$10$xQ9C3jSvx7VP7on6b1BMO.Hs3VTJuNX2MMIpqcYaxGIssy4O4JHPG', 'nhut53578@gmail.com', '0989302655', 1, NULL, NULL, '2021-05-10 01:45:57', '2021-05-10 01:45:57', NULL, NULL, '4TC0jBpXE53A49bQ4gHEKQbnTWoBfeVQ1fnQAeDoIv9co4LSKpZbgNCbNMun', NULL),
(77, '$2y$10$/o6BoTHgMdhfI2Y/.i1mL.JV7KCbyydtSfSmpoNdNtkOV55FavVNK', 'sinhdnguyenn@gmail.com', '0975039179', 1, NULL, NULL, '2021-05-10 01:51:44', '2021-05-10 01:51:44', NULL, NULL, NULL, NULL),
(78, '$2y$10$LImgnVxKNz11hsO6ZbxEreBvt/H5sHSyY42S7TgSwjqEmmCuxZh.a', 'lethien.sushiworldrest@gmail.com', '0937076276', 1, NULL, NULL, '2021-05-11 04:48:49', '2021-05-11 04:48:49', NULL, NULL, NULL, NULL),
(79, '$2y$10$.HE7ZN.XGYJkVKlliZLBIuIqyvAJAxcGHQi3JXIWmRaShxhPeoKgq', 'tqkhanhpcbd77@gmail.com', '0908124799', 1, NULL, NULL, '2021-05-11 06:18:04', '2021-05-11 06:18:04', NULL, NULL, 'uE8ntdfwTtrI6FKt8tSgzzxtblPZZVVUJNas1EnFnU6fEZM0z4few03YF6I7', NULL),
(80, '$2y$10$/uqQ8QqAC5/IoYXZ5zX8FOMPm.cfqqUo9fgNQKAfMhYqYJWQnt8Ku', 'vaithunphusang@gmail.com', '0938037704', 1, NULL, NULL, '2021-05-11 06:31:40', '2021-05-11 06:31:40', NULL, NULL, NULL, NULL),
(81, '$2y$10$YT.ajHamn9QeajPurLQRnO1zfzou5mJDH56Hh6wWvgK/p2x1HaZDy', 'gdmn@tamadong.com', '0985118383', 1, NULL, NULL, '2021-05-11 06:34:24', '2021-05-11 06:34:24', NULL, NULL, NULL, NULL),
(82, '$2y$10$RvBRCpbGUr.QuuSFsmzaKuNlUceSgzFOaPvJHGFnP6mk4Vn0xV0/y', 'nhanmercedes@gmail.com', '0985516613', 1, NULL, NULL, '2021-05-11 12:01:33', '2021-05-11 12:01:33', NULL, NULL, NULL, NULL),
(83, '$2y$10$X6zu66ndC3uXongruw8bvesdx4fe0NmhSpaMPHr04UQfM4wJhB2Xe', 'duylong1872@gmail.com', '0396983187', 1, NULL, NULL, '2021-05-12 02:47:49', '2021-05-12 02:47:49', NULL, NULL, NULL, NULL),
(84, '$2y$10$R5up7nEHG1dVe3e6GAmys.IeHGqQni8h1A3KGwAnchkLYKsIO.P/W', 'huuhao@gmail.com', '0909093948', 1, NULL, NULL, '2021-05-12 04:19:42', '2021-05-12 04:19:42', NULL, NULL, NULL, NULL),
(85, '$2y$10$Y97tk3el7gR.f2VXllbI1.KNhOcGAhFNvz1V9Ru82.9L79v30KvES', 'dothinudo@gmail.com', '0903996520', 1, NULL, NULL, '2021-05-12 07:44:25', '2021-05-12 07:44:25', NULL, NULL, NULL, NULL),
(86, '$2y$10$nTJwgnrGW5Z/mKmzqItZHOL2BFR6sL4/dUnlAvajt.z0LYSCl/rYq', 'dothinu@vietnamsuzuki.com.vn', '0963365390', 1, NULL, NULL, '2021-05-12 09:13:50', '2021-05-12 09:13:50', NULL, NULL, NULL, NULL),
(87, '$2y$10$5IRN8CqfxvR2LXrdI7iei.kfpq0P2GwwdI6RlXS3Y6S0XJKxrp5be', 'lethukitchenflower@gmail.com', '0903044896', 1, NULL, NULL, '2021-05-13 00:13:00', '2021-05-13 00:13:00', NULL, NULL, NULL, NULL),
(88, '$2y$10$NaBLHlE1CDZBIFifbBa1NO5GLPWDn6qJ2D4GV3M71OhBoel.ivSpu', 'minhquan2009@gmail.com', '0903033595', 1, NULL, NULL, '2021-05-13 02:31:37', '2021-05-13 02:31:37', NULL, NULL, NULL, NULL),
(89, '$2y$10$ezGfMToNtHaMR1y9BHr9C.z9jwsjQ.SlnN4krOkjXliU5kY0al47O', 'thuy.thiminh.dang@gmail.com', '0938920495', 1, NULL, NULL, '2021-05-13 08:16:59', '2021-05-13 08:16:59', NULL, NULL, NULL, NULL),
(90, '$2y$10$LNmXGAbsbfQIXuWeKm.yCOur097Perqy.1c3CeuTfFvah7BLDJUsW', 'phuongnguyen.huyanh@gmail.com', '0938199882', 1, NULL, NULL, '2021-05-13 08:25:43', '2021-05-13 08:25:43', NULL, NULL, NULL, NULL),
(91, '$2y$10$D/h4Tunl958ssS3NCvobWuWrjrwowgxoMPHEel2WVsLfnEG3WEKt6', 'uyennhu0610@gmail.com', '0939386568', 1, NULL, NULL, '2021-05-13 08:29:05', '2021-05-13 08:29:05', NULL, NULL, NULL, NULL),
(92, '$2y$10$3J.rFuRxVKI7e5ZeOGTviu9dyOv.Z6IbnLNytiCv4bZNaHuqJu6bq', 'cuongphanduy979@gmail.com', '0908333431', 1, NULL, NULL, '2021-05-13 08:29:58', '2021-05-13 08:29:58', NULL, NULL, NULL, NULL),
(93, '$2y$10$qzN6xTAIenEnx4Qew9TlOuSllC27HYXXFOP8Bn.OnpdMu/VC4T79a', 'huyanh986@gmail.com', '0902582044', 1, NULL, NULL, '2021-05-13 08:36:13', '2021-05-13 08:36:13', NULL, NULL, NULL, NULL),
(94, '$2y$10$FQI/9Ypsdu7UrxeIGGrVPuTXmtYLawTAIa7LLg0OYNCEicoKZ.QS2', 'chinhanhvungtau@bnbhanoi.vn', '0912441895', 1, NULL, NULL, '2021-05-13 08:45:24', '2021-05-13 08:45:24', NULL, NULL, NULL, NULL),
(95, '$2y$10$UyOXqXoir8WMRHRZ6tgy9eyGxogw1/3JffF/4utlc7/wiUZVpjt2C', 'ttnbang84@gmail.com', '0983788078', 1, NULL, NULL, '2021-05-13 08:51:28', '2021-05-13 08:51:28', NULL, NULL, NULL, NULL),
(96, '$2y$10$6tYFMLPb469eWvuoGhUM3u9ZJo9JAh9P4B/PruW50UiIXWgnC4.o.', 'dbphuoc@gmail.com', '0972826682', 1, NULL, NULL, '2021-05-14 00:47:41', '2021-05-14 00:47:41', NULL, NULL, NULL, NULL),
(97, '$2y$10$h3vKu3p0H6HZFfPC17ofYeFz4VBuzXouM0NE3yllnBEwtNgVNUY5q', 'tuyennam84@gmail.com', '0938458076', 1, NULL, NULL, '2021-05-14 00:51:20', '2021-05-14 00:51:20', NULL, NULL, NULL, NULL),
(98, '$2y$10$KQv1ljWgN8TNwVaQ4AJUBuXxr5YajM57Q808cGrhD5vHr5wKmEAuu', 'vietpt31785@gmail.com', '0984238899', 1, NULL, NULL, '2021-05-14 00:56:54', '2021-05-14 00:56:54', NULL, NULL, NULL, NULL),
(99, '$2y$10$CmRkXNMv.Jtl0Vl7JiDtJ.wFxI.01mRSlsox8gbz3B53kdHFdjXW.', 'vietviba@yahoo.com', '0912878686', 1, NULL, NULL, '2021-05-14 01:04:48', '2021-05-14 01:04:48', NULL, NULL, NULL, NULL),
(100, '$2y$10$O9Rpolkp/5z29lSytg.glu.bOSe13sHP1bKVuwgby4hPISyh6sCNu', 'ops@c-calm.com', '0903949529', 1, NULL, NULL, '2021-05-14 01:24:50', '2021-05-14 01:24:50', NULL, NULL, NULL, NULL),
(101, '$2y$10$aHzmqv8WtTaSYs7SVyx5c.3X1OjzWFpVIcCEbtuExwHWW/nv5ZtIa', 'trung1967@gmail.com', '0981822034', 1, NULL, NULL, '2021-05-14 01:28:44', '2021-05-14 01:28:44', NULL, NULL, NULL, NULL),
(102, '$2y$10$XcIBaeMqqLu4sj7M8epQiuidu2xyGhdmnew0HUfcpoLvSA/acXPZm', 'huentt93@gmail.com', '0931877833', 1, NULL, NULL, '2021-05-14 01:42:32', '2021-05-14 01:42:32', NULL, NULL, NULL, NULL),
(103, '$2y$10$0auOLQiZ8hWOcN..int7peSmSqK5Nifqoti0U4V4/9xBsCZZcUDDe', 'cuongnt@gmail.com', '0982555367', 1, NULL, NULL, '2021-05-14 02:37:38', '2021-05-14 02:37:38', NULL, NULL, NULL, NULL),
(104, '$2y$10$scenKS5RbkYMFN3nCTp9DerWhSxG5ZvymkjJYvnwEKvBQg8DpZoNa', 'tvtrung7@gmail.com', '0989157539', 1, NULL, NULL, '2021-05-14 02:40:21', '2021-05-14 02:40:21', NULL, NULL, NULL, NULL),
(105, '$2y$10$T8KCSspA4uFbfGT/kokMFehB3SH.9aM37DTCgRlB2xR44T.SVdBX2', 'ledaiduong1985@gmail.com', '0983995971', 1, NULL, NULL, '2021-05-14 02:44:12', '2021-05-14 02:44:12', NULL, NULL, NULL, NULL),
(106, '$2y$10$rsdaFyJNHYkNMjmEkFKiAeqqY/AEANueLVq5f4tGRQ8iXvdhuRB5e', 'Nhntram@gmail.com', '0902838664', 1, NULL, NULL, '2021-05-14 02:55:13', '2021-05-14 02:55:13', NULL, NULL, NULL, NULL),
(107, '$2y$10$MoPX119wm6apvQITSkfZR.auZJDyfsEAP/D2yAEX4WK7rbdUKqTj6', 'hoangthanhminh80@gmail.com', '0838982515', 1, NULL, NULL, '2021-05-14 02:59:49', '2021-05-14 02:59:49', NULL, NULL, NULL, NULL),
(108, '$2y$10$c2Ye1NhOFbq8gw1jmMC4eeoi368WiHRJZdt6p8Bz8nRKLxznJzNv2', 'account@tschem.com.vn', '0838119991', 1, NULL, NULL, '2021-05-14 03:05:27', '2021-05-14 03:05:27', NULL, NULL, NULL, NULL),
(109, '$2y$10$.WBh9fg5beuiJyMRgVuRo.lnv7PQa9F.vYINl07gwpINgUtcLJy12', 'longanpiano@gmail.com', '0917079944', 1, NULL, NULL, '2021-05-14 04:33:41', '2021-05-14 04:33:41', NULL, NULL, NULL, NULL),
(110, '$2y$10$we/ezKXKsX4fkZ4rjMZHiO7VgyXFidFz5aUsxJ8wQFwWbnkbwNj/a', 'nguyenvanminh151985@gmail.com', '0908990807', 1, NULL, NULL, '2021-05-14 06:20:31', '2021-05-14 06:20:31', NULL, NULL, 'kgC3aT4PBf3jZgHdj3QDYWuSKtkeMp619bCmlt5gFpGc3o6ZVHRg22ahIHxn', NULL),
(111, '$2y$10$on3dmQ3MPD6tKov.YjTOVuTYJ.yHmbh0wGEbudGCgVXWygMw7IHsC', 'le_phuong1402@gmail.com', '0931107848', 1, NULL, NULL, '2021-05-14 06:30:05', '2021-05-14 06:30:05', NULL, NULL, NULL, NULL),
(112, '$2y$10$d9HZWzmik8kdiNqbOWzdR.jdPKZ8TSDz.vEigiEC/wKXo0LeB.vc2', 'nguyenphihoangbao17031980@gmail.com', '0373031719', 1, NULL, NULL, '2021-05-17 02:19:09', '2021-05-17 02:19:09', NULL, NULL, 'QZbE5MYRytMdiPcDmyrl1LgQoWaTiMN307Hdf6ccE1xxLIxy6fPs71SqfWNe', NULL),
(113, '$2y$10$ewTCeN/jlGHmFGxkLm.Di.aKPL3DwTnSJB4RG2YMlwAL002rGsb4C', 'voduonganhhuy@gmail.com', '0904081093', 1, NULL, NULL, '2021-05-17 02:55:22', '2021-05-17 02:55:22', NULL, NULL, NULL, NULL),
(114, '$2y$10$IP7FbhjxLXWNp3uvYXNIy.nvoicyFwq3OHt2kVoCX1kKshYZseQwC', 'sonybinh2612@gmail.com', '0983839404', 1, NULL, NULL, '2021-05-17 03:33:39', '2021-05-17 03:33:39', NULL, NULL, NULL, NULL),
(115, '$2y$10$M.rFdPofoHAcSBhVKZFKIe4/z7PwEd6SNtMlKoSD14kjMaY9y4PKy', 'nguenvinh684@gmail.com', '0358010191', 1, NULL, NULL, '2021-05-17 03:55:43', '2021-05-17 03:55:43', NULL, NULL, '1iGiIJSZ8YJINHGsQTwxFUy3U9jFZHH6ezL3nyzOT1Mcl4CAZ8v09sPlQRU6', NULL),
(116, '$2y$10$PtT6uaP2ZMw0ZfiPAOL3pejZYOM5ChJzA.6rbVMRAlZi1sOyQu5De', 'arthome@arthome.com.vn', '0911233332', 1, NULL, NULL, '2021-05-17 06:21:59', '2021-05-17 06:21:59', NULL, NULL, NULL, NULL),
(117, '$2y$10$2sTpM9ZtTxyK28.0is8mluP.i9EzGQZ6dbFDybQ0o1sCvm4nAsIGe', 'duongkhuongduy90@gmail.com', '0901040402', 1, NULL, NULL, '2021-05-17 07:10:15', '2021-05-17 07:10:15', NULL, NULL, NULL, NULL),
(118, '$2y$10$NzSDzDraDWo49jirRMfSUeSw7a1AACpIe5F82PeBxs46s6HIvRMaO', 'tochunglam1985@gmail.com', '0898929686', 1, NULL, NULL, '2021-05-17 07:25:03', '2021-05-17 07:25:03', NULL, NULL, NULL, NULL),
(119, '$2y$10$fke0W4/qWhyKAEiFPcYN5ONQqU5m48ak1IYKBY7VkuLgcOn6BgUWa', 'nguyenvu31011301@gmail.com', '0976415621', 1, NULL, NULL, '2021-05-17 07:31:05', '2021-05-17 07:31:05', NULL, NULL, '8wmZBoatA9Tx7d9nkiqh9JZHA3DIiU7J1atOPbwKTQJJoSHq3RUYEqQx5yHz', NULL),
(120, '$2y$10$chXajI2lscoParervcd7i.s4kJ5ifJ29tk2pmSxNyzH2eVP8jFwEG', 'nguyenthanhlam11@gmail.com', '0901411012', 1, NULL, NULL, '2021-05-17 08:38:04', '2021-05-17 08:38:04', NULL, NULL, NULL, NULL),
(121, '$2y$10$CWP4iGhJCvHqyIssikq8E.Ze.L1688/WShoqIIMln0aGYugWAhDRy', 'Trinhhoainam@icloud.com', '0918211101', 1, NULL, NULL, '2021-05-18 02:01:56', '2021-05-18 02:01:56', NULL, NULL, NULL, NULL),
(122, '$2y$10$1GHvdfcVDsQIIWAMmYcFqOJkNGHkAlPY7rekVgD57VwYe5OEinbH6', 'huantran@gmail.com', '0972704388', 1, NULL, NULL, '2021-05-18 02:28:27', '2021-05-18 02:28:27', NULL, NULL, NULL, NULL),
(123, '$2y$10$pXtWyT976/agZE8Okq7s/u/UmmNcU2cEVZatEhZlFHJSpm5e3tWae', 'anhtrith@gmail.com', '0909674886', 1, NULL, NULL, '2021-05-18 07:29:39', '2021-05-18 07:29:39', NULL, NULL, NULL, NULL),
(124, '$2y$10$zyDGGkrij50nM3QPYrAkH.jVZZktT1wPO20oMolNfubQfiTB9qQcm', 'chinangluong@gmail.com', '0938913009', 1, NULL, NULL, '2021-05-18 08:44:11', '2021-05-18 08:44:11', NULL, NULL, NULL, NULL),
(125, '$2y$10$iTFitlw0norhrvVoyfu3o.yAminNzJEBnlXnjqek2ImCiK5Nun1d2', 'billycung6868@gmail.com', '0917957939', 1, NULL, NULL, '2021-05-18 09:05:09', '2021-05-18 09:05:09', NULL, NULL, 'R6VWDi3feTbSOaGlydnb4qqkzpJRC2VdSdnB4Zng87aeFGFpaEGdqIMuOven', NULL),
(126, '$2y$10$UEGn1YYQQV6sRVhMRfoZI.MN5jBiTt3EkLvp8tv/KYkx7OZieknuS', 'doanlequan@gmail.com', '0938191273', 1, NULL, NULL, '2021-05-19 06:32:51', '2021-05-19 06:32:51', NULL, NULL, NULL, NULL),
(127, '$2y$10$yLeWVvagkgQis9Q2ZEuOv.kEMHpYopHBaOBQ4/OYBsuqCrCNgycpG', 'kythinh@yahoo.com', '0908114495', 1, NULL, NULL, '2021-05-19 07:09:31', '2021-05-19 07:09:31', NULL, NULL, NULL, NULL),
(128, '$2y$10$RA2QhrrM9OMPp9/tpIkeb.iUWrtiYd8pS8MzzFNPZGxuJ5vQzh8tS', 'kristennguyen1609@gmail.com', '0933994323', 1, NULL, NULL, '2021-05-20 01:33:58', '2021-05-20 01:33:58', NULL, NULL, NULL, NULL),
(129, '$2y$10$Ch/jQNXcl.NtYQGGeyHpmOGMjmoQQ8GYX7PqozhDbXkpXT1qZcPi6', 'quangtuoido1972@gmail.com', '0909441230', 1, NULL, NULL, '2021-05-20 02:01:09', '2021-05-20 02:01:09', NULL, NULL, NULL, NULL),
(130, '$2y$10$VSDioQZljA84eHNk15WLf.AMI/opq6WrXacn32pJEZzmOpub5lK2u', 'jimmythanh2005@gmail.com', '0836919231', 1, NULL, NULL, '2021-05-20 02:33:25', '2021-05-20 02:33:25', NULL, NULL, NULL, NULL),
(131, '$2y$10$VwcBv1GPVww/9jlQmWNpWOGzhYNYVHPDrDA5plzf79VAXLufkZmDO', 'duythaitran78@gmail.com', '0988567222', 1, NULL, NULL, '2021-05-20 02:50:06', '2021-05-20 02:50:06', NULL, NULL, NULL, NULL),
(132, '$2y$10$EddCWjFv6OyMHL1UizlJ7OUYiXIBRfQCuwMHB9g6/Hep21blP1SpG', 'hploi1977@gmail.com', '0918134742', 1, NULL, NULL, '2021-05-20 02:58:02', '2021-05-20 02:58:02', NULL, NULL, 'WF1ArabsbgTRl3N5sD8AfC2KOv4dxrT8yZHPJ26SDvAnUA6MuYqx4uUS0lKm', NULL),
(133, '$2y$10$3g3ZoOH8xvgbdg1i7h1./uaJKt8CiHDNGpW8EdoyUEVPXF4LszzEe', 'anpeter2003@yahoo.con', '0906267888', 1, NULL, NULL, '2021-05-20 03:34:45', '2021-05-20 03:34:45', NULL, NULL, NULL, NULL),
(134, '$2y$10$YWhdG2sN0mnQhsTRHwADu.NzAAh2ylHwSzzpcYmBzvP6ycQQIJ5cu', 'quyetsatsco2016@gmail.com', '0989087092', 1, NULL, NULL, '2021-05-20 03:38:16', '2021-05-20 03:38:16', NULL, NULL, NULL, NULL),
(135, '$2y$10$iB24c7puhutSP8zLMaXNmOPuk6uSYLLYDo8dtB8rM1slANuMAorYi', 'nguyenvanphung_ts2003@yahoo.com', '0918999571', 1, NULL, NULL, '2021-05-20 06:15:23', '2021-05-20 06:15:23', NULL, NULL, NULL, NULL),
(136, '$2y$10$3Q0fjNh2iB3bZHy7q9vkq.w9kRwSE51PLYnyQm6LZoJ0rAh6j4MUS', 'avo.vietnam@gmail.com', '0914491911', 1, NULL, NULL, '2021-05-20 07:03:23', '2021-05-20 07:03:23', NULL, NULL, NULL, NULL),
(137, '$2y$10$iCW0eLvP7FJXND4PMyE9TOs.d8Kot3AA3im5g7XUPv.oEAowPFNca', 'vick_hs1987@yahoo.com', '0906334833', 1, NULL, NULL, '2021-05-20 07:08:29', '2021-05-20 07:08:29', NULL, NULL, NULL, NULL),
(138, '$2y$10$qOT/1rWeDPLB1VJBv8e7D.Ejsrx46RDj899C9g2V0lZ6XQUxVBdli', 'giaydabilly@gmail.com', '0965151257', 1, NULL, NULL, '2021-05-20 08:18:20', '2021-05-20 08:18:20', NULL, NULL, NULL, NULL),
(139, '$2y$10$x1D0MR6he/A93dTcM84wcuKtqNrY/hsvxNBdQXw8MB1dStYnti2cW', 'nguyentri2010@yahoo.com', '0909309535', 1, NULL, NULL, '2021-05-21 01:53:44', '2021-05-21 01:53:44', NULL, NULL, NULL, NULL),
(140, '$2y$10$YGb/i6UpFF0k7wcRUlUqPuIUOPi9UA/Xm3mTqT6tfm5dIJZCEHrAG', 'tranhuulap750601@gmail.com', '0983886914', 1, NULL, NULL, '2021-05-21 03:47:12', '2021-05-21 03:47:12', NULL, NULL, NULL, NULL),
(141, '$2y$10$StDcikydOiK7emjUfoXNwekcrikSj51imJdzYXQRInJgqURxKwhzC', 'phuong.12a3@gmail.com', '0918306271', 1, NULL, NULL, '2021-05-22 00:44:01', '2021-05-22 00:44:01', NULL, NULL, NULL, NULL),
(142, '$2y$10$.9lbOUJvcehnNJlR40xYBOJbbdHzx2nsNqZrf4T9BaXHDC.atAaxS', 'dangquoccuong1988@gmail.com', '0326666779', 1, NULL, NULL, '2021-05-22 01:07:00', '2021-05-22 01:07:00', NULL, NULL, NULL, NULL),
(143, '$2y$10$I1acMXPyAHJ.YVG9WFfTX.DJ8rjBwQ9F3jBOQXceyQuCUo2FPgtGe', 'nguyentonhoa2012@gmail.com', '0913329410', 1, NULL, NULL, '2021-05-22 02:12:14', '2021-05-22 02:12:14', NULL, NULL, 'q1SK0fH5fFYgq2y2ymlDmtfPDofdMMQYgAhMICrGdRT3Zb9DDHNON0ZKF5uF', NULL),
(144, '$2y$10$w/5BX.zyzaVBPTBIytQqwuTbptGv7r7LREqFe/EYFp8H2ZZNH5ACe', 'quyetx285@gmail.com', '0933406994', 1, NULL, NULL, '2021-05-22 02:47:42', '2021-05-22 02:47:42', NULL, NULL, NULL, NULL),
(145, '$2y$10$PINRJ814PtcGD7RJP7MZ9u1lTFa4XgOINFt9fn294TywsYaR2taxO', 'tai.nguyent@wgroup.com.vn', '0915508527', 1, NULL, NULL, '2021-05-22 03:12:41', '2021-05-22 03:12:41', NULL, NULL, NULL, NULL),
(146, '$2y$10$JtQmhXmoliHy4lO3Ab4WHOo0wSC3LBhTkLBtTgG1koc7HZLW1BVN6', 'trantuan187@gmail.com', '0983132374', 1, NULL, NULL, '2021-05-22 07:06:55', '2021-05-22 07:06:55', NULL, NULL, NULL, NULL),
(147, '$2y$10$Gu8JEmoEfnlYzQ/v.IBxnONzaop4Hx/yG01dLW3vZJSM7gu7IGp22', 'Galaxy3110note5@gmail.com', '0989007282', 1, NULL, NULL, '2021-05-22 07:20:57', '2021-05-22 07:20:57', NULL, NULL, NULL, NULL),
(148, '$2y$10$wC.mD/ULqhelcDYOn7ogyuTwv.rk516P9E7qa7hR19WUYLVRlwrO.', 'baokhang2303@gmail.com', '0937366984', 1, NULL, NULL, '2021-05-22 07:41:46', '2021-05-22 07:41:46', NULL, NULL, NULL, NULL),
(149, '$2y$10$lxLrl1ilkMR5HJ40PFIaZeOntQJY23NbOnvn87Sb34aqmel4O4xBC', 'congkhan@gmail.com', '0903379761', 1, NULL, NULL, '2021-05-22 08:38:18', '2021-05-22 08:38:18', NULL, NULL, NULL, NULL),
(150, '$2y$10$0679U8xtVO5fIqnxIoJ3gOny2msnMImBStDlvZmRsTiRqerVpVW0q', 'vietdung.86.bt@gmail.com', '0908512470', 1, NULL, NULL, '2021-05-24 00:42:35', '2021-05-24 00:42:35', NULL, NULL, NULL, NULL),
(151, '$2y$10$/l5MIo2ePj0mIYvLGmK3sOOLGNjTQtqYr2P1U.Vjzi/QUs60qVafu', 'hohuutuong260788@gmail.com', '0934129867', 1, NULL, NULL, '2021-05-24 01:15:34', '2021-05-24 01:15:34', NULL, NULL, 'iIsI7M2dBFgLpc605LRm1ECJ6iM4pMpPz5fFXXN4GcEwnWLyweGFC9sgS1yj', NULL),
(152, '$2y$10$hIU9jEYpAqSbaLEASLBHhO5P1N16ddDyzQs6MVm9t71tTlKEW89Cq', 'khanhduyinfo@gmail.com', '0901275745', 1, NULL, NULL, '2021-05-24 01:32:45', '2021-05-24 01:32:45', NULL, NULL, NULL, NULL),
(153, '$2y$10$lTQAn3l8W93Gmg5PhzmeqeK7c1tfnMdZDCYliKeH7PdSvAG6/k1Iq', 'nguyenthanhkim092@gmail.com', '0901493774', 1, NULL, NULL, '2021-05-24 04:33:55', '2021-05-24 04:33:55', NULL, NULL, NULL, NULL),
(154, '$2y$10$XSLi8gnra/YftZFzfxZA2OL7Z1tYU4FfpEdBLI.uZ8ysB/gd3is/O', 'minhdat768@yahoo.com', '0789201289', 1, NULL, NULL, '2021-05-24 07:05:59', '2021-05-24 07:05:59', NULL, NULL, NULL, NULL),
(155, '$2y$10$bhqvShHHrZFUm9A1nn2dKeipbvZtUtH7O9uqt9TI48efczdy9iSrW', 'vietlap@labconn.com', '0934012460', 1, NULL, NULL, '2021-05-25 00:45:38', '2021-05-25 01:52:01', NULL, NULL, 'XYPJNEe8e0IShSeE8Q8lX53qrtcGO24km3YKWMDlRf02zPF8g1RIxJ1ia3sj', NULL),
(156, '$2y$10$OTqAs/.FUovjzFDXK8lEgeOxnKBZOtwefO/EiprsA8yuQluX9t9oy', 'stquang@gmail.com', '0901396836', 1, NULL, NULL, '2021-05-25 02:03:32', '2021-05-25 02:03:32', NULL, NULL, NULL, NULL),
(157, '$2y$10$RYYrvPFMWdZ4Is8hj.E/jetMzqXVpcdLU66xV7SyupXIwEA.m12ES', 'sontung2904@gmail.com', '0973678579', 1, NULL, NULL, '2021-05-25 03:29:28', '2021-05-25 03:29:28', NULL, NULL, 'xm9wmwaj2S74KwCjgSIdp9LrBMXtvIlmgkGEi8jKwZerQnBKZ8QUc1poekOw', NULL),
(158, '$2y$10$/8/td1zl6/1e4EPe9ov0du5.3wou9pAI5W5psID1zkcVqB0l67DQW', 'nguyenduylong2010@gmail.com', '0981779999', 1, NULL, NULL, '2021-05-26 01:26:50', '2021-05-26 01:26:50', NULL, NULL, NULL, NULL),
(159, '$2y$10$by/1XmVUV1GI2mySiQ50v.D5HELhqKnk2u4AAI0fAmU1Kmmv4MmH.', 'vudohcm@gmail.com', '0967686959', 1, NULL, NULL, '2021-05-26 01:55:31', '2021-05-26 01:55:31', NULL, NULL, NULL, NULL),
(160, '$2y$10$NN1ej5Ayh1rbACxFaaYhVe4n6KpUuMN/fygLXFm3u3Wwfs9NqUMXq', 'khanhtruongmon82@gmail.com', '0902711885', 1, NULL, NULL, '2021-05-26 03:05:55', '2021-05-26 03:05:55', NULL, NULL, NULL, NULL),
(161, '$2y$10$brwXZh5oJfXhWC9kLZTOfOdPawLmAwvCltinAm8iZjHzmSBbRZqEa', 'benny672002@gmail.com', '0903748343', 1, NULL, NULL, '2021-05-27 01:55:45', '2021-05-27 01:55:45', NULL, NULL, NULL, NULL),
(162, '$2y$10$sQu6ZOy8KlyhD7ir3HDjOOI8eNC4x/s6fXm2MrBXaMXWouE0dcQEG', 'kimtinan.739@gmail.com', '0367979739', 1, NULL, NULL, '2021-05-27 02:39:40', '2021-05-27 02:39:40', NULL, NULL, NULL, NULL),
(163, '$2y$10$jxrneew11NkXoirmB4y6d.iW0WsuXED1IM505peqB87y2MwWxJ8ci', 'black05mask@gmail.com', '0773577899', 1, NULL, NULL, '2021-05-27 03:17:24', '2021-05-27 03:17:24', NULL, NULL, NULL, NULL),
(164, '$2y$10$VA8LX0vurM7mYP7zW0WC0ukjONtSwwbyWOhHoOaA5RYHi7KaKHfUy', 'thienchuongns@gmail.com', '0938103445', 1, NULL, NULL, '2021-05-27 07:07:33', '2021-05-27 07:07:33', NULL, NULL, NULL, NULL),
(165, '$2y$10$mWWQrcseJpfXzPbZVokJU.X0NMAKI62txD048SSPTx7qSeF8KyPNm', 'lethimongtuyen00@gmail.com', '0977383114', 1, NULL, NULL, '2021-05-27 07:56:35', '2021-05-27 07:56:35', NULL, NULL, NULL, NULL),
(166, '$2y$10$80O7lWaQcD9.uTwsP7sW4uIYrqzl4Mmz5.4XhmtgqcdATct/m/Fni', 'toiluon1996@gmail.com', '0376472304', 1, NULL, NULL, '2021-05-28 03:14:43', '2021-05-28 03:14:43', NULL, NULL, NULL, NULL),
(167, '$2y$10$oZdZVuqlflehlYX2U1wlouisq1vgisImQR9dEgG822QgcNdMDbHza', 'thangkhtn071@gmail.com', '0908606614', 1, NULL, NULL, '2021-05-28 03:36:47', '2021-05-28 03:36:47', NULL, NULL, NULL, NULL),
(168, '$2y$10$p2wxRMJwRNbhfU7nstpc/e/IB.MsJxyaTksFf.dPemXB/kyi4pHaO', 'quochung74lck@gmail.com', '0913620026', 1, NULL, NULL, '2021-05-28 08:29:41', '2021-05-28 08:29:41', NULL, NULL, NULL, NULL),
(169, '$2y$10$Y4DIDHS8mRKPzQhJ/U/4/.FuImfXjfGnLZCDs4rkw5afvG.NnA5i2', 'leminhnguyen88@gmail.com', '0888907886', 1, NULL, NULL, '2021-05-31 01:45:21', '2021-05-31 01:45:21', NULL, NULL, NULL, NULL),
(170, '$2y$10$i.VY5ycGwQIgeqn54ywNPuEFdX5K8Opxhnmg1HMX4KIf6rE0tHbtC', 'hvtinh55@gmail.com', '0903326405', 1, NULL, NULL, '2021-05-31 02:24:12', '2021-05-31 02:24:12', NULL, NULL, 'eG25kyYsPioKt0CxLyGwmOc0vPMzXCUP2MYi8pJfbXIxsW3XTLudrqRHrelX', NULL),
(171, '$2y$10$HZRazeeQIGWCH.f3vpvJM.0pEx3HnX8bjwuUcsqD4R2FryYJAmRve', 'hieuhuong0811@gmail.com', '0946440084', 1, NULL, NULL, '2021-05-31 05:52:39', '2021-05-31 05:52:39', NULL, NULL, NULL, NULL),
(172, '$2y$10$b39NI0wN6qeeGRMQ5AvcceAYw1DYIuG9RqT5M9teYZPDVnslB0PP2', 'dvhoanglinh2909@yahoo.com', '0933400400', 1, NULL, NULL, '2021-05-31 05:58:17', '2021-05-31 05:58:17', NULL, NULL, NULL, NULL),
(173, '$2y$10$hMakOGE6NVNruC4JIIzK0eZHWAdOd/gb9FNs6VDHeRg./pJf6pJGi', 'phuocthien2209@gmail.com', '0918929766', 1, NULL, NULL, '2021-06-01 02:33:35', '2021-06-01 02:33:35', NULL, NULL, 'UcW7GKlfDf6BrFzIz5fVYb4ZXatKBIxiS4QtYZM2G5bsxjl9GbRazJH5cU9P', NULL),
(174, '$2y$10$Y0.eAtFCE3AifKDFzK4BHOtb1u8cehtMn21p8ulAGooU.9T6X0wFa', 'tieuauau@gmail.com', '0903572000', 1, NULL, NULL, '2021-06-01 02:49:41', '2021-06-01 02:49:41', NULL, NULL, NULL, NULL),
(175, '$2y$10$NSD1kLHzeFrLfItQUXfq5.NY.CIL7QzH1ADOLD01O6DxfpAQ30Dqq', 'morpheusvn456@gmail.com', '0983447763', 1, NULL, NULL, '2021-06-02 07:55:50', '2021-06-02 07:55:50', NULL, NULL, NULL, NULL),
(176, '$2y$10$61QuxEjK9a3imZYvTr1lu.zY1MOG8zdab.tF4/MwmuTDSzJGNrr0m', 'nthiep2014@gmail.com', '0937345634', 1, NULL, NULL, '2021-06-02 08:21:09', '2021-06-02 08:21:09', NULL, NULL, NULL, NULL),
(177, '$2y$10$2eZnnzoexe49395kbWuEM.OsVO2WNygfdTn3knrNCjYisfwaQOQYO', 'trungt6886@gmail.com', '0986424812', 1, NULL, NULL, '2021-06-03 02:27:00', '2021-06-03 02:27:00', NULL, NULL, NULL, NULL),
(178, '$2y$10$xrlHkMehVn1vSUuGh1EU7e0m46hZCyJiT05giV15Y/DvuaUMMVnDu', 'lephongocld@gmail.com', '0914879012', 1, NULL, NULL, '2021-06-03 02:49:19', '2021-06-03 02:49:19', NULL, NULL, NULL, NULL),
(179, '$2y$10$NE3kM0.dQ3bT695v9qOJ1ubp/mZXjQA0JsWwtJvFM70QX.Y/FCqUG', 'lethihaonhien@gmail.com', '0974370321', 1, NULL, NULL, '2021-06-03 02:55:35', '2021-06-03 02:55:35', NULL, NULL, NULL, NULL),
(180, '$2y$10$152eELAWtrNUIjywKNREbOvlchvigNCGBIBgpyS9ieUHTAyG4YKce', 'nguyenvanty@mail.com', '0908409182', 1, NULL, NULL, '2021-06-03 03:31:55', '2021-06-03 03:31:55', NULL, NULL, NULL, NULL),
(181, '$2y$10$3JeF2flYLJyPgGS.g7hH8OujXBZNrwCy3WtYCGMq0Z7pitlEpDXM2', 'lethithuy@gmail.com', '0388899402', 1, NULL, NULL, '2021-06-03 04:45:02', '2021-06-03 04:45:02', NULL, NULL, NULL, NULL),
(182, '$2y$10$cOEwVhjEY80X8bjsvlpGhuT.G2kQm8TSNpq2Zz6OETGYwPEkHLG3q', 'dainguyen812012@gmail.com', '0909206393', 1, NULL, NULL, '2021-06-03 06:22:03', '2021-06-03 06:22:03', NULL, NULL, NULL, NULL),
(183, '$2y$10$VlOnKX.QQXV8aG360aGu4ekvF5swm.ChbV/yNunoJ7PykENioOs3y', 'dkshopp7@gmail.com', '0961532632', 1, NULL, NULL, '2021-06-03 07:15:55', '2021-06-03 07:15:55', NULL, NULL, NULL, NULL),
(184, '$2y$10$63JUMLtetqqVoX/5zEoRMOsu0gl/mpa7ww2KwheyWN032hYB15cxu', 'taint.toc@gmail.com', '0988239379', 1, NULL, NULL, '2021-06-03 07:19:27', '2021-06-03 07:19:27', NULL, NULL, NULL, NULL),
(185, '$2y$10$KI53iFVsQ8jUudi4wqeOHOZI1ZTrco6NHtQutU4TLEMChGax3soY6', 'hiepvetinh@gmail.com', '0938771730', 1, NULL, NULL, '2021-06-03 07:46:38', '2021-06-03 07:46:38', NULL, NULL, NULL, NULL),
(186, '$2y$10$PoKaCnLFHNS.Ygv8wrKQquXfP.29kfjDFt7rug2zvIeYJTjoDOEa.', 'bsthai2552@gmail.com', '0983979115', 1, NULL, NULL, '2021-06-03 09:30:09', '2021-06-03 09:30:09', NULL, NULL, NULL, NULL),
(187, '$2y$10$Su5WMzdTC308On2lwXXCEO0JFvuVAnqbITcr4qcWsMz7QekO5YPam', 'trankimhai1964@gmail.com', '0908701964', 1, NULL, NULL, '2021-06-04 02:00:21', '2021-06-04 02:00:21', NULL, NULL, NULL, NULL),
(188, '$2y$10$1yEGqcCpotLAWLTFW1Wye.bcrsYxs/PZ/UnIo6CYW1fMto2roF19m', 'congtycafethetown@gmail.com', '0911113300', 1, NULL, NULL, '2021-06-04 06:58:44', '2021-06-04 06:58:44', NULL, NULL, NULL, NULL),
(189, '$2y$10$lkMDIXqZeKSxvtfFpaI5QOhfpDGfZp8f006MEnb2Aj2xgx2vTIlgS', 'organtrung92@gmail.com', '0987098728', 1, NULL, NULL, '2021-06-04 07:16:34', '2021-06-04 07:16:34', NULL, NULL, NULL, NULL),
(190, '$2y$10$UWjapBBh8FboKQaEzP9IpOflBz2A7eR9NGJwcL4oj/PgfXiMs8FBS', 'o933386366@gmail.com', '0778878807', 1, NULL, NULL, '2021-06-04 08:02:25', '2021-06-04 08:02:25', NULL, NULL, NULL, NULL),
(191, '$2y$10$Tz6StU1CVMMd5EOSsF8IsuriVXnPoXYL8YDpD97eoLzt89X2qjmH.', 'vanhien2605@gmail.com', '0938176796', 1, NULL, NULL, '2021-06-07 01:45:13', '2021-06-07 01:45:13', NULL, NULL, NULL, NULL),
(192, '$2y$10$S8AonWLv2Q2S9RSIJ8a3X.AgVcmXXHjzpozHk3iS8eazQ3nTdIAeW', 'aloneboy08051988@gmail.com', '0902468941', 1, NULL, NULL, '2021-06-07 08:23:21', '2021-06-07 08:23:21', NULL, NULL, NULL, NULL),
(193, '$2y$10$6QkwucLByncUBJWKABWa4Ohv7LAS1nV37KnPneHOKj6XclFthSTq.', 'bshuynhngochon@gmail.com', '0913686268', 1, NULL, NULL, '2021-06-08 07:29:18', '2021-06-08 07:29:18', NULL, NULL, NULL, NULL),
(194, '$2y$10$adoTSseX34jYzAH92aQkWuZww.QH.rRBOL02x/b.Q0DXSKw8Gi4Mm', 'vincentnguyen2704@gmail.com', '0901321369', 1, NULL, NULL, '2021-06-08 07:42:12', '2021-06-08 07:42:12', NULL, NULL, NULL, NULL),
(195, '$2y$10$mlDcnI61A35i6/jmLJ2rteEG7X9z99.NySMq5e8mUXwy9Sal1rmJC', 'dangvanlich1985@gmail.com', '0931858679', 1, NULL, NULL, '2021-06-09 02:16:02', '2021-06-09 02:16:02', NULL, NULL, NULL, NULL),
(196, '$2y$10$TjYsWIRcZkvU3Hl.s8wY5ex4Lkwm.B8K0gnHRYVK6qsHkRy.s9eke', 'alehere2006@gmail.com', '0932056059', 1, NULL, NULL, '2021-06-09 02:29:45', '2021-06-09 02:29:45', NULL, NULL, NULL, NULL),
(197, '$2y$10$E8kYNOHqkWmCJKrmJrKAoeEnvctZGQJzlzcvLALofa18xmdFYsh1q', 'luongnguyenco.int@gmai.com', '0906614799', 1, NULL, NULL, '2021-06-09 03:14:22', '2021-06-09 03:14:22', NULL, NULL, NULL, NULL),
(198, '$2y$10$Itsn3eLz/fWYG8dCB/KUDe7gBwE6wTsTQnzhMQQTlSaISEsvRPfZe', 'lyquynh130482@gmail.com', '0942225239', 1, NULL, NULL, '2021-06-09 04:25:24', '2021-06-09 04:25:24', NULL, NULL, NULL, NULL),
(199, '$2y$10$gPssx9CS7726UDZJJngT7eXiyt0.IA1VozuWL5bJglcU9NMyy.yAG', 'hoangsonnguyenhuy@gmail.com', '0326867592', 1, NULL, NULL, '2021-06-09 07:09:03', '2021-06-09 07:09:03', NULL, NULL, NULL, NULL),
(200, '$2y$10$GInF8euvqpLghn88jXdu2uJEOclMsRxX6xynRnbYaSE1bKfw0PEAK', 'dhnghia981799@gmail.com', '0907981799', 1, NULL, NULL, '2021-06-10 07:17:27', '2021-06-10 07:17:27', NULL, NULL, NULL, NULL),
(201, '$2y$10$KE3Eynk8Rjjvn3tv51bU1e67JFHoSVVzWpMpmqXHkl9TCsxk00DTm', 'haibvpn@gmail.com', '0907817857', 1, NULL, NULL, '2021-06-11 00:49:51', '2021-06-11 00:49:51', NULL, NULL, NULL, NULL),
(202, '$2y$10$sHeb5mGna7oaNLiGUPD2m.eH/hplGakVb0RjMaRGlD6ykqnyw8Bwa', 'thanhtin88@gmail.com', '0984882528', 1, NULL, NULL, '2021-06-11 07:17:40', '2021-06-11 07:17:40', NULL, NULL, NULL, NULL),
(203, '$2y$10$0RZI6TyKvCMnRtS.2YBzv.hyyBeqRfwtyDO7/jbW4NmN1gu2B7hwS', 'khoinguyen1410@gmail.com', '0948558887', 1, NULL, NULL, '2021-06-11 07:27:21', '2021-06-11 07:27:21', NULL, NULL, NULL, NULL),
(204, '$2y$10$gs0B6F2fdAxz4kgQoHgBwuRZlFK3fpwOuHY1bsxDMHKcxW9dARSyG', 'nguyensongthanhhien@gmail.com', '0937598043', 1, NULL, NULL, '2021-06-11 07:30:05', '2021-06-11 07:30:05', NULL, NULL, NULL, NULL),
(205, '$2y$10$7SlvfKQoZzV2vIERvwsfPuSVWrGyWNbgqC2bAtHl3ATVlFZsUdfuG', 'duongvanbong.vietbac@gmail.com', '0979099216', 1, NULL, NULL, '2021-06-11 09:08:22', '2021-06-11 09:08:22', NULL, NULL, NULL, NULL),
(206, '$2y$10$F4t1TpxIjGFpEsEnTtPIu.PQe1bZjb3ftNVIeaPYq8Q8HFFKAMXei', 'thuydemon@gmail.com', '0902620090', 1, NULL, NULL, '2021-06-12 01:43:57', '2021-06-12 01:43:57', NULL, NULL, NULL, NULL),
(207, '$2y$10$E6HnqD9rLznrp1UjifAVkuFNpfcnkzFE.ioix7HCKXJLufZeSk0IC', 'kien.ccb@gmail.com', '0937728999', 1, NULL, NULL, '2021-06-12 03:30:16', '2021-06-12 03:30:16', NULL, NULL, NULL, NULL),
(208, '$2y$10$d2mEecuX1ZfK8gpf1CwEOu7QON1oDp3pXf/PVxugJMMyUpHUnLS.2', 'nguyendongh@gmail.com', '0938149634', 1, NULL, NULL, '2021-06-12 06:57:09', '2021-06-12 06:57:09', NULL, NULL, '6FQgQCHszq5M4GmMr57Y6NNIRd3ZdT9yDnLzLvN1g8O15FB0A1szOSUC0Ios', NULL),
(209, '$2y$10$7GIgQFthTs85B8z/mZLWMesL9q.WjABZZ0dP5sFNPGhsMHQUVQWpu', 'haidiepdinh@gmail.com', '0918604677', 1, NULL, NULL, '2021-06-14 01:18:45', '2021-06-14 01:18:45', NULL, NULL, NULL, NULL),
(210, '$2y$10$gcVk33keSOyyr42yXP5Wp.UPJ0daDMCbClA7Rcp/kJUwuTZt7fXzC', 'dientrinh.041185@gmail.com', '0903554557', 1, NULL, NULL, '2021-06-14 03:16:18', '2021-06-14 03:16:18', NULL, NULL, NULL, NULL),
(211, '$2y$10$osOuKuM6JQ/x8syb26pga.efqr5cqEUTKKS/y2GN60eQeogbkZmvK', 'doanaiquoc0402@gmail.com', '0918011007', 1, NULL, NULL, '2021-06-14 03:51:17', '2021-06-14 03:51:17', NULL, NULL, NULL, NULL),
(212, '$2y$10$ArLAW1KWVhjKfJaRrm6RSOqsOCeFdvIyoeGUVzOUe4z1VjFgHcPHK', 'quocphi185@gmail.com', '0939078094', 1, NULL, NULL, '2021-06-14 04:27:56', '2021-06-14 04:27:56', NULL, NULL, NULL, NULL),
(213, '$2y$10$Cg9GvcEsjzax16.PflFqFO/udmcBuLKn5N.UemFtlhVY7kesBTeHS', 'tranminhtam939@gmail.com', '0903940939', 1, NULL, NULL, '2021-06-15 01:41:02', '2021-06-15 01:41:02', NULL, NULL, NULL, NULL),
(214, '$2y$10$SXm93TxI7fezHt8YAhzYrOVZxlieZuQxzVCJhb0x6G/um3fK38Kfa', 'e.hoangminh@gmail.com', '0908589906', 1, NULL, NULL, '2021-06-15 03:23:43', '2021-06-15 03:23:43', NULL, NULL, NULL, NULL),
(215, '$2y$10$3tH9AzaJIZh.SNRNn1buh.9WFJ1buEH6YDlSht/DYqXnL1t3w0s0i', 'nguyenphu1706@gmail.com', '0902835027', 1, NULL, NULL, '2021-06-15 06:15:30', '2021-06-15 06:15:30', NULL, NULL, NULL, NULL),
(216, '$2y$10$0aVQeVXgBeXTc57A5Axd.ugqIxRx2pvCsOCYMOM0iNMVQybVIQKyi', 'xuantrung189@gmail.com', '0908604325', 1, NULL, NULL, '2021-06-15 08:46:33', '2021-06-15 08:46:33', NULL, NULL, NULL, NULL),
(217, '$2y$10$oL9tnKFDJBz24nOgHl0GQOpScB6Q6Gv1J2a0QRiA7HQuWHfT.cHXW', 'nguyenhaovn@yahoo.com', '0913916601', 1, NULL, NULL, '2021-06-16 02:28:46', '2021-06-16 02:28:46', NULL, NULL, NULL, NULL),
(218, '$2y$10$U/hsRqxxjwqyLL7QbBr5PevE/3EO3cVQvSUFIRIMxY8psQeij/q.2', 'minhhoangcc@gmail.com', '0938270785', 1, NULL, NULL, '2021-06-16 03:49:00', '2021-06-16 03:49:00', NULL, NULL, NULL, NULL),
(219, '$2y$10$lRAZJ5Wv7Mek7fcY466d3.NgzAOQ94NnSkGoYivWoP6v9z3RzlHfi', 'tuongthienly@gmail.com', '0907772782', 1, NULL, NULL, '2021-06-16 08:13:10', '2021-06-16 08:13:10', NULL, NULL, NULL, NULL),
(220, '$2y$10$tqaL4RH6pOaBHWSmS/VlhOJLNAfTjUL1YsQ8Ymt4i1PBfXD76eHMi', 'truongtanphat0406@gmail.com', '0909890528', 1, NULL, NULL, '2021-06-16 08:39:42', '2021-06-16 08:39:42', NULL, NULL, 'Z1JnaqyBjtMkhTaPJGWUrLzkEclvnX8ZouxxRs27Smn2aNLQQJN336ZuUfgP', NULL),
(221, '$2y$10$1nxROUGCpSmUyY4wJhLeUuEgkM141JDC/t.J00a3aB6EqRjEbm8qm', 'ptduc.binhthanh@gmail.com', '0933118686', 1, NULL, NULL, '2021-06-16 09:44:09', '2021-06-16 09:44:09', NULL, NULL, NULL, NULL),
(222, '$2y$10$VbIJ7cYtpCZ6RvbObO6OMe6ddFOmd1QSV2HIcRtOlS3KKpTIqdkDS', 'tho0500@caodangvietmy.edu.vn', '0707949265', 1, NULL, NULL, '2021-06-17 00:53:25', '2021-06-17 00:53:25', NULL, NULL, NULL, NULL),
(223, '$2y$10$E7pvErmWdnangloeDWYA9unquFVrHjud91gb5wR.GwUWcJBq8oKo6', 'leduchoai1975@gmail.com', '0909243832', 1, NULL, NULL, '2021-06-17 01:50:25', '2021-06-17 01:50:25', NULL, NULL, NULL, NULL),
(224, '$2y$10$0q2kmYMsy.EewXOuT6At6egfMr.4QEJKxxREWORkpXFzIah1GMzMG', 'thienphusondong@gmail.com', '0986786763', 1, NULL, NULL, '2021-06-17 03:28:07', '2021-06-17 03:28:07', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `frame_number` varchar(17) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `key_number` int(5) DEFAULT NULL,
  `plate_number` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `customer_id` bigint(25) UNSIGNED DEFAULT NULL,
  `vehicle_color_id` bigint(5) UNSIGNED DEFAULT NULL,
  `dealer_id` bigint(25) UNSIGNED DEFAULT NULL,
  `display_name` text COLLATE utf8mb4_vietnamese_ci,
  `purchased_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator` mediumint(25) DEFAULT NULL,
  `remaining_quota` bigint(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `frame_number`, `key_number`, `plate_number`, `customer_id`, `vehicle_color_id`, `dealer_id`, `display_name`, `purchased_at`, `created_at`, `updated_at`, `creator`, `remaining_quota`) VALUES
(1, '123456789', NULL, '12d-1234', 67, 39, 8, 'XL7 GLX AT - Trắng - 123456789', NULL, '2021-04-12 00:42:37', '2021-04-12 00:42:37', NULL, 5000000),
(2, 'FFFFFFFFFF', NULL, '59D-12345', 1, 28, 8, 'XL7 GLX AT - Đen - FFFFFFFFFF', NULL, '2021-04-12 01:08:30', '2021-04-12 01:08:30', NULL, 5000000),
(3, 'MMSCV41SKR1100109', NULL, '51H-01313', 73, 36, 19, 'Ciaz - Nâu - MMSCV41SKR1100109', NULL, '2021-04-16 09:36:21', '2021-04-16 09:36:21', NULL, 5000000),
(4, 'mhyanc22slj904389', NULL, '51H-77310', 74, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SLJ904389', NULL, '2021-04-26 01:57:43', '2021-04-26 01:57:43', NULL, 5000000),
(5, 'Mhyanc22smj911123', NULL, '50e-02637', 75, 37, 23, 'Ertiga GL 5MT - Trắng - MHYANC22SMJ911123', NULL, '2021-04-26 03:39:25', '2021-04-26 03:39:25', NULL, 5000000),
(6, 'Mmsvc41s2kr103921', NULL, '63A-09729', 76, 46, 8, 'Ciaz - Xám - MMSVC41S2KR103921', NULL, '2021-04-26 03:53:51', '2021-04-26 03:53:51', NULL, 5000000),
(7, 'Mhyanc22smj910318', NULL, '51H-89175', 77, 58, 7, 'XL7 GLX AT - Xám - MHYANC22SMJ910318', NULL, '2021-04-26 08:03:05', '2021-04-26 08:03:05', NULL, 5000000),
(8, 'MHYANC22SKJ902216', NULL, '63A-12863', 78, 37, 7, 'Ertiga GL 5MT - Trắng - MHYANC22SKJ902216', NULL, '2021-04-26 08:23:22', '2021-04-26 08:41:48', NULL, 5000000),
(9, 'Mmsfe42s7lr101547', NULL, '47A-31822', 79, 52, 8, 'Celerio GL CVT - Trắng - MMSFE42S7LR101547', NULL, '2021-04-26 08:32:25', '2021-04-26 08:32:25', NULL, 5000000),
(10, 'mmsfe42s1kr103079', NULL, '51H-01743', 80, 42, 7, 'Celerio GL CVT - Bạc - MMSFE42S1KR103079', NULL, '2021-04-26 09:12:51', '2021-04-26 09:12:51', NULL, 5000000),
(11, 'Mmsfe42s4lr100310', NULL, '85A-05206', 80, 52, 8, 'Celerio GL CVT - Trắng - MMSFE42S4LR100310', NULL, '2021-04-26 09:32:59', '2021-04-26 09:32:59', NULL, 5000000),
(12, 'Tsmyd21sxhm243307', NULL, '51F-90544', 82, 51, 8, 'GRAND VITARA - Xanh Rêu - TSMYD21SXHM243307', NULL, '2021-04-27 01:41:41', '2021-04-27 01:41:41', NULL, 5000000),
(13, 'Mhyanc225lj907431', NULL, '51H-47846', 83, 28, 31, 'XL7 GLX AT - Đen - MHYANC225LJ907431', NULL, '2021-04-27 02:16:41', '2021-04-27 02:16:41', NULL, 5000000),
(14, 'Mhyanc22smj911818', NULL, '51H-90747', 84, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SMJ911818', NULL, '2021-04-27 02:36:27', '2021-04-27 02:36:27', NULL, 5000000),
(15, 'Mmsvc41lr101286', NULL, '51G-57062', 85, 41, 23, 'Ciaz - Trắng - MMSVC41LR101286', NULL, '2021-04-27 02:59:28', '2021-04-27 02:59:28', NULL, 5000000),
(16, 'Klseda21blv205233', NULL, '51D-57635', 86, 1, 40, 'BLIND VAN - Trắng - KLSEDA21BLV205233', NULL, '2021-04-27 03:10:12', '2021-04-27 03:10:12', NULL, 5000000),
(17, 'Mhyanc22skj901594', NULL, '62A-16046', 87, 37, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SKJ901594', NULL, '2021-04-27 03:22:35', '2021-04-27 03:22:35', NULL, 5000000),
(18, 'Mhyanc22sjj900045', NULL, '51H-53838', 88, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SJJ900045', NULL, '2021-04-27 03:33:20', '2021-04-27 03:33:20', NULL, 5000000),
(19, 'Mmsfe42s0lr101227', NULL, '51H-21024', 89, 42, 8, 'Celerio GL CVT - Bạc - MMSFE42S0LR101227', NULL, '2021-04-28 01:18:18', '2021-04-28 01:18:18', NULL, 5000000),
(20, 'Mhyanc229lj905153', NULL, '51H-35285', 90, 60, 23, 'Ertiga GL 5MT - Nâu - MHYANC229LJ905153', NULL, '2021-04-28 02:34:14', '2021-04-28 02:34:14', NULL, 5000000),
(21, 'Mhyanc22sl905988', NULL, '51H-34721', 91, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SL905988', NULL, '2021-04-28 02:55:20', '2021-04-28 02:55:20', NULL, 5000000),
(22, 'Mmsfe42s5kr101593', NULL, '51G-07503', 92, 47, 7, 'Celerio GL CVT - Đỏ - MMSFE42S5KR101593', NULL, '2021-04-28 04:28:09', '2021-04-28 04:28:09', NULL, 5000000),
(23, 'Mhyanc22jlj905220', NULL, '49A-37752', 93, 26, 23, 'Ertiga GL 5MT - Đen - MHYANC22JLJ905220', NULL, '2021-04-29 00:45:38', '2021-04-29 00:45:38', NULL, 5000000),
(24, 'mhyanc22smj910803', NULL, '51H-85826', 94, 32, 8, 'XL7 GLX AT - Đỏ - MHYANC22SMJ910803', NULL, '2021-04-29 03:34:36', '2021-04-29 03:34:36', NULL, 5000000),
(25, 'MHYANC22SKJ902891', NULL, '51h-29574', 95, 38, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SKJ902891', NULL, '2021-04-29 06:41:10', '2021-04-29 06:54:13', NULL, 5000000),
(26, 'mhyanc22smj912256', NULL, '51H-92656', 96, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ912256', NULL, '2021-05-04 08:24:58', '2021-05-04 08:24:58', NULL, 5000000),
(27, 'Mhyanc229kj902739', NULL, '51H-30855', 97, 56, 23, 'Ertiga GL 5MT - Xám - MHYANC229KJ902739', NULL, '2021-05-05 01:50:34', '2021-05-05 01:50:34', NULL, 5000000),
(28, '5mhyanc22skj90065', NULL, '51H-57754', 98, 26, 22, 'Ertiga GL 5MT - Đen - 5MHYANC22SKJ900655', NULL, '2021-05-05 02:05:37', '2021-05-05 02:05:37', NULL, 5000000),
(29, 'Mhyanc22skj902080', NULL, '51H-19645', 99, 37, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SKJ902080', NULL, '2021-05-05 02:18:25', '2021-05-05 02:18:25', NULL, 5000000),
(30, 'Mhyanc22slj904926', NULL, '37A-69199', 100, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SLJ904926', NULL, '2021-05-05 02:25:34', '2021-05-05 02:25:34', NULL, 5000000),
(31, 'Mhyanc22slj905029', NULL, '51H-31067', 101, 32, 8, 'XL7 GLX AT - Đỏ - MHYANC22SLJ905029', NULL, '2021-05-05 02:33:14', '2021-05-05 02:33:14', NULL, 5000000),
(32, 'Mmsfe42sxlr101350', NULL, '51H-15815', 102, 54, 8, 'Celerio GL CVT - Xanh - MMSFE42SXLR101350', NULL, '2021-05-05 02:38:52', '2021-05-05 02:38:52', NULL, 5000000),
(33, 'MHYANC22SMJ911787', NULL, '51H-90848', 103, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ911787', NULL, '2021-05-05 08:33:04', '2021-05-05 08:33:04', NULL, 5000000),
(34, 'Mhyanc22slj904546', NULL, '51H-83607', 104, 37, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SLJ904546', NULL, '2021-05-05 08:42:25', '2021-05-05 08:42:25', NULL, 5000000),
(35, 'Mmsvsc41s5lr10171', NULL, '51H-57630', 105, 36, 23, 'Ciaz - Nâu - MMSVSC41S5LR101713', NULL, '2021-05-06 02:07:54', '2021-05-06 02:07:54', NULL, 5000000),
(36, 'Mmsvc41s6lr100859', NULL, '51g-95110', 107, 45, 8, 'Ciaz - Đen - MMSVC41S6LR100859', NULL, '2021-05-08 01:44:55', '2021-05-08 01:44:55', NULL, 5000000),
(37, 'MHYANC22SMJ910907', NULL, '61E-00179', 108, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ910907', NULL, '2021-05-10 01:50:02', '2021-05-10 01:50:02', NULL, 5000000),
(38, 'MHYANC22SLT907596', NULL, '51H-47962', 109, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLT907596', NULL, '2021-05-10 01:54:09', '2021-05-10 01:54:09', NULL, 5000000),
(39, 'MHYANC22SKT900752', NULL, '70A-21822', 111, 37, 1, 'Ertiga GL 5MT - Trắng - MHYANC22SKT900752', NULL, '2021-05-11 06:21:22', '2021-05-11 06:21:22', NULL, 5000000),
(40, 'A21bkv202652', NULL, '29D-21749', 113, 1, 1, 'Blind Van - Trắng - A21BKV202652', NULL, '2021-05-11 06:36:56', '2021-05-11 06:36:56', NULL, 5000000),
(41, 'MHYANC22SKT900150', NULL, '51H-08541', 115, 60, 40, 'Ertiga GL 5MT - Nâu - MHYANC22SKT900150', NULL, '2021-05-12 02:52:17', '2021-05-12 02:52:17', NULL, 5000000),
(42, 'MhYANC22SJJ900057', NULL, '51H-08021', 116, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SJJ900057', NULL, '2021-05-12 04:21:39', '2021-05-12 04:21:39', NULL, 5000000),
(43, 'mhya21455', NULL, NULL, 118, 20, 1, 'XL7 GLX AT - Xanh Rêu - MHYA21455', NULL, '2021-05-12 09:14:37', '2021-05-12 09:14:37', NULL, 5000000),
(44, 'RLSEDA21BLV205669', NULL, NULL, 119, 1, 8, 'Blind Van - Trắng - RLSEDA21BLV205669', NULL, '2021-05-13 00:42:06', '2021-05-13 00:42:06', NULL, 5000000),
(45, 'C22SLJ905222', NULL, '51H-66010', 120, 28, 8, 'XL7 GLX AT - Đen - C22SLJ905222', NULL, '2021-05-13 02:33:45', '2021-05-13 02:33:45', NULL, 5000000),
(46, 'MHYANC22SLJ905159', NULL, '51H-31988', 121, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ905159', NULL, '2021-05-13 08:21:33', '2021-05-13 08:21:33', NULL, 5000000),
(47, 'RLSEDA21BMV205671', NULL, NULL, 122, 1, 1, 'Blind Van - Trắng - RLSEDA21BMV205671', NULL, '2021-05-13 08:26:35', '2021-05-13 08:26:35', NULL, 5000000),
(48, 'MHYANC22SMJ912242', NULL, NULL, 124, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SMJ912242', NULL, '2021-05-13 08:30:57', '2021-05-13 08:30:57', NULL, 5000000),
(49, 'Mhyanc22skj902617', NULL, '63A-13533', 123, 56, 23, 'Ertiga GL 5MT - Xám - MHYANC22SKJ902617', NULL, '2021-05-13 08:33:28', '2021-05-13 08:33:28', NULL, 5000000),
(50, 'MHYANC22SMJ912221', NULL, NULL, 125, 39, 1, 'XL7 GLX AT - Trắng - MHYANC22SMJ912221', NULL, '2021-05-13 08:37:19', '2021-05-13 08:37:19', NULL, 5000000),
(51, 'MHYANC22SMJ912227', NULL, NULL, 126, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912227', NULL, '2021-05-13 08:46:24', '2021-05-13 08:46:24', NULL, 5000000),
(52, 'MHYANC22SMJ912226', NULL, NULL, 127, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912226', NULL, '2021-05-13 08:52:22', '2021-05-13 08:52:22', NULL, 5000000),
(53, 'MHYANC22SMJ912110', NULL, NULL, 128, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912110', NULL, '2021-05-14 00:48:47', '2021-05-14 00:48:47', NULL, 5000000),
(54, 'mhyanc22smj911788', NULL, NULL, 129, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ911788', NULL, '2021-05-14 00:52:19', '2021-05-14 00:52:19', NULL, 5000000),
(55, 'BLINDVANSUZUKISK4', NULL, NULL, 130, 1, 8, 'Blind Van - Trắng - BLINDVANSUZUKISK410B', NULL, '2021-05-14 00:57:50', '2021-05-14 00:57:50', NULL, 5000000),
(56, 'MHYANC22SMJ911845', NULL, NULL, 132, 39, 1, 'XL7 GLX AT - Trắng - MHYANC22SMJ911845', NULL, '2021-05-14 01:25:53', '2021-05-14 01:25:53', NULL, 5000000),
(60, 'RLSEDA21BMV205721', NULL, NULL, 133, 1, 1, 'Blind Van - Trắng - RLSEDA21BMV205721', NULL, '2021-05-14 01:36:38', '2021-05-14 01:36:38', NULL, 5000000),
(61, 'MHYANC22SMJ912257', NULL, NULL, 135, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ912257', NULL, '2021-05-14 02:38:16', '2021-05-14 02:38:16', NULL, 5000000),
(62, 'RLSEDA21BMV205704', NULL, NULL, 137, 1, 8, 'Blind Van - Trắng - RLSEDA21BMV205704', NULL, '2021-05-14 02:45:49', '2021-05-14 02:45:49', NULL, 5000000),
(63, 'MHYANC22SMJ910678', NULL, NULL, 138, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ910678', NULL, '2021-05-14 02:56:07', '2021-05-14 02:56:07', NULL, 5000000),
(64, 'MHYANC22SMJ912258', NULL, NULL, 139, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ912258', NULL, '2021-05-14 03:00:45', '2021-05-14 03:00:45', NULL, 5000000),
(65, 'RLSEDA21BMV205697', NULL, NULL, 140, 1, 8, 'Blind Van - Trắng - RLSEDA21BMV205697', NULL, '2021-05-14 03:06:14', '2021-05-14 03:06:14', NULL, 5000000),
(66, 'Mmsfe42sxlr100800', NULL, '51H-11553', 142, 54, 8, 'Celerio GL CVT - Xanh - MMSFE42SXLR100800', NULL, '2021-05-14 06:24:51', '2021-05-14 06:24:51', NULL, 5000000),
(67, 'ma3ze81s4g0313907', NULL, '51F-28537', 143, 22, 1, 'Ertiga GL 5MT - Bạc - MA3ZE81S4G0313907', NULL, '2021-05-14 06:39:53', '2021-05-14 06:39:53', NULL, 5000000),
(68, 'MHYANC22SLJ903425', NULL, '50E-00494', 144, 26, 31, 'Ertiga GL 5MT - Đen - MHYANC22SLJ903425', NULL, '2021-05-17 02:23:30', '2021-05-17 02:23:30', NULL, 5000000),
(69, 'MMSFE42S6KR101120', NULL, '77a-10906', 146, 54, 34, 'Celerio GL CVT - Xanh - MMSFE42S6KR101120', NULL, '2021-05-17 03:37:15', '2021-05-17 03:37:15', NULL, 5000000),
(70, 'MHYANC22SKT902887', NULL, '81A-20924', 147, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SKT902887', NULL, '2021-05-17 03:59:35', '2021-05-17 03:59:35', NULL, 5000000),
(71, 'TSMYD21S0GM177705', NULL, '51F-59825', 148, 25, 7, 'Grand Vitara - Trắng - TSMYD21S0GM177705', NULL, '2021-05-17 06:26:28', '2021-05-17 06:26:28', NULL, 5000000),
(72, 'Rlseda21blv204297', NULL, '51D-38862', 149, 1, 22, 'Blind Van - Trắng - RLSEDA21BLV204297', NULL, '2021-05-17 07:11:45', '2021-05-17 07:11:45', NULL, 5000000),
(73, 'Mhyanc22slj905434', NULL, '51H-48591', 150, 56, 23, 'Ertiga GL 5MT - Xám - MHYANC22SLJ905434', NULL, '2021-05-17 07:29:45', '2021-05-17 07:29:45', NULL, 5000000),
(74, 'MHYANC22SLT906405', NULL, '51H-78768', 151, 20, 1, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLT906405', NULL, '2021-05-17 07:41:24', '2021-05-17 07:41:24', NULL, 5000000),
(75, 'E81SJJ300051', NULL, '51F-85676', 152, 56, 7, 'Ertiga GL 5MT - Xám - E81SJJ300051', NULL, '2021-05-17 08:40:40', '2021-05-17 08:40:40', NULL, 5000000),
(76, 'RISFDA21BMV205396', NULL, '51D-70699', 153, 1, 8, 'Blind Van - Trắng - RISFDA21BMV205396', NULL, '2021-05-18 02:29:09', '2021-05-18 02:29:09', NULL, 5000000),
(77, 'MMSFE42S8LR100312', NULL, '93A-17417', 154, 52, 22, 'Celerio GL CVT - Trắng - MMSFE42S8LR100312', NULL, '2021-05-18 02:34:18', '2021-05-18 02:34:18', NULL, 5000000),
(78, 'MHYANC22SLJ904319', NULL, '51h-29864', 155, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ904319', NULL, '2021-05-18 07:33:20', '2021-05-18 07:33:20', NULL, 5000000),
(79, 'TSMYD21s9hm322502', NULL, '51G-37755', 156, 24, 8, 'Grand Vitara - Bạc - TSMYD21S9HM322502', NULL, '2021-05-18 08:47:28', '2021-05-18 08:47:28', NULL, 5000000),
(80, 'MHYANC22SkJ902875', NULL, '51h-64818', 157, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SKJ902875', NULL, '2021-05-18 09:06:48', '2021-05-18 09:06:48', NULL, 5000000),
(81, 'MMSVC41S8JR101136', NULL, '51g-43600', 158, 41, 8, 'Ciaz - Trắng - MMSVC41S8JR101136', NULL, '2021-05-19 06:41:10', '2021-05-19 06:41:10', NULL, 5000000),
(82, 'MHYanc22sij907679', NULL, '51H-43284', 159, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SIJ907679', NULL, '2021-05-19 07:12:45', '2021-05-19 07:12:45', NULL, 5000000),
(83, 'MHYANC22SLJ907030', NULL, '51H-37593', 160, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SLJ907030', NULL, '2021-05-20 01:35:32', '2021-05-20 01:35:32', NULL, 5000000),
(84, 'MHYANC22SLJ904157', NULL, '51H-77309', 161, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SLJ904157', NULL, '2021-05-20 02:02:41', '2021-05-20 02:02:41', NULL, 5000000),
(85, 'MhYaNC22Skj901208', NULL, '60A-71258', 162, 26, 14, 'Ertiga GL 5MT - Đen - MHYANC22SKJ901208', NULL, '2021-05-20 02:38:32', '2021-05-20 02:38:32', NULL, 5000000),
(86, 'MHYANC22SMJ910723', NULL, '50E-02159', 163, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SMJ910723', NULL, '2021-05-20 02:54:22', '2021-05-20 02:54:22', NULL, 5000000),
(87, 'MHYANC22SMJ911847', NULL, NULL, 164, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ911847', NULL, '2021-05-20 02:59:27', '2021-05-20 02:59:27', NULL, 5000000),
(88, 'MHYANC22SJJ900075', NULL, '51h-10442', 165, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SJJ900075', NULL, '2021-05-20 03:36:37', '2021-05-20 03:36:37', NULL, 5000000),
(89, 'MHYANC22SKJ900836', NULL, '51h-16779', 166, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SKJ900836', NULL, '2021-05-20 03:41:34', '2021-05-20 03:41:34', NULL, 5000000),
(90, 'K15BT1184963', NULL, '71A-09282', 167, 39, 1, 'XL7 GLX AT - Trắng - K15BT1184963', NULL, '2021-05-20 06:17:12', '2021-05-20 06:17:12', NULL, 5000000),
(91, '41S8LR102306', NULL, '51H-19837', 168, 36, 23, 'Ciaz - Nâu - 41S8LR102306', NULL, '2021-05-20 07:05:38', '2021-05-20 07:05:38', NULL, 5000000),
(92, 'Mhyanc22slj906044', NULL, '51H-34893', 169, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ906044', NULL, '2021-05-20 07:11:52', '2021-05-20 07:11:52', NULL, 5000000),
(93, 'MHYANC22SLJ905421', NULL, '51H-33864', 170, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SLJ905421', NULL, '2021-05-20 08:21:35', '2021-05-20 08:21:35', NULL, 5000000),
(94, 'Mhyanc22skj902841', NULL, '51H-75157', 171, 26, 8, 'Ertiga GL 5MT - Đen - MHYANC22SKJ902841', NULL, '2021-05-21 01:57:02', '2021-05-21 01:57:02', NULL, 5000000),
(95, 'MHYANC22SKJ901552', NULL, '51H-60949', 172, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SKJ901552', NULL, '2021-05-21 03:50:20', '2021-05-21 03:50:20', NULL, 5000000),
(96, 'mhyanc22skj902813', NULL, '51h-75614', 173, 56, 7, 'Ertiga GL 5MT - Xám - MHYANC22SKJ902813', NULL, '2021-05-22 00:48:29', '2021-05-22 00:48:29', NULL, 5000000),
(97, 'MHYANC22SLT905076', NULL, '51H-31876', 174, 20, 1, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLT905076', NULL, '2021-05-22 01:08:23', '2021-05-22 01:08:23', NULL, 5000000),
(98, 'MHIANC22SKJ902407', NULL, '51h-61743', 175, 37, 8, 'Ertiga GL 5MT - Trắng - MHIANC22SKJ902407', NULL, '2021-05-22 02:15:08', '2021-05-22 02:15:08', NULL, 5000000),
(99, 'MHYANC22SKJ901024', NULL, '51H-19243', 176, 60, 8, 'Ertiga GL 5MT - Nâu - MHYANC22SKJ901024', NULL, '2021-05-22 02:51:40', '2021-05-22 02:51:40', NULL, 5000000),
(100, 'MNSFE42S9LR100898', NULL, '63A-12506', 177, 47, 8, 'Celerio GL CVT - Đỏ - MNSFE42S9LR100898', NULL, '2021-05-22 03:18:54', '2021-05-22 03:18:54', NULL, 5000000),
(101, 'MHYANC22SKJ902812', NULL, '51H-35245', 178, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SKJ902812', NULL, '2021-05-22 07:13:13', '2021-05-22 07:13:13', NULL, 5000000),
(102, 'MHYAnc22skj901896', NULL, '51h-22462', 179, 56, 23, 'Ertiga GL 5MT - Xám - MHYANC22SKJ901896', NULL, '2021-05-22 07:26:07', '2021-05-22 07:26:07', NULL, 5000000),
(103, 'MHYANC22SMJ911566', NULL, '50E-02036', 180, 39, 1, 'XL7 GLX AT - Trắng - MHYANC22SMJ911566', NULL, '2021-05-22 07:44:05', '2021-05-22 07:44:05', NULL, 5000000),
(104, 'MHYANC22SLJ904796', NULL, '51H-75408', 181, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SLJ904796', NULL, '2021-05-22 08:43:01', '2021-05-22 08:43:01', NULL, 5000000),
(105, 'MHYANC22SLJ904886', NULL, '86e-0092', 182, 37, 23, 'Ertiga GL 5MT - Trắng - MHYANC22SLJ904886', NULL, '2021-05-24 00:46:20', '2021-05-24 00:46:20', NULL, 5000000),
(106, 'MHYANC22SMJ910370', NULL, '67E-00107', 183, 37, 23, 'Ertiga GL 5MT - Trắng - MHYANC22SMJ910370', NULL, '2021-05-24 01:20:16', '2021-05-24 01:20:16', NULL, 5000000),
(107, 'MHYANC22SLJ907449', NULL, '50E-00609', 184, 58, 40, 'XL7 GLX AT - Xám - MHYANC22SLJ907449', NULL, '2021-05-24 01:39:16', '2021-05-24 01:39:16', NULL, 5000000),
(108, 'MHYANC22SLj908360', NULL, '49e-00185', 185, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ908360', NULL, '2021-05-24 04:39:00', '2021-05-24 04:39:00', NULL, 5000000),
(109, 'Mhyanc22Smj910931', NULL, '51H-84636', 186, 39, 7, 'XL7 GLX AT - Trắng - MHYANC22SMJ910931', NULL, '2021-05-24 07:07:50', '2021-05-24 07:07:50', NULL, 5000000),
(110, 'C22sLj904797', NULL, '51H-30311', 187, 58, 1, 'XL7 GLX AT - Xám - C22SLJ904797', NULL, '2021-05-25 00:51:12', '2021-05-25 00:51:12', NULL, 5000000),
(111, 'MHYANC22SLJ903669', NULL, '51H-75328', 188, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ903669', NULL, '2021-05-25 02:06:42', '2021-05-25 02:06:42', NULL, 5000000),
(112, 'MHYANC22SLJ904830', NULL, '51H-30094', 189, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ904830', NULL, '2021-05-25 03:32:37', '2021-05-25 03:32:37', NULL, 5000000),
(113, 'MHYANC22SMJ910752', NULL, '51H-85345', 190, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ910752', NULL, '2021-05-26 01:28:39', '2021-05-26 01:28:39', NULL, 5000000),
(114, 'MHYANC22SLJ905515', NULL, '51H-33777', 191, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ905515', NULL, '2021-05-26 01:58:13', '2021-05-26 01:58:13', NULL, 5000000),
(115, 'Mhyanc22sjj900055', NULL, '51H-54718', 192, 37, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SJJ900055', NULL, '2021-05-26 03:07:41', '2021-05-26 03:07:41', NULL, 5000000),
(116, 'TSMYD21S4HM246302', NULL, '51F-79622', 193, 24, 8, 'Grand Vitara - Bạc - TSMYD21S4HM246302', NULL, '2021-05-27 02:08:17', '2021-05-27 02:08:17', NULL, 5000000),
(117, 'MHYANC22S1T907553', NULL, '60A-91790', 194, 61, 1, 'XL7 GLX AT - Cam - MHYANC22S1T907553', NULL, '2021-05-27 02:42:51', '2021-05-27 02:42:51', NULL, 5000000),
(118, 'MHYANC22SKJ900758', NULL, '51H-15578', 195, 26, 8, 'Ertiga GL 5MT - Đen - MHYANC22SKJ900758', NULL, '2021-05-27 03:20:42', '2021-05-27 03:20:42', NULL, 5000000),
(119, 'Ma3ze81s7g0303520', NULL, '51F-22984', 196, 37, 8, 'Ertiga GL 5MT - Trắng - MA3ZE81S7G0303520', NULL, '2021-05-27 07:13:10', '2021-05-27 07:13:10', NULL, 5000000),
(120, 'MHYANC22SLj907687', NULL, '50e-00283', 197, 20, 31, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ907687', NULL, '2021-05-27 08:01:24', '2021-05-27 08:01:24', NULL, 5000000),
(121, 'Mmsvc41s8lr100068', NULL, '51H-58018', 198, 41, 1, 'Ciaz - Trắng - MMSVC41S8LR100068', NULL, '2021-05-28 03:17:12', '2021-05-28 03:17:12', NULL, 5000000),
(122, 'MMSDZC63SLR902197', NULL, '51h-37242', 199, 48, 8, 'Swift GLX CVT - Đỏ - MMSDZC63SLR902197', NULL, '2021-05-28 03:40:07', '2021-05-28 03:40:07', NULL, 5000000),
(123, 'MHYANC22SKJ902510', NULL, '51H-28759', 200, 22, 23, 'Ertiga GL 5MT - Bạc - MHYANC22SKJ902510', NULL, '2021-05-28 08:33:11', '2021-05-28 08:33:11', NULL, 5000000),
(124, 'Mhyanc22skj901932', NULL, '68A-14974', 201, 22, 26, 'Ertiga GL 5MT - Bạc - MHYANC22SKJ901932', NULL, '2021-05-31 01:49:18', '2021-05-31 01:49:18', NULL, 5000000),
(125, 'MHYANC22SLJ909164', NULL, '51h-48237', 202, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SLJ909164', NULL, '2021-05-31 02:27:54', '2021-05-31 02:27:54', NULL, 5000000),
(126, 'Mmsvc41s6kr104324', NULL, '51G-79087', 204, 41, 8, 'Ciaz - Trắng - MMSVC41S6KR104324', NULL, '2021-05-31 06:00:27', '2021-05-31 06:00:27', NULL, 5000000),
(127, 'MHYANC22SKJ901615', NULL, '51H-19052', 206, 37, 8, 'Ertiga GL 5MT - Trắng - MHYANC22SKJ901615', NULL, '2021-06-01 02:51:52', '2021-06-01 02:51:52', NULL, 5000000),
(128, 'MHYANC22SMJ911556', NULL, '51h-85291', 207, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ911556', NULL, '2021-06-02 07:59:25', '2021-06-02 07:59:25', NULL, 5000000),
(129, 'Mhyanc22skj902041', NULL, '51H-63207', 208, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SKJ902041', NULL, '2021-06-02 08:25:57', '2021-06-02 08:25:57', NULL, 5000000),
(130, 'MHYANC22SLJ909642', NULL, '50e-00986', 209, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ909642', NULL, '2021-06-03 02:29:16', '2021-06-03 02:29:16', NULL, 5000000),
(131, 'MHYANC22SMJ911557', NULL, NULL, 210, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ911557', NULL, '2021-06-03 02:51:48', '2021-06-03 02:51:48', NULL, 5000000),
(132, 'MHYANC22SMJ912089', NULL, NULL, 211, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SMJ912089', NULL, '2021-06-03 02:56:32', '2021-06-03 02:56:32', NULL, 5000000),
(133, 'MHYANC22SMJ912281', NULL, NULL, 212, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912281', NULL, '2021-06-03 03:33:25', '2021-06-03 03:33:25', NULL, 5000000),
(134, 'MHYANC22SMJ912468', NULL, NULL, 213, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SMJ912468', NULL, '2021-06-03 04:51:49', '2021-06-03 04:51:49', NULL, 5000000),
(135, 'Rlseda21tkv204511', NULL, '50d-49464', 214, 8, 7, 'Carry Truck mui bạt - Xanh - RLSEDA21TKV204511', NULL, '2021-06-03 06:26:37', '2021-06-03 06:26:37', NULL, 5000000),
(136, 'MHYANC22SMJ912839', NULL, NULL, 215, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912839', NULL, '2021-06-03 07:16:35', '2021-06-03 07:16:35', NULL, 5000000),
(137, 'MHYANC22SMJ912840', NULL, NULL, 216, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ912840', NULL, '2021-06-03 07:20:16', '2021-06-03 07:20:16', NULL, 5000000),
(138, 'RLSEDA21BMV205863', NULL, NULL, 217, 1, 8, 'Blind Van - Trắng - RLSEDA21BMV205863', NULL, '2021-06-03 07:50:52', '2021-06-03 08:34:32', NULL, 5000000),
(139, 'MHYAnC22SLJ907306', NULL, '51H-38866', 218, 20, 40, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ907306', NULL, '2021-06-03 09:33:32', '2021-06-03 09:33:32', NULL, 5000000),
(140, 'Mhyanc22slj908212', NULL, '50E-00787', 219, 22, 13, 'Ertiga GL 5MT - Bạc - MHYANC22SLJ908212', NULL, '2021-06-04 02:05:02', '2021-06-04 02:05:02', NULL, 5000000),
(141, 'MMSFE42S1LR101141', NULL, '51h-73791', 221, 47, 7, 'Celerio GL CVT - Đỏ - MMSFE42S1LR101141', NULL, '2021-06-04 07:21:20', '2021-06-04 07:21:20', NULL, 5000000),
(142, 'MHYANC22SKJ902519', NULL, '75A-17840', 222, 26, 23, 'Ertiga GL 5MT - Đen - MHYANC22SKJ902519', NULL, '2021-06-04 08:15:44', '2021-06-04 08:15:44', NULL, 5000000),
(143, 'mhyanc22slj904876', NULL, '51H-64572', 223, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ904876', NULL, '2021-06-07 01:47:47', '2021-06-07 01:47:47', NULL, 5000000),
(144, 'MHYANC22SMJ910434', NULL, '51H-92667', 224, 56, 31, 'Ertiga GL 5MT - Xám - MHYANC22SMJ910434', NULL, '2021-06-07 08:26:20', '2021-06-07 08:26:20', NULL, 5000000),
(145, 'MHYANC22SLJ906886', NULL, '51H-36419', 225, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SLJ906886', NULL, '2021-06-08 07:31:31', '2021-06-08 07:31:31', NULL, 5000000),
(146, 'MHYANC22SLJ904868', NULL, '51H-64672', 226, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SLJ904868', NULL, '2021-06-08 07:47:40', '2021-06-08 07:47:40', NULL, 5000000),
(147, 'Mhyanc22smj910357', NULL, '18E-00135', 227, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SMJ910357', NULL, '2021-06-09 02:17:53', '2021-06-09 02:17:53', NULL, 5000000),
(148, 'MMMC41SLR100285', NULL, '51H-38345', 228, 36, 8, 'Ciaz - Nâu - MMMC41SLR100285', NULL, '2021-06-09 02:33:12', '2021-06-09 02:33:12', NULL, 5000000),
(149, 'MHYKZE81SJJ300326', NULL, '51G-00489', 229, 37, 8, 'Ertiga GL 5MT - Trắng - MHYKZE81SJJ300326', NULL, '2021-06-09 03:19:11', '2021-06-09 03:19:11', NULL, 5000000),
(150, 'RLSEDA21BMV205717', NULL, '51d-68441', 230, 1, 8, 'Blind Van - Trắng - RLSEDA21BMV205717', NULL, '2021-06-09 04:30:05', '2021-06-09 04:30:05', NULL, 5000000),
(151, 'MMSVC41S4LR100102', NULL, '30F-81113', 231, 43, 1, 'Ciaz - Bạc - MMSVC41S4LR100102', NULL, '2021-06-09 07:13:31', '2021-06-09 07:13:31', NULL, 5000000),
(152, 'RLSHZC82SFV101516', NULL, '51f-55988', 233, 53, 7, 'Swift GLX CVT - Trắng - RLSHZC82SFV101516', NULL, '2021-06-11 00:54:05', '2021-06-11 00:54:05', NULL, 5000000),
(153, 'Mhyanc22skj902389', NULL, '51H-72048', 234, 22, 8, 'Ertiga GL 5MT - Bạc - MHYANC22SKJ902389', NULL, '2021-06-11 07:19:26', '2021-06-11 07:19:26', NULL, 5000000),
(154, 'Mhyanc22slj907608', NULL, '51H-47985', 235, 61, 8, 'XL7 GLX AT - Cam - MHYANC22SLJ907608', NULL, '2021-06-11 07:31:22', '2021-06-11 07:31:22', NULL, 5000000),
(155, 'mhyanc22slj909097', NULL, '51H-39633', 236, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ909097', NULL, '2021-06-11 07:36:32', '2021-06-11 07:36:32', NULL, 5000000),
(156, 'MHYANC22SLJ908045', NULL, '51H-41613', 238, 58, 8, 'XL7 GLX AT - Xám - MHYANC22SLJ908045', NULL, '2021-06-12 01:47:23', '2021-06-12 01:47:23', NULL, 5000000),
(157, 'MMSVC41S8JR102173', NULL, '51F-49113', 239, 36, 8, 'Ciaz - Nâu - MMSVC41S8JR102173', NULL, '2021-06-12 03:32:20', '2021-06-12 03:32:20', NULL, 5000000),
(158, 'MHYANC22SLJ906664', NULL, '51H-40603', 240, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ906664', NULL, '2021-06-12 07:03:36', '2021-06-12 07:03:36', NULL, 5000000),
(159, 'MHYANC22SKJ900669', NULL, '51H-13137', 241, 56, 8, 'Ertiga GL 5MT - Xám - MHYANC22SKJ900669', NULL, '2021-06-14 01:20:37', '2021-06-14 01:20:37', NULL, 5000000),
(160, 'MHYANC22SLJ905446', NULL, '51H-33383', 242, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ905446', NULL, '2021-06-14 03:18:02', '2021-06-14 03:18:02', NULL, 5000000),
(161, 'MHYANC22SMJ912536', NULL, '51H-59566', 243, 58, 13, 'XL7 GLX AT - Xám - MHYANC22SMJ912536', NULL, '2021-06-14 03:53:43', '2021-06-14 03:53:43', NULL, 5000000),
(162, 'RLSEDA21BLV201066', NULL, '51dd-54748', 244, 1, 8, 'Blind Van - Trắng - RLSEDA21BLV201066', NULL, '2021-06-14 04:30:35', '2021-06-14 04:30:35', NULL, 5000000),
(163, 'Mhyanc22slj904879', NULL, '51H-30074', 245, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ904879', NULL, '2021-06-15 01:44:13', '2021-06-15 01:44:13', NULL, 5000000),
(164, 'MHYANC22SLj903633', NULL, '60a-79882', 246, 26, 8, 'Ertiga GL 5MT - Đen - MHYANC22SLJ903633', NULL, '2021-06-15 03:28:01', '2021-06-15 03:28:01', NULL, 5000000),
(165, 'MHYANC22smj911606', NULL, '51H-85961', 247, 28, 8, 'XL7 GLX AT - Đen - MHYANC22SMJ911606', NULL, '2021-06-15 06:18:56', '2021-06-15 06:18:56', NULL, 5000000),
(166, 'MHYANC22SLJ907712', NULL, '51H-48248', 248, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ907712', NULL, '2021-06-15 08:49:46', '2021-06-15 08:49:46', NULL, 5000000),
(167, 'mhyanc22slj907595', NULL, '51H-47970', 249, 20, 8, 'XL7 GLX AT - Xanh Rêu - MHYANC22SLJ907595', NULL, '2021-06-16 02:30:52', '2021-06-16 02:30:52', NULL, 5000000),
(168, 'MHYANC22SLJ909241', NULL, '51H-44945', 250, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ909241', NULL, '2021-06-16 03:52:48', '2021-06-16 03:52:48', NULL, 5000000),
(169, 'MHYANC22SLJ909484', NULL, '51H-87386', 251, 58, 31, 'XL7 GLX AT - Xám - MHYANC22SLJ909484', NULL, '2021-06-16 08:17:04', '2021-06-16 08:17:04', NULL, 5000000),
(170, 'MHYANC22SMJ910725', NULL, '50e-00988', 252, 61, 1, 'XL7 GLX AT - Cam - MHYANC22SMJ910725', NULL, '2021-06-16 12:57:55', '2021-06-16 12:57:55', NULL, 5000000),
(171, 'MHYANC22SLJ905575', NULL, '51H-33889', 254, 28, 23, 'XL7 GLX AT - Đen - MHYANC22SLJ905575', NULL, '2021-06-17 01:03:39', '2021-06-17 01:03:39', NULL, 5000000),
(172, 'Mhyanc22slj909236', NULL, '51H-47996', 255, 39, 8, 'XL7 GLX AT - Trắng - MHYANC22SLJ909236', NULL, '2021-06-17 01:51:47', '2021-06-17 01:51:47', NULL, 5000000),
(173, 'mmsfe42s1kr101218', NULL, '30f-52063', 256, 52, 28, 'Celerio GL CVT - Trắng - MMSFE42S1KR101218', NULL, '2021-06-17 03:31:06', '2021-06-17 03:31:06', NULL, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_colors`
--

CREATE TABLE `vehicle_colors` (
  `id` bigint(5) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vehicle_model_id` varchar(25) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicle_colors`
--

INSERT INTO `vehicle_colors` (`id`, `code`, `name`, `image`, `status`, `created_at`, `updated_at`, `vehicle_model_id`) VALUES
(1, '26U', 'Trắng', NULL, 1, '2020-10-16 01:43:52', '2020-10-16 01:43:52', 'SK410BV4-EURO4'),
(2, '26U', 'Trắng', NULL, 1, '2020-10-16 01:44:39', '2020-10-16 01:44:39', 'SK410K4-CANVAS'),
(3, '26U', 'Trắng', NULL, 1, '2020-10-16 01:46:17', '2020-10-16 01:46:17', 'SK410K4-DUMP'),
(4, '26U', 'Trắng', NULL, 1, '2020-10-16 01:47:39', '2020-10-16 01:47:39', 'SK410K4-EURO4'),
(5, '26U', 'Trắng', NULL, 1, '2020-10-16 01:48:38', '2020-10-16 01:48:38', 'SK410K4-METAL'),
(6, '26U', 'Trắng', NULL, 1, '2020-10-16 01:49:18', '2020-10-16 01:49:18', 'SK410K4-METALSD'),
(7, '26U', 'Trắng', NULL, 1, '2020-10-16 01:50:04', '2020-10-16 01:50:04', 'SK410K4-SD520'),
(8, '300', 'Xanh', NULL, 1, '2020-10-16 01:45:01', '2020-10-16 01:45:01', 'SK410K4-CANVAS'),
(9, '300', 'Xanh', NULL, 1, '2020-10-16 01:45:59', '2020-10-16 01:45:59', 'SK410K4-DUMP'),
(10, '300', 'Xanh', NULL, 1, '2020-10-16 01:47:53', '2020-10-16 01:47:53', 'SK410K4-EURO4'),
(11, '300', 'Xanh', NULL, 1, '2020-10-16 01:48:28', '2020-10-16 01:48:28', 'SK410K4-METAL'),
(12, '300', 'Xanh', NULL, 1, '2020-10-16 01:49:26', '2020-10-16 01:49:26', 'SK410K4-METALSD'),
(13, '300', 'Xanh', NULL, 1, '2020-10-16 01:49:55', '2020-10-16 01:49:55', 'SK410K4-SD520'),
(14, 'A6B', 'Đen Trắng', NULL, 1, '2020-10-16 01:39:44', '2020-10-16 01:42:41', 'PK112XJACNFVN'),
(15, 'A6H', 'Xanh Trắng', NULL, 1, '2020-10-16 01:40:48', '2020-10-16 01:40:48', 'PK112XJACNFVN'),
(16, 'A6J', 'Cam Trắng', NULL, 1, '2020-10-16 01:40:26', '2020-10-16 01:40:26', 'PK112XJACNFVN'),
(17, 'A9H', 'Đỏ Đen', NULL, 1, '2020-10-16 01:42:23', '2020-10-16 01:42:23', 'PK112XJACNFVN'),
(18, 'A9L', 'Xanh Đen', NULL, 1, '2020-10-16 01:40:06', '2020-10-16 01:40:06', 'PK112XJACNFVN'),
(19, 'A9N', 'Trắng Ngà Đen', NULL, 1, '2020-10-16 01:38:55', '2020-10-16 01:38:55', 'PK112XJACNFVN'),
(20, 'WAE', 'Xanh Rêu', 'storage/images/21/05/vehicle_colors-c6b6c9e5b4008ca9d63a23c5d45f8f05.png', 1, '2020-10-16 01:24:52', '2021-05-06 07:28:44', 'AXA415XA73000'),
(21, 'WAE', 'Xanh Rêu', 'storage/images/21/05/vehicle_colors-0c08156d431f2a18556eb6d8451e4a88.png', 1, '2020-10-16 01:29:05', '2021-05-06 07:30:34', 'AXA415XA73000LT'),
(22, 'Z2S', 'Bạc', 'storage/images/21/05/vehicle_colors-c6129ac64515ca8cfb912a756a21f2c5.png', 1, '2020-10-09 04:13:55', '2021-05-06 07:41:11', 'AX1415LM73000'),
(23, 'Z2S', 'Bạc', 'storage/images/21/05/vehicle_colors-5b84118bd66b34505d7ebcde49db7024.png', 1, '2020-10-16 01:17:31', '2021-05-06 07:42:08', 'AX5415XA73220'),
(24, 'Z2S', 'Bạc', NULL, 1, '2020-10-16 01:37:20', '2020-10-16 01:37:20', 'JB420W16'),
(25, 'Z7T', 'Trắng', NULL, 1, '2020-10-16 01:35:47', '2020-10-16 01:35:47', 'JB420W16'),
(26, 'ZBD', 'Đen', 'storage/images/21/05/vehicle_colors-a2a9fbb9febd69f318bcddf3c7ac885e.png', 1, '2020-10-16 01:05:04', '2021-05-06 07:40:58', 'AX1415LM73000'),
(27, 'ZBD', 'Đen', 'storage/images/21/05/vehicle_colors-1c361d61dcebda4dc53aabc517094fc5.png', 1, '2020-10-16 01:19:49', '2021-05-06 07:42:02', 'AX5415XA73220'),
(28, 'ZBD', 'Đen', 'storage/images/21/05/vehicle_colors-e093834febaa15c4ed94c94e66130dfb.png', 1, '2020-10-16 01:26:22', '2021-05-06 07:28:08', 'AXA415XA73000'),
(29, 'ZBD', 'Đen', 'storage/images/21/05/vehicle_colors-962357fcae073f64df25d10f92fb59b2.png', 1, '2020-10-16 01:27:53', '2021-05-06 07:30:22', 'AXA415XA73000LT'),
(30, 'ZJ3', 'Đen', NULL, 1, '2020-10-16 01:36:19', '2020-10-16 01:36:19', 'JB420W16'),
(31, 'ZKB', 'Đỏ', 'storage/images/21/05/vehicle_colors-974a97353b602043e520b6163eea8968.png', 1, '2020-10-09 04:03:34', '2021-05-06 07:41:57', 'AX5415XA73220'),
(32, 'ZLL', 'Đỏ', 'storage/images/21/05/vehicle_colors-c105698ecdc0ff5def6ac2b6d195cdd4.png', 1, '2020-10-16 01:25:21', '2021-05-06 07:27:42', 'AXA415XA73000'),
(33, 'ZLL', 'Đỏ', 'storage/images/21/05/vehicle_colors-dd8eb58abebea23410bd611c77cfcf7e.png', 1, '2020-10-16 01:29:28', '2021-05-06 07:30:14', 'AXA415XA73000LT'),
(34, 'ZMA', 'Xám', NULL, 1, '2020-10-16 01:36:01', '2020-10-16 01:36:01', 'JB420W16'),
(35, 'ZNL', 'Trắng Ngọc Trai', NULL, 1, '2020-10-16 01:41:26', '2020-10-16 01:41:26', 'PK112XJACNFVN'),
(36, 'ZQU', 'Nâu', 'storage/images/21/05/vehicle_colors-860d30c03622f65c077d3119bbf1af8c.png', 1, '2020-10-16 01:51:01', '2021-05-06 07:23:35', 'VBQ1C7C00AC31'),
(37, 'ZQZ', 'Trắng', 'storage/images/21/05/vehicle_colors-e2b3d0fbace9e1c7b30a702e53763721.png', 1, '2020-10-09 04:07:22', '2021-05-06 07:40:52', 'AX1415LM73000'),
(38, 'ZQZ', 'Trắng', 'storage/images/21/05/vehicle_colors-e0aff9b58ac0f1fbaaa391c133e5f642.png', 1, '2020-10-16 01:23:19', '2021-05-06 07:41:51', 'AX5415XA73220'),
(39, 'ZQZ', 'Trắng', 'storage/images/21/05/vehicle_colors-66ebbea8c263259a62cf67ab36ce19a5.png', 1, '2020-10-16 01:25:39', '2021-05-06 07:29:08', 'AXA415XA73000'),
(40, 'ZQZ', 'Trắng', 'storage/images/21/05/vehicle_colors-f784e05ddce90d27b97c7c347a1b8467.png', 1, '2020-10-16 01:28:30', '2021-05-06 07:29:56', 'AXA415XA73000LT'),
(41, 'ZTR', 'Trắng', 'storage/images/21/05/vehicle_colors-29cdb52702337c8f52544379bba2885a.png', 1, '2020-10-16 01:50:46', '2021-05-06 07:24:14', 'VBQ1C7C00AC31'),
(42, 'ZTS', 'Bạc', NULL, 1, '2020-10-16 01:33:33', '2020-10-16 01:33:33', 'CELERIOGLCVT'),
(43, 'ZTS', 'Bạc', 'storage/images/21/05/vehicle_colors-23533ea02f5f9a08722a0b2918450eab.png', 1, '2020-10-16 01:51:14', '2021-05-06 07:22:44', 'VBQ1C7C00AC31'),
(44, 'ZTS', 'Bạc', 'storage/images/21/05/vehicle_colors-c484ea59ff2168c262fa74f64e1894f5.png', 1, '2020-10-16 01:54:27', '2021-05-06 07:50:35', 'YSEP1C9EP73'),
(45, 'ZTT', 'Đen', 'storage/images/21/05/vehicle_colors-83e1c903329b2a278ec67fea66e9b2d4.png', 1, '2020-10-16 01:51:28', '2021-05-06 07:18:25', 'VBQ1C7C00AC31'),
(46, 'ZTU', 'Xám', 'storage/images/21/05/vehicle_colors-3cc4cc6d211d844b1bd7a33e799cb1a2.png', 1, '2020-10-16 01:52:09', '2021-05-06 07:17:22', 'VBQ1C7C00AC31'),
(47, 'ZTW', 'Đỏ', NULL, 1, '2020-10-16 01:32:19', '2020-10-16 01:32:19', 'CELERIOGLCVT'),
(48, 'ZTW', 'Đỏ', 'storage/images/21/05/vehicle_colors-cb9bf276d27a8699c3cafa3761ed36c8.png', 1, '2020-10-16 01:53:20', '2021-05-06 07:50:27', 'YSEP1C9EP73'),
(49, 'ZUF', 'Nâu', NULL, 1, '2020-10-16 01:35:32', '2020-10-16 01:35:32', 'JB420W16'),
(50, 'ZUG', 'Đồng', NULL, 1, '2020-10-16 01:35:18', '2020-10-16 01:35:18', 'JB420W16'),
(51, 'ZVD', 'Xanh Rêu', NULL, 1, '2020-10-16 01:36:57', '2020-10-16 01:36:57', 'JB420W16'),
(52, 'ZYG', 'Trắng', NULL, 1, '2020-10-16 01:33:12', '2020-10-16 01:33:12', 'CELERIOGLCVT'),
(53, 'ZYG', 'Trắng', 'storage/images/21/05/vehicle_colors-00b1e2b0fd260354f628332039173f99.png', 1, '2020-10-16 01:53:36', '2021-05-06 07:50:14', 'YSEP1C9EP73'),
(54, 'ZYH', 'Xanh', NULL, 1, '2020-10-16 01:32:36', '2020-10-16 01:32:55', 'CELERIOGLCVT'),
(55, 'ZYH', 'Xanh', 'storage/images/21/05/vehicle_colors-afb6f515e179a35d21a35f9cc309a5cf.png', 1, '2020-10-16 01:53:49', '2021-05-06 07:50:03', 'YSEP1C9EP73'),
(56, 'ZYZ', 'Xám', 'storage/images/21/05/vehicle_colors-c0010807406a800088d72069eb5fe396.png', 1, '2020-10-09 04:13:08', '2021-05-06 07:40:45', 'AX1415LM73000'),
(57, 'ZYZ', 'Xám', 'storage/images/21/05/vehicle_colors-20425320a9fa8ecbca05eed046c1beda.png', 1, '2020-10-16 01:22:54', '2021-05-06 07:41:45', 'AX5415XA73220'),
(58, 'ZYZ', 'Xám', 'storage/images/21/05/vehicle_colors-c258640448ffe8ec99ef8f5200237908.png', 1, '2020-10-16 01:25:58', '2021-05-06 07:29:17', 'AXA415XA73000'),
(59, 'ZYZ', 'Xám', 'storage/images/21/05/vehicle_colors-cf37b10938f8765f86fa4bf83a5cf3fe.png', 1, '2020-10-16 01:30:17', '2021-05-06 07:29:47', 'AXA415XA73000LT'),
(60, 'ZZA', 'Nâu', 'storage/images/21/05/vehicle_colors-c5e5a4464dde061c04c6074ffe7ef53c.png', 1, '2020-10-09 04:13:22', '2021-05-06 07:40:19', 'AX1415LM73000'),
(61, 'ZZY', 'Cam', 'storage/images/21/05/vehicle_colors-344c72079d187de0d0ee5d3f8da5a30a.png', 1, '2020-10-16 01:24:33', '2021-05-06 07:15:54', 'AXA415XA73000'),
(62, 'ZZY', 'Cam', 'storage/images/21/05/vehicle_colors-01110e53e5eeb543e8fae2cec045274b.png', 1, '2020-10-16 01:28:11', '2021-05-06 07:15:20', 'AXA415XA73000LT');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_models`
--

CREATE TABLE `vehicle_models` (
  `id` varchar(17) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `2w4w` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `image` text COLLATE utf8mb4_vietnamese_ci,
  `year` int(5) DEFAULT NULL,
  `prefix_code_frame` varchar(12) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `prefix_code_engine` varchar(11) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicle_models`
--

INSERT INTO `vehicle_models` (`id`, `name`, `2w4w`, `slug`, `status`, `image`, `year`, `prefix_code_frame`, `prefix_code_engine`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
('AX1415LM73000', 'Ertiga GL 5MT', 1, 'ertiga', 0, 'storage/images/21/03/vehicle_models-image-AX1415LM73000-1616043292.png', 2020, 'MHYANC22SJJ', 'K15BT1', 'SUZUKI ERTIGA GL 5MT (ANC22S)', '2020-10-09 02:31:57', '2021-03-18 04:54:53', NULL),
('AX5415XA73220', 'Ertiga GLX 4AT', 1, 'ertiga', 0, 'storage/images/20/11/vehicle_models-image-AX5415XA73220-1606267069.png', 2020, 'MHYANC22SLJ', 'K15BT1', 'SUZUKI ERTIGA GLX 4AT SPORT', '2020-10-09 02:31:05', '2020-11-25 01:17:49', NULL),
('AXA415XA73000', 'XL7 GLX AT', 1, 'xl7', 0, 'storage/images/21/03/vehicle_models-image-AXA415XA73000-1615444059.png', 2020, 'MHYANC22SKJ', 'K15BT1', 'SUZUKI XL7 GLX AT (ANC22S)', '2020-10-09 01:53:59', '2021-03-11 06:27:40', NULL),
('AXA415XA73000LT', 'XL7 GLX AT (Ghế da)', 1, 'xl7', 0, 'storage/images/21/05/vehicle_models-30649796949fb3c7c451692c056306d7.png', 2020, 'MHYANC22SKJ', 'K15BT1', 'SUZUKI XL7 GLX AT (ANC22S) CÓ GHẾ DA', '2020-10-09 02:27:55', '2021-05-06 09:42:15', NULL),
('CELERIOGLCVT', 'Celerio GL CVT', 1, 'celerio', 0, 'storage/images/21/05/vehicle_models-89c7a3b83de5dd6f65a774864324fcf1.png', 2020, 'MMSFE42S4LR', 'K10BS1', 'SUZUKI CELERIO GL CVT', '2020-10-09 02:36:54', '2021-05-07 02:25:42', NULL),
('JB420W16', 'Grand Vitara', 1, 'vitara', 0, 'storage/images/21/05/vehicle_models-2fd1eee095fdbe5f324643e2f2a1b9e5.jpg', 2020, 'JS3TD54V7H4', 'J20A-', 'GRAND VITARA', '2020-10-09 02:37:32', '2021-05-06 09:53:07', NULL),
('PK112XJACNFVN', 'Vitara', 1, 'vitara', 0, 'storage/images/21/05/vehicle_models-aed6434e91e664e6673075101fe46fed.jpg', 2020, 'TSMYD21S1GM', 'M16A-1', 'SUZUKI VITARA', '2020-10-09 02:37:52', '2021-05-07 00:59:14', '2021-05-07 00:59:14'),
('SK410BV4-EURO4', 'Blind Van', 1, 'blind_van', 0, 'storage/images/21/03/vehicle_models-image-SK410BV4-EURO4-1616043270.jpg', 2020, 'RLSEDA21BJV', 'F10A-V1', 'BLIND VAN SUZUKI SK410BV4', '2020-10-09 02:02:02', '2021-05-06 09:15:02', NULL),
('SK410K4-CANVAS', 'Carry Truck mui bạt', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-616ded5445d77f298b5714b663bc8e2a.png', 2020, 'RLSEDA21THV', 'F10A-ID', 'CARRY TRUCK CANVAS SK410K4-ANLAC IT6', '2020-10-09 02:13:40', '2021-05-06 09:54:12', NULL),
('SK410K4-DUMP', 'Carry Truck thùng ben', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-76e117dc32a7a068396ed08742897576.png', 2020, 'RLSEDA21THV', 'F10A-ID', 'CARRY TRUCK DUMP SK410K4-ANLAC IT7', '2020-10-09 02:02:56', '2021-05-06 09:54:06', NULL),
('SK410K4-EURO4', 'Carry Truck', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-2224f16726fc80ce811de7828af4fa9a.png', 2020, 'RLSEDA21TJV', 'F10A-V1', 'CARRY TRUCK SUZUKI SK410K4', '2020-10-09 02:14:30', '2021-05-06 09:54:02', NULL),
('SK410K4-METAL', 'Carry Truck thùng kín', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-3886710761fb469763dcf1be735ed20a.png', 2020, 'RLSEDA21TGV', 'F10A-ID', 'CARRY TRUCK METAL SK410K4-ANLAC IT5', '2020-10-09 02:13:02', '2021-05-06 09:53:52', NULL),
('SK410K4-METALSD', 'Carry Truck cửa trượt', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-96463cc0c8c2ce39b1a8f9fcb0da2615.png', 2020, 'RLSEDA21TJV', 'F10A-ID', 'CARRY TRUCK METAL SD (SK410K4-ANLAC JT5)', '2020-10-09 02:11:46', '2021-05-06 09:53:44', NULL),
('SK410K4-SD520', 'Carry Truck cửa trượt 520', 1, 'carry', 0, 'storage/images/21/05/vehicle_models-35aa7dc502ab6e3b7f6078ea07f70449.png', 2020, 'RLSEDA21TJV', 'F10A-ID', 'TRUCK METAL SD 520 (SK410K4-ANLAC KT1)', '2020-10-09 02:04:18', '2021-05-06 09:53:35', NULL),
('VBQ1C7C00AC31', 'Ciaz', 1, 'ciaz', 0, 'storage/images/20/12/vehicle_models-image-VBQ1C7C00AC31-1607940981.png', 2020, 'MMSVC41SXJR', 'K14BS', 'SUZUKI CIAZ(VC41S)', '2020-10-09 02:35:57', '2020-12-14 10:16:21', NULL),
('YSEP1C9EP73', 'Swift GLX CVT', 1, 'swift', 0, 'storage/images/21/03/vehicle_models-image-YSEP1C9EP73-1616043252.png', 2020, 'MMSDZC63SHR', 'K12MS1', 'SUZUKI SWIFT GLX CVT(DZC63S)', '2020-10-09 02:35:24', '2021-03-18 04:54:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_vietnamese_ci,
  `phone` varchar(15) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci,
  `short_description` text COLLATE utf8mb4_vietnamese_ci,
  `website` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `creator` mediumint(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `slug`, `image`, `cover`, `address`, `phone`, `email`, `contact_name`, `contact_phone`, `contact_email`, `description`, `short_description`, `website`, `creator`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, 'Công ty TNHH FitFood', 'fitfood', 'storage/images/20/11/vendors-image-10-1605152241.png', 'storage/images/21/03/vendors-cover-10-1616400291.jpg', '33 Đường 14, KDC Bình Hưng, Ấp 2, Huyện Bình Chánh, TP. HCM', '0932788120', 'info@fitfood.vn', NULL, NULL, NULL, '<p>Fitfood chuyên cung cấp các bữa ăn sạch được giao tận nhà với các phần ăn được lên kế hoạch kỹ lưỡng và thiết kế riêng giúp bạn duy trì lối sống khỏe mạnh mỗi ngày.</p>\r\n\r\n<p>Ra mắt vào năm 2015, hệ thống Fitfood được mô hình hóa dựa trên các dịch vụ chuẩn bị bữa ăn ở Úc và Mỹ. Các phần ăn được thiết kế dựa trên chương trình “Bữa ăn đầy đủ dinh dưỡng” của Đại học Harvard. Thực đơn đa dạng với hơn 100 món và bạn có thể lựa chọn các gói dịch vụ phần ăn 2-3 bữa/ngày. Fitfood theo đuổi mục đích cung cấp các bữa ăn healthy hướng đến việc tạo lập một phong cách sống khỏe cho khách hàng nên các thành phần trong các bữa ăn đều được chọn lọc với lượng vitamin, đạm và dinh dưỡng tốt nhất.</p>\r\n\r\n<p>Thành viên SUZUKI sẽ nhận được ưu đãi giảm giá 15% cho TẤT CẢ các đơn hàng khi đặt hàng trên website: https://fitfood.vn. Hãy tận hưởng bữa ăn được chuẩn bị sẵn cùng với những công thức nấu ăn lành mạnh cũng như những lời khuyên bổ ích từ Fitfood để việc sống khỏe không trở nên nhàm chán!</p>', 'Ra mắt vào năm 2015, hệ thống Fitfood được mô hình hóa dựa trên các dịch vụ chuẩn bị bữa ăn ở Úc và Mỹ. Các phần ăn được thiết kế dựa trên chương trình “Bữa ăn đầy đủ dinh dưỡng” của Đại học Harvard. Thực đơn đa dạng với hơn 100 món và bạn có thể lựa chọn các gói dịch vụ phần ăn 2-3 bữa/ngày. Fitfood theo đuổi mục đích cung cấp các bữa ăn healthy hướng đến việc tạo lập một phong cách sống khỏe cho khách hàng nên các thành phần trong các bữa ăn đều được chọn lọc với lượng vitamin, đạm và dinh dưỡng tốt nhất.', 'https://fitfood.vn', NULL, '2020-10-21 06:24:49', '2021-03-22 08:04:51', NULL),
(11, 'Suzuki Phổ Quang', 'suzuki-world', 'storage/images/20/12/vendors-image-11-1607940008.jpg', 'storage/images/20/12/vendors-cover-11-1607940166.jpg', 'Số 02 Phổ Quang, Phường 2, Tân Bình, TP. Hồ Chí Minh', '18006950', 'contact@vietnamsuzuki.com.vn', NULL, NULL, NULL, '<p>Năm 1996, Suzuki chính thức đặt chân vào Việt Nam với mục tiêu trở thành một trong những hãng xe hàng đầu tại thị trường đầy tiềm năng này. Được đón nhận nồng nhiệt với dòng sản phẩm sành điệu Suzuki Viva, Công ty Việt Nam Suzuki tiếp tục cho ra mắt những dòng sản phẩm chất lượng và hiện đại trong những năm sau đó.</p>\r\n\r\n<p><strong>Thổi luồng gió mới vào ngành công nghiệp xe máy</strong></p>\r\n\r\n<p>Với câu slogan đã trở nên quen thuộc&nbsp;<strong>“Way of Life”</strong>, Suzuki không ngừng nỗ lực và chấp nhận tất cả những thách thức trong việc cải tiến công nghệ cũng như sáng tạo thiết kế để phục vụ người tiêu dùng Việt Nam những sản phẩm xe máy chất lượng cao nhất. Động cơ mạnh mẽ, kiểu dáng tinh tế luôn là đích đến của các sản phẩm Suzuki bên cạnh những công nghệ tiên tiến hiện đại nhất được tích hợp.</p>\r\n\r\n<p>Như một phần thưởng xứng đáng, xe máy Suzuki đã được người tiêu dùng bình chọn là “Hàng Việt Nam chất lượng cao” nhiều năm liền trong các cuộc bầu chọn uy tín do Báo Sài Gòn Tiếp Thị tổ chức.</p>\r\n\r\n<p><strong>Sản xuất xe ô tô nhỏ và cống hiến cho một tương lai “lớn”</strong></p>\r\n\r\n<p>Khẩu hiệu ô tô Suzuki: “Small cars for a big future”</p>\r\n\r\n<p>Trong nền kinh tế đang phát triển, phần lớn các doanh nghiệp tại Việt Nam có quy mô không lớn, do vậy đầu tư cho nhu cầu vận chuyển cũng cần được cân nhắc về tính kinh tế, phù hợp với quy mô doanh nghiệp. Hiểu được nhu cầu này, Suzuki đã giới thiệu các loại xe tải và xe khách Suzuki với đặc trưng nhỏ gọn, tiện lợi và kinh tết.</p>\r\n\r\n<p>Với nỗ lực không ngừng, các loại xe ô tô thương hiệu Suzuki đã tạo dựng được uy tín với các đặc trưng nổi trội như tính chính hiệu từ Nhật Bản, bền, tốt, dễ bảo trì và sửa chữa, đồng thời hoạt động không chỉ như những cộng sự đắc lực trong công việc mà còn như những người bạn thân thiết trong cuộc sống.</p>\r\n\r\n<p>Nhỏ gọn về mặt kích thước, nhưng xe ô tô thương hiệu Suzuki lại cống hiến cho một “tương lai lớn” với thật nhiều thành công trong công việc và cuộc sống cho các doanh nhân và gia đình năng động ngày nay.</p>', 'Năm 1996, Suzuki chính thức đặt chân vào Việt Nam với mục tiêu trở thành một trong những hãng xe hàng đầu tại thị trường đầy tiềm năng này. Được đón nhận nồng nhiệt với dòng sản phẩm sành điệu Suzuki Viva, Công ty Việt Nam Suzuki tiếp tục cho ra mắt những dòng sản phẩm chất lượng và hiện đại trong những năm sau đó.', 'https://suzuki-world.com.vn/', NULL, '2020-12-14 09:57:49', '2021-04-09 04:09:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` mediumint(25) NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` tinyint(255) NOT NULL,
  `price` bigint(10) NOT NULL DEFAULT '0',
  `quantity` int(255) DEFAULT NULL,
  `remain` int(255) DEFAULT NULL,
  `max_per_customer` int(10) DEFAULT NULL,
  `valid_duration` int(10) DEFAULT NULL,
  `discount_type` smallint(10) NOT NULL,
  `discount_amount` bigint(255) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_vietnamese_ci,
  `code_length` int(11) DEFAULT NULL,
  `code_prefix` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `buyable_next_month` tinyint(4) DEFAULT NULL COMMENT 'Check if this voucher must be bought next month after reaching milestone',
  `applicable_at` tinyint(4) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `dealer_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `creator` mediumint(25) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `name`, `type`, `price`, `quantity`, `remain`, `max_per_customer`, `valid_duration`, `discount_type`, `discount_amount`, `image`, `description`, `code_length`, `code_prefix`, `buyable_next_month`, `applicable_at`, `vendor_id`, `dealer_id`, `creator`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(52, 'Discount 15% for online orders at FitFood website', 1, 0, NULL, -3, 3, NULL, 1, 15, 'storage/images/20/11/vouchers-image-52-1605152895.jpg', '<p>Thành viên SUZUKI sẽ nhận được ưu đãi giảm giá 15% cho TẤT CẢ các đơn hàng khi đặt hàng trên website: https://fitfood.vn.</p>\r\n\r\n<p>Hãy tận hưởng bữa ăn được chuẩn bị sẵn cùng với những công thức nấu ăn lành mạnh cũng như những lời khuyên bổ ích từ Fitfood để việc sống khỏe không trở nên nhàm chán!</p>', NULL, NULL, NULL, 3, 10, NULL, NULL, 0, '2020-11-11 09:10:49', '2021-04-09 00:37:00', NULL),
(53, 'Giảm 5% Dịch vụ tại Suzuki Phổ Quang', 1, 30, NULL, -1, NULL, NULL, 1, 5, 'storage/images/21/02/vouchers-image--1614066708.png', '<p><strong>Giảm 5% giá trị hóa đơn trước thuế</strong> khi thực hiện dịch vụ cho xe ô tô Suzuki tại Suzuki Phổ Quang.</p>\r\n\r\n<p>Áp dụng cho cả 2 dòng xe&nbsp;du lịch và xe thương mại Suzuki.</p>\r\n\r\n<p>Voucher này không áp dụng cho các trường hợp liên quan tới bảo hiểm &amp; đồng sơn.</p>', 6, '05MEM21', 1, 1, 11, '8', NULL, 1, '2021-02-23 07:51:48', '2021-05-05 10:50:01', NULL),
(54, 'Giảm 10% Dịch vụ tại Suzuki Phổ Quang', 1, 45, NULL, -2, NULL, 90, 1, 10, 'storage/images/21/02/vouchers-image--1614067456.png', '<p>Giảm 10% giá trị hóa đơn trước thuế khi thực hiện dịch vụ cho xe ô tô Suzuki tại Suzuki Phổ Quang.</p>\r\n\r\n<p>Áp dụng cho cả 2 dòng xe&nbsp;du lịch và xe thương mại Suzuki.</p>\r\n\r\n<p>Voucher này không áp dụng cho các trường hợp liên quan tới bảo hiểm &amp; đồng sơn.</p>', 6, '10MEM21', 1, 2, 11, '8', NULL, 1, '2021-02-23 08:04:17', '2021-05-05 10:50:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_codes`
--

CREATE TABLE `voucher_codes` (
  `id` bigint(25) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `customer_id` bigint(25) UNSIGNED DEFAULT NULL,
  `voucher_id` mediumint(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `dealer_id` bigint(25) UNSIGNED DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_vietnamese_ci,
  `status` smallint(2) DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT NULL,
  `purchased_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `voucher_codes`
--

INSERT INTO `voucher_codes` (`id`, `code`, `customer_id`, `voucher_id`, `start_date`, `end_date`, `dealer_id`, `note`, `status`, `applied_at`, `purchased_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '54SLMjkUKFoom', 67, 54, '2021-04-12', '2021-07-11', NULL, NULL, 1, NULL, '2021-04-12 01:47:27', '2021-04-12 01:47:27', '2021-04-12 01:47:27', NULL),
(2, '53S72ECwoPc5S', 67, 53, '2021-04-12', '2021-04-13', NULL, NULL, 1, NULL, '2021-04-12 01:48:20', '2021-04-12 01:48:20', '2021-04-12 01:48:20', NULL),
(3, '54Sr3mGMA7ZxY', 1, 54, '2021-04-12', '2021-07-11', NULL, NULL, 1, NULL, '2021-04-12 02:29:44', '2021-04-12 02:29:44', '2021-04-12 02:29:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_customer_user` (`user_id`) USING BTREE,
  ADD KEY `fk_customer_id_issue_province` (`id_issue_province`) USING BTREE,
  ADD KEY `fk_customer_dealer` (`dealer_id`) USING BTREE,
  ADD KEY `fk_customer_district` (`district_id`) USING BTREE;

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_district_province` (`province_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_memberships_customer` (`customer_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `point_histories`
--
ALTER TABLE `point_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `unique_order_voucher` (`customer_id`,`voucher_code_id`,`order_id`) USING BTREE,
  ADD KEY `fk_point_history_voucher_code` (`voucher_code_id`) USING BTREE;

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `frame_number_unique` (`frame_number`) USING BTREE,
  ADD KEY `fk_vehicle_customer` (`customer_id`) USING BTREE,
  ADD KEY `fk_vehicle_dealer` (`dealer_id`) USING BTREE,
  ADD KEY `fk_vehicle_vehicle_color` (`vehicle_color_id`) USING BTREE,
  ADD KEY `frame_number` (`frame_number`) USING BTREE;

--
-- Indexes for table `vehicle_colors`
--
ALTER TABLE `vehicle_colors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `vehicle_models`
--
ALTER TABLE `vehicle_models`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_voucher_vendor` (`vendor_id`) USING BTREE;

--
-- Indexes for table `voucher_codes`
--
ALTER TABLE `voucher_codes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `code_voucher_id` (`code`,`voucher_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `fk_voucher_code_customer` (`customer_id`) USING BTREE,
  ADD KEY `fk_voucher_code_dealer` (`dealer_id`) USING BTREE,
  ADD KEY `fk_voucher_code_voucher` (`voucher_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(25) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `point_histories`
--
ALTER TABLE `point_histories`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` mediumint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `vehicle_colors`
--
ALTER TABLE `vehicle_colors`
  MODIFY `id` bigint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` mediumint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `voucher_codes`
--
ALTER TABLE `voucher_codes`
  MODIFY `id` bigint(25) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customer_dealer` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `fk_customer_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `fk_customer_id_issue_province` FOREIGN KEY (`id_issue_province`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `fk_memberships_vehicles` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `point_histories`
--
ALTER TABLE `point_histories`
  ADD CONSTRAINT `fk_point_history_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_point_history_voucher_code` FOREIGN KEY (`voucher_code_id`) REFERENCES `voucher_codes` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicle_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_vehicle_dealer` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `fk_vehicle_vehicle_color` FOREIGN KEY (`vehicle_color_id`) REFERENCES `vehicle_colors` (`id`);

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `fk_voucher_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `voucher_codes`
--
ALTER TABLE `voucher_codes`
  ADD CONSTRAINT `fk_voucher_code_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_voucher_code_dealer` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `fk_voucher_code_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS = 1;