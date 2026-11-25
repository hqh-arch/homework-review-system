/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.30 : Database - hello2026
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
drop database if exists hello2026;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hello2026` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hello2026`;

/*Table structure for table `QRTZ_BLOB_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

/*Data for the table `QRTZ_BLOB_TRIGGERS` */

/*Table structure for table `QRTZ_CALENDARS` */

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

/*Data for the table `QRTZ_CALENDARS` */

/*Table structure for table `QRTZ_CRON_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

/*Data for the table `QRTZ_CRON_TRIGGERS` */

/*Table structure for table `QRTZ_FIRED_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

/*Data for the table `QRTZ_FIRED_TRIGGERS` */

/*Table structure for table `QRTZ_JOB_DETAILS` */

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

/*Data for the table `QRTZ_JOB_DETAILS` */

/*Table structure for table `QRTZ_LOCKS` */

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

/*Data for the table `QRTZ_LOCKS` */

/*Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS` */

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

/*Data for the table `QRTZ_PAUSED_TRIGGER_GRPS` */

/*Table structure for table `QRTZ_SCHEDULER_STATE` */

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

/*Data for the table `QRTZ_SCHEDULER_STATE` */

/*Table structure for table `QRTZ_SIMPLE_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

/*Data for the table `QRTZ_SIMPLE_TRIGGERS` */

/*Table structure for table `QRTZ_SIMPROP_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

/*Data for the table `QRTZ_SIMPROP_TRIGGERS` */

/*Table structure for table `QRTZ_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

/*Data for the table `QRTZ_TRIGGERS` */

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

/*Data for the table `gen_table` */


/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */


/*Table structure for table `hello_area` */

DROP TABLE IF EXISTS `hello_area`;

