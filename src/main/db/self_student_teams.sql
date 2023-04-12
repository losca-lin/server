/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : self_student_teams

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 11/04/2023 22:39:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_logs
-- ----------------------------
DROP TABLE IF EXISTS `active_logs`;
CREATE TABLE `active_logs` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '报名时间',
  `active_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动编号',
  `user_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '报名用户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `active_id` (`active_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `active_logs_ibfk_1` FOREIGN KEY (`active_id`) REFERENCES `activities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `active_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='报名记录';

-- ----------------------------
-- Records of active_logs
-- ----------------------------
BEGIN;
INSERT INTO `active_logs` (`id`, `create_time`, `active_id`, `user_id`) VALUES ('1680772016485', '2023-04-06 17:06:56', '1680772016395', '1672148602348');
INSERT INTO `active_logs` (`id`, `create_time`, `active_id`, `user_id`) VALUES ('1680773015205', '2023-04-06 17:23:35', '1680773015183', '1642422100001');
INSERT INTO `active_logs` (`id`, `create_time`, `active_id`, `user_id`) VALUES ('1680774517740', '2023-04-06 17:48:37', '1680773015183', '1675678467651');
INSERT INTO `active_logs` (`id`, `create_time`, `active_id`, `user_id`) VALUES ('1680774520842', '2023-04-06 17:48:40', '1680772016395', '1675678467651');
INSERT INTO `active_logs` (`id`, `create_time`, `active_id`, `user_id`) VALUES ('1680775130138', '2023-04-06 17:58:50', '1680775130123', '1672148602348');
COMMIT;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `comm` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动概述',
  `detail` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动详情',
  `ask` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动要求',
  `total` int NOT NULL COMMENT '报名人数',
  `active_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '活动时间',
  `team_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `team_id` (`team_id`) USING BTREE,
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='活动信息';

-- ----------------------------
-- Records of activities
-- ----------------------------
BEGIN;
INSERT INTO `activities` (`id`, `name`, `comm`, `detail`, `ask`, `total`, `active_time`, `team_id`) VALUES ('1680772016395', '悄悄内卷活动', '内卷，悄悄牛逼', '操场集合', '运动装', 2, '2023-04-12 15:00:00', '1680766113890');
INSERT INTO `activities` (`id`, `name`, `comm`, `detail`, `ask`, `total`, `active_time`, `team_id`) VALUES ('1680773015183', 'aaa', 'sa', 'sa', 'sa', 2, '2023-04-12 17:00:00', '1680766212345');
INSERT INTO `activities` (`id`, `name`, `comm`, `detail`, `ask`, `total`, `active_time`, `team_id`) VALUES ('1680775130123', 'fd', 'fds', 'fds', 'fds', 1, '2023-04-25 16:00:00', '1680766113890');
COMMIT;

