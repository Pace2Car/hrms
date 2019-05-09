/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : hrms

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 09/05/2019 17:16:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) NOT NULL COMMENT '员工编号',
  `adjust_Date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '调薪日期',
  `beforeSalary` double(10, 2) NULL DEFAULT 0.00 COMMENT '调前薪资',
  `afterSalary` double(10, 2) NULL DEFAULT 0.00 COMMENT '调后薪资',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '调薪原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`emp_no`) USING BTREE,
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪资调整记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjustsalary
-- ----------------------------
INSERT INTO `adjustsalary` VALUES (1, 2, '2018-12-11 16:51:23', NULL, NULL, '升职加薪', '');
INSERT INTO `adjustsalary` VALUES (2, 2, '2018-12-11 16:52:00', NULL, NULL, '升职加薪', '');
INSERT INTO `adjustsalary` VALUES (3, 2, '2018-12-11 16:52:00', NULL, NULL, '升职加薪', '');
INSERT INTO `adjustsalary` VALUES (4, 2, '2018-12-11 16:54:25', NULL, 1111.00, '补充薪水', '');
INSERT INTO `adjustsalary` VALUES (5, 3, '2018-12-11 16:57:41', NULL, 312312.00, '312342', '');
INSERT INTO `adjustsalary` VALUES (6, 4, '2018-12-11 17:04:32', 0.00, 1.00, '强东入职', '');
INSERT INTO `adjustsalary` VALUES (7, 8, '2018-12-11 17:05:52', 0.00, 213123.00, '123123', '');
INSERT INTO `adjustsalary` VALUES (8, 9, '2018-12-11 17:08:36', 0.00, 123123.00, '12414', '');
INSERT INTO `adjustsalary` VALUES (9, 10, '2018-12-11 17:28:01', 0.00, 12555.00, '测试', '测试');
INSERT INTO `adjustsalary` VALUES (10, 1, '2018-12-11 18:49:28', 520.00, 5000.00, '', '');

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) NOT NULL,
  `app_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考评日期',
  `app_status` int(1) NULL DEFAULT 1 COMMENT '考评是否通过 1：合格，0：不合格',
  `app_result` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '考评等级',
  `app_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '考评内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`emp_no`) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '绩效考核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appraise
-- ----------------------------
INSERT INTO `appraise` VALUES (1, 1, '2018-12-17 16:04:23', 1, 'A', '管理AAABBBCC', '表现极好');
INSERT INTO `appraise` VALUES (2, 2, '2018-12-17 16:24:58', 1, 'B', '销售能力', '无');
INSERT INTO `appraise` VALUES (3, 3, '2018-12-17 16:26:38', 0, 'C', '不知道', '反正不合格');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) NOT NULL COMMENT '员工编号',
  `effect_date` date NOT NULL COMMENT '生效日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束考勤日期',
  `late_times` int(2) NULL DEFAULT 0 COMMENT '迟到次数',
  `leave_early_times` int(2) NULL DEFAULT 0 COMMENT '早退次数',
  `completion_times` int(2) NULL DEFAULT 0 COMMENT '旷工次数',
  `leave_times` int(2) NULL DEFAULT 0 COMMENT '请假天数',
  `overtime_hours` int(3) NULL DEFAULT 0 COMMENT '加班小时数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attendance_pk_empno`(`emp_no`) USING BTREE,
  CONSTRAINT `attendance_pk_empno` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 1, '2018-12-01', '2018-12-28', 1, 3, 1, 2, 10);

