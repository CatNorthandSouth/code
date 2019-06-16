/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : bs

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-06-12 16:14:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_bigboard
-- ----------------------------
DROP TABLE IF EXISTS `bs_bigboard`;
CREATE TABLE `bs_bigboard` (
  `bibo_id` int(11) NOT NULL,
  `bibo_title` varchar(255) NOT NULL,
  `bibo_admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bibo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_bigboard
-- ----------------------------
INSERT INTO `bs_bigboard` VALUES ('1', '大数据', 'ljp');
INSERT INTO `bs_bigboard` VALUES ('2', '云计算', 'ljp');
INSERT INTO `bs_bigboard` VALUES ('3', '人工智能', 'ljp');
INSERT INTO `bs_bigboard` VALUES ('4', '通信技术', 'ljp');
INSERT INTO `bs_bigboard` VALUES ('5', '网络攻防', 'ljp');

-- ----------------------------
-- Table structure for bs_fans
-- ----------------------------
DROP TABLE IF EXISTS `bs_fans`;
CREATE TABLE `bs_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT,
  `my_fans_admin` varchar(255) DEFAULT NULL,
  `my_fans_photo` varchar(255) DEFAULT NULL,
  `my_fans_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_fans
-- ----------------------------
INSERT INTO `bs_fans` VALUES ('5', '123456', 'http://localhost:8080/201902221512120o0g5.jpeg', '1', '5');
INSERT INTO `bs_fans` VALUES ('21', 'yyyyyyy', 'http://localhost:8080/201903201605320k60u.jpeg', '1', '7');
INSERT INTO `bs_fans` VALUES ('22', '12345678', 'http://localhost:8080/201903201605320k60u.jpeg', '1', '2');
INSERT INTO `bs_fans` VALUES ('23', '12345678', 'http://localhost:8080/201903201605320k60u.jpeg', '1', '4');
INSERT INTO `bs_fans` VALUES ('24', 'admin123', 'http://localhost:8080/201903201605320k60u.jpeg', '1', '3');
INSERT INTO `bs_fans` VALUES ('36', '123456', 'http://localhost:8080/201903201605320k60u.jpeg', '5', '1');
INSERT INTO `bs_fans` VALUES ('37', 'admin123', 'http://localhost:8080/201903201605320k60u.jpeg', '3', '1');
INSERT INTO `bs_fans` VALUES ('38', '12345678', 'http://localhost:8080/201903201605320k60u.jpeg', '2', '1');
INSERT INTO `bs_fans` VALUES ('39', 'yyyyyyy', 'http://localhost:8080/201903201605320k60u.jpeg', '7', '1');
INSERT INTO `bs_fans` VALUES ('40', 'hello world', 'http://localhost:8080/201903201605320k60u.jpeg', '4', '20');

-- ----------------------------
-- Table structure for bs_file
-- ----------------------------
DROP TABLE IF EXISTS `bs_file`;
CREATE TABLE `bs_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_create_time` datetime DEFAULT NULL,
  `file_up_admin` varchar(255) DEFAULT NULL,
  `file_up_id` int(11) DEFAULT NULL,
  `file_load_count` int(11) DEFAULT NULL,
  `file_size` double DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `file_des` varchar(1500) DEFAULT NULL,
  `file_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_file
-- ----------------------------
INSERT INTO `bs_file` VALUES ('1', '数据库文件', 'http://localhost:8080/fileUpload/44dcd35c-9318-4342-94d7-9e189668f8c4_.txt', '2019-03-07 22:30:04', 'hello world', '1', '100', '3198', '1', '才能的实力内存空间都能看见妇女卡萨诺飞机看风景看看今年发拿放大镜三分看见', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('2', '嘿嘿嘿嘿', 'http://localhost:8080/fileUpload/efb71847-e63b-46a8-b91d-2e0fec2f3e65_.doc', '2019-03-07 22:32:30', 'hello world', '1', '95', '29696', '1', '这个是日报哈哈哈哈哈哈哈哈哈哈哈', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('5', '嘿嘿嘿嘿嘿嘿嘿哈哈哈哈什么啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/fileUpload/95c4cd12-4fb5-4681-8248-3841f86260cf_.txt', '2019-03-07 22:35:03', 'hello world', '1', '16', '0', '1', '这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('6', '好好好好好好好好好好好好好好啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/fileUpload/1382e090-6be6-473e-a4eb-f99a536985ce_.txt', '2019-03-07 22:35:15', 'hello world', '1', '1630', '0', '1', '这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('7', '珂珂珂珂珂珂珂珂啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/fileUpload/03da010b-ef13-464a-83fd-90279aaa28dd_.doc', '2019-03-07 22:35:51', 'hello world', '1', '15555', '29696', '1', '这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('8', '啦啦啦啦啦啦啦啦啦啦啦啦什么啊这是什么啊', 'http://localhost:8080/fileUpload/cd8c32d4-0918-4bb5-8a38-b98c84a34ed0_.doc', '2019-03-07 22:36:10', 'hello world', '1', '3', '29696', '1', '这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊这是什么啊', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('9', '的珂珂珂珂珂珂珂珂', 'http://localhost:8080/fileUpload/4a755b6c-87a7-413a-915f-ce972401b492_.txt', '2019-03-07 22:38:11', 'hello world', '1', '100', '1231', '1', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('10', '怕怕怕怕怕怕怕怕怕怕怕', 'http://localhost:8080/fileUpload/252ca038-b225-4acf-abd6-2727cb734802_.doc', '2019-03-07 22:38:55', 'hello world', '1', '9000', '40448', '1', '啦啦啦啦啦啦啦啦啦啦啦啦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('11', '飞鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅', 'http://localhost:8080/fileUpload/1f6df51b-bcd2-498c-94e5-4f957b41ba8a_.pdf', '2019-03-08 11:38:35', 'hello world', '1', '6', '106362323', '1', '烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('13', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', 'http://localhost:8080/fileUpload/8dabce44-ec9e-42f0-bfdd-03174d268629_.pdf', '2019-03-08 13:03:44', 'hello world', '1', '0', '106362323', '1', '帆帆帆帆帆帆帆帆帆帆', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('14', '烦烦烦烦烦烦烦烦烦', 'http://localhost:8080/fileUpload/6df91ae4-5104-4772-9736-59323f9ff30f_.pdf', '2019-03-08 13:07:43', 'hello world', '1', '0', '106362323', '1', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('15', '顶顶顶顶顶顶顶顶顶顶', 'http://localhost:8080/fileUpload/f415602e-dc13-4a15-88a8-5a18907906f4_.pdf', '2019-03-08 13:10:28', 'hello world', '1', '0', '106362323', '1', '反反复复烦烦烦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('16', '呃呃呃呃呃', 'http://localhost:8080/fileUpload/0b76efc0-0332-45cf-b5dc-d3c818cb7416_.doc', '2019-03-08 13:16:03', 'hello world', '1', '0', '36352', '1', '顶顶顶顶顶顶顶顶顶顶顶顶', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('17', '哈哈哈顶顶顶顶顶顶顶顶去', 'http://localhost:8080/fileUpload/622a0801-591a-4c88-b215-d783a7ddfae0_.pdf', '2019-03-08 13:17:12', 'hello world', '1', '0', '106362323', '1', '水水水水水水水水水水水水水水', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('18', '的顶顶顶顶顶顶', 'http://localhost:8080/fileUpload/3fd91399-a950-4044-b6da-75d0ed09f03c_.pdf', '2019-03-08 13:22:12', 'hello world', '1', '0', '106362323', '1', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('19', 'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'z\'z', 'http://localhost:8080/fileUpload/9b208f13-ae23-477a-a61a-5a4d979f9494_.doc', '2019-03-08 13:24:41', 'hello world', '1', '0', '40448', '1', '五十五', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('20', '得分', 'http://localhost:8080/fileUpload/c37d9ecf-92fd-461c-95e3-59d6c762464f_.pdf', '2019-03-08 13:27:37', 'hello world', '1', '0', '106362323', '1', '帆帆帆帆帆帆帆帆帆帆分', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('21', 'fesfes', 'http://localhost:8080/fileUpload/09aa6832-1982-4ae1-9b77-d1853ed021cb_.gz', '2019-03-08 13:33:22', 'hello world', '1', '0', '214092195', '1', 'Hadoop', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('22', '啦啦啦啦啦啦啦啦啦啦啦啦', 'http://localhost:8080/fileUpload/128dc3e5-7b84-4c7b-9e89-0bd780f16f38_.doc', '2019-03-08 13:36:28', 'hello world', '1', '0', '40448', '1', '啦啦啦啦啦', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('23', 'hadoop', 'http://localhost:8080/fileUpload/28d839d1-4e07-4e45-91d4-15b286bd91a9_.docx', '2019-04-20 16:17:41', 'hello world', '1', '0', '84440', '1', '实习日志', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('24', '人脸识别1', 'http://localhost:8080/fileUpload/fb68141d-22a9-4679-a140-deb18b62fff3_.txt', '2019-04-20 21:13:06', 'hello world', '1', '0', '465', '2', '15646545456465', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('25', '人脸识别2', 'http://localhost:8080/fileUpload/8378ad07-eb0a-45f0-82c8-66cb757cbcf8_.txt', '2019-04-20 21:14:01', 'hello world', '1', '0', '465', '2', '人脸识别2人脸识别2人脸识别2人脸识别2人脸识别2', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('26', '人脸识别3', 'http://localhost:8080/fileUpload/0987e452-cdb6-4e27-8612-da3c872b2db8_.txt', '2019-04-20 21:14:46', 'hello world', '1', '0', '465', '1', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('27', '人脸识别3', 'http://localhost:8080/fileUpload/515bc8c0-9aad-4871-aef0-9376785c2988_.txt', '2019-04-20 21:15:10', 'hello world', '1', '0', '465', '2', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('28', '人脸识别4', 'http://localhost:8080/fileUpload/33150b3d-26ec-42d9-af33-725674c93a95_.txt', '2019-04-20 21:15:46', 'hello world', '1', '0', '465', '2', '人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('29', '人脸识别5', 'http://localhost:8080/fileUpload/076d26ba-b1db-4e3c-9e39-0f7a18291ae7_.doc', '2019-04-20 21:16:20', 'hello world', '1', '0', '78848', '2', '人脸识别4人脸识别4人脸识别4人脸识别5555555555', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file` VALUES ('30', '人脸识别7', 'http://localhost:8080/fileUpload/85682db4-d4c1-4e2b-b1e8-d4f7f4738f7d_.zip', '2019-04-20 21:19:06', 'hello world', '1', '0', '1281976', '2', '人脸识别7人脸识别7人脸识别7人脸识别7人脸识别7', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file` VALUES ('31', '人脸识别8', 'http://localhost:8080/fileUpload/512024d7-e1d2-4a9c-b2fb-b03b05831801_.zip', '2019-04-20 21:19:55', 'hello world', '1', '0', '1281976', '2', '人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file` VALUES ('32', '云计算文件', 'http://localhost:8080/fileUpload/bfd0054c-ac7d-42c4-b5ba-93d587033a65_.txt', '2019-05-17 16:27:52', 'hello world', '1', '0', '9238', '3', '关于云计算的文件', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file` VALUES ('34', 'HDFS', 'http://localhost:8080/fileUpload/15b7502c-1230-4367-99d7-e41686783f46_.txt', '2019-05-17 20:08:43', '方便大家', '20', '0', '465', '6', 'hdfs的东西', 'http://localhost:8080/txt.png');

-- ----------------------------
-- Table structure for bs_file_history
-- ----------------------------
DROP TABLE IF EXISTS `bs_file_history`;
CREATE TABLE `bs_file_history` (
  `down_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_create_time` datetime DEFAULT NULL,
  `file_up_admin` varchar(255) DEFAULT NULL,
  `file_up_id` int(11) DEFAULT NULL,
  `file_load_count` int(11) DEFAULT NULL,
  `file_size` double DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `file_des` varchar(1500) DEFAULT NULL,
  `file_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`down_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_file_history
-- ----------------------------
INSERT INTO `bs_file_history` VALUES ('1', '32', '人脸识别9', 'http://localhost:8080/fileUpload/2beb3649-6be3-4e62-9ab0-b4d50e0d1cd2_.zip', '2019-04-20 21:21:03', 'hello world', '2', '0', '1281976', '2', '人脸识别9人脸识别9人脸识别9', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file_history` VALUES ('2', '31', '人脸识别8', 'http://localhost:8080/fileUpload/512024d7-e1d2-4a9c-b2fb-b03b05831801_.zip', '2019-04-20 21:19:55', 'hello world', '1', '0', '1281976', '2', '人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file_history` VALUES ('3', '30', '人脸识别7', 'http://localhost:8080/fileUpload/85682db4-d4c1-4e2b-b1e8-d4f7f4738f7d_.zip', '2019-04-20 21:19:06', 'hello world', '1', '0', '1281976', '2', '人脸识别7人脸识别7人脸识别7人脸识别7人脸识别7', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file_history` VALUES ('4', '29', '人脸识别5', 'http://localhost:8080/fileUpload/076d26ba-b1db-4e3c-9e39-0f7a18291ae7_.doc', '2019-04-20 21:16:20', 'hello world', '1', '0', '78848', '2', '人脸识别4人脸识别4人脸识别4人脸识别5555555555', 'http://localhost:8080/doc.png');
INSERT INTO `bs_file_history` VALUES ('5', '28', '人脸识别4', 'http://localhost:8080/fileUpload/33150b3d-26ec-42d9-af33-725674c93a95_.txt', '2019-04-20 21:15:46', 'hello world', '1', '0', '465', '2', '人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('6', '27', '人脸识别3', 'http://localhost:8080/fileUpload/515bc8c0-9aad-4871-aef0-9376785c2988_.txt', '2019-04-20 21:15:10', 'hello world', '1', '0', '465', '2', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('7', '26', '人脸识别3', 'http://localhost:8080/fileUpload/0987e452-cdb6-4e27-8612-da3c872b2db8_.txt', '2019-04-20 21:14:46', 'hello world', '1', '0', '465', '1', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('8', '25', '人脸识别2', 'http://localhost:8080/fileUpload/8378ad07-eb0a-45f0-82c8-66cb757cbcf8_.txt', '2019-04-20 21:14:01', 'hello world', '1', '0', '465', '2', '人脸识别2人脸识别2人脸识别2人脸识别2人脸识别2', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('9', '26', '人脸识别3', 'http://localhost:8080/fileUpload/0987e452-cdb6-4e27-8612-da3c872b2db8_.txt', '2019-04-20 21:14:46', 'hello world', '1', '0', '465', '1', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('10', '27', '人脸识别3', 'http://localhost:8080/fileUpload/515bc8c0-9aad-4871-aef0-9376785c2988_.txt', '2019-04-20 21:15:10', 'hello world', '1', '0', '465', '2', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('11', '28', '人脸识别4', 'http://localhost:8080/fileUpload/33150b3d-26ec-42d9-af33-725674c93a95_.txt', '2019-04-20 21:15:46', 'hello world', '1', '0', '465', '2', '人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4人脸识别4', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('12', '26', '人脸识别3', 'http://localhost:8080/fileUpload/0987e452-cdb6-4e27-8612-da3c872b2db8_.txt', '2019-05-08 16:21:48', 'hello world', '1', '0', '465', '1', '人脸识别3人脸识别3人脸识别3人脸识别3人脸识别3', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('13', '31', '人脸识别8', 'http://localhost:8080/fileUpload/512024d7-e1d2-4a9c-b2fb-b03b05831801_.zip', '2019-05-12 16:48:33', 'hello world', '1', '0', '1281976', '2', '人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8人脸识别8', 'http://localhost:8080/zip.png');
INSERT INTO `bs_file_history` VALUES ('14', '32', '云计算文件', 'http://localhost:8080/fileUpload/bfd0054c-ac7d-42c4-b5ba-93d587033a65_.txt', '2019-05-17 16:27:59', 'hello world', '1', '0', '9238', '3', '关于云计算的文件', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('15', '32', '云计算文件', 'http://localhost:8080/fileUpload/bfd0054c-ac7d-42c4-b5ba-93d587033a65_.txt', '2019-05-17 17:45:45', 'hello world', '1', '0', '9238', '3', '关于云计算的文件', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('16', '32', '云计算文件', 'http://localhost:8080/fileUpload/bfd0054c-ac7d-42c4-b5ba-93d587033a65_.txt', '2019-05-17 20:08:13', 'hello world', '20', '0', '9238', '3', '关于云计算的文件', 'http://localhost:8080/txt.png');
INSERT INTO `bs_file_history` VALUES ('17', '34', 'HDFS', 'http://localhost:8080/fileUpload/15b7502c-1230-4367-99d7-e41686783f46_.txt', '2019-05-18 11:24:06', '方便大家', '1', '0', '465', '6', 'hdfs的东西', 'http://localhost:8080/txt.png');

-- ----------------------------
-- Table structure for bs_file_type
-- ----------------------------
DROP TABLE IF EXISTS `bs_file_type`;
CREATE TABLE `bs_file_type` (
  `type_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_file_type
-- ----------------------------

-- ----------------------------
-- Table structure for bs_filter_word
-- ----------------------------
DROP TABLE IF EXISTS `bs_filter_word`;
CREATE TABLE `bs_filter_word` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_filter_word
-- ----------------------------
INSERT INTO `bs_filter_word` VALUES ('4', 'CNM 她妈的 它妈的  他妈的 你妈  去死   贱人 你好');

-- ----------------------------
-- Table structure for bs_grade
-- ----------------------------
DROP TABLE IF EXISTS `bs_grade`;
CREATE TABLE `bs_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `grade_medal_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_grade
-- ----------------------------

-- ----------------------------
-- Table structure for bs_line
-- ----------------------------
DROP TABLE IF EXISTS `bs_line`;
CREATE TABLE `bs_line` (
  `time` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_line
-- ----------------------------

-- ----------------------------
-- Table structure for bs_lunbo
-- ----------------------------
DROP TABLE IF EXISTS `bs_lunbo`;
CREATE TABLE `bs_lunbo` (
  `lunbo_id` int(11) NOT NULL AUTO_INCREMENT,
  `lunbo_path` varchar(255) DEFAULT NULL,
  `lunbo_state` int(255) DEFAULT '1',
  PRIMARY KEY (`lunbo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_lunbo
-- ----------------------------
INSERT INTO `bs_lunbo` VALUES ('10', 'http://localhost:8080/26034a43-b810-4bf2-9ea6-d441749b77cd_.png', '1');
INSERT INTO `bs_lunbo` VALUES ('11', 'http://localhost:8080/5ef70e70-9766-49fc-a59f-6bf6cbac2c07_.png', '1');
INSERT INTO `bs_lunbo` VALUES ('12', 'http://localhost:8080/457da7cf-51a4-4f50-809c-7e21caba6e60_.png', '1');
INSERT INTO `bs_lunbo` VALUES ('13', 'http://localhost:8080/35899263-92ed-4f07-8b31-eb5a0b9802e3_.png', '1');
INSERT INTO `bs_lunbo` VALUES ('14', 'http://localhost:8080/991e65d3-77b0-48a0-9eba-bc06fc5e059f_.png', '1');
INSERT INTO `bs_lunbo` VALUES ('15', 'http://localhost:8080/98d5db3c-1f6b-4a30-ae9d-e9adfa340638_.png', '0');
INSERT INTO `bs_lunbo` VALUES ('16', 'http://localhost:8080/a282f95a-1670-4222-b248-090ec39afd96_.jpg', '1');

-- ----------------------------
-- Table structure for bs_menu
-- ----------------------------
DROP TABLE IF EXISTS `bs_menu`;
CREATE TABLE `bs_menu` (
  `id` varchar(60) NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `menu_fid` varchar(60) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `menu_state` int(11) DEFAULT '1',
  `icon` varchar(15) DEFAULT 'icon-star',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_menu
-- ----------------------------
INSERT INTO `bs_menu` VALUES ('1', '帖子管理', '0', 'X-admin/question-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('2', '文件管理', '1', 'X-admin/wenjian-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('3', '轮播管理', '1', 'X-admin/banner-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('4', '公告管理', '1', 'X-admin/gonggao-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('5', '版主推荐', '1', 'X-admin/question-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('6', '评论管理', '1', 'X-admin/pl-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('7', '会员管理', '1', 'X-admin/member-list.jsp', '1', 'icon-star');
INSERT INTO `bs_menu` VALUES ('8', '管理员管理', '0', 'X-admin/admin-list.jsp', '1', 'icon-star');

-- ----------------------------
-- Table structure for bs_niuren
-- ----------------------------
DROP TABLE IF EXISTS `bs_niuren`;
CREATE TABLE `bs_niuren` (
  `niuren_id` int(11) NOT NULL AUTO_INCREMENT,
  `niuren_admin` varchar(255) DEFAULT NULL,
  `niuren_photo` varchar(255) DEFAULT NULL,
  `niuren_week_score` int(11) DEFAULT '0',
  `niuren_month_score` int(11) DEFAULT '0',
  `niuren_year_score` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`niuren_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_niuren
-- ----------------------------
INSERT INTO `bs_niuren` VALUES ('1', 'hello world', 'http://localhost:8080/201903201605320k60u.jpeg', '54', '100', '0', '1');
INSERT INTO `bs_niuren` VALUES ('2', '12345678', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '29', '0', '2');
INSERT INTO `bs_niuren` VALUES ('3', 'admin123', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '111', '0', '3');
INSERT INTO `bs_niuren` VALUES ('4', '1234567', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '99', '0', '4');
INSERT INTO `bs_niuren` VALUES ('5', '123456', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '15', '0', '5');
INSERT INTO `bs_niuren` VALUES ('6', 'yyyyyyy', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '150', '0', '7');
INSERT INTO `bs_niuren` VALUES ('7', '888888', 'http://localhost:8080/20190307091923etarn.jpeg', '2', '0', '0', '18');
INSERT INTO `bs_niuren` VALUES ('8', null, 'http://localhost:8080/20190307091923etarn.jpeg', '9', '0', '0', '20');

-- ----------------------------
-- Table structure for bs_niuren_now
-- ----------------------------
DROP TABLE IF EXISTS `bs_niuren_now`;
CREATE TABLE `bs_niuren_now` (
  `niuren_id` int(11) NOT NULL AUTO_INCREMENT,
  `niuren_admin` varchar(255) DEFAULT NULL,
  `niuren_photo` varchar(255) DEFAULT NULL,
  `niuren_week_score` int(11) DEFAULT '0',
  `niuren_month_score` int(11) DEFAULT '0',
  `niuren_year_score` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`niuren_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_niuren_now
-- ----------------------------
INSERT INTO `bs_niuren_now` VALUES ('1', 'hello world', 'http://localhost:8080/201903201605320k60u.jpeg', '4', '120', '0', '1');
INSERT INTO `bs_niuren_now` VALUES ('2', '12345678', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '11', '0', '2');
INSERT INTO `bs_niuren_now` VALUES ('3', 'admin123', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '12', '0', '3');
INSERT INTO `bs_niuren_now` VALUES ('4', '1234567', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '1', '0', '4');
INSERT INTO `bs_niuren_now` VALUES ('5', '123456', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '30', '0', '5');
INSERT INTO `bs_niuren_now` VALUES ('6', 'yyyyyyy', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '2', '0', '7');
INSERT INTO `bs_niuren_now` VALUES ('7', '888888', 'http://localhost:8080/20190307091923etarn.jpeg', '0', '2', '0', '18');
INSERT INTO `bs_niuren_now` VALUES ('8', null, 'http://localhost:8080/20190307091923etarn.jpeg', '0', '9', '0', '20');

-- ----------------------------
-- Table structure for bs_posts
-- ----------------------------
DROP TABLE IF EXISTS `bs_posts`;
CREATE TABLE `bs_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子的id',
  `post_title` varchar(255) DEFAULT NULL COMMENT '帖子的标题',
  `post_bibo_id` int(11) NOT NULL COMMENT '帖子所属父版块id',
  `post_smbo_id` int(11) DEFAULT NULL COMMENT '帖子所属子版块id',
  `post_admin_id` int(11) DEFAULT NULL,
  `post_admin` varchar(255) NOT NULL COMMENT '发帖者姓名',
  `post_create_time` datetime DEFAULT NULL COMMENT '发帖时间',
  `post_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `post_content` varchar(20000) DEFAULT NULL COMMENT '帖子内容',
  `post_good_count` int(11) DEFAULT NULL COMMENT '帖子的好评数',
  `post_bad_count` int(11) DEFAULT NULL COMMENT '帖子的坏评数 ',
  `post_reward` int(11) DEFAULT NULL COMMENT '帖子的总共悬赏分',
  `post_score` int(11) DEFAULT NULL COMMENT '帖子悬赏分所剩下的分数',
  `post_ispay` int(11) DEFAULT NULL COMMENT '是否结贴',
  `post_islocked` int(11) DEFAULT NULL COMMENT '是否帖子被锁定',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_posts
-- ----------------------------
INSERT INTO `bs_posts` VALUES ('18', '公告一', '0', '0', '1', 'hello world', '2019-03-15 08:40:44', '2019-05-16 23:27:02', '今天开始使用了，欢迎第一批用户', '0', '0', '1', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('19', '开始答辩了', '0', '0', '1', 'hello world', '2019-03-15 08:40:44', '2019-05-16 23:27:41', '马上开始答辩了，要开始准备了', '1', '0', '1', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('20', 'ggggg', '0', '0', '1', 'hello world', '2019-03-15 08:40:44', '2019-03-15 08:40:54', '<p>粉红色的积分变换的手机发布会结束对话</p>', '0', '0', '1', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('21', 'ggggg', '0', '0', '1', 'hello world', '2019-03-15 08:40:44', '2019-03-15 08:40:54', '<p>粉红色的积分变换的手机发布会结束对话</p>', '0', '0', '0', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('22', 'ggggg', '0', '0', '1', 'hello world', '2019-03-15 08:40:44', '2019-03-15 08:40:54', '<p>粉红色的积分变换的手机发布会结束对话</p>', '0', '0', '0', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('81', 'ceshi公告', '0', '0', null, 'hello world', '2019-05-12 00:22:00', '2019-05-12 00:22:00', '吧v健康的复苏步伐v绝对是看不见肯定是', '0', '0', '0', '10', '0', '0');
INSERT INTO `bs_posts` VALUES ('82', '测试一次啊', '0', '0', null, 'hello world', '2019-05-12 00:22:37', '2019-05-12 00:22:37', 'v那段时间开发你可记得是', '0', '0', '0', '10', '0', '0');
INSERT INTO `bs_posts` VALUES ('97', '测试第二次', '5', null, '1', 'hello world', '2019-05-13 22:13:09', '2019-05-13 22:13:09', 'CNM凡是可就闹大了市内道路喀什你的离开', '0', '0', '0', '40', '0', '0');
INSERT INTO `bs_posts` VALUES ('102', '为什么打不开hadoop界面', '1', '1', '1', 'hello world', '2019-05-16 16:31:24', '2019-05-17 17:54:08', '<p><span>新手，用vm做4个虚拟机，加载centos7，加载hadoop3.0.3，4个节点为master、slave1、slave2、slave3，网络通常，可以互ping，虚拟机可以访问外网，ssh登录良好，jdk安装配置完成，systemctl显示已经关闭防火墙，关闭selinux，hosts文件和workers文件都设定好了，系统启动后，4个节点上jps显示正常，但就是打不开web页面，http://master:9870，</span><a href=\"http://192.168.3.3:9870/\" target=\"_blank\">http://192.168.3.3:9870</a><span>，8其中只有一句，NFO org.apache.hadoop.security.authentication.server求高手</span></p>', '2', '1', '19', '40', '0', '0');
INSERT INTO `bs_posts` VALUES ('103', 'secure DataNode无法启动', '1', '1', '1', 'hello world', '2019-05-16 16:32:38', '2019-05-16 16:32:38', '<p><span>在 CDH 5.14.2 里，为HDFS 启用了 kerberos 之后，NameNode 和 SNN 都可以正常启动，但是secure DataNode 无法启动成功。日志里有报错：</span><br><span>chown: 正在更改\"/opt/cm-5.14.2/run/cloudera-scm-agent/process/35-hdfs-DATANODE/config.zip\" 的所有者: 不允许的操作</span><br><span>chown: 正在更改\"/opt/cm-5.14.2/run/cloudera-scm-agent/process/35-hdfs-DATANODE/proc.json\" 的所有者: 不允许的操作</span><br><span>chown: 正在更改\"/opt/cm-5.14.2/run/cloudera-scm-agent/process/35-hdfs-DATANODE/supervisor.conf\" 的所有者: 不允许的操作</span><br><span>chown: 正在更改\"/opt/cm-5.14.2/run/cloudera-scm-agent/process/35-hdfs-DATANODE/logs/stderr.log\" 的所有者: 不允许的操作</span></p>', '1', '0', '3', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('104', 'yarn ha中zookeeper的作用', '1', '1', '1', 'hello world', '2019-05-16 16:33:35', '2019-05-16 16:33:35', '<table cellspacing=\"0\" cellpadding=\"0\" class=\"layui-table\"><tbody><tr><td class=\"t_f\" id=\"postmessage_248827\"><div class=\"a_pr\"><ins class=\"adsbygoogle\" data-ad-client=\"ca-pub-8926855489175386\" data-ad-slot=\"2569117352\" data-adsbygoogle-status=\"done\"><ins id=\"aswift_2_expand\"><ins id=\"aswift_2_anchor\"><span style=\"font-size: 14px;\">请问在yarn的ha中，resourcemanager向zookeeper写入了什么数据，我的rm和zk报错，找不到原因，一些相关的日志如下：</span></ins></ins></ins></div>resourcemanager日志：<br>2018-01-07 16:05:11,244 INFO org.apache.hadoop.yarn.server.resourcemanager.recovery.ZKRMStateStore: Retrying operation on ZK. Retry no. 1<br>2018-01-07 16:05:11,245 INFO org.apache.hadoop.ha.ActiveStandbyElector: Session disconnected. Entering neutral mode...</td></tr></tbody></table>', '0', '0', '2', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('105', 'Hadoop NameNode启动之FSDirectiry', '1', '1', '1', 'hello world', '2019-05-16 16:34:48', '2019-05-16 16:34:48', '<table cellspacing=\"0\" cellpadding=\"0\" class=\"layui-table\"><tbody><tr><td class=\"t_f\" id=\"postmessage_247480\"><div class=\"a_pr\"><ins class=\"adsbygoogle\" data-ad-client=\"ca-pub-8926855489175386\" data-ad-slot=\"2569117352\" data-adsbygoogle-status=\"done\"><ins id=\"aswift_2_expand\"><ins id=\"aswift_2_anchor\"><span style=\"font-size: 14px;\">可能会出一个小专题。欢迎大家评论拍砖。</span></ins></ins></ins></div>链接会到本博客地址<br><br><a href=\"https://basebase.github.io/2017/12/19/Hadoop-NameNode%E5%90%AF%E5%8A%A8%E4%B9%8BFSDirectiry/\" target=\"_blank\">Hadoop NameNode启动之FSDirectiry</a></td></tr></tbody></table>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('106', 'yarn ha中zookeeper的作用', '1', '1', '1', 'hello world', '2019-05-16 16:35:26', '2019-05-16 16:35:26', '<p><span>请问在yarn的ha中，resourcemanager向zookeeper写入了什么数据，我的rm和zk报错，找不到原因，一些相关的日志如下：</span><br><span>resourcemanager日志：</span><br><span>2018-01-07 16:05:11,244 INFO org.apache.hadoop.yarn.server.resourcemanager.recovery.ZKRMStateStore: Retrying operation on ZK. Retry no. 1</span><br><span>2018-01-07 16:05:11,245 INFO org.apache.hadoop.ha.ActiveStandbyElector: Session disconnected. Entering neutral mode...</span><br><span>2018-01-07 16:05:11,869 INFO org.apache.zookeeper.ClientCnxn: Opening socket connection to server 10.200.185.131/10.200.185.131:2181. Will not attempt to authenticate using SASL (unknown error)</span><br><span>2018-01-07 16:05:11,870 INFO org.</span></p>', '0', '0', '2', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('107', '求助有关hadoop作业调度方面的知识', '1', '1', '1', 'hello world', '2019-05-16 16:36:51', '2019-05-16 16:36:51', '<table cellspacing=\"0\" cellpadding=\"0\" class=\"layui-table\"><tbody><tr><td class=\"t_f\" id=\"postmessage_242279\"><div class=\"a_pr\"><ins class=\"adsbygoogle\" data-ad-client=\"ca-pub-8926855489175386\" data-ad-slot=\"2569117352\" data-adsbygoogle-status=\"done\"><ins id=\"aswift_2_expand\"><ins id=\"aswift_2_anchor\"><span style=\"font-size: 14px;\">我目前在读研，老师让我自己选了个方向，我就选择了hadoop的作业调度，但是学习了一阵过后发现，虽然有很多介绍方法的论文，但是在程序的具体实现上，很少有这方面的讲解，现在我卡在了写程序上，有没有大神能给予相关的帮助，有没有作业调度方面相关的程序例子？</span></ins></ins></ins></div></td></tr></tbody></table>', '0', '0', '9', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('108', 'Hadoop Yarn调度器的选择和使用', '1', '1', '1', 'hello world', '2019-05-16 16:38:29', '2019-05-16 16:38:29', '<p><span><span>一、引言</span></span></p><div align=\"left\"><font><font face=\"&amp;quot;\"><font>Yarn在Hadoop的生态系统中担任了资源管理和任务调度的角色。在讨论其构造器之前先简单了解一下Yarn的架构。<br></font></font></font><font><font face=\"&amp;quot;\"><font>责整个集群中包括内存、CPU等资源的管理；ApplicationMaster负责应用程序在整个生命周期的任务调度；NodeManager负责本节点上资源的供给和隔离；Container可以抽象的看成是运行任务的一个容器。本文讨论的调度器是在ResourceManager组建中进行调度的，接下来就一起研究一下包括FIFO调度器、Capacity调度器、Fair调度器在内的三个调度器。</font></font></font></div>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('109', 'hadoop两个namenode都是standby状态，DFSZKFailoverController没启动', '1', '1', '1', 'hello world', '2019-05-16 16:39:18', '2019-05-16 16:39:18', '<p><span>环境：hadoop2.6, zookeeper3.4.5，jdk1.7</span><br><span>4台服务器：</span><br><span>yun01-nn-01 192.168.56.11</span><br><span>yun01-nn-02 192.168.56.12</span><br><span>yun01-dn-01 192.168.56.13</span><br><span>yun01-dn-02 192.168.56.14</span><br></p><div align=\"left\">[hadoop@yun01-nn-01 conf]$/application/hadoop/hadoop/bin/hdfs haadmin -getServiceState nn1</div><div align=\"left\">standby</div><div align=\"left\">[hadoop@yun01-nn-02 ~]$ /appltion/haaadmin -getServiceState nn2</div><div align=\"left\">standby</div><div align=\"left\"></div>', '0', '0', '9', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('110', 'hadoop是什么东西？', '1', '1', '1', 'hello world', '2019-05-16 16:56:46', '2019-05-16 16:56:46', '<p><span>　2006年项目成立的一开始，“Hadoop”这个单词只代表了两个组件——HDFS和MapReduce。到现在的10个年头，这个单词代表的是“核心”（即Core Hadoop项目）以及与之相关的一个不断成长的生态系统。这个和Linux非常类似，都是由一个核心和一个生态系统组成。还有神东西吗？</span></p>', '0', '0', '0', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('111', 'TeraSort的取样算法', '1', '1', '1', 'hello world', '2019-05-16 20:22:47', '2019-05-16 20:22:47', '<p><span>TeraInputFormat类中的writePartition方法中，对于取样的实现能不能来个大神讲解下，我啃过之后觉得有的难懂。谢谢！</span></p>', '1', '0', '2', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('112', 'hadoop错误No Route to Host连接不上yarn master:8031', '1', '1', '1', 'hello world', '2019-05-16 20:23:29', '2019-05-16 20:23:29', '<p><span>Caused by: java.net.NoRouteToHostException: No Route to Host from&nbsp;&nbsp;slave2/192.168.1.30 to master:8031 failed on socket timeout exception: java.net.NoRouteToHostEx</span><br><span>ception: 没有到主机的路由; For more details see:&nbsp;&nbsp;</span><a href=\"http://wiki.apache.org/hadoop/NoRouteToHost\" target=\"_blank\">http://wiki.apache.org/hadoop/NoRouteToHost</a><br><span>&nbsp; &nbsp; &nbsp; &nbsp; at sun.reflect.GeneratedConstructorAccessor8.newInstance(Unknown Source)</span><br><span>&nbsp; &nbsp; &nbsp; &nbsp; at&nbsp;</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('113', '百度智能监控场景下的 HBase 实践', '1', '7', '1', 'hello world', '2019-05-16 20:25:18', '2019-05-16 20:25:18', '<p><span>通过百度大规模时序数据存储系列文章的介绍，想必读者对百度智能监控系统 Noah 的 TSDB 不再陌生，它主要用来存储 Noah 监控系统的</span><span>时序指标数据</span><span>，包括但不限于硬件和软件的可用性指标、资源使用率指标和性能指标等。如</span><a href=\"https://mp.weixin.qq.com/s?__biz=MzUyMzA3MTY1NA==&amp;mid=2247484040&amp;idx=1&amp;sn=82012419d6d4a0f65054378c755f1b82&amp;chksm=f9c37b41ceb4f257e0b38e7f5a7672fd540502dfc1db5da3fa2c99de9e2961fe3bf8da92be31&amp;scene=21#wechat_redirect\" target=\"_blank\">《百度大规模时序数据存储（二）|存储选型及数据模型设计》</a><span>文章所述， Noah-TSDB 是基于 HBase 为底层存储的基础上自主研发的，其优秀的性能离不开 HBase 的贡献。今天主要聊聊在百度智能监控场景下的 HBase 相关实践经验，先简单介绍一下 HBase</span></p>', '0', '0', '1', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('114', 'Hbase系统入门：包括介绍、安装、shell操作、原理等', '1', '7', '1', 'hello world', '2019-05-16 20:29:02', '2019-05-16 20:29:02', '<p><span>HBase 是一个高可靠性、高性能、面向列、可伸缩的分布式存储系统，利用 HBASE 技术可在廉价 PC Server 上搭建起大规模结构化存储集群。</span><br><br><span>HBase 的目标是存储并处理大型的数据，更具体来说是仅需使用普通的硬件配置，就能够处理由成千上万的行和列所组成的大型数据。</span><br><br><span>HBase 是 Google Bigtable 的开源实现，但是也有很多不同之处。比如：</span><br><br><span>Google Bigtable 利用 GFS 作为其文件存储系统，HBase 利用 Hadoop HDFS 作为其文件存储系统；</span></p>', '0', '0', '1', '40', '0', '0');
INSERT INTO `bs_posts` VALUES ('115', 'Hbase写数据，存数据，读数据的详细过程', '1', '7', '1', 'hello world', '2019-05-16 20:29:57', '2019-05-16 20:29:57', '<p><span>lient写入 -&gt; 存入MemStore，一直到MemStore满 -&gt; Flush成一个StoreFile，直至增长到一定阈值 -&gt; 出发Compact合并操作 -&gt; 多个StoreFile合并成一个StoreFile，同时进行版本合并和数据删除 -&gt; 当StoreFiles Compact后，逐步形成越来越大的StoreFile -&gt; 单个StoreFile大小超过一定阈值后，触发Split操作，把当前Region Split成2个Region，Region会下线，新Split出的2个孩子Region会被HMaster分配到相应的HRegionServer 上。</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('116', 'HBase性能优化方法总结', '1', '7', '1', 'hello world', '2019-05-16 20:30:54', '2019-05-16 20:30:54', '<p><span>在HBase中，客户端向集群中的RegionServer提交数据时（Put/Delete操作），首先会写到WAL（Write Ahead Log）日志，即HLog，一个RegionServer上的所有Region共享一个HLog，只有当WAL日志写成功后，再接着写MemStore，然后客户端被通知提交数据成功，如果写WAL日志失败，客户端被告知提交失败，这样做的好处是可以做到RegionServer宕机后的数据恢复。</span><br><br><span>对于不太重要的数据，可以在Put/Delete操作时，通过调用</span><font face=\"Source Code Pro, Consolas, Monaco, Menlo, Consolas, monospace\"><font color=\"#c7254e\">Put.setWriteToWAL(false)</font></font><span>或</span><font face=\"Source Code Pro, Consolas, Monaco, Menlo, Consolas, monospace\"><font color=\"#c7254e\">Delete.setWriteToWAL(false)</font></font><span>函数，放弃写WAL日志，以提高数据写入的性能</span></p>', '0', '0', '2', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('117', 'HBase在滴滴出行的应用场景和最佳实践', '1', '7', '1', 'hello world', '2019-05-16 20:31:36', '2019-05-16 20:31:36', '<p><span>HBase是建立在Hadoop生态之上的Database，源生对离线任务支持友好，又因为LSM树是一个优秀的高吞吐数据库结构，所以同时也对接了很多线上业务。在线业务对访问延迟敏感，并且访问趋向于随机，如订单、客服轨迹查询。离线业务通常是数仓的定时大批量处理任务，对一段时间内的数据进行处理并产出结果，对任务完成的时间要求不是非常敏感，并且处理逻辑复杂，如天级别报表、安全和用户行为分析、模型训练等。&nbsp;</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('118', 'HBASE原理简述', '1', '6', '1', 'hello world', '2019-05-16 20:32:35', '2019-05-16 20:32:35', '<p><span>从大家最熟悉的客户端发起请求开始讲起吧，这样大家能够深有体会的逐步了解原理。比如我们发起了一条PUT请求，客户端首先需要查找到需要响应请求的REGIONSERVER。 记录region-&gt;regionserver映射是由HBASE系统表.META.记录的。所以我们只要知道. META.表的位置就能知道每个region响应的key的范围 和region所在机器。但是.META.表又保存在哪些机器上呢？这又是由-ROOT-表记录的 master在分配完-ROOT-表后 会将-ROOT-表的位置放到ZOOKEEPER中。所以我们在配置客户端的时候配置的是ZOOKEEPER的位置，而不是MASTER位置。</span></p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('119', 'HBase Shell常用命令', '1', '7', '1', 'hello world', '2019-05-16 20:33:23', '2019-05-16 20:33:23', '<p><font color=\"#333333\"><font>.</font></font><font face=\"宋体\"><font color=\"#333333\"><font>查询服务器状态</font></font></font><br><font color=\"#333333\"><font>hbase(main):024:0&gt;status</font></font><br><font color=\"#333333\"><font>3 servers, 0 dead,1.0000 average load</font></font><br><font color=\"#333333\"><font>2.</font></font><font color=\"#333333\"><font><font face=\"宋体\">查询</font></font></font><font color=\"#333333\"><font>hive</font></font><font face=\"宋体\"><font color=\"#333333\"><font>版本</font></font></font><br><font color=\"#333333\"><font>hbase(main):025:0&gt;version</font></font><br><font color=\"#333333\"><font>0.90.4, r1150278,Sun Jul 24 15:53:29 PDT 2011</font></font></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('120', 'HBase 权限控制配置及如何实现授权及收回权限', '1', '7', '1', 'hello world', '2019-05-16 20:34:12', '2019-05-16 20:34:12', '<table cellspacing=\"0\" cellpadding=\"0\" class=\"layui-table\"><tbody><tr><td class=\"t_f\" id=\"postmessage_83218\"><div class=\"a_pr\"><ins class=\"adsbygoogle\" data-ad-client=\"ca-pub-8926855489175386\" data-ad-slot=\"2569117352\" data-adsbygoogle-status=\"done\"><ins id=\"aswift_2_expand\"><ins id=\"aswift_2_anchor\"><span style=\"font-size: 14px;\">问题导读</span></ins></ins></ins></div><br><span><font color=\"#ff0000\">1.HBase的权限管理需要配置哪些配置文件？</font></span><br><span><font color=\"#ff0000\">2.HBase提供的安全管控级别包括哪些？</font></span><br><span><font color=\"#ff0000\">3.使用哪个命令可实现在HBase中赋值权限？</font></span><br><span><font color=\"#ff0000\">4.如何收回权限？</font></span><br></td></tr></tbody></table>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('121', 'hbase常识及habse适合什么场景', '1', '6', '1', 'hello world', '2019-05-16 20:37:45', '2019-05-16 20:37:45', '<p><span>当我们</span><span>对于数据结构字段不够确定或杂乱无章很难按一个概念去进行抽取的数据适合用使用什么数据库？答案是什么，如果我们使用的传统数据库，肯定留有多余的字段，10个不行，20个，但是这个严重影响了质量。并且如果面对大数据库，pt级别的数据，这种浪费更是严重的，那么我们该使用是什么数据库？hbase数个不错的选择，那么我们对于hbase还存在下列问题：</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('122', 'hbase开发环境搭建及运行hbase小实例', '1', '7', '1', 'hello world', '2019-05-16 20:39:36', '2019-05-16 20:39:36', '<p><span>hbase开发环境搭建与hadoop开发环境搭建差不多的。这里是以win7为例。</span><br><span>首先我们看一下hadoop的开发环境搭建，参考</span><a href=\"http://www.aboutyun.com/thread-6950-1-1.html\" target=\"_blank\">hadoop开发方式总结及操作指导</a><span>，这里讲了两个方式，一种是用插件，另外一种是不是用插件。</span><br><span>那么对于hbase的开发环境是什么样子的，该如何搭建？</span></p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('123', '总结Eclipse 远程连接 HBase问题及解决方案大全', '1', '7', '1', 'hello world', '2019-05-16 20:40:46', '2019-05-16 20:40:46', '<p><font face=\"宋体\"><font size=\"3\">1.</font></font><font face=\"宋体\"><font size=\"3\">测试hbase:</font></font><br></p><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">a)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;cd hbase-0.90.4</font></font></font></font></div><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">b)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;bin/start-hbase.sh</font></font></font></font></div><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">c)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;bin/hbase shell</font></font></font></font></div><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">d)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;create&nbsp;&nbsp;‘database’,’cf’</font></font></font></font></div><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">e)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;list</font></font></font></font></div><div align=\"left\"><font><font><font face=\"宋体\"><font size=\"3\">f)&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;如果成功则可以看到有下面的结果：</font></font></font></font></div>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('124', '面向对象的特征有哪些方面？', '1', '9', '1', 'hello world', '2019-05-16 20:52:12', '2019-05-16 20:52:12', '<li><p>象：抽象是将一类对象的共同特征总结出来<strong>构造类的过程</strong>，包括<strong>数据抽象</strong>和<strong>行为抽象</strong>两方面。抽象只关注对象有哪些<strong>属性和行为</strong>，并不关注这些行为的细节是什么。封装：通常认为封装是把数据和操作数据的方法绑定起来，对数据的访问只能通过已定义的接口。面向对象的本质就是将现实世界描绘成一系列<strong>完全自治、封闭的对象。</strong>继承：继承是从已有类得到继承信息创建新类的过程。提供继承信息的类被称为父类（超类、基类）；<strong>继承让变化中的软件系统有了一定的延续性</strong>，同时继承也是封装程序中可变因素的重要手段（如果不能理解请阅读阎宏博士的《Java与模式》或《设计模式精解》中关于桥梁模式的部分）。多态性：多态性是指允许不同子类型的对象对同一消息作出不同的响。多态性分为<strong>编译时</strong>的多态性和<strong>运行时</strong>的多态性。</p></li>', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('125', '访问修饰符public、private、protected、以及不写（default默认）时的区别？', '1', '9', '1', 'hello world', '2019-05-16 20:53:34', '2019-05-16 20:53:34', '<div>类的成员不写访问修饰时默认为default。默认对于同一个包中的其他类相当于公开（public），对于不是同一个包中的其他类相当于私有（private）。受保护（protected）<strong>对子类相当于公开</strong>，对不是同一包中的没有父子关系的类相当于私有。Java中，外部类的修饰符只能是public或默认，类的成员（包括内部类）的修饰符可以是以上四种。</div><br>', '0', '0', '0', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('126', 'Java中的基本类型有哪些？String 是最基本的数据类型吗？', '1', '9', '1', 'hello world', '2019-05-16 20:56:07', '2019-05-16 20:56:07', '<div><li>Java中的基本数据类型只有8个：byte（1）、short（2）、int（4）、long（8）、float（4）、double（8）、char（2）、boolean（1）；</li>\r\n<li>除了基本类型（primitive type），剩下的都是引用类型（reference type），Java 5以后引入的枚举类型也算是一种比较特殊的引用类型。</li>\r\n<li>String不是基本数据类型，它定义的为对象。</li></div><br>', '0', '0', '1', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('127', 'float f=3.4;是否正确？', '1', '9', '1', 'hello world', '2019-05-16 20:57:38', '2019-05-16 20:57:38', '<p><span>不正确。3.4是双精度数，将双精度型（double）赋值给浮点型（float）属于下转型（down-casting，也称为窄化）会造成精度损失，因此需要强制类型转换float f =(float)3.4; 或者写成float f =3.4F</span></p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('128', 'short s1 = 1; s1 = s1 + 1;有错吗？short s1 = 1; s1 += 1;有错吗？', '1', '9', '1', 'hello world', '2019-05-16 21:01:41', '2019-05-16 21:01:41', '<div>对于short s1 = 1; s1 = s1 + 1；由于1是int类型，因此s1+1运算结果也是int 型，需要强制转换类型才能赋值给short型。而short s1 = 1; s1 += 1；+=操作符会进行<strong>隐式自动类型转换</strong>，是 <strong>Java 语言规定的运算符</strong>；Java编译器会对它进行特殊处理，因此可以正确编译。因为s1+= 1;相当于s1 = (short)(s1 + 1)。</div><br>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('129', 'int和Integer有什么区别？', '1', '9', '1', 'hello world', '2019-05-16 21:07:36', '2019-05-16 21:07:36', '<pre class=\"hljs java\"><code class=\"java\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">AutoUnboxingTest</span> </span>{\r\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">(String[] args)</span> </span>{\r\n        Integer a = <span class=\"hljs-keyword\">new</span> Integer(<span class=\"hljs-number\">3</span>);\r\n        Integer b = <span class=\"hljs-number\">3</span>;                  <span class=\"hljs-comment\">// 将3自动装箱成Integer类型</span>\r\n        <span class=\"hljs-keyword\">int</span> c = <span class=\"hljs-number\">3</span>;\r\n        System.out.println(a == b);     <span class=\"hljs-comment\">// false 两个引用没有引用同一对象</span>\r\n        System.out.println(a == c);     <span class=\"hljs-comment\">// true a自动拆箱成int类型再和c比较</span>\r\n    }\r\n}</code></pre>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('130', 'int自动装箱和拆箱', '1', '9', '1', 'hello world', '2019-05-16 21:12:01', '2019-05-16 21:12:01', '<pre class=\"hljs java\"><code class=\"java\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Test03</span> </span>{<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">(String[] args)</span> </span>{\r\n        Integer f1 = <span class=\"hljs-number\">100</span>, f2 = <span class=\"hljs-number\">100</span>, f3 = <span class=\"hljs-number\">150</span>, f4 = <span class=\"hljs-number\">150</span>;        \r\n        System.out.println(f1 == f2);System.out.println(f3 == f4);\r\n    }</code>}\r\n<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">简单的说，如果整型字面量的值在-128到127之间，那么不会new新的Integer对象，而是直接引用常量池中的Integer对象</span></p><p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">，所以上面的面试题中f1==f2的结果是true，而f3==f4的结果是false。</span></p></pre>', '0', '0', '0', '40', '0', '0');
INSERT INTO `bs_posts` VALUES ('131', '&和&&的区别？', '1', '9', '1', 'hello world', '2019-05-16 21:13:02', '2019-05-16 21:13:02', '<div><li>&amp;运算符有两种用法：(1)按位与；(2)逻辑与。&amp;&amp;运算符是<strong>短路与运算</strong>。逻辑与跟短路与的差别是非常巨大的，虽然二者都要求运算符左右两端的布尔值都是true整个表达式的值才是true。&amp;&amp;之所以称为短路运算是因为，如果&amp;&amp;左边的表达式的值是false，右边的表达式会被直接短路掉，不会进行运算。很多时候我们可能都需要用&amp;&amp;而不是&amp;，例如在验证用户登录时判定用户名不是null而且不是空字符串，应当写为：username != null &amp;&amp;!username.equals(\"\")，二者的顺序不能交换，更不能用&amp;运算符，因为第一个条件如果不成立，根本不能进行字符串的equals比较，否则会产生NullPointerException异常。注意：逻辑或运算符（|）和短路或运算符（||）的差别也是如此。</li></div><br>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('132', '解释内存中的栈(stack)、堆(heap)和方法区(method area)的用法？', '1', '9', '1', 'hello world', '2019-05-16 21:47:38', '2019-05-16 21:47:38', '<div>通常我们定义一个基本数据类型的变量，一个对象的引用，还有就是函数调用的现场保存都使用JVM中的栈空间；而通过new关键字和构造器创建的对象则放在堆空间，堆是垃圾收集器管理的主要区域，由于现在的垃圾收集器都采用分代收集算法，所以堆空间还可以细分为新生代和老生代；方法区和堆都是各个线程共享的内存区域，用于存储已经被JVM加载的类信息、常量、静态变量、JIT编译器编译后的代码等数据；程序中的字面量（literal）如直接书写的100、\"hello\"和常量都是放在常量池中，常量池是方法区的一部分，。栈空间操作起来最快但是栈很小，通常大量的对象都是放在堆空间，栈和堆的大小都可以通过JVM的启动参数来进行调整，栈空间用光了会引发StackOverflowError，而堆和常量池空间不足则会引发OutOfMemoryError。</div><br>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('133', 'HDFS是什么？', '1', '6', '1', 'hello world', '2019-05-16 22:06:37', '2019-05-16 22:06:37', '<p><span>Hadoop分布式文件系统(HDFS)被设计成适合运行在通用硬件(commodity hardware)上的分布式文件系统。它和现有的分布式文件系统有很多共同点。但同时，它和其他的分布式文件系统的区别也是很明显的。HDFS是一个高度容错性的系统，适合部署在廉价的机器上。HDFS能提供高吞吐量的数据访问，非常适合大规模数据集上的应用。HDFS放宽了一部分POSIX约束，来实现流式读取文件系统数据的目的。HDFS在最开始是作为Apache Nutch搜索引擎项目的基础架构而开发的。HDFS是Apache Hadoop Core项目的一部分。</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('134', 'HDFS的原理', '1', '6', '1', 'hello world', '2019-05-16 22:08:15', '2019-05-16 22:08:15', '<p><span><strong>HDFS</strong>（Hadoop Distributed File System ）Hadoop分布式文件系统。是根据google发表的论文翻版的。论文为GFSGoogle 文件系统。</span></p><p><span><strong>HDFS有很多特点</strong>：</span></p><p><span>&nbsp; &nbsp;&nbsp;<strong>①&nbsp;</strong>保存多个副本，且提供容错机制，副本丢失或宕机自动恢复。默认存3份。</span></p><p><span>&nbsp; &nbsp;&nbsp;<strong>②&nbsp;</strong>运行在廉价的机器上。</span></p><p><span>&nbsp; &nbsp;&nbsp;<strong>③&nbsp;</strong>适合大数据的处理。多大？多小？HDFS默认会将文件分割成block，64M为1个block。然后将block按键值对存储在HDFS上，并将键值对的映射存到内存中。如果小文件太多，那内存的负担会很重。</span></p>', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('135', 'HDFS基本原理', '1', '6', '1', 'hello world', '2019-05-16 22:11:13', '2019-05-16 22:11:13', '<p><span>NameNode是HDFS的核心。</span><span>&nbsp;NameNode也称为Master。</span><span>NameNode仅存储HDFS的元数据：文件系统中所有文件的目录树，并跟踪整个集群中的文件。</span><span>NameNode不存储实际数据或数据集。数据本身实际存储在DataNodes中。</span><span>NameNode知道HDFS中任何给定文件的块列表及其位置。使用此信息NameNode知道如何从块中构建文件。</span><span>NameNode并不持久化存储每个文件中各个块所在的DataNode的位置信息，这些信息会在系统启动时从数据节点重建。</span><span>NameNode对于HDFS至关重要，当NameNode关闭时，HDFS / Hadoop集群无法访问。</span><span>NameNode是Hadoop集群中的单点故障。</span><span>&nbsp;NameNode所在机器通常会配置有大量内存（RAM）。</span></p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('136', '云计算是什么？', '2', '3', '1', 'hello world', '2019-05-16 22:13:38', '2019-05-16 22:13:38', '<p><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%91%E8%AE%A1%E7%AE%97\">云计算</a><span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\">&nbsp;[1]</span><a class=\"sup-anchor\" name=\"ref_[1]_1316082\">&nbsp;</a><span>&nbsp;（Cloud Computing）是基于</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%92%E8%81%94%E7%BD%91\">互联网</a><span>的相关服务的增加、使用和交互模式，通常涉及通过</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%92%E8%81%94%E7%BD%91/199186\" data-lemmaid=\"199186\">互联网</a><span>来提供动态易扩展且经常是</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%99%9A%E6%8B%9F%E5%8C%96/547949\" data-lemmaid=\"547949\">虚拟化</a><span>的资源。云是</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BD%91%E7%BB%9C/143243\" data-lemmaid=\"143243\">网络</a><span>、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%92%E8%81%94%E7%BD%91/199186\" data-lemmaid=\"199186\">互联网</a><span>的一种比喻说法。过去在图中往往用云来表示电信网，后来也用来表示</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%92%E8%81%94%E7%BD%91/199186\" data-lemmaid=\"199186\">互联网</a><span>和底层基础设施的抽象。因此，云计算甚至可以让你体验每秒10万亿次的运算能力，拥有这么强大的计算能力可以模拟核爆炸、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A2%84%E6%B5%8B/35966\" data-lemmaid=\"35966\">预测</a><span>气候变化和市场发展趋势。用户通过</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%94%B5%E8%84%91/124859\" data-lemmaid=\"124859\">电脑</a><span>、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%94%E8%AE%B0%E6%9C%AC/176942\" data-lemmaid=\"176942\">笔记本</a><span>、手机等方式接入数据中心，按自己的需求进行运算</span></p>', '0', '0', '0', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('137', '为什么会需要“云”？', '2', '3', '1', 'hello world', '2019-05-16 22:14:38', '2019-05-16 22:14:38', '<div>传统的应用正在变得越来越复杂：需要支持更多的用户，需要更强的计算能力，需要更加稳定安全等等，而为了支撑这些不断增长的需求，企业不得不去购买各类硬件设备（服务器，存储，带宽等等）和软件（数据库，中间件等等），另外还需要组建一个完整的运维团队来支持这些设备或软件的正常运作，这些维护工作就包括安装、配置、测试、运行、升级以及保证系统的安全等。便会发现支持这些应用的开销变得非常巨大，而且它们的费用会随着你应用的数量或规模的增加而不断提高。这也是为什么即使是在那些拥有很出色IT部门的大企业中，那些用户仍在不断抱怨他们所使用的系统难以满足他们的需求。而对于那些中小规模的企业，甚至个人创业者来说，创造软件产品的运维成本就更加难以承受了。</div>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('138', '形象点来说说“云计算”，水龙头观点论：', '2', '3', '1', 'hello world', '2019-05-16 22:21:14', '2019-05-16 22:21:14', '<p><b>当需要的时候，扭开水龙头，水就来了，我只需要操心交水费就是了！</b>；当你想看书的时候，你不用跑去书城，只需要打开阅读软件，找到这样的一本书，在手机上阅读；当你想听音乐的时候，你不用再跑去音像店苦苦找寻CD光碟，打开音乐软件，就能聆听音乐；<b>云计算</b>，像在每个不同地区开设不同的自来水公司，没有地域限制，优秀的云软件服务商，向世界每个角落提供软件服务——就像天空上的云一样，不论你身处何方，只要你抬头，就能看见</p>', '0', '0', '1', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('139', '“云计算”的五大特点', '2', '3', '1', 'hello world', '2019-05-16 22:24:34', '2019-05-16 22:24:34', '<p><span>大规模、分布式，</span><span>虚拟化，</span><span>高可用性和扩展性，</span><span>按需服务，更加经济，</span><span>用户可以根据自己的需要来购买服务，甚至可以按使用量来进行精确计费。这能大大节省IT成本，而资源的整体利用率也将得到明显的改善</span>安全。网络安全已经成为所有企业或个人创业者必须面对的问题，企业的IT团队或个人很难应对那些来自网络的恶意攻击，而使用云服务则可以借助更专业的安全团队来有效降低安全风险。</p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('140', '区块链是什么', '2', '11', '1', 'hello world', '2019-05-16 22:33:31', '2019-05-16 22:33:31', '<div class=\"para\" label-module=\"para\">区块链是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F/19276232\" data-lemmaid=\"19276232\">分布式</a>数据存储、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%82%B9%E5%AF%B9%E7%82%B9%E4%BC%A0%E8%BE%93/8491956\" data-lemmaid=\"8491956\">点对点传输</a>、共识机制、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8A%A0%E5%AF%86%E7%AE%97%E6%B3%95\">加密算法</a>等<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA/140338\" data-lemmaid=\"140338\">计算机</a>技术的新型应用模式。<span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\">&nbsp;[1]</span><a class=\"sup-anchor\" name=\"ref_[1]_13112042\">&nbsp;</a></div><div class=\"para\" label-module=\"para\">区块链（Blockchain），是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AF%94%E7%89%B9%E5%B8%81/4143690\" data-lemmaid=\"4143690\">比特币</a>的一个重要概念，它本质上是一个去中心化的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E5%BA%93\">数据库</a>，同时作为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AF%94%E7%89%B9%E5%B8%81/4143690\" data-lemmaid=\"4143690\">比特币</a>的底层技术，是一串使用<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AF%86%E7%A0%81%E5%AD%A6/480001\" data-lemmaid=\"480001\">密码学</a>方法相关联产生的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E5%9D%97/107672\" data-lemmaid=\"107672\">数据块</a>，每一个数据块中包含了一批次比特币网络交易的信息，用于验证其信息的有效性（<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%98%B2%E4%BC%AA/9638550\" data-lemmaid=\"9638550\">防伪</a>）和生成下一个区块。<span class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\">&nbsp;[2]</span><a class=\"sup-anchor\" name=\"ref_[2]_13112042\">&nbsp;</a></div><div class=\"para\" label-module=\"para\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AF%94%E7%89%B9%E5%B8%81/4143690\" data-lemmaid=\"4143690\">比特币</a>白皮书英文原版<span class=\"sup--normal\" data-sup=\"3\" data-ctrmap=\":3,\">&nbsp;[3]</span><a class=\"sup-anchor\" name=\"ref_[3]_13112042\">&nbsp;</a>&nbsp;其实并未出现 blockchain 一词，而是使用的 chain of blocks。最早的比特币白皮书中文翻译版<span class=\"sup--normal\" data-sup=\"4\" data-ctrmap=\":4,\">[4]</span><a class=\"sup-anchor\" name=\"ref_[4]_13112042\">&nbsp;</a>&nbsp;中，将 chain of blocks 翻译成了区块链。这是“区块链”这一中文词最早的出现时间。</div>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('141', '做游戏开发要学什么 ？', '2', '10', '1', 'hello world', '2019-05-16 22:37:27', '2019-05-16 22:37:27', '<p>想成为一个游戏开发人员，就得先成为一名优秀的程序开发人员，所以游戏开发要先从编程语言学习，现在的编程语言有c语言，c++，Java，VC，c#等，用的比较多的是VC和Java.</p><p>2除了编程语言外，还有一些游戏方面的知识，比如说游戏开发流程及职业划分、玩家需求分析、游戏主线故事设计等等也要学习。</p><p>3然后还有一些绘图软件，比如说Photoshop，也要掌握一些，包括其中的游戏美术风格技法、色彩基础、游戏色彩练习、肖像绘制等方面的知识。</p>', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('142', '什么是人脸识别？', '3', '2', '1', 'hello world', '2019-05-16 22:38:54', '2019-05-16 22:38:54', '<p><span>人脸识别，是基于人的脸部特征信息进行身份识别的一种生物识别技术。用摄像机或摄像头采集含有人脸的图像或视频流，并自动在图像中检测和跟踪人脸，进而对检测到的人脸进行脸部识别的一系列相关技术，通常也叫做人像识别、面部识别。</span></p>', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('143', '人脸识别是干什么的？', '3', '2', '1', 'hello world', '2019-05-16 22:39:45', '2019-05-16 22:39:45', '<p><span>首先我们现在就比较常用的就是用于手机上了，很多新手机已经用上了这个人脸识别功能，主要就是用于解锁手机，而不再需要密码开机，或者指纹开机，直接将手机对着脸，通过人脸识别来智能开机。</span></p>', '1', '0', '3', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('144', '什么是路由交换机', '4', '4', '1', 'hello world', '2019-05-16 22:45:20', '2019-05-16 22:45:20', '<p><span>首先说交换机（又名</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%A4%E6%8D%A2%E5%BC%8F%E9%9B%86%E7%BA%BF%E5%99%A8/10607066\" data-lemmaid=\"10607066\">交换式集线器</a><span>）作用可以简单的理解为将一些机器连接起来组成一个局域网。而</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%AF%E7%94%B1%E5%99%A8/108294\" data-lemmaid=\"108294\">路由器</a><span>与交换机有明显区别，它的作用在于连接不同的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BD%91%E6%AE%B5/11026985\" data-lemmaid=\"11026985\">网段</a><span>并且找到网络中数据传输最合适的路径 ，可以说一般情况下个人用户需求不大。路由器是产生于交换机之后，就像交换机产生于集线器之后，所以路由器与交换机也有一定联系，并不是完全独立的两种设备。路由器主要克服了交换机不能路由转发</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E5%8C%85/489739\" data-lemmaid=\"489739\">数据包</a><span>的不足</span></p>', '1', '0', '3', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('145', '路由器、网关、交换机的区别是什么？？', '4', '4', '1', 'hello world', '2019-05-16 22:46:52', '2019-05-16 22:46:52', '<p><span>路由器是内网连接Internet外网用的网络设备，</span><br><span>交换机是连接路由器（或上一级交换机）和电脑（或下一级交换机）的设备；</span><br><span>网关可以是路由器，可以是一台</span><a href=\"https://www.baidu.com/s?wd=%E7%94%B5%E8%84%91%E6%9C%8D%E5%8A%A1%E5%99%A8&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\">电脑服务器</a><span>，可以是防火墙，也是连接内网和外网用的设备；</span><br><span>中继器是连接两个网络设备或者把网络信号进行扩大的一个设备，比如，把远处的无线路由器信号通过中继器扩大，以便让</span><a href=\"https://www.baidu.com/s?wd=%E6%97%A0%E7%BA%BF%E7%BD%91%E5%8D%A1&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\">无线网卡</a><span>的收到足够强的稳定的信号。</span></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('146', '路由器是什么？', '4', '4', '1', 'hello world', '2019-05-16 22:48:27', '2019-05-16 22:48:27', '<div class=\"change_words\">路由器作为互联网的主要节点设备，可连接电脑等设备与网络通信，实现上网功能。路由器一般工作在OSI网络标准模型的第三层——网络层，它可利用网络层定义的“逻辑”上的IP地址（网络地址）来区别不同的网络，实现网络的互连和隔离，保持各个网络的独立性。其具备防火墙功能，能避免网络遭受攻击，有效保护网络安全性。</div><div class=\"kg\"></div><div class=\"kg\"></div><div class=\"change_words\">与此同时，<a href=\"https://www.feisu.com/c/enterprise-routers-3308\" alt=\"路由器\" target=\"_blank\">路由器</a>还具备选择数据传送线路的作用，它可为经过路由器的每个数据帧寻找一条最佳（通畅快捷）传输路径，并将该数据有效的传送到目的站点，其大大提高了通信速度，减轻网络系统通信负荷，提高了网络系统畅通率。</div>', '0', '0', '1', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('147', '网络攻击是什么', '5', '5', '1', 'hello world', '2019-05-16 22:49:12', '2019-05-16 22:49:12', '<div class=\"para\" label-module=\"para\"><span>网络攻击</span>（Cyberattack，也译为<span>赛博攻击</span>）是指针对计算机信息系统、基础设施、计算机网络或个人计算机设备的，任何类型的进攻动作。</div><div class=\"para\" label-module=\"para\">于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA\">计算机</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C\">计算机网络</a>中，破坏、揭露、修改、使软件或服务失去功能、在没有得到授权的情况下偷取或访问任何一计算机的数据，都会被视为于计算机和计算机网络中的攻击。</div>', '0', '0', '1', '0', '0', '0');
INSERT INTO `bs_posts` VALUES ('148', '常见的网络攻击都有哪几种？', '5', '5', '1', 'hello world', '2019-05-16 22:51:01', '2019-05-16 22:51:01', '<p><span>侦察：</span><span>侦察是指未经授权的搜索和映射系统、服务或漏洞。此类攻击也称为信息收集，大多数情况下它充当其它类型攻击的先导。侦察类似于冒充邻居的小偷伺机寻找容易下手的住宅，例如无人居住的住宅、容易打开的门或窗户等。</span><span>访问</span><span>：系统访问是指入侵者获取本来不具备</span><a href=\"https://www.baidu.com/s?wd=%E8%AE%BF%E9%97%AE%E6%9D%83%E9%99%90&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\">访问权限</a><span>（帐户或密码）的设备的访问权。入侵者进入或访问系统后往往会运行某种黑客程序、脚本或工具，以利用目标系统或应用程序的已知漏洞展开攻击。</span><span>拒绝服务：</span><span>拒绝服务 (DoS) 是指攻击者通过禁用或破坏网络、系统或服务来拒绝为特定用户提供服务的一种攻击方式。DoS 攻击包括使系统崩溃或将系统性能降低至无法使用的状态。但是，DoS 也可以只是简单地删除或破坏信息。大多数情况下，执行此类攻击只需简单地运行黑客程序或脚本。因此，DoS 攻击成为最令人惧怕的攻击方式。</span><br><span>蠕虫、病毒和</span><a href=\"https://www.baidu.com/s?wd=%E7%89%B9%E6%B4%9B%E4%BC%8A%E6%9C%A8%E9%A9%AC&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\">特洛伊木马</a>：<span>有时主机上会被装上恶意软件，这些软件会破坏系统、自我复制或拒绝对网络、系统或服务的访问。此类软件通常称为蠕虫、病毒或</span><a href=\"https://www.baidu.com/s?wd=%E7%89%B9%E6%B4%9B%E4%BC%8A%E6%9C%A8%E9%A9%AC&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\">特洛伊木马</a><span>。</span></p>', '1', '0', '2', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('149', '什么是“网络杀伤链”？为什么并非适用于所有的网络攻击', '5', '5', '1', 'hello world', '2019-05-16 22:53:18', '2019-05-16 22:53:18', '<p><span style=\"text-align: justify;\">在介绍“网络杀伤链”之前，有必要简单地介绍一下“杀伤链”的概念。杀伤链是指对攻击目标从侦查到破坏的一系列循环处理过程，从而有效地帮助加深了解如何防御此类攻击。具体来说，就是防御者通过各个阶段阻止核武器、导弹等发挥作用，从而使攻击者无法达到预期的作战目的。</span><span style=\"text-align: justify;\">杀伤链最初由美国空军参谋长Ronald Fogleman将军于1996年空军协会研讨会上提出的。通常而言，杀伤链主要分为6个阶段：</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">发现（Find）</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">锁定（Fix）</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">跟踪（Track）</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">定位（Target）</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">交战（Engage）</span><span style=\"background-color: rgb(242, 242, 242); color: rgb(51, 51, 51); font-family: &quot;Courier New&quot;; font-size: 12px;\">评估（Assess）</span></p><p style=\"text-align: justify;\">距离杀伤链开始越近，阻断攻击的效果便越好。例如，攻击者获得的信息越少，其他人就越不可能使用这些信息来完成接下来的攻击过程。</p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('150', 'tcp半链接攻击', '5', '5', '1', 'hello world', '2019-05-16 22:55:54', '2019-05-16 22:55:54', '<p>tcp半链接攻击也称为：SYN Flood (SYN洪水)</p><p>是种典型的DoS (Denial of Service，拒绝服务) 攻击</p><p>效果就是服务器TCP连接资源耗尽，停止响应正常的TCP连接请求</p><p>tcp发送需要经过三次握手，需要client应答ack代表连接接收到，如果client一直建立连接而不应答，server就会一直阻塞等待，知道listen的数量达到上限从而停止服务；</p><p><br></p>', '0', '0', '0', '60', '0', '0');
INSERT INTO `bs_posts` VALUES ('151', 'dns攻击', '5', '5', '1', 'hello world', '2019-05-16 22:56:59', '2019-05-16 22:56:59', '<p><span>有些流氓的域名服务器故意更改一些域名的解析结果，将用户引向一个错误的目标地址。这就叫作 DNS 劫持，主要用来阻止用户访问某些特定的网站，或者是将用户引导到广告页面</span></p>', '0', '0', '0', '80', '0', '0');
INSERT INTO `bs_posts` VALUES ('152', 'dns欺骗', '5', '5', '1', 'hello world', '2019-05-16 22:57:51', '2019-05-16 22:57:51', '<p>DNS 欺骗简单来说就是用一个假的 DNS 应答来欺骗用户计算机，让其相信这个假的地址，并且抛弃真正的 DNS 应答。在一台主机发出 DNS 请求后，它就开始等待应答，如果此时有一个看起来正确（拥有和DNS请求一样的序列号）的应答包，它就会信以为真，并且丢弃稍晚一点到达的应答。</p><p><br></p>', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('153', '人机交互是什么', '3', '8', '1', 'hello world', '2019-05-16 23:55:17', '2019-05-16 23:55:17', '人机交互是及其与人的交互', '0', '0', '0', '100', '0', '0');
INSERT INTO `bs_posts` VALUES ('154', '测试一下', '5', '5', '1', 'hello world', '2019-05-18 11:35:35', '2019-05-18 11:35:35', '**当年可是拉到尼可拉斯', '0', '0', '1', '80', '0', '0');

-- ----------------------------
-- Table structure for bs_post_collect
-- ----------------------------
DROP TABLE IF EXISTS `bs_post_collect`;
CREATE TABLE `bs_post_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_post_title` varchar(255) DEFAULT NULL,
  `collect_post_admin` varchar(255) DEFAULT NULL,
  `collect_post_time` datetime DEFAULT NULL,
  `collect_post_id` int(11) DEFAULT NULL,
  `collect_admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_post_collect
-- ----------------------------
INSERT INTO `bs_post_collect` VALUES ('12', '发不发精神科大夫不可接受的', 'hello world', '2019-04-22 17:33:53', '4', '1');
INSERT INTO `bs_post_collect` VALUES ('14', 'ffffffffffffffffffffffffffffffffff', 'hello world', '2019-04-22 17:34:41', '40', '1');
INSERT INTO `bs_post_collect` VALUES ('16', 'javasmdl;smdl;sa', 'hello world', '2019-04-22 17:35:18', '46', '1');
INSERT INTO `bs_post_collect` VALUES ('18', '你看v率单反恐龙蛋看来是', 'hello world', '2019-04-23 21:35:48', '51', '1');
INSERT INTO `bs_post_collect` VALUES ('19', '为什么打不开hadoop3.0.3的页面', 'hello world', '2019-05-16 23:52:21', '102', '1');
INSERT INTO `bs_post_collect` VALUES ('20', '为什么打不开hadoop界面', 'hello world', '2019-05-17 20:07:40', '102', '20');

-- ----------------------------
-- Table structure for bs_post_commend
-- ----------------------------
DROP TABLE IF EXISTS `bs_post_commend`;
CREATE TABLE `bs_post_commend` (
  `poco_id` int(11) NOT NULL AUTO_INCREMENT,
  `poco_commend_type` int(11) DEFAULT NULL COMMENT '推荐类型',
  `poco_commend_time` datetime DEFAULT NULL,
  `poco_commend_person` varchar(255) DEFAULT NULL,
  `poco_commend_reason` varchar(15000) DEFAULT NULL,
  `poco_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`poco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_post_commend
-- ----------------------------
INSERT INTO `bs_post_commend` VALUES ('7', '2', '2019-02-27 11:43:23', 'hiehiehei', 'yinggao', '11');
INSERT INTO `bs_post_commend` VALUES ('8', '3', '2019-02-27 11:43:45', 'hahahhaha', 'fnsdklflas', '12');
INSERT INTO `bs_post_commend` VALUES ('13', '1', '2019-05-06 23:05:06', null, '...', '74');
INSERT INTO `bs_post_commend` VALUES ('16', '1', '2019-05-16 22:59:30', null, '...', '152');
INSERT INTO `bs_post_commend` VALUES ('17', '1', '2019-05-16 22:59:37', null, '...', '151');
INSERT INTO `bs_post_commend` VALUES ('18', '1', '2019-05-16 22:59:47', null, '...', '149');
INSERT INTO `bs_post_commend` VALUES ('19', '1', '2019-05-16 22:59:53', null, '...', '148');
INSERT INTO `bs_post_commend` VALUES ('20', '1', '2019-05-16 22:59:59', null, '...', '147');
INSERT INTO `bs_post_commend` VALUES ('21', '1', '2019-05-16 23:00:05', null, '...', '146');
INSERT INTO `bs_post_commend` VALUES ('22', '1', '2019-05-16 23:00:12', null, '...', '145');
INSERT INTO `bs_post_commend` VALUES ('23', '1', '2019-05-16 23:00:17', null, '...', '144');
INSERT INTO `bs_post_commend` VALUES ('24', '1', '2019-05-16 23:00:23', null, '...', '143');

-- ----------------------------
-- Table structure for bs_post_commend_type
-- ----------------------------
DROP TABLE IF EXISTS `bs_post_commend_type`;
CREATE TABLE `bs_post_commend_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_summary` varchar(15000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_post_commend_type
-- ----------------------------
INSERT INTO `bs_post_commend_type` VALUES ('1', '强烈推荐');
INSERT INTO `bs_post_commend_type` VALUES ('2', '一般般');
INSERT INTO `bs_post_commend_type` VALUES ('3', '值得一看');
INSERT INTO `bs_post_commend_type` VALUES ('4', '眼前一亮');

-- ----------------------------
-- Table structure for bs_post_reply
-- ----------------------------
DROP TABLE IF EXISTS `bs_post_reply`;
CREATE TABLE `bs_post_reply` (
  `reply_admin` varchar(255) DEFAULT NULL,
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_post_id` int(11) DEFAULT NULL,
  `reply_smbo_id` int(11) DEFAULT NULL,
  `reply_bibo_id` int(11) DEFAULT NULL,
  `reply_content` varchar(20000) DEFAULT NULL,
  `reply_create_time` datetime DEFAULT NULL,
  `reply_good_count` int(11) DEFAULT NULL,
  `reply_bad_count` int(11) NOT NULL,
  `reply_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_post_reply
-- ----------------------------
INSERT INTO `bs_post_reply` VALUES ('hello world', '175', '18', '0', '0', '<p>					 			</p><p>请在这里输入fddddddddddddddddddd</p><p>\n							</p>', '2019-04-02 15:33:16', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '176', '18', '0', '0', '<p>					 			</p><p>的烦烦烦烦烦烦</p><p>\n							</p>', '2019-04-02 15:33:27', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '177', '18', '0', '0', '<p>					 			</p><p>分顶顶顶顶顶顶顶顶顶顶</p><p>\n							</p>', '2019-04-02 15:33:37', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '178', '18', '0', '0', '<p>					 			</p><p>f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f&#39;f</p><p>\n							</p>', '2019-04-02 15:38:58', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '179', '19', '0', '0', '<p>					 			</p><p>发的杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀</p><p>\n							</p>', '2019-04-02 15:41:08', '0', '1', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '180', '19', '0', '0', '<p>					 			</p><p>发的杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀</p><p>\n							</p>', '2019-04-02 15:41:09', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '181', '19', '0', '0', '<p>					 			</p><p>发的杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀</p><p>\n							</p>', '2019-04-02 15:41:10', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '182', '19', '0', '0', '<p>					 			</p><p>发的杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀</p><p>\n							</p>', '2019-04-02 15:41:10', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '183', '20', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:41:33', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '184', '20', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:41:33', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '185', '20', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:41:33', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '186', '20', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:41:34', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '187', '21', '0', '0', '<p>					 			</p><p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶</p><p>\n							</p>', '2019-04-02 15:41:46', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '188', '21', '0', '0', '<p>					 			</p><p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶</p><p>\n							</p>', '2019-04-02 15:41:47', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '189', '21', '0', '0', '<p>					 			</p><p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶</p><p>\n							</p>', '2019-04-02 15:41:47', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '190', '21', '0', '0', '<p>					 			</p><p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶</p><p>\n							</p>', '2019-04-02 15:41:47', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '191', '22', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:42:08', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '192', '22', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:42:08', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '193', '22', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:42:09', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '194', '22', '0', '0', '<p>					 			</p><p>水水水水水水水水水水水水水水水水水水水</p><p>\n							</p>', '2019-04-02 15:42:09', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '207', '102', '1', '1', '有点道理<img src=\"http://localhost:8080/bs/X-admin/lib/layui/images/face/13.gif\" alt=\"[偷笑]\">', '2019-05-16 23:08:09', '1', '0', '10');
INSERT INTO `bs_post_reply` VALUES ('hello world', '208', '102', '1', '1', '什么东东<img src=\"http://localhost:8080/bs/X-admin/lib/layui/images/face/15.gif\" alt=\"[生病]\">', '2019-05-16 23:08:28', '1', '0', '10');
INSERT INTO `bs_post_reply` VALUES ('hello world', '209', '102', '1', '1', '还不错', '2019-05-16 23:08:53', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '210', '102', '1', '1', '挺好的', '2019-05-16 23:09:07', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '211', '103', '1', '1', 'datanode是什么东西<img src=\"http://localhost:8080/bs/X-admin/lib/layui/images/face/0.gif\" alt=\"[微笑]\">', '2019-05-16 23:11:16', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '212', '103', '1', '1', '***什么东西', '2019-05-16 23:11:30', '0', '1', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '213', '104', '1', '1', '用着还不错', '2019-05-16 23:22:34', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '214', '143', '2', '3', '挺详细', '2019-05-16 23:23:29', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '215', '144', '4', '4', '什么鬼？<img src=\"http://localhost:8080/bs/X-admin/lib/layui/images/face/25.gif\" alt=\"[抱抱]\">', '2019-05-16 23:24:13', '0', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '216', '111', '1', '1', '还不错', '2019-05-17 16:20:40', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '217', '148', '5', '5', '还有别的吗？<img src=\"http://localhost:8080/bs/X-admin/lib/layui/images/face/0.gif\" alt=\"[微笑]\">', '2019-05-17 16:26:30', '1', '0', '0');
INSERT INTO `bs_post_reply` VALUES ('hello world', '218', '116', '7', '1', '你好', '2019-05-18 11:22:07', '0', '0', '0');

-- ----------------------------
-- Table structure for bs_post_zan
-- ----------------------------
DROP TABLE IF EXISTS `bs_post_zan`;
CREATE TABLE `bs_post_zan` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_post_zan
-- ----------------------------
INSERT INTO `bs_post_zan` VALUES ('1', '1', '0');
INSERT INTO `bs_post_zan` VALUES ('19', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('5', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('78', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('2', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('102', '1', '0');
INSERT INTO `bs_post_zan` VALUES ('103', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('143', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('144', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('111', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('148', '1', '1');
INSERT INTO `bs_post_zan` VALUES ('102', '18', '1');
INSERT INTO `bs_post_zan` VALUES ('102', '20', '1');

-- ----------------------------
-- Table structure for bs_rank
-- ----------------------------
DROP TABLE IF EXISTS `bs_rank`;
CREATE TABLE `bs_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pre_rank` int(255) DEFAULT NULL,
  `now_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_rank
-- ----------------------------
INSERT INTO `bs_rank` VALUES ('4', '1', '1', '1');
INSERT INTO `bs_rank` VALUES ('5', '18', '7', '7');
INSERT INTO `bs_rank` VALUES ('6', '20', '8', '8');

-- ----------------------------
-- Table structure for bs_reply_zan
-- ----------------------------
DROP TABLE IF EXISTS `bs_reply_zan`;
CREATE TABLE `bs_reply_zan` (
  `reply_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_reply_zan
-- ----------------------------
INSERT INTO `bs_reply_zan` VALUES ('8', '1', '0');
INSERT INTO `bs_reply_zan` VALUES ('10', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('179', '1', '0');
INSERT INTO `bs_reply_zan` VALUES ('180', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('75', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('205', '1', '0');
INSERT INTO `bs_reply_zan` VALUES ('207', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('208', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('211', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('212', '1', '0');
INSERT INTO `bs_reply_zan` VALUES ('213', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('214', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('216', '1', '1');
INSERT INTO `bs_reply_zan` VALUES ('217', '1', '1');

-- ----------------------------
-- Table structure for bs_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_role`;
CREATE TABLE `bs_role` (
  `role_id` int(60) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_guize` varchar(255) DEFAULT NULL,
  `role_descript` varchar(50) DEFAULT NULL,
  `role_state` int(11) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_role
-- ----------------------------
INSERT INTO `bs_role` VALUES ('1', '超级管理员', '拥有全部权限', '拥有全部权限', '1');
INSERT INTO `bs_role` VALUES ('2', '帖子管理员', '帖子管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('3', '文件管理员', '文件管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('4', '轮播管理员', '轮播管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('5', '公告管理员', '公告管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('6', '邮件管理员', '邮件管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('7', '评论管理员', '评论管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('8', '会员管理员', '会员管理', '只有该部分权限', '1');
INSERT INTO `bs_role` VALUES ('9', '管理员管理', '管理员管理', '只有该部分权限', '1');

-- ----------------------------
-- Table structure for bs_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `bs_role_menu`;
CREATE TABLE `bs_role_menu` (
  `role_menu_id` int(60) NOT NULL AUTO_INCREMENT,
  `role_id` int(60) DEFAULT NULL,
  `menu_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_role_menu
-- ----------------------------
INSERT INTO `bs_role_menu` VALUES ('1', '1', '1.2.3.4.5.6.7.8.');
INSERT INTO `bs_role_menu` VALUES ('2', '2', '1.');
INSERT INTO `bs_role_menu` VALUES ('3', '3', '2.');
INSERT INTO `bs_role_menu` VALUES ('4', '4', '3.');
INSERT INTO `bs_role_menu` VALUES ('5', '5', '4.');
INSERT INTO `bs_role_menu` VALUES ('6', '6', '5.');
INSERT INTO `bs_role_menu` VALUES ('7', '7', '6.');
INSERT INTO `bs_role_menu` VALUES ('8', '8', '7.');
INSERT INTO `bs_role_menu` VALUES ('9', '9', '8.');
INSERT INTO `bs_role_menu` VALUES ('10', '10', '7,1,6');

-- ----------------------------
-- Table structure for bs_score_limit
-- ----------------------------
DROP TABLE IF EXISTS `bs_score_limit`;
CREATE TABLE `bs_score_limit` (
  `score_user_name` varchar(255) DEFAULT NULL,
  `score_post_mark` int(11) DEFAULT NULL,
  `score_reply_mark` int(11) DEFAULT NULL,
  `score_create_time` datetime DEFAULT NULL,
  `score_update_time` datetime DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_score_limit
-- ----------------------------

-- ----------------------------
-- Table structure for bs_send_email_history
-- ----------------------------
DROP TABLE IF EXISTS `bs_send_email_history`;
CREATE TABLE `bs_send_email_history` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `send_email_account` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `receive_email_account` varchar(100) NOT NULL,
  `send_email_password` varchar(100) NOT NULL,
  `receiveder` varchar(100) NOT NULL,
  `email_theme` varchar(100) NOT NULL,
  `email_content` varchar(1000) DEFAULT NULL,
  `send_date` datetime NOT NULL,
  `email_type` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_send_email_history
-- ----------------------------

-- ----------------------------
-- Table structure for bs_smallboard
-- ----------------------------
DROP TABLE IF EXISTS `bs_smallboard`;
CREATE TABLE `bs_smallboard` (
  `smbo_id` int(11) NOT NULL,
  `smbo_title` varchar(255) NOT NULL,
  `smbo_admin` varchar(255) DEFAULT NULL,
  `smbo_bibo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`smbo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_smallboard
-- ----------------------------
INSERT INTO `bs_smallboard` VALUES ('1', 'hadoop', 'ljp', '1');
INSERT INTO `bs_smallboard` VALUES ('2', '人脸识别', 'ljp', '3');
INSERT INTO `bs_smallboard` VALUES ('3', '云计算1', 'ljp', '2');
INSERT INTO `bs_smallboard` VALUES ('4', '路由交换', 'ljp', '4');
INSERT INTO `bs_smallboard` VALUES ('5', '网络攻击', 'ljp', '5');
INSERT INTO `bs_smallboard` VALUES ('6', 'hdfs', 'ljp', '1');
INSERT INTO `bs_smallboard` VALUES ('7', 'hbase', 'ljp', '1');
INSERT INTO `bs_smallboard` VALUES ('8', '人机交互', 'ljp', '3');
INSERT INTO `bs_smallboard` VALUES ('9', 'javaEE', 'ljp', '1');
INSERT INTO `bs_smallboard` VALUES ('10', '游戏开发', 'ljp', '2');
INSERT INTO `bs_smallboard` VALUES ('11', '区块链', 'ljp', '2');

-- ----------------------------
-- Table structure for bs_system_log
-- ----------------------------
DROP TABLE IF EXISTS `bs_system_log`;
CREATE TABLE `bs_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_system_log
-- ----------------------------
INSERT INTO `bs_system_log` VALUES ('20', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 10:13:26');
INSERT INTO `bs_system_log` VALUES ('21', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 10:13:27');
INSERT INTO `bs_system_log` VALUES ('22', '帖子管理员', '登陆成功', '5', '123456', '127.0.0.1', '2019-05-09 10:22:12');
INSERT INTO `bs_system_log` VALUES ('23', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 10:22:13');
INSERT INTO `bs_system_log` VALUES ('24', '帖子管理员', '登陆成功', '5', '123456', '127.0.0.1', '2019-05-09 10:23:01');
INSERT INTO `bs_system_log` VALUES ('25', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 10:23:50');
INSERT INTO `bs_system_log` VALUES ('26', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:01:48');
INSERT INTO `bs_system_log` VALUES ('27', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:01:49');
INSERT INTO `bs_system_log` VALUES ('28', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:35:58');
INSERT INTO `bs_system_log` VALUES ('29', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:35:59');
INSERT INTO `bs_system_log` VALUES ('30', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:36:28');
INSERT INTO `bs_system_log` VALUES ('31', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:36:35');
INSERT INTO `bs_system_log` VALUES ('32', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:40:50');
INSERT INTO `bs_system_log` VALUES ('33', '超级管理员', '登陆成功', '1', 'hello world', '127.0.0.1', '2019-05-09 11:41:05');
INSERT INTO `bs_system_log` VALUES ('34', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 11:46:38');
INSERT INTO `bs_system_log` VALUES ('35', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 11:46:42');
INSERT INTO `bs_system_log` VALUES ('36', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 13:22:54');
INSERT INTO `bs_system_log` VALUES ('37', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 13:22:55');
INSERT INTO `bs_system_log` VALUES ('38', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 13:26:00');
INSERT INTO `bs_system_log` VALUES ('39', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 13:26:00');
INSERT INTO `bs_system_log` VALUES ('40', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 13:57:35');
INSERT INTO `bs_system_log` VALUES ('41', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 14:03:55');
INSERT INTO `bs_system_log` VALUES ('42', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 14:03:55');
INSERT INTO `bs_system_log` VALUES ('43', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-04 16:01:57');
INSERT INTO `bs_system_log` VALUES ('44', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-05 16:01:59');
INSERT INTO `bs_system_log` VALUES ('45', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-06 17:06:26');
INSERT INTO `bs_system_log` VALUES ('46', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-07 17:06:26');
INSERT INTO `bs_system_log` VALUES ('47', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-08 17:46:48');
INSERT INTO `bs_system_log` VALUES ('48', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 17:46:51');
INSERT INTO `bs_system_log` VALUES ('49', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-09 18:06:17');
INSERT INTO `bs_system_log` VALUES ('50', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 19:19:39');
INSERT INTO `bs_system_log` VALUES ('51', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 19:54:59');
INSERT INTO `bs_system_log` VALUES ('52', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 20:04:58');
INSERT INTO `bs_system_log` VALUES ('53', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 20:04:59');
INSERT INTO `bs_system_log` VALUES ('54', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 21:01:32');
INSERT INTO `bs_system_log` VALUES ('55', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 21:01:33');
INSERT INTO `bs_system_log` VALUES ('56', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 21:04:28');
INSERT INTO `bs_system_log` VALUES ('57', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 21:04:29');
INSERT INTO `bs_system_log` VALUES ('58', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 21:48:59');
INSERT INTO `bs_system_log` VALUES ('59', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 22:23:31');
INSERT INTO `bs_system_log` VALUES ('60', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 22:23:31');
INSERT INTO `bs_system_log` VALUES ('61', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 23:24:20');
INSERT INTO `bs_system_log` VALUES ('62', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 23:43:37');
INSERT INTO `bs_system_log` VALUES ('63', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 23:43:39');
INSERT INTO `bs_system_log` VALUES ('64', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-10 23:43:40');
INSERT INTO `bs_system_log` VALUES ('65', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 00:12:15');
INSERT INTO `bs_system_log` VALUES ('66', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 00:12:16');
INSERT INTO `bs_system_log` VALUES ('67', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 14:53:19');
INSERT INTO `bs_system_log` VALUES ('68', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 14:53:20');
INSERT INTO `bs_system_log` VALUES ('69', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 15:59:45');
INSERT INTO `bs_system_log` VALUES ('70', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 15:59:45');
INSERT INTO `bs_system_log` VALUES ('71', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 15:59:45');
INSERT INTO `bs_system_log` VALUES ('72', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 16:27:44');
INSERT INTO `bs_system_log` VALUES ('73', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 16:27:44');
INSERT INTO `bs_system_log` VALUES ('74', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 17:07:29');
INSERT INTO `bs_system_log` VALUES ('75', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 17:07:30');
INSERT INTO `bs_system_log` VALUES ('76', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 23:51:46');
INSERT INTO `bs_system_log` VALUES ('77', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-11 23:55:00');
INSERT INTO `bs_system_log` VALUES ('78', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:00:27');
INSERT INTO `bs_system_log` VALUES ('79', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:01:55');
INSERT INTO `bs_system_log` VALUES ('80', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:20:47');
INSERT INTO `bs_system_log` VALUES ('81', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:20:47');
INSERT INTO `bs_system_log` VALUES ('82', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:48:12');
INSERT INTO `bs_system_log` VALUES ('83', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 00:58:26');
INSERT INTO `bs_system_log` VALUES ('84', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 11:55:03');
INSERT INTO `bs_system_log` VALUES ('85', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 13:32:28');
INSERT INTO `bs_system_log` VALUES ('86', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 13:32:29');
INSERT INTO `bs_system_log` VALUES ('87', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:01');
INSERT INTO `bs_system_log` VALUES ('88', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:02');
INSERT INTO `bs_system_log` VALUES ('89', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:03');
INSERT INTO `bs_system_log` VALUES ('90', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:03');
INSERT INTO `bs_system_log` VALUES ('91', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:04');
INSERT INTO `bs_system_log` VALUES ('92', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:05');
INSERT INTO `bs_system_log` VALUES ('93', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:05');
INSERT INTO `bs_system_log` VALUES ('94', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:06');
INSERT INTO `bs_system_log` VALUES ('95', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:06');
INSERT INTO `bs_system_log` VALUES ('96', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:06');
INSERT INTO `bs_system_log` VALUES ('97', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:07');
INSERT INTO `bs_system_log` VALUES ('98', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:07');
INSERT INTO `bs_system_log` VALUES ('99', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:08');
INSERT INTO `bs_system_log` VALUES ('100', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:08');
INSERT INTO `bs_system_log` VALUES ('101', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:09');
INSERT INTO `bs_system_log` VALUES ('102', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:38:09');
INSERT INTO `bs_system_log` VALUES ('103', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:40:00');
INSERT INTO `bs_system_log` VALUES ('104', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 14:40:20');
INSERT INTO `bs_system_log` VALUES ('105', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 16:47:27');
INSERT INTO `bs_system_log` VALUES ('106', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 17:12:43');
INSERT INTO `bs_system_log` VALUES ('107', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 17:55:11');
INSERT INTO `bs_system_log` VALUES ('108', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 18:09:28');
INSERT INTO `bs_system_log` VALUES ('109', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 21:46:09');
INSERT INTO `bs_system_log` VALUES ('110', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 21:54:43');
INSERT INTO `bs_system_log` VALUES ('111', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 23:32:13');
INSERT INTO `bs_system_log` VALUES ('112', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 23:32:14');
INSERT INTO `bs_system_log` VALUES ('113', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-12 23:55:15');
INSERT INTO `bs_system_log` VALUES ('114', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 00:11:34');
INSERT INTO `bs_system_log` VALUES ('115', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 00:30:39');
INSERT INTO `bs_system_log` VALUES ('116', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 08:47:29');
INSERT INTO `bs_system_log` VALUES ('117', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 08:51:40');
INSERT INTO `bs_system_log` VALUES ('118', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 09:06:11');
INSERT INTO `bs_system_log` VALUES ('119', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 11:20:48');
INSERT INTO `bs_system_log` VALUES ('120', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 11:20:48');
INSERT INTO `bs_system_log` VALUES ('121', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 21:21:25');
INSERT INTO `bs_system_log` VALUES ('122', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 21:46:24');
INSERT INTO `bs_system_log` VALUES ('123', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 21:54:28');
INSERT INTO `bs_system_log` VALUES ('124', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:05:28');
INSERT INTO `bs_system_log` VALUES ('125', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:58');
INSERT INTO `bs_system_log` VALUES ('126', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:58');
INSERT INTO `bs_system_log` VALUES ('127', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:59');
INSERT INTO `bs_system_log` VALUES ('128', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:59');
INSERT INTO `bs_system_log` VALUES ('129', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:59');
INSERT INTO `bs_system_log` VALUES ('130', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:06:59');
INSERT INTO `bs_system_log` VALUES ('131', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-13 22:34:33');
INSERT INTO `bs_system_log` VALUES ('132', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 15:35:49');
INSERT INTO `bs_system_log` VALUES ('133', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 17:56:45');
INSERT INTO `bs_system_log` VALUES ('134', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 17:59:07');
INSERT INTO `bs_system_log` VALUES ('135', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 18:01:17');
INSERT INTO `bs_system_log` VALUES ('136', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 18:10:52');
INSERT INTO `bs_system_log` VALUES ('137', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 19:50:38');
INSERT INTO `bs_system_log` VALUES ('138', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 19:52:57');
INSERT INTO `bs_system_log` VALUES ('139', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 20:13:36');
INSERT INTO `bs_system_log` VALUES ('140', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 20:17:43');
INSERT INTO `bs_system_log` VALUES ('141', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 22:58:49');
INSERT INTO `bs_system_log` VALUES ('142', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 23:03:47');
INSERT INTO `bs_system_log` VALUES ('143', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 23:25:19');
INSERT INTO `bs_system_log` VALUES ('144', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 23:28:05');
INSERT INTO `bs_system_log` VALUES ('145', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-16 23:51:29');
INSERT INTO `bs_system_log` VALUES ('146', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 16:19:43');
INSERT INTO `bs_system_log` VALUES ('147', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 16:21:59');
INSERT INTO `bs_system_log` VALUES ('148', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 17:43:53');
INSERT INTO `bs_system_log` VALUES ('149', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 17:46:33');
INSERT INTO `bs_system_log` VALUES ('150', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 17:46:35');
INSERT INTO `bs_system_log` VALUES ('151', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 18:04:39');
INSERT INTO `bs_system_log` VALUES ('152', '普通会员', null, '18', '888888', '192.168.174.1', '2019-05-17 18:25:47');
INSERT INTO `bs_system_log` VALUES ('153', '普通会员', null, '18', '888888', '192.168.174.1', '2019-05-17 18:28:04');
INSERT INTO `bs_system_log` VALUES ('154', '普通会员', null, '18', '888888', '192.168.174.1', '2019-05-17 19:24:05');
INSERT INTO `bs_system_log` VALUES ('155', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 19:58:11');
INSERT INTO `bs_system_log` VALUES ('156', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 19:59:27');
INSERT INTO `bs_system_log` VALUES ('157', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 19:59:50');
INSERT INTO `bs_system_log` VALUES ('158', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 20:00:48');
INSERT INTO `bs_system_log` VALUES ('159', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 20:02:17');
INSERT INTO `bs_system_log` VALUES ('160', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 20:03:18');
INSERT INTO `bs_system_log` VALUES ('161', '普通会员', null, '20', null, '192.168.174.1', '2019-05-17 20:04:02');
INSERT INTO `bs_system_log` VALUES ('162', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 20:06:42');
INSERT INTO `bs_system_log` VALUES ('163', '普通会员', null, '20', '方便大家', '192.168.174.1', '2019-05-17 20:06:59');
INSERT INTO `bs_system_log` VALUES ('164', '普通会员', null, '20', '方便大家', '192.168.174.1', '2019-05-17 20:07:28');
INSERT INTO `bs_system_log` VALUES ('165', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 20:09:16');
INSERT INTO `bs_system_log` VALUES ('166', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-17 20:12:43');
INSERT INTO `bs_system_log` VALUES ('167', '普通会员', null, '20', '方便大家', '192.168.174.1', '2019-05-17 20:13:05');
INSERT INTO `bs_system_log` VALUES ('168', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 07:55:24');
INSERT INTO `bs_system_log` VALUES ('169', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 08:46:02');
INSERT INTO `bs_system_log` VALUES ('170', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 08:46:04');
INSERT INTO `bs_system_log` VALUES ('171', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 09:07:01');
INSERT INTO `bs_system_log` VALUES ('172', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:02:09');
INSERT INTO `bs_system_log` VALUES ('173', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:04:12');
INSERT INTO `bs_system_log` VALUES ('174', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:04:15');
INSERT INTO `bs_system_log` VALUES ('175', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:06:55');
INSERT INTO `bs_system_log` VALUES ('176', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:09:33');
INSERT INTO `bs_system_log` VALUES ('177', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:20:58');
INSERT INTO `bs_system_log` VALUES ('178', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:28:47');
INSERT INTO `bs_system_log` VALUES ('179', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:28:48');
INSERT INTO `bs_system_log` VALUES ('180', '公告管理员', '登陆成功', '5', '123456', '192.168.174.1', '2019-05-18 11:32:39');
INSERT INTO `bs_system_log` VALUES ('181', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-18 11:35:13');
INSERT INTO `bs_system_log` VALUES ('182', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-25 22:36:32');
INSERT INTO `bs_system_log` VALUES ('183', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-25 22:36:32');
INSERT INTO `bs_system_log` VALUES ('184', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-25 22:36:34');
INSERT INTO `bs_system_log` VALUES ('185', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 10:39:42');
INSERT INTO `bs_system_log` VALUES ('186', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 10:39:42');
INSERT INTO `bs_system_log` VALUES ('187', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 13:23:43');
INSERT INTO `bs_system_log` VALUES ('188', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 13:23:44');
INSERT INTO `bs_system_log` VALUES ('189', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 14:16:40');
INSERT INTO `bs_system_log` VALUES ('190', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-26 14:24:39');
INSERT INTO `bs_system_log` VALUES ('191', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('192', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('193', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('194', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('195', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('196', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('197', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:35');
INSERT INTO `bs_system_log` VALUES ('198', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:50');
INSERT INTO `bs_system_log` VALUES ('199', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 15:49:50');
INSERT INTO `bs_system_log` VALUES ('200', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 16:22:48');
INSERT INTO `bs_system_log` VALUES ('201', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 16:28:43');
INSERT INTO `bs_system_log` VALUES ('202', '超级管理员', '登陆成功', '1', 'hello world', '192.168.174.1', '2019-05-31 16:29:53');

-- ----------------------------
-- Table structure for bs_tribune_notice
-- ----------------------------
DROP TABLE IF EXISTS `bs_tribune_notice`;
CREATE TABLE `bs_tribune_notice` (
  `tribune_notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `tribune_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tribune_notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_tribune_notice
-- ----------------------------
INSERT INTO `bs_tribune_notice` VALUES ('1', '18');
INSERT INTO `bs_tribune_notice` VALUES ('2', '19');
INSERT INTO `bs_tribune_notice` VALUES ('3', '20');
INSERT INTO `bs_tribune_notice` VALUES ('4', '21');
INSERT INTO `bs_tribune_notice` VALUES ('5', '22');
INSERT INTO `bs_tribune_notice` VALUES ('8', '81');
INSERT INTO `bs_tribune_notice` VALUES ('9', '82');

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) NOT NULL,
  `user_name` varchar(50) DEFAULT '',
  `user_sex` varchar(255) DEFAULT NULL,
  `user_real_name` varchar(50) DEFAULT NULL,
  `user_mycollect` int(255) DEFAULT NULL,
  `user_myfans` int(255) DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT 'http://localhost:8080/20190307091923etarn.jpeg',
  `user_myfocus` int(255) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_tel` varchar(12) DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_province` varchar(255) DEFAULT NULL,
  `user_city` varchar(255) DEFAULT NULL,
  `user_area` varchar(255) DEFAULT NULL,
  `user_register_time` date DEFAULT NULL,
  `user_using_state` int(255) DEFAULT NULL,
  `user_delete_state` int(255) DEFAULT '1',
  `user_show` varchar(1000) DEFAULT NULL,
  `user_login_time` datetime DEFAULT NULL,
  `user_mybirthday` varchar(255) DEFAULT NULL,
  `user_allmarks` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '123456789', 'hello world', '男', '刘建朋', '5', '5', 'http://localhost:8080/201905171735354tyjd.jpeg', '4', '123456789', '17611326269', 'liujianpenghb@163.com', '建国路95号博景苑45单元', '浙江省', '宁波市', '北仑区', '2018-07-09', '1', '1', '老骥伏枥，志在千里。烈士暮年，壮心不已，迎春指出，新甚至在，歌艺勇智。一二三四五六七八九十，上山打老虎，老虎不吃人，专吃小松鼠。一个和尚', '2019-05-31 16:29:52', '2018-07-09', '1117');
INSERT INTO `bs_user` VALUES ('2', '12345678', '12345678', '男', 'user', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', 'rrrrrrrr', '15899589590', '158@qq.com', '那个村儿', '北京市', '北京市', '丰台区', '2018-07-10', '1', '1', null, null, null, '1006');
INSERT INTO `bs_user` VALUES ('3', 'admin123', 'admin123', '男', 'admin', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', 'admin123', '15899589590', '158333@qq.com', 'gft', '北京市', '北京市', '大兴区', '2018-07-10', '1', '1', null, '2019-01-24 18:09:51', null, '1007');
INSERT INTO `bs_user` VALUES ('4', '1234567', '1234567', '男', '刘鹏涛', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '1234567', '15770085961', 'xjlpt@qq.com', 'jianguolu', '湖北省', '荆门市', '钟祥市', '2018-07-09', '1', '1', null, null, null, '1008');
INSERT INTO `bs_user` VALUES ('5', '123456', '123456', '男', 'hello', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '123456', '15833385791', '920846625@qq.com', 'ddsa', '内蒙古', '通辽市', '库伦镇', '2019-01-14', '1', '1', null, '2019-05-18 11:32:39', null, '1009');
INSERT INTO `bs_user` VALUES ('7', 'syyyyyy', 'yyyyyyy', '男', '黑糊糊黑糊糊的', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '8888888', '14688888888', 'ujujuj@qq.com', 'jianguolu', '北京市', '北京市', '大兴区', '2019-03-15', '1', '1', null, null, null, '111');
INSERT INTO `bs_user` VALUES ('8', 'wwwww', 'wwwww', '男', '大苏打实打实', '0', '0', 'http://localhost:8080/201903201605320k60u.jpeg', '0', '7777777', '18222222222', 'hhh@qq.com', 'jianguolu', '北京市', '北京市', '丰台区', '2019-03-15', '1', '1', null, null, null, '111');
INSERT INTO `bs_user` VALUES ('18', '99999@qq.com', '888888', '男', 'liu1', '0', '0', 'http://localhost:8080/20190307091923etarn.jpeg', '0', '66666666', '17611326269', '99999@qq.com', '建国路95号博景苑45单元', '河南省', '周口市', '淮阳县', '2019-05-17', '1', null, 'sssssssssssssssssssssss', '2019-05-17 19:24:05', '2019-05-14', '3');
INSERT INTO `bs_user` VALUES ('20', 'shengzhe', '方便大家', '男', 'fndsk', '1', '0', 'http://localhost:8080/20190307091923etarn.jpeg', '1', 'shengzhe', '17611326', 'shengzhe@qq.com', '建国路95号博景苑45单元', '山东省', '临沂市', '平邑镇', '2019-05-17', '1', '0', 'guigu', '2019-05-17 20:13:05', '2018-07-09', '10');

-- ----------------------------
-- Table structure for bs_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_user_role`;
CREATE TABLE `bs_user_role` (
  `user_role_id` int(60) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) DEFAULT NULL,
  `role_id` int(60) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bs_user_role
-- ----------------------------
INSERT INTO `bs_user_role` VALUES ('1', '1', '1', '1');
INSERT INTO `bs_user_role` VALUES ('2', '2', '3', '1');
INSERT INTO `bs_user_role` VALUES ('3', '3', '2', '1');
INSERT INTO `bs_user_role` VALUES ('6', '7', '5', '1');
INSERT INTO `bs_user_role` VALUES ('7', '5', '5', '1');
