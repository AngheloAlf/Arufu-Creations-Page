/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : arufucreations

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-08-11 10:54:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_config
-- ----------------------------
DROP TABLE IF EXISTS `user_config`;
CREATE TABLE `user_config` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nav` varchar(15) DEFAULT 'topnav',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_config
-- ----------------------------
INSERT INTO `user_config` VALUES ('4', 'sidenav');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `mail` varchar(63) COLLATE latin1_general_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `nombre` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('4', 'Arufu', 'Anghelo95', 'angheloalf95@gmail.com', '1', null, null);
