/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 10.10.35.128:3306
 Source Schema         : platform

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 10/03/2020 17:28:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL DEFAULT 0 COMMENT '角色ID',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账户',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `login_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `secret_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '安全秘钥',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：停用',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  `created_id` int(0) NOT NULL COMMENT '创建管理ID',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建Ip',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登陆ip',
  `login_count` int(0) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_time` datetime(0) NOT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, '管理员', 'admin', 'eros', 'admin', '123456789', 1, '2020-02-21 14:05:21', '2020-03-02 20:27:44', 0, '120.0.0.1', '10.10.35.146', 681, '2020-03-10 16:08:44');
INSERT INTO `admin` VALUES (48, 1, '技术部', 'test001', 'allen', 'test001', '', 1, '2020-02-22 19:26:33', '2020-03-02 20:30:46', 1, '10.10.35.250', '10.10.35.250', 437, '2020-03-10 16:06:43');
INSERT INTO `admin` VALUES (54, 23, '测试', 'clear1', '', '111111', '', 1, '2020-03-03 10:56:58', '2020-03-03 10:56:58', 1, '10.10.35.146', '10.10.35.146', 113, '2020-03-09 13:50:14');
INSERT INTO `admin` VALUES (55, 1, '管理员', 'admin1', '', '111111', '', 1, '2020-03-03 11:43:14', '2020-03-04 13:44:04', 1, '10.10.35.146', '10.10.35.146', 43, '2020-03-09 19:24:55');
INSERT INTO `admin` VALUES (56, 1, '管理员', 'admin12', '', '222222', '', 1, '2020-03-03 11:43:20', '2020-03-03 11:43:20', 1, '10.10.35.146', '10.10.35.146', 0, '2020-03-03 11:43:20');
INSERT INTO `admin` VALUES (57, 1, '管理员', 'clear222', '', '222222', '', 1, '2020-03-03 11:43:55', '2020-03-03 11:43:55', 1, '10.10.35.146', '10.10.35.146', 0, '2020-03-03 11:43:55');
INSERT INTO `admin` VALUES (58, 1, '管理员', 'admin0', '', '111111', '', 1, '2020-03-03 12:47:08', '2020-03-03 12:47:08', 1, '10.10.35.250', '10.10.35.250', 0, '2020-03-03 12:47:08');

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '上级id',
  `joins` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'id路径',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限code',
  `permission_path` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '前端模板路径',
  `request_param` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方法:get,post,put,patch,options',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `type` tinyint(0) NOT NULL DEFAULT 2 COMMENT '菜单类型： 1：菜单 2：路由 3：按钮',
  `status` tinyint(0) NOT NULL DEFAULT 2 COMMENT '状态1：显示 2：隐藏',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者Ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES (1, 0, '', '权限树', 'www', '', 'OPTIONS', 0, 1, 1, '2020-03-02 13:50:39', '2020-03-02 13:50:41', '0.0.0.0');
INSERT INTO `admin_permission` VALUES (2, 1, '1', '系统管理', 'system', 'system', 'OPTIONS', 2, 1, 1, '2020-03-02 14:02:02', '2020-03-04 18:49:05', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (3, 2, '1,2', '权限列表', 'admin_permission', 'system/index', 'GET', 1, 2, 1, '2020-03-02 14:03:17', '2020-03-04 13:49:18', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (4, 2, '1,2', '添加权限', 'admin_permission', 'system/auth_add', 'POST', 4, 3, 1, '2020-03-02 14:04:34', '2020-03-04 12:34:10', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (5, 2, '1,2', '编辑权限', 'admin_permission', 'system/auth_edit', 'PUT', 5, 3, 1, '2020-03-02 14:18:10', '2020-03-04 12:34:20', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (6, 2, '1,2', '角色列表', 'admin_role', 'system/role_list', 'GET', 2, 2, 1, '2020-03-02 14:20:41', '2020-03-04 12:33:42', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (7, 2, '1,2', '添加角色', 'admin_role', 'system/role_add', 'POST', 6, 2, 2, '2020-03-02 14:22:28', '2020-03-04 12:34:30', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (8, 2, '1,2', '编辑角色', 'admin_role', 'system/role_edit', 'PUT', 7, 3, 1, '2020-03-02 14:23:11', '2020-03-04 12:34:44', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (9, 2, '1,2', '用户列表', 'admin', 'system/user_list', 'GET', 3, 2, 1, '2020-03-02 19:53:22', '2020-03-04 12:33:35', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (10, 2, '1,2', '用户详情（编辑）', 'admin', 'system/user_edit', 'GET', 9, 2, 2, '2020-03-02 20:05:59', '2020-03-04 12:36:42', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (11, 1, '1', '会员管理', 'site_user', 'member', 'OPTIONS', 3, 1, 1, '2020-03-03 14:01:03', '2020-03-04 11:50:24', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (12, 1, '1', '任务管理', 'site_task', 'task', 'OPTIONS', 4, 1, 1, '2020-03-03 14:02:11', '2020-03-04 11:50:36', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (13, 1, '1', '财务管理', 'money', 'money', 'GET', 5, 1, 1, '2020-03-03 14:02:59', '2020-03-04 18:42:33', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (14, 1, '1', '订单管理', 'bill', 'order', 'GET', 7, 1, 1, '2020-03-03 14:03:43', '2020-03-04 19:44:39', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (15, 1, '1', '报表管理', 'site_report', 'report', 'OPTIONS', 6, 1, 1, '2020-03-03 14:04:21', '2020-03-04 18:52:22', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (16, 1, '1', '控制台', 'site_console', 'dashboard', 'OPTIONS', 1, 1, 1, '2020-03-03 14:04:48', '2020-03-04 14:51:18', '10.10.35.250');
INSERT INTO `admin_permission` VALUES (17, 11, '1,11', '会员列表', 'user', 'member/index', 'GET', 1, 2, 1, '2020-03-03 15:10:26', '2020-03-04 13:49:46', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (18, 11, '1,11', '存款列表', 'user_deposit', 'member/deposit_list', 'GET', 3, 2, 1, '2020-03-03 16:25:27', '2020-03-04 12:29:59', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (19, 11, '1,11', '取款列表', 'user_withdraw', 'member/withdraw_list', 'GET', 4, 2, 1, '2020-03-03 16:28:30', '2020-03-04 12:31:30', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (20, 11, '1,11', '银行卡列表', 'user_bank', 'member/bank_list', 'GET', 5, 2, 1, '2020-03-03 18:12:51', '2020-03-08 11:12:42', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (21, 12, '1,12', '发布任务列表', 'task_publish', 'task/index', 'GET', 1, 2, 1, '2020-03-03 18:29:36', '2020-03-04 13:51:16', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (22, 12, '1,12', '接单任务列表', 'task_subscribe', 'task/subscribe_list', 'GET', 1, 2, 1, '2020-03-03 18:59:29', '2020-03-03 18:59:29', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (23, 12, '1,12', '任务类型列表', 'task', 'task/type_list', 'GET', 1, 2, 1, '2020-03-03 19:16:41', '2020-03-03 19:16:41', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (24, 12, '1,12', '创建任务类型', 'task', 'task/type_add', 'POST', 1, 3, 1, '2020-03-04 10:36:25', '2020-03-04 10:36:25', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (25, 2, '1,2', '添加用户', 'admin', 'system/user_add', 'POST', 8, 3, 1, '2020-03-04 12:36:18', '2020-03-04 12:36:33', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (26, 2, '1,2', '日志列表', 'site_admin_log', 'system/log_list', 'GET', 10, 2, 1, '2020-03-04 18:05:48', '2020-03-04 18:05:48', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (27, 1, '1', 'test2', 'test', 'test', 'GET', 8, 1, 1, '2020-03-04 19:45:21', '2020-03-05 11:58:40', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (28, 27, '1,27', 'aa', 'aa', 'test/index', 'GET', 1, 2, 1, '2020-03-04 20:21:15', '2020-03-05 10:25:36', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (29, 27, '1,27', 'bb', 'bb', 'test/test', 'GET', 2, 2, 1, '2020-03-04 20:45:16', '2020-03-09 14:57:59', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (30, 2, '1,2', '角色绑定权限', 'admin_role_permission', 'system/role_auth', 'PUT', 11, 3, 1, '2020-03-05 13:33:19', '2020-03-05 13:33:28', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (31, 2, '1,2', '支持银行卡列表', 'site_bank', 'system/bank_list', 'GET', 12, 2, 1, '2020-03-05 16:35:35', '2020-03-05 16:35:35', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (32, 11, '1,11', '会员详情', 'user_info', 'member/member_detail', 'GET', 2, 2, 2, '2020-03-08 11:12:06', '2020-03-08 11:12:06', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (33, 11, '1,11', '会员解/封禁', 'user', 'member/member_ban', 'PATCH', 2, 3, 1, '2020-03-09 10:40:49', '2020-03-09 10:40:49', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (34, 27, '1,27', '122', '12', 'test/test1', 'GET', 0, 2, 2, '2020-03-09 14:55:57', '2020-03-09 14:58:55', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (35, 2, '1,2', '配置类型', 'site_configs_type', 'system/configType_list', 'GET', 13, 2, 1, '2020-03-09 18:56:12', '2020-03-09 18:56:12', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (36, 2, '1,2', '添加配置类型', 'site_configs_type', 'system/configType_add', 'POST', 14, 3, 1, '2020-03-09 19:41:31', '2020-03-09 19:41:31', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (37, 2, '1,2', '编辑配置类型', 'site_configs_type', 'system/configType_edit', 'POST', 15, 3, 1, '2020-03-09 19:41:52', '2020-03-09 19:41:52', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (38, 2, '1,2', '配置列表', 'site_configs', 'system/config_list', 'GET', 17, 2, 1, '2020-03-09 19:46:19', '2020-03-10 15:49:35', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (39, 2, '1,2', '添加配置', 'site_configs', 'system/config_add', 'POST', 18, 3, 1, '2020-03-10 15:46:03', '2020-03-10 15:50:57', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (40, 2, '1,2', '编辑配置', 'site_configs', 'system/config_edit', 'PUT', 19, 3, 1, '2020-03-10 15:46:24', '2020-03-10 15:51:05', '10.10.35.146');
INSERT INTO `admin_permission` VALUES (41, 2, '1,2', '配置类型遍历', 'site_type_config', 'system/configType_detail', 'GET', 16, 2, 2, '2020-03-10 15:47:36', '2020-03-10 15:47:36', '10.10.35.146');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色代号',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '1:启用 2：禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `created_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建Ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '管理员', '', 1, '21', '2020-02-25 15:27:17', '2020-03-02 19:52:10', '10.10.35.250');
INSERT INTO `admin_role` VALUES (2, '技术部', '', 1, 'go12', '2020-02-25 15:28:20', '2020-03-10 11:33:59', '10.10.35.250');
INSERT INTO `admin_role` VALUES (22, '角色管理', '', 1, '11', '2020-02-29 17:53:57', '2020-03-02 18:18:10', '10.10.35.250');
INSERT INTO `admin_role` VALUES (23, '测试', '', 1, '', '2020-03-03 10:54:53', '2020-03-10 11:33:44', '10.10.35.146');

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL COMMENT '角色Id',
  `permission_ids` json NOT NULL COMMENT '权限Id',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '状态：1:启用 2：禁用',
  `module` json NULL COMMENT '字段权限补充',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES (2, 2, '[{\"id\": 2}, {\"id\": 3}]', NULL, 1, '{}');
INSERT INTO `admin_role_permission` VALUES (11, 23, '[{\"id\": 17}, {\"id\": 33}, {\"id\": 32}, {\"id\": 11}]', NULL, 1, '{}');
INSERT INTO `admin_role_permission` VALUES (12, 22, '[{\"id\": 3}, {\"id\": 2}]', NULL, 1, '{}');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '账变类型(1:加钱 2:扣钱)',
  `operate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金',
  `src` int(0) NULL DEFAULT 0 COMMENT '来源ID，默认为系统：0',
  `role` tinyint(0) NOT NULL DEFAULT 1 COMMENT '账变角色 ',
  `amount` int(0) NOT NULL COMMENT '交易金额',
  `before_amount` int(0) NOT NULL COMMENT '变动前金额',
  `after_amount` int(0) NOT NULL COMMENT '变动后金额',
  `desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '账变描述',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账单流水表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 100101001, '', '', 1, 4, 0, 1, 294, 0, 0, '', '2020-03-05 14:56:05', '2020-03-05 14:56:05');
