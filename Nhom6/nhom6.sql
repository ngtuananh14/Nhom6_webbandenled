-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 11, 2023 lúc 06:39 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Tên danh mục',
  `type` tinyint(3) DEFAULT 0 COMMENT 'Loại danh mục: 0 - Product, 1 - News',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh danh mục',
  `description` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho danh mục',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo danh mục',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'ĐÈN LED ÂM TRẦN ELV', 0, '', 'ĐÈN LED ÂM TRẦN ELV', 1, '2023-09-06 13:27:21', '2023-09-06 20:27:27'),
(4, 'Đèn LED Ốp Trần ELV', 0, '', 'Đèn LED Ốp Trần ELV', 1, '2023-09-06 13:28:04', NULL),
(5, 'Đèn LED Tuýp ELV', 0, '', 'Đèn LED Tuýp ELV', 1, '2023-09-06 13:28:17', NULL),
(6, 'Đèn LED Rọi Ray ELV', 0, '', 'Đèn LED Rọi Ray ELV', 1, '2023-09-06 13:28:27', NULL),
(7, 'Đèn LED Chiếu Điểm ELV', 0, '', 'Đèn LED Chiếu Điểm ELV', 1, '2023-09-06 13:28:42', NULL),
(8, 'Đèn LED Panel ELV', 0, '', 'Đèn LED Panel ELV', 1, '2023-09-06 13:28:52', NULL),
(9, 'Đèn LED Pha ELV', 0, '', 'Đèn LED Pha ELV', 1, '2023-09-06 13:28:59', NULL),
(10, 'Đèn LED Dây ELV', 0, '', 'Đèn LED Dây ELV', 1, '2023-09-06 13:29:08', NULL),
(11, 'ĐÈN LED XƯỞNG ELV', 0, '', 'ĐÈN LED XƯỞNG ELV', 1, '2023-09-06 13:33:50', NULL),
(12, 'Đèn LED Sân Vườn ELV', 0, '', 'Đèn LED Sân Vườn ELV', 1, '2023-09-06 13:35:35', '2023-09-06 20:37:53'),
(13, 'Đèn LED Cầu Thang ELV', 0, '', 'Đèn LED Cầu Thang ELV', 1, '2023-09-06 13:36:22', '2023-09-06 20:37:59'),
(14, 'Đèn LED Gắn Tường ELV', 0, '', 'Đèn LED Gắn Tường ELV', 1, '2023-09-06 13:36:41', NULL),
(15, 'Đèn Soi Tranh-Rọi Gương', 0, '', 'Đèn Soi Tranh-Rọi Gương', 1, '2023-09-06 13:38:11', NULL),
(16, 'Phụ kiện ELV', 0, '', 'Phụ kiện ELV', 1, '2023-09-06 13:38:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL COMMENT 'Tên khách hàng',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ khách hàng',
  `mobile` int(11) DEFAULT NULL COMMENT 'SĐT khách hàng',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email khách hàng',
  `note` text DEFAULT NULL COMMENT 'Ghi chú từ khách hàng',
  `price_total` int(11) DEFAULT NULL COMMENT 'Tổng giá trị đơn hàng',
  `payment_status` tinyint(2) DEFAULT NULL COMMENT 'Trạng thái đơn hàng: 0 - Chưa thành toán, 1 - Đã thành toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo đơn',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Id của order tương ứng, là khóa ngoại liên kết với bảng orders',
  `product_name` varchar(150) DEFAULT NULL COMMENT 'Tên sp tại thời điểm đặt hàng',
  `product_price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm tương ứng tại thời điểm đặt hàng',
  `quantity` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm tương ứng tại thời điểm đặt hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(255) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `amount` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm trong kho',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `seo_title` varchar(255) DEFAULT NULL COMMENT 'Từ khóa seo cho title',
  `seo_description` varchar(255) DEFAULT NULL COMMENT 'Từ khóa seo cho phần mô tả',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT 'Các từ khóa seo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `avatar`, `price`, `amount`, `summary`, `content`, `status`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(11, 3, 'ĐÈN LED ÂM TRẦN 10W VL-D002090D ELV', '1694007814-product-1512549539_VL-D002090D_HUY2-247x296.jpg', 590000, 1000, 'Mã sản phẩm: VL-D00209D\r\n\r\nChíp LED: EPISTAR\r\n\r\nCông suất: 10W\r\n\r\nKích thước: 135*H38\r\n\r\nLỗ khoét: 120\r\n\r\nGóc chiếu: 900\r\n\r\nÁnh sáng: 3000K/4000K/6500K\r\n\r\nHệ số công suất: 0.9\r\n\r\nĐiện áp hoạt động: 110~277V / 50-60Hz\r\n\r\nBộ nguồn: Ngoài / Tích hợp', 'Đèn LED âm trần 10W VL-D002090D ELV thương hiệu uy tín đã được khẳng định\r\nChúng ta đều biết rằng đèn led âm trần ngoài chức năng chiếu sáng còn có giá trị cao về giá trị thẩm mỹ, tăng tính hài hòa trong trang trí tổng thể nội thất gia đình, công sở, cửa hàng kinh doanh… Với tiêu chí sang trọng, ánh sáng bắt mắt, tiết kiệm tối đa điện năng ( đồng nghĩa với tiết kiệm kinh tế) thì đèn LED âm trần 10W VL-D002090D ELV đáp ứng đầy đủ các tiêu chí trên.\r\n\r\nĐặc điểm sản phẩm:\r\n\r\n– Đèn LED âm trần 10W VL-D002090D ELV được thiết kế theo dạng tròn với đường kính khoét lỗ 120mm, đường kính vành ngoài 135mm, với mức công suất hoạt động là 10W.\r\n\r\n– Chất liệu: Thân nhôm, độ bền cao, tản nhiệt tốt. Chip LED EPISTAR có hiệu suất ánh sáng cao, màu sác ánh sáng trung thực. Chip EPISTAR  được khuyến cáo là bền bỉ và có tuổi thọ cao đồng nghĩa với hiệu quả và vô cùng kinh tế.\r\n\r\n– Góc chiếu rộng, tiết kiệm điện năng, độ tin cậy cao, không hạn chế số lần bật/tắt. Kiểu dáng hiện đại, khỏe khoắn, kết cấu mỏng, dễ lắp đặt. Sơn tĩnh điện chống bụi, chống bám bẩn.\r\n\r\nLợi ích khi dùng đèn LED âm trần 10W VL-D002090D ELV\r\n– Tiết kiệm điện năng 60% so với các đèn truyền thống nhờ sử dụng công nghệ Led hiện đại có hiệu suất ánh sáng cao giúp giảm chi phí hóa đơn tiền điện hàng tháng và bảo vệ môi trường.\r\n\r\n– Bộ phận tản nhiệt thiết kế vỏ nhôm được xử lý tinh tế và bộ phận tản nhiệt từ hợp kim nhôm giúp cho chíp Led và toàn bộ đèn tản nhiệt nhanh hơn các loại bóng đèn led âm trần truyền thống. Do đó, làm tăng tuổi thọ đèn trên 30.000 giờ chiếu sáng, cao gấp 2-3 lần so với đèn tuýp huỳnh quang.\r\n\r\n– Thân thiện với môi trường do không chứa thủy ngân độc hại, không phát tia tử ngoại, an toàn cho môi trường và cho người sử dụng.\r\n\r\n– Dễ dàng lắp đặt nhờ hệ thống tai treo giúp lắp đặt dễ dàng chỉ sau vài thao tác đơn giản\r\n\r\nỨng dụng:\r\n\r\n– Chiếu sáng hộ gia đình, căn hộ: phòng ngủ, phòng bếp….\r\n\r\n– Chiếu sáng khu văn phòng: Phòng họp, hành lang, tiền sảnh, …\r\n\r\n– Chiếu sáng trung tâm thương mại, siêu thị: Sảnh siêu thị cửa hàng, khu mua bán ….\r\n\r\nTóm lại, Đèn LED  âm trần 10W VL-D002090D ELV đã được người dùng kiểm nghiệm thực tế là có công dụng tuyệt vời, có nhiều ưu điểm so với các loại đèn cũ (Như đèn sợi tóc rất tốn điện lại sinh nhiệt rất nóng, đèn huỳnh quang tiết kiệm điện nhưng lâu ngày thì giảm độ sáng và bị hiện tượng nháy đèn gây hại mắt. v.v). Và tất cả các loại đèn công nghệ cũ đều có lượng khí thải ra môi trường ở mức rất cao, nhiều loại đèn sử dụng chất độc hại khi vỡ thì gây nguy hiểm tới người sử dụng. Đèn LED  âm trần 10W VL-D002090D ELV khắc phục được tất cả các nhược điểm của loại đèn kể trên, hứa hẹn sẽ là loại đèn của tương lai.', 1, '', '', '', '2023-09-06 13:43:34', '2023-09-06 20:46:49'),
(12, 3, 'Đèn LED âm trần 14W VL-D002120D ELV', '1694008105-product-1512549539_VL-D002090D_HUY2-247x296.jpg', 790000, 1000, 'Mã sản phẩm: VL-D002120D\r\n\r\nChíp LED: EPISTAR\r\n\r\nCông suất: 14W\r\n\r\nKích thước: 135*H38\r\n\r\nLỗ khoét: 120\r\n\r\nGóc chiếu: 900\r\n\r\nÁnh sáng: 3000K/4000K/6500K\r\n\r\nHệ số công suất: 0.9\r\n\r\nĐiện áp hoạt động: 110~277V / 50-60Hz\r\n\r\nBộ nguồn: Ngoài / Tích hợp', 'Đèn LED âm trần 14W VL-D002120D ELV nằm trong top sản phẩm bán chạy của chúng tôi:\r\nBởi lẽ, sản phẩm đạt chất lượng cao, siêu tiết kiệm điện, thân thiện với môi trường, cùng sự thiết kế độc đáo về kiểu dáng sẽ khẳng định đẳng cấp cho ngôi nhà của bạn, ngoài ra đèn LED âm trần 14W VL-D002120D ELV cũng sẽ dần thay thế các loại đèn compact, các loại bóng thông thường… với tính năng tiết kiệm điện và tuổi thọ cao. \r\n\r\nSản phẩm đèn LED âm trần 14W VL-D002120D ELV được Công ty Cổ phần thiết bị điện và chiếu sáng VinaLight phân phối, luôn có chế độ hậu mãi đi kèm, thời gian bảo hành và mức giá tốt nhất trên thị trường hiện nay. Đến với VinaLight, chúng tôi sẽ mang tới cho bạn giải pháp chiếu sáng tốt nhất, tiết kiệm chi phí nhất.\r\n\r\nVậy đèn led dowlight âm trần 14W VL-D002120D ELV có gì vượt trội so với các loại bóng đèn thông thường:\r\nĐặc điểm sản phẩm:\r\n\r\n– Đèn LED âm trần 14W VL-D002120D ELV được thiết kế theo dạng tròn với đường kính khoét lỗ 120mm, đường kính vành ngoài 135mm, với mức công suất hoạt động là 14W.\r\n\r\n– Chất liệu: Vỏ hợp kim nhôm cao cấp giúp tản nhiệt tốt hơn, độ bền cao và tăng tối đa tuổi thọ chip LED. Sử dụng công nghệ chip LED Epistar cho tuổi thọ đèn cao và có hiệu suất ánh sáng hiệu quả, màu sác ánh sáng trung thực.\r\n\r\n– Tuổi thọ của chip LED Epistar được cải thiện hơn đạt 40.000 giờ chiếu sáng, gấp 15 lần so với đèn thông thường. Điều này giúp tiết kiệm được chi phí bảo dưỡng, thay thế thiết bị khi sử dụng, tránh được những phiền hà từ thiết bị không ổn định hoặc tuổi thọ thấp mang tới.\r\n\r\n– Điểm tích cực khi chúng ta sử dụng sản phầm trong mùa hè là bề mặt đèn không bị nóng và phát xạ nhiệt ra môi trường xung quanh gây ra cảm giác khó chịu.\r\n\r\n– Đèn thiết kế ôm trần tạo sự mềm mại trong kiến trúc, biên dạng mặt đèn vuốt vào trần, ôm sát trần không tạo cảm giác lồi ra khỏi trần như một số loại đèn led thông thường. Kiểu dáng hiện đại, khỏe khoắn, kết cấu mỏng, dễ lắp đặt. Bề mặt ngoài của sản phẩm phủ lớp sơn tĩnh điện chống bụi, chống bám bẩn.\r\n\r\nỨng dụng:\r\n– Phù hợp với nhiều không gian kiến trúc như: Khách sạn, văn phòng, khu dân cư, hàng lang và các khu công cộng. Nhiều công trình lớn đã sử dụng sản phẩm Đèn LED âm trần 14W VL-D002120D ELV như: Trung tâm thương mại Time City, Royal City, và các siêu thị Big C, Vinmart, KCN Nam Thăng Long, KCN Thạch Thất, KCN Sài Đồng…', 1, '', '', '', '2023-09-06 13:44:35', '2023-09-06 20:48:25'),
(13, 3, 'Đèn led âm trần 15W ELV803F', '1694008455-product-vwd01r01-247x296.png', 1840000, 1000, 'Model: ELV-803F\r\nChíp LED: Epistar\r\nCông suất: 3*15W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 10,24,36 a\r\nLỗ khoét 95×270\r\nKích thước: 112x280xH85', 'Mã: ELV803F-15', 1, '', '', '', '2023-09-06 13:52:27', '2023-09-06 20:54:15'),
(14, 3, 'Đèn Led âm trần 20W lỗ khoét 160 VWD01R01 ELV', '1694008411-product-1508320132_elv-803f_huy-600x600-min-247x296.jpg', 550000, 1000, 'Model: VWD01R01\r\nCông suất: 20W\r\nChip Led: Epistar\r\nKích thước: 180*H52\r\nLỗ khoét: 160\r\nGóc chiếu: 120°\r\nChỉ số hoàn màu: Ra>90\r\nÁnh sáng: 3000K | 4000K | 6500K\r\nĐiện áp hoạt động: 185 ~ 265V / 50-60Hz\r\nTiêu chuẩn: IP20', 'Mã: VWD01R01', 1, '', '', '', '2023-09-06 13:53:10', '2023-09-06 20:53:31'),
(15, 3, 'Đèn led âm trần 6w VL-D03075A ELV', '1694008537-product-VL-D03075A-1042x800-247x296.jpg', 160000, 1000, 'Model : VL-D03075A\r\nCông suất tiêu thụ : 6w\r\nLỗ khoét trần : D 75mm\r\nAnh sáng lựa chọn : Trắng, Vàng hoặc Trung tính (có cả đèn 3 màu tích hợp trên cùng thân đèn)\r\nKích cỡ đèn ???? 103 x H 32mm (rất mỏng, phù hợp nhiều loại trần)\r\nGóc chiếu 120 độ\r\nChip l', 'Đèn led âm trần 6w VL-D03075A ELV ,   là seri mới nhất của ELV Lighting được ra mắt vào tháng 5/ 2018 với ưu điểm về thiết kế mỏng (32mm) , lỗ khoét phổ thông D 75mm và công suất tiêu thụ lên tới 6w, giá thành rất cạnh tranh.\r\n\r\nĐẶC TÍNH SẢN PHẨM\r\n\r\nVật liệu: thân hợp kim nhôm có đế tản nhiệt đem lại độ bền cao.\r\nThiết kế mỏng nhưng rất chắc chắn, dễ dàng lắp đặt.\r\nChip LED có hiệu suất phát sáng cao, màu sắc ánh sáng trung thực\r\nToàn bộ đèn được sơn tĩnh điện chống bám bụi\r\nBộ nguồn rời dễ thay thế\r\nCó nhiều màu ánh sáng để lựa chọn : Trắng, vàng, trung tính hoặc đèn 3 màu.\r\nƯU ĐIỂM SẢN PHẨM\r\n\r\nDễ dàng lắp đặt cho mọi loại trần kể cả không gian trần hẹp\r\nĐèn led âm trần 6w VL-D03075A ELV dùng thay thế cho các chủng loại đèn truyền thống có lỗ khoét D 90 mm\r\nGóc chiếu rộng lên tới 120 độ với mặt mica mờ giảm độ chói khi nhìn trực tiếp vào đèn.\r\nSử dụng chip Led uy tín hàng đầu thế giới, đảm bảo chất lượng ánh sáng vượt bậc,  tuổi thọ lên đến 30.000 giờ cùng tính năng tiết kiệm điện hiệu quả, giúp giảm thiểu tối đa chi phí tiền điện hàng tháng của người dùng.\r\nĐược sản xuất từ những chất liệu cao cấp không chứa các chất độc hại như chì, thủy ngân hay phát ra các tia gây hại như UV, tia IR gây ảnh hưởng đến làn da và làm phai màu các vật thể được chiếu sáng, bảo vệ an toàn tuyệt đối cho sức khỏe.\r\nSản phẩm phù hợp lắp đặt cho nhiều không gian khác nhau như chiếu sáng nhà ở, căn hộ, nhà hàng, khách sạn, showroom, nhà hàng – khách sạn, vv…', 1, '', '', '', '2023-09-06 13:55:14', '2023-09-06 20:55:37'),
(16, 3, 'Đèn led âm trần 9W CEA13501F ELV', '1694008600-product-1508572770_cea1301f_huy-600x600-1-247x296.jpg', 330000, 1000, 'Model: CEA13501F\r\nChíp LED: Epistar\r\nCông suất: 9W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 1000\r\nLỗ khoét: Ф95\r\nKích thước: Ф105xH60', 'Đèn led âm trần 9W CEA13501F ELV\r\nĐặc điểm sản phẩm:\r\n-Chất liệu: Thân nhôm, độ bền cao, tản nhiệt tốt.\r\n-Chíp LED có hiệu suất cao, màu sắc ánh sáng trung thực.\r\n-Góc chiếu đa dạng dễ làm nổi bật vật thể cần trang trí\r\n-Kiểu dáng hiện đại, dễ lắp đặt, có thể điều chỉnh ánh sáng theo hướng mong muốn.\r\n-Tiết kiệm điện năng, tuổi thọ cao đến 25.000 giờ\r\nỨng dụng:\r\n-Phù hợp với nhiều không gian kiến trúc như: Văn phòng, khu dân cư, nhà hàng, khách sạn, cửa hàng, hàng lang.', 1, '', '', '', '2023-09-06 13:56:20', '2023-09-06 20:56:40'),
(17, 4, 'Đèn led ốp trần tròn elv VL22-225-TMN', '1694008657-product-1510297889_VL08-120-TMN_HUY-600x600-1.jpg', 510000, 1000, 'Model: VL30-300-TMN\r\nChíp LED: Epistar\r\nCông suất: 22W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: Ф300xH25', 'Mã: VL22-225-TMN', 1, '', '', '', '2023-09-06 13:57:37', NULL),
(18, 4, 'Đèn led ốp trần tròn elv VL15-170-TMN', '1694008728-product-1510297889_VL08-120-TMN_HUY-600x600-1.jpg', 390000, 1000, 'Model: VL30-300-TMN\r\nChíp LED: Epistar\r\nCông suất: 15W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: Ф300xH25', 'Mã: VL15-170-TMN', 1, '', '', '', '2023-09-06 13:58:24', '2023-09-06 20:58:48'),
(19, 4, 'Đèn led ốp trần tròn elv VL08-120-TMN', '1694008770-product-1510297889_VL08-120-TMN_HUY-600x600-1.jpg', 270000, 1000, 'Model: VL30-300-TMN\r\nChíp LED: Epistar\r\nCông suất: 8W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: Ф300xH25', 'Mã: VL08-120-TMN', 1, '', '', '', '2023-09-06 13:59:30', NULL),
(20, 4, 'Đèn led ốp trần tròn elv VL30-300-TMN', '1694008821-product-1510297889_VL08-120-TMN_HUY-600x600-1.jpg', 690000, 1000, 'Model: VL30-300-TMN\r\nChíp LED: Epistar\r\nCông suất: 30W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: Ф300xH25', 'Mã: VL30-300-TMN', 1, '', '', '', '2023-09-06 14:00:09', '2023-09-06 21:00:21'),
(21, 4, 'Đèn led ốp trần vuông 22W VL22-225-VMN ELV', '1694008859-product-1510296772_vl15-170-vmn_huy1-600x600-1.jpg', 510000, 1000, 'Model: VL22-225-VMN\r\nChíp LED: Epistar\r\nCông suất: 22W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: 225x225xH25', 'Mã: VL22-225-VMN', 1, '', '', '', '2023-09-06 14:00:59', NULL),
(22, 4, 'Đèn led ốp trần vuông 8W VL08-120-VMN ELV', '1694008897-product-1510296772_vl15-170-vmn_huy1-600x600-1.jpg', 270000, 1000, 'Model: VL08-120-VMN\r\nChíp LED: Epistar\r\nCông suất: 8W\r\nÁnh sáng: 3000/4000/6500K\r\nGóc chiếu: 90\r\nKích thước: 120x120xH25', 'Mã: VL08-120-VMN', 1, '', '', '', '2023-09-06 14:01:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `full_name` varchar(255) DEFAULT NULL COMMENT 'Full name',
  `phone` int(11) DEFAULT NULL COMMENT 'SĐT user',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ user',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email của user',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `last_login` datetime DEFAULT NULL COMMENT 'Lần đăng nhập gần đây nhất',
  `facebook` varchar(255) DEFAULT NULL COMMENT 'Link facebook',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `phone`, `address`, `email`, `avatar`, `last_login`, `facebook`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$Z/4C2wl3LCifoIZdSRi0P.QfR05u7nUpWcCIYJjZ7TNlPEekFlx/a', '', 0, '', '', '1694006711-user-BOP1.png', NULL, '', 0, '2023-08-13 05:05:04', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
