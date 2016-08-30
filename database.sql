/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : arufucreations

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-08-30 15:05:15
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
-- Table structure for lista_deudores
-- ----------------------------
DROP TABLE IF EXISTS `lista_deudores`;
CREATE TABLE `lista_deudores` (
  `id_deudor` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_deudor` varchar(255) NOT NULL,
  `rut` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_deudor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lista_deudores
-- ----------------------------
INSERT INTO `lista_deudores` VALUES ('1', 'Carlita', '19222444-6');
INSERT INTO `lista_deudores` VALUES ('2', 'Edu', null);
INSERT INTO `lista_deudores` VALUES ('3', 'Pau', null);
INSERT INTO `lista_deudores` VALUES ('4', 'Marina', null);
INSERT INTO `lista_deudores` VALUES ('5', 'Gabby', null);

-- ----------------------------
-- Table structure for registro_deudas
-- ----------------------------
DROP TABLE IF EXISTS `registro_deudas`;
CREATE TABLE `registro_deudas` (
  `id_deuda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_deudor` int(10) unsigned NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_vencimiento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `motivo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` float NOT NULL,
  `monto_abonado` float NOT NULL DEFAULT '0',
  `ultimo_abono` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_deuda`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registro_deudas
-- ----------------------------
INSERT INTO `registro_deudas` VALUES ('1', '5', '1', '2016-08-30 01:13:02', '2016-09-20 00:00:00', 'natura', '', '55877', '0', '2016-08-30 01:13:02');
INSERT INTO `registro_deudas` VALUES ('2', '5', '1', '2016-08-30 00:12:18', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '0', null);
INSERT INTO `registro_deudas` VALUES ('3', '5', '2', '2016-08-30 00:12:18', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '0', null);
INSERT INTO `registro_deudas` VALUES ('4', '5', '3', '2016-08-30 00:12:18', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '0', null);
INSERT INTO `registro_deudas` VALUES ('5', '5', '4', '2016-08-30 00:12:18', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '0', null);
INSERT INTO `registro_deudas` VALUES ('6', '5', '5', '2016-08-30 00:12:18', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '0', null);
INSERT INTO `registro_deudas` VALUES ('7', '5', '1', '2016-08-30 00:14:16', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '0', null);
INSERT INTO `registro_deudas` VALUES ('8', '5', '2', '2016-08-30 00:14:16', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '0', null);
INSERT INTO `registro_deudas` VALUES ('9', '5', '3', '2016-08-30 00:14:16', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '0', null);
INSERT INTO `registro_deudas` VALUES ('10', '5', '4', '2016-08-30 00:14:16', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '0', null);
INSERT INTO `registro_deudas` VALUES ('11', '5', '5', '2016-08-30 00:14:16', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '0', null);

-- ----------------------------
-- Table structure for user_config
-- ----------------------------
DROP TABLE IF EXISTS `user_config`;
CREATE TABLE `user_config` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nav` varchar(15) NOT NULL DEFAULT 'topnav',
  `js` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `verWip` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_config
-- ----------------------------
INSERT INTO `user_config` VALUES ('4', 'sidenav', '1', '1');
INSERT INTO `user_config` VALUES ('5', 'topnav', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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
INSERT INTO `user_logs_register` VALUES ('19', '4', '1b695865', '2016-08-19 17:59:34', '::1', '');
INSERT INTO `user_logs_register` VALUES ('20', '4', '1b6958e9', '2016-08-19 18:06:34', '::1', '');
INSERT INTO `user_logs_register` VALUES ('21', '5', '15ede15b', '2016-08-19 18:17:18', '::1', '');
INSERT INTO `user_logs_register` VALUES ('22', '5', '15f13296', '2016-08-29 19:50:48', '::1', '');
INSERT INTO `user_logs_register` VALUES ('23', '5', '15f1383e', '2016-08-29 21:27:21', '::1', '');
INSERT INTO `user_logs_register` VALUES ('24', '5', '15f13848', '2016-08-29 21:28:01', '::1', '');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(31) COLLATE latin1_general_ci NOT NULL,
  `mail` varchar(63) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` tinyint(2) unsigned NOT NULL,
  `nombre` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('4', 'Arufu', 'Anghelo95', 'angheloalf95@gmail.com', '2016-08-18 13:16:55', '1', null, null);
INSERT INTO `usuarios` VALUES ('5', '19125145-8', 'Anghelo95Bobby@', 'anghelo.carvajal.14@sansano.usm.cl', '2016-08-19 19:03:35', '3', 'Anghelo', 'Carvajal');
