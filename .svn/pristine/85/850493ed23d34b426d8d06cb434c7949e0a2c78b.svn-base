/*
Navicat MySQL Data Transfer

Source Server         : dhl
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : abs

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-27 17:26:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `real_name` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for advice
-- ----------------------------
DROP TABLE IF EXISTS `advice`;
CREATE TABLE `advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `user_id` int(11) NOT NULL,
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者',
  `update_user` int(11) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`),
  KEY `advice_user_id` (`user_id`),
  CONSTRAINT `advice_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advice
-- ----------------------------

-- ----------------------------
-- Table structure for air_bus
-- ----------------------------
DROP TABLE IF EXISTS `air_bus`;
CREATE TABLE `air_bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airId` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT '客机名',
  `buy_time` date NOT NULL COMMENT '购买时间',
  `last_use_time` date NOT NULL COMMENT '最近使用时间',
  `capacity` int(11) NOT NULL DEFAULT '0' COMMENT '载客容量',
  `tourist_capacity` int(11) NOT NULL DEFAULT '0' COMMENT '经济舱容量',
  `first_class_capacity` int(11) NOT NULL,
  `weight` float NOT NULL COMMENT '重量',
  `oil_weight` float NOT NULL COMMENT '载油量',
  `power` float NOT NULL COMMENT '发动机推力',
  `engine_amount` int(4) NOT NULL COMMENT '发动机数量',
  `length` float NOT NULL COMMENT '机身长度',
  `area` float NOT NULL COMMENT '机翼面积',
  `height` float NOT NULL COMMENT '高度',
  `flight_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight` (`flight_id`),
  CONSTRAINT `flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of air_bus
-- ----------------------------
INSERT INTO `air_bus` VALUES ('1', '1', '3', '2016-03-01', '2016-03-22', '23', '0', '0', '213', '213', '32', '324234', '231', '23', '213', null);
INSERT INTO `air_bus` VALUES ('5', '33', '12', '2016-03-01', '2016-03-22', '32', '0', '0', '3', '32', '32', '23', '32', '32', '32', null);

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `begin` varchar(32) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  `end` varchar(32) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `reach_time` date DEFAULT NULL,
  `start_airport` varchar(32) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  `target_airport` varchar(32) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  `runway` int(4) DEFAULT NULL,
  `first_class_capacity` int(11) DEFAULT NULL,
  `tourist_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sinhala_ci;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('1', '1', '223', '313', '2016-07-14', '2016-07-29', '23', '23', '23', '23', '23');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indent_number` int(32) DEFAULT NULL COMMENT '订单编号',
  `indent_user_id` int(11) DEFAULT NULL COMMENT '下单人编号',
  `user_id` int(255) DEFAULT NULL COMMENT '乘客编号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '乘客姓名',
  `id_card_number` varchar(255) DEFAULT NULL COMMENT '乘客身份证',
  `user_telephone` int(255) DEFAULT NULL COMMENT '乘客电话',
  `user_email` varchar(20) DEFAULT NULL COMMENT '乘客邮箱',
  `flight_id` int(20) DEFAULT NULL COMMENT '航班编号',
  `type` int(4) DEFAULT NULL COMMENT '机票类型',
  `shipping_type` int(4) DEFAULT NULL COMMENT '舱位类型',
  `gate` int(4) DEFAULT NULL COMMENT '登机口',
  PRIMARY KEY (`id`),
  KEY `order_user_id` (`user_id`) USING BTREE,
  KEY `order_flight_id` (`flight_id`) USING BTREE,
  CONSTRAINT `flight_indent` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', '11', '1', '1', '1', '22', '1', '1', '1', '1', '14324234', '1');
INSERT INTO `indent` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `indent` VALUES ('3', '120', '1', '2', '3', '4', '5', '6', '1', '8', '9', '1');
INSERT INTO `indent` VALUES ('17', null, null, null, '123', '123', '123', '123', null, null, '123', null);
INSERT INTO `indent` VALUES ('18', null, null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `indent` VALUES ('19', null, null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `indent` VALUES ('20', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `indent` VALUES ('21', null, null, null, '1123', '123', '123', '123', null, null, '123', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COMMENT '内容',
  `to_user_id` int(11) NOT NULL COMMENT '接受者编号',
  `from_user_id` int(11) NOT NULL COMMENT '发送者编号',
  `is_read` int(4) DEFAULT '0' COMMENT 'false',
  `type` int(4) DEFAULT NULL,
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者',
  `update_user` int(11) DEFAULT NULL COMMENT '修改者',
  `read_date` date DEFAULT NULL COMMENT '阅读日期',
  PRIMARY KEY (`id`),
  KEY `message_to_user_id` (`to_user_id`) USING BTREE,
  KEY `message__from_user_id` (`from_user_id`) USING BTREE,
  CONSTRAINT `message_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `message_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for reply_advice
-- ----------------------------
DROP TABLE IF EXISTS `reply_advice`;
CREATE TABLE `reply_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COMMENT '内容',
  `advice_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  `create_user` int(255) DEFAULT NULL COMMENT '创建者',
  `update_user` int(255) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`),
  KEY `relpy_advice_id` (`advice_id`),
  CONSTRAINT `relpy_advice_id` FOREIGN KEY (`advice_id`) REFERENCES `advice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_advice
-- ----------------------------

-- ----------------------------
-- Table structure for shipping_type
-- ----------------------------
DROP TABLE IF EXISTS `shipping_type`;
CREATE TABLE `shipping_type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sinhala_ci;

-- ----------------------------
-- Records of shipping_type
-- ----------------------------

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(20) NOT NULL,
  `flight_id` int(20) NOT NULL,
  `type` int(4) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `reach_time` datetime NOT NULL,
  `tourist_price` float NOT NULL,
  `first_price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_flight_id` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1', '2', '3', '3', '2016-07-21 23:38:14', '2016-07-14 23:38:17', '34', '34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) NOT NULL COMMENT '用户姓名',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `log_in_name` varchar(20) NOT NULL COMMENT '登录名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `sex` smallint(2) NOT NULL,
  `age` smallint(3) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL COMMENT '电话',
  `id_card_number` varchar(20) NOT NULL COMMENT '身份证',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `create_time` date DEFAULT NULL COMMENT '创建日期',
  `update_time` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'daihailong', '哈哈哈', '1994930216@qq.com', '123456', '1', '22', '', '', '', null, null);
INSERT INTO `user` VALUES ('2', '1123', '呵呵呵', '930216', '123', '0', null, '', '', '', null, null);
INSERT INTO `user` VALUES ('3', '2', '2', '2', '2', '2', '2', '2', '2', '2', '0000-00-00', '0000-00-00');
