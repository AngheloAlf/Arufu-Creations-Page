/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : arufucreations

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-09-28 14:45:19
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
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_deudor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lista_deudores
-- ----------------------------
INSERT INTO `lista_deudores` VALUES ('1', 'Carlita', '19222444-6', '1');
INSERT INTO `lista_deudores` VALUES ('2', 'Edu', null, '1');
INSERT INTO `lista_deudores` VALUES ('3', 'Pau', null, '1');
INSERT INTO `lista_deudores` VALUES ('4', 'Marina', null, '0');
INSERT INTO `lista_deudores` VALUES ('5', 'Gabby', null, '0');
INSERT INTO `lista_deudores` VALUES ('6', 'Nico', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

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
INSERT INTO `registro_deudas` VALUES ('37', '5', '1', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '4665', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('38', '5', '2', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '4665', null);
INSERT INTO `registro_deudas` VALUES ('39', '5', '3', '2017-04-17 18:13:16', '2017-04-27 00:00:00', 'agua', 'Marzo', '4665', '4665', '2017-04-23 20:23:58');
INSERT INTO `registro_deudas` VALUES ('40', '5', '1', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '5955', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('41', '5', '2', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '5955', null);
INSERT INTO `registro_deudas` VALUES ('42', '5', '3', '2017-04-17 18:20:28', '2017-04-17 00:00:00', 'internet', 'Marzo', '5955', '5955', '2017-04-23 20:23:59');
INSERT INTO `registro_deudas` VALUES ('43', '5', '1', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '3920', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('44', '5', '2', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '3920', null);
INSERT INTO `registro_deudas` VALUES ('45', '5', '3', '2017-04-17 18:21:10', '2017-04-17 00:00:00', 'gas', 'Marzo', '3920', '3920', '2017-04-23 20:23:59');
INSERT INTO `registro_deudas` VALUES ('46', '5', '1', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '4578', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('47', '5', '2', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '4578', null);
INSERT INTO `registro_deudas` VALUES ('48', '5', '3', '2017-04-17 18:21:52', '2017-04-05 00:00:00', 'luz', 'Marzo', '4578', '4578', '2017-04-26 21:33:36');
INSERT INTO `registro_deudas` VALUES ('49', '5', '1', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '5430', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('50', '5', '2', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '5430', null);
INSERT INTO `registro_deudas` VALUES ('51', '5', '3', '2017-04-26 21:32:10', '2017-05-05 00:00:00', 'luz', 'Abril', '5430', '5430', null);
INSERT INTO `registro_deudas` VALUES ('52', '5', '1', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '6498', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('53', '5', '2', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('54', '5', '3', '2017-04-26 21:32:33', '2017-04-26 00:00:00', 'internet', 'Abril', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('55', '5', '1', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '3475', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('56', '5', '2', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '3475', null);
INSERT INTO `registro_deudas` VALUES ('57', '5', '3', '2017-05-05 10:28:59', '2017-05-18 00:00:00', 'gas', 'Abril', '3475', '3475', null);
INSERT INTO `registro_deudas` VALUES ('58', '5', '1', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '4985', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('59', '5', '2', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '4985', null);
INSERT INTO `registro_deudas` VALUES ('60', '5', '3', '2017-05-11 15:59:57', '2017-05-26 00:00:00', 'agua', 'Abril', '4985', '4985', null);
INSERT INTO `registro_deudas` VALUES ('61', '5', '1', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '6498', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('62', '5', '2', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('63', '5', '3', '2017-05-26 15:09:30', '2017-05-26 00:00:00', 'internet', 'Mayo', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('64', '5', '1', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '6348', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('65', '5', '2', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '6348', null);
INSERT INTO `registro_deudas` VALUES ('66', '5', '3', '2017-05-26 15:10:17', '2017-06-06 00:00:00', 'luz', 'Mayo', '6348', '6348', null);
INSERT INTO `registro_deudas` VALUES ('67', '5', '1', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '3243', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('68', '5', '2', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '3243', null);
INSERT INTO `registro_deudas` VALUES ('69', '5', '3', '2017-06-03 21:09:29', '2017-06-16 00:00:00', 'gas', 'Mayo', '3243', '3243', null);
INSERT INTO `registro_deudas` VALUES ('70', '5', '1', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '4647', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('71', '5', '2', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '4647', null);
INSERT INTO `registro_deudas` VALUES ('72', '5', '3', '2017-07-01 11:42:03', '2017-06-27 00:00:00', 'agua', 'Junio', '4647', '4647', null);
INSERT INTO `registro_deudas` VALUES ('73', '5', '1', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '6498', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('74', '5', '2', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('75', '5', '3', '2017-07-01 11:42:34', '2017-07-01 00:00:00', 'internet', 'Junio', '6498', '6498', null);
INSERT INTO `registro_deudas` VALUES ('76', '5', '1', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '6831', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('77', '5', '2', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '6831', null);
INSERT INTO `registro_deudas` VALUES ('78', '5', '3', '2017-07-01 11:43:19', '2017-07-06 00:00:00', 'luz', 'Junio', '6831', '6831', null);
INSERT INTO `registro_deudas` VALUES ('79', '5', '1', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '3588', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('80', '5', '2', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '3588', null);
INSERT INTO `registro_deudas` VALUES ('81', '5', '3', '2017-07-14 14:44:29', '2017-07-15 00:00:00', 'gas', 'Junio', '3588', '3588', null);
INSERT INTO `registro_deudas` VALUES ('82', '5', '1', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '3778', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('83', '5', '2', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '3778', null);
INSERT INTO `registro_deudas` VALUES ('84', '5', '3', '2017-07-14 15:10:05', '2017-07-26 00:00:00', 'agua', 'Julio', '3778', '3778', null);
INSERT INTO `registro_deudas` VALUES ('85', '5', '1', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '6580', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('86', '5', '2', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('87', '5', '3', '2017-08-07 19:32:31', '2017-08-07 00:00:00', 'internet', 'Julio', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('88', '5', '1', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '3523', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('89', '5', '2', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '3523', null);
INSERT INTO `registro_deudas` VALUES ('90', '5', '3', '2017-08-07 19:33:17', '2017-08-16 00:00:00', 'gas', 'Julio', '3523', '3523', null);
INSERT INTO `registro_deudas` VALUES ('91', '5', '1', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '7908', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('92', '5', '2', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '7908', null);
INSERT INTO `registro_deudas` VALUES ('93', '5', '3', '2017-08-07 19:40:13', '2017-08-04 00:00:00', 'luz', 'Julio', '7908', '7908', null);
INSERT INTO `registro_deudas` VALUES ('94', '5', '1', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '4368', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('95', '5', '2', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '4368', '2017-10-06 13:58:32');
INSERT INTO `registro_deudas` VALUES ('96', '5', '3', '2017-08-26 21:22:56', '2017-09-07 00:00:00', 'luz', 'Agosto', '4368', '4368', null);
INSERT INTO `registro_deudas` VALUES ('97', '5', '1', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '6580', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('98', '5', '2', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '6580', '2017-10-06 13:58:32');
INSERT INTO `registro_deudas` VALUES ('99', '5', '3', '2017-08-26 21:23:34', '2017-08-26 00:00:00', 'internet', 'Agosto', '6580', '6580', null);
INSERT INTO `registro_deudas` VALUES ('100', '5', '1', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '3944', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('101', '5', '2', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '3944', '2017-10-06 13:58:32');
INSERT INTO `registro_deudas` VALUES ('102', '5', '3', '2017-08-26 21:24:04', '2017-08-24 00:00:00', 'agua', 'Agosto', '3944', '3944', null);
INSERT INTO `registro_deudas` VALUES ('103', '5', '1', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '4003', '2018-03-26 10:14:28');
INSERT INTO `registro_deudas` VALUES ('104', '5', '2', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '4003', '2017-10-06 13:58:32');
INSERT INTO `registro_deudas` VALUES ('105', '5', '3', '2017-09-13 22:18:10', '2017-09-15 00:00:00', 'gas', 'Agosto', '4003', '4003', '2017-09-13 22:44:17');
INSERT INTO `registro_deudas` VALUES ('106', '5', '1', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '4689', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('107', '5', '2', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '4689', '2017-10-06 13:58:32');
INSERT INTO `registro_deudas` VALUES ('108', '5', '3', '2017-09-13 22:19:52', '2017-09-27 00:00:00', 'agua', 'Septiembre', '4689', '4689', '2017-09-13 22:44:17');
INSERT INTO `registro_deudas` VALUES ('109', '5', '1', '2017-10-06 12:14:56', '2017-10-06 00:00:00', 'internet', 'Septiembre', '6580', '6580', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('110', '5', '2', '2017-10-06 12:14:56', '2017-10-06 00:00:00', 'internet', 'Septiembre', '6580', '6580', '2017-10-25 14:07:00');
INSERT INTO `registro_deudas` VALUES ('111', '5', '3', '2017-10-06 12:14:56', '2017-10-06 00:00:00', 'internet', 'Septiembre', '6580', '6580', '2017-10-06 14:01:01');
INSERT INTO `registro_deudas` VALUES ('112', '5', '1', '2017-10-06 12:15:32', '2017-10-18 00:00:00', 'gas', 'Septiembre', '4465', '4465', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('113', '5', '2', '2017-10-06 12:15:32', '2017-10-18 00:00:00', 'gas', 'Septiembre', '4465', '4465', '2017-10-25 14:07:00');
INSERT INTO `registro_deudas` VALUES ('114', '5', '3', '2017-10-06 12:15:32', '2017-10-18 00:00:00', 'gas', 'Septiembre', '4465', '4465', '2017-10-06 14:01:01');
INSERT INTO `registro_deudas` VALUES ('115', '5', '1', '2017-10-06 12:16:38', '2017-10-10 00:00:00', 'luz', 'Septiembre', '6476', '6476', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('116', '5', '2', '2017-10-06 12:16:38', '2017-10-10 00:00:00', 'luz', 'Septiembre', '6476', '6476', '2017-10-25 14:07:00');
INSERT INTO `registro_deudas` VALUES ('117', '5', '3', '2017-10-06 12:16:38', '2017-10-10 00:00:00', 'luz', 'Septiembre', '6476', '6476', '2017-10-24 10:38:47');
INSERT INTO `registro_deudas` VALUES ('118', '5', '1', '2017-10-24 10:38:31', '2017-10-25 00:00:00', 'agua', 'Octubre', '5809', '5809', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('119', '5', '2', '2017-10-24 10:38:31', '2017-10-25 00:00:00', 'agua', 'Octubre', '5809', '5809', '2017-10-25 14:07:00');
INSERT INTO `registro_deudas` VALUES ('120', '5', '3', '2017-10-24 10:38:31', '2017-10-25 00:00:00', 'agua', 'Octubre', '5809', '5809', '2017-10-25 10:38:13');
INSERT INTO `registro_deudas` VALUES ('121', '5', '1', '2017-10-25 10:39:42', '2017-11-07 00:00:00', 'luz', 'Octubre', '4232', '4232', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('122', '5', '2', '2017-10-25 10:39:42', '2017-11-07 00:00:00', 'luz', 'Octubre', '4232', '4232', '2017-11-28 10:25:28');
INSERT INTO `registro_deudas` VALUES ('123', '5', '3', '2017-10-25 10:39:42', '2017-11-07 00:00:00', 'luz', 'Octubre', '4232', '4232', '2017-11-28 10:26:29');
INSERT INTO `registro_deudas` VALUES ('124', '5', '1', '2017-11-03 17:56:58', '2017-10-29 00:00:00', 'internet', 'Octubre', '6580', '6580', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('125', '5', '2', '2017-11-03 17:56:58', '2017-10-29 00:00:00', 'internet', 'Octubre', '6580', '6580', '2017-11-28 10:25:28');
INSERT INTO `registro_deudas` VALUES ('126', '5', '3', '2017-11-03 17:56:58', '2017-10-29 00:00:00', 'internet', 'Octubre', '6580', '6580', '2017-11-28 10:26:29');
INSERT INTO `registro_deudas` VALUES ('127', '5', '1', '2017-11-03 22:10:39', '2017-11-20 00:00:00', 'gas', 'Octubre', '4675', '4675', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('128', '5', '2', '2017-11-03 22:10:39', '2017-11-20 00:00:00', 'gas', 'Octubre', '4675', '4675', '2017-11-28 10:25:28');
INSERT INTO `registro_deudas` VALUES ('129', '5', '3', '2017-11-03 22:10:39', '2017-11-20 00:00:00', 'gas', 'Octubre', '4675', '4675', '2017-12-01 21:38:22');
INSERT INTO `registro_deudas` VALUES ('130', '5', '1', '2017-11-15 19:27:35', '2017-11-27 00:00:00', 'agua', 'Octubre', '4505', '4505', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('131', '5', '2', '2017-11-15 19:27:35', '2017-11-27 00:00:00', 'agua', 'Octubre', '4505', '4505', '2018-03-26 10:14:43');
INSERT INTO `registro_deudas` VALUES ('132', '5', '3', '2017-11-15 19:27:35', '2017-11-27 00:00:00', 'agua', 'Octubre', '4505', '4505', '2017-12-01 21:38:22');
INSERT INTO `registro_deudas` VALUES ('133', '5', '1', '2017-11-27 13:28:01', '2017-11-27 00:00:00', 'internet', 'Noviembre', '6580', '6580', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('134', '5', '2', '2017-11-27 13:28:01', '2017-11-27 00:00:00', 'internet', 'Noviembre', '6580', '6580', '2018-03-26 10:14:43');
INSERT INTO `registro_deudas` VALUES ('135', '5', '3', '2017-11-27 13:28:01', '2017-11-27 00:00:00', 'internet', 'Noviembre', '6580', '6580', '2017-12-01 21:38:22');
INSERT INTO `registro_deudas` VALUES ('136', '5', '1', '2017-12-01 21:01:16', '2017-12-18 00:00:00', 'gas', 'Noviembre', '3940', '3940', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('137', '5', '2', '2017-12-01 21:01:16', '2017-12-18 00:00:00', 'gas', 'Noviembre', '3940', '3940', '2018-03-26 10:14:43');
INSERT INTO `registro_deudas` VALUES ('138', '5', '3', '2017-12-01 21:01:16', '2017-12-18 00:00:00', 'gas', 'Noviembre', '3940', '3940', '2017-12-01 21:38:22');
INSERT INTO `registro_deudas` VALUES ('139', '5', '1', '2017-12-01 21:01:52', '2017-12-07 00:00:00', 'luz', 'Noviembre', '5956', '5956', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('140', '5', '2', '2017-12-01 21:01:52', '2017-12-07 00:00:00', 'luz', 'Noviembre', '5956', '5956', '2018-03-26 10:14:43');
INSERT INTO `registro_deudas` VALUES ('141', '5', '3', '2017-12-01 21:01:52', '2017-12-07 00:00:00', 'luz', 'Noviembre', '5956', '5956', '2017-12-20 10:03:37');
INSERT INTO `registro_deudas` VALUES ('142', '5', '1', '2017-12-20 10:03:26', '2017-12-26 00:00:00', 'agua', 'Diciembre', '5838', '5838', '2018-03-26 10:14:29');
INSERT INTO `registro_deudas` VALUES ('143', '5', '2', '2017-12-20 10:03:26', '2017-12-26 00:00:00', 'agua', 'Diciembre', '5838', '5838', '2018-03-26 10:14:44');
INSERT INTO `registro_deudas` VALUES ('144', '5', '3', '2017-12-20 10:03:26', '2017-12-26 00:00:00', 'agua', 'Diciembre', '5838', '5838', '2018-03-26 10:14:57');
INSERT INTO `registro_deudas` VALUES ('145', '5', '1', '2018-03-26 10:20:52', '2018-03-26 00:00:00', 'internet', 'Marzo', '6620', '6620', '2018-04-14 10:53:52');
INSERT INTO `registro_deudas` VALUES ('146', '5', '2', '2018-03-26 10:20:52', '2018-03-26 00:00:00', 'internet', 'Marzo', '6620', '6620', '2018-04-14 10:53:30');
INSERT INTO `registro_deudas` VALUES ('147', '5', '3', '2018-03-26 10:20:52', '2018-03-26 00:00:00', 'internet', 'Marzo', '6620', '6620', '2018-03-26 11:02:45');
INSERT INTO `registro_deudas` VALUES ('148', '5', '1', '2018-03-26 10:21:26', '2018-04-06 00:00:00', 'luz', 'Marzo', '5133', '5133', '2018-04-14 10:53:52');
INSERT INTO `registro_deudas` VALUES ('149', '5', '2', '2018-03-26 10:21:26', '2018-04-06 00:00:00', 'luz', 'Marzo', '5133', '5133', '2018-04-14 10:53:30');
INSERT INTO `registro_deudas` VALUES ('150', '5', '3', '2018-03-26 10:21:26', '2018-04-06 00:00:00', 'luz', 'Marzo', '5133', '5133', '2018-04-22 20:36:38');
INSERT INTO `registro_deudas` VALUES ('151', '5', '1', '2018-04-14 10:54:47', '2018-04-17 00:00:00', 'gas', 'Marzo', '3625', '3625', '2018-05-05 13:18:50');
INSERT INTO `registro_deudas` VALUES ('152', '5', '2', '2018-04-14 10:54:47', '2018-04-17 00:00:00', 'gas', 'Marzo', '3625', '3625', '2018-04-22 17:56:28');
INSERT INTO `registro_deudas` VALUES ('153', '5', '3', '2018-04-14 10:54:47', '2018-04-17 00:00:00', 'gas', 'Marzo', '3625', '3625', '2018-04-22 20:36:38');
INSERT INTO `registro_deudas` VALUES ('154', '5', '1', '2018-04-14 10:55:18', '2018-04-25 00:00:00', 'agua', 'Marzo', '5423', '5423', '2018-05-05 13:18:50');
INSERT INTO `registro_deudas` VALUES ('155', '5', '2', '2018-04-14 10:55:18', '2018-04-25 00:00:00', 'agua', 'Marzo', '5423', '5423', '2018-04-22 17:56:29');
INSERT INTO `registro_deudas` VALUES ('156', '5', '3', '2018-04-14 10:55:18', '2018-04-25 00:00:00', 'agua', 'Marzo', '5423', '5423', '2018-05-05 13:04:47');
INSERT INTO `registro_deudas` VALUES ('157', '5', '1', '2018-04-22 12:18:34', '2018-05-11 00:00:00', 'luz', 'Abril', '6878', '6878', '2018-05-05 13:18:50');
INSERT INTO `registro_deudas` VALUES ('158', '5', '2', '2018-04-22 12:18:34', '2018-05-11 00:00:00', 'luz', 'Abril', '6878', '6878', '2018-04-22 17:56:29');
INSERT INTO `registro_deudas` VALUES ('159', '5', '3', '2018-04-22 12:18:34', '2018-05-11 00:00:00', 'luz', 'Abril', '6878', '6878', '2018-05-05 13:04:47');
INSERT INTO `registro_deudas` VALUES ('160', '5', '1', '2018-05-05 13:18:11', '2018-05-05 00:00:00', 'internet', 'Abril', '6620', '6620', '2018-05-05 13:18:50');
INSERT INTO `registro_deudas` VALUES ('161', '5', '2', '2018-05-05 13:18:11', '2018-05-05 00:00:00', 'internet', 'Abril', '6620', '6620', '2018-06-05 17:54:12');
INSERT INTO `registro_deudas` VALUES ('162', '5', '3', '2018-05-05 13:18:11', '2018-05-05 00:00:00', 'internet', 'Abril', '6620', '6620', '2018-06-05 17:39:41');
INSERT INTO `registro_deudas` VALUES ('163', '5', '1', '2018-05-05 13:18:32', '2018-05-17 00:00:00', 'gas', 'Abril', '4883', '2454', '2018-05-05 13:18:50');
INSERT INTO `registro_deudas` VALUES ('164', '5', '2', '2018-05-05 13:18:32', '2018-05-17 00:00:00', 'gas', 'Abril', '4883', '4883', '2018-06-05 17:54:12');
INSERT INTO `registro_deudas` VALUES ('165', '5', '3', '2018-05-05 13:18:32', '2018-05-17 00:00:00', 'gas', 'Abril', '4883', '4883', '2018-06-05 17:44:47');
INSERT INTO `registro_deudas` VALUES ('166', '5', '1', '2018-05-17 18:13:38', '2018-05-28 00:00:00', 'agua', 'Mayo', '5770', '0', null);
INSERT INTO `registro_deudas` VALUES ('167', '5', '2', '2018-05-17 18:13:38', '2018-05-28 00:00:00', 'agua', 'Mayo', '5770', '5770', '2018-06-05 17:54:12');
INSERT INTO `registro_deudas` VALUES ('168', '5', '3', '2018-05-17 18:13:38', '2018-05-28 00:00:00', 'agua', 'Mayo', '5770', '5770', '2018-06-05 17:44:47');
INSERT INTO `registro_deudas` VALUES ('169', '5', '1', '2018-06-05 17:37:47', '2018-06-05 00:00:00', 'internet', 'Mayo', '6620', '0', null);
INSERT INTO `registro_deudas` VALUES ('170', '5', '2', '2018-06-05 17:37:47', '2018-06-05 00:00:00', 'internet', 'Mayo', '6620', '6620', '2018-06-26 09:40:33');
INSERT INTO `registro_deudas` VALUES ('171', '5', '3', '2018-06-05 17:37:47', '2018-06-05 00:00:00', 'internet', 'Mayo', '6620', '6620', '2018-06-05 17:44:47');
INSERT INTO `registro_deudas` VALUES ('172', '5', '1', '2018-06-05 17:38:42', '2018-06-18 00:00:00', 'gas', 'Mayo', '5655', '0', null);
INSERT INTO `registro_deudas` VALUES ('173', '5', '2', '2018-06-05 17:38:42', '2018-06-18 00:00:00', 'gas', 'Mayo', '5655', '5655', '2018-06-26 09:40:33');
INSERT INTO `registro_deudas` VALUES ('174', '5', '3', '2018-06-05 17:38:42', '2018-06-18 00:00:00', 'gas', 'Mayo', '5655', '5655', '2018-06-05 17:44:47');
INSERT INTO `registro_deudas` VALUES ('175', '5', '1', '2018-06-05 17:39:33', '2018-06-14 00:00:00', 'luz', 'Mayo', '6185', '0', null);
INSERT INTO `registro_deudas` VALUES ('176', '5', '2', '2018-06-05 17:39:33', '2018-06-14 00:00:00', 'luz', 'Mayo', '6185', '6185', '2018-06-26 09:40:33');
INSERT INTO `registro_deudas` VALUES ('177', '5', '3', '2018-06-05 17:39:33', '2018-06-14 00:00:00', 'luz', 'Mayo', '6185', '6185', '2018-06-05 17:44:47');
INSERT INTO `registro_deudas` VALUES ('178', '5', '1', '2018-06-20 13:16:48', '2018-06-26 00:00:00', 'agua', 'Junio', '5163', '0', null);
INSERT INTO `registro_deudas` VALUES ('179', '5', '2', '2018-06-20 13:16:48', '2018-06-26 00:00:00', 'agua', 'Junio', '5163', '5163', '2018-06-26 09:40:33');
INSERT INTO `registro_deudas` VALUES ('180', '5', '3', '2018-06-20 13:16:48', '2018-06-26 00:00:00', 'agua', 'Junio', '5163', '5163', '2018-06-26 13:37:45');
INSERT INTO `registro_deudas` VALUES ('181', '5', '1', '2018-06-26 09:37:53', '2018-07-13 00:00:00', 'luz', 'Junio', '7741', '0', null);
INSERT INTO `registro_deudas` VALUES ('182', '5', '2', '2018-06-26 09:37:53', '2018-07-13 00:00:00', 'luz', 'Junio', '7741', '7741', '2018-07-23 18:22:06');
INSERT INTO `registro_deudas` VALUES ('183', '5', '3', '2018-06-26 09:37:53', '2018-07-13 00:00:00', 'luz', 'Junio', '7741', '7741', '2018-07-19 16:37:23');
INSERT INTO `registro_deudas` VALUES ('184', '5', '1', '2018-07-04 12:06:24', '2018-07-04 00:00:00', 'internet', 'Junio', '6620', '0', null);
INSERT INTO `registro_deudas` VALUES ('185', '5', '2', '2018-07-04 12:06:24', '2018-07-04 00:00:00', 'internet', 'Junio', '6620', '6620', '2018-07-23 18:22:06');
INSERT INTO `registro_deudas` VALUES ('186', '5', '3', '2018-07-04 12:06:24', '2018-07-04 00:00:00', 'internet', 'Junio', '6620', '6620', '2018-07-19 16:37:23');
INSERT INTO `registro_deudas` VALUES ('187', '5', '1', '2018-07-04 12:18:18', '2018-07-18 00:00:00', 'gas', 'Junio', '6125', '0', null);
INSERT INTO `registro_deudas` VALUES ('188', '5', '2', '2018-07-04 12:18:18', '2018-07-18 00:00:00', 'gas', 'Junio', '6125', '6125', '2018-07-23 18:22:06');
INSERT INTO `registro_deudas` VALUES ('189', '5', '3', '2018-07-04 12:18:18', '2018-07-18 00:00:00', 'gas', 'Junio', '6125', '6125', '2018-07-23 18:22:24');
INSERT INTO `registro_deudas` VALUES ('190', '5', '1', '2018-07-19 16:35:23', '2018-07-26 00:00:00', 'agua', 'Julio', '4960', '0', null);
INSERT INTO `registro_deudas` VALUES ('191', '5', '2', '2018-07-19 16:35:23', '2018-07-26 00:00:00', 'agua', 'Julio', '4960', '4960', '2018-07-23 18:22:06');
INSERT INTO `registro_deudas` VALUES ('192', '5', '3', '2018-07-19 16:35:23', '2018-07-26 00:00:00', 'agua', 'Julio', '4960', '4960', '2018-07-23 18:22:24');
INSERT INTO `registro_deudas` VALUES ('193', '5', '1', '2018-07-31 14:21:28', '2018-08-07 00:00:00', 'internet', 'Julio', '6719', '0', null);
INSERT INTO `registro_deudas` VALUES ('194', '5', '2', '2018-07-31 14:21:28', '2018-08-07 00:00:00', 'internet', 'Julio', '6719', '6719', '2018-08-24 14:00:31');
INSERT INTO `registro_deudas` VALUES ('195', '5', '3', '2018-07-31 14:21:28', '2018-08-07 00:00:00', 'internet', 'Julio', '6719', '6719', '2018-08-15 11:26:19');
INSERT INTO `registro_deudas` VALUES ('196', '5', '1', '2018-07-31 14:22:03', '2018-08-14 00:00:00', 'luz', 'Julio', '13908', '0', null);
INSERT INTO `registro_deudas` VALUES ('197', '5', '2', '2018-07-31 14:22:03', '2018-08-14 00:00:00', 'luz', 'Julio', '13908', '13908', '2018-09-05 08:39:14');
INSERT INTO `registro_deudas` VALUES ('198', '5', '3', '2018-07-31 14:22:03', '2018-08-14 00:00:00', 'luz', 'Julio', '13908', '13908', '2018-08-15 11:26:19');
INSERT INTO `registro_deudas` VALUES ('199', '5', '1', '2018-08-15 11:04:09', '2018-08-27 00:00:00', 'agua', 'Julio', '6058', '0', null);
INSERT INTO `registro_deudas` VALUES ('200', '5', '2', '2018-08-15 11:04:09', '2018-08-27 00:00:00', 'agua', 'Julio', '6058', '6058', '2018-09-05 08:39:14');
INSERT INTO `registro_deudas` VALUES ('201', '5', '3', '2018-08-15 11:04:09', '2018-08-27 00:00:00', 'agua', 'Julio', '6058', '6058', '2018-09-12 20:17:12');
INSERT INTO `registro_deudas` VALUES ('202', '5', '1', '2018-08-15 11:25:44', '2018-08-17 00:00:00', 'gas', 'Julio', '5470', '0', null);
INSERT INTO `registro_deudas` VALUES ('203', '5', '2', '2018-08-15 11:25:44', '2018-08-17 00:00:00', 'gas', 'Julio', '5470', '5470', '2018-09-05 08:39:14');
INSERT INTO `registro_deudas` VALUES ('204', '5', '3', '2018-08-15 11:25:44', '2018-08-17 00:00:00', 'gas', 'Julio', '5470', '5470', '2018-09-12 20:17:12');
INSERT INTO `registro_deudas` VALUES ('205', '5', '1', '2018-09-05 08:34:24', '2018-09-12 00:00:00', 'luz', 'Agosto', '19235', '0', null);
INSERT INTO `registro_deudas` VALUES ('206', '5', '2', '2018-09-05 08:34:24', '2018-09-12 00:00:00', 'luz', 'Agosto', '19235', '19235', '2018-09-28 14:01:30');
INSERT INTO `registro_deudas` VALUES ('207', '5', '3', '2018-09-05 08:34:24', '2018-09-12 00:00:00', 'luz', 'Agosto', '19235', '19235', '2018-09-12 20:17:12');
INSERT INTO `registro_deudas` VALUES ('208', '5', '1', '2018-09-05 08:35:07', '2018-09-20 00:00:00', 'gas', 'Agosto', '6228', '0', null);
INSERT INTO `registro_deudas` VALUES ('209', '5', '2', '2018-09-05 08:35:07', '2018-09-20 00:00:00', 'gas', 'Agosto', '6228', '6228', '2018-09-28 14:01:30');
INSERT INTO `registro_deudas` VALUES ('210', '5', '3', '2018-09-05 08:35:07', '2018-09-20 00:00:00', 'gas', 'Agosto', '6228', '6228', '2018-09-12 20:17:12');
INSERT INTO `registro_deudas` VALUES ('211', '5', '1', '2018-09-05 08:35:39', '2018-09-05 00:00:00', 'internet', 'Agosto', '6719', '0', null);
INSERT INTO `registro_deudas` VALUES ('212', '5', '2', '2018-09-05 08:35:39', '2018-09-05 00:00:00', 'internet', 'Agosto', '6719', '6719', '2018-09-28 14:01:30');
INSERT INTO `registro_deudas` VALUES ('213', '5', '3', '2018-09-05 08:35:39', '2018-09-05 00:00:00', 'internet', 'Agosto', '6719', '6719', '2018-09-12 20:17:12');
INSERT INTO `registro_deudas` VALUES ('214', '5', '1', '2018-09-28 13:52:30', '2018-09-27 00:00:00', 'agua', 'Agosto', '5585', '0', null);
INSERT INTO `registro_deudas` VALUES ('215', '5', '2', '2018-09-28 13:52:30', '2018-09-27 00:00:00', 'agua', 'Agosto', '5585', '0', null);
INSERT INTO `registro_deudas` VALUES ('216', '5', '3', '2018-09-28 13:52:30', '2018-09-27 00:00:00', 'agua', 'Agosto', '5585', '5585', '2018-09-28 13:56:26');
INSERT INTO `registro_deudas` VALUES ('217', '5', '1', '2018-09-28 13:54:47', '2018-10-12 00:00:00', 'luz', 'Septiembre', '10091', '0', null);
INSERT INTO `registro_deudas` VALUES ('218', '5', '2', '2018-09-28 13:54:47', '2018-10-12 00:00:00', 'luz', 'Septiembre', '10091', '0', null);
INSERT INTO `registro_deudas` VALUES ('219', '5', '3', '2018-09-28 13:54:47', '2018-10-12 00:00:00', 'luz', 'Septiembre', '10091', '0', null);
INSERT INTO `registro_deudas` VALUES ('220', '5', '1', '2018-09-28 13:56:07', '2018-10-05 00:00:00', 'internet', 'Septiembre', '6719', '0', null);
INSERT INTO `registro_deudas` VALUES ('221', '5', '2', '2018-09-28 13:56:07', '2018-10-05 00:00:00', 'internet', 'Septiembre', '6719', '0', null);
INSERT INTO `registro_deudas` VALUES ('222', '5', '3', '2018-09-28 13:56:07', '2018-10-05 00:00:00', 'internet', 'Septiembre', '6719', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

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
INSERT INTO `user_logs_register` VALUES ('59', '5', '1675e76c', '2017-10-06 12:13:53', '::1', '');
INSERT INTO `user_logs_register` VALUES ('60', '5', '167bd07c', '2017-10-24 10:36:48', '::1', '');
INSERT INTO `user_logs_register` VALUES ('61', '5', '167ded46', '2017-10-30 20:26:19', '::1', '');
INSERT INTO `user_logs_register` VALUES ('62', '5', '167f35e8', '2017-11-03 17:54:57', '::1', '');
INSERT INTO `user_logs_register` VALUES ('63', '5', '16832fbe', '2017-11-15 19:26:02', '192.168.0.14', '');
INSERT INTO `user_logs_register` VALUES ('64', '5', '16870f22', '2017-11-27 13:25:47', '192.168.0.9', '');
INSERT INTO `user_logs_register` VALUES ('65', '5', '16870f64', '2017-11-27 13:30:11', '192.168.0.9', '');
INSERT INTO `user_logs_register` VALUES ('66', '5', '168758ed', '2017-11-28 10:25:11', '::1', '');
INSERT INTO `user_logs_register` VALUES ('67', '5', '16887b2b', '2017-12-01 20:58:38', '192.168.0.9', '');
INSERT INTO `user_logs_register` VALUES ('68', '5', '16887d75', '2017-12-01 21:37:43', '192.168.0.8', '');
INSERT INTO `user_logs_register` VALUES ('69', '5', '168bf4f7', '2017-12-12 10:04:29', '::1', '');
INSERT INTO `user_logs_register` VALUES ('70', '5', '168e97cd', '2017-12-20 10:01:40', '::1', '');
INSERT INTO `user_logs_register` VALUES ('71', '5', '16ae3c68', '2018-03-26 10:12:02', '::1', '');
INSERT INTO `user_logs_register` VALUES ('72', '5', '16b481df', '2018-04-14 10:51:57', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('73', '5', '16b729d5', '2018-04-22 12:16:39', '::1', '');
INSERT INTO `user_logs_register` VALUES ('74', '5', '16b73db4', '2018-04-22 17:55:47', '::1', '');
INSERT INTO `user_logs_register` VALUES ('75', '5', '16bb7551', '2018-05-05 13:01:08', '127.0.0.1', '');
INSERT INTO `user_logs_register` VALUES ('76', '5', '16bf7f9b', '2018-05-17 18:13:00', '::1', '');
INSERT INTO `user_logs_register` VALUES ('77', '5', '16c5c05f', '2018-06-05 17:32:47', '::1', '');
INSERT INTO `user_logs_register` VALUES ('78', '5', '16caa29b', '2018-06-20 13:10:05', '::1', '');
INSERT INTO `user_logs_register` VALUES ('79', '5', '16cc903c', '2018-06-26 09:34:40', '::1', '');
INSERT INTO `user_logs_register` VALUES ('80', '5', '16cc9e76', '2018-06-26 13:37:29', '::1', '');
INSERT INTO `user_logs_register` VALUES ('81', '5', '16cf3c16', '2018-07-04 12:05:47', '::1', '');
INSERT INTO `user_logs_register` VALUES ('82', '5', '16d43d10', '2018-07-19 16:27:46', '::1', '');
INSERT INTO `user_logs_register` VALUES ('83', '5', '16d59528', '2018-07-23 18:20:17', '::1', '');
INSERT INTO `user_logs_register` VALUES ('84', '5', '16d829ea', '2018-07-31 14:17:14', '::1', '');
INSERT INTO `user_logs_register` VALUES ('85', '5', '16dd0c91', '2018-08-15 11:01:43', '::1', '');
INSERT INTO `user_logs_register` VALUES ('86', '5', '16e00e64', '2018-08-24 14:00:03', '::1', '');
INSERT INTO `user_logs_register` VALUES ('87', '5', '16e3ef80', '2018-09-05 08:29:04', '::1', '');
INSERT INTO `user_logs_register` VALUES ('88', '5', '16e6671e', '2018-09-12 20:08:42', '::1', '');
INSERT INTO `user_logs_register` VALUES ('89', '5', '16eb96e1', '2018-09-28 13:49:09', '::1', '');

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