-- ----------------------------
-- Table structure for apply_logs
-- ----------------------------
DROP TABLE IF EXISTS `apply_logs`;
CREATE TABLE `apply_logs` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `status` int NOT NULL COMMENT '处理状态',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `team_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '申请社团',
  `user_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `team_id` (`team_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `apply_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apply_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='申请记录';

-- ----------------------------
-- Records of apply_logs
-- ----------------------------
BEGIN;
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680774386289', 1, '2023-04-06 17:46:26', '1680766113890', '1675678467651');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680774390105', 1, '2023-04-06 17:46:30', '1680766212345', '1675678467651');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680775048619', 1, '2023-04-06 17:57:28', '1680767725131', '1680774995895');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680775052449', 1, '2023-04-06 17:57:32', '1680767714505', '1680774995895');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680775215044', 1, '2023-04-06 18:00:15', '1680766113890', '1680774995895');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680775218950', 1, '2023-04-06 18:00:18', '1680766212345', '1680774995895');
INSERT INTO `apply_logs` (`id`, `status`, `create_time`, `team_id`, `user_id`) VALUES ('1680775220813', 1, '2023-04-06 18:00:20', '1680771113886', '1680774995895');
COMMIT;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '入团时间',
  `team_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '加入社团',
  `user_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `team_id` (`team_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='成员信息';

-- ----------------------------
-- Records of members
-- ----------------------------
BEGIN;
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680766113911', '2023-04-06 15:28:33', '1680766113890', '1672148602348');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680766212368', '2023-04-06 15:30:12', '1680766212345', '1642422100001');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680767714522', '2023-04-06 15:55:14', '1680767714505', '1672148602348');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680767725150', '2023-04-06 15:55:25', '1680767725131', '1672148602348');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680771113907', '2023-04-06 16:51:53', '1680771113886', '1642422100001');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680774412584', '2023-04-06 17:46:52', '1680766113890', '1675678467651');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680774446881', '2023-04-06 17:47:26', '1680766212345', '1675678467651');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680775090214', '2023-04-06 17:58:10', '1680767714505', '1680774995895');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680775090737', '2023-04-06 17:58:10', '1680767725131', '1680774995895');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680775232746', '2023-04-06 18:00:32', '1680766113890', '1680774995895');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680775244827', '2023-04-06 18:00:44', '1680771113886', '1680774995895');
INSERT INTO `members` (`id`, `create_time`, `team_id`, `user_id`) VALUES ('1680775245665', '2023-04-06 18:00:45', '1680766212345', '1680774995895');
COMMIT;

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `detail` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '通知详情',
  `create_time` char(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '发布时间',
  `team_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='通知记录';

-- ----------------------------
-- Records of notices
-- ----------------------------
BEGIN;
INSERT INTO `notices` (`id`, `title`, `detail`, `create_time`, `team_id`) VALUES ('1672148823844', 'test', '测试', '2023-01-27', NULL);
INSERT INTO `notices` (`id`, `title`, `detail`, `create_time`, `team_id`) VALUES ('1675679243704', '1', '1', '2023-02-06', NULL);
INSERT INTO `notices` (`id`, `title`, `detail`, `create_time`, `team_id`) VALUES ('1680770911132', '停训周知', '因清明节假日，本周二和周四停训', '2023-04-06', NULL);
INSERT INTO `notices` (`id`, `title`, `detail`, `create_time`, `team_id`) VALUES ('1680772144326', '新活动已发布', '自愿报名参加', '2023-04-06', '1680767714505');
INSERT INTO `notices` (`id`, `title`, `detail`, `create_time`, `team_id`) VALUES ('1680773028294', 'sa', 'sa', '2023-04-06', '1680766212345');
COMMIT;

-- ----------------------------
-- Table structure for pay_logs
-- ----------------------------
DROP TABLE IF EXISTS `pay_logs`;
CREATE TABLE `pay_logs` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '缴费时间',
  `total` double NOT NULL COMMENT '缴纳费用',
  `team_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '收费社团',
  `user_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '缴费用户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `team_id` (`team_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `pay_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='缴费记录';

-- ----------------------------
-- Records of pay_logs
-- ----------------------------
BEGIN;
INSERT INTO `pay_logs` (`id`, `create_time`, `total`, `team_id`, `user_id`) VALUES ('1680774431898', '2023-04-06 17:47:11', 222, '1680766113890', '1675678467651');
INSERT INTO `pay_logs` (`id`, `create_time`, `total`, `team_id`, `user_id`) VALUES ('1680774459842', '2023-04-06 17:47:39', 21, '1680766212345', '1675678467651');
INSERT INTO `pay_logs` (`id`, `create_time`, `total`, `team_id`, `user_id`) VALUES ('1680775102416', '2023-04-06 17:58:22', 123, '1680766113890', '1680774995895');
COMMIT;

-- ----------------------------
-- Table structure for team_types
-- ----------------------------
DROP TABLE IF EXISTS `team_types`;
CREATE TABLE `team_types` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='社团类型';

-- ----------------------------
-- Records of team_types
-- ----------------------------
BEGIN;
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765458819', '击球员', '2023-04-06 15:17:38');
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765479716', '防守员', '2023-04-06 15:17:59');
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765519278', '守桩员', '2023-04-06 15:18:39');
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765524497', '裁判员', '2023-04-06 15:18:44');
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765529557', '宣传员', '2023-04-06 15:18:49');
INSERT INTO `team_types` (`id`, `name`, `create_time`) VALUES ('1680765538268', '财务', '2023-04-06 15:18:58');
COMMIT;

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '社团名称',
  `create_time` char(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '建立时间',
  `total` int NOT NULL COMMENT '社团人数',
  `manager` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '社团团长',
  `type_id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '社团编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `team_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='社团信息';

-- ----------------------------
-- Records of teams
-- ----------------------------
BEGIN;
INSERT INTO `teams` (`id`, `name`, `create_time`, `total`, `manager`, `type_id`) VALUES ('1680766113890', '第一小组', '2023-04-06', 3, '1672148602348', '1680765458819');
INSERT INTO `teams` (`id`, `name`, `create_time`, `total`, `manager`, `type_id`) VALUES ('1680766212345', '第二小组', '2023-04-06', 3, '1642422100001', '1680765458819');
INSERT INTO `teams` (`id`, `name`, `create_time`, `total`, `manager`, `type_id`) VALUES ('1680767714505', '第一小组', '2023-04-06', 2, '1672148602348', '1680765479716');
INSERT INTO `teams` (`id`, `name`, `create_time`, `total`, `manager`, `type_id`) VALUES ('1680767725131', '第一小组', '2023-04-06', 2, '1672148602348', '1680765519278');
INSERT INTO `teams` (`id`, `name`, `create_time`, `total`, `manager`, `type_id`) VALUES ('1680771113886', '第二小组', '2023-04-06', 2, '1642422100001', '1680765479716');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(13) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pass_word` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `gender` char(2) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户性别',
  `age` int DEFAULT NULL COMMENT '用户年龄',
  `phone` char(11) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `status` int NOT NULL COMMENT '信息状态',
  `create_time` char(19) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `type` int NOT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1642422100000', 'admin', 'admin', '壮哥', '男', 46, '90989192', '体育部', 1, '2023-01-17 20:00:00', 0);
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1642422100001', '123', '123', '大周', '女', 21, '90989193', '社会工作学院社会工作', 1, '2023-01-17 20:00:00', 1);
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1672148602348', '222', '222', '大涵', '女', 21, '110110', '社会工作学院社会工作', 1, '2023-01-27 21:43:22', 1);
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1675678467651', 'zs', '123456', 'zs', '女', 20, '15073171170', '管理学院会计学', 1, '2023-02-06 18:14:27', 2);
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1680773824441', '111', '111', 'zz', '女', 21, '111', '计算机系数字媒体技术', 1, '2023-04-06 17:37:04', 2);
INSERT INTO `users` (`id`, `user_name`, `pass_word`, `name`, `gender`, `age`, `phone`, `address`, `status`, `create_time`, `type`) VALUES ('1680774995895', 'xzh', 'xzh', 'xzh', '女', 88, '123123', '计算机系数字媒体技术', 1, '2023-04-06 17:56:35', 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
