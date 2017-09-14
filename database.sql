/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : arufucreations

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-09-13 22:29:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for connect_registers
-- ----------------------------
DROP TABLE IF EXISTS `connect_registers`;
CREATE TABLE `connect_registers` (
  `id_connect` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` timestamp NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` float NOT NULL,
  `monto_abonado` float NOT NULL DEFAULT '0',
  `ultimo_abono` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_deuda`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registro_deudas
-- ----------------------------
INSERT INTO `registro_deudas` VALUES ('2', '5', '1', '2016-10-11 16:12:26', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '3198', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('3', '5', '2', '2016-09-20 19:03:53', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '3198', '2016-09-20 19:03:53');
INSERT INTO `registro_deudas` VALUES ('4', '5', '3', '2016-10-02 22:57:07', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '3198', '2016-10-02 22:57:07');
INSERT INTO `registro_deudas` VALUES ('5', '5', '4', '2016-10-04 22:55:52', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '3198', '2016-10-04 22:55:52');
INSERT INTO `registro_deudas` VALUES ('6', '5', '5', '2016-09-20 18:42:26', '2016-09-08 00:00:00', 'gas', 'Agosto', '3198', '3198', '2016-09-20 18:42:26');
INSERT INTO `registro_deudas` VALUES ('7', '5', '1', '2016-10-11 16:12:26', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '4573', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('8', '5', '2', '2016-09-30 20:11:50', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '4573', '2016-09-30 20:11:50');
INSERT INTO `registro_deudas` VALUES ('9', '5', '3', '2016-10-02 22:57:07', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '4573', '2016-10-02 22:57:07');
INSERT INTO `registro_deudas` VALUES ('10', '5', '4', '2016-10-12 19:36:46', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '4573', '2016-10-12 19:36:46');
INSERT INTO `registro_deudas` VALUES ('11', '5', '5', '2016-09-20 18:42:26', '2016-09-09 00:00:00', 'internet', 'Agosto', '4573', '4573', '2016-09-20 18:42:26');
INSERT INTO `registro_deudas` VALUES ('12', '5', '1', '2016-10-11 16:12:26', '2016-09-27 00:00:00', 'agua', 'Septiembre', '185', '185', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('13', '5', '2', '2016-09-30 20:11:50', '2016-09-27 00:00:00', 'agua', 'Septiembre', '185', '185', '2016-09-30 20:11:50');
INSERT INTO `registro_deudas` VALUES ('14', '5', '3', '2016-10-02 22:57:07', '2016-09-27 00:00:00', 'agua', 'Septiembre', '185', '185', '2016-10-02 22:57:07');
INSERT INTO `registro_deudas` VALUES ('15', '5', '4', '2016-10-12 19:36:46', '2016-09-27 00:00:00', 'agua', 'Septiembre', '185', '185', '2016-10-12 19:36:46');
INSERT INTO `registro_deudas` VALUES ('16', '5', '5', '2016-09-20 18:42:26', '2016-09-27 00:00:00', 'agua', 'Septiembre', '185', '185', '2016-09-20 18:42:26');
INSERT INTO `registro_deudas` VALUES ('17', '5', '1', '2016-10-11 16:12:26', '2016-09-16 00:00:00', 'gas', 'Septiembre', '3245', '3245', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('18', '5', '2', '2016-09-30 20:14:39', '2016-09-16 00:00:00', 'gas', 'Septiembre', '3245', '3245', '2016-09-30 20:14:39');
INSERT INTO `registro_deudas` VALUES ('19', '5', '3', '2016-10-02 22:58:21', '2016-09-16 00:00:00', 'gas', 'Septiembre', '3245', '3245', '2016-10-02 22:58:21');
INSERT INTO `registro_deudas` VALUES ('20', '5', '4', '2016-10-12 19:36:46', '2016-09-16 00:00:00', 'gas', 'Septiembre', '3245', '3245', '2016-10-12 19:36:46');
INSERT INTO `registro_deudas` VALUES ('21', '5', '5', '2016-09-30 20:14:53', '2016-09-16 00:00:00', 'gas', 'Septiembre', '3245', '3245', '2016-10-17 20:08:06');
INSERT INTO `registro_deudas` VALUES ('22', '5', '1', '2016-10-11 16:12:26', '2016-10-07 00:00:00', 'luz', 'Septiembre', '3001', '3001', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('23', '5', '2', '2016-10-04 23:24:19', '2016-10-07 00:00:00', 'luz', 'Septiembre', '3001', '3001', '2016-10-14 11:49:56');
INSERT INTO `registro_deudas` VALUES ('24', '5', '3', '2016-10-12 19:39:35', '2016-10-07 00:00:00', 'luz', 'Septiembre', '3001', '3001', '2016-10-12 19:39:35');
INSERT INTO `registro_deudas` VALUES ('25', '5', '4', '2016-10-12 19:36:46', '2016-10-07 00:00:00', 'luz', 'Septiembre', '3001', '3001', '2016-10-12 19:36:46');
INSERT INTO `registro_deudas` VALUES ('26', '5', '5', '2016-09-30 20:13:00', '2016-10-07 00:00:00', 'luz', 'Septiembre', '3001', '3001', '2016-10-17 20:08:06');
INSERT INTO `registro_deudas` VALUES ('27', '5', '1', '2016-10-10 20:49:20', '2016-10-18 00:00:00', 'gas', 'Octubre', '2939', '2939', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('28', '5', '2', '2016-10-10 20:49:20', '2016-10-18 00:00:00', 'gas', 'Octubre', '2939', '2939', '2016-10-14 11:49:56');
INSERT INTO `registro_deudas` VALUES ('29', '5', '3', '2016-10-12 19:39:35', '2016-10-18 00:00:00', 'gas', 'Octubre', '2939', '2939', '2016-10-17 01:09:51');
INSERT INTO `registro_deudas` VALUES ('30', '5', '4', '2016-10-12 19:36:47', '2016-10-18 00:00:00', 'gas', 'Octubre', '2939', '2939', '2016-10-12 19:36:47');
INSERT INTO `registro_deudas` VALUES ('31', '5', '5', '2016-10-10 20:49:20', '2016-10-18 00:00:00', 'gas', 'Octubre', '2939', '2939', '2016-10-17 20:08:06');
INSERT INTO `registro_deudas` VALUES ('32', '5', '1', '2016-10-10 20:50:03', '2016-10-10 00:00:00', 'internet', 'Octubre', '4574', '4574', '2017-04-17 18:11:35');
INSERT INTO `registro_deudas` VALUES ('33', '5', '2', '2016-10-10 20:50:03', '2016-10-10 00:00:00', 'internet', 'Octubre', '4574', '4574', '2016-10-14 11:49:56');
INSERT INTO `registro_deudas` VALUES ('34', '5', '3', '2016-10-10 20:50:03', '2016-10-10 00:00:00', 'internet', 'Octubre', '4574', '4574', '2017-04-17 18:11:44');
INSERT INTO `registro_deudas` VALUES ('35', '5', '4', '2016-10-12 19:36:47', '2016-10-10 00:00:00', 'internet', 'Octubre', '4574', '4574', '2016-10-12 19:36:47');
INSERT INTO `registro_deudas` VALUES ('36', '5', '5', '2016-10-10 20:50:03', '2016-10-10 00:00:00', 'internet', 'Octubre', '4574', '4574', '2016-10-17 20:08:06');
INSERT INTO `registro_deudas` VALUES ('37', '5', '1', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '0', null);
INSERT INTO `registro_deudas` VALUES ('38', '5', '2', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '4665', null);
INSERT INTO `registro_deudas` VALUES ('39', '5', '3', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '4665', '2017-04-23 20:23:58');
INSERT INTO `registro_deudas` VALUES ('40', '5', '1', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '0', null);
INSERT INTO `registro_deudas` VALUES ('41', '5', '2', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '5955', null);
INSERT INTO `registro_deudas` VALUES ('42', '5', '3', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '5955', '2017-04-23 20:23:59');
INSERT INTO `registro_deudas` VALUES ('43', '5', '1', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '0', null);
INSERT INTO `registro_deudas` VALUES ('44', '5', '2', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '3920', null);
INSERT INTO `registro_deudas` VALUES ('45', '5', '3', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '3920', '2017-04-23 20:23:59');
INSERT INTO `registro_deudas` VALUES ('46', '5', '1', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '0', null);
INSERT INTO `registro_deudas` VALUES ('47', '5', '2', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '4578', null);
INSERT INTO `registro_deudas` VALUES ('48', '5', '3', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '4578', '2017-04-26 21:33:36');
INSERT INTO `registro_deudas` VALUES ('49', '5', '1', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '0', null);
INSERT INTO `registro_deudas` VALUES ('50', '5', '2', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '5430', null);
INSERT INTO `registro_deudas` VALUES ('51', '5', '3', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '5430', null);
INSERT INTO `registro_deudas` VALUES ('52', '5', '1', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '0', null);
INSERT INTO `registro_deudas` VALUES ('53', '5', '2', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('54', '5', '3', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('55', '5', '1', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '0', null);
INSERT INTO `registro_deudas` VALUES ('56', '5', '2', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '3475', null);
INSERT INTO `registro_deudas` VALUES ('57', '5', '3', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '3475', null);
INSERT INTO `registro_deudas` VALUES ('58', '5', '1', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '0', null);
INSERT INTO `registro_deudas` VALUES ('59', '5', '2', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '4985', null);
INSERT INTO `registro_deudas` VALUES ('60', '5', '3', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '4985', null);
INSERT INTO `registro_deudas` VALUES ('61', '5', '1', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '0', null);
INSERT INTO `registro_deudas` VALUES ('62', '5', '2', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('63', '5', '3', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('64', '5', '1', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '0', null);
INSERT INTO `registro_deudas` VALUES ('65', '5', '2', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '6348', null);
INSERT INTO `registro_deudas` VALUES ('66', '5', '3', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '6348', null);
INSERT INTO `registro_deudas` VALUES ('67', '5', '1', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '0', null);
INSERT INTO `registro_deudas` VALUES ('68', '5', '2', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '3243', null);
INSERT INTO `registro_deudas` VALUES ('69', '5', '3', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '3243', null);
INSERT INTO `registro_deudas` VALUES ('70', '5', '1', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '0', null);
INSERT INTO `registro_deudas` VALUES ('71', '5', '2', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '4647', null);
INSERT INTO `registro_deudas` VALUES ('72', '5', '3', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '4647', null);
INSERT INTO `registro_deudas` VALUES ('73', '5', '1', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '0', null);
INSERT INTO `registro_deudas` VALUES ('74', '5', '2', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('75', '5', '3', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('76', '5', '1', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '0', null);
INSERT INTO `registro_deudas` VALUES ('77', '5', '2', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '6831', null);
INSERT INTO `registro_deudas` VALUES ('78', '5', '3', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '6831', null);
INSERT INTO `registro_deudas` VALUES ('79', '5', '1', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '0', null);
INSERT INTO `registro_deudas` VALUES ('80', '5', '2', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '3588', null);
INSERT INTO `registro_deudas` VALUES ('81', '5', '3', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '3588', null);
INSERT INTO `registro_deudas` VALUES ('82', '5', '1', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '0', null);
INSERT INTO `registro_deudas` VALUES ('83', '5', '2', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '3778', null);
INSERT INTO `registro_deudas` VALUES ('84', '5', '3', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '3778', null);
INSERT INTO `registro_deudas` VALUES ('85', '5', '1', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '0', null);
INSERT INTO `registro_deudas` VALUES ('86', '5', '2', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('87', '5', '3', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('88', '5', '1', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '0', null);
INSERT INTO `registro_deudas` VALUES ('89', '5', '2', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '3523', null);
INSERT INTO `registro_deudas` VALUES ('90', '5', '3', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '3523', null);
INSERT INTO `registro_deudas` VALUES ('91', '5', '1', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '0', null);
INSERT INTO `registro_deudas` VALUES ('92', '5', '2', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '7908', null);
INSERT INTO `registro_deudas` VALUES ('93', '5', '3', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '7908', null);
INSERT INTO `registro_deudas` VALUES ('94', '5', '1', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '0', null);
INSERT INTO `registro_deudas` VALUES ('95', '5', '2', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '277', null);
INSERT INTO `registro_deudas` VALUES ('96', '5', '3', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '4368', null);
INSERT INTO `registro_deudas` VALUES ('97', '5', '1', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '0', null);
INSERT INTO `registro_deudas` VALUES ('98', '5', '2', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '0', null);
INSERT INTO `registro_deudas` VALUES ('99', '5', '3', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('100', '5', '1', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '0', null);
INSERT INTO `registro_deudas` VALUES ('101', '5', '2', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '0', null);
INSERT INTO `registro_deudas` VALUES ('102', '5', '3', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '3944', null);
INSERT INTO `registro_deudas` VALUES ('103', '5', '1', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '0', null);
INSERT INTO `registro_deudas` VALUES ('104', '5', '2', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '0', null);
INSERT INTO `registro_deudas` VALUES ('105', '5', '3', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '2529', null);
INSERT INTO `registro_deudas` VALUES ('106', '5', '1', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '0', null);
INSERT INTO `registro_deudas` VALUES ('107', '5', '2', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '0', null);
INSERT INTO `registro_deudas` VALUES ('108', '5', '3', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '0', null);

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
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL,
  `ip_forward` varchar(45) NOT NULL,
  PRIMARY KEY (`id_register`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

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
INSERT INTO `user_logs_register` VALUES ('25', '4', '1b6e40c0', '2016-08-31 15:53:00', '::1', '');
INSERT INTO `user_logs_register` VALUES ('26', '5', '15f5d359', '2016-09-12 21:50:47', '::1', '');
INSERT INTO `user_logs_register` VALUES ('27', '5', '15f71596', '2016-09-16 17:30:19', '::1', '');
INSERT INTO `user_logs_register` VALUES ('28', '5', '15f86b3b', '2016-09-20 18:41:03', '::1', '');
INSERT INTO `user_logs_register` VALUES ('29', '5', '15f86c8f', '2016-09-20 19:03:41', '::1', '');
INSERT INTO `user_logs_register` VALUES ('30', '5', '15fa675e', '2016-09-26 19:13:12', '::1', '');
INSERT INTO `user_logs_register` VALUES ('31', '5', '15fbbb36', '2016-09-30 19:53:15', '::1', '');
INSERT INTO `user_logs_register` VALUES ('32', '5', '15fc6eb7', '2016-10-02 22:56:46', '::1', '');
INSERT INTO `user_logs_register` VALUES ('33', '5', '15ff0a34', '2016-10-10 20:48:32', '::1', '');
INSERT INTO `user_logs_register` VALUES ('34', '5', '15ffae7c', '2016-10-12 19:32:17', '::1', '');
INSERT INTO `user_logs_register` VALUES ('35', '4', '1b7f9abf', '2016-10-12 19:41:02', '::1', '');
INSERT INTO `user_logs_register` VALUES ('36', '5', '16003c12', '2016-10-14 11:48:42', '::1', '');
INSERT INTO `user_logs_register` VALUES ('37', '5', '160113ba', '2016-10-17 01:09:15', '::1', '');
INSERT INTO `user_logs_register` VALUES ('38', '4', '1b81b0d6', '2016-10-17 21:13:08', '::1', '');
INSERT INTO `user_logs_register` VALUES ('39', '5', '1601e931', '2016-10-19 13:52:21', '::1', '');
INSERT INTO `user_logs_register` VALUES ('40', '5', '163d4bc4', '2017-04-17 18:09:39', '::1', '');
INSERT INTO `user_logs_register` VALUES ('41', '5', '163e4f12', '2017-04-20 19:55:07', '::1', '');
INSERT INTO `user_logs_register` VALUES ('42', '5', '163f4dbd', '2017-04-23 20:21:27', '::1', '');
INSERT INTO `user_logs_register` VALUES ('43', '5', '16404edd', '2017-04-26 21:29:43', '::1', '');
INSERT INTO `user_logs_register` VALUES ('44', '5', '1640995b', '2017-04-27 18:41:02', '::1', '');
INSERT INTO `user_logs_register` VALUES ('45', '5', '1640a7e9', '2017-04-27 22:49:26', '::1', '');
INSERT INTO `user_logs_register` VALUES ('46', '5', '16431f78', '2017-05-05 10:28:02', '::1', '');
INSERT INTO `user_logs_register` VALUES ('47', '5', '16452d20', '2017-05-11 15:59:12', '::1', '');
INSERT INTO `user_logs_register` VALUES ('48', '5', '164a1ee8', '2017-05-26 15:01:52', '::1', '');
INSERT INTO `user_logs_register` VALUES ('49', '5', '164cd767', '2017-06-03 21:08:47', '::1', '');
INSERT INTO `user_logs_register` VALUES ('50', '5', '1650cf37', '2017-06-15 22:05:19', '::1', '');
INSERT INTO `user_logs_register` VALUES ('51', '5', '1655f0a2', '2017-07-01 11:40:56', '::1', '');
INSERT INTO `user_logs_register` VALUES ('52', '5', '165a442c', '2017-07-14 14:42:58', '::1', '');
INSERT INTO `user_logs_register` VALUES ('53', '5', '165b4807', '2017-07-17 16:37:48', '::1', '');
INSERT INTO `user_logs_register` VALUES ('54', '5', '165d513e', '2017-07-23 20:53:14', '::1', '');
INSERT INTO `user_logs_register` VALUES ('55', '5', '165ef61f', '2017-07-28 20:36:14', '::1', '');
INSERT INTO `user_logs_register` VALUES ('56', '5', '16623de9', '2017-08-07 19:28:38', '::1', '');
INSERT INTO `user_logs_register` VALUES ('57', '5', '16688420', '2017-08-26 21:21:20', '::1', '');
INSERT INTO `user_logs_register` VALUES ('58', '5', '166e75f3', '2017-09-13 22:13:50', '::1', '');

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
