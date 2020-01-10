/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : axf

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 10/01/2020 17:42:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add wheel', 7, 'add_wheel');
INSERT INTO `auth_permission` VALUES (20, 'Can change wheel', 7, 'change_wheel');
INSERT INTO `auth_permission` VALUES (21, 'Can delete wheel', 7, 'delete_wheel');
INSERT INTO `auth_permission` VALUES (22, 'Can add nav', 8, 'add_nav');
INSERT INTO `auth_permission` VALUES (23, 'Can change nav', 8, 'change_nav');
INSERT INTO `auth_permission` VALUES (24, 'Can delete nav', 8, 'delete_nav');
INSERT INTO `auth_permission` VALUES (25, 'Can add mustbuy', 9, 'add_mustbuy');
INSERT INTO `auth_permission` VALUES (26, 'Can change mustbuy', 9, 'change_mustbuy');
INSERT INTO `auth_permission` VALUES (27, 'Can delete mustbuy', 9, 'delete_mustbuy');
INSERT INTO `auth_permission` VALUES (28, 'Can add foodtypes', 10, 'add_foodtypes');
INSERT INTO `auth_permission` VALUES (29, 'Can change foodtypes', 10, 'change_foodtypes');
INSERT INTO `auth_permission` VALUES (30, 'Can delete foodtypes', 10, 'delete_foodtypes');
INSERT INTO `auth_permission` VALUES (31, 'Can add goods', 11, 'add_goods');
INSERT INTO `auth_permission` VALUES (32, 'Can change goods', 11, 'change_goods');
INSERT INTO `auth_permission` VALUES (33, 'Can delete goods', 11, 'delete_goods');
INSERT INTO `auth_permission` VALUES (34, 'Can add user', 12, 'add_user');
INSERT INTO `auth_permission` VALUES (35, 'Can change user', 12, 'change_user');
INSERT INTO `auth_permission` VALUES (36, 'Can delete user', 12, 'delete_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add cart', 13, 'add_cart');
INSERT INTO `auth_permission` VALUES (38, 'Can change cart', 13, 'change_cart');
INSERT INTO `auth_permission` VALUES (39, 'Can delete cart', 13, 'delete_cart');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$36000$O7orvKX1Xcay$fKT+cAsIlrA+DSZePSFtelbcJV0LWl5W1aZgfY2t+2s=', '2020-01-09 09:12:04.164486', 1, 'admin', '', '', 'han@163.com', 1, 1, '2019-12-25 05:12:22.405042');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$36000$wbvHLhHqGVSP$fb73SOjQ8WYOT7urcF+loKxI7cVuCMD96EwzsZZujLI=', '2020-01-07 03:18:46.572019', 1, 'mirshan', '', '', 'hanpeng@postemba.org.cn', 1, 1, '2020-01-07 03:17:31.795655');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for axf_cart
-- ----------------------------
DROP TABLE IF EXISTS `axf_cart`;
CREATE TABLE `axf_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(30) NOT NULL,
  `productid` int(11) NOT NULL,
  `productnum` int(11) NOT NULL,
  `productprice` double NOT NULL,
  `isChose` tinyint(1) NOT NULL,
  `productimg` varchar(30) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `orderid` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_cart
-- ----------------------------
BEGIN;
INSERT INTO `axf_cart` VALUES (82, 'mirshan', 4, 3, 180, 1, '/static/axf/market/img/21.png', '漂亮的水果', 0, 0);
INSERT INTO `axf_cart` VALUES (85, 'mirshan', 3, 2, 60, 1, '/static/axf/market/img/19.jpeg', '精制五花肉', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for axf_foodtypes
-- ----------------------------
DROP TABLE IF EXISTS `axf_foodtypes`;
CREATE TABLE `axf_foodtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL,
  `typename` varchar(50) NOT NULL,
  `childtypenames` varchar(50) NOT NULL,
  `typesort` int(11) NOT NULL,
  `idDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_foodtypes
-- ----------------------------
BEGIN;
INSERT INTO `axf_foodtypes` VALUES (1, 1, '鲜肉', '全部分类:0#猪肉:1#牛肉:2#其他:3', 0, 0);
INSERT INTO `axf_foodtypes` VALUES (2, 2, '新品尝鲜', '全部分类:0#新品:1#新品一:2', 1, 0);
INSERT INTO `axf_foodtypes` VALUES (3, 3, '优选水果', '全部分类:0#进口水果:1#国产水果:3', 2, 0);
INSERT INTO `axf_foodtypes` VALUES (4, 4, '牛奶面包', '全部分类:0#牛奶:1', 3, 0);
INSERT INTO `axf_foodtypes` VALUES (5, 5, '零食', '全部分类:0#零食:1', 4, 0);
INSERT INTO `axf_foodtypes` VALUES (6, 6, '生活用品', '全部分类:0#植物油:1#调料:2#卫生用品:3#工具:4', 5, 0);
COMMIT;

-- ----------------------------
-- Table structure for axf_goods
-- ----------------------------
DROP TABLE IF EXISTS `axf_goods`;
CREATE TABLE `axf_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `productimg` varchar(100) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productlongname` varchar(200) NOT NULL,
  `isxf` tinyint(1) NOT NULL,
  `pmdesc` int(11) NOT NULL,
  `specifics` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `marketprice` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `childcid` int(11) NOT NULL,
  `childcidname` varchar(50) NOT NULL,
  `dealerid` int(11) NOT NULL,
  `storenums` int(11) NOT NULL,
  `productnum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_goods
