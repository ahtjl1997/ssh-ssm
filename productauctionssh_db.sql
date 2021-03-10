/*
MySQL Data Transfer
Source Host: localhost
Source Database: productauctionssh_db
Target Host: localhost
Target Database: productauctionssh_db
Date: 2018-12-07 15:57:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bzjrecord
-- ----------------------------
DROP TABLE IF EXISTS `bzjrecord`;
CREATE TABLE `bzjrecord` (
  `id` int(11) NOT NULL auto_increment,
  `goodid` varchar(255) default NULL,
  `memberid` varchar(255) default NULL,
  `fee` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL auto_increment,
  `ddno` varchar(255) default NULL,
  `memberid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `maxprice` varchar(255) default NULL,
  `total` varchar(255) default NULL,
  `fkstatus` varchar(255) default NULL,
  `fhstatus` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  `shr` varchar(255) default NULL,
  `shtel` varchar(255) default NULL,
  `shaddr` varchar(255) default NULL,
  `saleid` varchar(255) default NULL,
  `thstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feeset
-- ----------------------------
DROP TABLE IF EXISTS `feeset`;
CREATE TABLE `feeset` (
  `id` int(11) NOT NULL auto_increment,
  `fee` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gongneng
-- ----------------------------
DROP TABLE IF EXISTS `gongneng`;
CREATE TABLE `gongneng` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `fatherid` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL auto_increment,
  `goodsname` varchar(255) default NULL,
  `price` int(255) default NULL,
  `jiajia` int(11) default NULL,
  `shuishou` int(11) default NULL,
  `type` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `content` text,
  `delstatus` varchar(255) default NULL,
  `stime` varchar(255) default NULL,
  `etime` varchar(255) default NULL,
  `maxprice` int(255) default NULL,
  `memberid` varchar(255) default NULL,
  `cs` int(11) default NULL,
  `shstatus` varchar(255) default NULL,
  `chengdu` varchar(255) default NULL,
  `buytime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for imgv
-- ----------------------------
DROP TABLE IF EXISTS `imgv`;
CREATE TABLE `imgv` (
  `id` int(11) NOT NULL auto_increment,
  `img` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jingjia
-- ----------------------------
DROP TABLE IF EXISTS `jingjia`;
CREATE TABLE `jingjia` (
  `id` int(11) NOT NULL auto_increment,
  `gid` varchar(255) default NULL,
  `memberid` varchar(255) default NULL,
  `chuprice` int(11) default NULL,
  `delstatus` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jubao
-- ----------------------------
DROP TABLE IF EXISTS `jubao`;
CREATE TABLE `jubao` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `saleid` varchar(255) default NULL,
  `content` text,
  `filename` varchar(255) default NULL,
  `hfmember` text,
  `hfsale` text,
  `hfmsavetime` varchar(255) default NULL,
  `hfssavetime` varchar(255) default NULL,
  `url` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for juese
-- ----------------------------
DROP TABLE IF EXISTS `juese`;
CREATE TABLE `juese` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lishi
-- ----------------------------
DROP TABLE IF EXISTS `lishi`;
CREATE TABLE `lishi` (
  `id` int(11) NOT NULL auto_increment,
  `gid` varchar(255) default NULL,
  `memberid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for liuyan
-- ----------------------------
DROP TABLE IF EXISTS `liuyan`;
CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `content` text,
  `lsavetime` varchar(255) default NULL,
  `hcontent` text,
  `adminid` varchar(255) default NULL,
  `hsavetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `yue` varchar(255) default NULL,
  `utype` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `img` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pingjia
-- ----------------------------
DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `id` int(11) NOT NULL auto_increment,
  `typename` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL auto_increment,
  `score` int(11) default NULL,
  `content` text,
  `gid` varchar(255) default NULL,
  `saleid` varchar(255) default NULL,
  `memberid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shouquan
-- ----------------------------
DROP TABLE IF EXISTS `shouquan`;
CREATE TABLE `shouquan` (
  `id` int(11) NOT NULL auto_increment,
  `jsid` varchar(255) default NULL,
  `gnid` varchar(255) default NULL,
  `fatherid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(20) NOT NULL auto_increment,
  `usertype` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `userpwd` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yqlj
-- ----------------------------
DROP TABLE IF EXISTS `yqlj`;
CREATE TABLE `yqlj` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bzjrecord` VALUES ('5', '20', '6', '500');
INSERT INTO `bzjrecord` VALUES ('6', '20', '2', '500');
INSERT INTO `bzjrecord` VALUES ('7', '21', '6', '500');
INSERT INTO `bzjrecord` VALUES ('8', '21', '2', '500');
INSERT INTO `bzjrecord` VALUES ('9', '22', '2', '500');
INSERT INTO `bzjrecord` VALUES ('10', '23', '2', '500');
INSERT INTO `bzjrecord` VALUES ('11', '23', '6', '500');
INSERT INTO `bzjrecord` VALUES ('12', '24', '2', '500');
INSERT INTO `bzjrecord` VALUES ('13', '24', '9', '500');
INSERT INTO `bzjrecord` VALUES ('14', '25', '9', '500');
INSERT INTO `bzjrecord` VALUES ('15', '25', '10', '500');
INSERT INTO `bzjrecord` VALUES ('16', '26', '11', '500');
INSERT INTO `bzjrecord` VALUES ('17', '26', '9', '500');
INSERT INTO `bzjrecord` VALUES ('18', '27', '11', '500');
INSERT INTO `bzjrecord` VALUES ('19', '27', '9', '500');
INSERT INTO `bzjrecord` VALUES ('20', '28', '9', '500');
INSERT INTO `bzjrecord` VALUES ('21', '28', '10', '500');
INSERT INTO `car` VALUES ('11', '1205082532', '10', '25', '3300', '3300.0', '已付款', '已发货', '已签收', '小刘', '15100001111', '北京路7号', '7', '');
INSERT INTO `car` VALUES ('12', '1205084923', '9', '27', '5500', '5500.0', '已付款', '已发货', '已签收', '小猪', '13111111111', '北京中路11号', '7', '');
INSERT INTO `car` VALUES ('13', '1205085044', '9', '26', '30', '30.0', '已付款', '已发货', '未签收', '小猪', '13111111111', '北京中路11号', '7', '');
INSERT INTO `car` VALUES ('14', '1205085904', '10', '28', '110', '110.0', '待付款', '', '', '', '', '', '7', '');
INSERT INTO `feeset` VALUES ('1', '500');
INSERT INTO `gongneng` VALUES ('2', '拍品信息管理', '0', '', '0');
INSERT INTO `gongneng` VALUES ('3', '拍品管理', '2', 'goodslist.jsp', '0');
INSERT INTO `gongneng` VALUES ('6', '人员管理', '0', '', '0');
INSERT INTO `gongneng` VALUES ('7', '会员管理', '6', 'huiyuanmanager.jsp', '0');
INSERT INTO `gongneng` VALUES ('10', '拍卖管理', '2', 'dingdanmanager.jsp', '1');
INSERT INTO `gongneng` VALUES ('11', '管理员管理', '6', 'usersmanager.jsp', '0');
INSERT INTO `gongneng` VALUES ('12', '基础信息', '0', '', '0');
INSERT INTO `gongneng` VALUES ('13', '友情链接管理', '12', 'yqljlist.jsp', '0');
INSERT INTO `gongneng` VALUES ('14', '系统公告管理', '12', 'noticelist.jsp', '0');
INSERT INTO `gongneng` VALUES ('15', '焦点图管理', '12', 'imglist.jsp', '0');
INSERT INTO `gongneng` VALUES ('16', '在线留言管理', '12', 'liuyanlist.jsp', '0');
INSERT INTO `gongneng` VALUES ('17', '举报管理', '12', 'jubaolist.jsp', '0');
INSERT INTO `gongneng` VALUES ('18', '系统设置', '0', '', '0');
INSERT INTO `gongneng` VALUES ('19', '修改密码', '18', 'modifypw.jsp', '0');
INSERT INTO `gongneng` VALUES ('20', '测试', '0', '', '1');
INSERT INTO `gongneng` VALUES ('21', '测试', '20', 'aa.jsp', '1');
INSERT INTO `gongneng` VALUES ('22', '拍品类别管理', '2', 'producttypelist.jsp', '0');
INSERT INTO `gongneng` VALUES ('23', '保证金设置', '12', 'feeset.jsp', '0');
INSERT INTO `goods` VALUES ('25', 'imac', '3000', '100', '0', '7', '/productauctionssh/upfile/QQ截图20170315163709.png', '交易完成', '12312312', '0', '2018-12-05 20:23:42', '2018-12-05 20:25:31', '3300', '7', '4', '通过审核', '九成新', '2018-11-29');
INSERT INTO `goods` VALUES ('26', '测试的', '30', '5', '0', '7', '/productauctionssh/upfile/QQ截图20170315164428.png', '交易完成', '123123', '0', '2018-12-05 20:33:52', '2018-12-05 20:50:44', '30', '7', '12', '通过审核', '全新', '2018-11-27');
INSERT INTO `goods` VALUES ('27', '志玲穿过的鞋', '5000', '100', '0', '6', '/productauctionssh/upfile/QQ截图20170119172553.png', '交易完成', '123123123', '0', '2018-12-05 20:42:40', '2018-12-05 20:49:23', '5500', '7', '6', '通过审核', '九成新', '2018-11-28');
INSERT INTO `goods` VALUES ('28', '123', '100', '5', '0', '6', '/productauctionssh/upfile/QQ截图20170119172050.png', '交易完成', '123123', '0', '2018-12-05 20:52:11', '2018-12-05 20:59:04', '110', '7', '6', '通过审核', '全新', '2018-11-25');
INSERT INTO `imgv` VALUES ('2', '/productauctionssh/upfile/20171216151117.jpg');
INSERT INTO `imgv` VALUES ('3', '/productauctionssh/upfile/20171216151101.jpg');
INSERT INTO `imgv` VALUES ('4', '/productauctionssh/upfile/20171216151027.jpg');
INSERT INTO `jubao` VALUES ('3', '1', '11', '3', '......', '/productauctionssh/upfile/17.jpg', '马上下架', '', '', '', 'http://localhost:8080/productauctionssh/e/salegoodsx.jsp?goodsid=11');
INSERT INTO `juese` VALUES ('1', '超级管理员', '0');
INSERT INTO `juese` VALUES ('2', '普通管理员', '0');
INSERT INTO `lishi` VALUES ('1', '2', '2');
INSERT INTO `lishi` VALUES ('2', '2', '4');
INSERT INTO `lishi` VALUES ('3', '2', '5');
INSERT INTO `lishi` VALUES ('4', '13', '6');
INSERT INTO `lishi` VALUES ('5', '13', '6');
INSERT INTO `lishi` VALUES ('6', '13', '2');
INSERT INTO `lishi` VALUES ('7', '15', '2');
INSERT INTO `lishi` VALUES ('8', '16', '2');
INSERT INTO `lishi` VALUES ('9', '16', '2');
INSERT INTO `lishi` VALUES ('10', '17', '2');
INSERT INTO `lishi` VALUES ('11', '18', '6');
INSERT INTO `lishi` VALUES ('12', '21', '6');
INSERT INTO `lishi` VALUES ('13', '21', '2');
INSERT INTO `lishi` VALUES ('14', '21', '2');
INSERT INTO `lishi` VALUES ('15', '22', '2');
INSERT INTO `lishi` VALUES ('16', '23', '2');
INSERT INTO `lishi` VALUES ('17', '23', '2');
INSERT INTO `lishi` VALUES ('18', '23', '6');
INSERT INTO `lishi` VALUES ('19', '24', '2');
INSERT INTO `lishi` VALUES ('20', '24', '9');
INSERT INTO `lishi` VALUES ('21', '25', '9');
INSERT INTO `lishi` VALUES ('22', '25', '10');
INSERT INTO `lishi` VALUES ('23', '26', '11');
INSERT INTO `lishi` VALUES ('24', '26', '9');
INSERT INTO `lishi` VALUES ('25', '27', '11');
INSERT INTO `lishi` VALUES ('26', '27', '9');
INSERT INTO `lishi` VALUES ('27', '27', '9');
INSERT INTO `lishi` VALUES ('28', '28', '9');
INSERT INTO `lishi` VALUES ('29', '28', '10');
INSERT INTO `liuyan` VALUES ('1', '9', '恭恭敬敬', '2018-12-05 20:40:36', 'oooo', 'admin', '2018-12-05 20:40:44');
INSERT INTO `member` VALUES ('1', 'xm', '123', '李白', '女', null, '13643290486', 'dd@126.com', '河北保定', '/productauctionssh/upfile/201304051943520002.jpg', '2018-04-15 20:29:35', '0', '909.3', '拍卖者');
INSERT INTO `member` VALUES ('2', 'dd', '123', '冯涛', '男', null, '138937843498', '1225272681@qq.com', '武汉光谷广场', '/productauctionssh/upfile/201405171715420005.jpg', '2018-04-15 23:13:15', '0', '10000.0', '拍卖者');
INSERT INTO `member` VALUES ('3', 'zhangsan', '123', '张三', '女', null, '13483098204', 'zhangsan@126.com', '北京海滨', '/productauctionssh/upfile/201304051943520002.jpg', '2018-04-15 14:16:35', '0', '0', '拍卖者');
INSERT INTO `member` VALUES ('4', 'lisi', '123', '李四', '男', null, '138937843498', 'lisi@126.com', '武汉光谷广场', '/productauctionssh/upfile/201405231955010015.jpg', '2018-04-15 11:27:30', '0', '580.0', '拍卖者');
INSERT INTO `member` VALUES ('6', 'jack', '123', 'jack', '女', null, '13893784349', 'jack@126.com', '武汉光谷广场', '/productauctionssh/upfile/201405231955010015.jpg', '2018-04-15 11:34:19', '0', '10000.0', '拍卖者');
INSERT INTO `member` VALUES ('7', 'calvin', '123', 'calvin', '男', null, '', '86266000@qq.com', '', null, '2018-04-17 14:52:41', '0', '0', '拍卖者');
INSERT INTO `member` VALUES ('9', 'zz', '123', '小猪', '女', null, '13111111111', '6666@qq.com', '北京中路11号', '/productauctionssh/upfile/20161014042503.jpg', '2018-12-05 20:00:03', '0', '4970.0', '买家');
INSERT INTO `member` VALUES ('10', 'mm', '123', '', '', null, '', 'mm@qq.com', '', null, '2018-12-05 20:24:16', '0', '6700.0', '买家');
INSERT INTO `member` VALUES ('11', 'abc', '123', '大哥', '男', null, '13544443333', 'abc@163.com', '北京中路111号', '/productauctionssh/upfile/20161014043543.jpg', '2018-12-05 20:37:58', '0', '10500.0', '买家');
INSERT INTO `notice` VALUES ('1', '双十一大抢购', '大牌集聚,现货抢购,正品低价,限时特惠，,送货快,省事又省心', '/freshfoodshoppingssh/upload/nopic.jpg', '2018-12-05 20:29:35', '0');
INSERT INTO `producttype` VALUES ('3', '古玩', '0');
INSERT INTO `producttype` VALUES ('4', '艺术品', '0');
INSERT INTO `producttype` VALUES ('5', '测试', '1');
INSERT INTO `producttype` VALUES ('6', '服饰鞋帽', '0');
INSERT INTO `producttype` VALUES ('7', '数码电子', '0');
INSERT INTO `score` VALUES ('1', '5', '好', '25', '7', '10');
INSERT INTO `score` VALUES ('2', '4', 'okok', '27', '7', '9');
INSERT INTO `shouquan` VALUES ('26', '2', '3', '2');
INSERT INTO `shouquan` VALUES ('27', '2', '7', '6');
INSERT INTO `shouquan` VALUES ('28', '2', '19', '18');
INSERT INTO `shouquan` VALUES ('58', '1', '3', '2');
INSERT INTO `shouquan` VALUES ('59', '1', '7', '6');
INSERT INTO `shouquan` VALUES ('60', '1', '11', '6');
INSERT INTO `shouquan` VALUES ('61', '1', '13', '12');
INSERT INTO `shouquan` VALUES ('62', '1', '14', '12');
INSERT INTO `shouquan` VALUES ('63', '1', '15', '12');
INSERT INTO `shouquan` VALUES ('64', '1', '16', '12');
INSERT INTO `shouquan` VALUES ('65', '1', '19', '18');
INSERT INTO `shouquan` VALUES ('66', '1', '22', '2');
INSERT INTO `shouquan` VALUES ('67', '1', '23', '12');
INSERT INTO `sysuser` VALUES ('1', '1', 'admin', '123', '王老大', '男', '13643290486', 'admin@163.com', '/productauctionssh/upfile/5723094eN08762648.jpg', '0', '2018-04-15 00:00:00');
INSERT INTO `sysuser` VALUES ('2', '2', 'root', '123', 'root', '男', '13798423810', 'root@126.com', '/productauctionssh/upfile/20.jpg', '0', '2018-04-15 00:00:00');
INSERT INTO `sysuser` VALUES ('3', '2', 'emp', '123', 'emp', '男', '134839212311', 'emp@126.com', '/freshfoodshoppingssh/upfile/201304051942500001.jpg', '1', '2018-04-15 00:00:00');
INSERT INTO `yqlj` VALUES ('1', '聚美优品', 'http://mall.jumei.com');
INSERT INTO `yqlj` VALUES ('2', '百度', 'http://www.baidu.com');