CREATE TABLE `hello_area` (
  `id` varchar(100) NOT NULL COMMENT 'ID',
  `pid` varchar(100) DEFAULT '0' COMMENT '上级ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `fullname` varchar(100) DEFAULT NULL COMMENT '名称',
  `code` varchar(200) DEFAULT NULL COMMENT '编码',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区信息';

/*Data for the table `hello_area` */


/*Table structure for table `hello_banji` */

DROP TABLE IF EXISTS `hello_banji`;

CREATE TABLE `hello_banji` (
  `id` varchar(100) NOT NULL COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `code` varchar(200) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级信息';

/*Data for the table `hello_banji` */


/*Table structure for table `hello_cus` */

DROP TABLE IF EXISTS `hello_cus`;

CREATE TABLE `hello_cus` (
  `id` varchar(100) NOT NULL COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `code` varchar(200) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息';

/*Data for the table `hello_cus` */


/*Table structure for table `hello_person` */

DROP TABLE IF EXISTS `hello_person`;

CREATE TABLE `hello_person` (
  `id` varchar(100) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='person管理';

/*Data for the table `hello_person` */


/*Table structure for table `hello_stu` */

DROP TABLE IF EXISTS `hello_stu`;

CREATE TABLE `hello_stu` (
  `id` varchar(100) NOT NULL COMMENT 'ID',
  `code` varchar(100) DEFAULT NULL COMMENT '学号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sex` varchar(100) DEFAULT '0' COMMENT '性别',
  `areaid` varchar(100) DEFAULT NULL COMMENT '地区ID',
  `banjiid` varchar(100) DEFAULT NULL COMMENT '班级ID',
  `img` varchar(500) DEFAULT NULL COMMENT '头像',
  `attaches` varchar(500) DEFAULT NULL COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息';

/*Data for the table `hello_stu` */


/*Table structure for table `hello_stu_area` */

DROP TABLE IF EXISTS `hello_stu_area`;

CREATE TABLE `hello_stu_area` (
  `stuid` varchar(100) NOT NULL COMMENT '学生ID',
  `areaid` varchar(100) NOT NULL COMMENT '地区ID',
  PRIMARY KEY (`stuid`,`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生打卡地信息';

/*Data for the table `hello_stu_area` */


/*Table structure for table `hello_stu_cus` */

DROP TABLE IF EXISTS `hello_stu_cus`;

CREATE TABLE `hello_stu_cus` (
  `stuid` varchar(100) NOT NULL COMMENT '人员ID',
  `cusid` varchar(100) NOT NULL COMMENT '课程ID',
  `score` int(11) DEFAULT '0' COMMENT '分数',
  PRIMARY KEY (`stuid`,`cusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生选课信息';

/*Data for the table `hello_stu_cus` */


/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2026-03-12 16:08:57','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2026-03-12 16:08:57','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2026-03-12 16:08:57','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2026-03-12 16:08:57','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2026-03-12 16:08:57','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2026-03-12 16:08:57','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2026-03-12 16:08:57','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2026-03-12 16:08:57','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */


/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','primary','Y','0','admin','2026-03-12 16:08:57','admin','2026-03-15 17:53:44','性别男'),(2,2,'女','1','sys_user_sex','','success','N','0','admin','2026-03-12 16:08:57','admin','2026-03-15 17:53:53','性别女'),(3,3,'未知','2','sys_user_sex','','danger','N','0','admin','2026-03-12 16:08:57','admin','2026-03-15 17:53:59','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2026-03-12 16:08:57','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2026-03-12 16:08:57','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2026-03-12 16:08:57','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2026-03-12 16:08:57','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2026-03-12 16:08:57','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2026-03-12 16:08:57','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2026-03-12 16:08:57','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2026-03-12 16:08:57','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2026-03-12 16:08:57','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2026-03-12 16:08:57','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2026-03-12 16:08:57','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2026-03-12 16:08:57','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2026-03-12 16:08:57','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2026-03-12 16:08:57','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2026-03-12 16:08:57','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2026-03-12 16:08:57','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2026-03-12 16:08:57','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2026-03-12 16:08:57','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2026-03-12 16:08:56','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2026-03-12 16:08:56','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2026-03-12 16:08:56','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2026-03-12 16:08:57','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2026-03-12 16:08:57','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2026-03-12 16:08:57','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2026-03-12 16:08:57','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2026-03-12 16:08:57','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2026-03-12 16:08:57','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2026-03-12 16:08:57','',NULL,'登录状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */


/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */


/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT 'guide' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2033 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2026-03-12 16:08:54','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2026-03-12 16:08:54','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2026-03-12 16:08:54','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2026-03-12 16:08:54','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2026-03-12 16:08:54','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2026-03-12 16:08:54','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2026-03-12 16:08:54','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2026-03-12 16:08:55','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2026-03-12 16:08:55','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2026-03-12 16:08:55','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2026-03-12 16:08:55','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2026-03-12 16:08:55','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2026-03-12 16:08:55','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2026-03-12 16:08:55','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2026-03-12 16:08:55','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2026-03-12 16:08:55','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2026-03-12 16:08:55','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2026-03-12 16:08:55','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2026-03-12 16:08:55','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2026-03-12 16:08:55','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2026-03-12 16:08:55','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2026-03-12 16:08:55','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2026-03-12 16:08:55','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2026-03-12 16:08:55','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2026-03-12 16:08:55','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2026-03-12 16:08:55','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2026-03-12 16:08:55','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2026-03-12 16:08:55','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2026-03-12 16:08:55','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2026-03-12 16:08:55','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2026-03-12 16:08:55','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2026-03-12 16:08:55','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2026-03-12 16:08:55','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2026-03-12 16:08:55','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2026-03-12 16:08:55','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2026-03-12 16:08:55','',NULL,''),(2000,'HelloWorld',0,0,'hello',NULL,'','',1,0,'M','0','0','','list','admin','2026-03-12 16:08:55','admin','2026-03-16 17:26:20','Hello模块目录'),(2001,'person',2000,0,'person','hello/person/index',NULL,'人员信息',1,0,'C','0','0','hello:person:list','guide','admin','2026-03-12 16:08:55','admin','2026-03-15 07:15:26','person管理菜单'),(2002,'person管理查询',2001,1,'#','',NULL,'',1,0,'F','0','0','hello:person:query','#','admin','2026-03-12 16:08:55','',NULL,''),(2003,'person管理新增',2001,2,'#','',NULL,'',1,0,'F','0','0','hello:person:add','#','admin','2026-03-12 16:08:55','',NULL,''),(2004,'person管理修改',2001,3,'#','',NULL,'',1,0,'F','0','0','hello:person:edit','#','admin','2026-03-12 16:08:55','',NULL,''),(2005,'person管理删除',2001,4,'#','',NULL,'',1,0,'F','0','0','hello:person:remove','#','admin','2026-03-12 16:08:55','',NULL,''),(2006,'person管理导出',2001,5,'#','',NULL,'',1,0,'F','0','0','hello:person:export','#','admin','2026-03-12 16:08:55','',NULL,''),(2007,'地区信息',2000,1,'area','hello/area/index',NULL,'',1,0,'C','0','0','hello:area:list','guide','admin','2026-03-12 16:27:16','admin','2026-03-15 07:15:29','地区信息菜单'),(2008,'查询',2007,1,'#','',NULL,'',1,0,'F','0','0','hello:area:query','#','admin','2026-03-12 16:27:17','admin','2026-03-15 16:17:11',''),(2009,'新增',2007,2,'#','',NULL,'',1,0,'F','0','0','hello:area:add','#','admin','2026-03-12 16:27:17','admin','2026-03-15 16:17:11',''),(2010,'修改',2007,3,'#','',NULL,'',1,0,'F','0','0','hello:area:edit','#','admin','2026-03-12 16:27:17','admin','2026-03-15 16:37:19',''),(2011,'删除',2007,4,'#','',NULL,'',1,0,'F','0','0','hello:area:remove','#','admin','2026-03-12 16:27:17','admin','2026-03-15 16:17:13',''),(2012,'导出',2007,5,'#','',NULL,'',1,0,'F','0','0','hello:area:export','#','admin','2026-03-12 16:27:17','admin','2026-03-15 16:17:17',''),(2013,'班级信息',2000,2,'banji','hello/banji/index',NULL,'',1,0,'C','0','0','hello:banji:list','guide','admin','2026-03-12 17:36:56','admin','2026-03-15 07:15:31','班级信息菜单'),(2014,'班级信息查询',2013,1,'#','',NULL,'',1,0,'F','0','0','hello:banji:query','#','admin','2026-03-12 17:36:56','',NULL,''),(2015,'班级信息新增',2013,2,'#','',NULL,'',1,0,'F','0','0','hello:banji:add','#','admin','2026-03-12 17:36:56','',NULL,''),(2016,'班级信息修改',2013,3,'#','',NULL,'',1,0,'F','0','0','hello:banji:edit','#','admin','2026-03-12 17:36:56','',NULL,''),(2017,'班级信息删除',2013,4,'#','',NULL,'',1,0,'F','0','0','hello:banji:remove','#','admin','2026-03-12 17:36:56','',NULL,''),(2018,'班级信息导出',2013,5,'#','',NULL,'',1,0,'F','0','0','hello:banji:export','#','admin','2026-03-12 17:36:56','',NULL,''),(2019,'学生信息',2000,4,'stu','hello/stu/index',NULL,'',1,0,'C','0','0','hello:stu:list','guide','admin','2026-03-12 18:00:08','admin','2026-03-15 07:15:37','学生信息菜单'),(2020,'学生信息查询',2019,1,'#','',NULL,'',1,0,'F','0','0','hello:stu:query','#','admin','2026-03-12 18:00:08','',NULL,''),(2021,'学生信息新增',2019,2,'#','',NULL,'',1,0,'F','0','0','hello:stu:add','#','admin','2026-03-12 18:00:08','',NULL,''),(2022,'学生信息修改',2019,3,'#','',NULL,'',1,0,'F','0','0','hello:stu:edit','#','admin','2026-03-12 18:00:08','',NULL,''),(2023,'学生信息删除',2019,4,'#','',NULL,'',1,0,'F','0','0','hello:stu:remove','#','admin','2026-03-12 18:00:08','',NULL,''),(2024,'学生信息导出',2019,5,'#','',NULL,'',1,0,'F','0','0','hello:stu:export','#','admin','2026-03-12 18:00:08','',NULL,''),(2025,'课程信息',2000,3,'cus','hello/cus/index',NULL,'',1,0,'C','0','0','hello:cus:list','guide','admin','2026-03-13 04:01:05','admin','2026-03-15 07:16:08','课程信息菜单'),(2026,'课程信息查询',2025,1,'#','',NULL,'',1,0,'F','0','0','hello:cus:query','#','admin','2026-03-13 04:01:05','',NULL,''),(2027,'课程信息新增',2025,2,'#','',NULL,'',1,0,'F','0','0','hello:cus:add','#','admin','2026-03-13 04:01:06','',NULL,''),(2028,'课程信息修改',2025,3,'#','',NULL,'',1,0,'F','0','0','hello:cus:edit','#','admin','2026-03-13 04:01:06','',NULL,''),(2029,'课程信息删除',2025,4,'#','',NULL,'',1,0,'F','0','0','hello:cus:remove','#','admin','2026-03-13 04:01:06','',NULL,''),(2030,'课程信息导出',2025,5,'#','',NULL,'',1,0,'F','0','0','hello:cus:export','#','admin','2026-03-13 04:01:06','',NULL,''),(2031,'查看目录',2000,10000,'view',NULL,NULL,'',1,0,'M','1','0',NULL,'bug','admin','2026-03-16 17:26:49','',NULL,''),(2032,'学生',2031,100,'stu','hello/stu/view',NULL,'学生',1,0,'C','0','0',NULL,'bug','admin','2026-03-16 17:27:31','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_notice` */


/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */
 uncategorized SQLException; SQL state [HY000]; error code [1288]; The target table v_hello_stu of the UPDATE is not updatable; nested exception is java.sql.SQLException: The target table v_hello_stu of the UPDATE is not updatable','2026-03-12 18:17:18',130),(119,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaid\":\"8\",\"areaname\":\"四川/成都/郫都区\",\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:18:08',11),(120,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"2\",\"areaname\":\"广东\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:34:40',12),(121,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaid\":\"8\",\"areaname\":\"四川/乐山/峨眉\",\"banjiid\":\"1\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:35:17',11),(122,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"2\",\"areaname\":\"广东\",\"banjiid\":\"1\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:35:24',11),(123,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:36:02',7),(124,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaid\":\"3\",\"areaname\":\"四川/成都/郫都区\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:46:09',41),(125,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:46:50',44),(126,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:56:01',64),(127,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaid\":\"3\",\"areaname\":\"河南\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:56:10',39),(128,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaid\":\"3\",\"areaname\":\"四川/成都/郫都区\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-12 18:56:16',36),(129,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"3\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:19:28',29),(130,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:19:34',36),(131,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:19:40',30),(132,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:20:25',28),(133,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/成都/金牛区\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:21:27',47),(134,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:22:05',23),(135,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"河南\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:22:34',33),(136,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:22:48',23),(137,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川/乐山\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:32:44',47),(138,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaid\":\"9\",\"areaname\":\"四川\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:32:58',43),(139,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Hello\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"hello\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:34:07',76),(140,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/area/index\",\"createTime\":\"2026-03-12 16:27:16\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"地区信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"area\",\"perms\":\"hello:area:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:34:29',33),(141,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/banji/index\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"banji\",\"perms\":\"hello:banji:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:34:41',24),(142,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/stu/index\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"stu\",\"perms\":\"hello:stu:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:34:48',27),(143,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Hello\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"hello\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:35:21',34),(144,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:36:23',36),(145,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Hello\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"hello\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 03:36:42',34),(146,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/hello-api/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"cus\",\"className\":\"Cus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":7,\"columnName\":\"id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-12 17:32:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-12 17:33:22\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":8,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-12 17:32:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-12 17:33:22\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"编码\",\"columnId\":9,\"columnName\":\"code\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-12 17:32:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-12 17:33:22\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"bobydog\",\"functionName\":\"课程信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"hello\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.hello\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"课程信息\",\"tableId\":2,\"tab','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:00:12',210),(147,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/hello-api/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"hello_cus\"}',NULL,0,NULL,'2026-03-13 04:00:18',414),(148,'课程信息',2,'com.ruoyi.api.hello.CusController.update()','PUT',1,'admin','研发部门','/hello-api/hello/cus','127.0.0.1','内网IP','{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:20:07',32),(149,'课程信息',1,'com.ruoyi.api.hello.CusController.add()','POST',1,'admin','研发部门','/hello-api/hello/cus','127.0.0.1','内网IP','{\"code\":\"asdfasf \",\"id\":\"9583F260FB8148AB9CCCC23E521098A6\",\"name\":\"基本达到成人教育毕业要求a\",\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:21:32',28),(150,'课程信息',3,'com.ruoyi.api.hello.CusController.remove()','DELETE',1,'admin','研发部门','/hello-api/hello/cus/9583F260FB8148AB9CCCC23E521098A6','127.0.0.1','内网IP','[\"9583F260FB8148AB9CCCC23E521098A6\"] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:21:39',13),(151,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"5\",\"7\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:46:13',76),(152,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"1\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:46:24',28),(153,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"1\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:47:14',27),(154,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"1\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:48:16',26),(155,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"4\",\"5\",\"1\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:48:32',39),(156,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"4\",\"5\",\"1\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:50:25',281),(157,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"6\",\"7\"],\"areaNames\":[\"广东\"],\"areaid\":\"9\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:52:58',52),(158,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"6\",\"7\",\"2\"],\"areaNames\":[\"四川/成都/金牛区\",\"四川/成都/郫都区\"],\"areaid\":\"4\",\"areaname\":\"广东\",\"areas\":[{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:58:45',24),(159,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[],\"areaNames\":[\"四川/成都/郫都区\",\"四川/乐山/峨眉\",\"四川/乐山/夹江\"],\"areaid\":\"8\",\"areaname\":\"四川/乐山/峨眉\",\"areas\":[{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4},{\"children\":[],\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"params\":{},\"pid\":\"5\",\"sort\":6},{\"children\":[],\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"params\":{},\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 04:58:53',26),(160,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"6\",\"7\"],\"areaid\":\"4\",\"areaname\":\"四川/成都\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:18:58',260),(161,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"6\",\"7\"],\"areaid\":\"4\",\"areaname\":\"四川/成都\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:19:06',22),(162,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"6\",\"7\"],\"areaid\":\"4\",\"areaname\":\"四川/成都\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:21:11',50),(163,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"6\",\"7\"],\"areaid\":\"4\",\"areaname\":\"四川/成都\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"cusIds\":[],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:21:16',40),(164,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[],\"areaid\":\"8\",\"areaname\":\"四川/乐山/峨眉\",\"areas\":[],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:21:22',20),(165,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"1\"],\"areaid\":\"8\",\"areaname\":\"四川\",\"areas\":[],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}}],\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:21:29',40),(166,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"2\",\"6\",\"7\",\"4\"],\"areaid\":\"9\",\"areaname\":\"四川/成都\",\"areas\":[{\"children\":[],\"code\":\"02\",\"fullname\":\"广东\",\"id\":\"2\",\"name\":\"广东\",\"params\":{},\"pid\":\"0\",\"sort\":8},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250002\",\"cusIds\":[\"3\"],\"cuses\":[],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 05:24:19',29),(167,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 06:02:18',41),(168,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 06:07:50',31),(169,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"name\":\"李四\",\"params\":{},\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-13 06:15:39',34),(170,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/13/0_1696676665226_20260313060159A008.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:22',40),(171,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4},{\"children\":[],\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"params\":{},\"pid\":\"5\",\"sort\":6},{\"children\":[],\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"params\":{},\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:23',52),(172,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"1\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"children\":[],\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"params\":{},\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"asdfaaaaa\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:27',23),(173,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"1\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"children\":[],\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"params\":{},\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"asdfaaaaa\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:29',22),(174,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4},{\"children\":[],\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"params\":{},\"pid\":\"5\",\"sort\":6},{\"children\":[],\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"params\":{},\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:31',24),(175,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/13/0_1696676665226_20260313060159A008.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:32',27),(176,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"children\":[],\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"params\":{},\"pid\":\"1\",\"sort\":2},{\"children\":[],\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"params\":{},\"pid\":\"4\",\"sort\":3},{\"children\":[],\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"params\":{},\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/13/0_1696676665226_20260313060159A008.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:34',27),(177,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"children\":[],\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"params\":{},\"pid\":\"4\",\"sort\":4},{\"children\":[],\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"params\":{},\"pid\":\"5\",\"sort\":6},{\"children\":[],\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"params\":{},\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:35',27),(178,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"1\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"children\":[],\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"params\":{},\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"asdfaaaaaddd\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-14 09:29:39',20),(179,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"children\":[],\"code\":\"0201\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"params\":{},\"pid\":\"2\",\"sort\":1} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 06:53:28',55),(180,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"children\":[],\"code\":\"0202\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"params\":{},\"pid\":\"2\",\"sort\":2} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 06:53:46',17),(181,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"children\":[],\"code\":\"0301\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"params\":{},\"pid\":\"3\",\"sort\":1} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 06:54:21',28),(182,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"children\":[],\"code\":\"0302\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"params\":{},\"pid\":\"3\",\"sort\":2} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 06:54:47',20),(183,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"地区信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"地区信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"地区信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"地区信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"地区信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/area/index\",\"createTime\":\"2026-03-12 16:27:16\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"地区信息\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"area\",\"perms\":\"hello:area:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:22',46),(184,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"person管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"person管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"person管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"person管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"person管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:26',36),(185,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"地区信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"地区信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"地区信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"地区信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"地区信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/area/index\",\"createTime\":\"2026-03-12 16:27:16\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"地区信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"area\",\"perms\":\"hello:area:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:29',27),(186,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"班级信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"hello:banji:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"班级信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"hello:banji:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"班级信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"hello:banji:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"班级信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"hello:banji:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"班级信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"hello:banji:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/banji/index\",\"createTime\":\"2026-03-12 17:36:56\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"banji\",\"perms\":\"hello:banji:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:31',30),(187,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"课程信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"课程信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"课程信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"课程信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"课程信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/cus/index\",\"createTime\":\"2026-03-13 04:01:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"cus\",\"perms\":\"hello:cus:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:35',24),(188,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"学生信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"#\",\"perms\":\"hello:stu:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"学生信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"path\":\"#\",\"perms\":\"hello:stu:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"学生信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2019,\"path\":\"#\",\"perms\":\"hello:stu:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"学生信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2019,\"path\":\"#\",\"perms\":\"hello:stu:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"学生信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2019,\"path\":\"#\",\"perms\":\"hello:stu:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/stu/index\",\"createTime\":\"2026-03-12 18:00:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"学生信息\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"stu\",\"perms\":\"hello:stu:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:37',62),(189,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/cus/index\",\"createTime\":\"2026-03-13 04:01:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"cus\",\"perms\":\"hello:cus:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:15:57',33),(190,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"课程信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"课程信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"课程信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"课程信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-13 04:01:06\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"课程信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2025,\"path\":\"#\",\"perms\":\"hello:cus:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/cus/index\",\"createTime\":\"2026-03-13 04:01:05\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"cus\",\"perms\":\"hello:cus:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 07:16:08',24),(191,'地区信息',2,'com.ruoyi.api.hello.AreaController.update()','PUT',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 11:15:51',89),(192,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"code\":\"010203\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 11:16:14',18),(193,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 14:42:15',121),(194,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"1\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"asdfaaaaaddd\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:28:29',44),(195,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"2A4B9947F02540408FC03FF9836EC6B1\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"8E12474774694831B4100DEB703F4800\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"asdfaaaaaddd\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:29:06',45),(196,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:38:11',22),(197,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"3\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:38:25',26),(198,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:38:51',26),(199,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 15:44:35',24),(200,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"asdf\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:43',37),(201,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:47',42),(202,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:49',48),(203,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:52',68),(204,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:52',47),(205,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:54',68),(206,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:55',37),(207,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:56',58),(208,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"3\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1_1701613677478_20260315153843A003.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:02:57',63),(209,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"7\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\",\"4\",\"5\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"8E12474774694831B4100DEB703F4800\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7}],\"banjiid\":\"1\",\"banjiname\":\"工程机械1988-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五1\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:04:25',50),(210,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五1\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:05:34',63),(211,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:10:41',34),(212,'地区信息',2,'com.ruoyi.api.hello.AreaController.update()','PUT',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:13:57',54),(213,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:15:56',101),(214,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"person管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"person管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"person管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"person管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"person管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"地区信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"vis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:15',67),(215,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"person管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"person管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"person管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"person管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"person管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"地区信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"vis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:23',37),(216,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"person管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"person管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"person管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"person管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"person管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"地区信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"vis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:25',29),(217,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:42',44),(218,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:49',32),(219,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:53',33),(220,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:54',28),(221,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:58',28),(222,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:58',31),(223,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:16:58',30),(224,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:11',46),(225,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:11',29),(226,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:12',23),(227,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:13',27),(228,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:17',32),(229,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:17:31',23),(230,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:37:19',59),(231,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五1\",\"params\":{},\"remark\":\"goodboy\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:42:31',67),(232,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五1\",\"params\":{},\"remark\":\"goodboy\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:42:34',65),(233,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五1\",\"params\":{},\"remark\":\"goodboy\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:42:42',81),(234,'地区信息',1,'com.ruoyi.api.hello.AreaController.add()','POST',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"code\":\"01020201\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:54:57',30),(235,'地区信息',2,'com.ruoyi.api.hello.AreaController.update()','PUT',1,'admin','研发部门','/hello-api/hello/area','127.0.0.1','内网IP','{\"code\":\"01020201\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 16:55:58',21),(236,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":30,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"goodboy\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:43:36',79),(237,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"4\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"7\",\"areaname\":\"四川/成都/郫都区\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/1_20260315160517A005.txt,/profile/upload/2026/03/15/1 课程导学_20260315160531A006.pptx\",\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250003\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"3\",\"img\":\"/profile/upload/2026/03/15/1699968661802_20260315160311A004.jpg\",\"name\":\"王五\",\"params\":{},\"remark\":\"goodboy\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:44:18',61),(238,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"5\",\"areaname\":\"四川/乐山\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:49:19',65),(239,'字典数据',2,'com.ruoyi.api.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/hello-api/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-03-12 16:08:57\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:53:44',22),(240,'字典数据',2,'com.ruoyi.api.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/hello-api/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-03-12 16:08:57\",\"cssClass\":\"\",\"default\":false,\"dictCode\":2,\"dictLabel\":\"女\",\"dictSort\":2,\"dictType\":\"sys_user_sex\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"remark\":\"性别女\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:53:53',23),(241,'字典数据',2,'com.ruoyi.api.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/hello-api/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-03-12 16:08:57\",\"cssClass\":\"\",\"default\":false,\"dictCode\":3,\"dictLabel\":\"未知\",\"dictSort\":3,\"dictType\":\"sys_user_sex\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"性别未知\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:53:59',17),(242,'字典类型',9,'com.ruoyi.api.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部门','/hello-api/system/dict/type/refreshCache','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:54:05',61),(243,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":24,\"areaIds\":[\"8E12474774694831B4100DEB703F4800\",\"2A4B9947F02540408FC03FF9836EC6B1\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\"],\"areaid\":\"3\",\"areaname\":\"河南\",\"areas\":[{\"code\":\"0201\",\"fullname\":\"广东/佛山\",\"id\":\"8E12474774694831B4100DEB703F4800\",\"name\":\"佛山\",\"pid\":\"2\",\"sort\":1},{\"code\":\"0202\",\"fullname\":\"广东/广州\",\"id\":\"2A4B9947F02540408FC03FF9836EC6B1\",\"name\":\"广州\",\"pid\":\"2\",\"sort\":2},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1}],\"banjiid\":\"1\",\"banjiname\":\"计算机2025-01班\",\"code\":\"20250001\",\"cusIds\":[\"1\",\"2\",\"3\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"1\",\"name\":\"张三\",\"params\":{},\"remark\":\"ccc\",\"sex\":\"2\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 17:54:19',47),(244,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"areaname\":\"河南/新乡\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:04:27',44),(245,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"6\",\"5\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:04:37',41),(246,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"4\",\"5\",\"3\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:06:11',30),(247,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"14357DA707A449F8B3B49B8B6AFA1A76\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"1\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:07:33',81),(248,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"3\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:08:41',80),(249,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}},{\"code\":\"003\",\"id\":\"3\",\"name\":\"人工智能\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:08:53',69),(250,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/1699968661803_20260315144157A001.jpg\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:11:50',72),(251,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/13/2024120218刘雨薇_20260313060744A009.docx,/profile/upload/2026/03/13/峨眉-学生毕业设计选题信息_20260313061534A010.xls\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/QQ20260315-181603_20260315181611A007.png\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:16:24',78),(252,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/4_20260315182900A008.txt\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/QQ20260315-181603_20260315181611A007.png\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:29:09',86),(253,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"3\",\"B188A0077C15429EAFE656F60238D4A8\",\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"1\",\"4\",\"6\",\"7\",\"5\",\"8\",\"9\",\"DA69D24B335A4208A734DD8DD75D1DBB\",\"14357DA707A449F8B3B49B8B6AFA1A76\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/4_20260315182900A008.txt,/profile/upload/2026/03/15/新建 Microsoft Word 文档_20260315183229A009.docx\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/QQ20260315-181603_20260315181611A007.png\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:32:33',66),(254,'学生信息',2,'com.ruoyi.api.hello.StuController.update()','PUT',1,'admin','研发部门','/hello-api/hello/stu','127.0.0.1','内网IP','{\"age\":22,\"areaIds\":[\"6\",\"8\",\"9\"],\"areaid\":\"9\",\"areaname\":\"四川/乐山/夹江\",\"areas\":[{\"code\":\"03\",\"fullname\":\"河南\",\"id\":\"3\",\"name\":\"河南\",\"pid\":\"0\",\"sort\":0},{\"code\":\"0301\",\"fullname\":\"河南/洛阳\",\"id\":\"B188A0077C15429EAFE656F60238D4A8\",\"name\":\"洛阳\",\"pid\":\"3\",\"sort\":1},{\"code\":\"0302\",\"fullname\":\"河南/新乡\",\"id\":\"3FB10574C4074B2D9FE88C7CE8C0D2AA\",\"name\":\"新乡\",\"pid\":\"3\",\"sort\":2},{\"code\":\"01\",\"fullname\":\"四川\",\"id\":\"1\",\"name\":\"四川\",\"pid\":\"0\",\"sort\":1},{\"code\":\"0101\",\"fullname\":\"四川/成都\",\"id\":\"4\",\"name\":\"成都\",\"pid\":\"1\",\"sort\":2},{\"code\":\"010101\",\"fullname\":\"四川/成都/金牛区\",\"id\":\"6\",\"name\":\"金牛区\",\"pid\":\"4\",\"sort\":3},{\"code\":\"010102\",\"fullname\":\"四川/成都/郫都区\",\"id\":\"7\",\"name\":\"郫都区\",\"pid\":\"4\",\"sort\":4},{\"code\":\"0102\",\"fullname\":\"四川/乐山\",\"id\":\"5\",\"name\":\"乐山\",\"pid\":\"1\",\"sort\":5},{\"code\":\"010201\",\"fullname\":\"四川/乐山/峨眉\",\"id\":\"8\",\"name\":\"峨眉\",\"pid\":\"5\",\"sort\":6},{\"code\":\"010202\",\"fullname\":\"四川/乐山/夹江\",\"id\":\"9\",\"name\":\"夹江\",\"pid\":\"5\",\"sort\":7},{\"code\":\"01020201\",\"fullname\":\"四川/乐山/夹江/甘江\",\"id\":\"DA69D24B335A4208A734DD8DD75D1DBB\",\"name\":\"甘江\",\"pid\":\"9\",\"sort\":0},{\"code\":\"010203\",\"fullname\":\"四川/乐山/沐川\",\"id\":\"14357DA707A449F8B3B49B8B6AFA1A76\",\"name\":\"沐川\",\"pid\":\"5\",\"sort\":300}],\"attaches\":\"/profile/upload/2026/03/15/4_20260315182900A008.txt,/profile/upload/2026/03/15/新建 Microsoft Word 文档_20260315183229A009.docx\",\"banjiid\":\"2\",\"banjiname\":\"软件工程2025-02班\",\"code\":\"20250002\",\"cusIds\":[\"1\",\"2\"],\"cuses\":[{\"code\":\"001\",\"id\":\"1\",\"name\":\"计算机网络\",\"params\":{}},{\"code\":\"002\",\"id\":\"2\",\"name\":\"数据结构\",\"params\":{}}],\"id\":\"2\",\"img\":\"/profile/upload/2026/03/15/QQ20260315-181603_20260315181611A007.png\",\"name\":\"李四\",\"params\":{},\"remark\":\"bbb\",\"sex\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-15 18:33:16',30),(255,'菜单管理',2,'com.ruoyi.api.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"person管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:query\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"person管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:add\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"person管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:edit\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"person管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:remove\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"person管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"#\",\"perms\":\"hello:person:export\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}],\"component\":\"hello/person/index\",\"createTime\":\"2026-03-12 16:08:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"person\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"person\",\"perms\":\"hello:person:list\",\"routeName\":\"人员信息\",\"status\":\"0\",\"visible\":\"0\"},{\"children\":[{\"children\":[],\"component\":\"\",\"createTime\":\"2026-03-12 16:27:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"#\",\"perms\":\"hello:area:query\",\"routeName\":\"\",\"status\":\"0\",\"visible','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-16 17:26:20',128),(256,'菜单管理',1,'com.ruoyi.api.system.SysMenuController.add()','POST',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看目录\",\"menuType\":\"M\",\"orderNum\":10000,\"params\":{},\"parentId\":2000,\"path\":\"view\",\"status\":\"0\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-16 17:26:49',36),(257,'菜单管理',1,'com.ruoyi.api.system.SysMenuController.add()','POST',1,'admin','研发部门','/hello-api/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"hello/stu/view\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生\",\"menuType\":\"C\",\"orderNum\":100,\"params\":{},\"parentId\":2031,\"path\":\"stu\",\"routeName\":\"学生\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-03-16 17:27:32',35);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2026-03-12 16:08:54','',NULL,''),(2,'se','项目经理',2,'0','admin','2026-03-12 16:08:54','',NULL,''),(3,'hr','人力资源',3,'0','admin','2026-03-12 16:08:54','',NULL,''),(4,'user','普通员工',4,'0','admin','2026-03-12 16:08:54','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2026-03-12 16:08:54','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2026-03-12 16:08:54','',NULL,'普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */


/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */


/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */


/* Function  structure for function  `fn_get_area_fullname` */

/*!50003 DROP FUNCTION IF EXISTS `fn_get_area_fullname` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_area_fullname`(f_area_id varchar(100)) RETURNS varchar(500) CHARSET utf8
    DETERMINISTIC
begin







    declare v_full_name varchar(500) default '';







    declare v_current_id varchar(100);







    declare v_current_name varchar(100);







    declare v_pid varchar(100);







    declare done int default 0;







    -- 游标用于遍历父节点







    declare cur_area cursor for







        select id, pid, name from hello_area where id = v_current_id;







    declare continue handler for not found set done = 1;







    set v_current_id = f_area_id;







    set v_full_name = '';







    -- 循环向上查找父节点







    while done = 0







        do







            open cur_area;







            fetch cur_area into v_current_id, v_pid, v_current_name;















            if done = 0 then







                if v_full_name = '' then







                    set v_full_name = v_current_name;







                else







                    set v_full_name = concat(v_current_name, '/', v_full_name);







                end if;















                if v_pid = '0' or v_pid is null or v_pid = v_current_id then







                    set done = 1;







                else







                    set v_current_id = v_pid;







                end if;







            end if;







            close cur_area;







        end while;







    return v_full_name;







end */$$
DELIMITER ;

/*Table structure for table `v_hello_stu` */

DROP TABLE IF EXISTS `v_hello_stu`;

/*!50001 DROP VIEW IF EXISTS `v_hello_stu` */;
/*!50001 DROP TABLE IF EXISTS `v_hello_stu` */;

/*!50001 CREATE TABLE  `v_hello_stu`(
 `id` varchar(100) ,
 `code` varchar(100) ,
 `name` varchar(100) ,
 `age` int(11) ,
 `sex` varchar(100) ,
 `img` varchar(500) ,
 `attaches` varchar(500) ,
 `areaid` varchar(100) ,
 `banjiid` varchar(100) ,
 `remark` varchar(500) ,
 `areaname` varchar(100) ,
 `banjiname` varchar(100) 
)*/;

/*Table structure for table `v_hello_stu_area` */

DROP TABLE IF EXISTS `v_hello_stu_area`;

/*!50001 DROP VIEW IF EXISTS `v_hello_stu_area` */;
/*!50001 DROP TABLE IF EXISTS `v_hello_stu_area` */;

/*!50001 CREATE TABLE  `v_hello_stu_area`(
 `stuid` varchar(100) ,
 `areaid` varchar(100) ,
 `stuname` varchar(100) ,
 `areaname` varchar(100) 
)*/;

/*Table structure for table `v_hello_stu_cus` */

DROP TABLE IF EXISTS `v_hello_stu_cus`;

/*!50001 DROP VIEW IF EXISTS `v_hello_stu_cus` */;
/*!50001 DROP TABLE IF EXISTS `v_hello_stu_cus` */;

/*!50001 CREATE TABLE  `v_hello_stu_cus`(
 `stuid` varchar(100) ,
 `cusid` varchar(100) ,
 `score` int(11) ,
 `stuname` varchar(100) ,
 `stucode` varchar(100) ,
 `cusname` varchar(100) ,
 `cuscode` varchar(200) 
)*/;

/*View structure for view v_hello_stu */

/*!50001 DROP TABLE IF EXISTS `v_hello_stu` */;
/*!50001 DROP VIEW IF EXISTS `v_hello_stu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hello_stu` AS select `t`.`id` AS `id`,`t`.`code` AS `code`,`t`.`name` AS `name`,`t`.`age` AS `age`,`t`.`sex` AS `sex`,`t`.`img` AS `img`,`t`.`attaches` AS `attaches`,`t`.`areaid` AS `areaid`,`t`.`banjiid` AS `banjiid`,`t`.`remark` AS `remark`,`t1`.`fullname` AS `areaname`,`t2`.`name` AS `banjiname` from ((`hello_stu` `t` left join `hello_area` `t1` on((`t`.`areaid` = `t1`.`id`))) left join `hello_banji` `t2` on((`t`.`banjiid` = `t2`.`id`))) */;

/*View structure for view v_hello_stu_area */

/*!50001 DROP TABLE IF EXISTS `v_hello_stu_area` */;
/*!50001 DROP VIEW IF EXISTS `v_hello_stu_area` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hello_stu_area` AS select `t`.`stuid` AS `stuid`,`t`.`areaid` AS `areaid`,`t1`.`name` AS `stuname`,`t2`.`fullname` AS `areaname` from ((`hello_stu_area` `t` left join `hello_stu` `t1` on((`t`.`stuid` = `t1`.`id`))) left join `hello_area` `t2` on((`t`.`areaid` = `t2`.`id`))) order by `t1`.`name`,`t2`.`fullname` */;

/*View structure for view v_hello_stu_cus */

/*!50001 DROP TABLE IF EXISTS `v_hello_stu_cus` */;
/*!50001 DROP VIEW IF EXISTS `v_hello_stu_cus` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hello_stu_cus` AS select `t`.`stuid` AS `stuid`,`t`.`cusid` AS `cusid`,`t`.`score` AS `score`,`t1`.`name` AS `stuname`,`t1`.`code` AS `stucode`,`t2`.`name` AS `cusname`,`t2`.`code` AS `cuscode` from ((`hello_stu_cus` `t` left join `hello_stu` `t1` on((`t`.`stuid` = `t1`.`id`))) left join `hello_cus` `t2` on((`t`.`cusid` = `t2`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
