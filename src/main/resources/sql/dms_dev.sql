/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : dms_dev

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-12-12 22:29:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cd_category`
-- ----------------------------
DROP TABLE IF EXISTS `cd_category`;
CREATE TABLE `cd_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(30) DEFAULT NULL COMMENT '类别名称',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '上级类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类别表';

-- ----------------------------
-- Records of cd_category
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_company`
-- ----------------------------
DROP TABLE IF EXISTS `cd_company`;
CREATE TABLE `cd_company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY_CODE` varchar(30) DEFAULT NULL COMMENT '单位编号',
  `COMPANY_NAME` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `COMPANY_ADDRESS` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `COMPANY_LEADER` varchar(20) DEFAULT NULL COMMENT '单位联系人',
  `COMPANY_LEADER_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录签约单位、公司';

-- ----------------------------
-- Records of cd_company
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_contract`
-- ----------------------------
DROP TABLE IF EXISTS `cd_contract`;
CREATE TABLE `cd_contract` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CD_MEMBER_ID` int(11) DEFAULT NULL COMMENT '合同价的客户',
  `CD_COMPANY_ID` int(11) DEFAULT NULL COMMENT '合同价的单位',
  `SCOPE` int(1) DEFAULT NULL COMMENT '1-部分产品，2-全部产品',
  `CONTRACT_PRICE` decimal(10,2) DEFAULT NULL COMMENT '仅当适用范围为全部产品时适用',
  `BENGIN_TIME` datetime DEFAULT NULL COMMENT '合同开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '合同结束时间',
  `IS_AUDITOR` int(1) DEFAULT NULL COMMENT '0-未审核，1-审核',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同价格表';

-- ----------------------------
-- Records of cd_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `cd_coupon`;
CREATE TABLE `cd_coupon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUPON_TYPE` int(1) DEFAULT NULL COMMENT '卡或者劵,1-卡，2-劵',
  `COUPON_NUMBER` varchar(50) DEFAULT NULL COMMENT '卡号',
  `COUPON_PASSWORD` varchar(20) DEFAULT NULL COMMENT '密码',
  `BEGIN_TIME` datetime DEFAULT NULL COMMENT '有效开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '有效结束时间',
  `PRICE` decimal(10,2) DEFAULT NULL COMMENT '固定金额',
  `COUNT` int(11) DEFAULT NULL COMMENT '固定次数',
  `IS_USED` int(1) DEFAULT NULL COMMENT '0-未使用，1-已使用',
  `IS_USEFUL` int(1) DEFAULT NULL COMMENT '0-无效，1-有效',
  `IS_FEEDBACK` int(1) DEFAULT NULL COMMENT '0-否，1-是',
  `NOTES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡劵维护表';

-- ----------------------------
-- Records of cd_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_coupon_ref`
-- ----------------------------
DROP TABLE IF EXISTS `cd_coupon_ref`;
CREATE TABLE `cd_coupon_ref` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CD_COUPON_ID` int(11) DEFAULT NULL COMMENT '卡劵',
  `REF_TYPE` varchar(50) DEFAULT NULL COMMENT '拓展类型',
  `REF_NAME` varchar(30) DEFAULT NULL COMMENT '拓展描述',
  `REF_VALUE` varchar(50) DEFAULT NULL COMMENT '拓展值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡劵拓展';

-- ----------------------------
-- Records of cd_coupon_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_item`
-- ----------------------------
DROP TABLE IF EXISTS `cd_item`;
CREATE TABLE `cd_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_CODE` varchar(30) DEFAULT NULL COMMENT '产品编号',
  `CD_CATEGORY_ID` int(11) DEFAULT NULL COMMENT '产品归属的类别',
  `ITEM_NAME` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `ITEM_DESCRIBE` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `ITEM_TYPE` varchar(30) DEFAULT NULL COMMENT '产品类型',
  `YIELDLY` varchar(30) DEFAULT NULL COMMENT '生产地',
  `SPEC` varchar(20) DEFAULT NULL COMMENT '产品规格',
  `BASE_PRICE` decimal(10,2) DEFAULT NULL COMMENT '基础价格',
  `MEMBER_PRICE` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `PRICING_MANNER` varchar(10) DEFAULT NULL COMMENT '计价方式',
  `SELL_STATUS` int(1) DEFAULT NULL COMMENT '0-下架 1-上架',
  `SELL_UNIT` varchar(20) DEFAULT NULL COMMENT '销售单位',
  `SELL_PRICE` decimal(10,2) DEFAULT NULL COMMENT '销售金额',
  `IS_COMBINATION` int(1) DEFAULT NULL COMMENT '0-未组合，1-组合',
  `PARENT_ITEM_ID` int(11) DEFAULT NULL COMMENT '组合产品的父id',
  `IS_AUDIT` int(1) DEFAULT NULL COMMENT '0-未审核，1-审核',
  `CREATE_DATE_TIME` datetime DEFAULT NULL COMMENT '录入时间',
  `CREATE_USER_CODE` varchar(20) DEFAULT NULL COMMENT '录入人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品基础表';

