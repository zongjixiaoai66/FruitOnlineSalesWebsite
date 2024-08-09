/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t306`;
CREATE DATABASE IF NOT EXISTS `t306` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t306`;

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int NOT NULL COMMENT '创建用户',
  `address_name` varchar(200) NOT NULL COMMENT '收货人 ',
  `address_phone` varchar(200) NOT NULL COMMENT '电话 ',
  `address_dizhi` varchar(200) NOT NULL COMMENT '地址 ',
  `isdefault_types` int NOT NULL COMMENT '是否默认地址 ',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='收货地址';

DELETE FROM `address`;
INSERT INTO `address` (`id`, `yonghu_id`, `address_name`, `address_phone`, `address_dizhi`, `isdefault_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 2, '收货人1', '17703786901', '地址1', 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(2, 3, '收货人2', '17703786902', '地址2', 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(3, 2, '收货人3', '17703786903', '地址3', 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(4, 1, '收货人4', '17703786904', '地址4', 2, '2022-04-14 13:11:48', '2022-04-15 01:10:15', '2022-04-14 13:11:48'),
	(5, 1, '收货人5', '17703786905', '地址5', 1, '2022-04-14 13:11:48', '2022-04-15 01:10:10', '2022-04-14 13:11:48');

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int DEFAULT NULL COMMENT '所属用户',
  `shuiguo_id` int DEFAULT NULL COMMENT '水果',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='购物车';

DELETE FROM `cart`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-04-14 13:08:58'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-04-14 13:08:58'),
	(3, 'shangjia_xingji_types', '商家信用类型', 1, '一级', NULL, NULL, '2022-04-14 13:08:58'),
	(4, 'shangjia_xingji_types', '商家信用类型', 2, '二级', NULL, NULL, '2022-04-14 13:08:58'),
	(5, 'shangjia_xingji_types', '商家信用类型', 3, '三级', NULL, NULL, '2022-04-14 13:08:58'),
	(6, 'tuijian_types', '是否推荐', 1, '是', NULL, NULL, '2022-04-14 13:08:58'),
	(7, 'tuijian_types', '是否推荐', 2, '否', NULL, NULL, '2022-04-14 13:08:58'),
	(8, 'tejia_types', '是否特价', 1, '特价', NULL, NULL, '2022-04-14 13:08:58'),
	(9, 'tejia_types', '是否特价', 2, '非特价', NULL, NULL, '2022-04-14 13:08:59'),
	(10, 'jinkou_types', '是否进口', 1, '进口', NULL, NULL, '2022-04-14 13:08:59'),
	(11, 'jinkou_types', '是否进口', 2, '非进口', NULL, NULL, '2022-04-14 13:08:59'),
	(12, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-04-14 13:08:59'),
	(13, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-04-14 13:08:59'),
	(14, 'shuiguo_types', '一级分类', 1, '浆果类', NULL, NULL, '2022-04-14 13:08:59'),
	(15, 'shuiguo_types', '一级分类', 2, '瓜果类', NULL, NULL, '2022-04-14 13:08:59'),
	(16, 'shuiguo_erji_types', '二级分类', 1, '草莓', 1, NULL, '2022-04-14 13:08:59'),
	(17, 'shuiguo_erji_types', '二级分类', 2, '桑椹', 1, NULL, '2022-04-14 13:08:59'),
	(18, 'shuiguo_erji_types', '二级分类', 3, '蔓越莓', 1, NULL, '2022-04-14 13:08:59'),
	(19, 'shuiguo_erji_types', '二级分类', 4, '蓝莓', 1, NULL, '2022-04-14 13:08:59'),
	(20, 'shuiguo_erji_types', '二级分类', 5, '西瓜', 2, NULL, '2022-04-14 13:08:59'),
	(21, 'shuiguo_erji_types', '二级分类', 6, '甜瓜', 2, NULL, '2022-04-14 13:08:59'),
	(22, 'shuiguo_erji_types', '二级分类', 7, '香瓜', 2, NULL, '2022-04-14 13:08:59'),
	(23, 'shuiguo_erji_types', '二级分类', 8, '哈密瓜', 2, NULL, '2022-04-14 13:08:59'),
	(24, 'shuiguo_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-04-14 13:08:59'),
	(25, 'shuiguo_order_types', '订单类型', 1, '已支付', NULL, NULL, '2022-04-14 13:08:59'),
	(26, 'shuiguo_order_types', '订单类型', 2, '退款', NULL, NULL, '2022-04-14 13:08:59'),
	(27, 'shuiguo_order_types', '订单类型', 3, '已发货', NULL, NULL, '2022-04-14 13:08:59'),
	(28, 'shuiguo_order_types', '订单类型', 4, '已收货', NULL, NULL, '2022-04-14 13:08:59'),
	(29, 'shuiguo_order_types', '订单类型', 5, '已评价', NULL, NULL, '2022-04-14 13:08:59'),
	(30, 'shuiguo_order_payment_types', '订单支付类型', 1, '现金', NULL, NULL, '2022-04-14 13:08:59'),
	(31, 'isdefault_types', '是否默认地址', 1, '否', NULL, NULL, '2022-04-14 13:08:59'),
	(32, 'isdefault_types', '是否默认地址', 2, '是', NULL, NULL, '2022-04-14 13:08:59'),
	(33, 'gonggao_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-04-14 13:08:59'),
	(34, 'gonggao_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-04-14 13:08:59'),
	(35, 'single_seach_types', '单页数据类型', 1, '招商加盟', NULL, NULL, '2022-04-14 13:08:59'),
	(36, 'single_seach_types', '单页数据类型', 2, '联系我们', NULL, NULL, '2022-04-14 13:08:59'),
	(37, 'single_seach_types', '单页数据类型', 3, '网站介绍', NULL, NULL, '2022-04-14 13:08:59'),
	(38, 'shangjia_yesno_types', '审核状态', 1, '待审核', NULL, NULL, '2022-04-14 13:24:28'),
	(39, 'shangjia_yesno_types', '审核状态', 2, '同意', NULL, NULL, '2022-04-14 13:24:28'),
	(40, 'shangjia_yesno_types', '审核状态', 3, '拒绝', NULL, NULL, '2022-04-14 13:24:28'),
	(41, 'gonggao_types', '公告类型', 3, '公告类型3', NULL, '', '2022-04-15 01:11:27'),
	(42, 'shuiguo_erji_types', '二级分类', 9, '青提', 1, '', '2022-04-15 01:11:49');

DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE IF NOT EXISTS `gonggao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告';

DELETE FROM `gonggao`;
INSERT INTO `gonggao` (`id`, `gonggao_name`, `gonggao_photo`, `gonggao_types`, `insert_time`, `gonggao_content`, `create_time`) VALUES
	(1, '公告名称1', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/gonggao1.jpg', 2, '2022-04-14 13:11:48', '公告详情1', '2022-04-14 13:11:48'),
	(2, '公告名称2', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/gonggao2.jpg', 1, '2022-04-14 13:11:48', '公告详情2', '2022-04-14 13:11:48'),
	(3, '公告名称3', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/gonggao3.jpg', 2, '2022-04-14 13:11:48', '公告详情3', '2022-04-14 13:11:48'),
	(4, '公告名称4', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/gonggao4.jpg', 2, '2022-04-14 13:11:48', '公告详情4', '2022-04-14 13:11:48'),
	(5, '公告名称5', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/gonggao5.jpg', 1, '2022-04-14 13:11:48', '公告详情5', '2022-04-14 13:11:48');

DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE IF NOT EXISTS `shangjia` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `username` varchar(200) DEFAULT NULL COMMENT '账户 ',
  `password` varchar(200) DEFAULT NULL COMMENT '密码 ',
  `shangjia_name` varchar(200) DEFAULT NULL COMMENT '商家名称 Search111 ',
  `shangjia_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `shangjia_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shangjia_photo` varchar(200) DEFAULT NULL COMMENT '营业执照展示 ',
  `shangjia_xingji_types` int DEFAULT NULL COMMENT '商家信用类型',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '现有余额',
  `shangjia_content` text COMMENT '商家简介 ',
  `shangjia_yesno_types` int DEFAULT NULL COMMENT '审核状态 Search111 ',
  `shangjia_yesno_text` text COMMENT '审核意见',
  `shangjia_shenhe_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `shangjia_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='商家';

DELETE FROM `shangjia`;
INSERT INTO `shangjia` (`id`, `username`, `password`, `shangjia_name`, `shangjia_phone`, `shangjia_email`, `shangjia_photo`, `shangjia_xingji_types`, `new_money`, `shangjia_content`, `shangjia_yesno_types`, `shangjia_yesno_text`, `shangjia_shenhe_time`, `shangjia_delete`, `create_time`) VALUES
	(1, '商家1', '123456', '商家名称1', '17703786901', '1@qq.com', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shangjia1.jpg', 2, 341.83, '商家简介1', 2, '同意', '2022-04-14 13:11:48', 1, '2022-04-14 13:11:48'),
	(2, '商家2', '123456', '商家名称2', '17703786902', '2@qq.com', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shangjia2.jpg', 2, 584.70, '商家简介2', 2, 'en ', '2022-04-15 01:14:04', 1, '2022-04-14 13:11:48'),
	(3, '商家3', '123456', '商家名称3', '17703786903', '3@qq.com', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shangjia3.jpg', 1, 460.25, '商家简介3', 3, '不同意', '2022-04-14 13:35:39', 1, '2022-04-14 13:11:48');

DROP TABLE IF EXISTS `shuiguo`;
CREATE TABLE IF NOT EXISTS `shuiguo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `shangjia_id` int DEFAULT NULL COMMENT '商家',
  `shuiguo_name` varchar(200) DEFAULT NULL COMMENT '水果名称  Search111 ',
  `shuiguo_uuid_number` varchar(200) DEFAULT NULL COMMENT '水果编号  Search111 ',
  `shuiguo_photo` varchar(200) DEFAULT NULL COMMENT '水果照片',
  `shuiguo_types` int DEFAULT NULL COMMENT '一级分类 Search111',
  `shuiguo_erji_types` int DEFAULT NULL COMMENT '二级分类 Search111',
  `tuijian_types` int DEFAULT NULL COMMENT '是否推荐',
  `tejia_types` int DEFAULT NULL COMMENT '是否特价',
  `jinkou_types` int DEFAULT NULL COMMENT '是否进口',
  `shuiguo_kucun_number` int DEFAULT NULL COMMENT '水果库存',
  `shuiguo_old_money` decimal(10,2) DEFAULT NULL COMMENT '水果原价 ',
  `shuiguo_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `shuiguo_clicknum` int DEFAULT NULL COMMENT '点击次数 ',
  `shuiguo_content` text COMMENT '水果介绍 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `shuiguo_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='水果';

DELETE FROM `shuiguo`;
INSERT INTO `shuiguo` (`id`, `shangjia_id`, `shuiguo_name`, `shuiguo_uuid_number`, `shuiguo_photo`, `shuiguo_types`, `shuiguo_erji_types`, `tuijian_types`, `tejia_types`, `jinkou_types`, `shuiguo_kucun_number`, `shuiguo_old_money`, `shuiguo_new_money`, `shuiguo_clicknum`, `shuiguo_content`, `shangxia_types`, `shuiguo_delete`, `create_time`) VALUES
	(1, 2, '水果名称1', '164994190825814', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shuiguo1.jpg', 1, 1, 2, 2, 2, 100, 846.71, 52.62, 244, '水果介绍1', 1, 1, '2022-04-14 13:11:48'),
	(2, 1, '水果名称2', '164994190825811', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shuiguo2.jpg', 1, 2, 1, 2, 2, 101, 648.67, 200.50, 489, '水果介绍2', 1, 1, '2022-04-14 13:11:48'),
	(3, 1, '水果名称3', '16499419082582', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shuiguo3.jpg', 1, 3, 1, 2, 1, 102, 900.05, 228.24, 88, '水果介绍3', 1, 1, '2022-04-14 13:11:48'),
	(4, 3, '水果名称4', '164994190825816', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shuiguo4.jpg', 2, 5, 2, 1, 2, 103, 897.87, 351.31, 60, '水果介绍4', 1, 1, '2022-04-14 13:11:48'),
	(5, 1, '水果名称5', '164994190825810', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/shuiguo5.jpg', 2, 6, 2, 2, 1, 105, 536.19, 410.05, 251, '水果介绍5', 1, 1, '2022-04-14 13:11:48'),
	(6, 1, '水果111', '1649985285335', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/1649985295538.jpg', 1, 3, 2, 1, 2, 100, 105.00, 55.00, 1, '<p>大概会尽快</p>', 2, 1, '2022-04-15 01:15:17');

DROP TABLE IF EXISTS `shuiguo_collection`;
CREATE TABLE IF NOT EXISTS `shuiguo_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shuiguo_id` int DEFAULT NULL COMMENT '水果',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shuiguo_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='水果收藏';

DELETE FROM `shuiguo_collection`;
INSERT INTO `shuiguo_collection` (`id`, `shuiguo_id`, `yonghu_id`, `shuiguo_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 3, 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(2, 2, 3, 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(3, 3, 1, 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(4, 4, 3, 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(5, 5, 3, 1, '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(6, 2, 1, 1, '2022-04-15 01:10:41', '2022-04-15 01:10:41'),
	(7, 4, 1, 1, '2024-08-01 08:18:05', '2024-08-01 08:18:05');

DROP TABLE IF EXISTS `shuiguo_commentback`;
CREATE TABLE IF NOT EXISTS `shuiguo_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shuiguo_id` int DEFAULT NULL COMMENT '水果',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shuiguo_commentback_text` text COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='水果评价';

DELETE FROM `shuiguo_commentback`;
INSERT INTO `shuiguo_commentback` (`id`, `shuiguo_id`, `yonghu_id`, `shuiguo_commentback_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 1, 2, '评价内容1', '2022-04-14 13:11:48', '回复信息1', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(2, 2, 2, '评价内容2', '2022-04-14 13:11:48', '回复信息2', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(3, 3, 3, '评价内容3', '2022-04-14 13:11:48', '回复信息3', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(4, 4, 2, '评价内容4', '2022-04-14 13:11:48', '回复信息4', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(5, 5, 3, '评价内容5', '2022-04-14 13:11:48', '回复信息5', '2022-04-14 13:11:48', '2022-04-14 13:11:48'),
	(6, 5, 1, '很好吃', '2022-04-15 01:17:03', 'ssghgjk', '2022-04-15 01:17:34', '2022-04-15 01:17:03');

DROP TABLE IF EXISTS `shuiguo_order`;
CREATE TABLE IF NOT EXISTS `shuiguo_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shuiguo_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号 Search111 ',
  `address_id` int DEFAULT NULL COMMENT '收货地址 ',
  `shuiguo_id` int DEFAULT NULL COMMENT '水果',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `shuiguo_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `shuiguo_order_courier_name` varchar(200) DEFAULT NULL COMMENT '快递公司',
  `shuiguo_order_courier_number` varchar(200) DEFAULT NULL COMMENT '订单快递单号',
  `shuiguo_order_types` int DEFAULT NULL COMMENT '订单类型 Search111 ',
  `shuiguo_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='水果订单';

DELETE FROM `shuiguo_order`;
INSERT INTO `shuiguo_order` (`id`, `shuiguo_order_uuid_number`, `address_id`, `shuiguo_id`, `yonghu_id`, `buy_number`, `shuiguo_order_true_price`, `shuiguo_order_courier_name`, `shuiguo_order_courier_number`, `shuiguo_order_types`, `shuiguo_order_payment_types`, `insert_time`, `create_time`) VALUES
	(1, '1649984873301', 4, 3, 1, 1, 228.24, NULL, NULL, 2, 1, '2022-04-15 01:07:53', '2022-04-15 01:07:53'),
	(2, '1649985023799', 4, 3, 1, 1, 228.24, NULL, NULL, 1, 1, '2022-04-15 01:10:24', '2022-04-15 01:10:24'),
	(3, '1649985023799', 4, 2, 1, 1, 200.50, '顺丰快递', '544499478', 3, 1, '2022-04-15 01:10:24', '2022-04-15 01:10:24'),
	(4, '1649985023799', 4, 1, 1, 1, 52.62, NULL, NULL, 1, 1, '2022-04-15 01:10:24', '2022-04-15 01:10:24'),
	(5, '1649985023799', 4, 5, 1, 1, 410.05, '申通快递', '534864845', 5, 1, '2022-04-15 01:10:24', '2022-04-15 01:10:24'),
	(6, '1722500295156', 4, 4, 1, 1, 351.31, NULL, NULL, 1, 1, '2024-08-01 08:18:15', '2024-08-01 08:18:15');

DROP TABLE IF EXISTS `single_seach`;
CREATE TABLE IF NOT EXISTS `single_seach` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `single_seach_name` varchar(200) DEFAULT NULL COMMENT '名字  Search111 ',
  `single_seach_types` int DEFAULT NULL COMMENT '数据类型',
  `single_seach_content` text COMMENT '内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='单页数据';

DELETE FROM `single_seach`;
INSERT INTO `single_seach` (`id`, `single_seach_name`, `single_seach_types`, `single_seach_content`, `create_time`) VALUES
	(1, '网站介绍', 3, '<p>网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍</p>', '2022-04-14 13:27:22'),
	(2, '联系我们', 2, '<p>联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们</p>', '2022-04-14 13:27:35'),
	(3, '招商加盟', 1, '<p>招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟招商加盟</p>', '2022-04-14 13:27:48');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', '8oddx1jf52hfmqavvjzxak8b68yve0i4', '2022-04-14 13:21:39', '2024-08-01 09:16:19'),
	(2, 1, 'a1', 'yonghu', '用户', 'lonrcv7l77xhdftv4vs92s99sp2bgye6', '2022-04-14 13:23:09', '2024-08-01 09:17:35'),
	(3, 2, 'a2', 'shangjia', '商家', 'kmu4mhxf1vrga1sylscifik23th5mwkx', '2022-04-15 01:14:17', '2022-04-15 02:14:18'),
	(4, 1, 'a1', 'shangjia', '商家', 'wtt97clyimwir6e1xmgh92d96yx9pjcr', '2022-04-15 01:14:28', '2024-08-01 09:17:23');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `new_money`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/yonghu1.jpg', 1, '1@qq.com', 9147.61, '2022-04-14 13:11:48'),
	(2, '用户2', '123456', '用户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/yonghu2.jpg', 2, '2@qq.com', 967.09, '2022-04-14 13:11:48'),
	(3, '用户3', '123456', '用户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/shuiguozaixianxiaoshou/upload/yonghu3.jpg', 2, '3@qq.com', 119.42, '2022-04-14 13:11:48');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
