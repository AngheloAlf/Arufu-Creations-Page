/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : arufucreations

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-08-18 21:40:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for connect_registers
-- ----------------------------
DROP TABLE IF EXISTS `connect_registers`;
CREATE TABLE `connect_registers` (
  `id_connect` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL,
  `ip_forward` varchar(45) NOT NULL,
  PRIMARY KEY (`id_connect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of connect_registers
-- ----------------------------

-- ----------------------------
-- Table structure for user_config
-- ----------------------------
DROP TABLE IF EXISTS `user_config`;
CREATE TABLE `user_config` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nav` varchar(15) NOT NULL DEFAULT 'topnav',
  `js` tinyint(1) unsigned NOT NULL,
  `verWip` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_config
-- ----------------------------
INSERT INTO `user_config` VALUES ('4', 'sidenav', '1', '1');

-- ----------------------------
-- Table structure for user_logs_register
-- ----------------------------
DROP TABLE IF EXISTS `user_logs_register`;
CREATE TABLE `user_logs_register` (
  `id_register` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL,
  `ip_forward` varchar(45) NOT NULL,
  PRIMARY KEY (`id_register`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_logs_register
-- ----------------------------
INSERT INTO `user_logs_register` VALUES ('1', '4', 'd7e538', '2016-08-17 22:35:24', '', '');
INSERT INTO `user_logs_register` VALUES ('2', '4', 'd7e538', '2016-08-17 22:35:57', '::1', '');
INSERT INTO `user_logs_register` VALUES ('3', '4', '15ed485a', '2016-08-17 22:46:03', '::1', '');
INSERT INTO `user_logs_register` VALUES ('4', '4', '15ed485e', '2016-08-17 22:46:18', '::1', '');
INSERT INTO `user_logs_register` VALUES ('5', '4', '1b68c956', '2016-08-18 09:26:19', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('6', '4', '1b68ca50', '2016-08-18 09:39:39', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('7', '4', '0', '2016-08-18 09:58:51', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('8', '4', '1b68cbeb', '2016-08-18 10:01:35', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('9', '4', '1b68cc18', '2016-08-18 10:03:57', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('10', '4', '1b68cc4e', '2016-08-18 10:06:51', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('11', '4', '1b68cce1', '2016-08-18 10:14:42', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('12', '4', '1b68d3eb', '2016-08-18 11:50:49', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('13', '4', '1b68d445', '2016-08-18 11:55:36', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('14', '4', '1b68d44c', '2016-08-18 11:55:58', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('15', '4', '1b68d459', '2016-08-18 11:56:41', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('16', '4', '1b68d4a8', '2016-08-18 12:00:52', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('17', '4', '1b68e8a4', '2016-08-18 16:33:44', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('18', '4', '1b68fa9a', '2016-08-18 20:38:56', '::1', '');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `mail` varchar(63) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` tinyint(2) unsigned NOT NULL,
  `nombre` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('4', 'Arufu', 'Anghelo95', 'angheloalf95@gmail.com', '2016-08-18 13:16:55', '1', null, null);