-- ----------------------------
-- Records of cd_item
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_item_contract_item`
-- ----------------------------
DROP TABLE IF EXISTS `cd_item_contract_item`;
CREATE TABLE `cd_item_contract_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CD_CONTRACT_ID` int(11) DEFAULT NULL COMMENT '产品合同',
  `CD_ITEM_ID` int(11) DEFAULT NULL COMMENT '当合同适用范围为1的时候，每种产品要设定对应的合同价',
  `CONTRACT_PRICE` decimal(10,2) DEFAULT NULL COMMENT '合同价格',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品合同明细';

-- ----------------------------
-- Records of cd_item_contract_item
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_item_ref`
-- ----------------------------
DROP TABLE IF EXISTS `cd_item_ref`;
CREATE TABLE `cd_item_ref` (
  `CD_ITEM_REF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REF_TYPE` varchar(50) DEFAULT NULL COMMENT '拓展类型',
  `REF_NAME` varchar(50) DEFAULT NULL COMMENT '拓展描述',
  `REF_VALUE` varchar(50) DEFAULT NULL COMMENT '拓展值',
  `CD_ITEM_ID` int(11) DEFAULT NULL COMMENT '对应产品',
  PRIMARY KEY (`CD_ITEM_REF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品拓展表\r\n如果产品有额外属性可添加在拓展表中';

-- ----------------------------
-- Records of cd_item_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_manager_company`
-- ----------------------------
DROP TABLE IF EXISTS `cd_manager_company`;
CREATE TABLE `cd_manager_company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CD_COMPANY_ID` int(11) DEFAULT NULL COMMENT '单位',
  `CD_MANAGER_ID` int(11) DEFAULT NULL COMMENT '客户经理',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录客户经理和单位关联关系表';

-- ----------------------------
-- Records of cd_manager_company
-- ----------------------------

-- ----------------------------
-- Table structure for `cd_member`
-- ----------------------------
DROP TABLE IF EXISTS `cd_member`;
CREATE TABLE `cd_member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEMBER_CODE` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `PHONE_NUMBER` varchar(20) DEFAULT NULL COMMENT '手机号',
  `SPARE_TEL` varchar(20) DEFAULT NULL COMMENT '备用手机号1',
  `SPARE_TEL2` varchar(20) DEFAULT NULL COMMENT '备用手机号2',
  `TEL_NUMBER` varchar(20) DEFAULT NULL COMMENT '家庭固话',
  `OFFICE_TEL` varchar(20) DEFAULT NULL COMMENT '办公室电话',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `SPARE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '备用地址1',
  `SPARE_ADDRESS2` varchar(255) DEFAULT NULL COMMENT '备用地址2',
  `MEMBER_TYPE` int(1) DEFAULT NULL COMMENT '1-潜在客户，2-普通客户，3-优质客户',
  `CD_COMPANY_ID` int(11) DEFAULT NULL COMMENT '所属单位',
  `CD_USER_ID` int(11) DEFAULT NULL COMMENT '所属客服经理',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户会员表基础表';

-- ----------------------------
-- Records of cd_member
-- ----------------------------

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `JOB_NAME` varchar(50) NOT NULL COMMENT '任务名称',
  `JOB_GROUP` varchar(50) NOT NULL COMMENT '任务属组',
  `JOB_STATUS` tinyint(1) NOT NULL COMMENT '任务状态：0-正常运行中，1-暂停，2-已完成，3-异常，4-阻塞，-1-无',
  `JOB_DESCRIPTION` varchar(200) NOT NULL COMMENT '任务描述',
  `CRON_EXPRESSION` varchar(50) NOT NULL COMMENT 'CRON表达式',
  `TRIGGER_ID` varchar(100) NOT NULL COMMENT '触发器ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', '测试任务2', 'AMS', '1', '仅供测试使用', '*/5 * * * * ?', 'qtz2');
INSERT INTO `schedule_job` VALUES ('4', '测试任务', 'AMS', '1', '仅供测试使用', '*/1 * * * * ?', 'qtz1');

-- ----------------------------
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_CODE` varchar(30) DEFAULT NULL COMMENT '字典编号',
  `DICTIONARY_DESC` varchar(255) DEFAULT NULL COMMENT '字典描述',
  `AVAILABLE` int(1) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dictionary_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_parameter`;
CREATE TABLE `sys_dictionary_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SYS_DICTIONARY_ID` int(11) DEFAULT NULL COMMENT '字典',
  `SHOW_VALUE` varchar(50) DEFAULT NULL COMMENT '显示值',
  `REAL_VALUE` varchar(50) DEFAULT NULL COMMENT '实际值',
  `SORT_VALUE` int(3) DEFAULT NULL COMMENT '排位',
  `AVAILABLE` int(1) DEFAULT NULL COMMENT '0-禁用，1-启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典参数表';

-- ----------------------------
-- Records of sys_dictionary_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `ACTION_NAME` varchar(50) NOT NULL COMMENT '操作名称',
  `ACTION_DATE` datetime NOT NULL COMMENT '操作时间',
  `ACTION_PARAMS` varchar(500) DEFAULT NULL COMMENT '参数',
  `CLIENT_IP` varchar(10) NOT NULL COMMENT '客户端IP',
  `ACTION_RESULT` varchar(500) DEFAULT NULL COMMENT '操作结果',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', '查询数据字典组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('2', '1', '查询数据字典组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('3', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('4', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('5', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('6', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('7', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('8', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('9', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('10', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('11', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('12', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('13', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('14', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('15', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('16', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('17', '1', '新增用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('18', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('19', '1', '新增用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('20', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('21', '1', '新增用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('22', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('23', '1', '查询用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('24', '1', '查询用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('25', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('26', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('27', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('28', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('29', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('30', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('31', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('32', '1', '查询用户组下属用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('33', '1', '查询用户组下属用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('34', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('35', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('36', '1', '查询用户组下属用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('37', '1', '查询用户组下属用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('38', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('39', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('40', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('41', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('42', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('43', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('44', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('45', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('46', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('47', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('48', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('49', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('50', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('51', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('52', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('53', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('54', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('55', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('56', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('57', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('58', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('59', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('60', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('61', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('62', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('63', '1', '查询用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('64', '1', '查询用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('65', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('66', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('67', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('68', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('69', '1', '修改用户组所属权限', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('70', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('71', '1', '新增用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('72', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('73', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('74', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('75', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('76', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('77', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('78', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('79', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('80', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('81', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('82', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('83', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('84', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('85', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('86', '1', '修改用户组下属用户关系', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('87', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('88', '1', '查询订单列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('89', '1', '查询数据字典组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('90', '1', '查询单位公司信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('91', '1', '查询客户信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('92', '1', '查询订单列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('93', '1', '查询用户', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('94', '1', '查询用户组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('95', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('96', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('97', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('98', '1', '新增权限资源', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('99', '1', '查看权限列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('100', '1', '查询订单列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('101', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('102', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('103', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('104', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('105', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('106', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('107', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('108', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('109', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('110', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('111', '1', '删除组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('112', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('113', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('114', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('115', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('116', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('117', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('118', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('119', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('120', '1', '新增组织机构', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('121', '1', '查询组织机构信息', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('122', '1', '查询订单列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('123', '1', '查询数据字典组', '2018-12-10 19:55:14', null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('124', '1', '查询订单列表', '2018-12-10 19:55:14', null, '127.0.0.1', null);

-- ----------------------------
-- Table structure for `sys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL COMMENT '部门名称',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '部门描述',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '上级组织',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('9', 'CEO', 'CEO', null);
INSERT INTO `sys_organization` VALUES ('10', 'CTO', 'CTO', '9');
INSERT INTO `sys_organization` VALUES ('11', 'CFO', 'CFO', '9');
INSERT INTO `sys_organization` VALUES ('12', '研发部', '研发部', '10');

-- ----------------------------
-- Table structure for `sys_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISSION` varchar(50) DEFAULT NULL COMMENT '权限',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `AVAILABLE` int(1) DEFAULT NULL COMMENT '0-禁用，1-启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES ('1', 'USER_VIEW', '用户管理', '0');
INSERT INTO `sys_permissions` VALUES ('2', 'USER_GROUP_VIEW', '用户组管理', '0');
INSERT INTO `sys_permissions` VALUES ('3', 'PERMISSION_VIEW', '权限管理', '0');
INSERT INTO `sys_permissions` VALUES ('4', 'ORGANIZATION_VIEW', '组织管理', '0');
INSERT INTO `sys_permissions` VALUES ('5', 'USER_GROUP_ADD', '添加用户组资源', '0');
INSERT INTO `sys_permissions` VALUES ('6', 'USER_ADD', '添加用户', '0');
INSERT INTO `sys_permissions` VALUES ('7', 'PERMISSION_ADD', '新增权限', '0');

-- ----------------------------
-- Table structure for `sys_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(30) DEFAULT NULL COMMENT '角色',
  `DESCRIPTION` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `AVAILABLE` int(1) DEFAULT NULL COMMENT '0-禁用，1-启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', 'super_admin', '超级管理员', '0');
INSERT INTO `sys_roles` VALUES ('2', 'user', '普通用户', '0');
INSERT INTO `sys_roles` VALUES ('3', 'admin', '管理员', '0');

-- ----------------------------
-- Table structure for `sys_roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色',
  `PERMISSION_ID` int(11) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('1', '1', '1');
INSERT INTO `sys_roles_permissions` VALUES ('2', '1', '1');
INSERT INTO `sys_roles_permissions` VALUES ('3', '1', '3');
INSERT INTO `sys_roles_permissions` VALUES ('4', '1', '4');
INSERT INTO `sys_roles_permissions` VALUES ('5', '1', '2');
INSERT INTO `sys_roles_permissions` VALUES ('6', '1', '2');
INSERT INTO `sys_roles_permissions` VALUES ('7', '1', '2');
INSERT INTO `sys_roles_permissions` VALUES ('8', '1', '5');
INSERT INTO `sys_roles_permissions` VALUES ('9', '1', '6');

-- ----------------------------
-- Table structure for `sys_users`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '登陆用户名',
  `REALNAME` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `SALT` varchar(50) DEFAULT NULL COMMENT '密码盐值',
  `PASSWORD` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `AGE` int(2) DEFAULT NULL COMMENT '年龄',
  `SEX` int(1) DEFAULT NULL COMMENT '1-男，2女',
  `EMAIL` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `QQ` varchar(30) DEFAULT NULL COMMENT 'QQ',
  `PHONE_NUMBER` varchar(20) DEFAULT NULL COMMENT '手机号',
  `OFFICE_TEL` varchar(20) DEFAULT NULL COMMENT '办公室电话',
  `LOCKED` int(1) DEFAULT NULL COMMENT '0-禁用，1-启用',
  `IS_MANAGE` int(1) DEFAULT NULL COMMENT '1-经理',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'tanxinzheng', null, '353e60d4c113df0a7f0a62374489d000', 'a5c87d20433c67bc8a4d96c737e82a85', null, null, null, null, null, null, null, null);
INSERT INTO `sys_users` VALUES ('2', 'taojiaqi', null, '25caae9d49a612dfc51bab13dae0febd', '6fb713a7051f31b782ace3f3dfc1a4e9', null, null, '277303310@xx.com', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `sys_users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色',
  `AVAILABLE` int(1) DEFAULT NULL COMMENT '0-禁用，1-启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES ('1', '1', '1', null);
INSERT INTO `sys_users_roles` VALUES ('4', '2', '1', null);

-- ----------------------------
-- Table structure for `sys_user_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_organization`;
CREATE TABLE `sys_user_organization` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '部门',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门用户关联表';

-- ----------------------------
-- Records of sys_user_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ID` int(11) NOT NULL,
  `ORDER_CODE` varchar(30) DEFAULT NULL,
  `ORDER_TYPE` int(1) DEFAULT NULL COMMENT '1-卡，2-劵，3-常规',
  `COUPON_NUMBER` varchar(50) DEFAULT NULL COMMENT '卡号(订单类型为卡时记录卡号)',
  `COUPON_PASSWORD` varchar(50) DEFAULT NULL COMMENT '卡密码(订单类型为卡时记录密码)',
  `ORDER_SOURCE` int(1) DEFAULT NULL COMMENT '1-微信订单，2-商城订单，3-客服下单，4-采摘订单',
  `PAYMENT_MODE` int(1) DEFAULT NULL COMMENT '1-预付款，2-后付款，3-免费',
  `ORDER_STATUS` varchar(30) DEFAULT NULL COMMENT '订单状态',
  `CONSIGNEE_PHONE` varchar(11) DEFAULT NULL COMMENT '收货人手机',
  `CONSIGNEE_NAME` varchar(30) DEFAULT NULL COMMENT '收货人姓名',
  `CONSIGNEE_ADDRESS` varchar(200) DEFAULT NULL COMMENT '收货人地址',
  `POSTCODE` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `TRANSPORT_MODE` int(1) DEFAULT NULL COMMENT '运送方式 1-快递，2-自提',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '订单备注',
  `TOTAL_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '订单创建时间',
  `CREATE_USER` varchar(30) DEFAULT NULL COMMENT '订单创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `ID` int(11) NOT NULL,
  `TB_ORDER_ID` int(11) DEFAULT NULL COMMENT '订单ID',
  `ORDER_NO` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `ITEM_CODE` varchar(30) DEFAULT NULL COMMENT '商品编码',
  `ITEM_NAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `ITEM_PRICE` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `ITEM_QTY` int(5) DEFAULT NULL COMMENT '商品数量',
  `ITEM_UNIT` varchar(30) DEFAULT NULL COMMENT '商品单位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------

-- ----------------------------
-- Function structure for `query_children_organization`
-- ----------------------------
DROP FUNCTION IF EXISTS `query_children_organization`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `query_children_organization`(organization_id INt(11)) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE s_temp VARCHAR(4000);
	DECLARE s_temp_chd VARCHAR(4000);
	SET s_temp = '$';
	SET s_temp_chd = cast(organization_id as char);
	WHILE s_temp_chd is not NULL DO
	SET s_temp = CONCAT(s_temp,',',s_temp_chd);
	SELECT group_concat(id) INTO s_temp_chd FROM sys_organization where FIND_IN_SET(parent_id,s_temp_chd)>0;
	END WHILE;
	return s_temp;
    END
;;
DELIMITER ;