-- ----------------------------
BEGIN;
INSERT INTO `axf_goods` VALUES (1, 1, '/static/axf/market/img/18.png', '红烧肉', '大盘红烧肉', 0, 1, '1', 56, 80, 1, 1, '猪肉', 1, 8, 100);
INSERT INTO `axf_goods` VALUES (2, 2, '/static/axf/market/img/20.png', '蔬菜', '青菜', 0, 2, '2', 10, 8, 2, 2, '小青菜', 2, 1001, 999);
INSERT INTO `axf_goods` VALUES (3, 3, '/static/axf/market/img/19.jpeg', '五花肉', '精制五花肉', 0, 3, '3', 30, 40, 1, 3, '五花', 3, 495, 400);
INSERT INTO `axf_goods` VALUES (4, 4, '/static/axf/market/img/21.png', '水果1', '漂亮的水果', 0, 4, '4', 60, 90, 3, 4, 'childname', 4, 3997, 800);
INSERT INTO `axf_goods` VALUES (5, 5, '/static/axf/market/img/22.png', '面包', '小面包', 1, 5, '5', 10, 15, 4, 5, 'childname', 5, 11, 90);
COMMIT;

-- ----------------------------
-- Table structure for axf_mustbuy
-- ----------------------------
DROP TABLE IF EXISTS `axf_mustbuy`;
CREATE TABLE `axf_mustbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(150) NOT NULL,
  `name` varchar(20) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_mustbuy
-- ----------------------------
BEGIN;
INSERT INTO `axf_mustbuy` VALUES (1, '/static/axf/home/img/15.png', '必买1', '15', 0);
INSERT INTO `axf_mustbuy` VALUES (2, '/static/axf/home/img/16.png', '必买2', '16', 0);
INSERT INTO `axf_mustbuy` VALUES (3, '/static/axf/home/img/17.png', '必买3', '17', 0);
INSERT INTO `axf_mustbuy` VALUES (4, '/static/axf/home/img/18.png', '必买4', '18', 0);
COMMIT;

-- ----------------------------
-- Table structure for axf_nav
-- ----------------------------
DROP TABLE IF EXISTS `axf_nav`;
CREATE TABLE `axf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(150) NOT NULL,
  `name` varchar(20) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_nav
-- ----------------------------
BEGIN;
INSERT INTO `axf_nav` VALUES (1, '/static/axf/home/img/11.png', '肉类', '1', 0);
INSERT INTO `axf_nav` VALUES (2, '/static/axf/home/img/12.png', '蔬菜', '2', 0);
INSERT INTO `axf_nav` VALUES (3, '/static/axf/home/img/13.png', '水果', '3', 0);
INSERT INTO `axf_nav` VALUES (4, '/static/axf/home/img/14.png', '乳制品', '4', 0);
COMMIT;

