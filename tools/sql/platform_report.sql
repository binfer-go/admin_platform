/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 10.10.35.128:3306
 Source Schema         : platform_report

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 10/03/2020 17:28:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for report_bases
-- ----------------------------
DROP TABLE IF EXISTS `report_bases`;
CREATE TABLE `report_bases`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '日期',
  `user_id` int(0) NOT NULL COMMENT '会员id',
  `user_parent_id` int(0) NOT NULL COMMENT '上级Id',
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员电话',
  `user_balance` int(0) NOT NULL DEFAULT 0 COMMENT '发布钱包',
  `user_commission` int(0) NOT NULL DEFAULT 0 COMMENT '佣金钱包',
  `task_publish_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布任务数',
  `task_publish_children_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布子任务数量',
  `task_publish_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '发布任务金额',
  `task_publish_accept_count` int(0) NOT NULL DEFAULT 0 COMMENT '做单人数',
  `task_publish_success_perssion_count` int(0) NOT NULL DEFAULT 0 COMMENT '已成功人数',
  `task_publish_end_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布结束任务数',
  `task_publish_children_end_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布任务子级结束数量',
  `task_publish_success_count` int(0) NULL DEFAULT 0 COMMENT '发布有效任务数',
  `task_publish_children_success_count` int(0) NOT NULL COMMENT '发布有效子级任务量',
  `task_subscribe_count` int(0) NOT NULL DEFAULT 0 COMMENT '订阅任务总量',
  `task_subscribe_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '订阅任务金额',
  `task_subscribe_status_success_count` int(0) NOT NULL DEFAULT 0 COMMENT '成功的任务数',
  `task_subscribe_status_failure_count` int(0) NOT NULL DEFAULT 0 COMMENT '失败的任务数',
  `user_deposit_count` int(0) NOT NULL DEFAULT 0 COMMENT '充值次数',
  `user_deposit_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '充值金额',
  `user_deposit_money_max` int(0) NOT NULL DEFAULT 0 COMMENT '最大充值金额',
  `user_deposit_manual_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '人工存款总额',
  `user_deposit_manual_money_count` int(0) NOT NULL DEFAULT 0 COMMENT '人工存款笔数',
  `user_deposit_manual_money_max` int(0) NOT NULL DEFAULT 0 COMMENT '人工存款最大额度',
  `user_withdraw_count` int(0) NOT NULL COMMENT '取款次数',
  `user_withdraw_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '取款金额',
  `user_withdraw_money_max` int(0) NOT NULL DEFAULT 0 COMMENT '最大取款金额',
  `user_withdraw_manual_money_sum` int(0) NOT NULL DEFAULT 0 COMMENT '人工扣款金额',
  `user_withdraw_manual_money_count` int(0) NOT NULL DEFAULT 0 COMMENT '人工扣款笔数',
  `user_withdraw_manual_money_max` int(0) NOT NULL DEFAULT 0 COMMENT '人工扣款最大额度',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台数据单日累计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_bases
-- ----------------------------
INSERT INTO `report_bases` VALUES (70, '2020-03-05', 100101001, 0, '13294137777', 11111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2492, 1183, 335, 1, 335, 5, 7022, 2643, 5517, 2, 2940, '2020-03-05 11:08:41', '2020-03-05 14:18:24');
INSERT INTO `report_bases` VALUES (71, '2020-03-05', 100101002, 1, '13111111111', 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2492, 1183, 335, 1, 335, 5, 7022, 2643, 5517, 2, 2940, '2020-03-05 11:08:41', '2020-03-05 14:18:24');
INSERT INTO `report_bases` VALUES (72, '2020-03-06', 100101003, 0, '13125153563', 3333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 11788, 11788, 26828, 20, 8844, 12, 19936, 11236, 11788, 9, 14740, '2020-03-06 11:21:54', '2020-03-06 19:16:52');
INSERT INTO `report_bases` VALUES (73, '2020-03-06', 100101006, 0, '13294138888', 444, 5555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 16968, 11304, 1016, 4, 1016, 24, 47396, 10816, 3912, 9, 4895, '2020-03-06 11:21:54', '2020-03-06 19:16:52');
INSERT INTO `report_bases` VALUES (74, '2020-03-09', 100101001, 0, '13294137777', 11111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-03-09 10:54:25', '2020-03-09 12:43:09');

-- ----------------------------
-- Table structure for report_users
-- ----------------------------
DROP TABLE IF EXISTS `report_users`;
CREATE TABLE `report_users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户数据累计表',
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '直属上级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户电话',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_childrer_count` int(0) NOT NULL DEFAULT 0 COMMENT '下级会员个数',
  `task_pub_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布任务数',
  `task_pub_childrer_count` int(0) NOT NULL DEFAULT 0 COMMENT '发布任务量(子任务)',
  `task_pub_end_count` int(0) NOT NULL DEFAULT 0 COMMENT '结束的发布任务数',
  `task_pub_end_childrer_count` int(0) NOT NULL DEFAULT 0 COMMENT '结束的发布任务量',
  `task_pub_wait_count` int(0) NOT NULL DEFAULT 0 COMMENT '进行中的发布任务数',
  `task_pub_wait_childrer_count` int(0) NOT NULL DEFAULT 0 COMMENT '进行中的任务发布量',
  `task_sub_wait_count` int(0) NOT NULL DEFAULT 0 COMMENT '进行中的接单数',
  `task_sub_end_count` int(0) NOT NULL DEFAULT 0 COMMENT '已完成的接单数',
  `comission_task_sum` int(0) NOT NULL DEFAULT 0 COMMENT '佣金(任务佣金)',
  `comission_promotion_sum` int(0) NOT NULL DEFAULT 0 COMMENT '佣金(推广佣金)',
  `withdraw_task_sum` int(0) NOT NULL DEFAULT 0 COMMENT '提现(任务钱包提现)',
  `withdraw_master_sum` int(0) NOT NULL DEFAULT 0 COMMENT '提现(主钱包提现)',
  `deposit_task_sum` int(0) NOT NULL DEFAULT 0 COMMENT '任务钱包收益',
  `deposit_master_sum` int(0) NOT NULL DEFAULT 0 COMMENT '主钱包收益',
  `login_count` int(0) NOT NULL DEFAULT 0 COMMENT '累计登陆次数',
  `created_at` datetime(0) NOT NULL COMMENT '注册时间',
  `updated_at` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户数据累计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_users
-- ----------------------------
INSERT INTO `report_users` VALUES (1, 100101006, 0, '', '', 0, 24, 4, 57, 2, 53, 46, 0, 23, 11, 46, 28, 0, 17, 30, 39, '2020-03-07 16:02:04', '2020-03-07 16:02:04');
INSERT INTO `report_users` VALUES (12, 100101007, 0, '', '', 0, 36, 26, 49, 33, 56, 41, 0, 19, 12, 34, 32, 0, 7, 31, 17, '2020-03-10 14:44:18', '2020-03-10 14:44:18');

SET FOREIGN_KEY_CHECKS = 1;