-- ----------------------------
-- Table structure for bonus_mulct_record
-- ----------------------------
DROP TABLE IF EXISTS `bonus_mulct_record`;
CREATE TABLE `bonus_mulct_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` int(11) NOT NULL COMMENT '员工编号',
  `bm_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '奖罚日期',
  `bm_amount` double(10, 2) NULL DEFAULT 0.00 COMMENT '奖罚金额',
  `bm_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '奖罚原因',
  `bm_type` int(11) NULL DEFAULT 1 COMMENT '奖罚类别，1：奖，0：罚',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`emp_no`) USING BTREE,
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '奖罚记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bonus_mulct_record
-- ----------------------------
INSERT INTO `bonus_mulct_record` VALUES (1, 1, '2018-12-11 18:45:55', 50.00, '迟到', 0, '');
INSERT INTO `bonus_mulct_record` VALUES (2, 1, '2018-12-11 18:47:18', 100.00, '捡的', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (3, 1, '2018-12-11 18:49:11', 20.00, '.。。', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (4, 1, '2018-12-11 18:50:36', 50.00, '。。', 0, '');
INSERT INTO `bonus_mulct_record` VALUES (5, 1, '2018-12-11 18:54:37', 50.00, '111', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (6, 1, '2018-12-11 18:55:07', 50.00, '222', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (7, 1, '2018-12-11 18:55:41', 50.00, '333', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (8, 1, '2018-12-11 18:58:54', 50.00, '444', 0, '');
INSERT INTO `bonus_mulct_record` VALUES (9, 1, '2018-12-11 19:00:22', 50.00, '555', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (10, 1, '2018-12-11 19:02:04', 50.00, '666', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (11, 1, '2018-12-11 19:03:07', 50.00, '777', 1, '');
INSERT INTO `bonus_mulct_record` VALUES (12, 1, '2018-12-11 19:03:16', 250.00, '888', 0, '');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `contract_no` int(16) NOT NULL COMMENT '合同编号',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_time` date NOT NULL COMMENT '生效时间',
  `stop_time` date NULL DEFAULT NULL COMMENT '终止时间',
  `contract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '合同类型',
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用人单位',
  `person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '劳动方',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1：有效，0：失效',
  PRIMARY KEY (`contract_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dept_no` int(4) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dept_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_no` int(4) NULL DEFAULT NULL COMMENT '上级部门',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1：启用，0：废除',
  PRIMARY KEY (`dept_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (10, 'Development', 22, 1);
INSERT INTO `department` VALUES (11, 'Sales', NULL, 1);
INSERT INTO `department` VALUES (13, 'Finance', NULL, 1);
INSERT INTO `department` VALUES (15, 'Personnel', NULL, 1);
INSERT INTO `department` VALUES (18, 'Administration', NULL, 1);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_no` int(6) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `emp_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `dept_no` int(10) NOT NULL COMMENT '部门编号',
  `base_salary` double(10, 2) NULL DEFAULT 0.00 COMMENT '基本工资',
  `bonus` double(10, 2) NULL DEFAULT 0.00 COMMENT '奖金',
  `mulct` double(10, 2) NULL DEFAULT 0.00 COMMENT '罚金',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `ethnic` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '民族',
  `telephone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `education` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `position_id` int(11) NULL DEFAULT NULL COMMENT '职位ID',
  `entry_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `departure_time` datetime(0) NULL DEFAULT NULL COMMENT '离职时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '在职状态 1：在职，0：离职',
  `contract_no` int(16) NULL DEFAULT NULL COMMENT '合同',
  PRIMARY KEY (`emp_no`) USING BTREE,
  INDEX `contract_no`(`contract_no`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `dept_no`(`dept_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'chenjiahao', 18, 7000.00, 800.00, 50.00, '男', '2018-01-01', '汉', '15528172715', 'pace2car.com', '四川省成都市新都区大丰镇大天路100号', '本科', 1, '2018-12-10 17:54:46', '2018-12-10 18:22:48', 1, NULL);
INSERT INTO `employee` VALUES (2, 'sale man', 11, 2000.00, 0.00, 0.00, '男', NULL, '汉', NULL, NULL, NULL, NULL, 51, '2018-12-10 17:14:42', NULL, 1, NULL);
INSERT INTO `employee` VALUES (3, 'finance man', 13, 12500.00, 0.00, 0.00, '男', NULL, '汉', NULL, NULL, NULL, NULL, 52, '2018-12-10 17:15:24', NULL, 1, NULL);
INSERT INTO `employee` VALUES (4, '陈家豪', 18, 3000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 2, '2018-12-10 17:15:30', NULL, 1, NULL);
INSERT INTO `employee` VALUES (5, '开发仔', 10, 36000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 50, '2018-12-10 17:48:53', '2018-12-10 00:00:00', 1, NULL);
INSERT INTO `employee` VALUES (6, '何某', 18, 18000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 49, '2018-12-10 17:15:50', '2018-12-10 18:02:55', 1, NULL);
INSERT INTO `employee` VALUES (7, '卢某', 15, 10000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 48, '2018-12-10 17:15:50', '2018-12-10 18:22:48', 1, NULL);
INSERT INTO `employee` VALUES (8, '阚某', 18, 2341.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 47, '2018-12-10 17:15:50', NULL, 1, NULL);
INSERT INTO `employee` VALUES (9, '谢某', 18, 30000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 46, '2018-12-10 17:15:50', '2018-12-12 19:14:32', 1, NULL);
INSERT INTO `employee` VALUES (10, '李某', 18, 4450.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 48, '2018-12-10 17:15:50', NULL, 1, NULL);
INSERT INTO `employee` VALUES (11, '人事经理', 18, 27000.00, 0.00, 0.00, '男', NULL, '汉', '', '', '', '', 48, '2018-12-10 17:15:50', NULL, 1, NULL);
INSERT INTO `employee` VALUES (12, '普通员工', 10, 0.00, 0.00, 0.00, '', NULL, '', '', '', NULL, NULL, 50, '2019-05-09 10:44:56', NULL, 1, NULL);

-- ----------------------------
-- Table structure for interview
-- ----------------------------
DROP TABLE IF EXISTS `interview`;
CREATE TABLE `interview`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone_no` bigint(11) NULL DEFAULT NULL COMMENT '联系电话',
  `appointment_time` date NULL DEFAULT NULL COMMENT '预约时间',
  `status` int(1) NULL DEFAULT 0 COMMENT '预约状态 1：已预约，0：未预约',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interview
-- ----------------------------
INSERT INTO `interview` VALUES (1, 'aaa', 12345678910, '2018-12-29', 1);
INSERT INTO `interview` VALUES (2, 'bbb', 12345678910, '2018-12-05', 1);
INSERT INTO `interview` VALUES (3, 'aaa', 12345678910, '2018-12-29', 1);
INSERT INTO `interview` VALUES (4, 'ddd', 12345678910, NULL, 0);
INSERT INTO `interview` VALUES (5, 'aaa', 12345678910, '2018-12-25', 1);
INSERT INTO `interview` VALUES (6, 'bbb', 12345678910, NULL, 0);
INSERT INTO `interview` VALUES (7, 'aaaee', 12345678910, '2018-12-12', 1);
INSERT INTO `interview` VALUES (8, 'aaa', 12345678910, '2018-12-12', 1);
INSERT INTO `interview` VALUES (9, 'ddd', 12345678910, NULL, 0);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '可用资源',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资源描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '*:*', '超级权限');
INSERT INTO `permission` VALUES (2, 'employee:select', '查询员工');
INSERT INTO `permission` VALUES (3, 'user:select', '查询用户');
INSERT INTO `permission` VALUES (4, 'appraise:select', '查询考核');
INSERT INTO `permission` VALUES (5, 'appraise:insert', '新增考核');
INSERT INTO `permission` VALUES (6, 'appraise:update', '更新考核');
INSERT INTO `permission` VALUES (7, 'attendance:select', '查询考勤');
INSERT INTO `permission` VALUES (8, 'department:update', '更新部门');
INSERT INTO `permission` VALUES (9, 'department:select', '查询部门');
INSERT INTO `permission` VALUES (11, 'department:delete', '删除部门');
INSERT INTO `permission` VALUES (12, 'department:insert', '新增部门');
INSERT INTO `permission` VALUES (14, 'employee:delete', '删除员工');
INSERT INTO `permission` VALUES (15, 'employee:insert', '新增员工');
INSERT INTO `permission` VALUES (17, 'position:insert', '新增职位');
INSERT INTO `permission` VALUES (18, 'position:delete', '删除职位');
INSERT INTO `permission` VALUES (19, 'position:update', '更新职位');
INSERT INTO `permission` VALUES (20, 'position:select', '查询职位');
INSERT INTO `permission` VALUES (21, 'recruitInfo:update', '更新招聘');
INSERT INTO `permission` VALUES (22, 'interview:select', '查询面试');
INSERT INTO `permission` VALUES (23, 'recruitInfo:select', '查询招聘');
INSERT INTO `permission` VALUES (25, 'interview:update', '更新面试');
INSERT INTO `permission` VALUES (26, 'recruitInfo:insert', '新增招聘');
INSERT INTO `permission` VALUES (28, 'resume:select', '查询简历');
INSERT INTO `permission` VALUES (29, 'resume:update', '更新简历');
INSERT INTO `permission` VALUES (31, 'employee:update', '更新员工');
INSERT INTO `permission` VALUES (32, 'permission:insert', '刷新权限');
INSERT INTO `permission` VALUES (34, 'train:select', '查询培训');
INSERT INTO `permission` VALUES (35, 'train:insert', '新增培训');
INSERT INTO `permission` VALUES (36, 'train:update', '更新培训');
INSERT INTO `permission` VALUES (37, 'role:select', '查询角色');
INSERT INTO `permission` VALUES (38, 'user:insert', '新增用户');
INSERT INTO `permission` VALUES (39, 'role:update', '更新用户');
INSERT INTO `permission` VALUES (40, 'role:insert', '新增用户');
INSERT INTO `permission` VALUES (41, 'permission:select', '查询权限');
INSERT INTO `permission` VALUES (42, 'user:update', '更新用户');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '职位',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1：可用，0：不可用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`pos_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '总裁', '2018-12-07 17:04:04', 1);
INSERT INTO `position` VALUES (2, '副总裁', '2018-12-10 13:59:09', 1);
INSERT INTO `position` VALUES (44, '总经理', '2019-05-09 16:40:18', 1);
INSERT INTO `position` VALUES (45, '副总经理', '2019-05-09 16:40:24', 1);
INSERT INTO `position` VALUES (46, '部门经理', '2019-05-09 16:41:10', 1);
INSERT INTO `position` VALUES (47, '人事经理', '2019-05-09 16:41:17', 1);
INSERT INTO `position` VALUES (48, '研发工程师', '2019-05-09 16:41:29', 1);
INSERT INTO `position` VALUES (49, '测试工程师', '2019-05-09 16:41:35', 1);
INSERT INTO `position` VALUES (50, '运维工程师', '2019-05-09 16:41:43', 1);
INSERT INTO `position` VALUES (51, '销售', '2019-05-09 16:41:53', 1);
INSERT INTO `position` VALUES (52, '后勤', '2019-05-09 16:42:11', 1);

-- ----------------------------
-- Table structure for recruit_info
-- ----------------------------
DROP TABLE IF EXISTS `recruit_info`;
CREATE TABLE `recruit_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `work_place` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作地点',
  `min_salary` int(10) NULL DEFAULT 0 COMMENT '薪资下限',
  `max_salary` int(10) NULL DEFAULT 0 COMMENT '薪资上限',
  `experience` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作经验',
  `education` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学历',
  `number_of_recruit` int(4) NULL DEFAULT 0 COMMENT '招聘人数',
  `position_id` int(11) NOT NULL COMMENT '职位编号',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `status` int(1) NULL DEFAULT 1 COMMENT '招聘状态 1：在招，0：停止招聘',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recruit_fk_position_id`(`position_id`) USING BTREE,
  CONSTRAINT `recruit_fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '招聘信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruit_info
-- ----------------------------
INSERT INTO `recruit_info` VALUES (1, 'Java实习生', '成都', 1, 2, '10年以上', '研究生及以上', 1, 1, '干活', 1);
INSERT INTO `recruit_info` VALUES (2, '111', '123', 3, 4, '10年以上', '研究生及以上', 333, 1, '55555555555', 1);
INSERT INTO `recruit_info` VALUES (3, '111', '123', 4, 5, '10年以上', '研究生及以上', 333, 1, '55555555555', 1);
INSERT INTO `recruit_info` VALUES (4, '111', '123', 12, 24, '10年以上', '研究生及以上', 333, 1, '55555555555', 0);
INSERT INTO `recruit_info` VALUES (5, '22', '222', 0, 0, '10年以上', '研究生及以上', 0, 1, '', 0);
INSERT INTO `recruit_info` VALUES (6, '555', '北京', 50, 60, '5-10年', '研究生及以上', 1, 2, '联系：12312412\r\n要求：有经验\r\n', 0);
INSERT INTO `recruit_info` VALUES (7, '123', '2131', 12, 25, '10年以上', '研究生及以上', 134, 1, '1324234', 1);
INSERT INTO `recruit_info` VALUES (8, '123', '123', 13, 25, '10年以上', '研究生及以上', 33, 1, '1313254', 1);
INSERT INTO `recruit_info` VALUES (9, '扫地僧', '成都', 1, 2, '不限', '不限', 2, 2, '性别限女\r\n', 1);
INSERT INTO `recruit_info` VALUES (12, '开发', '成都', 12, 20, '3-5年', '本科', 5, 1, '开发\r\n', 1);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `age` int(2) NULL DEFAULT NULL COMMENT '年龄',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '性别',
  `graduated_school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '毕业院校',
  `major` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '专业',
  `education` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学历',
  `experience` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作经验',
  `recruit_id` int(6) NULL DEFAULT NULL COMMENT '应聘哪条招聘信息',
  `position_id` int(6) NULL DEFAULT NULL COMMENT '职位ID',
  `phone_no` bigint(11) NULL DEFAULT NULL COMMENT '联系电话',
  `result` int(1) NULL DEFAULT 0 COMMENT '处理结果 0：未处理，1：通过，2：未通过',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态 1：已处理，0：未处理',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_fk_recruit_id`(`recruit_id`) USING BTREE,
  CONSTRAINT `resume_fk_recruit_id` FOREIGN KEY (`recruit_id`) REFERENCES `recruit_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, 'aaa', 25, '男', '大大大学', '计算机', '本科', '3年', 4, 1, 12345678910, 1, 1);
INSERT INTO `resume` VALUES (2, 'bbb', 25, '男', '大大大学', '计算机', '本科', '3年', 4, 1, 12345678910, 1, 0);
INSERT INTO `resume` VALUES (3, 'ccc', 25, '男', '大大大学', '计算机', '本科', '3年', 2, 1, 12345678910, 2, 0);
INSERT INTO `resume` VALUES (4, 'ddd', 25, '男', '大大大学', '计算机', '本科', '3年', 4, 1, 12345678910, 1, 1);
INSERT INTO `resume` VALUES (5, 'aaaee', 25, '男', '大大大学', '计算机', '本科', '3年', 8, 1, 12345678910, 1, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  `short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简写',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin');
INSERT INTO `role` VALUES (2, '人事经理', 'hr');
INSERT INTO `role` VALUES (5, '部门经理', 'mgr');
INSERT INTO `role` VALUES (6, '普通员工', 'normal');
INSERT INTO `role` VALUES (12, '测试', 'test');
INSERT INTO `role` VALUES (13, '测试无权限', 'testno');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `rid` int(6) NULL DEFAULT NULL COMMENT '角色ID',
  `pid` int(6) NULL DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (31, 1, 1);
INSERT INTO `role_permission` VALUES (38, 2, 5);
INSERT INTO `role_permission` VALUES (39, 2, 4);
INSERT INTO `role_permission` VALUES (40, 2, 6);
INSERT INTO `role_permission` VALUES (41, 2, 7);
INSERT INTO `role_permission` VALUES (42, 2, 8);
INSERT INTO `role_permission` VALUES (43, 2, 14);
INSERT INTO `role_permission` VALUES (44, 2, 15);
INSERT INTO `role_permission` VALUES (45, 2, 2);
INSERT INTO `role_permission` VALUES (46, 2, 31);
INSERT INTO `role_permission` VALUES (47, 2, 22);
INSERT INTO `role_permission` VALUES (48, 2, 25);
INSERT INTO `role_permission` VALUES (49, 2, 26);
INSERT INTO `role_permission` VALUES (50, 2, 23);
INSERT INTO `role_permission` VALUES (51, 2, 21);
INSERT INTO `role_permission` VALUES (52, 2, 28);
INSERT INTO `role_permission` VALUES (53, 2, 29);
INSERT INTO `role_permission` VALUES (54, 2, 35);
INSERT INTO `role_permission` VALUES (55, 2, 34);
INSERT INTO `role_permission` VALUES (56, 2, 36);
INSERT INTO `role_permission` VALUES (57, 5, 12);
INSERT INTO `role_permission` VALUES (58, 5, 9);
INSERT INTO `role_permission` VALUES (59, 5, 8);
INSERT INTO `role_permission` VALUES (60, 5, 2);
INSERT INTO `role_permission` VALUES (61, 5, 18);
INSERT INTO `role_permission` VALUES (62, 5, 17);
INSERT INTO `role_permission` VALUES (63, 5, 20);
INSERT INTO `role_permission` VALUES (64, 5, 19);
INSERT INTO `role_permission` VALUES (65, 5, 35);
INSERT INTO `role_permission` VALUES (66, 6, 3);
INSERT INTO `role_permission` VALUES (67, 12, 1);

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `start_time` date NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '结束时间',
  `train_type` int(1) NULL DEFAULT 1 COMMENT '培训类型 1：公司培训，2：部门培训，3：个人培训',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `budget` double(10, 2) NULL DEFAULT 0.00 COMMENT '预算',
  `status` int(1) NULL DEFAULT 0 COMMENT '审批状态 0：待处理，1：通过，2：驳回，3：重新申请',
  `emp_no` int(6) NULL DEFAULT NULL COMMENT '员工编号（个人培训）',
  `dept_no` int(6) NULL DEFAULT NULL COMMENT '部门编号（部门培训）',
  `refuse_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '回绝理由',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_fk_emp_no`(`emp_no`) USING BTREE,
  INDEX `train_fk_dept_no`(`dept_no`) USING BTREE,
  CONSTRAINT `train_fk_dept_no` FOREIGN KEY (`dept_no`) REFERENCES `department` (`dept_no`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `train_fk_emp_no` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, '主题', '2018-12-15', '2018-12-19', 1, '111', 1.00, 0, NULL, 10, '预算过高');
INSERT INTO `train` VALUES (2, '公司全体培训', '2018-12-28', '2018-12-30', 1, '全体培训', 5000.00, 2, NULL, NULL, '预算');
INSERT INTO `train` VALUES (3, '个人培训', '2019-01-05', '2019-01-08', 3, '个人培训', 1000.00, 1, 1, 18, '');
INSERT INTO `train` VALUES (4, '部门培训', '2018-12-12', '2018-12-16', 2, '部门培训', 3000.00, 0, NULL, 11, '');
INSERT INTO `train` VALUES (5, 'ccc', '2018-12-21', '2018-12-31', 3, '1231212342134\r\nasdsadasd', 50000.00, 0, 1, NULL, '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `emp_no` int(16) NOT NULL COMMENT '员工编号',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '用户状态  1：有效，0：禁止登录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE COMMENT '唯一',
  INDEX `empno`(`emp_no`) USING BTREE,
  CONSTRAINT `empno` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 1, '2018-12-06 11:57:06', '2019-05-09 17:11:50', 1);
INSERT INTO `user` VALUES (2, 'chenjiahao', '3abed0045f0ac324369d1add434df047', 4, '2018-12-19 17:03:48', '2019-02-21 10:53:08', 1);
INSERT INTO `user` VALUES (5, 'testMD5', '5e11bc1c1437a52fcfdefabad5828ac3', 3, '2018-12-20 12:58:52', '2018-12-20 18:25:53', 1);
INSERT INTO `user` VALUES (6, 'dept', 'f51775f5ed43dc50a7488567bb234541', 5, '2018-12-20 13:50:51', '2019-02-21 10:55:39', 1);
INSERT INTO `user` VALUES (7, 'normal', 'f2a56261d9575fc80605f347e77384c3', 12, '2019-05-09 11:38:57', '2019-05-09 11:39:23', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `uid` int(6) NULL DEFAULT NULL COMMENT '用户ID',
  `rid` int(6) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);
INSERT INTO `user_role` VALUES (3, 4, 2);
INSERT INTO `user_role` VALUES (4, 5, 1);
INSERT INTO `user_role` VALUES (5, 6, 5);
INSERT INTO `user_role` VALUES (6, 7, 13);

SET FOREIGN_KEY_CHECKS = 1;