-- ----------------------------
-- Table structure for axf_user
-- ----------------------------
DROP TABLE IF EXISTS `axf_user`;
CREATE TABLE `axf_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(20) NOT NULL,
  `userPasswd` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPhone` varchar(20) NOT NULL,
  `userAddress` varchar(100) NOT NULL,
  `userImg` varchar(150) NOT NULL,
  `userRank` int(11) NOT NULL,
  `userToken` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userAccount` (`userAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_user
-- ----------------------------
BEGIN;
INSERT INTO `axf_user` VALUES (17, 'mirshan', 'mirshan123', 'mirs', '13900000000', '北京', '/static/media/mirshan7088581376.png', 0, '1579314511.8639581');
INSERT INTO `axf_user` VALUES (18, '80808080', '80808080', '80808080', '80808080', '80808080', '/static/media/157836607410751658781.png', 0, '1579184094.1482291');
INSERT INTO `axf_user` VALUES (19, '999999999', '999999999', '999999999', '999999999', '999999999', '/static/media/157837855319153173788.png', 0, '1578888347.497099');
COMMIT;

-- ----------------------------
-- Table structure for axf_wheel
-- ----------------------------
DROP TABLE IF EXISTS `axf_wheel`;
CREATE TABLE `axf_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(150) NOT NULL,
  `name` varchar(20) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_wheel
-- ----------------------------
BEGIN;
INSERT INTO `axf_wheel` VALUES (1, '/static/axf/home/img/6.jpeg', '轮播1', '1', 0);
INSERT INTO `axf_wheel` VALUES (2, '/static/axf/home/img/7.jpeg', '轮播2', '2', 0);
INSERT INTO `axf_wheel` VALUES (3, '/static/axf/home/img/8.jpeg', '轮播3', '3', 0);
INSERT INTO `axf_wheel` VALUES (4, '/static/axf/home/img/9.jpeg', '轮播4', '4', 0);
INSERT INTO `axf_wheel` VALUES (6, '/static/axf/home/img/10.jpg', '轮播5', '5', 0);
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2020-01-07 04:23:18.674841', '2', 'Foodtypes object', 2, '[{\"changed\": {\"fields\": [\"childtypenames\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (2, '2020-01-07 04:23:53.793801', '2', 'Foodtypes object', 2, '[{\"changed\": {\"fields\": [\"childtypenames\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (3, '2020-01-07 06:26:04.707014', '16', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-01-07 06:26:04.715574', '15', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-01-07 06:26:04.719203', '14', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-01-07 06:26:04.723690', '13', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-01-07 06:26:04.726939', '12', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-01-07 06:26:04.728542', '11', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-01-07 06:26:04.730960', '10', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-01-07 06:26:04.732865', '9', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-01-07 06:26:04.734657', '8', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-01-07 06:26:04.738890', '7', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-01-07 06:26:04.740684', '6', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-01-07 06:26:04.744580', '5', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-01-07 06:26:04.748096', '4', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-01-07 06:26:04.750051', '3', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-01-07 06:26:04.751679', '2', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-01-07 06:26:04.755247', '1', 'User object', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-01-07 06:26:45.743451', '17', 'User object', 2, '[{\"changed\": {\"fields\": [\"userImg\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-01-08 06:56:08.409418', '17', 'User object', 2, '[{\"changed\": {\"fields\": [\"userImg\"]}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (21, '2020-01-08 07:00:52.081075', '2', 'Goods object', 2, '[{\"changed\": {\"fields\": [\"productimg\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-01-08 07:03:43.976880', '4', 'Goods object', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-01-08 08:36:31.303870', '4', 'Goods object', 2, '[{\"changed\": {\"fields\": [\"isxf\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-01-08 08:38:08.524970', '5', 'Goods object', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-01-09 09:12:32.967659', '5', 'Goods object', 2, '[{\"changed\": {\"fields\": [\"storenums\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-01-09 09:12:41.423710', '1', 'Goods object', 2, '[{\"changed\": {\"fields\": [\"storenums\"]}}]', 11, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (13, 'axf', 'cart');
INSERT INTO `django_content_type` VALUES (10, 'axf', 'foodtypes');
INSERT INTO `django_content_type` VALUES (11, 'axf', 'goods');
INSERT INTO `django_content_type` VALUES (9, 'axf', 'mustbuy');
INSERT INTO `django_content_type` VALUES (8, 'axf', 'nav');
INSERT INTO `django_content_type` VALUES (12, 'axf', 'user');
INSERT INTO `django_content_type` VALUES (7, 'axf', 'wheel');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-25 05:11:18.298929');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-25 05:11:19.015665');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-25 05:11:19.149355');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-25 05:11:19.218781');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-12-25 05:11:19.281192');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-12-25 05:11:19.308691');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-12-25 05:11:19.340820');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-12-25 05:11:19.351953');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-12-25 05:11:19.382845');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-12-25 05:11:19.384933');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-12-25 05:11:19.394038');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-12-25 05:11:19.417554');
INSERT INTO `django_migrations` VALUES (13, 'sessions', '0001_initial', '2019-12-25 05:11:19.484280');
INSERT INTO `django_migrations` VALUES (14, 'axf', '0001_initial', '2019-12-25 08:03:24.400100');
INSERT INTO `django_migrations` VALUES (15, 'axf', '0002_nav', '2019-12-26 06:54:20.389903');
INSERT INTO `django_migrations` VALUES (16, 'axf', '0003_mustbuy', '2019-12-26 08:34:29.730645');
INSERT INTO `django_migrations` VALUES (17, 'axf', '0004_foodtypes_goods', '2019-12-27 08:53:59.726582');
INSERT INTO `django_migrations` VALUES (18, 'axf', '0005_user', '2020-01-03 07:20:21.830790');
INSERT INTO `django_migrations` VALUES (19, 'axf', '0006_auto_20200103_1519', '2020-01-03 07:20:21.846781');
INSERT INTO `django_migrations` VALUES (20, 'axf', '0007_auto_20200109_0909', '2020-01-09 01:09:23.309898');
INSERT INTO `django_migrations` VALUES (21, 'axf', '0007_auto_20200109_0918', '2020-01-09 01:19:46.684767');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('aypp9ad7s9febz2x9fxxqkrgtf0neoks', 'MzQ3ZjI2MTVmNjRkZjIxNzIwMWQzYjM1NGQ5ZGZiNzcxYTkxYTY3Yjp7InVzZXJuYW1lIjoibWlycyIsInRva2VuIjoiMTU3OTMxNDUxMS44NjM5NTgxIiwidXNlckltZyI6Ii9zdGF0aWMvbWVkaWEvbWlyc2hhbjcwODg1ODEzNzYucG5nIn0=', '2020-01-24 09:18:08.873939');
INSERT INTO `django_session` VALUES ('cuefjpms13yx4yx9df4o67hgkhx5zxz3', 'NmEwYzQzMzI3YzI4YzVlMWRkMTEzYTA3OGRhODE0OWUwMDUxYjRkYzp7InVzZXJuYW1lIjoibWlycyIsInRva2VuIjoiMTU3ODY4NDc2OS4yNDIzNTYiLCJ1c2VySW1nIjoiL3N0YXRpYy9tZWRpYS9taXJzaGFuNzA4ODU4MTM3Ni5wbmcifQ==', '2020-01-24 07:12:17.284395');
INSERT INTO `django_session` VALUES ('ep3taijubbrrpdgetekzzr0hwbv95ufc', 'YWM5NzU2MjUwZTcwZWMxMTZhOTRmOTc1YzIzZTBiNjQzNDk2NjA5NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiODJjMzQ3NDg1OTRiY2FkZmRjMDY2YTk2Nzc5ODE5ZGM5ODQwMTZiIn0=', '2020-01-21 03:18:46.576193');
INSERT INTO `django_session` VALUES ('p1ptmey7ue4vll2rsggat20v1kd8kfvq', 'YmQzYzc4M2RlNTUyYTFhODdjZGI1ZDhkMTY2NjU4MDI1ZDg3MTUxYzp7InVzZXJuYW1lIjoiODA4MDgwODAiLCJ0b2tlbiI6IjE1NzkxODQwOTQuMTQ4MjI5MSIsInVzZXJJbWciOiIvc3RhdGljL21lZGlhLzE1NzgzNjYwNzQxMDc1MTY1ODc4MS5wbmcifQ==', '2020-01-21 03:01:14.194218');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