INSERT INTO `bill` VALUES (2, 100101001, '', '', 2, 4, 0, 1, 463, 0, 0, '', '2020-03-05 14:56:27', '2020-03-05 14:56:27');
INSERT INTO `bill` VALUES (3, 100101001, '', '', 2, 5, 0, 1, 2643, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (4, 100101001, '', '', 2, 5, 0, 1, 1602, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (5, 100101001, '', '', 1, 1, 0, 1, 1015, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (6, 100101001, '', '', 2, 2, 0, 1, 164, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (7, 100101001, '', '', 1, 5, 0, 2, 335, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (8, 100101001, '', '', 2, 6, 0, 2, 2940, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (9, 100101001, '', '', 2, 3, 0, 2, 2577, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (10, 100101001, '', '', 2, 6, 0, 1, 2150, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (11, 100101001, '', '', 1, 1, 0, 1, 1183, 0, 0, '', '2020-03-05 14:56:28', '2020-03-05 14:56:28');
INSERT INTO `bill` VALUES (12, 100101002, '', '', 2, 6, 0, 1, 1471, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (13, 100101002, '', '', 1, 6, 0, 2, 926, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (14, 100101002, '', '', 2, 4, 0, 1, 1168, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (15, 100101002, '', '', 1, 1, 0, 2, 2326, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (16, 100101002, '', '', 2, 2, 0, 1, 1012, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (17, 100101002, '', '', 1, 5, 0, 2, 1530, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (18, 100101002, '', '', 1, 2, 0, 2, 1951, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (19, 100101002, '', '', 1, 1, 0, 2, 997, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (20, 100101002, '', '', 1, 1, 0, 1, 2433, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (21, 100101002, '', '', 2, 3, 0, 1, 516, 0, 0, '', '2020-03-05 19:08:12', '2020-03-05 19:08:12');
INSERT INTO `bill` VALUES (22, 100101002, '', '', 1, 5, 0, 1, 2654, 0, 0, '', '2020-03-06 11:22:19', '2020-03-06 11:22:19');
INSERT INTO `bill` VALUES (23, 100101002, '', '', 1, 4, 0, 1, 1970, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (24, 100101002, '', '', 1, 4, 0, 1, 408, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (25, 100101002, '', '', 2, 3, 0, 1, 1672, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (26, 100101002, '', '', 2, 1, 0, 2, 1808, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (27, 100101002, '', '', 1, 4, 0, 2, 199, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (28, 100101002, '', '', 1, 1, 0, 1, 2001, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (29, 100101002, '', '', 1, 6, 0, 1, 328, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (30, 100101002, '', '', 2, 1, 0, 2, 1062, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (31, 100101002, '', '', 2, 1, 0, 2, 1795, 0, 0, '', '2020-03-06 11:22:20', '2020-03-06 11:22:20');
INSERT INTO `bill` VALUES (32, 100101003, '', '', 2, 1, 0, 1, 446, 0, 0, '', '2020-03-06 11:22:38', '2020-03-06 11:22:38');
INSERT INTO `bill` VALUES (33, 100101003, '', '', 1, 2, 0, 1, 2947, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (34, 100101003, '', '', 1, 2, 0, 2, 727, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (35, 100101003, '', '', 2, 4, 0, 1, 1729, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (36, 100101003, '', '', 1, 3, 0, 2, 2211, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (37, 100101003, '', '', 1, 6, 0, 2, 2002, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (38, 100101003, '', '', 1, 6, 0, 2, 1542, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (39, 100101003, '', '', 2, 4, 0, 2, 2947, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (40, 100101003, '', '', 1, 2, 0, 2, 225, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (41, 100101003, '', '', 2, 6, 0, 1, 2809, 0, 0, '', '2020-03-06 11:22:40', '2020-03-06 11:22:40');
INSERT INTO `bill` VALUES (42, 100101006, '', '', 2, 6, 0, 1, 1, 0, 0, '', '2020-03-06 11:22:47', '2020-03-06 11:22:47');
INSERT INTO `bill` VALUES (43, 100101006, '', '', 2, 3, 0, 1, 2679, 0, 0, '', '2020-03-06 11:22:47', '2020-03-06 11:22:47');
INSERT INTO `bill` VALUES (44, 100101006, '', '', 2, 6, 0, 2, 978, 0, 0, '', '2020-03-06 11:22:47', '2020-03-06 11:22:47');
INSERT INTO `bill` VALUES (45, 100101006, '', '', 2, 1, 0, 1, 2488, 0, 0, '', '2020-03-06 11:22:47', '2020-03-06 11:22:47');
INSERT INTO `bill` VALUES (46, 100101006, '', '', 1, 2, 0, 2, 254, 0, 0, '', '2020-03-06 11:22:47', '2020-03-06 11:22:47');
INSERT INTO `bill` VALUES (47, 100101006, '', '', 1, 6, 0, 1, 2826, 0, 0, '', '2020-03-06 11:22:48', '2020-03-06 11:22:48');
INSERT INTO `bill` VALUES (48, 100101006, '', '', 1, 1, 0, 1, 1416, 0, 0, '', '2020-03-06 11:22:48', '2020-03-06 11:22:48');
INSERT INTO `bill` VALUES (49, 100101006, '', '', 2, 1, 0, 1, 2704, 0, 0, '', '2020-03-06 11:22:48', '2020-03-06 11:22:48');
INSERT INTO `bill` VALUES (50, 100101006, '', '', 2, 1, 0, 1, 1993, 0, 0, '', '2020-03-06 11:22:48', '2020-03-06 11:22:48');
INSERT INTO `bill` VALUES (51, 100101006, '', '', 2, 6, 0, 1, 1984, 0, 0, '', '2020-03-06 11:22:48', '2020-03-06 11:22:48');
INSERT INTO `bill` VALUES (52, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:39:06', '2020-03-09 14:39:06');
INSERT INTO `bill` VALUES (53, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:39:06', '2020-03-09 14:39:06');
INSERT INTO `bill` VALUES (54, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:39:49', '2020-03-09 14:39:49');
INSERT INTO `bill` VALUES (55, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:39:49', '2020-03-09 14:39:49');
INSERT INTO `bill` VALUES (56, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:39:55', '2020-03-09 14:39:55');
INSERT INTO `bill` VALUES (57, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:39:55', '2020-03-09 14:39:55');
INSERT INTO `bill` VALUES (58, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:41:00', '2020-03-09 14:41:00');
INSERT INTO `bill` VALUES (59, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:41:00', '2020-03-09 14:41:00');
INSERT INTO `bill` VALUES (60, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:45:55', '2020-03-09 14:45:55');
INSERT INTO `bill` VALUES (61, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:45:55', '2020-03-09 14:45:55');
INSERT INTO `bill` VALUES (62, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:47:48', '2020-03-09 14:47:48');
INSERT INTO `bill` VALUES (63, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, -8889, -28889, '人工扣款', '2020-03-09 14:47:48', '2020-03-09 14:47:48');
INSERT INTO `bill` VALUES (64, 100101001, '', '13294137777', 1, 2, 0, 1, 20000, 51111, 31111, '人工加款', '2020-03-09 14:48:42', '2020-03-09 14:48:42');
INSERT INTO `bill` VALUES (65, 100101001, '', '13294137777', 1, 2, 0, 1, 10000, 51111, 41111, '人工加款', '2020-03-09 14:54:25', '2020-03-09 14:54:25');
INSERT INTO `bill` VALUES (66, 100101001, '', '13294137777', 1, 2, 0, 1, 10002, 61115, 51113, '人工加款', '2020-03-09 14:54:41', '2020-03-09 14:54:41');
INSERT INTO `bill` VALUES (67, 100101001, '', '13294137777', 1, 2, 0, 1, 10002, 71117, 61115, '人工加款', '2020-03-09 15:14:57', '2020-03-09 15:14:57');
INSERT INTO `bill` VALUES (68, 100101001, '', '13294137777', 2, 2, 0, 1, 20000, 21115, 1115, '人工扣款', '2020-03-09 15:15:15', '2020-03-09 15:15:15');
INSERT INTO `bill` VALUES (69, 100101001, '', '13294137777', 2, 2, 0, 1, 10011, 21093, 11082, '人工扣款', '2020-03-09 15:15:34', '2020-03-09 15:15:34');
INSERT INTO `bill` VALUES (70, 100101001, '', '13294137777', 1, 2, 0, 1, 1724127968, -846680256, 1724159072, '人工加款', '2020-03-09 15:42:16', '2020-03-09 15:42:16');
INSERT INTO `bill` VALUES (71, 100101002, 'test_name', '13111111111', 1, 2, 0, 1, 100, 422, 322, '人工加款', '2020-03-09 15:52:44', '2020-03-09 15:52:44');
INSERT INTO `bill` VALUES (72, 100101002, 'test_name', '13111111111', 1, 2, 0, 1, 100, 522, 422, '人工加款', '2020-03-09 15:53:27', '2020-03-09 15:53:27');

-- ----------------------------
-- Table structure for site_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `site_admin_log`;
CREATE TABLE `site_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `level` tinyint(0) NOT NULL DEFAULT 1 COMMENT '日志等级 1:普通 2：警告 3：严重',
  `module` tinyint(0) NOT NULL COMMENT '模块',
  `action` tinyint(0) NOT NULL DEFAULT 1 COMMENT '行为：1:create，2:update，3:delete，4:select，5:other',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `action_admin_id` int(0) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `action_admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员账户',
  `action_user_id` int(0) NOT NULL DEFAULT 0 COMMENT '被操作人ID',
  `action_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '被操作人账户',
  `action_admin_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作者ip',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_admin_log
-- ----------------------------
INSERT INTO `site_admin_log` VALUES (9, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 16:15:55.6548356 +0800 CST m=+80.237670401, 第 238 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 16:15:56');
INSERT INTO `site_admin_log` VALUES (10, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 17:01:06.3292721 +0800 CST m=+2790.451215301, 第 239 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:01:06');
INSERT INTO `site_admin_log` VALUES (11, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 17:23:10.5966503 +0800 CST m=+4114.718593501, 第 240 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:23:11');
INSERT INTO `site_admin_log` VALUES (12, 2, 1, 1, '管理员', '{\"id\":0,\"role_id\":2,\"role_name\":\"技术部\",\"account\":\"clear77\",\"nick_name\":\"\",\"login_password\":\"111111\",\"secret_key\":\"\",\"status\":1,\"created_at\":\"2020-02-29T17:23:27.3940396+08:00\",\"updated_at\":\"2020-02-29T17:23:27.3940396+08:00\",\"created_id\":1,\"created_ip\":\"10.10.35.146\",\"last_login_ip\":\"10.10.35.146\",\"login_count\":0,\"last_login_time\":\"2020-02-29T17:23:27.3940396+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:23:27');
INSERT INTO `site_admin_log` VALUES (13, 2, 1, 2, '管理员', '{\"id\":52,\"role_id\":2,\"login_password\":\"111111\",\"status\":1,\"updated_at\":\"2020-02-29T17:24:02.3690161+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:24:02');
INSERT INTO `site_admin_log` VALUES (14, 1, 1, 2, '角色管理', '{\"id\":1,\"status\":1,\"role_name\":\"管理员1\",\"remark\":\"21\",\"updated_at\":\"2020-02-29T17:31:16.0146976+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:31:16');
INSERT INTO `site_admin_log` VALUES (15, 1, 1, 1, '角色管理', '{\"id\":0,\"role_name\":\"dd\",\"role_code\":\"\",\"status\":1,\"remark\":\"\",\"created_at\":\"2020-02-29T17:34:42.3199772+08:00\",\"updated_at\":\"2020-02-29T17:34:42.3199772+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:34:42');
INSERT INTO `site_admin_log` VALUES (16, 2, 1, 2, '权限控制', '{\"role_id\":21,\"permission_ids\":\"[{\\\"id\\\":13},{\\\"id\\\":9}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:34:51');
INSERT INTO `site_admin_log` VALUES (17, 2, 1, 2, '权限控制', '{\"role_id\":21,\"permission_ids\":\"[{\\\"id\\\":13},{\\\"id\\\":9}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 17:34:59');
INSERT INTO `site_admin_log` VALUES (18, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 17:41:39.9501307 +0800 CST m=+8672.186734201, 第 %!d(string={\"permission\":[{\"id\":5,\"parent_id\":3,\"joins\":\"\",\"permission_name\":\"权限管理\",\"permission_code\":\"admin_permission\",\"request_param\":\"\",\"sort\":0,\"type\":1,\"status\":1},{\"id\":6,\"parent_id\":5,\"joins\":\"\",\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"request_param\":\"POST\",\"sort\":0,\"type\":2,\"status\":1},{\"id\":19,\"parent_id\":5,\"joins\":\"\",\"permission_name\":\"修改权限\",\"permission_code\":\"admin_permission\",\"request_param\":\"PUT\",\"sort\":0,\"type\":2,\"status\":1}],\"service_time\":1582969299,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgyOTcyODk5LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.fsvBmvn1QcY6DCDLceSy5gLuBbCKBPwL_VWgFnz9QDE\"}) 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 17:41:40');
INSERT INTO `site_admin_log` VALUES (19, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 17:41:59.8445831 +0800 CST m=+8692.081186601, 第 %!d(string={\"permission\":null,\"service_time\":1582969319,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgyOTcyOTE5LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.aGYBcdWBXbuPNti9X1XxZairiDRJB-Mx7duoL-j2v6I\"}) 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 17:42:00');
INSERT INTO `site_admin_log` VALUES (20, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 17:42:44.1945292 +0800 CST m=+8736.431132701, 第 %!d(string={\"permission\":null,\"service_time\":1582969364,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgyOTcyOTY0LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.V0DmqW4TGF-LYvHIA5E8DYiOvYKaEhm0bvmyHJq8Cqc\"}) 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 17:42:44');
INSERT INTO `site_admin_log` VALUES (21, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 17:44:02.757535 +0800 CST m=+5366.863668601, 第 241 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 17:44:03');
INSERT INTO `site_admin_log` VALUES (22, 1, 1, 1, '角色管理', '{\"id\":0,\"role_name\":\"角色管理\",\"role_code\":\"\",\"status\":1,\"remark\":\"11\",\"created_at\":\"2020-02-29T17:53:57.2858254+08:00\",\"updated_at\":\"2020-02-29T17:53:57.2858254+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 17:53:57');
INSERT INTO `site_admin_log` VALUES (23, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":3,\"joins\":\"1,3\",\"permission_name\":\"角色管理列表\",\"permission_code\":\"admin_role\",\"request_param\":\"POST\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T17:57:16.6284937+08:00\",\"updated_at\":\"2020-02-29T17:57:16.6284937+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 17:57:17');
INSERT INTO `site_admin_log` VALUES (24, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:01:46.1974862 +0800 CST m=+6430.303619801, 第 242 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 18:01:46');
INSERT INTO `site_admin_log` VALUES (25, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:01:48.0154116 +0800 CST m=+6432.121545201, 第 243 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 18:01:48');
INSERT INTO `site_admin_log` VALUES (26, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 18:13:09.6090384 +0800 CST m=+16.225388401, 第 232 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 18:13:10');
INSERT INTO `site_admin_log` VALUES (27, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":23,\"joins\":\"1,23\",\"permission_name\":\"aaa\",\"permission_code\":\"bb\",\"request_param\":\"GET\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:14:19.2596034+08:00\",\"updated_at\":\"2020-02-29T18:14:19.2596034+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 18:14:19');
INSERT INTO `site_admin_log` VALUES (28, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:14:53.2138308 +0800 CST m=+7217.319964401, 第 244 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:14:53');
INSERT INTO `site_admin_log` VALUES (29, 2, 1, 2, '权限管理', '{\"id\":26,\"parent_id\":3,\"permission_name\":\"角色管理列表\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,3\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:15:25.7006002+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:15:26');
INSERT INTO `site_admin_log` VALUES (30, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":3,\"joins\":\"1,3\",\"permission_name\":\"添加角色管理\",\"permission_code\":\"admin_role\",\"request_param\":\"POST\",\"sort\":2,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:15:53.8904209+08:00\",\"updated_at\":\"2020-02-29T18:15:53.8904209+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:15:54');
INSERT INTO `site_admin_log` VALUES (31, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":3,\"joins\":\"1,3\",\"permission_name\":\"更新角色\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:18:03.4116697+08:00\",\"updated_at\":\"2020-02-29T18:18:03.4116697+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:18:03');
INSERT INTO `site_admin_log` VALUES (32, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":3,\"joins\":\"1,3\",\"permission_name\":\"角色绑定权限\",\"permission_code\":\"admin_role_maps\",\"request_param\":\"GET\",\"sort\":2,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:19:27.6777419+08:00\",\"updated_at\":\"2020-02-29T18:19:27.6777419+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:19:28');
INSERT INTO `site_admin_log` VALUES (33, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:20:14.4763796 +0800 CST m=+329.964643501, 第 1 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:20:14');
INSERT INTO `site_admin_log` VALUES (34, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":24},{\\\"id\\\":25}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:21:36');
INSERT INTO `site_admin_log` VALUES (35, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:22:00.8534646 +0800 CST m=+7644.959598201, 第 2 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:22:01');
INSERT INTO `site_admin_log` VALUES (36, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:22:01.0390614 +0800 CST m=+7645.145195001, 第 2 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:22:01');
INSERT INTO `site_admin_log` VALUES (37, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:23:03.6334506 +0800 CST m=+499.121714501, 第 3 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:23:04');
INSERT INTO `site_admin_log` VALUES (38, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:23:53.379889 +0800 CST m=+548.868152901, 第 4 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:23:53');
INSERT INTO `site_admin_log` VALUES (39, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:24:02.6969731 +0800 CST m=+7766.803106701, 第 245 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:24:03');
INSERT INTO `site_admin_log` VALUES (40, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":24},{\\\"id\\\":25},{\\\"id\\\":26},{\\\"id\\\":3}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:24:17');
INSERT INTO `site_admin_log` VALUES (41, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:24:27.9727489 +0800 CST m=+583.461012801, 第 5 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:24:28');
INSERT INTO `site_admin_log` VALUES (42, 1, 2, 5, '登陆', '管理员: test00111, 在 2020-02-29 18:29:42.0924468 +0800 CST m=+897.580710701, 第 6 次登陆', 51, 'test00111', 0, '', '10.10.35.250', '2020-02-29 18:29:42');
INSERT INTO `site_admin_log` VALUES (43, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 18:30:46.1035226 +0800 CST m=+961.591786501, 第 233 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 18:30:46');
INSERT INTO `site_admin_log` VALUES (44, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:31:08.7781005 +0800 CST m=+984.266364401, 第 246 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:31:09');
INSERT INTO `site_admin_log` VALUES (45, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:34:36.9025138 +0800 CST m=+8401.008647401, 第 247 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:34:37');
INSERT INTO `site_admin_log` VALUES (46, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"系统管理\",\"permission_code\":\"site_system\",\"request_param\":\"OPTIONS\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:36:16.671499+08:00\",\"updated_at\":\"2020-02-29T18:36:16.671499+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:36:17');
INSERT INTO `site_admin_log` VALUES (47, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"request_param\":\"GET\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:39:14.8709464+08:00\",\"updated_at\":\"2020-02-29T18:39:14.8709464+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:39:15');
INSERT INTO `site_admin_log` VALUES (48, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"request_param\":\"POST\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:40:47.3623457+08:00\",\"updated_at\":\"2020-02-29T18:40:47.3623457+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:40:47');
INSERT INTO `site_admin_log` VALUES (49, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"更新角色\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"sort\":2,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:41:14.3434297+08:00\",\"updated_at\":\"2020-02-29T18:41:14.3434297+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:41:14');
INSERT INTO `site_admin_log` VALUES (50, 2, 1, 2, '权限管理', '{\"id\":33,\"parent_id\":31,\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:41:24.8953433+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:41:25');
INSERT INTO `site_admin_log` VALUES (51, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"角色下属权限\",\"permission_code\":\"admin_role_maps\",\"request_param\":\"POST\",\"sort\":0,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:43:15.6826535+08:00\",\"updated_at\":\"2020-02-29T18:43:15.6826535+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:43:16');
INSERT INTO `site_admin_log` VALUES (52, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"site_system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:44:31.0251298+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:44:31');
INSERT INTO `site_admin_log` VALUES (53, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:47:11.921113 +0800 CST m=+15.811779101, 第 248 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:47:12');
INSERT INTO `site_admin_log` VALUES (54, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:47:16.8632973 +0800 CST m=+20.753963401, 第 249 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:47:17');
INSERT INTO `site_admin_log` VALUES (55, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 18:47:48.5622355 +0800 CST m=+52.452901601, 第 250 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:47:49');
INSERT INTO `site_admin_log` VALUES (56, 2, 1, 2, '权限管理', '{\"id\":33,\"parent_id\":31,\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:47:59.4351445+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:47:59');
INSERT INTO `site_admin_log` VALUES (57, 2, 1, 2, '权限管理', '{\"id\":34,\"parent_id\":31,\"permission_name\":\"更新角色\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":2,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:48:16.0253181+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:48:16');
INSERT INTO `site_admin_log` VALUES (58, 2, 1, 2, '权限管理', '{\"id\":32,\"parent_id\":31,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:48:40.34722+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:48:40');
INSERT INTO `site_admin_log` VALUES (59, 2, 1, 2, '权限管理', '{\"id\":32,\"parent_id\":31,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:49:24.149152+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:49:24');
INSERT INTO `site_admin_log` VALUES (60, 2, 1, 2, '权限管理', '{\"id\":35,\"parent_id\":31,\"permission_name\":\"角色下属权限\",\"permission_code\":\"admin_role_maps\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":0,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:49:45.3337039+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:49:45');
INSERT INTO `site_admin_log` VALUES (61, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"site_system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:53:08.5064222+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:53:09');
INSERT INTO `site_admin_log` VALUES (62, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"site_system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T18:53:17.5369457+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:53:18');
INSERT INTO `site_admin_log` VALUES (63, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"request_param\":\"GET\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T18:54:25.5712631+08:00\",\"updated_at\":\"2020-02-29T18:54:25.5712631+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:54:26');
INSERT INTO `site_admin_log` VALUES (64, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"request_param\":\"POST\",\"sort\":2,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:55:32.455798+08:00\",\"updated_at\":\"2020-02-29T18:55:32.455798+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:55:32');
INSERT INTO `site_admin_log` VALUES (65, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"更新权限\",\"permission_code\":\"admin_permission\",\"request_param\":\"PUT\",\"sort\":2,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T18:56:23.5199157+08:00\",\"updated_at\":\"2020-02-29T18:56:23.5199157+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 18:56:24');
INSERT INTO `site_admin_log` VALUES (66, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"request_param\":\"OPTIONS\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T19:00:19.4124842+08:00\",\"updated_at\":\"2020-02-29T19:00:19.4124842+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:00:19');
INSERT INTO `site_admin_log` VALUES (67, 2, 1, 2, '权限管理', '{\"id\":39,\"parent_id\":1,\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-02-29T19:00:37.9115861+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:00:38');
INSERT INTO `site_admin_log` VALUES (68, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"任务管理\",\"permission_code\":\"site_task\",\"request_param\":\"OPTIONS\",\"sort\":2,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T19:01:16.75083+08:00\",\"updated_at\":\"2020-02-29T19:01:16.75083+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:01:17');
INSERT INTO `site_admin_log` VALUES (69, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"发布任务\",\"permission_code\":\"site_task_publish\",\"request_param\":\"OPTIONS\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T19:04:38.3902998+08:00\",\"updated_at\":\"2020-02-29T19:04:38.3902998+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:04:38');
INSERT INTO `site_admin_log` VALUES (70, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"接单任务\",\"permission_code\":\"site_task_subscribe\",\"request_param\":\"OPTIONS\",\"sort\":4,\"type\":1,\"status\":1,\"created_at\":\"2020-02-29T19:05:20.1983226+08:00\",\"updated_at\":\"2020-02-29T19:05:20.1983226+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:05:20');
INSERT INTO `site_admin_log` VALUES (71, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":31,\"joins\":\"1,31\",\"permission_name\":\"权限绑定\",\"permission_code\":\"admin_role_permission\",\"request_param\":\"PUT\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-02-29T19:06:29.423385+08:00\",\"updated_at\":\"2020-02-29T19:06:29.423385+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:06:29');
INSERT INTO `site_admin_log` VALUES (72, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:08:09.6079476 +0800 CST m=+1273.498613701, 第 251 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:08:10');
INSERT INTO `site_admin_log` VALUES (73, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:08:10.8157814 +0800 CST m=+1274.706447501, 第 252 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:08:11');
INSERT INTO `site_admin_log` VALUES (74, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:08:59.2781498 +0800 CST m=+1323.168815901, 第 253 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:08:59');
INSERT INTO `site_admin_log` VALUES (75, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-02-29T19:10:23.9817879+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:10:24');
INSERT INTO `site_admin_log` VALUES (76, 1, 1, 2, '角色管理', '{\"id\":22,\"status\":1,\"role_name\":\"角色管理\",\"remark\":\"11\",\"updated_at\":\"2020-02-29T19:11:21.1660871+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:11:21');
INSERT INTO `site_admin_log` VALUES (77, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":31},{\\\"id\\\":35},{\\\"id\\\":32},{\\\"id\\\":33},{\\\"id\\\":36},{\\\"id\\\":43},{\\\"id\\\":34},{\\\"id\\\":37},{\\\"id\\\":38},{\\\"id\\\":39},{\\\"id\\\":41},{\\\"id\\\":40},{\\\"id\\\":42}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:12:07');
INSERT INTO `site_admin_log` VALUES (78, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":31},{\\\"id\\\":35},{\\\"id\\\":32},{\\\"id\\\":33},{\\\"id\\\":36},{\\\"id\\\":43},{\\\"id\\\":34},{\\\"id\\\":37},{\\\"id\\\":38},{\\\"id\\\":39},{\\\"id\\\":41},{\\\"id\\\":40},{\\\"id\\\":42}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:13:19');
INSERT INTO `site_admin_log` VALUES (79, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:19:33.0432692 +0800 CST m=+7.056294001, 第 254 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:19:33');
INSERT INTO `site_admin_log` VALUES (80, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:20:17.8562381 +0800 CST m=+51.869262901, 第 255 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:20:18');
INSERT INTO `site_admin_log` VALUES (81, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:20:18.3706728 +0800 CST m=+52.383697601, 第 256 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:20:18');
INSERT INTO `site_admin_log` VALUES (82, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:22:24.4234128 +0800 CST m=+5.631723501, 第 257 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-02-29 19:22:24');
INSERT INTO `site_admin_log` VALUES (83, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 19:23:02.5755019 +0800 CST m=+43.783812601, 第 234 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 19:23:03');
INSERT INTO `site_admin_log` VALUES (84, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 19:24:25.4768971 +0800 CST m=+5.802747501, 第 235 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 19:24:25');
INSERT INTO `site_admin_log` VALUES (85, 1, 2, 5, '登陆', '管理员: test001, 在 2020-02-29 19:30:26.6413192 +0800 CST m=+366.967169601, 第 236 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-02-29 19:30:27');
INSERT INTO `site_admin_log` VALUES (86, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:35:53.6335601 +0800 CST m=+987.646584901, 第 258 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:35:54');
INSERT INTO `site_admin_log` VALUES (87, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:35:55.846492 +0800 CST m=+989.859516801, 第 259 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:35:56');
INSERT INTO `site_admin_log` VALUES (88, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:36:56.9270453 +0800 CST m=+1050.940070101, 第 260 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:36:57');
INSERT INTO `site_admin_log` VALUES (89, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:46:22.9932728 +0800 CST m=+1616.998194601, 第 261 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:46:23');
INSERT INTO `site_admin_log` VALUES (90, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:47:48.6411123 +0800 CST m=+1702.646034101, 第 262 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:47:49');
INSERT INTO `site_admin_log` VALUES (91, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:48:01.971515 +0800 CST m=+1715.976436801, 第 263 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:48:02');
INSERT INTO `site_admin_log` VALUES (92, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:53:26.3846677 +0800 CST m=+2040.389589501, 第 264 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:53:26');
INSERT INTO `site_admin_log` VALUES (93, 1, 2, 5, '登陆', '管理员: admin, 在 2020-02-29 19:53:30.9642826 +0800 CST m=+2044.969204401, 第 265 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-02-29 19:53:31');
INSERT INTO `site_admin_log` VALUES (94, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 10:14:49.9183313 +0800 CST m=+140123.964851801, 第 266 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 10:14:50');
INSERT INTO `site_admin_log` VALUES (95, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 10:24:27.9103504 +0800 CST m=+140701.956870901, 第 267 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 10:24:28');
INSERT INTO `site_admin_log` VALUES (96, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 10:42:00.225765 +0800 CST m=+141754.279870201, 第 268 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 10:42:00');
INSERT INTO `site_admin_log` VALUES (97, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 11:07:08.7707948 +0800 CST m=+143262.824900001, 第 269 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:07:09');
INSERT INTO `site_admin_log` VALUES (98, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:07:14.7688514+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:07:15');
INSERT INTO `site_admin_log` VALUES (99, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"auth\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:09:30.9540165+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:09:31');
INSERT INTO `site_admin_log` VALUES (100, 2, 1, 2, '权限管理', '{\"id\":32,\"parent_id\":31,\"permission_name\":\"角色列表\",\"permission_code\":\"role/list\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:10:55.5417058+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:10:56');
INSERT INTO `site_admin_log` VALUES (101, 2, 1, 2, '权限管理', '{\"id\":36,\"parent_id\":31,\"permission_name\":\"权限列表\",\"permission_code\":\"auth/list\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:11:20.8176068+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:11:21');
INSERT INTO `site_admin_log` VALUES (102, 2, 1, 2, '权限管理', '{\"id\":31,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:14:51.9369346+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:14:52');
INSERT INTO `site_admin_log` VALUES (103, 2, 1, 2, '权限管理', '{\"id\":36,\"parent_id\":31,\"permission_name\":\"权限列表\",\"permission_code\":\"system/auth\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:15:30.8640813+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:15:31');
INSERT INTO `site_admin_log` VALUES (104, 2, 1, 2, '权限管理', '{\"id\":36,\"parent_id\":31,\"permission_name\":\"权限列表\",\"permission_code\":\"system/auth\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:15:50.3205718+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:15:50');
INSERT INTO `site_admin_log` VALUES (105, 2, 1, 2, '权限管理', '{\"id\":32,\"parent_id\":31,\"permission_name\":\"角色列表\",\"permission_code\":\"system/role\",\"request_param\":\"PUT\",\"joins\":\"1,31\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T11:16:05.1546242+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 11:16:05');
INSERT INTO `site_admin_log` VALUES (106, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 12:28:58.0239485 +0800 CST m=+3330.829917601, 第 270 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 12:28:58');
INSERT INTO `site_admin_log` VALUES (107, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 12:29:09.3926848 +0800 CST m=+3342.198653901, 第 271 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 12:29:09');
INSERT INTO `site_admin_log` VALUES (108, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 12:30:12.5918269 +0800 CST m=+3405.397796001, 第 273 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 12:30:13');
INSERT INTO `site_admin_log` VALUES (109, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 12:30:08.67696 +0800 CST m=+3401.482929101, 第 272 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 12:30:09');
INSERT INTO `site_admin_log` VALUES (110, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 12:59:12.7730261 +0800 CST m=+3.922008001, 第 237 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 12:59:13');
INSERT INTO `site_admin_log` VALUES (111, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 13:04:48.9987113 +0800 CST m=+276.050274801, 第 238 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 13:04:49');
INSERT INTO `site_admin_log` VALUES (112, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 13:05:35.1963058 +0800 CST m=+322.247869301, 第 239 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 13:05:35');
INSERT INTO `site_admin_log` VALUES (113, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 13:38:07.9609203 +0800 CST m=+120.441732101, 第 274 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 13:38:08');
INSERT INTO `site_admin_log` VALUES (114, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 13:38:09.085566 +0800 CST m=+121.566377801, 第 275 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 13:38:09');
INSERT INTO `site_admin_log` VALUES (115, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 13:38:57.6631575 +0800 CST m=+170.143969301, 第 276 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 13:38:58');
INSERT INTO `site_admin_log` VALUES (116, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 13:39:33.4547695 +0800 CST m=+205.935581301, 第 277 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 13:39:33');
INSERT INTO `site_admin_log` VALUES (117, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:00:30.8918997 +0800 CST m=+1463.367601101, 第 278 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:00:31');
INSERT INTO `site_admin_log` VALUES (118, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"request_param\":\"GET\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-03-02T14:02:01.7678487+08:00\",\"updated_at\":\"2020-03-02T14:02:01.7678487+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:02:02');
INSERT INTO `site_admin_log` VALUES (119, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"权限列表\",\"permission_code\":\"system/auth_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-02T14:03:17.1694277+08:00\",\"updated_at\":\"2020-03-02T14:03:17.1694277+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:03:17');
INSERT INTO `site_admin_log` VALUES (120, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"添加权限\",\"permission_code\":\"system/add_auth\",\"request_param\":\"POST\",\"sort\":1,\"type\":3,\"status\":1,\"created_at\":\"2020-03-02T14:04:33.603826+08:00\",\"updated_at\":\"2020-03-02T14:04:33.603826+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:04:34');
INSERT INTO `site_admin_log` VALUES (121, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 14:07:26.7365408 +0800 CST m=+106.321688601, 第 240 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 14:07:27');
INSERT INTO `site_admin_log` VALUES (122, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:12:00.7986064 +0800 CST m=+2153.274307801, 第 279 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-02 14:12:01');
INSERT INTO `site_admin_log` VALUES (123, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:14:56.1736693 +0800 CST m=+2328.649370701, 第 280 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:14:56');
INSERT INTO `site_admin_log` VALUES (124, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"编辑权限\",\"permission_code\":\"system/edit_auth\",\"request_param\":\"PUT\",\"sort\":1,\"type\":2,\"status\":2,\"created_at\":\"2020-03-02T14:18:09.9285191+08:00\",\"updated_at\":\"2020-03-02T14:18:09.9285191+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:18:10');
INSERT INTO `site_admin_log` VALUES (125, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T14:19:19.003277+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:19:19');
INSERT INTO `site_admin_log` VALUES (126, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"角色列表\",\"permission_code\":\"system/role_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-02T14:20:41.3563063+08:00\",\"updated_at\":\"2020-03-02T14:20:41.3563063+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:20:41');
INSERT INTO `site_admin_log` VALUES (127, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"添加角色\",\"permission_code\":\"system/add_role\",\"request_param\":\"POST\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-02T14:22:28.2471448+08:00\",\"updated_at\":\"2020-03-02T14:22:28.2471448+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:22:28');
INSERT INTO `site_admin_log` VALUES (128, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"编辑角色\",\"permission_code\":\"system/edit_role\",\"request_param\":\"PUT\",\"sort\":1,\"type\":3,\"status\":1,\"created_at\":\"2020-03-02T14:23:10.5285515+08:00\",\"updated_at\":\"2020-03-02T14:23:10.5285515+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:23:11');
INSERT INTO `site_admin_log` VALUES (129, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/edit_auth\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:24:33.3402781+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:24:33');
INSERT INTO `site_admin_log` VALUES (130, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/edit_auth\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:24:33.9670443+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:24:34');
INSERT INTO `site_admin_log` VALUES (131, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/add_role\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:25:11.3515581+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:25:11');
INSERT INTO `site_admin_log` VALUES (132, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"auth/list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:26:52.7458857+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:26:53');
INSERT INTO `site_admin_log` VALUES (133, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"auth/add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:27:14.6316877+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:27:15');
INSERT INTO `site_admin_log` VALUES (134, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"auth/add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:27:16.2206085+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:27:16');
INSERT INTO `site_admin_log` VALUES (135, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"auth/edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:27:37.9701196+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:27:38');
INSERT INTO `site_admin_log` VALUES (136, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"role/list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:28:00.141161+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:28:00');
INSERT INTO `site_admin_log` VALUES (137, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"role/add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:28:09.1983203+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:28:09');
INSERT INTO `site_admin_log` VALUES (138, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"role/edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:28:21.4488328+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:28:22');
INSERT INTO `site_admin_log` VALUES (139, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:30:42.3628654 +0800 CST m=+3274.838566801, 第 281 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:30:42');
INSERT INTO `site_admin_log` VALUES (140, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:30:52.4167391 +0800 CST m=+3284.892440501, 第 282 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:30:52');
INSERT INTO `site_admin_log` VALUES (141, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:33:42.6127974 +0800 CST m=+3455.088498801, 第 283 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:33:43');
INSERT INTO `site_admin_log` VALUES (142, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:35:03.9539775 +0800 CST m=+3536.429678901, 第 284 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:35:04');
INSERT INTO `site_admin_log` VALUES (143, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:35:13.910083 +0800 CST m=+3546.385784401, 第 285 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:35:14');
INSERT INTO `site_admin_log` VALUES (144, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:35:45.9951827 +0800 CST m=+3578.470884101, 第 286 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:35:46');
INSERT INTO `site_admin_log` VALUES (145, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:36:09.188465 +0800 CST m=+3601.664166401, 第 287 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:36:09');
INSERT INTO `site_admin_log` VALUES (146, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:36:58.3026081 +0800 CST m=+3650.778309501, 第 288 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:36:58');
INSERT INTO `site_admin_log` VALUES (147, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:39:01.2342601 +0800 CST m=+3773.709961501, 第 289 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:39:01');
INSERT INTO `site_admin_log` VALUES (148, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:45:00.6871723 +0800 CST m=+4133.163155201, 第 290 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:45:01');
INSERT INTO `site_admin_log` VALUES (149, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:47:44.8398939+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:47:45');
INSERT INTO `site_admin_log` VALUES (150, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"system/add_auth\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:48:02.2271906+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:48:02');
INSERT INTO `site_admin_log` VALUES (151, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/edit_auth\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:48:19.6620725+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:48:20');
INSERT INTO `site_admin_log` VALUES (152, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"system/role_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:48:33.6487687+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:48:34');
INSERT INTO `site_admin_log` VALUES (153, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/add_role\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:48:44.854982+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:48:45');
INSERT INTO `site_admin_log` VALUES (154, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"system/edit_role\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:49:00.4076151+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:49:01');
INSERT INTO `site_admin_log` VALUES (155, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"system/auth_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:51:07.6488544+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:51:08');
INSERT INTO `site_admin_log` VALUES (156, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"system/auth_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:51:06.8109339+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:51:07');
INSERT INTO `site_admin_log` VALUES (157, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:51:35.9429362+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:51:36');
INSERT INTO `site_admin_log` VALUES (158, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:51:45.7062648+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:51:46');
INSERT INTO `site_admin_log` VALUES (159, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/role_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:51:59.503187+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:52:00');
INSERT INTO `site_admin_log` VALUES (160, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"system/role_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T14:52:09.1155558+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:52:09');
INSERT INTO `site_admin_log` VALUES (161, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:53:59.3999831 +0800 CST m=+4671.875966001, 第 291 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:53:59');
INSERT INTO `site_admin_log` VALUES (162, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:55:02.3230419 +0800 CST m=+4734.799024801, 第 292 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:55:02');
INSERT INTO `site_admin_log` VALUES (163, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:59:33.4853697 +0800 CST m=+5005.961352601, 第 293 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:59:33');
INSERT INTO `site_admin_log` VALUES (164, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 14:59:36.8332739 +0800 CST m=+5009.309256801, 第 294 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 14:59:37');
INSERT INTO `site_admin_log` VALUES (165, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:01:10.0148542 +0800 CST m=+5102.490837101, 第 295 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:01:10');
INSERT INTO `site_admin_log` VALUES (166, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:02:06.9867445 +0800 CST m=+5159.462727401, 第 296 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:02:07');
INSERT INTO `site_admin_log` VALUES (167, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:02:08.6163227 +0800 CST m=+5161.092305601, 第 297 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:02:09');
INSERT INTO `site_admin_log` VALUES (168, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:02:19.1049244 +0800 CST m=+5171.580907301, 第 298 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:02:19');
INSERT INTO `site_admin_log` VALUES (169, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:02:38.5287363 +0800 CST m=+5191.004719201, 第 299 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:02:39');
INSERT INTO `site_admin_log` VALUES (170, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:03:26.7560561 +0800 CST m=+5239.232039001, 第 300 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:03:27');
INSERT INTO `site_admin_log` VALUES (171, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:04:29.3206802 +0800 CST m=+5301.796663101, 第 301 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:04:29');
INSERT INTO `site_admin_log` VALUES (172, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:06:04.8117936 +0800 CST m=+5397.287776501, 第 302 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:06:05');
INSERT INTO `site_admin_log` VALUES (173, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:06:11.4932067 +0800 CST m=+5403.969189601, 第 303 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:06:11');
INSERT INTO `site_admin_log` VALUES (174, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:06:13.2898744 +0800 CST m=+5405.765857301, 第 304 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:06:13');
INSERT INTO `site_admin_log` VALUES (175, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:30:42.8633869 +0800 CST m=+6875.339369801, 第 305 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:30:43');
INSERT INTO `site_admin_log` VALUES (176, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:39:35.4793828 +0800 CST m=+7407.955365701, 第 241 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:39:35');
INSERT INTO `site_admin_log` VALUES (177, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:39:43.8951818 +0800 CST m=+7416.371164701, 第 242 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:39:44');
INSERT INTO `site_admin_log` VALUES (178, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:47:18.0909435 +0800 CST m=+32.723525501, 第 243 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:47:18');
INSERT INTO `site_admin_log` VALUES (179, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:49:31.9883288 +0800 CST m=+8004.444265201, 第 306 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:49:32');
INSERT INTO `site_admin_log` VALUES (180, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:49:34.254008 +0800 CST m=+8006.709944401, 第 307 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:49:34');
INSERT INTO `site_admin_log` VALUES (181, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:49:36.455228 +0800 CST m=+8008.911164401, 第 308 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:49:36');
INSERT INTO `site_admin_log` VALUES (182, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:52:10.8053362 +0800 CST m=+23.703041601, 第 244 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:52:11');
INSERT INTO `site_admin_log` VALUES (183, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:52:38.9419993 +0800 CST m=+8191.397935701, 第 309 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:52:39');
INSERT INTO `site_admin_log` VALUES (184, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:53:34.3610296 +0800 CST m=+17.053896901, 第 245 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:53:34');
INSERT INTO `site_admin_log` VALUES (185, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 15:54:06.5804404 +0800 CST m=+49.273307701, 第 246 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 15:54:07');
INSERT INTO `site_admin_log` VALUES (186, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:57:19.9528209 +0800 CST m=+8472.408757301, 第 310 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:57:20');
INSERT INTO `site_admin_log` VALUES (187, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:57:22.0190798 +0800 CST m=+8474.475016201, 第 311 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:57:22');
INSERT INTO `site_admin_log` VALUES (188, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:57:48.1560423 +0800 CST m=+8500.611978701, 第 312 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:57:48');
INSERT INTO `site_admin_log` VALUES (189, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:57:49.99506 +0800 CST m=+8502.450996401, 第 313 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:57:50');
INSERT INTO `site_admin_log` VALUES (190, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:58:11.2020863 +0800 CST m=+8523.658022701, 第 314 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:58:11');
INSERT INTO `site_admin_log` VALUES (191, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:58:13.6086454 +0800 CST m=+8526.064581801, 第 315 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:58:14');
INSERT INTO `site_admin_log` VALUES (192, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:58:15.18747 +0800 CST m=+8527.643406401, 第 316 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:58:15');
INSERT INTO `site_admin_log` VALUES (193, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:58:28.605396 +0800 CST m=+8541.061332401, 第 317 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:58:29');
INSERT INTO `site_admin_log` VALUES (194, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:58:46.8315933 +0800 CST m=+8559.287529701, 第 318 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:58:47');
INSERT INTO `site_admin_log` VALUES (195, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:59:05.9012281 +0800 CST m=+8578.357164501, 第 319 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:59:06');
INSERT INTO `site_admin_log` VALUES (196, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 15:59:10.2042804 +0800 CST m=+8582.660216801, 第 320 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 15:59:10');
INSERT INTO `site_admin_log` VALUES (197, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 16:00:38.3523587 +0800 CST m=+8.635375701, 第 247 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 16:00:38');
INSERT INTO `site_admin_log` VALUES (198, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 16:02:15.1836712 +0800 CST m=+6.317342801, 第 248 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 16:02:15');
INSERT INTO `site_admin_log` VALUES (199, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:03:35.4931461 +0800 CST m=+8847.949082501, 第 321 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:03:35');
INSERT INTO `site_admin_log` VALUES (200, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:03:52.3254526 +0800 CST m=+8864.781389001, 第 322 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:03:52');
INSERT INTO `site_admin_log` VALUES (201, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:03:58.0258107 +0800 CST m=+8870.481747101, 第 323 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:03:58');
INSERT INTO `site_admin_log` VALUES (202, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:00.6527698 +0800 CST m=+8873.108706201, 第 324 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:01');
INSERT INTO `site_admin_log` VALUES (203, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:02.3183724 +0800 CST m=+8874.774308801, 第 325 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:02');
INSERT INTO `site_admin_log` VALUES (204, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:10.858262 +0800 CST m=+8883.314198401, 第 326 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:11');
INSERT INTO `site_admin_log` VALUES (205, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:26.715581 +0800 CST m=+8899.171517401, 第 327 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:27');
INSERT INTO `site_admin_log` VALUES (206, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:29.2472081 +0800 CST m=+8901.703144501, 第 328 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:29');
INSERT INTO `site_admin_log` VALUES (207, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:31.0468952 +0800 CST m=+8903.502831601, 第 329 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:31');
INSERT INTO `site_admin_log` VALUES (208, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:04:32.2782832 +0800 CST m=+8904.734219601, 第 330 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:04:32');
INSERT INTO `site_admin_log` VALUES (209, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:08:48.8931003 +0800 CST m=+9161.349036701, 第 331 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:08:49');
INSERT INTO `site_admin_log` VALUES (210, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:10:03.1568659 +0800 CST m=+9235.612802301, 第 332 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:10:03');
INSERT INTO `site_admin_log` VALUES (211, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:11:01.6411681 +0800 CST m=+9294.097104501, 第 333 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:11:02');
INSERT INTO `site_admin_log` VALUES (212, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:11:46.5027827 +0800 CST m=+9338.958719101, 第 334 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:11:47');
INSERT INTO `site_admin_log` VALUES (213, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:11:53.9903926 +0800 CST m=+9346.446329001, 第 335 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:11:54');
INSERT INTO `site_admin_log` VALUES (214, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:11:55.1140856 +0800 CST m=+9347.570022001, 第 336 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:11:55');
INSERT INTO `site_admin_log` VALUES (215, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:11:56.5119347 +0800 CST m=+9348.967871101, 第 337 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:11:57');
INSERT INTO `site_admin_log` VALUES (216, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:12:11.1059311 +0800 CST m=+9363.561867501, 第 338 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:12:11');
INSERT INTO `site_admin_log` VALUES (217, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:12:12.385798 +0800 CST m=+9364.841734401, 第 339 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:12:12');
INSERT INTO `site_admin_log` VALUES (218, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:12:17.2103527 +0800 CST m=+9369.666289101, 第 340 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:12:17');
INSERT INTO `site_admin_log` VALUES (219, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:14:27.7141629 +0800 CST m=+9500.170099301, 第 341 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:14:28');
INSERT INTO `site_admin_log` VALUES (220, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:15:25.182671 +0800 CST m=+9557.638607401, 第 342 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:15:25');
INSERT INTO `site_admin_log` VALUES (221, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:15:27.9052576 +0800 CST m=+9560.361194001, 第 343 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:15:28');
INSERT INTO `site_admin_log` VALUES (222, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:16:43.3823048 +0800 CST m=+9635.838241201, 第 344 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:16:43');
INSERT INTO `site_admin_log` VALUES (223, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:16:45.2922212 +0800 CST m=+9637.748157601, 第 345 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:16:45');
INSERT INTO `site_admin_log` VALUES (224, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:17:27.6980841 +0800 CST m=+9680.154020501, 第 346 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:17:28');
INSERT INTO `site_admin_log` VALUES (225, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:18:24.5319838 +0800 CST m=+9736.987920201, 第 347 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:18:25');
INSERT INTO `site_admin_log` VALUES (226, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:18:45.8932025 +0800 CST m=+9758.349138901, 第 348 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:18:46');
INSERT INTO `site_admin_log` VALUES (227, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:19:37.6570118 +0800 CST m=+9810.112948201, 第 349 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:19:38');
INSERT INTO `site_admin_log` VALUES (228, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 16:20:10.3019743 +0800 CST m=+19.370932001, 第 249 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 16:20:10');
INSERT INTO `site_admin_log` VALUES (229, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:20:40.9952841 +0800 CST m=+9873.451220501, 第 350 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:20:41');
INSERT INTO `site_admin_log` VALUES (230, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:20:45.4787659 +0800 CST m=+9877.934702301, 第 351 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:20:45');
INSERT INTO `site_admin_log` VALUES (231, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:21:05.7759496 +0800 CST m=+9898.231886001, 第 352 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:21:06');
INSERT INTO `site_admin_log` VALUES (232, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:22:43.9706509 +0800 CST m=+9996.426587301, 第 353 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:22:44');
INSERT INTO `site_admin_log` VALUES (233, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:23:13.0744952 +0800 CST m=+10025.530431601, 第 354 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:23:13');
INSERT INTO `site_admin_log` VALUES (234, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:24:27.5604687 +0800 CST m=+10100.016405101, 第 355 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:24:28');
INSERT INTO `site_admin_log` VALUES (235, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:24:33.3941714 +0800 CST m=+10105.850107801, 第 356 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:24:33');
INSERT INTO `site_admin_log` VALUES (236, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:24:43.3756764 +0800 CST m=+10115.831612801, 第 357 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:24:43');
INSERT INTO `site_admin_log` VALUES (237, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:24:57.9512003 +0800 CST m=+10130.407136701, 第 358 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:24:58');
INSERT INTO `site_admin_log` VALUES (238, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:25:33.6809489 +0800 CST m=+10166.136885301, 第 359 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:25:34');
INSERT INTO `site_admin_log` VALUES (239, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:28:25.7300825 +0800 CST m=+10338.186018901, 第 360 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:28:26');
INSERT INTO `site_admin_log` VALUES (240, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:28:48.7383948 +0800 CST m=+10361.194331201, 第 361 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:28:49');
INSERT INTO `site_admin_log` VALUES (241, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:30:06.5905371 +0800 CST m=+10439.046473501, 第 362 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:30:07');
INSERT INTO `site_admin_log` VALUES (242, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:32:10.8076986 +0800 CST m=+10563.263635001, 第 363 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:32:11');
INSERT INTO `site_admin_log` VALUES (243, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:32:37.6363283 +0800 CST m=+10590.092264701, 第 364 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:32:38');
INSERT INTO `site_admin_log` VALUES (244, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:32:39.1459355 +0800 CST m=+10591.601871901, 第 365 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:32:39');
INSERT INTO `site_admin_log` VALUES (245, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:32:42.7082876 +0800 CST m=+10595.164224001, 第 366 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:32:43');
INSERT INTO `site_admin_log` VALUES (246, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 16:33:40.2657688 +0800 CST m=+6.713476101, 第 250 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 16:33:40');
INSERT INTO `site_admin_log` VALUES (247, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 16:34:38.4733834 +0800 CST m=+3.263417701, 第 251 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 16:34:38');
INSERT INTO `site_admin_log` VALUES (248, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:39:43.7806135 +0800 CST m=+11016.236549901, 第 367 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:39:44');
INSERT INTO `site_admin_log` VALUES (249, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:41:11.4566774 +0800 CST m=+11103.535060901, 第 368 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:41:11');
INSERT INTO `site_admin_log` VALUES (250, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:46:35.4856685 +0800 CST m=+11427.564052001, 第 369 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:46:35');
INSERT INTO `site_admin_log` VALUES (251, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:46:38.3812864 +0800 CST m=+11430.459669901, 第 370 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:46:38');
INSERT INTO `site_admin_log` VALUES (252, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:46:43.9816418 +0800 CST m=+11436.060025301, 第 371 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:46:44');
INSERT INTO `site_admin_log` VALUES (253, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:49:40.1233107 +0800 CST m=+11612.201694201, 第 372 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:49:40');
INSERT INTO `site_admin_log` VALUES (254, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:49:45.0409496 +0800 CST m=+11617.119333101, 第 373 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:49:45');
INSERT INTO `site_admin_log` VALUES (255, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:50:04.206947 +0800 CST m=+11636.285330501, 第 374 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:50:04');
INSERT INTO `site_admin_log` VALUES (256, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 16:59:27.1892726 +0800 CST m=+12199.267656101, 第 375 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 16:59:27');
INSERT INTO `site_admin_log` VALUES (257, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:00:01.7913928 +0800 CST m=+12233.869776301, 第 376 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:00:02');
INSERT INTO `site_admin_log` VALUES (258, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:00:29.753917 +0800 CST m=+12261.832300501, 第 377 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:00:30');
INSERT INTO `site_admin_log` VALUES (259, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:01:59.8565285 +0800 CST m=+12351.934912001, 第 378 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:02:00');
INSERT INTO `site_admin_log` VALUES (260, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:02:05.7313448 +0800 CST m=+12357.809728301, 第 379 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:02:06');
INSERT INTO `site_admin_log` VALUES (261, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:02:11.1764022 +0800 CST m=+12363.254785701, 第 380 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:02:11');
INSERT INTO `site_admin_log` VALUES (262, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:06:49.9584694 +0800 CST m=+12642.036852901, 第 381 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:06:50');
INSERT INTO `site_admin_log` VALUES (263, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:09:04.6593161 +0800 CST m=+12776.737699601, 第 382 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:09:05');
INSERT INTO `site_admin_log` VALUES (264, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:09:07.6447224 +0800 CST m=+12779.723105901, 第 383 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:09:08');
INSERT INTO `site_admin_log` VALUES (265, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:09:07.7837889 +0800 CST m=+12779.862172401, 第 384 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:09:08');
INSERT INTO `site_admin_log` VALUES (266, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:10:23.5721049 +0800 CST m=+12855.650488401, 第 385 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:10:24');
INSERT INTO `site_admin_log` VALUES (267, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:15:36.8784225 +0800 CST m=+13168.956806001, 第 386 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:15:37');
INSERT INTO `site_admin_log` VALUES (268, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:15:44.8780218 +0800 CST m=+13176.956405301, 第 387 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:15:45');
INSERT INTO `site_admin_log` VALUES (269, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:15:50.0135578 +0800 CST m=+13182.091941301, 第 388 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:15:50');
INSERT INTO `site_admin_log` VALUES (270, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:19:24.6351107 +0800 CST m=+13396.713494201, 第 389 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:19:25');
INSERT INTO `site_admin_log` VALUES (271, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:20:03.2586546 +0800 CST m=+13435.337038101, 第 390 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:20:03');
INSERT INTO `site_admin_log` VALUES (272, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:20:17.9413171 +0800 CST m=+13450.019700601, 第 391 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:20:18');
INSERT INTO `site_admin_log` VALUES (273, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:20:26.7401807 +0800 CST m=+13458.818564201, 第 392 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:20:27');
INSERT INTO `site_admin_log` VALUES (274, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:05.2917352 +0800 CST m=+13497.370118701, 第 393 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:05');
INSERT INTO `site_admin_log` VALUES (275, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:21.2583735 +0800 CST m=+13513.336757001, 第 394 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:21');
INSERT INTO `site_admin_log` VALUES (276, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:22.7259508 +0800 CST m=+13514.804334301, 第 395 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:23');
INSERT INTO `site_admin_log` VALUES (277, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:24.1407763 +0800 CST m=+13516.219159801, 第 396 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:24');
INSERT INTO `site_admin_log` VALUES (278, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:24.5144175 +0800 CST m=+13516.592801001, 第 397 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:25');
INSERT INTO `site_admin_log` VALUES (279, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:24.8944062 +0800 CST m=+13516.972789701, 第 398 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:25');
INSERT INTO `site_admin_log` VALUES (280, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:28.0901663 +0800 CST m=+13520.168549801, 第 399 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:28');
INSERT INTO `site_admin_log` VALUES (281, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:37.3270279 +0800 CST m=+13529.405411401, 第 400 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:37');
INSERT INTO `site_admin_log` VALUES (282, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:41.9086416 +0800 CST m=+13533.987025101, 第 401 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:42');
INSERT INTO `site_admin_log` VALUES (283, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:21:48.0441402 +0800 CST m=+13540.122523701, 第 402 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:21:48');
INSERT INTO `site_admin_log` VALUES (284, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:22:52.642775 +0800 CST m=+13604.721158501, 第 403 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:22:53');
INSERT INTO `site_admin_log` VALUES (285, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:22:52.642775 +0800 CST m=+13604.721158501, 第 403 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:22:53');
INSERT INTO `site_admin_log` VALUES (286, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:22:57.7911121 +0800 CST m=+13609.869495601, 第 404 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:22:58');
INSERT INTO `site_admin_log` VALUES (287, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:00.8910091 +0800 CST m=+13612.969392601, 第 405 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:01');
INSERT INTO `site_admin_log` VALUES (288, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:04.0385086 +0800 CST m=+13616.116892101, 第 406 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:04');
INSERT INTO `site_admin_log` VALUES (289, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:05.7401612 +0800 CST m=+13617.818544701, 第 407 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:06');
INSERT INTO `site_admin_log` VALUES (290, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:45.4393498 +0800 CST m=+13657.517733301, 第 409 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:45');
INSERT INTO `site_admin_log` VALUES (291, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:54.4629642 +0800 CST m=+13666.541347701, 第 410 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:54');
INSERT INTO `site_admin_log` VALUES (292, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:23:21.3850318 +0800 CST m=+13633.463415301, 第 408 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:23:21');
INSERT INTO `site_admin_log` VALUES (293, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:24:58.4151839 +0800 CST m=+13730.493567401, 第 411 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:24:58');
INSERT INTO `site_admin_log` VALUES (294, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:27:46.3859336 +0800 CST m=+13898.464317101, 第 412 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:27:46');
INSERT INTO `site_admin_log` VALUES (295, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:27:59.9398462 +0800 CST m=+13912.018229701, 第 413 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:28:00');
INSERT INTO `site_admin_log` VALUES (296, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:38:56.2357776 +0800 CST m=+14568.314161101, 第 414 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:38:56');
INSERT INTO `site_admin_log` VALUES (297, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:40:21.9116157 +0800 CST m=+14654.362754001, 第 415 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:40:22');
INSERT INTO `site_admin_log` VALUES (298, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:40:50.8692758 +0800 CST m=+14683.320414101, 第 417 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:40:51');
INSERT INTO `site_admin_log` VALUES (299, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:40:51.2473819 +0800 CST m=+14683.698520201, 第 416 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:40:51');
INSERT INTO `site_admin_log` VALUES (300, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:42:32.0819391 +0800 CST m=+14784.533077401, 第 418 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:42:32');
INSERT INTO `site_admin_log` VALUES (301, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:42:43.9308206 +0800 CST m=+14796.381958901, 第 419 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:42:44');
INSERT INTO `site_admin_log` VALUES (302, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:46:49.2194228 +0800 CST m=+15041.670561101, 第 420 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:46:49');
INSERT INTO `site_admin_log` VALUES (303, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:46:57.1796475 +0800 CST m=+15049.630785801, 第 421 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:46:57');
INSERT INTO `site_admin_log` VALUES (304, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:47:11.3489632 +0800 CST m=+15063.800101501, 第 422 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:47:11');
INSERT INTO `site_admin_log` VALUES (305, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:47:26.3833364 +0800 CST m=+15078.834474701, 第 423 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:47:26');
INSERT INTO `site_admin_log` VALUES (306, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:50:53.6412004 +0800 CST m=+15286.092338701, 第 424 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:50:54');
INSERT INTO `site_admin_log` VALUES (307, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:51:04.3661996 +0800 CST m=+15296.817337901, 第 425 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:51:04');
INSERT INTO `site_admin_log` VALUES (308, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:51:51.2183092 +0800 CST m=+15343.669447501, 第 426 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:51:51');
INSERT INTO `site_admin_log` VALUES (309, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:52:42.9679287 +0800 CST m=+15395.419067001, 第 427 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:52:43');
INSERT INTO `site_admin_log` VALUES (310, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:54:16.1315924 +0800 CST m=+15488.582730701, 第 428 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:54:16');
INSERT INTO `site_admin_log` VALUES (311, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:55:06.2027832 +0800 CST m=+15538.653921501, 第 429 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:55:06');
INSERT INTO `site_admin_log` VALUES (312, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:56:02.7235827 +0800 CST m=+15595.174721001, 第 430 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:56:03');
INSERT INTO `site_admin_log` VALUES (313, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:56:59.0906365 +0800 CST m=+15651.541774801, 第 431 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:56:59');
INSERT INTO `site_admin_log` VALUES (314, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 17:59:48.0027705 +0800 CST m=+15820.453908801, 第 432 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 17:59:48');
INSERT INTO `site_admin_log` VALUES (315, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:00:00.4907828 +0800 CST m=+15832.941921101, 第 433 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:00:00');
INSERT INTO `site_admin_log` VALUES (316, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:00:33.2468136 +0800 CST m=+15865.697951901, 第 434 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:00:33');
INSERT INTO `site_admin_log` VALUES (317, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:05:27.2472244 +0800 CST m=+16159.698362701, 第 435 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:05:27');
INSERT INTO `site_admin_log` VALUES (318, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:13:43.5650491 +0800 CST m=+16656.016187401, 第 436 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:13:44');
INSERT INTO `site_admin_log` VALUES (319, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:13:52.9614766 +0800 CST m=+16665.412614901, 第 437 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:13:53');
INSERT INTO `site_admin_log` VALUES (320, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:14:49.8506425 +0800 CST m=+16722.301780801, 第 438 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:14:50');
INSERT INTO `site_admin_log` VALUES (321, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:14:51.9692101 +0800 CST m=+16724.420348401, 第 439 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:14:52');
INSERT INTO `site_admin_log` VALUES (322, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:17:33.4425111 +0800 CST m=+16885.893649401, 第 440 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:17:33');
INSERT INTO `site_admin_log` VALUES (323, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:17:38.4247319 +0800 CST m=+16890.875870201, 第 441 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:17:38');
INSERT INTO `site_admin_log` VALUES (324, 1, 1, 2, '角色管理', '{\"id\":22,\"status\":1,\"role_name\":\"角色管理\",\"remark\":\"11\",\"updated_at\":\"2020-03-02T18:18:09.9144414+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:18:10');
INSERT INTO `site_admin_log` VALUES (325, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:35:23.9063763 +0800 CST m=+17956.357514601, 第 442 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:35:24');
INSERT INTO `site_admin_log` VALUES (326, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:37:30.1903649 +0800 CST m=+18082.641503201, 第 443 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:37:30');
INSERT INTO `site_admin_log` VALUES (327, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 18:39:23.9430718 +0800 CST m=+35.954036101, 第 252 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 18:39:24');
INSERT INTO `site_admin_log` VALUES (328, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:42:50.879062 +0800 CST m=+18403.400957401, 第 444 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:42:51');
INSERT INTO `site_admin_log` VALUES (329, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:43:33.5220807 +0800 CST m=+18446.043976101, 第 445 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:43:34');
INSERT INTO `site_admin_log` VALUES (330, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:44:00.3007528 +0800 CST m=+18472.822648201, 第 446 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:44:00');
INSERT INTO `site_admin_log` VALUES (331, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:52:21.7935525 +0800 CST m=+18974.315447901, 第 447 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:52:22');
INSERT INTO `site_admin_log` VALUES (332, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:55:36.402214 +0800 CST m=+19168.924109401, 第 448 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:55:36');
INSERT INTO `site_admin_log` VALUES (333, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:56:41.6228194 +0800 CST m=+19234.144714801, 第 449 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:56:42');
INSERT INTO `site_admin_log` VALUES (334, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:57:11.5187364 +0800 CST m=+19264.040631801, 第 450 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:57:12');
INSERT INTO `site_admin_log` VALUES (335, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 18:57:16.989038 +0800 CST m=+19269.510933401, 第 451 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 18:57:17');
INSERT INTO `site_admin_log` VALUES (336, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:04:48.9052366 +0800 CST m=+19721.427132001, 第 452 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:04:49');
INSERT INTO `site_admin_log` VALUES (337, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:05:11.527189 +0800 CST m=+19744.049084401, 第 453 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:05:12');
INSERT INTO `site_admin_log` VALUES (338, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:05:16.0016143 +0800 CST m=+19748.523509701, 第 454 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:05:16');
INSERT INTO `site_admin_log` VALUES (339, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:05:41.1379834 +0800 CST m=+19773.659878801, 第 455 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:05:41');
INSERT INTO `site_admin_log` VALUES (340, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:06:48.712912 +0800 CST m=+19841.234807401, 第 456 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:06:49');
INSERT INTO `site_admin_log` VALUES (341, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:07:44.1112901 +0800 CST m=+19896.633185501, 第 457 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:07:44');
INSERT INTO `site_admin_log` VALUES (342, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:08:06.8717652 +0800 CST m=+19919.393660601, 第 458 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:08:07');
INSERT INTO `site_admin_log` VALUES (343, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:09:03.9969036 +0800 CST m=+19976.518799001, 第 459 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:09:04');
INSERT INTO `site_admin_log` VALUES (344, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:09:54.6778814 +0800 CST m=+20027.199776801, 第 460 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:09:55');
INSERT INTO `site_admin_log` VALUES (345, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:11:41.2464669 +0800 CST m=+20133.768362301, 第 461 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:11:41');
INSERT INTO `site_admin_log` VALUES (346, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:11:47.032766 +0800 CST m=+20139.554661401, 第 462 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:11:47');
INSERT INTO `site_admin_log` VALUES (347, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 19:16:55.9874212 +0800 CST m=+8.211935601, 第 253 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 19:16:56');
INSERT INTO `site_admin_log` VALUES (348, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 19:24:40.2960727 +0800 CST m=+3.825614701, 第 254 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 19:24:40');
INSERT INTO `site_admin_log` VALUES (349, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:24:58.2405945 +0800 CST m=+20930.762489901, 第 463 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:24:58');
INSERT INTO `site_admin_log` VALUES (350, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:25:43.6156518 +0800 CST m=+20976.137547201, 第 464 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:25:44');
INSERT INTO `site_admin_log` VALUES (351, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:25:53.7946795 +0800 CST m=+20986.316574901, 第 465 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:25:54');
INSERT INTO `site_admin_log` VALUES (352, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:30:40.3000973 +0800 CST m=+21272.821992701, 第 466 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:30:40');
INSERT INTO `site_admin_log` VALUES (353, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:36:00.1968368 +0800 CST m=+21592.718732201, 第 467 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:36:00');
INSERT INTO `site_admin_log` VALUES (354, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:36:52.1294439 +0800 CST m=+21644.651339301, 第 468 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:36:52');
INSERT INTO `site_admin_log` VALUES (355, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:38:18.2664738 +0800 CST m=+21730.788369201, 第 469 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:38:18');
INSERT INTO `site_admin_log` VALUES (356, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:38:34.8560801 +0800 CST m=+21747.377975501, 第 470 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:38:35');
INSERT INTO `site_admin_log` VALUES (357, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:39:07.2871512 +0800 CST m=+21779.809046601, 第 471 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:39:07');
INSERT INTO `site_admin_log` VALUES (358, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:40:09.4976303 +0800 CST m=+21841.971739201, 第 472 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:40:09');
INSERT INTO `site_admin_log` VALUES (359, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T19:43:45.3487476+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:43:45');
INSERT INTO `site_admin_log` VALUES (360, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/role_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-02T19:44:32.2305634+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:44:32');
INSERT INTO `site_admin_log` VALUES (361, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:44:48.0446189 +0800 CST m=+22120.518727801, 第 473 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:44:48');
INSERT INTO `site_admin_log` VALUES (362, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/role_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T19:45:10.9593691+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:45:11');
INSERT INTO `site_admin_log` VALUES (363, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:45:16.8191591 +0800 CST m=+22149.293268001, 第 474 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:45:17');
INSERT INTO `site_admin_log` VALUES (364, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:51:40.8280046 +0800 CST m=+22533.302113501, 第 475 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:51:41');
INSERT INTO `site_admin_log` VALUES (365, 1, 1, 2, '角色管理', '{\"id\":1,\"status\":1,\"role_name\":\"管理员\",\"remark\":\"21\",\"updated_at\":\"2020-03-02T19:52:10.0624993+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:52:10');
INSERT INTO `site_admin_log` VALUES (366, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"用户列表\",\"permission_code\":\"system/user_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-02T19:53:21.9369424+08:00\",\"updated_at\":\"2020-03-02T19:53:21.9369424+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:53:22');
INSERT INTO `site_admin_log` VALUES (367, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:54:38.5722519 +0800 CST m=+22711.046360801, 第 476 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:54:39');
INSERT INTO `site_admin_log` VALUES (368, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:55:44.026051 +0800 CST m=+22776.500159901, 第 477 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:55:44');
INSERT INTO `site_admin_log` VALUES (369, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 19:56:14.616537 +0800 CST m=+4.517527801, 第 255 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 19:56:15');
INSERT INTO `site_admin_log` VALUES (370, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:56:30.7566511 +0800 CST m=+22823.230760001, 第 478 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:56:31');
INSERT INTO `site_admin_log` VALUES (371, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:56:55.1460089 +0800 CST m=+22847.620117801, 第 479 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:56:55');
INSERT INTO `site_admin_log` VALUES (372, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 19:57:00.3699442 +0800 CST m=+3.939776001, 第 256 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 19:57:00');
INSERT INTO `site_admin_log` VALUES (373, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 19:58:07.995297 +0800 CST m=+22920.469405901, 第 480 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 19:58:08');
INSERT INTO `site_admin_log` VALUES (374, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 19:58:56.0472 +0800 CST m=+19.884539901, 第 257 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 19:58:56');
INSERT INTO `site_admin_log` VALUES (375, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:00:21.9978968 +0800 CST m=+2.864029201, 第 258 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-02 20:00:22');
INSERT INTO `site_admin_log` VALUES (376, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:00:27.0511202 +0800 CST m=+23059.525229101, 第 481 次登陆', 1, 'admin', 0, '', '10.10.35.141', '2020-03-02 20:00:27');
INSERT INTO `site_admin_log` VALUES (377, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:00:58.8468959 +0800 CST m=+23091.321004801, 第 482 次登陆', 1, 'admin', 0, '', '10.10.35.141', '2020-03-02 20:00:59');
INSERT INTO `site_admin_log` VALUES (378, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:02:17.8963739 +0800 CST m=+23170.370482801, 第 483 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:02:18');
INSERT INTO `site_admin_log` VALUES (379, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:02:32.502099 +0800 CST m=+23184.976207901, 第 484 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:02:33');
INSERT INTO `site_admin_log` VALUES (380, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:03:17.2242343 +0800 CST m=+23229.698343201, 第 485 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:03:17');
INSERT INTO `site_admin_log` VALUES (381, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"system/user_list\",\"request_param\":\"PUT\",\"sort\":1,\"type\":2,\"status\":2,\"created_at\":\"2020-03-02T20:05:58.5172532+08:00\",\"updated_at\":\"2020-03-02T20:05:58.5172532+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:05:59');
INSERT INTO `site_admin_log` VALUES (382, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:06:36.3773877 +0800 CST m=+23428.851496601, 第 486 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:06:36');
INSERT INTO `site_admin_log` VALUES (383, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:09:40.2265751 +0800 CST m=+23612.700684001, 第 487 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:09:40');
INSERT INTO `site_admin_log` VALUES (384, 2, 1, 2, '权限管理', '{\"id\":10,\"parent_id\":2,\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"system/user_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-02T20:17:33.6375767+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:17:34');
INSERT INTO `site_admin_log` VALUES (385, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:18:38.1917267 +0800 CST m=+24150.665835601, 第 488 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:18:38');
INSERT INTO `site_admin_log` VALUES (386, 2, 1, 2, '管理员', '{\"id\":1,\"role_id\":1,\"login_password\":\"admin\",\"status\":1,\"updated_at\":\"2020-03-02T20:27:43.8906152+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:27:44');
INSERT INTO `site_admin_log` VALUES (387, 2, 1, 2, '管理员', '{\"id\":48,\"role_id\":2,\"login_password\":\"test001\",\"status\":1,\"updated_at\":\"2020-03-02T20:27:55.9001032+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:27:56');
INSERT INTO `site_admin_log` VALUES (388, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部1\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T20:28:37.6599973+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:28:38');
INSERT INTO `site_admin_log` VALUES (389, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T20:29:12.9765472+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:29:13');
INSERT INTO `site_admin_log` VALUES (390, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部111\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T20:29:32.874514+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:29:33');
INSERT INTO `site_admin_log` VALUES (391, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-02T20:30:34.7988751+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:30:35');
INSERT INTO `site_admin_log` VALUES (392, 2, 1, 2, '管理员', '{\"id\":48,\"role_id\":2,\"login_password\":\"111111\",\"status\":1,\"updated_at\":\"2020-03-02T20:30:45.9525221+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:30:46');
INSERT INTO `site_admin_log` VALUES (393, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:31:06');
INSERT INTO `site_admin_log` VALUES (394, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:31:23.291255 +0800 CST m=+24915.765363901, 第 259 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:31:23');
INSERT INTO `site_admin_log` VALUES (395, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:31:31.1682323 +0800 CST m=+24923.642341201, 第 260 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:31:31');
INSERT INTO `site_admin_log` VALUES (396, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:31:52.57787 +0800 CST m=+24945.051978901, 第 261 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:31:53');
INSERT INTO `site_admin_log` VALUES (397, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:33:40.8785532 +0800 CST m=+25053.352662101, 第 489 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:33:41');
INSERT INTO `site_admin_log` VALUES (398, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:33:52.4522923 +0800 CST m=+25064.926401201, 第 262 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:33:52');
INSERT INTO `site_admin_log` VALUES (399, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:42:46.5069801 +0800 CST m=+25598.982102701, 第 490 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:42:47');
INSERT INTO `site_admin_log` VALUES (400, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:42:56.3957115 +0800 CST m=+25608.870834101, 第 263 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:42:56');
INSERT INTO `site_admin_log` VALUES (401, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:43:28.3749921 +0800 CST m=+25640.850114701, 第 491 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:43:28');
INSERT INTO `site_admin_log` VALUES (402, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:44:14.3301023 +0800 CST m=+25686.805224901, 第 264 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:44:14');
INSERT INTO `site_admin_log` VALUES (403, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:46:30.6298098 +0800 CST m=+25823.104932401, 第 492 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:46:31');
INSERT INTO `site_admin_log` VALUES (404, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:46:43.0590202 +0800 CST m=+25835.534142801, 第 493 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:46:43');
INSERT INTO `site_admin_log` VALUES (405, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:47:09.7485191 +0800 CST m=+25862.223641701, 第 265 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:47:10');
INSERT INTO `site_admin_log` VALUES (406, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:47:38.1730729 +0800 CST m=+25890.648195501, 第 266 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:47:38');
INSERT INTO `site_admin_log` VALUES (407, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:48:42.7901697 +0800 CST m=+25955.265292301, 第 494 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:48:43');
INSERT INTO `site_admin_log` VALUES (408, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:49:48.5142007 +0800 CST m=+26020.989323301, 第 267 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:49:49');
INSERT INTO `site_admin_log` VALUES (409, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:51:34.2137942 +0800 CST m=+26126.688916801, 第 495 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:51:34');
INSERT INTO `site_admin_log` VALUES (410, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:53:43.0311339 +0800 CST m=+26255.506256501, 第 496 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:53:43');
INSERT INTO `site_admin_log` VALUES (411, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 20:54:42.1827715 +0800 CST m=+26314.657894101, 第 497 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 20:54:42');
INSERT INTO `site_admin_log` VALUES (412, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:54:45.5865954 +0800 CST m=+26318.061718001, 第 268 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:54:46');
INSERT INTO `site_admin_log` VALUES (413, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:56:14.0458811 +0800 CST m=+26406.521003701, 第 269 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:56:14');
INSERT INTO `site_admin_log` VALUES (414, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 20:59:12.5987051 +0800 CST m=+26585.073827701, 第 270 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 20:59:13');
INSERT INTO `site_admin_log` VALUES (415, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:00:15.9593647 +0800 CST m=+26648.434487301, 第 498 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:00:16');
INSERT INTO `site_admin_log` VALUES (416, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:04:05.7068543 +0800 CST m=+26878.181976901, 第 499 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:04:06');
INSERT INTO `site_admin_log` VALUES (417, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:04:19.5091687 +0800 CST m=+26891.984291301, 第 500 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:04:20');
INSERT INTO `site_admin_log` VALUES (418, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:04:59.0429699 +0800 CST m=+26931.518092501, 第 271 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:04:59');
INSERT INTO `site_admin_log` VALUES (419, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:05:58.6669326 +0800 CST m=+26991.142055201, 第 501 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:05:59');
INSERT INTO `site_admin_log` VALUES (420, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:06:15.989596 +0800 CST m=+27008.464718601, 第 272 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:06:16');
INSERT INTO `site_admin_log` VALUES (421, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:16:33.8051977 +0800 CST m=+27626.280320301, 第 502 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:16:34');
INSERT INTO `site_admin_log` VALUES (422, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:16:48.6641447 +0800 CST m=+27641.139267301, 第 273 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:16:49');
INSERT INTO `site_admin_log` VALUES (423, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:17:06.8775773 +0800 CST m=+27659.352699901, 第 503 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:17:07');
INSERT INTO `site_admin_log` VALUES (424, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:17:56.2234841 +0800 CST m=+27708.698606701, 第 274 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:17:56');
INSERT INTO `site_admin_log` VALUES (425, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:18:48.7429761 +0800 CST m=+27761.218098701, 第 504 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:18:49');
INSERT INTO `site_admin_log` VALUES (426, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:19:17.9153646 +0800 CST m=+27790.390487201, 第 275 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:19:18');
INSERT INTO `site_admin_log` VALUES (427, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:19:28.2413853 +0800 CST m=+27800.716507901, 第 505 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:19:28');
INSERT INTO `site_admin_log` VALUES (428, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:19:46.5510765 +0800 CST m=+27819.026199101, 第 276 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:19:47');
INSERT INTO `site_admin_log` VALUES (429, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:20:00.0328255 +0800 CST m=+27832.507948101, 第 506 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:20:00');
INSERT INTO `site_admin_log` VALUES (430, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:20:46.814785 +0800 CST m=+27879.289907601, 第 507 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:20:47');
INSERT INTO `site_admin_log` VALUES (431, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:21:31.9200454 +0800 CST m=+27924.395168001, 第 277 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:21:32');
INSERT INTO `site_admin_log` VALUES (432, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:23:31.0519271 +0800 CST m=+28043.527049701, 第 508 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:23:31');
INSERT INTO `site_admin_log` VALUES (433, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:25:48.6063035 +0800 CST m=+28181.081426101, 第 278 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:25:49');
INSERT INTO `site_admin_log` VALUES (434, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:26:18.0363684 +0800 CST m=+28210.511491001, 第 509 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:26:18');
INSERT INTO `site_admin_log` VALUES (435, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:28:50.0147963 +0800 CST m=+28362.489918901, 第 510 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:28:50');
INSERT INTO `site_admin_log` VALUES (436, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:29:07.5700618 +0800 CST m=+28380.045184401, 第 511 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:29:08');
INSERT INTO `site_admin_log` VALUES (437, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:33:28.1219372 +0800 CST m=+28640.597059801, 第 512 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:33:28');
INSERT INTO `site_admin_log` VALUES (438, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:34:37.7147708 +0800 CST m=+28710.189893401, 第 513 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:34:38');
INSERT INTO `site_admin_log` VALUES (439, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:34:50.2856215 +0800 CST m=+28722.760744101, 第 279 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:34:50');
INSERT INTO `site_admin_log` VALUES (440, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:35:00.3073754 +0800 CST m=+28732.782498001, 第 514 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:35:00');
INSERT INTO `site_admin_log` VALUES (441, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-02 21:37:26.3680282 +0800 CST m=+28878.843150801, 第 515 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-02 21:37:26');
INSERT INTO `site_admin_log` VALUES (442, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-02 21:37:36.0929352 +0800 CST m=+28888.568057801, 第 280 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-02 21:37:36');
INSERT INTO `site_admin_log` VALUES (443, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:09:25.9687337 +0800 CST m=+73998.060053201, 第 516 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:09:26');
INSERT INTO `site_admin_log` VALUES (444, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:09:35.5177006 +0800 CST m=+74007.609020101, 第 281 次登陆', 48, 'test001', 0, '', '10.10.35.146', '2020-03-03 10:09:36');
INSERT INTO `site_admin_log` VALUES (445, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:10:11.2490565 +0800 CST m=+74043.340376001, 第 517 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:10:11');
INSERT INTO `site_admin_log` VALUES (446, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"php+go12\",\"updated_at\":\"2020-03-03T10:10:44.6540543+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:10:45');
INSERT INTO `site_admin_log` VALUES (447, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:11:33.3875892 +0800 CST m=+74125.478908701, 第 282 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:11:33');
INSERT INTO `site_admin_log` VALUES (448, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:12:46.0326736 +0800 CST m=+74198.123993101, 第 518 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:12:46');
INSERT INTO `site_admin_log` VALUES (449, 2, 1, 2, '权限控制', '{\"role_id\":2,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:12:54');
INSERT INTO `site_admin_log` VALUES (450, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:24:04.4821221 +0800 CST m=+87.605202301, 第 519 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:24:04');
INSERT INTO `site_admin_log` VALUES (451, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:24:24.5328913 +0800 CST m=+107.655971501, 第 520 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:24:25');
INSERT INTO `site_admin_log` VALUES (452, 2, 1, 2, '权限管理', '{\"id\":2,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"permission_path\":\"system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:09.1405022+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:09');
INSERT INTO `site_admin_log` VALUES (453, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"system/auth_list\",\"permission_path\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:15.7914348+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:16');
INSERT INTO `site_admin_log` VALUES (454, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"system/auth_add\",\"permission_path\":\"system/auth_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:20.4370833+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:20');
INSERT INTO `site_admin_log` VALUES (455, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"system/auth_edit\",\"permission_path\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:26.3934424+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:26');
INSERT INTO `site_admin_log` VALUES (456, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"system/role_list\",\"permission_path\":\"system/role_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:32.804272+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:33');
INSERT INTO `site_admin_log` VALUES (457, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"system/role_add\",\"permission_path\":\"system/role_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:38.3891736+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:38');
INSERT INTO `site_admin_log` VALUES (458, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"system/role_edit\",\"permission_path\":\"system/role_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:53.435698+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:53');
INSERT INTO `site_admin_log` VALUES (459, 2, 1, 2, '权限管理', '{\"id\":9,\"parent_id\":2,\"permission_name\":\"用户列表\",\"permission_code\":\"system/user_list\",\"permission_path\":\"system/user_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:29:58.8396689+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:29:59');
INSERT INTO `site_admin_log` VALUES (460, 2, 1, 2, '权限管理', '{\"id\":10,\"parent_id\":2,\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"system/user_edit\",\"permission_path\":\"system/user_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:30:03.1909149+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:30:03');
INSERT INTO `site_admin_log` VALUES (461, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:31:14.0143626 +0800 CST m=+517.137442801, 第 521 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:31:14');
INSERT INTO `site_admin_log` VALUES (462, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:31:51.9518122 +0800 CST m=+555.074892401, 第 522 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:31:52');
INSERT INTO `site_admin_log` VALUES (463, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:34:10.2274989 +0800 CST m=+78.863501701, 第 523 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:34:10');
INSERT INTO `site_admin_log` VALUES (464, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:34:54.3334117 +0800 CST m=+122.969414501, 第 524 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:34:54');
INSERT INTO `site_admin_log` VALUES (465, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:35:23.9118925+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:35:24');
INSERT INTO `site_admin_log` VALUES (466, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:35:42.5414323+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:35:43');
INSERT INTO `site_admin_log` VALUES (467, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:35:59.9541282+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 10:36:00');
INSERT INTO `site_admin_log` VALUES (468, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 10:39:29.3071221 +0800 CST m=+397.943124901, 第 525 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:39:29');
INSERT INTO `site_admin_log` VALUES (469, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:40:09.2181699+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:40:09');
INSERT INTO `site_admin_log` VALUES (470, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:40:36.1944834+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:40:36');
INSERT INTO `site_admin_log` VALUES (471, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_add\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:41:11.5750918+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:41:12');
INSERT INTO `site_admin_log` VALUES (472, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:41:35.3946176+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:41:35');
INSERT INTO `site_admin_log` VALUES (473, 2, 1, 2, '权限管理', '{\"id\":9,\"parent_id\":2,\"permission_name\":\"用户列表\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:42:07.7829073+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:42:08');
INSERT INTO `site_admin_log` VALUES (474, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:42:37.4432648 +0800 CST m=+52938.291660401, 第 283 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:42:37');
INSERT INTO `site_admin_log` VALUES (475, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:43:49.6479452 +0800 CST m=+53010.496340801, 第 284 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:43:50');
INSERT INTO `site_admin_log` VALUES (476, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:44:17.5144889 +0800 CST m=+3.128520801, 第 285 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:44:18');
INSERT INTO `site_admin_log` VALUES (477, 2, 1, 2, '权限管理', '{\"id\":10,\"parent_id\":2,\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:44:48.2420597+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:44:48');
INSERT INTO `site_admin_log` VALUES (478, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:45:40.7688007 +0800 CST m=+2.989572401, 第 286 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:45:41');
INSERT INTO `site_admin_log` VALUES (479, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:46:48.9827917+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:46:49');
INSERT INTO `site_admin_log` VALUES (480, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:47:03.8587069 +0800 CST m=+2.755803101, 第 287 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:47:04');
INSERT INTO `site_admin_log` VALUES (481, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:47:08.14199+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:47:08');
INSERT INTO `site_admin_log` VALUES (482, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:47:52.6753591 +0800 CST m=+4.050412001, 第 288 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:47:53');
INSERT INTO `site_admin_log` VALUES (483, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:49:34.9453799+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:49:35');
INSERT INTO `site_admin_log` VALUES (484, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":1,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:49:59.5972664+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:50:00');
INSERT INTO `site_admin_log` VALUES (485, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:50:34.3713212+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:50:34');
INSERT INTO `site_admin_log` VALUES (486, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:50:42.3667954+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:50:42');
INSERT INTO `site_admin_log` VALUES (487, 2, 1, 2, '权限管理', '{\"id\":9,\"parent_id\":2,\"permission_name\":\"用户列表\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:50:51.3542202+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:50:51');
INSERT INTO `site_admin_log` VALUES (488, 2, 1, 2, '权限管理', '{\"id\":10,\"parent_id\":2,\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_edit\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-03T10:52:34.1179531+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:52:34');
INSERT INTO `site_admin_log` VALUES (489, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 10:54:50.0325057 +0800 CST m=+3.461137001, 第 289 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 10:54:50');
INSERT INTO `site_admin_log` VALUES (490, 1, 1, 1, '角色管理', '{\"id\":0,\"role_name\":\"测试\",\"role_code\":\"\",\"status\":1,\"remark\":\"\",\"created_at\":\"2020-03-03T10:54:52.9510835+08:00\",\"updated_at\":\"2020-03-03T10:54:52.9510835+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:54:53');
INSERT INTO `site_admin_log` VALUES (491, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 10:55:21');
INSERT INTO `site_admin_log` VALUES (492, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 10:57:43.7928226 +0800 CST m=+1492.793878001, 第 1 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 10:57:44');
INSERT INTO `site_admin_log` VALUES (493, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:02:56.7662307 +0800 CST m=+1805.767286101, 第 2 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:02:57');
INSERT INTO `site_admin_log` VALUES (494, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:03:47.8913194 +0800 CST m=+1856.892374801, 第 526 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:03:48');
INSERT INTO `site_admin_log` VALUES (495, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:04:15.7447629 +0800 CST m=+1884.745818301, 第 3 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:04:16');
INSERT INTO `site_admin_log` VALUES (496, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:05:55.0805695 +0800 CST m=+1984.081624901, 第 527 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:05:55');
INSERT INTO `site_admin_log` VALUES (497, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:06:04.5956604 +0800 CST m=+1993.596715801, 第 4 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:06:05');
INSERT INTO `site_admin_log` VALUES (498, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:06:17.9547072 +0800 CST m=+2006.955762601, 第 528 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:06:18');
INSERT INTO `site_admin_log` VALUES (499, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:06:34.7455852 +0800 CST m=+2023.746640601, 第 5 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:06:35');
INSERT INTO `site_admin_log` VALUES (500, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:06:51.8364841 +0800 CST m=+2040.837539501, 第 529 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:06:52');
INSERT INTO `site_admin_log` VALUES (501, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:07:50.6543079 +0800 CST m=+13.246150101, 第 6 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:07:51');
INSERT INTO `site_admin_log` VALUES (502, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:08:05.410256 +0800 CST m=+28.002098201, 第 530 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:08:05');
INSERT INTO `site_admin_log` VALUES (503, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:08:13');
INSERT INTO `site_admin_log` VALUES (504, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 11:08:20.3509818 +0800 CST m=+37.017012801, 第 290 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 11:08:20');
INSERT INTO `site_admin_log` VALUES (505, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:08:20.6669001 +0800 CST m=+43.258742301, 第 7 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:08:21');
INSERT INTO `site_admin_log` VALUES (506, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:08:33.1160153 +0800 CST m=+55.707857501, 第 531 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:08:33');
INSERT INTO `site_admin_log` VALUES (507, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-03T11:08:40.0119926+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:08:40');
INSERT INTO `site_admin_log` VALUES (508, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:08:44');
INSERT INTO `site_admin_log` VALUES (509, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:08:57.6328563 +0800 CST m=+80.224698501, 第 8 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:08:58');
INSERT INTO `site_admin_log` VALUES (510, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:09:32.6008979 +0800 CST m=+115.192740101, 第 9 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:09:33');
INSERT INTO `site_admin_log` VALUES (511, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:09:53.6847692 +0800 CST m=+136.276611401, 第 532 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:09:54');
INSERT INTO `site_admin_log` VALUES (512, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:10:09.3935692 +0800 CST m=+146.059600201, 第 10 次登陆', 54, 'clear1', 0, '', '10.10.35.250', '2020-03-03 11:10:09');
INSERT INTO `site_admin_log` VALUES (513, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:10:29.0107402 +0800 CST m=+171.602582401, 第 11 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:10:29');
INSERT INTO `site_admin_log` VALUES (514, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:10:51.4403337 +0800 CST m=+194.032175901, 第 12 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:10:51');
INSERT INTO `site_admin_log` VALUES (515, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:12:33.4239896 +0800 CST m=+2.853657201, 第 13 次登陆', 54, 'clear1', 0, '', '10.10.35.250', '2020-03-03 11:12:33');
INSERT INTO `site_admin_log` VALUES (516, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:13:54.8400707 +0800 CST m=+84.269738301, 第 14 次登陆', 54, 'clear1', 0, '', '10.10.35.250', '2020-03-03 11:13:55');
INSERT INTO `site_admin_log` VALUES (517, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:14:44.2411269 +0800 CST m=+3.375033501, 第 15 次登陆', 54, 'clear1', 0, '', '10.10.35.250', '2020-03-03 11:14:44');
INSERT INTO `site_admin_log` VALUES (518, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:15:35.7518819 +0800 CST m=+29.313130401, 第 16 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:15:36');
INSERT INTO `site_admin_log` VALUES (519, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:15:57.7064209 +0800 CST m=+51.267669401, 第 17 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:15:58');
INSERT INTO `site_admin_log` VALUES (520, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:16:14.2074586 +0800 CST m=+67.768707101, 第 533 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:16:14');
INSERT INTO `site_admin_log` VALUES (521, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:16:35');
INSERT INTO `site_admin_log` VALUES (522, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:16:58.2598338 +0800 CST m=+111.821082301, 第 18 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:16:58');
INSERT INTO `site_admin_log` VALUES (523, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:17:11');
INSERT INTO `site_admin_log` VALUES (524, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 11:18:40.0608225 +0800 CST m=+20.539993301, 第 291 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 11:18:40');
INSERT INTO `site_admin_log` VALUES (525, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:18:47.4362016 +0800 CST m=+220.997450101, 第 534 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:18:47');
INSERT INTO `site_admin_log` VALUES (526, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:19:25.7463828 +0800 CST m=+259.307631301, 第 19 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:19:26');
INSERT INTO `site_admin_log` VALUES (527, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:19:42.3905858 +0800 CST m=+275.951834301, 第 535 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:19:42');
INSERT INTO `site_admin_log` VALUES (528, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:20:38.4707775 +0800 CST m=+332.032026001, 第 536 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:20:38');
INSERT INTO `site_admin_log` VALUES (529, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 11:30:34.4421373 +0800 CST m=+4.546601401, 第 292 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 11:30:34');
INSERT INTO `site_admin_log` VALUES (530, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:32:52');
INSERT INTO `site_admin_log` VALUES (531, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:33:00.0729068 +0800 CST m=+1073.634155301, 第 20 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:33:00');
INSERT INTO `site_admin_log` VALUES (532, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:36:35.8627605 +0800 CST m=+1289.424009001, 第 21 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:36:36');
INSERT INTO `site_admin_log` VALUES (533, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:37:02.1372268 +0800 CST m=+1315.698475301, 第 22 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:37:02');
INSERT INTO `site_admin_log` VALUES (534, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:39:24.4852316 +0800 CST m=+1458.046480101, 第 23 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:39:24');
INSERT INTO `site_admin_log` VALUES (535, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:39:36.5784277 +0800 CST m=+1470.139676201, 第 537 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:39:37');
INSERT INTO `site_admin_log` VALUES (536, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:39:42.1985724 +0800 CST m=+1475.759820901, 第 24 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:39:42');
INSERT INTO `site_admin_log` VALUES (537, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:40:08.9209832 +0800 CST m=+1502.491498301, 第 25 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:40:09');
INSERT INTO `site_admin_log` VALUES (538, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:41:12.8688381 +0800 CST m=+1566.439353201, 第 26 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:41:13');
INSERT INTO `site_admin_log` VALUES (539, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 11:41:36.4205757 +0800 CST m=+1589.991090801, 第 538 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:41:36');
INSERT INTO `site_admin_log` VALUES (540, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:51:56');
INSERT INTO `site_admin_log` VALUES (541, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:52:03.4146435 +0800 CST m=+2216.985173401, 第 27 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:52:03');
INSERT INTO `site_admin_log` VALUES (542, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 11:52:40');
INSERT INTO `site_admin_log` VALUES (543, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 11:53:52.7999106 +0800 CST m=+2326.370440501, 第 28 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 11:53:53');
INSERT INTO `site_admin_log` VALUES (544, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 12:08:57.1116994 +0800 CST m=+3230.682229301, 第 539 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 12:08:57');
INSERT INTO `site_admin_log` VALUES (545, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 12:09:05');
INSERT INTO `site_admin_log` VALUES (546, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 12:09:12.3901821 +0800 CST m=+3245.960712001, 第 29 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 12:09:12');
INSERT INTO `site_admin_log` VALUES (547, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 12:09:27');
INSERT INTO `site_admin_log` VALUES (548, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 12:09:31.4833381 +0800 CST m=+3265.053868001, 第 30 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 12:09:31');
INSERT INTO `site_admin_log` VALUES (549, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 12:17:42.1575118 +0800 CST m=+3755.728041701, 第 31 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 12:17:42');
INSERT INTO `site_admin_log` VALUES (550, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 12:46:36.7277638 +0800 CST m=+5490.314835601, 第 540 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 12:46:37');
INSERT INTO `site_admin_log` VALUES (551, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 12:52:43.8138859 +0800 CST m=+5857.400957701, 第 32 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 12:52:44');
INSERT INTO `site_admin_log` VALUES (552, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 12:53:01.1458321 +0800 CST m=+5874.732903901, 第 541 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 12:53:01');
INSERT INTO `site_admin_log` VALUES (553, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:04:13.1986255 +0800 CST m=+33.480458701, 第 293 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:04:13');
INSERT INTO `site_admin_log` VALUES (554, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:05:46.8292055 +0800 CST m=+7.127514001, 第 294 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:05:47');
INSERT INTO `site_admin_log` VALUES (555, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:06:37.042705 +0800 CST m=+10.299374701, 第 295 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:06:37');
INSERT INTO `site_admin_log` VALUES (556, 2, 1, 1, '管理员', '{\"id\":0,\"role_id\":2,\"role_name\":\"\",\"account\":\"test0011\",\"nick_name\":\"\",\"login_password\":\"test001\",\"secret_key\":\"\",\"status\":0,\"created_at\":\"2020-03-03T13:06:43.9058431+08:00\",\"updated_at\":\"2020-03-03T13:06:43.9058431+08:00\",\"created_id\":48,\"created_ip\":\"10.10.35.250\",\"last_login_ip\":\"10.10.35.250\",\"login_count\":0,\"last_login_time\":\"2020-03-03T13:06:43.9058431+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:06:44');
INSERT INTO `site_admin_log` VALUES (557, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 13:16:26.3704152 +0800 CST m=+7279.957487001, 第 33 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 13:16:26');
INSERT INTO `site_admin_log` VALUES (558, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 13:23:23.9065848 +0800 CST m=+7697.493656601, 第 542 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 13:23:24');
INSERT INTO `site_admin_log` VALUES (559, 2, 1, 2, '权限控制', '{\"role_id\":22,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 13:25:50');
INSERT INTO `site_admin_log` VALUES (560, 2, 1, 1, '管理员', '{\"id\":0,\"role_id\":2,\"role_name\":\"\",\"account\":\"test0011\",\"nick_name\":\"\",\"login_password\":\"test001\",\"secret_key\":\"\",\"status\":0,\"created_at\":\"2020-03-03T13:43:55.2633373+08:00\",\"updated_at\":\"2020-03-03T13:43:55.2633373+08:00\",\"created_id\":48,\"created_ip\":\"10.10.35.250\",\"last_login_ip\":\"10.10.35.250\",\"login_count\":0,\"last_login_time\":\"2020-03-03T13:43:55.2633373+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:43:55');
INSERT INTO `site_admin_log` VALUES (561, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:45:36.0242404 +0800 CST m=+2.713281501, 第 296 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:45:36');
INSERT INTO `site_admin_log` VALUES (562, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:46:43.0473097 +0800 CST m=+69.736350801, 第 297 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:46:43');
INSERT INTO `site_admin_log` VALUES (563, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-03 13:46:57.9566608 +0800 CST m=+2.093610201, 第 298 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-03 13:46:58');
INSERT INTO `site_admin_log` VALUES (564, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 13:47:48.2737947 +0800 CST m=+70.890808201, 第 543 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 13:47:48');
INSERT INTO `site_admin_log` VALUES (565, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 13:51:43.8576605 +0800 CST m=+306.474674001, 第 34 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 13:51:44');
INSERT INTO `site_admin_log` VALUES (566, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 14:00:18.9100727 +0800 CST m=+821.527086201, 第 544 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:00:19');
INSERT INTO `site_admin_log` VALUES (567, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"permission_path\":\"-\",\"request_param\":\"OPTIONS\",\"sort\":1,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:01:03.0711566+08:00\",\"updated_at\":\"2020-03-03T14:01:03.0711566+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:01:03');
INSERT INTO `site_admin_log` VALUES (568, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"任务管理\",\"permission_code\":\"site_task\",\"permission_path\":\"1\",\"request_param\":\"OPTIONS\",\"sort\":2,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:02:10.8791577+08:00\",\"updated_at\":\"2020-03-03T14:02:10.8791577+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:02:11');
INSERT INTO `site_admin_log` VALUES (569, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"sort\":3,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:02:58.5172818+08:00\",\"updated_at\":\"2020-03-03T14:02:58.5172818+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:02:59');
INSERT INTO `site_admin_log` VALUES (570, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"订单管理\",\"permission_code\":\"site_order\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"sort\":4,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:03:43.3308682+08:00\",\"updated_at\":\"2020-03-03T14:03:43.3308682+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:03:43');
INSERT INTO `site_admin_log` VALUES (571, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"sort\":0,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:04:21.3859293+08:00\",\"updated_at\":\"2020-03-03T14:04:21.3859293+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:04:21');
INSERT INTO `site_admin_log` VALUES (572, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"控制台\",\"permission_code\":\"site_console\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"sort\":0,\"type\":1,\"status\":1,\"created_at\":\"2020-03-03T14:04:47.500401+08:00\",\"updated_at\":\"2020-03-03T14:04:47.500401+08:00\",\"created_ip\":\"10.10.35.250\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:04:48');
INSERT INTO `site_admin_log` VALUES (573, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:05:08.7797414+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:05:09');
INSERT INTO `site_admin_log` VALUES (574, 2, 1, 2, '权限管理', '{\"id\":11,\"parent_id\":1,\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"permission_path\":\"1\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:05:26.305335+08:00\"}', 1, 'admin', 0, '', '10.10.35.250', '2020-03-03 14:05:26');
INSERT INTO `site_admin_log` VALUES (575, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/role_editd\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:46:37.1634074+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 14:46:37');
INSERT INTO `site_admin_log` VALUES (576, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/role_editd\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:46:37.5814057+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 14:46:38');
INSERT INTO `site_admin_log` VALUES (577, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_edit\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:46:58.6867866+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 14:46:59');
INSERT INTO `site_admin_log` VALUES (578, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T14:47:12.4695125+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 14:47:12');
INSERT INTO `site_admin_log` VALUES (579, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 14:53:17.2984281 +0800 CST m=+3999.931138301, 第 35 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 14:53:17');
INSERT INTO `site_admin_log` VALUES (580, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 15:05:24.2199022 +0800 CST m=+4726.852612401, 第 545 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:05:24');
INSERT INTO `site_admin_log` VALUES (581, 2, 1, 2, '权限管理', '{\"id\":11,\"parent_id\":1,\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"permission_path\":\"member\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T15:06:47.6574351+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 15:06:48');
INSERT INTO `site_admin_log` VALUES (582, 2, 1, 2, '权限管理', '{\"id\":16,\"parent_id\":1,\"permission_name\":\"控制台\",\"permission_code\":\"site_console\",\"permission_path\":\"Dashbord\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":0,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T15:08:44.478359+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 15:08:45');
INSERT INTO `site_admin_log` VALUES (583, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"会员列表\",\"permission_code\":\"user\",\"permission_path\":\"member/member_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T15:10:26.268862+08:00\",\"updated_at\":\"2020-03-03T15:10:26.268862+08:00\",\"created_ip\":\"10.10.35.146\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 15:10:26');
INSERT INTO `site_admin_log` VALUES (584, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"system/role_list\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":3,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T15:11:42.5425723+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:11:43');
INSERT INTO `site_admin_log` VALUES (585, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"site_order\",\"permission_path\":\"system/role_edit\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":4,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T15:12:13.9097483+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:12:14');
INSERT INTO `site_admin_log` VALUES (586, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"system/auth_add\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T15:12:22.4029842+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:12:22');
INSERT INTO `site_admin_log` VALUES (587, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:12:47');
INSERT INTO `site_admin_log` VALUES (588, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 15:15:50.2688001 +0800 CST m=+5352.901510301, 第 36 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 15:15:50');
INSERT INTO `site_admin_log` VALUES (589, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 15:17:20.6543241 +0800 CST m=+5443.287034301, 第 37 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 15:17:21');
INSERT INTO `site_admin_log` VALUES (590, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 15:23:35.3674529 +0800 CST m=+5818.000163101, 第 546 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 15:23:35');
INSERT INTO `site_admin_log` VALUES (591, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:04:02.5936045 +0800 CST m=+8245.251035401, 第 547 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:04:03');
INSERT INTO `site_admin_log` VALUES (592, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:05:26.6437616 +0800 CST m=+8329.301192501, 第 548 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:05:27');
INSERT INTO `site_admin_log` VALUES (593, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:08:55.8497712 +0800 CST m=+8538.507202101, 第 549 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:08:56');
INSERT INTO `site_admin_log` VALUES (594, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:11:31.6784802 +0800 CST m=+8694.335911101, 第 550 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:11:32');
INSERT INTO `site_admin_log` VALUES (595, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:11:34.3159379 +0800 CST m=+8696.973368801, 第 551 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:11:34');
INSERT INTO `site_admin_log` VALUES (596, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 16:11:46.9164582 +0800 CST m=+8709.573889101, 第 38 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 16:11:47');
INSERT INTO `site_admin_log` VALUES (597, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:21:38.9566394 +0800 CST m=+9301.614070301, 第 552 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:21:39');
INSERT INTO `site_admin_log` VALUES (598, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"存款列表\",\"permission_code\":\"user_deposit\",\"permission_path\":\"member/deposit_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T16:25:26.9382879+08:00\",\"updated_at\":\"2020-03-03T16:25:26.9382879+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:25:27');
INSERT INTO `site_admin_log` VALUES (599, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"取款列表\",\"permission_code\":\"user_withdraw\",\"permission_path\":\"member/withdraw_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T16:28:29.9664015+08:00\",\"updated_at\":\"2020-03-03T16:28:29.9664015+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:28:30');
INSERT INTO `site_admin_log` VALUES (600, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:29:00.4173089 +0800 CST m=+9743.074739801, 第 554 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:29:00');
INSERT INTO `site_admin_log` VALUES (601, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 16:29:17.8233485 +0800 CST m=+9760.480779401, 第 553 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 16:29:18');
INSERT INTO `site_admin_log` VALUES (602, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 17:37:40.6574645 +0800 CST m=+13863.274016301, 第 555 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 17:37:41');
INSERT INTO `site_admin_log` VALUES (603, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 17:37:40.8664646 +0800 CST m=+13863.483016401, 第 556 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 17:37:41');
INSERT INTO `site_admin_log` VALUES (604, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 17:55:25.4323339 +0800 CST m=+14928.088035201, 第 557 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 17:55:25');
INSERT INTO `site_admin_log` VALUES (605, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 17:56:14.7254971 +0800 CST m=+14977.381198401, 第 558 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 17:56:15');
INSERT INTO `site_admin_log` VALUES (606, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:01:19.2435413 +0800 CST m=+23.805973201, 第 559 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:01:19');
INSERT INTO `site_admin_log` VALUES (607, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:04:16.2412861 +0800 CST m=+200.803718001, 第 560 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:04:16');
INSERT INTO `site_admin_log` VALUES (608, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"银行卡列表\",\"permission_code\":\"user_bank\",\"permission_path\":\"member/bank_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T18:12:50.6410281+08:00\",\"updated_at\":\"2020-03-03T18:12:50.6410281+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:12:51');
INSERT INTO `site_admin_log` VALUES (609, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:13:50.511269 +0800 CST m=+775.073700901, 第 561 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:13:51');
INSERT INTO `site_admin_log` VALUES (610, 2, 1, 2, '权限管理', '{\"id\":12,\"parent_id\":1,\"permission_name\":\"任务管理\",\"permission_code\":\"site_task\",\"permission_path\":\"task\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":2,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T18:28:27.2068237+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:28:27');
INSERT INTO `site_admin_log` VALUES (611, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":12,\"joins\":\"1,12\",\"permission_name\":\"任务发布列表\",\"permission_code\":\"task_publish\",\"permission_path\":\"task/publish_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T18:29:35.8229053+08:00\",\"updated_at\":\"2020-03-03T18:29:35.8229053+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:29:36');
INSERT INTO `site_admin_log` VALUES (612, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":12},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:34:20');
INSERT INTO `site_admin_log` VALUES (613, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":12},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:34:51');
INSERT INTO `site_admin_log` VALUES (614, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 18:35:03.5525392 +0800 CST m=+2048.114971101, 第 39 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 18:35:04');
INSERT INTO `site_admin_log` VALUES (615, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:35:38.4581839 +0800 CST m=+2083.020615801, 第 562 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:35:38');
INSERT INTO `site_admin_log` VALUES (616, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:35:55.6750831 +0800 CST m=+2100.237515001, 第 563 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:35:56');
INSERT INTO `site_admin_log` VALUES (617, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:37:47.6013806 +0800 CST m=+2212.163812501, 第 564 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:37:48');
INSERT INTO `site_admin_log` VALUES (618, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:38:08.7713558 +0800 CST m=+2233.333787701, 第 565 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:38:09');
INSERT INTO `site_admin_log` VALUES (619, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:39:04.7555286 +0800 CST m=+2289.317960501, 第 566 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:39:05');
INSERT INTO `site_admin_log` VALUES (620, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:39:21.8807927 +0800 CST m=+2306.443224601, 第 567 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:39:22');
INSERT INTO `site_admin_log` VALUES (621, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 18:40:02.8980851 +0800 CST m=+2346.857827801, 第 568 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:40:03');
INSERT INTO `site_admin_log` VALUES (622, 2, 1, 2, '权限管理', '{\"id\":21,\"parent_id\":12,\"permission_name\":\"发布任务列表\",\"permission_code\":\"task_publish\",\"permission_path\":\"task/publish_list\",\"request_param\":\"GET\",\"joins\":\"1,12\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-03T18:51:59.3816649+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:52:00');
INSERT INTO `site_admin_log` VALUES (623, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":12,\"joins\":\"1,12\",\"permission_name\":\"接单任务列表\",\"permission_code\":\"task_subscribe\",\"permission_path\":\"task/subscribe_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T18:59:28.5125596+08:00\",\"updated_at\":\"2020-03-03T18:59:28.5125596+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 18:59:29');
INSERT INTO `site_admin_log` VALUES (624, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:01:33');
INSERT INTO `site_admin_log` VALUES (625, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 19:01:52.8375414 +0800 CST m=+3656.797284101, 第 40 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 19:01:53');
INSERT INTO `site_admin_log` VALUES (626, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 19:02:52.9730572 +0800 CST m=+3716.932799901, 第 41 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 19:02:53');
INSERT INTO `site_admin_log` VALUES (627, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":12,\"joins\":\"1,12\",\"permission_name\":\"任务类型列表\",\"permission_code\":\"task\",\"permission_path\":\"task/type_list\",\"request_param\":\"GET\",\"sort\":1,\"type\":2,\"status\":1,\"created_at\":\"2020-03-03T19:16:40.9495238+08:00\",\"updated_at\":\"2020-03-03T19:16:40.9495238+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:16:41');
INSERT INTO `site_admin_log` VALUES (628, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":12},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:16:53');
INSERT INTO `site_admin_log` VALUES (629, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":19},{\\\"id\\\":18},{\\\"id\\\":17},{\\\"id\\\":12},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:17:37');
INSERT INTO `site_admin_log` VALUES (630, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 19:17:40.8502057 +0800 CST m=+4604.809948401, 第 569 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:17:41');
INSERT INTO `site_admin_log` VALUES (631, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-03 19:19:21.1773958 +0800 CST m=+4705.137138501, 第 570 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-03 19:19:21');
INSERT INTO `site_admin_log` VALUES (632, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-03 19:19:49.2239338 +0800 CST m=+4733.183676501, 第 42 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-03 19:19:49');
INSERT INTO `site_admin_log` VALUES (633, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 09:57:17.7929054 +0800 CST m=+57382.315533201, 第 43 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 09:57:18');
INSERT INTO `site_admin_log` VALUES (634, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 10:08:37.2145283 +0800 CST m=+58061.737156101, 第 44 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 10:08:37');
INSERT INTO `site_admin_log` VALUES (635, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":12,\"joins\":\"1,12\",\"permission_name\":\"创建任务类型\",\"permission_code\":\"task\",\"permission_path\":\"task/type_add\",\"request_param\":\"POST\",\"sort\":1,\"type\":3,\"status\":1,\"created_at\":\"2020-03-04T10:36:24.6559319+08:00\",\"updated_at\":\"2020-03-04T10:36:24.6559319+08:00\",\"created_ip\":\"10.10.35.146\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 10:36:25');
INSERT INTO `site_admin_log` VALUES (636, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 10:39:10.2101394 +0800 CST m=+59894.732767201, 第 571 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-04 10:39:10');
INSERT INTO `site_admin_log` VALUES (637, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 10:40:01.3100383 +0800 CST m=+59945.833924001, 第 45 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 10:40:01');
INSERT INTO `site_admin_log` VALUES (638, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 10:40:30.1291418 +0800 CST m=+59974.653027501, 第 572 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 10:40:30');
INSERT INTO `site_admin_log` VALUES (639, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":19},{\\\"id\\\":18},{\\\"id\\\":17},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 10:40:41');
INSERT INTO `site_admin_log` VALUES (640, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 10:52:26.6947341 +0800 CST m=+60691.218619801, 第 46 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 10:52:27');
INSERT INTO `site_admin_log` VALUES (641, 1, 1, 1, '任务', '{\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":1,\"created_at\":\"2020-03-04T10:53:55.8745448+08:00\",\"updated_at\":\"2020-03-04T10:53:55.8745448+08:00\"}', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 10:53:56');
INSERT INTO `site_admin_log` VALUES (642, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 11:06:46.7970344 +0800 CST m=+61551.320920101, 第 47 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 11:06:47');
INSERT INTO `site_admin_log` VALUES (643, 2, 1, 2, '权限管理', '{\"id\":16,\"parent_id\":1,\"permission_name\":\"控制台\",\"permission_code\":\"site_console\",\"permission_path\":\"Dashboard\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":0,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:34:55.7855137+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:34:56');
INSERT INTO `site_admin_log` VALUES (644, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:35:01.0688845 +0800 CST m=+63245.592770201, 第 573 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:35:01');
INSERT INTO `site_admin_log` VALUES (645, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:35:38.5852554 +0800 CST m=+63283.109141101, 第 574 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:35:39');
INSERT INTO `site_admin_log` VALUES (646, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:35:38.5872556 +0800 CST m=+63283.111141301, 第 574 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:35:39');
INSERT INTO `site_admin_log` VALUES (647, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:37:39.0739769 +0800 CST m=+63403.597862601, 第 575 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:37:39');
INSERT INTO `site_admin_log` VALUES (648, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:38:37.3124426 +0800 CST m=+63461.836328301, 第 576 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:38:37');
INSERT INTO `site_admin_log` VALUES (649, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:38:47.9296293 +0800 CST m=+63472.453515001, 第 577 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:38:48');
INSERT INTO `site_admin_log` VALUES (650, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:39:41.9834449 +0800 CST m=+63526.507330601, 第 578 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:39:42');
INSERT INTO `site_admin_log` VALUES (651, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 11:42:07.3870787 +0800 CST m=+63671.913046001, 第 579 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:42:07');
INSERT INTO `site_admin_log` VALUES (652, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 11:43:19.9917952 +0800 CST m=+63744.517762501, 第 48 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 11:43:20');
INSERT INTO `site_admin_log` VALUES (653, 2, 1, 2, '权限管理', '{\"id\":16,\"parent_id\":1,\"permission_name\":\"控制台\",\"permission_code\":\"site_console\",\"permission_path\":\"Dashboard\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:49:45.6538576+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:49:46');
INSERT INTO `site_admin_log` VALUES (654, 2, 1, 2, '权限管理', '{\"id\":2,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"permission_path\":\"system\",\"request_param\":\"PUT\",\"joins\":\"1\",\"sort\":2,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:50:03.490552+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:50:04');
INSERT INTO `site_admin_log` VALUES (655, 2, 1, 2, '权限管理', '{\"id\":11,\"parent_id\":1,\"permission_name\":\"会员管理\",\"permission_code\":\"site_user\",\"permission_path\":\"member\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":3,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:50:24.4273725+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:50:24');
INSERT INTO `site_admin_log` VALUES (656, 2, 1, 2, '权限管理', '{\"id\":12,\"parent_id\":1,\"permission_name\":\"任务管理\",\"permission_code\":\"site_task\",\"permission_path\":\"task\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":4,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:50:36.4396648+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:50:36');
INSERT INTO `site_admin_log` VALUES (657, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"system/role_list\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:50:54.6726977+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:50:55');
INSERT INTO `site_admin_log` VALUES (658, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"site_order\",\"permission_path\":\"system/role_edit\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:51:07.949889+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:51:08');
INSERT INTO `site_admin_log` VALUES (659, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"site_order\",\"permission_path\":\"system/role_edit\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T11:51:22.1058374+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 11:51:22');
INSERT INTO `site_admin_log` VALUES (660, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:27:05.9823291 +0800 CST m=+66370.508296401, 第 49 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:27:06');
INSERT INTO `site_admin_log` VALUES (661, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":2},{\\\"id\\\":5},{\\\"id\\\":4},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":19},{\\\"id\\\":18},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":12},{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:27:34');
INSERT INTO `site_admin_log` VALUES (662, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:28:05.411786 +0800 CST m=+66429.937753301, 第 50 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:28:05');
INSERT INTO `site_admin_log` VALUES (663, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 12:28:46.7924591 +0800 CST m=+66471.318426401, 第 580 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:28:47');
INSERT INTO `site_admin_log` VALUES (664, 2, 1, 2, '权限管理', '{\"id\":18,\"parent_id\":11,\"permission_name\":\"存款列表\",\"permission_code\":\"user_deposit\",\"permission_path\":\"member/deposit_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:29:29.0253057+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:29:29');
INSERT INTO `site_admin_log` VALUES (665, 2, 1, 2, '权限管理', '{\"id\":20,\"parent_id\":11,\"permission_name\":\"银行卡列表\",\"permission_code\":\"user_bank\",\"permission_path\":\"member/bank_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:29:50.8443578+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:29:51');
INSERT INTO `site_admin_log` VALUES (666, 2, 1, 2, '权限管理', '{\"id\":18,\"parent_id\":11,\"permission_name\":\"存款列表\",\"permission_code\":\"user_deposit\",\"permission_path\":\"member/deposit_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":3,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:29:58.7550409+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:29:59');
INSERT INTO `site_admin_log` VALUES (667, 2, 1, 2, '权限管理', '{\"id\":19,\"parent_id\":11,\"permission_name\":\"取款列表\",\"permission_code\":\"user_withdraw\",\"permission_path\":\"member/withdraw_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":4,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:30:40.2503426+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:30:40');
INSERT INTO `site_admin_log` VALUES (668, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":2,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:31:24.3795023+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:31:24');
INSERT INTO `site_admin_log` VALUES (669, 2, 1, 2, '权限管理', '{\"id\":19,\"parent_id\":11,\"permission_name\":\"取款列表\",\"permission_code\":\"user_withdraw\",\"permission_path\":\"member/withdraw_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":4,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:31:30.44315+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:31:30');
INSERT INTO `site_admin_log` VALUES (670, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":2,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:31:33.8042674+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:31:34');
INSERT INTO `site_admin_log` VALUES (671, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":3,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:31:52.0892361+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:31:52');
INSERT INTO `site_admin_log` VALUES (672, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":5,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:32:27.4750481+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:32:28');
INSERT INTO `site_admin_log` VALUES (673, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:33:25.7547363+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:33:26');
INSERT INTO `site_admin_log` VALUES (674, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:33:32.804838+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:33:33');
INSERT INTO `site_admin_log` VALUES (675, 2, 1, 2, '权限管理', '{\"id\":9,\"parent_id\":2,\"permission_name\":\"用户列表\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":3,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:33:35.4844757+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:33:36');
INSERT INTO `site_admin_log` VALUES (676, 2, 1, 2, '权限管理', '{\"id\":6,\"parent_id\":2,\"permission_name\":\"角色列表\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:33:42.1611667+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:33:42');
INSERT INTO `site_admin_log` VALUES (677, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":4,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:04.7816904+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:05');
INSERT INTO `site_admin_log` VALUES (678, 2, 1, 2, '权限管理', '{\"id\":4,\"parent_id\":2,\"permission_name\":\"添加权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":4,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:10.0756607+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:10');
INSERT INTO `site_admin_log` VALUES (679, 2, 1, 2, '权限管理', '{\"id\":5,\"parent_id\":2,\"permission_name\":\"编辑权限\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/auth_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":5,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:19.9446872+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:20');
INSERT INTO `site_admin_log` VALUES (680, 2, 1, 2, '权限管理', '{\"id\":7,\"parent_id\":2,\"permission_name\":\"添加角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":6,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:29.5371757+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:30');
INSERT INTO `site_admin_log` VALUES (681, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":7,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:42.3675752+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:42');
INSERT INTO `site_admin_log` VALUES (682, 2, 1, 2, '权限管理', '{\"id\":8,\"parent_id\":2,\"permission_name\":\"编辑角色\",\"permission_code\":\"admin_role\",\"permission_path\":\"system/role_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":7,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:34:43.8021167+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:34:44');
INSERT INTO `site_admin_log` VALUES (683, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"添加用户\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_add\",\"request_param\":\"POST\",\"sort\":0,\"type\":3,\"status\":1,\"created_at\":\"2020-03-04T12:36:17.7076502+08:00\",\"updated_at\":\"2020-03-04T12:36:17.7076502+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:36:18');
INSERT INTO `site_admin_log` VALUES (684, 2, 1, 2, '权限管理', '{\"id\":25,\"parent_id\":2,\"permission_name\":\"添加用户\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":8,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:36:32.5253097+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:36:33');
INSERT INTO `site_admin_log` VALUES (685, 2, 1, 2, '权限管理', '{\"id\":10,\"parent_id\":2,\"permission_name\":\"用户详情（编辑）\",\"permission_code\":\"admin\",\"permission_path\":\"system/user_edit\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":9,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:36:42.1839546+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:36:42');
INSERT INTO `site_admin_log` VALUES (686, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 12:37:24.3003473 +0800 CST m=+66988.826314601, 第 581 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:37:24');
INSERT INTO `site_admin_log` VALUES (687, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:38:36');
INSERT INTO `site_admin_log` VALUES (688, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:38:44.4184087 +0800 CST m=+67068.944376001, 第 51 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:38:44');
INSERT INTO `site_admin_log` VALUES (689, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:38:56');
INSERT INTO `site_admin_log` VALUES (690, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:39:04.8226249 +0800 CST m=+67089.348592201, 第 52 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:39:05');
INSERT INTO `site_admin_log` VALUES (691, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:40:25.8062571+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:40:26');
INSERT INTO `site_admin_log` VALUES (692, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:40:40.1510425 +0800 CST m=+67184.684989201, 第 53 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:40:40');
INSERT INTO `site_admin_log` VALUES (693, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:41:22');
INSERT INTO `site_admin_log` VALUES (694, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:41:28.1954675 +0800 CST m=+67232.729414201, 第 54 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:41:28');
INSERT INTO `site_admin_log` VALUES (695, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":4},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:42:38');
INSERT INTO `site_admin_log` VALUES (696, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:42:57.1708162 +0800 CST m=+67321.704762901, 第 55 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:42:57');
INSERT INTO `site_admin_log` VALUES (697, 2, 1, 2, '权限管理', '{\"id\":2,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":2,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T12:43:59.9516205+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:44:00');
INSERT INTO `site_admin_log` VALUES (698, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":4},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:44:27');
INSERT INTO `site_admin_log` VALUES (699, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:44:33.9726581 +0800 CST m=+67418.506604801, 第 56 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:44:34');
INSERT INTO `site_admin_log` VALUES (700, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 12:45:04');
INSERT INTO `site_admin_log` VALUES (701, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 12:45:10.2894793 +0800 CST m=+67454.823426001, 第 57 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 12:45:10');
INSERT INTO `site_admin_log` VALUES (702, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:04:13');
INSERT INTO `site_admin_log` VALUES (703, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:04:21.0041617 +0800 CST m=+68605.538108401, 第 58 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:04:21');
INSERT INTO `site_admin_log` VALUES (704, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"system/auth_list\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:06:04.9832466+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:06:05');
INSERT INTO `site_admin_log` VALUES (705, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:06:13.4713209 +0800 CST m=+68718.005267601, 第 59 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:06:13');
INSERT INTO `site_admin_log` VALUES (706, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:07:10');
INSERT INTO `site_admin_log` VALUES (707, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:07:17.1763234 +0800 CST m=+68781.710270101, 第 60 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:07:17');
INSERT INTO `site_admin_log` VALUES (708, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:22:54.9248094 +0800 CST m=+69719.458756101, 第 582 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:22:55');
INSERT INTO `site_admin_log` VALUES (709, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:25:38.1957771 +0800 CST m=+69882.729723801, 第 583 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:25:38');
INSERT INTO `site_admin_log` VALUES (710, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:26:47.3225735 +0800 CST m=+69951.856520201, 第 584 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:26:47');
INSERT INTO `site_admin_log` VALUES (711, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:42:58.1950176 +0800 CST m=+70922.711469301, 第 585 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:42:58');
INSERT INTO `site_admin_log` VALUES (712, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:43:04.3402756 +0800 CST m=+70928.856727301, 第 586 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:43:04');
INSERT INTO `site_admin_log` VALUES (713, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:43:47.9349768 +0800 CST m=+70972.451428501, 第 587 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:43:48');
INSERT INTO `site_admin_log` VALUES (714, 2, 1, 2, '管理员', '{\"id\":55,\"role_id\":1,\"login_password\":\"111111\",\"status\":1,\"updated_at\":\"2020-03-04T13:44:04.1769408+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:44:05');
INSERT INTO `site_admin_log` VALUES (715, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 13:44:12.0487208 +0800 CST m=+70996.565172501, 第 1 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:44:12');
INSERT INTO `site_admin_log` VALUES (716, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 13:44:18.4492656 +0800 CST m=+71002.965717301, 第 2 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:44:18');
INSERT INTO `site_admin_log` VALUES (717, 2, 1, 2, '权限管理', '{\"id\":3,\"parent_id\":2,\"permission_name\":\"权限列表\",\"permission_code\":\"admin_permission\",\"permission_path\":\"system/index\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:49:18.3637947+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:49:18');
INSERT INTO `site_admin_log` VALUES (718, 2, 1, 2, '权限管理', '{\"id\":17,\"parent_id\":11,\"permission_name\":\"会员列表\",\"permission_code\":\"user\",\"permission_path\":\"member/index\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:49:45.9818161+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:49:46');
INSERT INTO `site_admin_log` VALUES (719, 2, 1, 2, '权限管理', '{\"id\":21,\"parent_id\":12,\"permission_name\":\"发布任务列表\",\"permission_code\":\"task_publish\",\"permission_path\":\"task/index\",\"request_param\":\"GET\",\"joins\":\"1,12\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:51:16.266624+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:51:16');
INSERT INTO `site_admin_log` VALUES (720, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"task/index\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:52:33.0965685+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:52:33');
INSERT INTO `site_admin_log` VALUES (721, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:53:00');
INSERT INTO `site_admin_log` VALUES (722, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:53:19.3197545 +0800 CST m=+71543.836206201, 第 61 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:53:19');
INSERT INTO `site_admin_log` VALUES (723, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:53:36.5463332 +0800 CST m=+71561.062784901, 第 62 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:53:37');
INSERT INTO `site_admin_log` VALUES (724, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:53:43.9558727 +0800 CST m=+71568.472324401, 第 61 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:53:44');
INSERT INTO `site_admin_log` VALUES (725, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:57:04.0268869 +0800 CST m=+71768.543338601, 第 62 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:57:04');
INSERT INTO `site_admin_log` VALUES (726, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:57:31.52782 +0800 CST m=+71796.044271701, 第 63 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:57:32');
INSERT INTO `site_admin_log` VALUES (727, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 13:59:27.6961381 +0800 CST m=+71912.212589801, 第 64 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 13:59:28');
INSERT INTO `site_admin_log` VALUES (728, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"site_money\",\"permission_path\":\"task\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T13:59:33.7195112+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 13:59:34');
INSERT INTO `site_admin_log` VALUES (729, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 13:59:53.3420137 +0800 CST m=+71937.858465401, 第 588 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 13:59:53');
INSERT INTO `site_admin_log` VALUES (730, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 14:00:08.1407105 +0800 CST m=+71952.657162201, 第 65 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 14:00:08');
INSERT INTO `site_admin_log` VALUES (731, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 14:01:41');
INSERT INTO `site_admin_log` VALUES (732, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:01:48.2949118 +0800 CST m=+72052.811363501, 第 589 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:01:48');
INSERT INTO `site_admin_log` VALUES (733, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 14:01:55.9250148 +0800 CST m=+72060.441466501, 第 66 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 14:01:56');
INSERT INTO `site_admin_log` VALUES (734, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 14:03:07.3230029 +0800 CST m=+72131.839454601, 第 67 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 14:03:07');
INSERT INTO `site_admin_log` VALUES (735, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:44:49.2704428 +0800 CST m=+1000.204137701, 第 590 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:44:49');
INSERT INTO `site_admin_log` VALUES (736, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 14:45:23.1249361 +0800 CST m=+1034.058631001, 第 68 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 14:45:23');
INSERT INTO `site_admin_log` VALUES (737, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:48:26.5406506 +0800 CST m=+1217.474345501, 第 591 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:48:27');
INSERT INTO `site_admin_log` VALUES (738, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:50:09.3155788 +0800 CST m=+1320.249273701, 第 592 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:50:09');
INSERT INTO `site_admin_log` VALUES (739, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:50:30.4128942 +0800 CST m=+1341.346589101, 第 593 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:50:30');
INSERT INTO `site_admin_log` VALUES (740, 2, 1, 2, '权限管理', '{\"id\":16,\"parent_id\":1,\"permission_name\":\"控制台\",\"permission_code\":\"site_console\",\"permission_path\":\"dashboard\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":1,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T14:51:18.0344128+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:51:18');
INSERT INTO `site_admin_log` VALUES (741, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:53:32.8954696 +0800 CST m=+1523.829164501, 第 594 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:53:33');
INSERT INTO `site_admin_log` VALUES (742, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 14:56:08.3608299 +0800 CST m=+1679.294524801, 第 595 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 14:56:08');
INSERT INTO `site_admin_log` VALUES (743, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:01:20.2877796 +0800 CST m=+1991.221474501, 第 596 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:01:20');
INSERT INTO `site_admin_log` VALUES (744, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:01:32.4437667 +0800 CST m=+2003.377461601, 第 597 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:01:32');
INSERT INTO `site_admin_log` VALUES (745, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:01:33.782636 +0800 CST m=+2004.716330901, 第 598 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:01:34');
INSERT INTO `site_admin_log` VALUES (746, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:02:54.3679838 +0800 CST m=+2085.301678701, 第 599 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:02:54');
INSERT INTO `site_admin_log` VALUES (747, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:04:01.3228548 +0800 CST m=+2152.256549701, 第 600 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:04:01');
INSERT INTO `site_admin_log` VALUES (748, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:12:19.3575809+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:12:19');
INSERT INTO `site_admin_log` VALUES (749, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"site_order\",\"permission_path\":\"task\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:12:30.6367634+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:12:31');
INSERT INTO `site_admin_log` VALUES (750, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:12:59.8119024 +0800 CST m=+2690.957651001, 第 601 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:13:00');
INSERT INTO `site_admin_log` VALUES (751, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:13:57.6036985 +0800 CST m=+2748.749447101, 第 602 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:13:58');
INSERT INTO `site_admin_log` VALUES (752, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:15:47');
INSERT INTO `site_admin_log` VALUES (753, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:15:48');
INSERT INTO `site_admin_log` VALUES (754, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:16:14.7494205 +0800 CST m=+2885.895169101, 第 69 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:16:15');
INSERT INTO `site_admin_log` VALUES (755, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"task_publish\",\"permission_path\":\"task\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:18:10.0990211+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:18:10');
INSERT INTO `site_admin_log` VALUES (756, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:18:17.9108204 +0800 CST m=+3009.056569001, 第 70 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:18:18');
INSERT INTO `site_admin_log` VALUES (757, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:18:52');
INSERT INTO `site_admin_log` VALUES (758, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:19:14.2018124 +0800 CST m=+3065.347561001, 第 71 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:19:14');
INSERT INTO `site_admin_log` VALUES (759, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"task_publish\",\"permission_path\":\"task\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:19:38.6751541+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:19:39');
INSERT INTO `site_admin_log` VALUES (760, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:19:45.3997604 +0800 CST m=+3096.545509001, 第 72 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:19:45');
INSERT INTO `site_admin_log` VALUES (761, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:21:18.3800156 +0800 CST m=+3189.525764201, 第 73 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:21:18');
INSERT INTO `site_admin_log` VALUES (762, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 15:27:26.1701019 +0800 CST m=+3557.315850501, 第 74 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 15:27:26');
INSERT INTO `site_admin_log` VALUES (763, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"task_publish\",\"permission_path\":\"task\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:29:11.21076+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:29:11');
INSERT INTO `site_admin_log` VALUES (764, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":25},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:32:14');
INSERT INTO `site_admin_log` VALUES (765, 2, 1, 2, '权限管理', '{\"id\":2,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"permission_path\":\"system\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":2,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T15:32:22.6301639+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:32:23');
INSERT INTO `site_admin_log` VALUES (766, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 15:59:00.5807888 +0800 CST m=+5451.726537401, 第 603 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 15:59:01');
INSERT INTO `site_admin_log` VALUES (767, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:01:37.6170858 +0800 CST m=+25.750151401, 第 75 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:01:38');
INSERT INTO `site_admin_log` VALUES (768, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 16:02:22.1845479 +0800 CST m=+70.317613501, 第 604 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 16:02:22');
INSERT INTO `site_admin_log` VALUES (769, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 16:02:45');
INSERT INTO `site_admin_log` VALUES (770, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:02:52.6161739 +0800 CST m=+100.749239501, 第 76 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:02:53');
INSERT INTO `site_admin_log` VALUES (771, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:03:46.2118665 +0800 CST m=+38.062026801, 第 77 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:03:46');
INSERT INTO `site_admin_log` VALUES (772, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 16:04:08.5543005 +0800 CST m=+60.404460801, 第 605 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 16:04:09');
INSERT INTO `site_admin_log` VALUES (773, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 16:04:49.4766752 +0800 CST m=+15.582706001, 第 3 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:04:49');
INSERT INTO `site_admin_log` VALUES (774, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:05:41.803379 +0800 CST m=+67.909409801, 第 78 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:05:42');
INSERT INTO `site_admin_log` VALUES (775, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:10:06.5632106 +0800 CST m=+1.868760301, 第 79 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:10:07');
INSERT INTO `site_admin_log` VALUES (776, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 16:10:27.1161393 +0800 CST m=+22.421689001, 第 4 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:10:27');
INSERT INTO `site_admin_log` VALUES (777, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:10:37');
INSERT INTO `site_admin_log` VALUES (778, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:10:43.4311517 +0800 CST m=+38.736701401, 第 80 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:10:43');
INSERT INTO `site_admin_log` VALUES (779, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"bill\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T16:34:21.2107875+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:34:21');
INSERT INTO `site_admin_log` VALUES (780, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:35:15.8410664 +0800 CST m=+1511.146672601, 第 81 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:35:16');
INSERT INTO `site_admin_log` VALUES (781, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13},{\\\"id\\\":14}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:35:37');
INSERT INTO `site_admin_log` VALUES (782, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 16:35:43.9132263 +0800 CST m=+1539.218832501, 第 82 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 16:35:44');
INSERT INTO `site_admin_log` VALUES (783, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 16:50:33.3166317 +0800 CST m=+2428.622237901, 第 5 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 16:50:33');
INSERT INTO `site_admin_log` VALUES (784, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 17:55:40.5133277 +0800 CST m=+6335.653352001, 第 6 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 17:55:41');
INSERT INTO `site_admin_log` VALUES (785, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 17:56:44.9911801 +0800 CST m=+6400.131204401, 第 7 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 17:56:45');
INSERT INTO `site_admin_log` VALUES (786, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 17:59:06.6914746 +0800 CST m=+6541.831498901, 第 8 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 17:59:07');
INSERT INTO `site_admin_log` VALUES (787, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"日志列表\",\"permission_code\":\"site_admin_log\",\"permission_path\":\"system/log_list\",\"request_param\":\"GET\",\"sort\":10,\"type\":2,\"status\":1,\"created_at\":\"2020-03-04T18:05:48.4873555+08:00\",\"updated_at\":\"2020-03-04T18:05:48.4873555+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:05:49');
INSERT INTO `site_admin_log` VALUES (788, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":25},{\\\"id\\\":10},{\\\"id\\\":26},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":13},{\\\"id\\\":14}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:06:03');
INSERT INTO `site_admin_log` VALUES (789, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 18:06:07.5387768 +0800 CST m=+6962.678801101, 第 83 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 18:06:08');
INSERT INTO `site_admin_log` VALUES (790, 2, 1, 2, '权限管理', '{\"id\":13,\"parent_id\":1,\"permission_name\":\"财务管理\",\"permission_code\":\"money\",\"permission_path\":\"money\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":5,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T18:42:33.0257251+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:42:33');
INSERT INTO `site_admin_log` VALUES (791, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 18:44:21.8109678 +0800 CST m=+9257.071306501, 第 9 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:44:22');
INSERT INTO `site_admin_log` VALUES (792, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"report\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T18:45:39.6578503+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:45:40');
INSERT INTO `site_admin_log` VALUES (793, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 18:45:47.6613597 +0800 CST m=+9342.921698401, 第 10 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:45:48');
INSERT INTO `site_admin_log` VALUES (794, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 18:46:38.2925172 +0800 CST m=+9393.552855901, 第 11 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:46:38');
INSERT INTO `site_admin_log` VALUES (795, 2, 1, 2, '权限管理', '{\"id\":2,\"parent_id\":1,\"permission_name\":\"系统管理\",\"permission_code\":\"system\",\"permission_path\":\"system\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":2,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T18:49:04.6622924+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:49:05');
INSERT INTO `site_admin_log` VALUES (796, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"dashboard\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T18:50:45.9325781+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:50:46');
INSERT INTO `site_admin_log` VALUES (797, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 18:51:41.9223072 +0800 CST m=+9697.182645901, 第 12 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:51:42');
INSERT INTO `site_admin_log` VALUES (798, 2, 1, 2, '权限管理', '{\"id\":15,\"parent_id\":1,\"permission_name\":\"报表管理\",\"permission_code\":\"site_report\",\"permission_path\":\"report\",\"request_param\":\"OPTIONS\",\"joins\":\"1\",\"sort\":6,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T18:52:22.3469408+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:52:22');
INSERT INTO `site_admin_log` VALUES (799, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 18:52:49.2236258 +0800 CST m=+9764.483964501, 第 13 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 18:52:49');
INSERT INTO `site_admin_log` VALUES (800, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理1\",\"permission_code\":\"bill\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T19:29:17.6485079+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:29:18');
INSERT INTO `site_admin_log` VALUES (801, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 19:31:22.3157049 +0800 CST m=+12077.481943501, 第 14 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:31:22');
INSERT INTO `site_admin_log` VALUES (802, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 19:31:38.6149911 +0800 CST m=+12093.781229701, 第 15 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:31:39');
INSERT INTO `site_admin_log` VALUES (803, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 19:33:42.129333 +0800 CST m=+12217.295571601, 第 16 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:33:42');
INSERT INTO `site_admin_log` VALUES (804, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 19:36:41.2965037 +0800 CST m=+12396.462742301, 第 17 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:36:41');
INSERT INTO `site_admin_log` VALUES (805, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-04 19:37:03.1894159 +0800 CST m=+12418.355654501, 第 18 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-04 19:37:03');
INSERT INTO `site_admin_log` VALUES (806, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 19:40:30.7993671 +0800 CST m=+12625.965605701, 第 606 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:40:31');
INSERT INTO `site_admin_log` VALUES (807, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 19:41:28.4297274 +0800 CST m=+12683.595966001, 第 607 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:41:28');
INSERT INTO `site_admin_log` VALUES (808, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 19:42:28.8653247 +0800 CST m=+12744.031563301, 第 608 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:42:29');
INSERT INTO `site_admin_log` VALUES (809, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理12\",\"permission_code\":\"bill\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T19:42:46.2128768+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:42:46');
INSERT INTO `site_admin_log` VALUES (810, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理123\",\"permission_code\":\"bill\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T19:44:25.6027406+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:44:26');
INSERT INTO `site_admin_log` VALUES (811, 2, 1, 2, '权限管理', '{\"id\":14,\"parent_id\":1,\"permission_name\":\"订单管理\",\"permission_code\":\"bill\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":7,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T19:44:39.0870769+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:44:39');
INSERT INTO `site_admin_log` VALUES (812, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":1,\"joins\":\"1\",\"permission_name\":\"test\",\"permission_code\":\"test\",\"permission_path\":\"order\",\"request_param\":\"GET\",\"sort\":0,\"type\":1,\"status\":1,\"created_at\":\"2020-03-04T19:45:20.9329552+08:00\",\"updated_at\":\"2020-03-04T19:45:20.9329552+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:45:21');
INSERT INTO `site_admin_log` VALUES (813, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 19:48:44.1380821 +0800 CST m=+13119.304320701, 第 609 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:48:44');
INSERT INTO `site_admin_log` VALUES (814, 2, 1, 2, '权限管理', '{\"id\":27,\"parent_id\":1,\"permission_name\":\"test\",\"permission_code\":\"test\",\"permission_path\":\"test\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":8,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T19:49:05.8752947+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:49:06');
INSERT INTO `site_admin_log` VALUES (815, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 19:49:47.5708213 +0800 CST m=+13182.737059901, 第 610 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:49:48');
INSERT INTO `site_admin_log` VALUES (816, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":22},{\\\"id\\\":27},{\\\"id\\\":11},{\\\"id\\\":12}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 19:50:22');
INSERT INTO `site_admin_log` VALUES (817, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-04 19:50:30.2738452 +0800 CST m=+13225.440083801, 第 84 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-04 19:50:30');
INSERT INTO `site_admin_log` VALUES (818, 2, 1, 2, '权限管理', '{\"id\":27,\"parent_id\":1,\"permission_name\":\"test1\",\"permission_code\":\"test\",\"permission_path\":\"test\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":8,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-04T20:12:22.7696741+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:12:23');
INSERT INTO `site_admin_log` VALUES (819, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":27,\"joins\":\"1,27\",\"permission_name\":\"aa\",\"permission_code\":\"aa\",\"permission_path\":\"member/index\",\"request_param\":\"GET\",\"sort\":0,\"type\":2,\"status\":1,\"created_at\":\"2020-03-04T20:21:15.3604673+08:00\",\"updated_at\":\"2020-03-04T20:21:15.3604673+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:21:15');
INSERT INTO `site_admin_log` VALUES (820, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:24:30.1779277 +0800 CST m=+15265.362717701, 第 611 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:24:30');
INSERT INTO `site_admin_log` VALUES (821, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:29:10.6709931 +0800 CST m=+15545.855783101, 第 612 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:29:11');
INSERT INTO `site_admin_log` VALUES (822, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:32:42.2906645 +0800 CST m=+15757.475454501, 第 613 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:32:42');
INSERT INTO `site_admin_log` VALUES (823, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:32:51.7839269 +0800 CST m=+15766.968716901, 第 614 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:32:52');
INSERT INTO `site_admin_log` VALUES (824, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:40:53.884439 +0800 CST m=+16249.069229001, 第 615 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:40:54');
INSERT INTO `site_admin_log` VALUES (825, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":27,\"joins\":\"1,27\",\"permission_name\":\"bb\",\"permission_code\":\"bb\",\"permission_path\":\"test\",\"request_param\":\"\",\"sort\":0,\"type\":2,\"status\":1,\"created_at\":\"2020-03-04T20:45:16.3481941+08:00\",\"updated_at\":\"2020-03-04T20:45:16.3481941+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:45:16');
INSERT INTO `site_admin_log` VALUES (826, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:46:14.3217333 +0800 CST m=+16569.506523301, 第 616 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:46:14');
INSERT INTO `site_admin_log` VALUES (827, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:49:39.6636178 +0800 CST m=+16774.848407801, 第 617 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:49:40');
INSERT INTO `site_admin_log` VALUES (828, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-04 20:50:20.0141719 +0800 CST m=+16815.198961901, 第 618 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-04 20:50:20');
INSERT INTO `site_admin_log` VALUES (829, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 10:11:04.0188055 +0800 CST m=+819.850684101, 第 619 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 10:11:04');
INSERT INTO `site_admin_log` VALUES (830, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 10:12:21.1770694 +0800 CST m=+897.008948001, 第 620 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 10:12:21');
INSERT INTO `site_admin_log` VALUES (831, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 10:20:35.6594045 +0800 CST m=+83.570097201, 第 85 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 10:20:36');
INSERT INTO `site_admin_log` VALUES (832, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 10:20:44.7931636 +0800 CST m=+92.703856301, 第 19 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:20:45');
INSERT INTO `site_admin_log` VALUES (833, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 10:21:49.8383498 +0800 CST m=+157.749042501, 第 20 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:21:50');
INSERT INTO `site_admin_log` VALUES (834, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 10:22:59.9448441 +0800 CST m=+227.855536801, 第 21 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:23:00');
INSERT INTO `site_admin_log` VALUES (835, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 10:24:04.9007163 +0800 CST m=+292.811409001, 第 22 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:24:05');
INSERT INTO `site_admin_log` VALUES (836, 2, 1, 2, '权限管理', '{\"id\":29,\"parent_id\":27,\"permission_name\":\"bb\",\"permission_code\":\"bb\",\"permission_path\":\"test/test\",\"request_param\":\"\",\"joins\":\"1,27\",\"sort\":0,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-05T10:24:31.9319935+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:24:32');
INSERT INTO `site_admin_log` VALUES (837, 2, 1, 2, '权限管理', '{\"id\":28,\"parent_id\":27,\"permission_name\":\"aa\",\"permission_code\":\"aa\",\"permission_path\":\"test/index\",\"request_param\":\"GET\",\"joins\":\"1,27\",\"sort\":1,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-05T10:25:36.2195905+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:25:36');
INSERT INTO `site_admin_log` VALUES (838, 2, 1, 2, '权限管理', '{\"id\":29,\"parent_id\":27,\"permission_name\":\"bb\",\"permission_code\":\"bb\",\"permission_path\":\"test/test\",\"request_param\":\"\",\"joins\":\"1,27\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-05T10:25:44.4096513+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 10:25:44');
INSERT INTO `site_admin_log` VALUES (839, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 10:32:29.2513386 +0800 CST m=+797.162031301, 第 86 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 10:32:29');
INSERT INTO `site_admin_log` VALUES (840, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 10:32:46.5502476 +0800 CST m=+814.460940301, 第 87 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 10:32:47');
INSERT INTO `site_admin_log` VALUES (841, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 11:00:45.2309909 +0800 CST m=+2493.550810501, 第 23 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 11:00:45');
INSERT INTO `site_admin_log` VALUES (842, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 11:08:39.5966176 +0800 CST m=+2967.916437201, 第 24 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 11:08:40');
INSERT INTO `site_admin_log` VALUES (843, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:33:36.4307912 +0800 CST m=+4464.750610801, 第 621 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:33:36');
INSERT INTO `site_admin_log` VALUES (844, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:33:41.8355121 +0800 CST m=+4470.155331701, 第 622 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:33:42');
INSERT INTO `site_admin_log` VALUES (845, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:35:14.0410713 +0800 CST m=+4562.360890901, 第 623 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:35:14');
INSERT INTO `site_admin_log` VALUES (846, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:38:16.7831112 +0800 CST m=+4745.102930801, 第 624 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:38:17');
INSERT INTO `site_admin_log` VALUES (847, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:38:35.5851072 +0800 CST m=+4763.904926801, 第 625 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:38:36');
INSERT INTO `site_admin_log` VALUES (848, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:39:37.8301028 +0800 CST m=+4826.149922401, 第 626 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:39:38');
INSERT INTO `site_admin_log` VALUES (849, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:39:48.2402299 +0800 CST m=+4836.560049501, 第 627 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:39:48');
INSERT INTO `site_admin_log` VALUES (850, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 11:42:44.9833009 +0800 CST m=+5013.303120501, 第 628 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:42:45');
INSERT INTO `site_admin_log` VALUES (851, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 11:54:26.0106102 +0800 CST m=+5714.330429801, 第 88 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 11:54:26');
INSERT INTO `site_admin_log` VALUES (852, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 11:54:29.5671732 +0800 CST m=+5717.886992801, 第 89 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 11:54:30');
INSERT INTO `site_admin_log` VALUES (853, 2, 1, 2, '权限管理', '{\"id\":27,\"parent_id\":1,\"permission_name\":\"test2\",\"permission_code\":\"test\",\"permission_path\":\"test\",\"request_param\":\"GET\",\"joins\":\"1\",\"sort\":8,\"type\":1,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-05T11:58:39.7686547+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 11:58:40');
INSERT INTO `site_admin_log` VALUES (854, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 12:37:01.7701094 +0800 CST m=+98.003568101, 第 299 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 12:37:02');
INSERT INTO `site_admin_log` VALUES (855, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 12:38:19.7323356 +0800 CST m=+175.965794301, 第 300 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 12:38:20');
INSERT INTO `site_admin_log` VALUES (856, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 12:55:36.0532702 +0800 CST m=+9384.381282201, 第 25 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 12:55:36');
INSERT INTO `site_admin_log` VALUES (857, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 12:56:41.3940888 +0800 CST m=+8.022679401, 第 301 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 12:56:41');
INSERT INTO `site_admin_log` VALUES (858, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 12:57:41.1870086 +0800 CST m=+9509.515020601, 第 26 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 12:57:41');
INSERT INTO `site_admin_log` VALUES (859, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:04:37.9633024 +0800 CST m=+9926.291314401, 第 27 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:04:38');
INSERT INTO `site_admin_log` VALUES (860, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 13:05:04.2120925 +0800 CST m=+9952.540104501, 第 629 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 13:05:04');
INSERT INTO `site_admin_log` VALUES (861, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:05:53.9026336 +0800 CST m=+10002.230645601, 第 28 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:05:54');
INSERT INTO `site_admin_log` VALUES (862, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:06:42.3288416 +0800 CST m=+10050.656853601, 第 29 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:06:42');
INSERT INTO `site_admin_log` VALUES (863, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 13:11:52.0532806 +0800 CST m=+6.741270301, 第 302 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 13:11:52');
INSERT INTO `site_admin_log` VALUES (864, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:15:27.6207454 +0800 CST m=+10575.948757401, 第 30 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:15:28');
INSERT INTO `site_admin_log` VALUES (865, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:18:12.2359087+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:18:12');
INSERT INTO `site_admin_log` VALUES (866, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:18:12.239909+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:18:12');
INSERT INTO `site_admin_log` VALUES (867, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:18:09.8403548+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:18:24');
INSERT INTO `site_admin_log` VALUES (868, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:19:11.9402595+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:19:12');
INSERT INTO `site_admin_log` VALUES (869, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:19:16.0839901+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:19:16');
INSERT INTO `site_admin_log` VALUES (870, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:19:16.9411895+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:19:17');
INSERT INTO `site_admin_log` VALUES (871, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:22:26.4980107+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:22:27');
INSERT INTO `site_admin_log` VALUES (872, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:23:03.6774724+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:23:04');
INSERT INTO `site_admin_log` VALUES (873, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:23:12.0296648+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:23:12');
INSERT INTO `site_admin_log` VALUES (874, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:23:12.9046583+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:23:13');
INSERT INTO `site_admin_log` VALUES (875, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:23:14.7632742+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:23:15');
INSERT INTO `site_admin_log` VALUES (876, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:23:18.316938+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:23:18');
INSERT INTO `site_admin_log` VALUES (877, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 13:24:19.3761837 +0800 CST m=+8.958506201, 第 303 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 13:24:19');
INSERT INTO `site_admin_log` VALUES (878, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:25:07.741577+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:25:08');
INSERT INTO `site_admin_log` VALUES (879, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:25:10.6133918+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:25:11');
INSERT INTO `site_admin_log` VALUES (880, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:25:51.5045833 +0800 CST m=+19.720388201, 第 31 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:25:52');
INSERT INTO `site_admin_log` VALUES (881, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 13:27:27.6843827 +0800 CST m=+49.292557701, 第 630 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 13:27:28');
INSERT INTO `site_admin_log` VALUES (882, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:27:32.3851642 +0800 CST m=+53.993339201, 第 32 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:27:32');
INSERT INTO `site_admin_log` VALUES (883, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:27:43.0268763 +0800 CST m=+64.635051301, 第 33 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:27:43');
INSERT INTO `site_admin_log` VALUES (884, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 13:29:28.9901257 +0800 CST m=+170.598300701, 第 34 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:29:29');
INSERT INTO `site_admin_log` VALUES (885, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:30:44.4008085+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:30:44');
INSERT INTO `site_admin_log` VALUES (886, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-05T13:30:45.7646138+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:30:46');
INSERT INTO `site_admin_log` VALUES (887, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"角色绑定权限\",\"permission_code\":\"admin_role_permission\",\"permission_path\":\"system/role_auth\",\"request_param\":\"PUT\",\"sort\":10,\"type\":3,\"status\":1,\"created_at\":\"2020-03-05T13:33:18.5874561+08:00\",\"updated_at\":\"2020-03-05T13:33:18.5874561+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:33:19');
INSERT INTO `site_admin_log` VALUES (888, 2, 1, 2, '权限管理', '{\"id\":30,\"parent_id\":2,\"permission_name\":\"角色绑定权限\",\"permission_code\":\"admin_role_permission\",\"permission_path\":\"system/role_auth\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":11,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-05T13:33:28.4836953+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:33:29');
INSERT INTO `site_admin_log` VALUES (889, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:43:19.05486 +0800 CST m=+1000.663035001, 第 90 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:43:19');
INSERT INTO `site_admin_log` VALUES (890, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:47:21.7973762 +0800 CST m=+1243.405551201, 第 91 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:47:22');
INSERT INTO `site_admin_log` VALUES (891, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:48:51.1229707 +0800 CST m=+1332.731145701, 第 92 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:48:51');
INSERT INTO `site_admin_log` VALUES (892, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:48:53.8848607 +0800 CST m=+1335.493035701, 第 93 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:48:54');
INSERT INTO `site_admin_log` VALUES (893, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:50:42.1731196 +0800 CST m=+1443.781294601, 第 94 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:50:42');
INSERT INTO `site_admin_log` VALUES (894, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:52:06.3838691 +0800 CST m=+1527.992044101, 第 95 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:52:06');
INSERT INTO `site_admin_log` VALUES (895, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:53:47.3214242 +0800 CST m=+1628.929599201, 第 96 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:53:47');
INSERT INTO `site_admin_log` VALUES (896, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:54:22.9758206 +0800 CST m=+1664.583995601, 第 97 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:54:23');
INSERT INTO `site_admin_log` VALUES (897, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 13:56:08.8073995 +0800 CST m=+1918.378567701, 第 304 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 13:56:09');
INSERT INTO `site_admin_log` VALUES (898, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-05 13:56:37.850165 +0800 CST m=+1947.421333201, 第 305 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-05 13:56:38');
INSERT INTO `site_admin_log` VALUES (899, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 13:58:21.2359718 +0800 CST m=+1902.832992501, 第 98 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 13:58:21');
INSERT INTO `site_admin_log` VALUES (900, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":25},{\\\"id\\\":10},{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 13:58:47');
INSERT INTO `site_admin_log` VALUES (901, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 14:02:11.1325075 +0800 CST m=+2132.729528201, 第 99 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 14:02:11');
INSERT INTO `site_admin_log` VALUES (902, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:02:33');
INSERT INTO `site_admin_log` VALUES (903, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:02:47');
INSERT INTO `site_admin_log` VALUES (904, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 14:04:02.2672233 +0800 CST m=+2243.864244001, 第 100 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 14:04:02');
INSERT INTO `site_admin_log` VALUES (905, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 14:05:09.5603849 +0800 CST m=+2311.157405601, 第 101 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 14:05:10');
INSERT INTO `site_admin_log` VALUES (906, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":16},{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:08:55');
INSERT INTO `site_admin_log` VALUES (907, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:15:07');
INSERT INTO `site_admin_log` VALUES (908, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:15:28');
INSERT INTO `site_admin_log` VALUES (909, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":12},{\\\"id\\\":22},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:15:58');
INSERT INTO `site_admin_log` VALUES (910, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:16:12');
INSERT INTO `site_admin_log` VALUES (911, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 14:31:08.3935313 +0800 CST m=+3869.990552001, 第 35 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:31:08');
INSERT INTO `site_admin_log` VALUES (912, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 14:31:13.8343306 +0800 CST m=+3875.431351301, 第 36 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:31:14');
INSERT INTO `site_admin_log` VALUES (913, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 14:31:19.8443631 +0800 CST m=+3881.441383801, 第 37 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:31:20');
INSERT INTO `site_admin_log` VALUES (914, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":25},{\\\"id\\\":10},{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:31:50');
INSERT INTO `site_admin_log` VALUES (915, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":25},{\\\"id\\\":10},{\\\"id\\\":26},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:32:34');
INSERT INTO `site_admin_log` VALUES (916, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":7},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":26},{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:45:36');
INSERT INTO `site_admin_log` VALUES (917, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:50:36');
INSERT INTO `site_admin_log` VALUES (918, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:53:46');
INSERT INTO `site_admin_log` VALUES (919, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:54:13');
INSERT INTO `site_admin_log` VALUES (920, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 14:54:52.9340751 +0800 CST m=+5293.762973101, 第 631 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 14:54:53');
INSERT INTO `site_admin_log` VALUES (921, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":11},{\\\"id\\\":17},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-05 14:54:59');
INSERT INTO `site_admin_log` VALUES (922, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-05 14:57:09.5149756 +0800 CST m=+5430.343873601, 第 632 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-05 14:57:10');
INSERT INTO `site_admin_log` VALUES (923, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 14:57:48.826579 +0800 CST m=+5469.655477001, 第 102 次登陆', 54, 'clear1', 0, '', '10.10.35.250', '2020-03-05 14:57:49');
INSERT INTO `site_admin_log` VALUES (924, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-05 14:59:09.877085 +0800 CST m=+5550.705983001, 第 103 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-05 14:59:10');
INSERT INTO `site_admin_log` VALUES (925, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 14:59:46.1697945 +0800 CST m=+5586.998692501, 第 38 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:59:46');
INSERT INTO `site_admin_log` VALUES (926, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 14:59:56');
INSERT INTO `site_admin_log` VALUES (927, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:04:23');
INSERT INTO `site_admin_log` VALUES (928, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":25},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:05:01');
INSERT INTO `site_admin_log` VALUES (929, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:05:56');
INSERT INTO `site_admin_log` VALUES (930, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:07:37');
INSERT INTO `site_admin_log` VALUES (931, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":6},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:10:53');
INSERT INTO `site_admin_log` VALUES (932, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:11:57');
INSERT INTO `site_admin_log` VALUES (933, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":20},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":24},{\\\"id\\\":23},{\\\"id\\\":22},{\\\"id\\\":21},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:12:51');
INSERT INTO `site_admin_log` VALUES (934, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":2},{\\\"id\\\":9},{\\\"id\\\":10}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:15:56');
INSERT INTO `site_admin_log` VALUES (935, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 15:16:20');
INSERT INTO `site_admin_log` VALUES (936, 1, 1, 1, '任务', '{\"title\":\"111\",\"describe\":\"111\",\"status\":1,\"sort\":1,\"created_at\":\"2020-03-05T16:01:30.6295572+08:00\",\"updated_at\":\"2020-03-05T16:01:30.6295572+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:01:31');
INSERT INTO `site_admin_log` VALUES (937, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":2,\"sort\":1,\"updated_at\":\"2020-03-05T16:08:25.3071174+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:08:25');
INSERT INTO `site_admin_log` VALUES (938, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":1,\"updated_at\":\"2020-03-05T16:08:32.1757438+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:08:32');
INSERT INTO `site_admin_log` VALUES (939, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":2,\"updated_at\":\"2020-03-05T16:09:57.9906561+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:09:58');
INSERT INTO `site_admin_log` VALUES (940, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":1,\"updated_at\":\"2020-03-05T16:11:36.282576+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:11:36');
INSERT INTO `site_admin_log` VALUES (941, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":2,\"sort\":1,\"updated_at\":\"2020-03-05T16:11:46.2383721+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:11:46');
INSERT INTO `site_admin_log` VALUES (942, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":1,\"updated_at\":\"2020-03-05T16:16:03.8011499+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:16:04');
INSERT INTO `site_admin_log` VALUES (943, 1, 1, 1, '任务', '{\"title\":\"1\",\"describe\":\"2\",\"status\":1,\"sort\":3,\"created_at\":\"2020-03-05T16:16:13.7379759+08:00\",\"updated_at\":\"2020-03-05T16:16:13.7379759+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:16:14');
INSERT INTO `site_admin_log` VALUES (944, 1, 1, 1, '任务', '{\"title\":\"2\",\"describe\":\"2\",\"status\":1,\"sort\":3,\"created_at\":\"2020-03-05T16:17:18.2274393+08:00\",\"updated_at\":\"2020-03-05T16:17:18.2274393+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:17:19');
INSERT INTO `site_admin_log` VALUES (945, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"支持银行卡列表\",\"permission_code\":\"site_bank\",\"permission_path\":\"system/bank_list\",\"request_param\":\"GET\",\"sort\":12,\"type\":2,\"status\":1,\"created_at\":\"2020-03-05T16:35:34.9374409+08:00\",\"updated_at\":\"2020-03-05T16:35:34.9374409+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:35:35');
INSERT INTO `site_admin_log` VALUES (946, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 16:35:44');
INSERT INTO `site_admin_log` VALUES (947, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 17:55:58.8986489 +0800 CST m=+146.364987001, 第 39 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 17:55:59');
INSERT INTO `site_admin_log` VALUES (948, 1, 1, 2, '会员', '{\"id\":100101001,\"real_name\":\"111\",\"nick_name\":\"2222\",\"status\":0,\"updated_at\":\"2020-03-05T18:02:57.838123+08:00\"}', 55, 'admin1', 100101001, '', '10.10.35.146', '2020-03-05 18:02:58');
INSERT INTO `site_admin_log` VALUES (949, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-05 18:28:10.1618913 +0800 CST m=+49.048826401, 第 40 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 18:28:10');
INSERT INTO `site_admin_log` VALUES (950, 1, 1, 2, '会员银行卡', '{\"id\":100101002,\"status\":2,\"remark\":\"remark_user_bankdsa\",\"updated_at\":\"2020-03-05T19:29:52.9147434+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 19:29:53');
INSERT INTO `site_admin_log` VALUES (951, 1, 1, 2, '会员银行卡', '{\"id\":100101002,\"status\":1,\"remark\":\"remark_user_bank\",\"updated_at\":\"2020-03-05T19:30:01.1996262+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 19:30:01');
INSERT INTO `site_admin_log` VALUES (952, 1, 1, 2, '会员银行卡', '{\"id\":100101013,\"status\":1,\"remark\":\"test\",\"updated_at\":\"2020-03-05T19:30:07.8415899+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 19:30:08');
INSERT INTO `site_admin_log` VALUES (953, 1, 1, 2, '会员银行卡', '{\"id\":100101013,\"status\":2,\"remark\":\"test\",\"updated_at\":\"2020-03-05T19:30:44.1766846+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-05 19:30:44');
INSERT INTO `site_admin_log` VALUES (954, 1, 1, 2, '会员', '{\"id\":100101002,\"real_name\":\"t\",\"nick_name\":\"t\",\"status\":1,\"updated_at\":\"2020-03-05T19:39:05.2237252+08:00\"}', 55, 'admin1', 100101002, 'test_name', '10.10.35.146', '2020-03-05 19:39:05');
INSERT INTO `site_admin_log` VALUES (955, 1, 1, 2, '会员', '{\"id\":100101002,\"real_name\":\"t\",\"nick_name\":\"t\",\"status\":1,\"updated_at\":\"2020-03-05T19:39:17.8318963+08:00\"}', 55, 'admin1', 100101002, 'test_name', '10.10.35.146', '2020-03-05 19:39:18');
INSERT INTO `site_admin_log` VALUES (956, 1, 1, 2, '会员', '{\"id\":100101001,\"real_name\":\"111\",\"nick_name\":\"22\",\"status\":2,\"updated_at\":\"2020-03-05T19:41:29.5996796+08:00\"}', 55, 'admin1', 100101001, '', '10.10.35.146', '2020-03-05 19:41:30');
INSERT INTO `site_admin_log` VALUES (957, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-06 10:05:19.0469846 +0800 CST m=+56276.930330601, 第 104 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-06 10:05:19');
INSERT INTO `site_admin_log` VALUES (958, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-06 10:07:07.5640982 +0800 CST m=+56385.447444201, 第 41 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:07:08');
INSERT INTO `site_admin_log` VALUES (959, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:07:18');
INSERT INTO `site_admin_log` VALUES (960, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-06 10:08:53.7389908 +0800 CST m=+56491.622336801, 第 105 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-06 10:08:54');
INSERT INTO `site_admin_log` VALUES (961, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:15:02');
INSERT INTO `site_admin_log` VALUES (962, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:16:24');
INSERT INTO `site_admin_log` VALUES (963, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:16:45');
INSERT INTO `site_admin_log` VALUES (964, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-06 10:19:07.9330442 +0800 CST m=+57105.816390201, 第 106 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-06 10:19:08');
INSERT INTO `site_admin_log` VALUES (965, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:20:12');
INSERT INTO `site_admin_log` VALUES (966, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:20:56');
INSERT INTO `site_admin_log` VALUES (967, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":3},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":10},{\\\"id\\\":31},{\\\"id\\\":2}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:22:07');
INSERT INTO `site_admin_log` VALUES (968, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":2,\"sort\":1,\"updated_at\":\"2020-03-06T10:41:26.3179977+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:41:26');
INSERT INTO `site_admin_log` VALUES (969, 1, 1, 2, '任务', '{\"id\":1000000001,\"title\":\"aa\",\"describe\":\"bb\",\"status\":1,\"sort\":1,\"updated_at\":\"2020-03-06T10:41:37.6083577+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-06 10:41:38');
INSERT INTO `site_admin_log` VALUES (970, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-06 14:01:04.1729926 +0800 CST m=+70422.054025501, 第 107 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-06 14:01:04');
INSERT INTO `site_admin_log` VALUES (971, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:05:41.8044859 +0800 CST m=+1910.239607301, 第 633 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:05:42');
INSERT INTO `site_admin_log` VALUES (972, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:06:13.0956532 +0800 CST m=+1941.530774601, 第 634 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:06:13');
INSERT INTO `site_admin_log` VALUES (973, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:06:30.5829631 +0800 CST m=+1959.018084501, 第 635 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:06:31');
INSERT INTO `site_admin_log` VALUES (974, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:19:28.7347539 +0800 CST m=+2737.169875301, 第 636 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:19:29');
INSERT INTO `site_admin_log` VALUES (975, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:21:17.0065297 +0800 CST m=+2845.441651101, 第 637 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:21:17');
INSERT INTO `site_admin_log` VALUES (976, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:29:07.3399329 +0800 CST m=+3315.775054301, 第 638 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:29:07');
INSERT INTO `site_admin_log` VALUES (977, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 15:39:16.4260685 +0800 CST m=+3924.861189901, 第 639 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 15:39:16');
INSERT INTO `site_admin_log` VALUES (978, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 16:03:51.1354129 +0800 CST m=+5399.542838701, 第 640 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 16:03:51');
INSERT INTO `site_admin_log` VALUES (979, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 16:05:51.7181882 +0800 CST m=+5520.125614001, 第 641 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 16:05:52');
INSERT INTO `site_admin_log` VALUES (980, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-06T16:06:29.8563588+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 16:06:30');
INSERT INTO `site_admin_log` VALUES (981, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-06T16:06:30.8512638+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 16:06:31');
INSERT INTO `site_admin_log` VALUES (982, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 16:06:38.2847676 +0800 CST m=+5566.692193401, 第 642 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 16:06:38');
INSERT INTO `site_admin_log` VALUES (983, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-06 16:08:57.8783616 +0800 CST m=+4.251248001, 第 306 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-06 16:08:58');
INSERT INTO `site_admin_log` VALUES (984, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 18:16:07.837562 +0800 CST m=+13336.258692501, 第 643 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 18:16:08');
INSERT INTO `site_admin_log` VALUES (985, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-06 19:20:06.3126495 +0800 CST m=+17174.746289301, 第 644 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-06 19:20:06');
INSERT INTO `site_admin_log` VALUES (986, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:36:39.7273731 +0800 CST m=+4597.931435701, 第 307 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:36:40');
INSERT INTO `site_admin_log` VALUES (987, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:36:48.4388838 +0800 CST m=+4606.642946401, 第 308 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:36:48');
INSERT INTO `site_admin_log` VALUES (988, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:37:19.6224797 +0800 CST m=+2.041251601, 第 309 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:37:20');
INSERT INTO `site_admin_log` VALUES (989, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:42:01.1143517 +0800 CST m=+3.924655901, 第 310 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:42:01');
INSERT INTO `site_admin_log` VALUES (990, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:43:18.2803996 +0800 CST m=+3.511225001, 第 311 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:43:18');
INSERT INTO `site_admin_log` VALUES (991, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:48:14.6308546 +0800 CST m=+4.548253701, 第 312 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:48:15');
INSERT INTO `site_admin_log` VALUES (992, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:49:58.5580313 +0800 CST m=+5.289283401, 第 313 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:49:59');
INSERT INTO `site_admin_log` VALUES (993, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:54:10.1355537 +0800 CST m=+2.655716001, 第 314 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:54:10');
INSERT INTO `site_admin_log` VALUES (994, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:54:41.4240165 +0800 CST m=+5.236755201, 第 315 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:54:41');
INSERT INTO `site_admin_log` VALUES (995, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:55:31.505358 +0800 CST m=+4.710028801, 第 316 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:55:32');
INSERT INTO `site_admin_log` VALUES (996, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:56:17.9033131 +0800 CST m=+3.458218701, 第 317 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:56:18');
INSERT INTO `site_admin_log` VALUES (997, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 12:59:57.4233343 +0800 CST m=+4.018652701, 第 318 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 12:59:57');
INSERT INTO `site_admin_log` VALUES (998, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:03:31.3030005 +0800 CST m=+3.279748501, 第 319 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:03:31');
INSERT INTO `site_admin_log` VALUES (999, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:04:56.6957692 +0800 CST m=+2.807949101, 第 320 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:04:57');
INSERT INTO `site_admin_log` VALUES (1000, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:06:58.1491779 +0800 CST m=+10.465875601, 第 321 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:06:58');
INSERT INTO `site_admin_log` VALUES (1001, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:07:31.2020462 +0800 CST m=+2.643813401, 第 322 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:07:31');
INSERT INTO `site_admin_log` VALUES (1002, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:10:27.7529928 +0800 CST m=+3.242479101, 第 323 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:10:28');
INSERT INTO `site_admin_log` VALUES (1003, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:24:33.2500268 +0800 CST m=+5.567599601, 第 324 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:24:33');
INSERT INTO `site_admin_log` VALUES (1004, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:26:43.7676474 +0800 CST m=+6.212176001, 第 325 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:26:44');
INSERT INTO `site_admin_log` VALUES (1005, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:28:05.4707367 +0800 CST m=+1.145782201, 第 326 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:28:05');
INSERT INTO `site_admin_log` VALUES (1006, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:29:30.5300806 +0800 CST m=+0.451930701, 第 327 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:29:31');
INSERT INTO `site_admin_log` VALUES (1007, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:37:12.1867047 +0800 CST m=+4.039687201, 第 328 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:37:12');
INSERT INTO `site_admin_log` VALUES (1008, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:44:39.9299271 +0800 CST m=+5.793084501, 第 329 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:44:40');
INSERT INTO `site_admin_log` VALUES (1009, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:45:45.7246644 +0800 CST m=+2.257560201, 第 330 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:45:46');
INSERT INTO `site_admin_log` VALUES (1010, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:46:58.0058089 +0800 CST m=+6.188384901, 第 331 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:46:58');
INSERT INTO `site_admin_log` VALUES (1011, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 13:47:58.1387216 +0800 CST m=+21.758854601, 第 332 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 13:47:58');
INSERT INTO `site_admin_log` VALUES (1012, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"1\",\"created_at\":\"2020-03-07T13:48:04.1301747+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 13:48:04');
INSERT INTO `site_admin_log` VALUES (1013, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:04:10.8133358 +0800 CST m=+4.344452001, 第 333 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:04:11');
INSERT INTO `site_admin_log` VALUES (1014, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"1\",\"created_at\":\"2020-03-07T14:05:58.8818139+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:05:59');
INSERT INTO `site_admin_log` VALUES (1015, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:06:40.0479341 +0800 CST m=+21.896770101, 第 334 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:06:40');
INSERT INTO `site_admin_log` VALUES (1016, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"1\",\"created_at\":\"2020-03-07T14:06:50.7997928+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:06:51');
INSERT INTO `site_admin_log` VALUES (1017, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:08:12.8082925 +0800 CST m=+0.401389001, 第 335 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:08:13');
INSERT INTO `site_admin_log` VALUES (1018, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"1\",\"created_at\":\"2020-03-07T14:08:20.1423149+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:08:20');
INSERT INTO `site_admin_log` VALUES (1019, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:08:37.2743699 +0800 CST m=+2.684890601, 第 336 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:08:37');
INSERT INTO `site_admin_log` VALUES (1020, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"1\",\"created_at\":\"2020-03-07T14:08:43.6775902+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:08:44');
INSERT INTO `site_admin_log` VALUES (1021, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:10:46.6448836 +0800 CST m=+3.258183601, 第 337 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:10:47');
INSERT INTO `site_admin_log` VALUES (1022, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"@file:C:\\\\Users\\\\Administrator\\\\Pictures\\\\1.jpg\",\"created_at\":\"2020-03-07T14:11:01.8425737+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:11:02');
INSERT INTO `site_admin_log` VALUES (1023, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:17:59.9458853 +0800 CST m=+76.056701201, 第 338 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:18:00');
INSERT INTO `site_admin_log` VALUES (1024, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:18:06.1359978+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:18:06');
INSERT INTO `site_admin_log` VALUES (1025, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:19:45.8727458 +0800 CST m=+13.817658601, 第 339 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:19:46');
INSERT INTO `site_admin_log` VALUES (1026, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:19:52.462449+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:19:53');
INSERT INTO `site_admin_log` VALUES (1027, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"@file:C:\\\\Users\\\\Administrator\\\\Pictures\\\\1.jpg\",\"created_at\":\"2020-03-07T14:20:32.5733927+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:20:33');
INSERT INTO `site_admin_log` VALUES (1028, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"@file:C:\\\\Users\\\\Administrator\\\\Pictures\\\\1.jpg\",\"created_at\":\"2020-03-07T14:21:16.8438347+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:21:17');
INSERT INTO `site_admin_log` VALUES (1029, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:23:56.4460313 +0800 CST m=+3.681750601, 第 340 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:23:56');
INSERT INTO `site_admin_log` VALUES (1030, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"@file:C:\\\\Users\\\\Administrator\\\\Pictures\\\\1.jpg\",\"created_at\":\"2020-03-07T14:24:02.8899652+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:24:03');
INSERT INTO `site_admin_log` VALUES (1031, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:24:26.5805604+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:24:27');
INSERT INTO `site_admin_log` VALUES (1032, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:24:41.6722829+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:24:42');
INSERT INTO `site_admin_log` VALUES (1033, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:24:49.7763203+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:24:50');
INSERT INTO `site_admin_log` VALUES (1034, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:25:09.4348786 +0800 CST m=+3.672464301, 第 341 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:25:09');
INSERT INTO `site_admin_log` VALUES (1035, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:25:16.9282977+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:25:17');
INSERT INTO `site_admin_log` VALUES (1036, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:31:20.6792279 +0800 CST m=+6.124529701, 第 342 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:31:21');
INSERT INTO `site_admin_log` VALUES (1037, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:31:27.9452119+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:31:28');
INSERT INTO `site_admin_log` VALUES (1038, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:32:07.2716216+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:32:07');
INSERT INTO `site_admin_log` VALUES (1039, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:33:12.7512323 +0800 CST m=+10.343765601, 第 343 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:33:13');
INSERT INTO `site_admin_log` VALUES (1040, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"{}\",\"created_at\":\"2020-03-07T14:33:18.8509803+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:33:19');
INSERT INTO `site_admin_log` VALUES (1041, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:40:03.9097742 +0800 CST m=+1.429731701, 第 344 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:40:04');
INSERT INTO `site_admin_log` VALUES (1042, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:40:14.6058959+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:40:15');
INSERT INTO `site_admin_log` VALUES (1043, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:40:27.4862895+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:40:28');
INSERT INTO `site_admin_log` VALUES (1044, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:42:00.4142195 +0800 CST m=+5.263911601, 第 345 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:42:00');
INSERT INTO `site_admin_log` VALUES (1045, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:42:07.3770293+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:42:07');
INSERT INTO `site_admin_log` VALUES (1046, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:42:47.9734127 +0800 CST m=+6.169323801, 第 346 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:42:48');
INSERT INTO `site_admin_log` VALUES (1047, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:43:16.0573572 +0800 CST m=+4.170055401, 第 347 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:43:16');
INSERT INTO `site_admin_log` VALUES (1048, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:44:11.2595778 +0800 CST m=+5.026046601, 第 348 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:44:11');
INSERT INTO `site_admin_log` VALUES (1049, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:45:17.8656533 +0800 CST m=+4.054455301, 第 349 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:45:18');
INSERT INTO `site_admin_log` VALUES (1050, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:45:22.3351081+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:45:22');
INSERT INTO `site_admin_log` VALUES (1051, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:47:37.9676296 +0800 CST m=+3.003083701, 第 350 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:47:38');
INSERT INTO `site_admin_log` VALUES (1052, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:48:38.3729165 +0800 CST m=+1.709087801, 第 351 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:48:38');
INSERT INTO `site_admin_log` VALUES (1053, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:48:51.5565818+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:48:52');
INSERT INTO `site_admin_log` VALUES (1054, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:49:13.7085328 +0800 CST m=+2.795155601, 第 352 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:49:14');
INSERT INTO `site_admin_log` VALUES (1055, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:49:24.2660307+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:49:24');
INSERT INTO `site_admin_log` VALUES (1056, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:50:16.6161055 +0800 CST m=+4.106113301, 第 353 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:50:17');
INSERT INTO `site_admin_log` VALUES (1057, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:51:21.4373217 +0800 CST m=+2.396255701, 第 354 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:51:21');
INSERT INTO `site_admin_log` VALUES (1058, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:52:52.0233746 +0800 CST m=+2.686109801, 第 355 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:52:52');
INSERT INTO `site_admin_log` VALUES (1059, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:55:03.0375488 +0800 CST m=+4.213358601, 第 356 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:55:03');
INSERT INTO `site_admin_log` VALUES (1060, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:55:10.7739229+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:55:11');
INSERT INTO `site_admin_log` VALUES (1061, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:56:42.6158298 +0800 CST m=+4.556234001, 第 357 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:56:43');
INSERT INTO `site_admin_log` VALUES (1062, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:56:47.2199713+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:56:47');
INSERT INTO `site_admin_log` VALUES (1063, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:58:55.1024869 +0800 CST m=+4.587491301, 第 358 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:58:55');
INSERT INTO `site_admin_log` VALUES (1064, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:59:00.0960248+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:59:00');
INSERT INTO `site_admin_log` VALUES (1065, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 14:59:27.0691542 +0800 CST m=+4.132421601, 第 359 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 14:59:27');
INSERT INTO `site_admin_log` VALUES (1066, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T14:59:32.0355034+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 14:59:32');
INSERT INTO `site_admin_log` VALUES (1067, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:03:52.8551994 +0800 CST m=+3.218971201, 第 360 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:03:53');
INSERT INTO `site_admin_log` VALUES (1068, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:03:59.0940134+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:03:59');
INSERT INTO `site_admin_log` VALUES (1069, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:06:41.6083037 +0800 CST m=+6.095700501, 第 361 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:06:42');
INSERT INTO `site_admin_log` VALUES (1070, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:06:47.3426245+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:06:47');
INSERT INTO `site_admin_log` VALUES (1071, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:07:24.0743898 +0800 CST m=+4.995638501, 第 362 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:07:24');
INSERT INTO `site_admin_log` VALUES (1072, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:07:31.4641067+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:07:32');
INSERT INTO `site_admin_log` VALUES (1073, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:09:01.2864151 +0800 CST m=+2.103961301, 第 363 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:09:01');
INSERT INTO `site_admin_log` VALUES (1074, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:09:10.8845668+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:09:11');
INSERT INTO `site_admin_log` VALUES (1075, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:10:44.7019554 +0800 CST m=+3.923548501, 第 364 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:10:45');
INSERT INTO `site_admin_log` VALUES (1076, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:10:49.5402859+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:10:50');
INSERT INTO `site_admin_log` VALUES (1077, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:11:20.18111 +0800 CST m=+4.996120801, 第 365 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:11:20');
INSERT INTO `site_admin_log` VALUES (1078, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:11:24.8540963+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:11:25');
INSERT INTO `site_admin_log` VALUES (1079, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:13:24.0944487 +0800 CST m=+4.079476501, 第 366 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:13:24');
INSERT INTO `site_admin_log` VALUES (1080, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:13:29.0072241+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:13:29');
INSERT INTO `site_admin_log` VALUES (1081, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:16:19.6247897 +0800 CST m=+3.999487901, 第 367 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:16:20');
INSERT INTO `site_admin_log` VALUES (1082, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:16:24.73655+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:16:25');
INSERT INTO `site_admin_log` VALUES (1083, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:18:04.9444758 +0800 CST m=+4.412136101, 第 368 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:18:05');
INSERT INTO `site_admin_log` VALUES (1084, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:18:10.2530361+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:18:10');
INSERT INTO `site_admin_log` VALUES (1085, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:18:45.4434712 +0800 CST m=+3.931000301, 第 369 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:18:45');
INSERT INTO `site_admin_log` VALUES (1086, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"\",\"created_at\":\"2020-03-07T15:18:50.3009557+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:18:50');
INSERT INTO `site_admin_log` VALUES (1087, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:19:51.5476881 +0800 CST m=+5.407152401, 第 370 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:19:52');
INSERT INTO `site_admin_log` VALUES (1088, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583565595482.png\\\"]\",\"created_at\":\"2020-03-07T15:19:55.9417638+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:19:56');
INSERT INTO `site_admin_log` VALUES (1089, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:25:43.2937784 +0800 CST m=+3.374711801, 第 371 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:25:43');
INSERT INTO `site_admin_log` VALUES (1090, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:27:11.5938001 +0800 CST m=+4.815844101, 第 372 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:27:12');
INSERT INTO `site_admin_log` VALUES (1091, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583566036482.png\\\"]\",\"created_at\":\"2020-03-07T15:27:16.8783237+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:27:17');
INSERT INTO `site_admin_log` VALUES (1092, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 15:31:07.5210114 +0800 CST m=+1.853243001, 第 373 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 15:31:08');
INSERT INTO `site_admin_log` VALUES (1093, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583566273482.png\\\"]\",\"created_at\":\"2020-03-07T15:31:13.2110857+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 15:31:13');
INSERT INTO `site_admin_log` VALUES (1094, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 17:47:21.8958255 +0800 CST m=+36.209218901, 第 374 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 17:47:22');
INSERT INTO `site_admin_log` VALUES (1095, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 17:49:00.5302748 +0800 CST m=+6.311210901, 第 375 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 17:49:01');
INSERT INTO `site_admin_log` VALUES (1096, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 17:49:31.4242456 +0800 CST m=+4.189980901, 第 376 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 17:49:31');
INSERT INTO `site_admin_log` VALUES (1097, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 17:55:39.1313289 +0800 CST m=+3.606934001, 第 377 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 17:55:39');
INSERT INTO `site_admin_log` VALUES (1098, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:05:57.8482976 +0800 CST m=+7.408943201, 第 378 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:05:58');
INSERT INTO `site_admin_log` VALUES (1099, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:06:47.494645 +0800 CST m=+3.904805701, 第 379 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:06:47');
INSERT INTO `site_admin_log` VALUES (1100, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:20:06.5259967 +0800 CST m=+8.781597601, 第 380 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:20:07');
INSERT INTO `site_admin_log` VALUES (1101, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:23:53.8493425 +0800 CST m=+0.963659501, 第 381 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:23:54');
INSERT INTO `site_admin_log` VALUES (1102, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:24:21.0526113 +0800 CST m=+3.417851501, 第 382 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:24:21');
INSERT INTO `site_admin_log` VALUES (1103, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:27:11.7126286 +0800 CST m=+3.834665101, 第 383 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:27:12');
INSERT INTO `site_admin_log` VALUES (1104, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:35:20.5699776 +0800 CST m=+3.880041001, 第 384 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:35:21');
INSERT INTO `site_admin_log` VALUES (1105, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:36:20.9110089 +0800 CST m=+12.494854201, 第 385 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:36:21');
INSERT INTO `site_admin_log` VALUES (1106, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:38:27.5255927 +0800 CST m=+2.831514601, 第 386 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:38:28');
INSERT INTO `site_admin_log` VALUES (1107, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:40:23.8766004 +0800 CST m=+4.726046701, 第 387 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:40:24');
INSERT INTO `site_admin_log` VALUES (1108, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:43:23.8750235 +0800 CST m=+3.377835301, 第 388 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:43:24');
INSERT INTO `site_admin_log` VALUES (1109, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 18:44:04.7216968 +0800 CST m=+3.527802101, 第 389 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 18:44:05');
INSERT INTO `site_admin_log` VALUES (1110, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:00:53.8453654 +0800 CST m=+5.469219801, 第 390 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:00:54');
INSERT INTO `site_admin_log` VALUES (1111, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583578915482.png\\\"]\",\"created_at\":\"2020-03-07T19:01:55.3352184+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 19:01:55');
INSERT INTO `site_admin_log` VALUES (1112, 2, 9, 2, '会员状态', '{\"user_id\":100101002,\"phone\":\"13111111111\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583578952482.png\\\"]\",\"created_at\":\"2020-03-07T19:02:32.4868638+08:00\"}', 48, 'test001', 100101002, '13111111111', '10.10.35.250', '2020-03-07 19:02:33');
INSERT INTO `site_admin_log` VALUES (1113, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:05:56.8575936 +0800 CST m=+5.533543901, 第 391 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:05:57');
INSERT INTO `site_admin_log` VALUES (1114, 2, 9, 2, '会员状态', '{\"user_id\":100101003,\"phone\":\"13125153563\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583579164482.png\\\"]\",\"created_at\":\"2020-03-07T19:06:04.4336644+08:00\"}', 48, 'test001', 100101003, '13125153563', '10.10.35.250', '2020-03-07 19:06:05');
INSERT INTO `site_admin_log` VALUES (1115, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"runtime/uploads/1583579222482.png\\\"]\",\"created_at\":\"2020-03-07T19:07:02.0644691+08:00\"}', 48, 'test001', 100101006, '13294138888', '10.10.35.250', '2020-03-07 19:07:02');
INSERT INTO `site_admin_log` VALUES (1116, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:08:25.9372263 +0800 CST m=+7.631904701, 第 392 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:08:26');
INSERT INTO `site_admin_log` VALUES (1117, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579318482.png\\\"]\",\"created_at\":\"2020-03-07T19:08:38.6037629+08:00\"}', 48, 'test001', 100101006, '13294138888', '10.10.35.250', '2020-03-07 19:08:39');
INSERT INTO `site_admin_log` VALUES (1118, 2, 9, 2, '会员状态', '{\"user_id\":100101007,\"phone\":\"13091919191\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579369482.png\\\"]\",\"created_at\":\"2020-03-07T19:09:29.7425423+08:00\"}', 48, 'test001', 100101007, '13091919191', '10.10.35.250', '2020-03-07 19:09:30');
INSERT INTO `site_admin_log` VALUES (1119, 2, 9, 2, '会员状态', '{\"user_id\":100101008,\"phone\":\"13092929292\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579373482.png\\\"]\",\"created_at\":\"2020-03-07T19:09:33.3097892+08:00\"}', 48, 'test001', 100101008, '13092929292', '10.10.35.250', '2020-03-07 19:09:33');
INSERT INTO `site_admin_log` VALUES (1120, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579376482.png\\\"]\",\"created_at\":\"2020-03-07T19:09:36.1258546+08:00\"}', 48, 'test001', 100101001, '13294137777', '10.10.35.250', '2020-03-07 19:09:36');
INSERT INTO `site_admin_log` VALUES (1121, 2, 9, 2, '会员状态', '{\"user_id\":100101002,\"phone\":\"13111111111\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579378482.png\\\"]\",\"created_at\":\"2020-03-07T19:09:38.4409086+08:00\"}', 48, 'test001', 100101002, '13111111111', '10.10.35.250', '2020-03-07 19:09:38');
INSERT INTO `site_admin_log` VALUES (1122, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:10:29.7555633 +0800 CST m=+4.567724301, 第 393 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:10:30');
INSERT INTO `site_admin_log` VALUES (1123, 2, 9, 2, '会员状态', '{\"user_id\":100101002,\"phone\":\"13111111111\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583579443754723600482.png\\\"]\",\"created_at\":\"2020-03-07T19:10:43.7547236+08:00\"}', 48, 'test001', 100101002, '13111111111', '10.10.35.250', '2020-03-07 19:10:44');
INSERT INTO `site_admin_log` VALUES (1124, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:12:03.5363362 +0800 CST m=+2.629064501, 第 394 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:12:04');
INSERT INTO `site_admin_log` VALUES (1125, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:13:05.9410931 +0800 CST m=+65.033821401, 第 395 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:13:06');
INSERT INTO `site_admin_log` VALUES (1126, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:27:36.9070279 +0800 CST m=+75.504675801, 第 396 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:27:37');
INSERT INTO `site_admin_log` VALUES (1127, 2, 9, 2, '会员状态', '{\"user_id\":100101002,\"phone\":\"13111111111\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"1\",\"image\":\"[\\\"public/uploads/1583580734199760000482.png\\\"]\",\"created_at\":\"2020-03-07T19:32:14.19976+08:00\"}', 48, 'test001', 100101002, '13111111111', '10.10.35.250', '2020-03-07 19:32:14');
INSERT INTO `site_admin_log` VALUES (1128, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-07 19:34:28.3059066 +0800 CST m=+7.163779601, 第 397 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-07 19:34:28');
INSERT INTO `site_admin_log` VALUES (1129, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-08 10:08:20.6412985 +0800 CST m=+52338.144736801, 第 645 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 10:08:21');
INSERT INTO `site_admin_log` VALUES (1130, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-08 10:56:58.6982494 +0800 CST m=+55256.258092101, 第 646 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 10:56:59');
INSERT INTO `site_admin_log` VALUES (1131, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"会员详情\",\"permission_code\":\"user_info\",\"permission_path\":\"member/member_detail\",\"request_param\":\"GET\",\"sort\":2,\"type\":2,\"status\":2,\"created_at\":\"2020-03-08T11:12:06.2273299+08:00\",\"updated_at\":\"2020-03-08T11:12:06.2273299+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 11:12:06');
INSERT INTO `site_admin_log` VALUES (1132, 2, 1, 2, '权限管理', '{\"id\":20,\"parent_id\":11,\"permission_name\":\"银行卡列表\",\"permission_code\":\"user_bank\",\"permission_path\":\"member/bank_list\",\"request_param\":\"GET\",\"joins\":\"1,11\",\"sort\":5,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-08T11:12:41.7482091+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 11:12:42');
INSERT INTO `site_admin_log` VALUES (1133, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-08 13:01:02.488733 +0800 CST m=+62699.993581001, 第 647 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 13:01:02');
INSERT INTO `site_admin_log` VALUES (1134, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-08 13:22:11.5734209 +0800 CST m=+63969.078268901, 第 648 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 13:22:12');
INSERT INTO `site_admin_log` VALUES (1135, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":3600,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"222\",\"image\":\"[\\\"public/uploads/15836615204190758001timg.jpg\\\"]\",\"created_at\":\"2020-03-08T17:58:40.4190758+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-08 17:58:40');
INSERT INTO `site_admin_log` VALUES (1136, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":3600,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"222\",\"image\":\"[\\\"public/uploads/15836616600355995001timg.jpg\\\"]\",\"created_at\":\"2020-03-08T18:01:00.0355995+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-08 18:01:00');
INSERT INTO `site_admin_log` VALUES (1137, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":3600,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"222\",\"image\":\"[\\\"public/uploads/15836627325779046001timg.jpg\\\"]\",\"created_at\":\"2020-03-08T18:18:52.5779046+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-08 18:18:53');
INSERT INTO `site_admin_log` VALUES (1138, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":3600,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"\",\"image\":\"[\\\"public/uploads/15836651255687466001timg.jpg\\\"]\",\"created_at\":\"2020-03-08T18:58:45.5687466+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-08 18:58:46');
INSERT INTO `site_admin_log` VALUES (1139, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":3600,\"withdraw_status\":21600,\"message_status\":86400,\"login_status\":259200,\"remark\":\"test00\",\"image\":\"[\\\"public/uploads/15836657212347715001timg.jpg\\\"]\",\"created_at\":\"2020-03-08T19:08:41.2347715+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-08 19:08:41');
INSERT INTO `site_admin_log` VALUES (1140, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-08 21:32:11.1555869 +0800 CST m=+93368.321601701, 第 649 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-08 21:32:11');
INSERT INTO `site_admin_log` VALUES (1141, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 09:58:58.9155932 +0800 CST m=+138176.438674601, 第 650 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 09:58:59');
INSERT INTO `site_admin_log` VALUES (1142, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 10:09:46.8943649 +0800 CST m=+138824.417446301, 第 651 次登陆', 1, 'admin', 0, '', '10.10.35.132', '2020-03-09 10:09:47');
INSERT INTO `site_admin_log` VALUES (1143, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 10:10:19.9223363 +0800 CST m=+138857.445417701, 第 652 次登陆', 1, 'admin', 0, '', '10.10.35.132', '2020-03-09 10:10:20');
INSERT INTO `site_admin_log` VALUES (1144, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 10:10:40.6924537 +0800 CST m=+138878.215535101, 第 653 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 10:10:41');
INSERT INTO `site_admin_log` VALUES (1145, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":3600,\"message_status\":1,\"login_status\":3600,\"remark\":\"\",\"image\":\"[\\\"public/uploads/15837204633396285001timg.jpg\\\"]\",\"created_at\":\"2020-03-09T10:21:03.3396285+08:00\"}', 1, 'admin', 100101001, '13294137777', '10.10.35.146', '2020-03-09 10:21:03');
INSERT INTO `site_admin_log` VALUES (1146, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 10:23:08.4654389 +0800 CST m=+102.692347701, 第 108 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 10:23:08');
INSERT INTO `site_admin_log` VALUES (1147, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-09 10:31:46.6072288 +0800 CST m=+620.834137601, 第 42 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:31:47');
INSERT INTO `site_admin_log` VALUES (1148, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:32:09');
INSERT INTO `site_admin_log` VALUES (1149, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 10:35:52.242582 +0800 CST m=+866.469490801, 第 109 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 10:35:52');
INSERT INTO `site_admin_log` VALUES (1150, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":11,\"joins\":\"1,11\",\"permission_name\":\"会员解/封禁\",\"permission_code\":\"user\",\"permission_path\":\"member/member_ban\",\"request_param\":\"PATCH\",\"sort\":2,\"type\":3,\"status\":1,\"created_at\":\"2020-03-09T10:40:48.9121285+08:00\",\"updated_at\":\"2020-03-09T10:40:48.9121285+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:40:49');
INSERT INTO `site_admin_log` VALUES (1151, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:42:11');
INSERT INTO `site_admin_log` VALUES (1152, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:44:17');
INSERT INTO `site_admin_log` VALUES (1153, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:44:27');
INSERT INTO `site_admin_log` VALUES (1154, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:46:46');
INSERT INTO `site_admin_log` VALUES (1155, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:47:23');
INSERT INTO `site_admin_log` VALUES (1156, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:47:32');
INSERT INTO `site_admin_log` VALUES (1157, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:47:53');
INSERT INTO `site_admin_log` VALUES (1158, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 10:48:01');
INSERT INTO `site_admin_log` VALUES (1159, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 11:13:00.3682086 +0800 CST m=+69.678143501, 第 110 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 11:13:00');
INSERT INTO `site_admin_log` VALUES (1160, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 11:13:13.7180993 +0800 CST m=+83.028034201, 第 654 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:13:14');
INSERT INTO `site_admin_log` VALUES (1161, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:13:23');
INSERT INTO `site_admin_log` VALUES (1162, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:13:36');
INSERT INTO `site_admin_log` VALUES (1163, 2, 9, 2, '会员状态', '{\"user_id\":100101001,\"phone\":\"13294137777\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":3600,\"login_status\":21600,\"remark\":\"\",\"image\":\"[\\\"public/uploads/158372362961455870054I{WUT19]RP)}`YVZV(`RKWT.png\\\"]\",\"created_at\":\"2020-03-09T11:13:49.6145587+08:00\"}', 54, 'clear1', 100101001, '13294137777', '10.10.35.146', '2020-03-09 11:13:50');
INSERT INTO `site_admin_log` VALUES (1164, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:15:18');
INSERT INTO `site_admin_log` VALUES (1165, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:15:33');
INSERT INTO `site_admin_log` VALUES (1166, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:20:04');
INSERT INTO `site_admin_log` VALUES (1167, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 11:20:11.5626355 +0800 CST m=+500.872570401, 第 655 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:20:12');
INSERT INTO `site_admin_log` VALUES (1168, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 11:20:33.3144507 +0800 CST m=+522.624385601, 第 111 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 11:20:33');
INSERT INTO `site_admin_log` VALUES (1169, 2, 1, 2, '权限控制', '{\"role_id\":23,\"permission_ids\":\"[{\\\"id\\\":17},{\\\"id\\\":33},{\\\"id\\\":32},{\\\"id\\\":11}]\",\"status\":1,\"module\":\"{}\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 11:22:02');
INSERT INTO `site_admin_log` VALUES (1170, 2, 9, 2, '会员状态', '{\"user_id\":100101003,\"phone\":\"13125153563\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":3600,\"login_status\":21600,\"remark\":\"\",\"image\":\"[\\\"public/uploads/158372414177152960054I{WUT19]RP)}`YVZV(`RKWT.png\\\"]\",\"created_at\":\"2020-03-09T11:22:21.7715296+08:00\"}', 54, 'clear1', 100101003, '13125153563', '10.10.35.146', '2020-03-09 11:22:22');
INSERT INTO `site_admin_log` VALUES (1171, 2, 9, 2, '会员状态', '{\"user_id\":100101003,\"phone\":\"13125153563\",\"publish_status\":21600,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":21600,\"login_status\":3600,\"remark\":\"\",\"image\":\"[\\\"public/uploads/158372437025815570054I{WUT19]RP)}`YVZV(`RKWT.png\\\"]\",\"created_at\":\"2020-03-09T11:26:10.2581557+08:00\"}', 54, 'clear1', 100101003, '13125153563', '10.10.35.146', '2020-03-09 11:26:10');
INSERT INTO `site_admin_log` VALUES (1172, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:41:38.5071854 +0800 CST m=+7.091020701, 第 398 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:41:39');
INSERT INTO `site_admin_log` VALUES (1173, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:47:56.9479212 +0800 CST m=+4.040053601, 第 399 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:47:57');
INSERT INTO `site_admin_log` VALUES (1174, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:49:14.2562576 +0800 CST m=+6.453651801, 第 400 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:49:14');
INSERT INTO `site_admin_log` VALUES (1175, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:50:13.583583 +0800 CST m=+2.613351001, 第 401 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:50:14');
INSERT INTO `site_admin_log` VALUES (1176, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:51:43.2446313 +0800 CST m=+4.063492801, 第 402 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:51:43');
INSERT INTO `site_admin_log` VALUES (1177, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:53:06.6382074 +0800 CST m=+0.347075501, 第 403 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:53:07');
INSERT INTO `site_admin_log` VALUES (1178, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 12:55:41.3267508 +0800 CST m=+2.971061201, 第 404 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 12:55:41');
INSERT INTO `site_admin_log` VALUES (1179, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 12:58:37.5460294 +0800 CST m=+1243.888781101, 第 112 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 12:58:38');
INSERT INTO `site_admin_log` VALUES (1180, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 12:58:42.502692 +0800 CST m=+1248.845443701, 第 656 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 12:58:43');
INSERT INTO `site_admin_log` VALUES (1181, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 13:06:46.5137549 +0800 CST m=+24.250699201, 第 405 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 13:06:47');
INSERT INTO `site_admin_log` VALUES (1182, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 13:07:06.5903728 +0800 CST m=+133.498827801, 第 657 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 13:07:07');
INSERT INTO `site_admin_log` VALUES (1183, 2, 9, 2, '会员状态', '{\"user_id\":100101006,\"phone\":\"13294138888\",\"publish_status\":1,\"subscribe_status\":1,\"withdraw_status\":1,\"message_status\":1,\"login_status\":1,\"remark\":\"\",\"image\":\"{}\",\"created_at\":\"2020-03-09T13:12:03.4651563+08:00\"}', 1, 'admin', 100101006, '13294138888', '10.10.35.146', '2020-03-09 13:12:04');
INSERT INTO `site_admin_log` VALUES (1184, 1, 2, 5, '登陆', '管理员: clear1, 在 2020-03-09 13:50:14.5208776 +0800 CST m=+240.300022001, 第 113 次登陆', 54, 'clear1', 0, '', '10.10.35.146', '2020-03-09 13:50:15');
INSERT INTO `site_admin_log` VALUES (1185, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 13:53:00.0375464 +0800 CST m=+405.816690801, 第 658 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 13:53:00');
INSERT INTO `site_admin_log` VALUES (1186, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:08:20.0315587 +0800 CST m=+15.000877501, 第 406 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:08:20');
INSERT INTO `site_admin_log` VALUES (1187, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:13:08.7212337 +0800 CST m=+4.347487201, 第 407 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:13:09');
INSERT INTO `site_admin_log` VALUES (1188, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:15:12.7398196 +0800 CST m=+4.285735901, 第 408 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:15:13');
INSERT INTO `site_admin_log` VALUES (1189, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:16:33.5198968 +0800 CST m=+4.682960201, 第 409 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:16:34');
INSERT INTO `site_admin_log` VALUES (1190, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:18:44.025315 +0800 CST m=+4.167233201, 第 410 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:18:44');
INSERT INTO `site_admin_log` VALUES (1191, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:37:05.158988 +0800 CST m=+2.933908601, 第 411 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:37:05');
INSERT INTO `site_admin_log` VALUES (1192, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:38:56.6611056 +0800 CST m=+3.360574001, 第 412 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:38:57');
INSERT INTO `site_admin_log` VALUES (1193, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:39:43.1003121 +0800 CST m=+5.582140001, 第 413 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:39:43');
INSERT INTO `site_admin_log` VALUES (1194, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:40:53.2619958 +0800 CST m=+3.080832301, 第 414 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:40:53');
INSERT INTO `site_admin_log` VALUES (1195, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 14:54:17.0247588 +0800 CST m=+3.417058101, 第 415 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 14:54:17');
INSERT INTO `site_admin_log` VALUES (1196, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":16,\"joins\":\"1,16\",\"permission_name\":\"122\",\"permission_code\":\"1\",\"permission_path\":\"dashboard\",\"request_param\":\"\",\"sort\":0,\"type\":1,\"status\":1,\"created_at\":\"2020-03-09T14:55:56.6439621+08:00\",\"updated_at\":\"2020-03-09T14:55:56.6439621+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 14:55:57');
INSERT INTO `site_admin_log` VALUES (1197, 2, 1, 2, '权限管理', '{\"id\":34,\"parent_id\":27,\"permission_name\":\"122\",\"permission_code\":\"12\",\"permission_path\":\"test/test\",\"request_param\":\"GET\",\"joins\":\"1,27\",\"sort\":0,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-09T14:57:40.471487+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 14:57:40');
INSERT INTO `site_admin_log` VALUES (1198, 2, 1, 2, '权限管理', '{\"id\":29,\"parent_id\":27,\"permission_name\":\"bb\",\"permission_code\":\"bb\",\"permission_path\":\"test/test\",\"request_param\":\"GET\",\"joins\":\"1,27\",\"sort\":2,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-09T14:57:58.7360259+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 14:57:59');
INSERT INTO `site_admin_log` VALUES (1199, 2, 1, 2, '权限管理', '{\"id\":34,\"parent_id\":27,\"permission_name\":\"122\",\"permission_code\":\"12\",\"permission_path\":\"test/test1\",\"request_param\":\"GET\",\"joins\":\"1,27\",\"sort\":0,\"type\":2,\"status\":2,\"remark\":\"\",\"updated_at\":\"2020-03-09T14:58:54.9704058+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 14:58:55');
INSERT INTO `site_admin_log` VALUES (1200, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 15:14:48.3590837 +0800 CST m=+2.841600801, 第 416 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 15:14:48');
INSERT INTO `site_admin_log` VALUES (1201, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 15:16:24.3494918 +0800 CST m=+15.259439901, 第 659 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 15:16:24');
INSERT INTO `site_admin_log` VALUES (1202, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 17:51:47.4960829 +0800 CST m=+9338.087537701, 第 660 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 17:51:47');
INSERT INTO `site_admin_log` VALUES (1203, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 17:51:48.1290148 +0800 CST m=+9338.720469601, 第 661 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 17:51:48');
INSERT INTO `site_admin_log` VALUES (1204, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 18:00:27.6448321 +0800 CST m=+148.953132901, 第 662 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 18:00:28');
INSERT INTO `site_admin_log` VALUES (1205, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:04:39.4142893 +0800 CST m=+33.394215501, 第 417 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:04:39');
INSERT INTO `site_admin_log` VALUES (1206, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:15:06.9302494 +0800 CST m=+3.048924901, 第 418 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:15:07');
INSERT INTO `site_admin_log` VALUES (1207, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:41:15.8442751 +0800 CST m=+14.636107501, 第 419 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:41:16');
INSERT INTO `site_admin_log` VALUES (1208, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:42:09.0831758 +0800 CST m=+7.057858901, 第 420 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:42:09');
INSERT INTO `site_admin_log` VALUES (1209, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:45:39.4520551 +0800 CST m=+2.522846901, 第 421 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:45:39');
INSERT INTO `site_admin_log` VALUES (1210, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 18:50:35.1533389 +0800 CST m=+1.425303801, 第 422 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 18:50:35');
INSERT INTO `site_admin_log` VALUES (1211, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 18:55:33.5733119 +0800 CST m=+203.706318201, 第 663 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 18:55:34');
INSERT INTO `site_admin_log` VALUES (1212, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"配置类型\",\"permission_code\":\"site_configs_type\",\"permission_path\":\"system/configType_list\",\"request_param\":\"GET\",\"sort\":13,\"type\":2,\"status\":1,\"created_at\":\"2020-03-09T18:56:11.5070459+08:00\",\"updated_at\":\"2020-03-09T18:56:11.5070459+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 18:56:12');
INSERT INTO `site_admin_log` VALUES (1213, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:03:15.2098616 +0800 CST m=+2.154187501, 第 423 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:03:15');
INSERT INTO `site_admin_log` VALUES (1214, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:10:00.1546078 +0800 CST m=+3.751887001, 第 424 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:10:00');
INSERT INTO `site_admin_log` VALUES (1215, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:11:18.3336629 +0800 CST m=+3.123344301, 第 425 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:11:18');
INSERT INTO `site_admin_log` VALUES (1216, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:12:51.8806298 +0800 CST m=+3.428660101, 第 426 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:12:52');
INSERT INTO `site_admin_log` VALUES (1217, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:13:47.5959886 +0800 CST m=+2.446560601, 第 427 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:13:48');
INSERT INTO `site_admin_log` VALUES (1218, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-09 19:15:22.0648685 +0800 CST m=+11.143812901, 第 428 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-09 19:15:22');
INSERT INTO `site_admin_log` VALUES (1219, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-09 19:22:36.3486375 +0800 CST m=+155.099264501, 第 664 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-09 19:22:36');
INSERT INTO `site_admin_log` VALUES (1220, 1, 2, 5, '登陆', '管理员: admin1, 在 2020-03-09 19:24:54.8505451 +0800 CST m=+70.868740701, 第 43 次登陆', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 19:24:55');
INSERT INTO `site_admin_log` VALUES (1221, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"添加配置类型\",\"permission_code\":\"site_configs_type\",\"permission_path\":\"system/configType_add\",\"request_param\":\"POST\",\"sort\":14,\"type\":3,\"status\":1,\"created_at\":\"2020-03-09T19:41:31.1849872+08:00\",\"updated_at\":\"2020-03-09T19:41:31.1849872+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 19:41:31');
INSERT INTO `site_admin_log` VALUES (1222, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"编辑配置类型\",\"permission_code\":\"site_configs_type\",\"permission_path\":\"system/configType_edit\",\"request_param\":\"POST\",\"sort\":15,\"type\":3,\"status\":1,\"created_at\":\"2020-03-09T19:41:52.2492176+08:00\",\"updated_at\":\"2020-03-09T19:41:52.2492176+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 19:41:52');
INSERT INTO `site_admin_log` VALUES (1223, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"配置列表\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_list\",\"request_param\":\"GET\",\"sort\":15,\"type\":2,\"status\":1,\"created_at\":\"2020-03-09T19:46:18.9039675+08:00\",\"updated_at\":\"2020-03-09T19:46:18.9039675+08:00\",\"created_ip\":\"10.10.35.146\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 19:46:19');
INSERT INTO `site_admin_log` VALUES (1224, 2, 1, 2, '权限管理', '{\"id\":38,\"parent_id\":2,\"permission_name\":\"配置列表\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":16,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-09T19:46:34.1831364+08:00\"}', 55, 'admin1', 0, '', '10.10.35.146', '2020-03-09 19:46:34');
INSERT INTO `site_admin_log` VALUES (1225, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 10:07:56.8580468 +0800 CST m=+967.849206801, 第 665 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 10:07:57');
INSERT INTO `site_admin_log` VALUES (1226, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 10:33:47.8205325 +0800 CST m=+72.475521101, 第 666 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 10:33:48');
INSERT INTO `site_admin_log` VALUES (1227, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 10:33:50.9054523 +0800 CST m=+75.560440901, 第 667 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 10:33:51');
INSERT INTO `site_admin_log` VALUES (1228, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 10:39:43.761256 +0800 CST m=+10.197936401, 第 668 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 10:39:44');
INSERT INTO `site_admin_log` VALUES (1229, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 11:20:03.3090193 +0800 CST m=+2429.745699701, 第 669 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-10 11:20:03');
INSERT INTO `site_admin_log` VALUES (1230, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 11:28:25.5681149 +0800 CST m=+2932.004795301, 第 670 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 11:28:26');
INSERT INTO `site_admin_log` VALUES (1231, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 11:33:13.5474287 +0800 CST m=+3219.982735701, 第 429 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 11:33:14');
INSERT INTO `site_admin_log` VALUES (1232, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":2,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-10T11:33:42.5563229+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 11:33:43');
INSERT INTO `site_admin_log` VALUES (1233, 1, 1, 2, '角色管理', '{\"id\":23,\"status\":1,\"role_name\":\"测试\",\"remark\":\"\",\"updated_at\":\"2020-03-10T11:33:44.2109592+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 11:33:44');
INSERT INTO `site_admin_log` VALUES (1234, 1, 1, 2, '角色管理', '{\"id\":2,\"status\":1,\"role_name\":\"技术部\",\"remark\":\"go12\",\"updated_at\":\"2020-03-10T11:33:59.3598733+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 11:33:59');
INSERT INTO `site_admin_log` VALUES (1235, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 12:37:15.6318559 +0800 CST m=+3.763387301, 第 430 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 12:37:16');
INSERT INTO `site_admin_log` VALUES (1236, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 12:38:15.4118594 +0800 CST m=+3.827530601, 第 431 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 12:38:15');
INSERT INTO `site_admin_log` VALUES (1237, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 12:39:43.2913274 +0800 CST m=+3.257730901, 第 432 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 12:39:43');
INSERT INTO `site_admin_log` VALUES (1238, 1, 7, 1, '站点配置', '{\"option_name\":\"11\",\"option_code\":\"22\",\"type_id\":2,\"from_id\":0,\"units\":\"6\",\"value_type\":2,\"value\":\"\",\"created_at\":\"2020-03-10T13:20:29.17833+08:00\",\"updated_at\":\"2020-03-10T13:20:29.17833+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:20:29');
INSERT INTO `site_admin_log` VALUES (1239, 1, 7, 1, '站点配置', '{\"option_name\":\"test1\",\"option_code\":\"test1\",\"type_id\":2,\"from_id\":0,\"units\":\"7\",\"value_type\":3,\"value\":\"\",\"created_at\":\"2020-03-10T13:22:53.0064073+08:00\",\"updated_at\":\"2020-03-10T13:22:53.0064073+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:22:53');
INSERT INTO `site_admin_log` VALUES (1240, 1, 7, 1, '站点配置', '{\"option_name\":\"eros01\",\"option_code\":\"eros01\",\"type_id\":2,\"from_id\":0,\"units\":\"\",\"value_type\":0,\"value\":\"\",\"created_at\":\"2020-03-10T13:30:13.0076883+08:00\",\"updated_at\":\"2020-03-10T13:30:13.0076883+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 13:30:13');
INSERT INTO `site_admin_log` VALUES (1241, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 13:32:02.8035757 +0800 CST m=+11.886045101, 第 433 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 13:32:03');
INSERT INTO `site_admin_log` VALUES (1242, 1, 7, 1, '站点配置', '{\"option_name\":\"eros01\",\"option_code\":\"eros01\",\"option_describe\":\"222\",\"type_id\":2,\"from_id\":0,\"units\":\"\",\"value_type\":0,\"value\":\"\",\"created_at\":\"2020-03-10T13:32:10.3007934+08:00\",\"updated_at\":\"2020-03-10T13:32:10.3007934+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 13:32:10');
INSERT INTO `site_admin_log` VALUES (1243, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 13:37:48.3467939 +0800 CST m=+304.266685501, 第 671 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:37:48');
INSERT INTO `site_admin_log` VALUES (1244, 1, 7, 1, '站点配置', '{\"option_name\":\"test2\",\"option_code\":\"test2\",\"option_describe\":\"\",\"type_id\":6,\"from_id\":0,\"units\":\"个\",\"value_type\":1,\"value\":\"8\",\"created_at\":\"2020-03-10T13:38:36.79388+08:00\",\"updated_at\":\"2020-03-10T13:38:36.79388+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:38:37');
INSERT INTO `site_admin_log` VALUES (1245, 1, 7, 1, '站点配置', '{\"option_name\":\"test3\",\"option_code\":\"test3\",\"option_describe\":\"test3\",\"type_id\":6,\"from_id\":0,\"units\":\"个\",\"value_type\":2,\"value\":\"5\",\"created_at\":\"2020-03-10T13:39:41.0715642+08:00\",\"updated_at\":\"2020-03-10T13:39:41.0715642+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:39:41');
INSERT INTO `site_admin_log` VALUES (1246, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 13:58:08.0600362 +0800 CST m=+1523.979927801, 第 672 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 13:58:08');
INSERT INTO `site_admin_log` VALUES (1247, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 14:17:44.0568957 +0800 CST m=+2699.976787301, 第 673 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:17:44');
INSERT INTO `site_admin_log` VALUES (1248, 1, 7, 1, '站点配置', '{\"option_name\":\"test4\",\"option_code\":\"test4\",\"option_describe\":\"test4\",\"type_id\":6,\"from_id\":2,\"units\":\"个\",\"value_type\":1,\"value\":\"1\",\"created_at\":\"2020-03-10T14:19:22.8904848+08:00\",\"updated_at\":\"2020-03-10T14:19:22.8904848+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:19:23');
INSERT INTO `site_admin_log` VALUES (1249, 1, 7, 1, '站点配置', '{\"option_name\":\"eros01\",\"option_code\":\"eros01\",\"option_describe\":\"222\",\"type_id\":2,\"from_id\":0,\"units\":\"\",\"value_type\":0,\"value\":\"\",\"created_at\":\"2020-03-10T14:30:54.4898714+08:00\",\"updated_at\":\"2020-03-10T14:30:54.4898714+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:30:55');
INSERT INTO `site_admin_log` VALUES (1250, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 14:31:44.525419 +0800 CST m=+3593.542686701, 第 434 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:31:45');
INSERT INTO `site_admin_log` VALUES (1251, 1, 7, 1, '站点配置', '{\"option_name\":\"test5\",\"option_code\":\"test5\",\"option_describe\":\"xxx\",\"type_id\":6,\"from_id\":2,\"units\":\"个\",\"value_type\":1,\"value\":\"1\",\"created_at\":\"2020-03-10T14:44:17.2931821+08:00\",\"updated_at\":\"2020-03-10T14:44:17.2931821+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:44:17');
INSERT INTO `site_admin_log` VALUES (1252, 1, 7, 1, '站点配置', '{\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"units\":\"\",\"value_type\":0,\"value\":\"\",\"created_at\":\"2020-03-10T14:46:00.3087803+08:00\",\"updated_at\":\"2020-03-10T14:46:00.3087803+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:46:00');
INSERT INTO `site_admin_log` VALUES (1253, 1, 7, 1, '站点配置', '{\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"units\":\"\",\"value_type\":1,\"value\":\"2\",\"created_at\":\"2020-03-10T14:46:11.2754444+08:00\",\"updated_at\":\"2020-03-10T14:46:11.2754444+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:46:11');
INSERT INTO `site_admin_log` VALUES (1254, 1, 7, 1, '站点配置', '{\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"units\":\"23\",\"value_type\":1,\"value\":\"2\",\"created_at\":\"2020-03-10T14:46:22.3693353+08:00\",\"updated_at\":\"2020-03-10T14:46:22.3693353+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:46:22');
INSERT INTO `site_admin_log` VALUES (1255, 1, 7, 1, '站点配置', '{\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"units\":\"23444\",\"value_type\":1,\"value\":\"2\",\"created_at\":\"2020-03-10T14:46:38.2303532+08:00\",\"updated_at\":\"2020-03-10T14:46:38.2303532+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:46:38');
INSERT INTO `site_admin_log` VALUES (1256, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 14:48:23.9167865 +0800 CST m=+5.201366901, 第 435 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:48:24');
INSERT INTO `site_admin_log` VALUES (1257, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 14:49:06.8144063 +0800 CST m=+2.501259901, 第 436 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:49:07');
INSERT INTO `site_admin_log` VALUES (1258, 1, 7, 2, '站点配置', '{\"id\":11,\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"value_type\":1,\"value\":\"2\",\"units\":\"23444\",\"updated_at\":\"2020-03-10T14:49:14.6399992+08:00\"}', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 14:49:15');
INSERT INTO `site_admin_log` VALUES (1259, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 14:50:01.3650958 +0800 CST m=+11.230472901, 第 674 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:50:01');
INSERT INTO `site_admin_log` VALUES (1260, 1, 7, 2, '站点配置', '{\"id\":12,\"option_name\":\"test5\",\"option_code\":\"test5\",\"option_describe\":\"xxx1\",\"type_id\":6,\"from_id\":6,\"value_type\":1,\"value\":\"1\",\"units\":\"个\",\"updated_at\":\"2020-03-10T14:50:14.5370082+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:50:15');
INSERT INTO `site_admin_log` VALUES (1261, 1, 7, 2, '站点配置', '{\"id\":13,\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"value_type\":1,\"value\":\"1\",\"units\":\"元1\",\"updated_at\":\"2020-03-10T14:54:43.8217934+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:54:44');
INSERT INTO `site_admin_log` VALUES (1262, 1, 7, 2, '站点配置', '{\"id\":12,\"option_name\":\"test5\",\"option_code\":\"test5\",\"option_describe\":\"xxx1\",\"type_id\":6,\"from_id\":2,\"value_type\":1,\"value\":\"1\",\"units\":\"个\",\"updated_at\":\"2020-03-10T14:54:59.2625019+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:54:59');
INSERT INTO `site_admin_log` VALUES (1263, 1, 7, 2, '站点配置', '{\"id\":4,\"option_name\":\"11\",\"option_code\":\"22\",\"option_describe\":\"xx\",\"type_id\":2,\"from_id\":2,\"value_type\":2,\"value\":\"1\",\"units\":\"￥\",\"updated_at\":\"2020-03-10T14:57:26.2723517+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:57:26');
INSERT INTO `site_admin_log` VALUES (1264, 1, 7, 2, '站点配置', '{\"id\":5,\"option_name\":\"test1\",\"option_code\":\"test1\",\"option_describe\":\"xx\",\"type_id\":2,\"from_id\":2,\"value_type\":3,\"value\":\"1\",\"units\":\"$\",\"updated_at\":\"2020-03-10T14:59:31.3392299+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:59:31');
INSERT INTO `site_admin_log` VALUES (1265, 1, 7, 2, '站点配置', '{\"id\":8,\"option_name\":\"test2\",\"option_code\":\"test2\",\"option_describe\":\"xxx\",\"type_id\":6,\"from_id\":6,\"value_type\":1,\"value\":\"8\",\"units\":\"个\",\"updated_at\":\"2020-03-10T14:59:40.0680017+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 14:59:40');
INSERT INTO `site_admin_log` VALUES (1266, 1, 7, 2, '站点配置', '{\"id\":8,\"option_name\":\"test2\",\"option_code\":\"test2\",\"option_describe\":\"xxx\",\"type_id\":6,\"from_id\":2,\"value_type\":1,\"value\":\"8\",\"units\":\"个\",\"updated_at\":\"2020-03-10T15:01:31.597546+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:01:32');
INSERT INTO `site_admin_log` VALUES (1267, 1, 7, 2, '站点配置', '{\"id\":14,\"option_name\":\"111\",\"option_code\":\"222\",\"option_describe\":\"3333\",\"type_id\":1,\"from_id\":1,\"value_type\":1,\"value\":\"2\",\"units\":\"%\",\"updated_at\":\"2020-03-10T15:04:11.2591569+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:04:11');
INSERT INTO `site_admin_log` VALUES (1268, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:24:38.1141625 +0800 CST m=+2087.979539601, 第 675 次登陆', 1, 'admin', 0, '', '10.10.35.250', '2020-03-10 15:24:38');
INSERT INTO `site_admin_log` VALUES (1269, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:38:39.5535361 +0800 CST m=+69.932351801, 第 676 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:38:40');
INSERT INTO `site_admin_log` VALUES (1270, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:38:44.0658028 +0800 CST m=+74.444618501, 第 677 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:38:44');
INSERT INTO `site_admin_log` VALUES (1271, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:45:22.802849 +0800 CST m=+473.181664701, 第 678 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:45:23');
INSERT INTO `site_admin_log` VALUES (1272, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"添加配置\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_add\",\"request_param\":\"POST\",\"sort\":17,\"type\":3,\"status\":1,\"created_at\":\"2020-03-10T15:46:02.5762423+08:00\",\"updated_at\":\"2020-03-10T15:46:02.5762423+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:46:03');
INSERT INTO `site_admin_log` VALUES (1273, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"编辑配置\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_edit\",\"request_param\":\"PUT\",\"sort\":18,\"type\":3,\"status\":1,\"created_at\":\"2020-03-10T15:46:24.3590645+08:00\",\"updated_at\":\"2020-03-10T15:46:24.3590645+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:46:24');
INSERT INTO `site_admin_log` VALUES (1274, 2, 1, 1, '权限管理', '{\"id\":0,\"parent_id\":2,\"joins\":\"1,2\",\"permission_name\":\"配置类型遍历\",\"permission_code\":\"site_type_config\",\"permission_path\":\"system/configType_detail\",\"request_param\":\"GET\",\"sort\":16,\"type\":2,\"status\":2,\"created_at\":\"2020-03-10T15:47:36.2029904+08:00\",\"updated_at\":\"2020-03-10T15:47:36.2029904+08:00\",\"created_ip\":\"10.10.35.146\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:47:36');
INSERT INTO `site_admin_log` VALUES (1275, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:48:06.6722682 +0800 CST m=+637.051083901, 第 679 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:48:07');
INSERT INTO `site_admin_log` VALUES (1276, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 15:48:46.4141195 +0800 CST m=+676.792935201, 第 680 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:48:46');
INSERT INTO `site_admin_log` VALUES (1277, 2, 1, 2, '权限管理', '{\"id\":38,\"parent_id\":2,\"permission_name\":\"配置列表\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_list\",\"request_param\":\"GET\",\"joins\":\"1,2\",\"sort\":17,\"type\":2,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-10T15:49:34.5784206+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:49:35');
INSERT INTO `site_admin_log` VALUES (1278, 2, 1, 2, '权限管理', '{\"id\":39,\"parent_id\":2,\"permission_name\":\"添加配置\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_add\",\"request_param\":\"POST\",\"joins\":\"1,2\",\"sort\":18,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-10T15:50:56.9207918+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:50:57');
INSERT INTO `site_admin_log` VALUES (1279, 2, 1, 2, '权限管理', '{\"id\":40,\"parent_id\":2,\"permission_name\":\"编辑配置\",\"permission_code\":\"site_configs\",\"permission_path\":\"system/config_edit\",\"request_param\":\"PUT\",\"joins\":\"1,2\",\"sort\":19,\"type\":3,\"status\":1,\"remark\":\"\",\"updated_at\":\"2020-03-10T15:51:05.2758271+08:00\"}', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 15:51:05');
INSERT INTO `site_admin_log` VALUES (1280, 1, 2, 5, '登陆', '管理员: test001, 在 2020-03-10 16:06:43.3765936 +0800 CST m=+1753.755409301, 第 437 次登陆', 48, 'test001', 0, '', '10.10.35.250', '2020-03-10 16:06:43');
INSERT INTO `site_admin_log` VALUES (1281, 1, 2, 5, '登陆', '管理员: admin, 在 2020-03-10 16:08:43.8860369 +0800 CST m=+82.682895801, 第 681 次登陆', 1, 'admin', 0, '', '10.10.35.146', '2020-03-10 16:08:44');

-- ----------------------------
-- Table structure for site_bank
-- ----------------------------
DROP TABLE IF EXISTS `site_bank`;
CREATE TABLE `site_bank`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '银行图标',
  `bank_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行代称',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行名称',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '1：启用 2：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内银行表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_bank
-- ----------------------------
INSERT INTO `site_bank` VALUES (1, 'https://apimg.alipay.com/combo.png?d=cashier&t=CMBC', 'CMBC', '中国民生银行', 1);
INSERT INTO `site_bank` VALUES (2, 'https://apimg.alipay.com/combo.png?d=cashier&t=XTB', 'XTB', '邢台银行', 1);
INSERT INTO `site_bank` VALUES (3, 'https://apimg.alipay.com/combo.png?d=cashier&t=COMM', 'COMM', '交通银行', 1);
INSERT INTO `site_bank` VALUES (4, 'https://apimg.alipay.com/combo.png?d=cashier&t=HNRCU', 'HNRCU', '河南省农村信用', 2);
INSERT INTO `site_bank` VALUES (5, 'https://apimg.alipay.com/combo.png?d=cashier&t=FSCB', 'FSCB', '抚顺银行', 1);
INSERT INTO `site_bank` VALUES (6, 'https://apimg.alipay.com/combo.png?d=cashier&t=JSBANK', 'JSBANK', '江苏银行', 1);
INSERT INTO `site_bank` VALUES (7, 'https://apimg.alipay.com/combo.png?d=cashier&t=BSB', 'BSB', '包商银行', 1);
INSERT INTO `site_bank` VALUES (8, 'https://apimg.alipay.com/combo.png?d=cashier&t=XABANK', 'XABANK', '西安银行', 1);
INSERT INTO `site_bank` VALUES (9, 'https://apimg.alipay.com/combo.png?d=cashier&t=SJBANK', 'SJBANK', '盛京银行', 1);
INSERT INTO `site_bank` VALUES (10, 'https://apimg.alipay.com/combo.png?d=cashier&t=CITIC', 'CITIC', '中信银行', 1);
INSERT INTO `site_bank` VALUES (11, 'https://apimg.alipay.com/combo.png?d=cashier&t=HXBANK', 'HXBANK', '华夏银行', 1);
INSERT INTO `site_bank` VALUES (12, 'https://apimg.alipay.com/combo.png?d=cashier&t=HANABANK', 'HANABANK', '韩亚银行', 1);
INSERT INTO `site_bank` VALUES (13, 'https://apimg.alipay.com/combo.png?d=cashier&t=CDCB', 'CDCB', '成都银行', 1);
INSERT INTO `site_bank` VALUES (14, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZGCCB', 'ZGCCB', '自贡市商业银行', 2);
INSERT INTO `site_bank` VALUES (15, 'https://apimg.alipay.com/combo.png?d=cashier&t=XYBANK', 'XYBANK', '信阳银行', 2);
INSERT INTO `site_bank` VALUES (16, 'https://apimg.alipay.com/combo.png?d=cashier&t=BJRCB', 'BJRCB', '北京农村商业银行', 2);
INSERT INTO `site_bank` VALUES (17, 'https://apimg.alipay.com/combo.png?d=cashier&t=ORBANK', 'ORBANK', '鄂尔多斯银行', 2);
INSERT INTO `site_bank` VALUES (18, 'https://apimg.alipay.com/combo.png?d=cashier&t=DYCCB', 'DYCCB', '东营市商业银行', 2);
INSERT INTO `site_bank` VALUES (19, 'https://apimg.alipay.com/combo.png?d=cashier&t=HNRCC', 'HNRCC', '湖南省农村信用社', 2);
INSERT INTO `site_bank` VALUES (20, 'https://apimg.alipay.com/combo.png?d=cashier&t=YQCCB', 'YQCCB', '阳泉银行', 2);
INSERT INTO `site_bank` VALUES (21, 'https://apimg.alipay.com/combo.png?d=cashier&t=CZCB', 'CZCB', '浙江稠州商业银行', 2);
INSERT INTO `site_bank` VALUES (22, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOHAIB', 'BOHAIB', '渤海银行', 1);
INSERT INTO `site_bank` VALUES (23, 'https://apimg.alipay.com/combo.png?d=cashier&t=SCCB', 'SCCB', '三门峡银行', 2);
INSERT INTO `site_bank` VALUES (24, 'https://apimg.alipay.com/combo.png?d=cashier&t=CGNB', 'CGNB', '南充市商业银行', 2);
INSERT INTO `site_bank` VALUES (25, 'https://apimg.alipay.com/combo.png?d=cashier&t=DAQINGB', 'DAQINGB', '龙江银行', 2);
INSERT INTO `site_bank` VALUES (26, 'https://apimg.alipay.com/combo.png?d=cashier&t=CQBANK', 'CQBANK', '重庆银行', 1);
INSERT INTO `site_bank` VALUES (27, 'https://apimg.alipay.com/combo.png?d=cashier&t=GYCB', 'GYCB', '贵阳市商业银行', 2);
INSERT INTO `site_bank` VALUES (28, 'https://apimg.alipay.com/combo.png?d=cashier&t=GZB', 'GZB', '赣州银行', 1);
INSERT INTO `site_bank` VALUES (29, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZJTLCB', 'ZJTLCB', '浙江泰隆商业银行', 2);
INSERT INTO `site_bank` VALUES (30, 'https://apimg.alipay.com/combo.png?d=cashier&t=GDRCC', 'GDRCC', '广东省农村信用社联合社', 2);
INSERT INTO `site_bank` VALUES (31, 'https://apimg.alipay.com/combo.png?d=cashier&t=CSRCB', 'CSRCB', '常熟农村商业银行', 2);
INSERT INTO `site_bank` VALUES (32, 'https://apimg.alipay.com/combo.png?d=cashier&t=SHBANK', 'SHBANK', '上海银行', 1);
INSERT INTO `site_bank` VALUES (33, 'https://apimg.alipay.com/combo.png?d=cashier&t=JSB', 'JSB', '晋商银行', 1);
INSERT INTO `site_bank` VALUES (34, 'https://apimg.alipay.com/combo.png?d=cashier&t=LZYH', 'LZYH', '兰州银行', 1);
INSERT INTO `site_bank` VALUES (35, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZJNX', 'ZJNX', '浙江省农村信用社联合社', 2);
INSERT INTO `site_bank` VALUES (36, 'https://apimg.alipay.com/combo.png?d=cashier&t=FJHXBC', 'FJHXBC', '福建海峡银行', 2);
INSERT INTO `site_bank` VALUES (37, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZRCBANK', 'ZRCBANK', '张家港农村商业银行', 2);
INSERT INTO `site_bank` VALUES (38, 'https://apimg.alipay.com/combo.png?d=cashier&t=BANKWF', 'BANKWF', '潍坊银行', 1);
INSERT INTO `site_bank` VALUES (39, 'https://apimg.alipay.com/combo.png?d=cashier&t=CZRCB', 'CZRCB', '常州农村信用联社', 2);
INSERT INTO `site_bank` VALUES (40, 'https://apimg.alipay.com/combo.png?d=cashier&t=JLBANK', 'JLBANK', '吉林银行', 1);
INSERT INTO `site_bank` VALUES (41, 'https://apimg.alipay.com/combo.png?d=cashier&t=QLBANK', 'QLBANK', '齐鲁银行', 1);
INSERT INTO `site_bank` VALUES (42, 'https://apimg.alipay.com/combo.png?d=cashier&t=HBRCU', 'HBRCU', '河北省农村信用社', 2);
INSERT INTO `site_bank` VALUES (43, 'https://apimg.alipay.com/combo.png?d=cashier&t=CSCB', 'CSCB', '长沙银行', 1);
INSERT INTO `site_bank` VALUES (44, 'https://apimg.alipay.com/combo.png?d=cashier&t=XLBANK', 'XLBANK', '中山小榄村镇银行', 2);
INSERT INTO `site_bank` VALUES (45, 'https://apimg.alipay.com/combo.png?d=cashier&t=URMQCCB', 'URMQCCB', '乌鲁木齐市商业银行', 2);
INSERT INTO `site_bank` VALUES (46, 'https://apimg.alipay.com/combo.png?d=cashier&t=JLRCU', 'JLRCU', '吉林农信', 2);
INSERT INTO `site_bank` VALUES (47, 'https://apimg.alipay.com/combo.png?d=cashier&t=LYCB', 'LYCB', '辽阳市商业银行', 2);
INSERT INTO `site_bank` VALUES (48, 'https://apimg.alipay.com/combo.png?d=cashier&t=GSRCU', 'GSRCU', '甘肃省农村信用', 2);
INSERT INTO `site_bank` VALUES (49, 'https://apimg.alipay.com/combo.png?d=cashier&t=ARCU', 'ARCU', '安徽省农村信用社', 2);
INSERT INTO `site_bank` VALUES (50, 'https://apimg.alipay.com/combo.png?d=cashier&t=BZMD', 'BZMD', '驻马店银行', 1);
INSERT INTO `site_bank` VALUES (51, 'https://apimg.alipay.com/combo.png?d=cashier&t=JHBANK', 'JHBANK', '金华银行', 1);
INSERT INTO `site_bank` VALUES (52, 'https://apimg.alipay.com/combo.png?d=cashier&t=BHB', 'BHB', '河北银行', 1);
INSERT INTO `site_bank` VALUES (53, 'https://apimg.alipay.com/combo.png?d=cashier&t=CBBQS', 'CBBQS', '城市商业银行资金清算中心', 2);
INSERT INTO `site_bank` VALUES (54, 'https://apimg.alipay.com/combo.png?d=cashier&t=WJRCB', 'WJRCB', '吴江农商银行', 2);
INSERT INTO `site_bank` VALUES (55, 'https://apimg.alipay.com/combo.png?d=cashier&t=TCCB', 'TCCB', '天津银行', 1);
INSERT INTO `site_bank` VALUES (56, 'https://apimg.alipay.com/combo.png?d=cashier&t=NCB', 'NCB', '南昌银行', 1);
INSERT INTO `site_bank` VALUES (57, 'https://apimg.alipay.com/combo.png?d=cashier&t=SDRCU', 'SDRCU', '山东农信', 2);
INSERT INTO `site_bank` VALUES (58, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOCD', 'BOCD', '承德银行', 2);
INSERT INTO `site_bank` VALUES (59, 'https://apimg.alipay.com/combo.png?d=cashier&t=LSBC', 'LSBC', '临商银行', 2);
INSERT INTO `site_bank` VALUES (60, 'https://apimg.alipay.com/combo.png?d=cashier&t=NBYZ', 'NBYZ', '鄞州银行', 2);
INSERT INTO `site_bank` VALUES (61, 'https://apimg.alipay.com/combo.png?d=cashier&t=PSBC', 'PSBC', '中国邮政储蓄银行', 1);
INSERT INTO `site_bank` VALUES (62, 'https://apimg.alipay.com/combo.png?d=cashier&t=GXRCU', 'GXRCU', '广西省农村信用', 2);
INSERT INTO `site_bank` VALUES (63, 'https://apimg.alipay.com/combo.png?d=cashier&t=ABC', 'ABC', '中国农业银行', 1);
INSERT INTO `site_bank` VALUES (64, 'https://apimg.alipay.com/combo.png?d=cashier&t=DZBANK', 'DZBANK', '德州银行', 2);
INSERT INTO `site_bank` VALUES (65, 'https://apimg.alipay.com/combo.png?d=cashier&t=SZSBK', 'SZSBK', '石嘴山银行', 2);
INSERT INTO `site_bank` VALUES (66, 'https://apimg.alipay.com/combo.png?d=cashier&t=CRCBANK', 'CRCBANK', '重庆农村商业银行', 2);
INSERT INTO `site_bank` VALUES (67, 'https://apimg.alipay.com/combo.png?d=cashier&t=CIB', 'CIB', '兴业银行', 1);
INSERT INTO `site_bank` VALUES (68, 'https://apimg.alipay.com/combo.png?d=cashier&t=H3CB', 'H3CB', '内蒙古银行', 1);
INSERT INTO `site_bank` VALUES (69, 'https://apimg.alipay.com/combo.png?d=cashier&t=CBKF', 'CBKF', '开封市商业银行', 2);
INSERT INTO `site_bank` VALUES (70, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZBCB', 'ZBCB', '齐商银行', 2);
INSERT INTO `site_bank` VALUES (71, 'https://apimg.alipay.com/combo.png?d=cashier&t=GDB', 'GDB', '广东发展银行', 2);
INSERT INTO `site_bank` VALUES (72, 'https://apimg.alipay.com/combo.png?d=cashier&t=SRBANK', 'SRBANK', '上饶银行', 2);
INSERT INTO `site_bank` VALUES (73, 'https://apimg.alipay.com/combo.png?d=cashier&t=LSCCB', 'LSCCB', '乐山市商业银行', 2);
INSERT INTO `site_bank` VALUES (74, 'https://apimg.alipay.com/combo.png?d=cashier&t=YNRCC', 'YNRCC', '云南省农村信用社', 2);
INSERT INTO `site_bank` VALUES (75, 'https://apimg.alipay.com/combo.png?d=cashier&t=JRCB', 'JRCB', '江苏江阴农村商业银行', 2);
INSERT INTO `site_bank` VALUES (76, 'https://apimg.alipay.com/combo.png?d=cashier&t=XXBANK', 'XXBANK', '新乡银行', 2);
INSERT INTO `site_bank` VALUES (77, 'https://apimg.alipay.com/combo.png?d=cashier&t=NHB', 'NHB', '南海农村信用联社', 2);
INSERT INTO `site_bank` VALUES (78, 'https://apimg.alipay.com/combo.png?d=cashier&t=HZCCB', 'HZCCB', '湖州市商业银行', 2);
INSERT INTO `site_bank` VALUES (79, 'https://apimg.alipay.com/combo.png?d=cashier&t=JZBANK', 'JZBANK', '晋中市商业银行', 2);
INSERT INTO `site_bank` VALUES (80, 'https://apimg.alipay.com/combo.png?d=cashier&t=ICBC', 'ICBC', '中国工商银行', 1);
INSERT INTO `site_bank` VALUES (81, 'https://apimg.alipay.com/combo.png?d=cashier&t=JXRCU', 'JXRCU', '江西省农村信用', 2);
INSERT INTO `site_bank` VALUES (82, 'https://apimg.alipay.com/combo.png?d=cashier&t=LYBANK', 'LYBANK', '洛阳银行', 2);
INSERT INTO `site_bank` VALUES (83, 'https://apimg.alipay.com/combo.png?d=cashier&t=TRCB', 'TRCB', '天津农商银行', 2);
INSERT INTO `site_bank` VALUES (84, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZZBANK', 'ZZBANK', '郑州银行', 2);
INSERT INTO `site_bank` VALUES (85, 'https://apimg.alipay.com/combo.png?d=cashier&t=HZCB', 'HZCB', '杭州银行', 1);
INSERT INTO `site_bank` VALUES (86, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOSZ', 'BOSZ', '苏州银行', 1);
INSERT INTO `site_bank` VALUES (87, 'https://apimg.alipay.com/combo.png?d=cashier&t=GRCB', 'GRCB', '广州农商银行', 2);
INSERT INTO `site_bank` VALUES (88, 'https://apimg.alipay.com/combo.png?d=cashier&t=NYNB', 'NYNB', '广东南粤银行', 2);
INSERT INTO `site_bank` VALUES (89, 'https://apimg.alipay.com/combo.png?d=cashier&t=NXRCU', 'NXRCU', '宁夏黄河农村商业银行', 2);
INSERT INTO `site_bank` VALUES (90, 'https://apimg.alipay.com/combo.png?d=cashier&t=SPDB', 'SPDB', '上海浦东发展银行', 2);
INSERT INTO `site_bank` VALUES (91, 'https://apimg.alipay.com/combo.png?d=cashier&t=HKB', 'HKB', '汉口银行', 2);
INSERT INTO `site_bank` VALUES (92, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOP', 'BOP', '平顶山银行', 2);
INSERT INTO `site_bank` VALUES (93, 'https://apimg.alipay.com/combo.png?d=cashier&t=HSBK', 'HSBK', '衡水银行', 2);
INSERT INTO `site_bank` VALUES (94, 'https://apimg.alipay.com/combo.png?d=cashier&t=HBC', 'HBC', '湖北银行', 1);
INSERT INTO `site_bank` VALUES (95, 'https://apimg.alipay.com/combo.png?d=cashier&t=NJCB', 'NJCB', '南京银行', 1);
INSERT INTO `site_bank` VALUES (96, 'https://apimg.alipay.com/combo.png?d=cashier&t=TCRCB', 'TCRCB', '江苏太仓农村商业银行', 2);
INSERT INTO `site_bank` VALUES (97, 'https://apimg.alipay.com/combo.png?d=cashier&t=CDB', 'CDB', '国家开发银行', 2);
INSERT INTO `site_bank` VALUES (98, 'https://apimg.alipay.com/combo.png?d=cashier&t=EGBANK', 'EGBANK', '恒丰银行', 1);
INSERT INTO `site_bank` VALUES (99, 'https://apimg.alipay.com/combo.png?d=cashier&t=AYCB', 'AYCB', '安阳银行', 2);
INSERT INTO `site_bank` VALUES (100, 'https://apimg.alipay.com/combo.png?d=cashier&t=BODD', 'BODD', '丹东银行', 2);
INSERT INTO `site_bank` VALUES (101, 'https://apimg.alipay.com/combo.png?d=cashier&t=HRXJB', 'HRXJB', '华融湘江银行', 2);
INSERT INTO `site_bank` VALUES (102, 'https://apimg.alipay.com/combo.png?d=cashier&t=JXBANK', 'JXBANK', '嘉兴银行', 2);
INSERT INTO `site_bank` VALUES (103, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOJZ', 'BOJZ', '锦州银行', 2);
INSERT INTO `site_bank` VALUES (104, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZJKCCB', 'ZJKCCB', '张家口市商业银行', 2);
INSERT INTO `site_bank` VALUES (105, 'https://apimg.alipay.com/combo.png?d=cashier&t=GZRCU', 'GZRCU', '贵州省农村信用社', 2);
INSERT INTO `site_bank` VALUES (106, 'https://apimg.alipay.com/combo.png?d=cashier&t=SDEB', 'SDEB', '顺德农商银行', 2);
INSERT INTO `site_bank` VALUES (107, 'https://apimg.alipay.com/combo.png?d=cashier&t=SPABANK', 'SPABANK', '平安银行', 1);
INSERT INTO `site_bank` VALUES (108, 'https://apimg.alipay.com/combo.png?d=cashier&t=KORLABANK', 'KORLABANK', '库尔勒市商业银行', 2);
INSERT INTO `site_bank` VALUES (109, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOZK', 'BOZK', '周口银行', 2);
INSERT INTO `site_bank` VALUES (110, 'https://apimg.alipay.com/combo.png?d=cashier&t=WHCCB', 'WHCCB', '威海市商业银行', 2);
INSERT INTO `site_bank` VALUES (111, 'https://apimg.alipay.com/combo.png?d=cashier&t=BJBANK', 'BJBANK', '北京银行', 1);
INSERT INTO `site_bank` VALUES (112, 'https://apimg.alipay.com/combo.png?d=cashier&t=SHRCB', 'SHRCB', '上海农村商业银行', 2);
INSERT INTO `site_bank` VALUES (113, 'https://apimg.alipay.com/combo.png?d=cashier&t=BGB', 'BGB', '广西北部湾银行', 2);
INSERT INTO `site_bank` VALUES (114, 'https://apimg.alipay.com/combo.png?d=cashier&t=HURCB', 'HURCB', '湖北省农村信用社', 2);
INSERT INTO `site_bank` VALUES (115, 'https://apimg.alipay.com/combo.png?d=cashier&t=WRCB', 'WRCB', '无锡农村商业银行', 2);
INSERT INTO `site_bank` VALUES (116, 'https://apimg.alipay.com/combo.png?d=cashier&t=SXCB', 'SXCB', '绍兴银行', 2);
INSERT INTO `site_bank` VALUES (117, 'https://apimg.alipay.com/combo.png?d=cashier&t=ZYCBANK', 'ZYCBANK', '遵义市商业银行', 2);
INSERT INTO `site_bank` VALUES (118, 'https://apimg.alipay.com/combo.png?d=cashier&t=CCB', 'CCB', '中国建设银行', 1);
INSERT INTO `site_bank` VALUES (119, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOD', 'BOD', '东莞银行', 2);
INSERT INTO `site_bank` VALUES (120, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOC', 'BOC', '中国银行', 1);
INSERT INTO `site_bank` VALUES (121, 'https://apimg.alipay.com/combo.png?d=cashier&t=HDBANK', 'HDBANK', '邯郸银行', 2);
INSERT INTO `site_bank` VALUES (122, 'https://apimg.alipay.com/combo.png?d=cashier&t=CZBANK', 'CZBANK', '浙商银行', 1);
INSERT INTO `site_bank` VALUES (123, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOCY', 'BOCY', '朝阳银行', 2);
INSERT INTO `site_bank` VALUES (124, 'https://apimg.alipay.com/combo.png?d=cashier&t=SRCB', 'SRCB', '深圳农村商业银行', 2);
INSERT INTO `site_bank` VALUES (125, 'https://apimg.alipay.com/combo.png?d=cashier&t=WZCB', 'WZCB', '温州银行', 2);
INSERT INTO `site_bank` VALUES (126, 'https://apimg.alipay.com/combo.png?d=cashier&t=DRCBCL', 'DRCBCL', '东莞农村商业银行', 2);
INSERT INTO `site_bank` VALUES (127, 'https://apimg.alipay.com/combo.png?d=cashier&t=DLB', 'DLB', '大连银行', 2);
INSERT INTO `site_bank` VALUES (128, 'https://apimg.alipay.com/combo.png?d=cashier&t=YXCCB', 'YXCCB', '玉溪市商业银行', 2);
INSERT INTO `site_bank` VALUES (129, 'https://apimg.alipay.com/combo.png?d=cashier&t=KSRB', 'KSRB', '昆山农村商业银行', 2);
INSERT INTO `site_bank` VALUES (130, 'https://apimg.alipay.com/combo.png?d=cashier&t=ASCB', 'ASCB', '鞍山银行', 2);
INSERT INTO `site_bank` VALUES (131, 'https://apimg.alipay.com/combo.png?d=cashier&t=LANGFB', 'LANGFB', '廊坊银行', 2);
INSERT INTO `site_bank` VALUES (132, 'https://apimg.alipay.com/combo.png?d=cashier&t=MTBANK', 'MTBANK', '浙江民泰商业银行', 2);
INSERT INTO `site_bank` VALUES (133, 'https://apimg.alipay.com/combo.png?d=cashier&t=NHQS', 'NHQS', '农信银清算中心', 2);
INSERT INTO `site_bank` VALUES (134, 'https://apimg.alipay.com/combo.png?d=cashier&t=GCB', 'GCB', '广州银行', 1);
INSERT INTO `site_bank` VALUES (135, 'https://apimg.alipay.com/combo.png?d=cashier&t=NBBANK', 'NBBANK', '宁波银行', 1);
INSERT INTO `site_bank` VALUES (136, 'https://apimg.alipay.com/combo.png?d=cashier&t=HBHSBANK', 'HBHSBANK', '湖北银行黄石分行', 2);
INSERT INTO `site_bank` VALUES (137, 'https://apimg.alipay.com/combo.png?d=cashier&t=HKBEA', 'HKBEA', '东亚银行', 1);
INSERT INTO `site_bank` VALUES (138, 'https://apimg.alipay.com/combo.png?d=cashier&t=QDCCB', 'QDCCB', '青岛银行', 1);
INSERT INTO `site_bank` VALUES (139, 'https://apimg.alipay.com/combo.png?d=cashier&t=CDRCB', 'CDRCB', '成都农商银行', 2);
INSERT INTO `site_bank` VALUES (140, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOQH', 'BOQH', '青海银行', 1);
INSERT INTO `site_bank` VALUES (141, 'https://apimg.alipay.com/combo.png?d=cashier&t=GLBANK', 'GLBANK', '桂林银行', 2);
INSERT INTO `site_bank` VALUES (142, 'https://apimg.alipay.com/combo.png?d=cashier&t=SXRCCU', 'SXRCCU', '陕西信合', 2);
INSERT INTO `site_bank` VALUES (143, 'https://apimg.alipay.com/combo.png?d=cashier&t=BOYK', 'BOYK', '营口银行', 2);
INSERT INTO `site_bank` VALUES (144, 'https://apimg.alipay.com/combo.png?d=cashier&t=JJBANK', 'JJBANK', '九江银行', 2);
INSERT INTO `site_bank` VALUES (145, 'https://apimg.alipay.com/combo.png?d=cashier&t=HSBANK', 'HSBANK', '徽商银行', 1);
INSERT INTO `site_bank` VALUES (146, 'https://apimg.alipay.com/combo.png?d=cashier&t=NXBANK', 'NXBANK', '宁夏银行', 1);
INSERT INTO `site_bank` VALUES (147, 'https://apimg.alipay.com/combo.png?d=cashier&t=JSRCU', 'JSRCU', '江苏省农村信用联合社', 2);
INSERT INTO `site_bank` VALUES (148, 'https://apimg.alipay.com/combo.png?d=cashier&t=FDB', 'FDB', '富滇银行', 2);
INSERT INTO `site_bank` VALUES (149, 'https://apimg.alipay.com/combo.png?d=cashier&t=CCQTGB', 'CCQTGB', '重庆三峡银行', 2);
INSERT INTO `site_bank` VALUES (150, 'https://apimg.alipay.com/combo.png?d=cashier&t=YDRCB', 'YDRCB', '尧都农商行', 2);
INSERT INTO `site_bank` VALUES (151, 'https://apimg.alipay.com/combo.png?d=cashier&t=LSBANK', 'LSBANK', '莱商银行', 2);
INSERT INTO `site_bank` VALUES (152, 'https://apimg.alipay.com/combo.png?d=cashier&t=KLB', 'KLB', '昆仑银行', 2);
INSERT INTO `site_bank` VALUES (153, 'https://apimg.alipay.com/combo.png?d=cashier&t=SCRCU', 'SCRCU', '四川省农村信用', 2);
INSERT INTO `site_bank` VALUES (154, 'https://apimg.alipay.com/combo.png?d=cashier&t=YBCCB', 'YBCCB', '宜宾市商业银行', 2);
INSERT INTO `site_bank` VALUES (155, 'https://apimg.alipay.com/combo.png?d=cashier&t=JNBANK', 'JNBANK', '济宁银行', 1);
INSERT INTO `site_bank` VALUES (156, 'https://apimg.alipay.com/combo.png?d=cashier&t=CMB', 'CMB', '招商银行', 1);
INSERT INTO `site_bank` VALUES (157, 'https://apimg.alipay.com/combo.png?d=cashier&t=CEB', 'CEB', '中国光大银行', 1);
INSERT INTO `site_bank` VALUES (158, 'https://apimg.alipay.com/combo.png?d=cashier&t=XCYH', 'XCYH', '许昌银行', 1);
INSERT INTO `site_bank` VALUES (159, 'https://apimg.alipay.com/combo.png?d=cashier&t=TACCB', 'TACCB', '泰安市商业银行', 2);
INSERT INTO `site_bank` VALUES (160, 'https://apimg.alipay.com/combo.png?d=cashier&t=TZCB', 'TZCB', '台州银行', 2);
INSERT INTO `site_bank` VALUES (161, 'https://apimg.alipay.com/combo.png?d=cashier&t=HBYCBANK', 'HBYCBANK', '湖北银行宜昌分行', 2);
INSERT INTO `site_bank` VALUES (162, 'https://apimg.alipay.com/combo.png?d=cashier&t=WHRCB', 'WHRCB', '武汉农村商业银行', 2);
INSERT INTO `site_bank` VALUES (163, 'https://apimg.alipay.com/combo.png?d=cashier&t=FXCB', 'FXCB', '阜新银行', 2);
INSERT INTO `site_bank` VALUES (164, 'https://apimg.alipay.com/combo.png?d=cashier&t=JINCHB', 'JINCHB', '晋城银行JCBANK', 2);
INSERT INTO `site_bank` VALUES (165, 'https://apimg.alipay.com/combo.png?d=cashier&t=DYCB', 'DYCB', '德阳商业银行', 2);
INSERT INTO `site_bank` VALUES (166, 'https://apimg.alipay.com/combo.png?d=cashier&t=HRBANK', 'HRBAN', '哈尔滨银行', 1);

-- ----------------------------
-- Table structure for site_configs
-- ----------------------------
DROP TABLE IF EXISTS `site_configs`;
CREATE TABLE `site_configs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '选项名称',
  `option_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '选项code',
  `option_describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '选项描述',
  `type_id` int(0) NOT NULL DEFAULT 1 COMMENT '配置类型',
  `from_id` int(0) NOT NULL DEFAULT 1 COMMENT '表单类型',
  `bussiness_type_id` int(0) NOT NULL DEFAULT 1 COMMENT '业务类型',
  `units` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '单位',
  `value_type` tinyint(0) NOT NULL DEFAULT 1 COMMENT '值类型; 1: integer 2: string 3:float ',
  `value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_configs
-- ----------------------------
INSERT INTO `site_configs` VALUES (1, '任务最低单价', 'task_money_min', '每条任务量的最低投放单价；如：1元', 1, 1, 1, '元', 1, '1110', '2020-03-09 15:21:38', '2020-03-09 15:21:41');
INSERT INTO `site_configs` VALUES (2, '任务最低份额', 'task_count_min', '每条任务最低投放数量; 如：10个', 1, 1, 1, '份', 1, '112', '2020-03-09 15:24:44', '2020-03-09 15:24:47');
INSERT INTO `site_configs` VALUES (3, '任务抽成比例', 'task_rake_rate', '...', 1, 1, 1, '%', 1, '3', '2020-03-09 15:27:23', '2020-03-09 15:27:25');
INSERT INTO `site_configs` VALUES (4, '11', '22', 'xx', 2, 2, 1, '￥', 2, '1', '2020-03-10 13:20:29', '2020-03-10 14:57:26');
INSERT INTO `site_configs` VALUES (5, 'test1', 'test1', 'xx', 2, 2, 1, '$', 3, '1', '2020-03-10 13:22:53', '2020-03-10 14:59:31');
INSERT INTO `site_configs` VALUES (8, 'test2', 'test2', 'xxx', 6, 2, 1, '个', 1, '8', '2020-03-10 13:38:37', '2020-03-10 15:01:32');
INSERT INTO `site_configs` VALUES (9, 'test3', 'test3', 'test3', 6, 1, 1, '个', 2, '5', '2020-03-10 13:39:41', '2020-03-10 13:39:41');
INSERT INTO `site_configs` VALUES (10, 'test4', 'test4', 'test4', 6, 1, 1, '个', 1, '1', '2020-03-10 14:19:23', '2020-03-10 14:19:23');
INSERT INTO `site_configs` VALUES (11, '111', '222', '3333', 1, 1, 1, '23444', 1, '2', '2020-03-10 14:30:54', '2020-03-10 14:49:15');
INSERT INTO `site_configs` VALUES (12, 'test5', 'test5', 'xxx1', 6, 2, 1, '个', 1, '1', '2020-03-10 14:44:17', '2020-03-10 14:54:59');
INSERT INTO `site_configs` VALUES (13, '111', '222', '3333', 1, 1, 1, '元1', 1, '1', '2020-03-10 14:46:00', '2020-03-10 14:54:44');
INSERT INTO `site_configs` VALUES (14, '111', '222', '3333', 1, 1, 1, '%', 1, '2', '2020-03-10 14:46:11', '2020-03-10 15:04:11');
INSERT INTO `site_configs` VALUES (15, '111', '222', '3333', 1, 1, 1, '23', 1, '2', '2020-03-10 14:46:22', '2020-03-10 14:46:22');
INSERT INTO `site_configs` VALUES (16, '111', '222', '3333', 1, 1, 1, '23444', 1, '2', '2020-03-10 14:46:38', '2020-03-10 14:46:38');

-- ----------------------------
-- Table structure for site_configs_type
-- ----------------------------
DROP TABLE IF EXISTS `site_configs_type`;
CREATE TABLE `site_configs_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '1: 启用 2：禁用',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_configs_type
-- ----------------------------
INSERT INTO `site_configs_type` VALUES (1, '业务配置', 1, '2020-03-09 19:28:21', '2020-03-09 19:28:21');
INSERT INTO `site_configs_type` VALUES (2, 'test', 1, '2020-03-09 19:28:32', '2020-03-09 19:28:32');
INSERT INTO `site_configs_type` VALUES (3, 'test2', 2, '2020-03-09 19:28:58', '2020-03-09 19:28:58');
INSERT INTO `site_configs_type` VALUES (4, 'test2', 2, '2020-03-09 19:29:31', '2020-03-09 19:29:31');
INSERT INTO `site_configs_type` VALUES (5, 'test2', 2, '2020-03-09 19:30:17', '2020-03-09 19:30:17');
INSERT INTO `site_configs_type` VALUES (6, 'EXAM', 1, '2020-03-09 19:31:17', '2020-03-09 19:31:17');
INSERT INTO `site_configs_type` VALUES (7, 'tt', 2, '2020-03-09 19:31:38', '2020-03-09 19:31:38');
INSERT INTO `site_configs_type` VALUES (8, 'tt', 2, '2020-03-09 19:32:36', '2020-03-09 19:32:36');
INSERT INTO `site_configs_type` VALUES (9, 'ttt', 2, '2020-03-09 19:32:24', '2020-03-09 19:32:24');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务标题',
  `describe` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务描述',
  `status` tinyint(1) NOT NULL COMMENT '1:上架 2:下架 3：删除',
  `sort` int(0) UNSIGNED NOT NULL COMMENT '排序',
  `submit_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '提交时限',
  `inspect_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '审核周期',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000000005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1000000001, 'aa', 'bb', 1, 1, '', '', '2020-03-04 10:53:56', '2020-03-06 10:41:38');
INSERT INTO `task` VALUES (1000000002, '111', '111', 1, 1, '', '', '2020-03-05 16:01:31', '2020-03-05 16:01:31');
INSERT INTO `task` VALUES (1000000003, '1', '2', 1, 3, '', '', '2020-03-05 16:16:14', '2020-03-05 16:16:14');
INSERT INTO `task` VALUES (1000000004, '2', '2', 1, 3, '', '', '2020-03-05 16:17:18', '2020-03-05 16:17:18');

-- ----------------------------
-- Table structure for task_publish
-- ----------------------------
DROP TABLE IF EXISTS `task_publish`;
CREATE TABLE `task_publish`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户头像',
  `task_type` tinyint(1) NOT NULL COMMENT '任务类型ID',
  `project` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '项目名称',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务标题',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务描述',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务链接',
  `amount` int(0) NOT NULL COMMENT '任务金额',
  `accept` int(0) NOT NULL COMMENT '做单人数',
  `commit` int(0) NOT NULL COMMENT '待审核人数',
  `success` int(0) NOT NULL COMMENT '已通过人数',
  `count` int(0) NOT NULL COMMENT '任务数量',
  `admin_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '操作人账号',
  `step` json NULL COMMENT '任务步骤',
  `rate` decimal(10, 0) NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:待发布 2:待审核3:已通过 4:已拒绝 5:已结束',
  `refuse_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '拒绝原因',
  `unavailable_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '禁用原因',
  `expire_ts` bigint(0) NOT NULL COMMENT '过期时间',
  `inspect_ts` bigint(0) NOT NULL COMMENT '检查时间',
  `start_ts` bigint(0) NOT NULL COMMENT '任务开始时间',
  `finish_ts` bigint(0) NOT NULL COMMENT '任务结束时间',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task`(`task_type`) USING BTREE,
  INDEX `user`(`user_id`, `status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_publish
-- ----------------------------
INSERT INTO `task_publish` VALUES (100101008, 100101002, '', '', 22, '1234', '1234', '', '1234', 1234, 2, 0, 0, 5, 'admin', '[1, 2, 2, 3, 4, 5, {\"a\": 1}]', 0, 1, '0', '0', 1882289957, 1234, 11129000000, 19691231080001, '2020-02-20 15:12:00', '2020-02-26 14:27:46');

-- ----------------------------
-- Table structure for task_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `task_subscribe`;
CREATE TABLE `task_subscribe`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `task_id` int(0) NOT NULL COMMENT '任务id',
  `task_type` tinyint(1) NOT NULL COMMENT '任务类型',
  `project` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `merchant_id` int(0) NOT NULL COMMENT '卖家ID',
  `merchant_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '卖家账号',
  `merchant_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '卖家头像',
  `user_id` int(0) NOT NULL COMMENT '买家ID',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '买家账号',
  `amount` int(0) NOT NULL DEFAULT 0 COMMENT '任务佣金',
  `step` json NULL COMMENT '任务步骤',
  `result` json NULL COMMENT '任务提交凭证',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期',
  `admin_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人账号',
  `accept_ts` bigint(0) NULL DEFAULT NULL COMMENT '领取时间',
  `commit_ts` bigint(0) NULL DEFAULT NULL COMMENT '提交时间',
  `verify_ts` bigint(0) NULL DEFAULT NULL COMMENT '审核时间',
  `report_ts` bigint(0) NULL DEFAULT NULL COMMENT '复审提交时间',
  `report_reason` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '复审举报理由',
  `reverify_ts` bigint(0) NULL DEFAULT NULL COMMENT '复审时间',
  `reverify_remark` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '复审备注',
  `reverify_account` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '复审处理人 为空则为商家处理',
  `expire_ts` bigint(0) NULL DEFAULT NULL COMMENT '过期时间',
  `inspect_ts` bigint(0) NULL DEFAULT NULL COMMENT '审核周期',
  `auto_complete_ts` bigint(0) NULL DEFAULT NULL COMMENT '自动完成时间',
  `commit_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单提交信息',
  `refuse_msg` json NULL COMMENT '拒绝理由',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单备注',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merchant`(`merchant_id`, `status`) USING BTREE,
  INDEX `user`(`user_id`, `status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务接单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_subscribe
-- ----------------------------
INSERT INTO `task_subscribe` VALUES (100101001, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:12:52', '2020-02-21 15:12:52');
INSERT INTO `task_subscribe` VALUES (100101002, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, '{}', NULL, 1, 'test001', 1582270467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:53', '2020-02-24 19:58:30');
INSERT INTO `task_subscribe` VALUES (100101003, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:56', '2020-02-21 15:13:56');
INSERT INTO `task_subscribe` VALUES (100101004, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:57', '2020-02-21 15:13:57');
INSERT INTO `task_subscribe` VALUES (100101005, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:57', '2020-02-21 15:13:57');
INSERT INTO `task_subscribe` VALUES (100101006, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:57', '2020-02-21 15:13:57');
INSERT INTO `task_subscribe` VALUES (100101007, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:58', '2020-02-21 15:13:58');
INSERT INTO `task_subscribe` VALUES (100101008, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:58', '2020-02-21 15:13:58');
INSERT INTO `task_subscribe` VALUES (100101009, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:58', '2020-02-21 15:13:58');
INSERT INTO `task_subscribe` VALUES (100101010, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:13:58', '2020-02-21 15:13:58');
INSERT INTO `task_subscribe` VALUES (100101011, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:14:45', '2020-02-21 15:14:45');
INSERT INTO `task_subscribe` VALUES (100101012, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270594, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:16:01', '2020-02-21 15:16:01');
INSERT INTO `task_subscribe` VALUES (100101013, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270736, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:18:23', '2020-02-21 15:18:23');
INSERT INTO `task_subscribe` VALUES (100101014, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:18:40', '2020-02-21 15:18:40');
INSERT INTO `task_subscribe` VALUES (100101015, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 1582270791, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:19:17', '2020-02-21 15:19:17');
INSERT INTO `task_subscribe` VALUES (100101016, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 3164559943, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:26:27', '2020-02-21 15:26:27');
INSERT INTO `task_subscribe` VALUES (100101017, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, NULL, NULL, 1, '', 3164559958, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-21 15:26:42', '2020-02-21 15:26:42');
INSERT INTO `task_subscribe` VALUES (100101023, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, '[1, 2, 2, 3, 4, 5, {\"a\": 1}]', NULL, 1, '', 1882289957, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-26 14:27:44', '2020-02-26 14:27:44');
INSERT INTO `task_subscribe` VALUES (100101024, 22, 0, '1234', 100101002, '', '', 100101002, '', 1234, '[1, 2, 2, 3, 4, 5, {\"a\": 1}]', NULL, 1, '', 1882289957, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '2020-02-26 14:27:46', '2020-02-26 14:27:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `withdraw_password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '提现密码',
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '上级id',
  `agent_join` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '代理线',
  `real_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `balance` int(0) NOT NULL COMMENT '发布余额',
  `commission` int(0) NOT NULL COMMENT '佣金',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '头像链接',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  `created_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '注册ip',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime(0) NOT NULL COMMENT '最后登录时间',
  `login_count` int(0) NOT NULL COMMENT '登陆次数',
  `publish_status` int(0) NOT NULL DEFAULT 1 COMMENT '发布任务限制时间  @1：正常; -1：永久; 其他：异常限制 ',
  `subscribe_status` int(0) NOT NULL DEFAULT 1 COMMENT '接受任务限制时间  @1：正常; -1：永久; 其他：异常限制 ',
  `withdraw_status` int(0) NOT NULL DEFAULT 1 COMMENT '提现限制时间       @1：正常;  -1：永久; 其他：异常限制',
  `message_status` int(0) NOT NULL DEFAULT 1 COMMENT '发送消息限制时间   @1：正常; -1：永久; 其他：异常限制 ',
  `login_status` int(0) NOT NULL DEFAULT 1 COMMENT '登陆限制时间  @1：正常; -1：永久；其他：异常限制 ',
  `last_action_status_time` datetime(0) NOT NULL COMMENT '标记状态改动时的生效时间',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  INDEX `parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100101009 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100101001, '', '', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '111', '13294137777', 1724159078, 2, '', '2020-03-03 19:18:00', '2020-03-10 15:17:20', '10.10.35.76', '10.10.35.76', '2020-03-10 15:17:20', 1, 1, 1, 1, 3600, 21600, '2020-03-09 11:13:50', '');
INSERT INTO `user` VALUES (100101002, 'test_name', '2', '2', '', 1, '', '', '13111111111', 422, 0, '5', '2020-02-27 15:11:06', '2020-03-09 15:53:27', '10.10.35.21', '10.10.35.21', '2020-03-05 19:18:32', 1, 1, 1, 1, 1, 1, '2020-03-07 19:32:14', '');
INSERT INTO `user` VALUES (100101003, '', '2', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', '13125153563', 3333, 0, '', '2020-02-27 20:00:30', '2020-02-21 20:01:02', '10.10.35.76', '10.10.35.146', '2020-03-06 10:25:03', 0, 21600, 1, 1, 21600, 3600, '2020-03-09 11:26:10', '');
INSERT INTO `user` VALUES (100101006, '', '2', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', '13294138888', 444, 5555, '', '2020-03-01 11:39:47', '2020-02-25 11:39:47', '10.10.35.76', '10.10.35.76', '2020-03-06 10:25:07', 0, 1, 1, 1, 1, 1, '2020-03-09 13:12:03', '');
INSERT INTO `user` VALUES (100101007, '', '', '0399ab2a0892a7264c13c2be3a50b873', '', 0, '', '', '13091919191', 555, 0, '', '2020-03-02 18:10:17', '2020-02-25 18:10:17', '10.10.35.26', '10.10.35.26', '2020-03-04 10:25:11', 0, 1, 1, 1, 1, 1, '2020-03-07 19:09:30', '');
INSERT INTO `user` VALUES (100101008, '', '', 'd0970714757783e6cf17b26fb8e2298f', '', 0, '', '', '13092929292', 1, 33, '', '2020-03-03 18:49:52', '2020-02-26 18:29:58', '10.10.35.26', '10.10.35.26', '2020-03-04 10:25:16', 0, 1, 1, 1, 1, 1, '2020-03-07 19:09:33', '');

-- ----------------------------
-- Table structure for user_action_status
-- ----------------------------
DROP TABLE IF EXISTS `user_action_status`;
CREATE TABLE `user_action_status`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '会员Id',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `publish_status` bigint(0) NOT NULL DEFAULT 0 COMMENT '发布任务限制时间',
  `subscribe_status` bigint(0) NOT NULL DEFAULT 0 COMMENT '接受任务限制时间',
  `withdraw_status` bigint(0) NOT NULL DEFAULT 0 COMMENT '提现限制时间',
  `message_status` bigint(0) NOT NULL DEFAULT 0 COMMENT '发送消息限制时间',
  `login_status` bigint(0) NOT NULL DEFAULT 0 COMMENT '登陆限制时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `image` json NOT NULL COMMENT '图片凭证',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_action_status
-- ----------------------------
INSERT INTO `user_action_status` VALUES (1, 100101001, '13294137777', 1, 1, 1, 1, 1, '1', '1', '2020-03-07 13:37:20');
INSERT INTO `user_action_status` VALUES (2, 100101001, '13294137777', 1, 1, 1, 1, 1, '1', '1', '2020-03-07 13:44:45');
INSERT INTO `user_action_status` VALUES (3, 100101001, '13294137777', 1, 1, 1, 1, 1, '1', '1', '2020-03-07 13:45:53');
INSERT INTO `user_action_status` VALUES (4, 100101001, '13294137777', 1, 1, 1, 1, 1, '1', '1', '2020-03-07 13:47:04');
INSERT INTO `user_action_status` VALUES (5, 100101001, '13294137777', 1, 1, 1, 1, 1, '1', '1', '2020-03-07 13:48:04');

-- ----------------------------
-- Table structure for user_bank
-- ----------------------------
DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `bank_id` int(0) NULL DEFAULT 0 COMMENT '银行id',
  `bank_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行名',
  `bank_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `real_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '持卡人',
  `bank_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '银行地址',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '1:启用 2：禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100101014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bank
-- ----------------------------
INSERT INTO `user_bank` VALUES (100101002, 100101002, '', NULL, '1', '1', '123', '1', 1, 'remark_user_bank', '2020-02-24 12:59:09', '2020-03-05 19:30:01');
INSERT INTO `user_bank` VALUES (100101013, 100101002, 'test_name', 0, '13241324', '12341234', '1234', '1234124', 2, 'test', '2020-02-29 19:48:46', '2020-03-05 19:30:44');

-- ----------------------------
-- Table structure for user_deposit
-- ----------------------------
DROP TABLE IF EXISTS `user_deposit`;
CREATE TABLE `user_deposit`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话',
  `pay_type` tinyint(1) NULL DEFAULT NULL COMMENT '充值类型 1:支付宝 2:微信 3:银行卡转账 11:系统操作',
  `amount` int(0) NOT NULL DEFAULT 0 COMMENT '交易金额',
  `real_amount` int(0) NOT NULL DEFAULT 0 COMMENT '实际到账金额',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:处理中 2:成功 3:失败 4:待审核',
  `operate` tinyint(0) NOT NULL DEFAULT 0 COMMENT '1:充值 2:人工加款 3:任务结束退款 4:佣金转化',
  `wallet` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:余额 2:佣金',
  `admin_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人账号',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '变动时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100101016 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户存款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_deposit
-- ----------------------------
INSERT INTO `user_deposit` VALUES (100101003, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:39:06', '2020-03-09 14:39:06');
INSERT INTO `user_deposit` VALUES (100101004, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:39:49', '2020-03-09 14:39:49');
INSERT INTO `user_deposit` VALUES (100101005, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:39:55', '2020-03-09 14:39:55');
INSERT INTO `user_deposit` VALUES (100101006, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:41:00', '2020-03-09 14:41:00');
INSERT INTO `user_deposit` VALUES (100101007, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:45:55', '2020-03-09 14:45:55');
INSERT INTO `user_deposit` VALUES (100101008, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:47:48', '2020-03-09 14:47:48');
INSERT INTO `user_deposit` VALUES (100101009, 100101001, '', '13294137777', 0, 20000, 20000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:48:42', '2020-03-09 14:48:42');
INSERT INTO `user_deposit` VALUES (100101010, 100101001, '', '13294137777', 11, 10000, 10000, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:54:25', '2020-03-09 14:54:25');
INSERT INTO `user_deposit` VALUES (100101011, 100101001, '', '13294137777', 11, 10002, 10002, 2, 2, 1, 'test001', '人工加款', '2020-03-09 14:54:41', '2020-03-09 14:54:41');
INSERT INTO `user_deposit` VALUES (100101012, 100101001, '', '13294137777', 11, 10002, 10002, 2, 2, 1, 'test001', '人工加款', '2020-03-09 15:14:57', '2020-03-09 15:14:57');
INSERT INTO `user_deposit` VALUES (100101013, 100101001, '', '13294137777', 11, 1724127968, 1724127968, 2, 2, 1, 'admin', '人工加款', '2020-03-09 15:42:16', '2020-03-09 15:42:16');
INSERT INTO `user_deposit` VALUES (100101014, 100101002, 'test_name', '13111111111', 11, 100, 100, 2, 2, 1, 'admin', '人工加款', '2020-03-09 15:52:44', '2020-03-09 15:52:44');
INSERT INTO `user_deposit` VALUES (100101015, 100101002, 'test_name', '13111111111', 11, 100, 100, 2, 2, 1, 'admin', '人工加款', '2020-03-09 15:53:27', '2020-03-09 15:53:27');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 1:已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user_id`, `status`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES (1, 100101002, '0', '0', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (2, 100101002, '1', '1', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (3, 100101002, '2', '2', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (4, 100101002, '3', '3', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (5, 100101002, '4', '4', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (6, 100101002, '5', '5', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (7, 100101002, '6', '6', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (8, 100101002, '7', '7', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (9, 100101002, '8', '8', '2020-02-25 13:10:26', 0);
INSERT INTO `user_message` VALUES (10, 100101002, '9', '9', '2020-02-25 13:10:26', 0);

-- ----------------------------
-- Table structure for user_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `user_withdraw`;
CREATE TABLE `user_withdraw`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话',
  `amount` int(0) NOT NULL DEFAULT 0 COMMENT '交易金额',
  `real_amount` int(0) NOT NULL DEFAULT 0 COMMENT '实际扣除金额',
  `bank_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户银行卡ID(备用)',
  `bank_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户银行卡名称(备用)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:处理中 2:成功 3:失败',
  `operate` tinyint(0) NOT NULL DEFAULT 0 COMMENT '1:提现 2:人工扣款 3:发布任务 4:佣金转化',
  `wallet` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:余额 2:佣金',
  `admin_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人账号',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '变动时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100101008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户取款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_withdraw
-- ----------------------------
INSERT INTO `user_withdraw` VALUES (100101001, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:39:06', '2020-03-09 14:39:06');
INSERT INTO `user_withdraw` VALUES (100101002, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:39:49', '2020-03-09 14:39:49');
INSERT INTO `user_withdraw` VALUES (100101003, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:39:55', '2020-03-09 14:39:55');
INSERT INTO `user_withdraw` VALUES (100101004, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:41:00', '2020-03-09 14:41:00');
INSERT INTO `user_withdraw` VALUES (100101005, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:45:55', '2020-03-09 14:45:55');
INSERT INTO `user_withdraw` VALUES (100101006, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 14:47:48', '2020-03-09 14:47:48');
INSERT INTO `user_withdraw` VALUES (100101007, 100101001, '', '13294137777', 20000, 20000, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 15:15:15', '2020-03-09 15:15:15');
INSERT INTO `user_withdraw` VALUES (100101008, 100101001, '', '13294137777', 10011, 10011, 0, '', 2, 2, 1, 'test001', '人工扣款', '2020-03-09 15:15:34', '2020-03-09 15:15:34');

SET FOREIGN_KEY_CHECKS = 1;
