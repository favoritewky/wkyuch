-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2015 年 02 月 02 日 03:56
-- 服务器版本: 5.5.32
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ucenter`
--
CREATE DATABASE IF NOT EXISTS `ucenter` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ucenter`;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_ad`
--

CREATE TABLE IF NOT EXISTS `uchome_ad` (
  `adid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `pagetype` varchar(20) NOT NULL DEFAULT '',
  `adcode` text NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_adminsession`
--

CREATE TABLE IF NOT EXISTS `uchome_adminsession` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_adminsession`
--

INSERT INTO `uchome_adminsession` (`uid`, `ip`, `dateline`, `errorcount`) VALUES
(1, 'unknown', 1422844910, -1);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_album`
--

CREATE TABLE IF NOT EXISTS `uchome_album` (
  `albumid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `albumname` varchar(50) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `picnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(60) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(10) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  PRIMARY KEY (`albumid`),
  KEY `uid` (`uid`,`updatetime`),
  KEY `updatetime` (`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_appcreditlog`
--

CREATE TABLE IF NOT EXISTS `uchome_appcreditlog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blacklist`
--

CREATE TABLE IF NOT EXISTS `uchome_blacklist` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`buid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_block`
--

CREATE TABLE IF NOT EXISTS `uchome_block` (
  `bid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `blocksql` text NOT NULL,
  `cachename` varchar(30) NOT NULL DEFAULT '',
  `cachetime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `startnum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `perpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `htmlcode` text NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blog`
--

CREATE TABLE IF NOT EXISTS `uchome_blog` (
  `blogid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pic` char(120) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `click_1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_5` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`blogid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blogfield`
--

CREATE TABLE IF NOT EXISTS `uchome_blogfield` (
  `blogid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `postip` varchar(20) NOT NULL DEFAULT '',
  `related` text NOT NULL,
  `relatedtime` int(10) unsigned NOT NULL DEFAULT '0',
  `target_ids` text NOT NULL,
  `hotuser` text NOT NULL,
  `magiccolor` tinyint(6) NOT NULL DEFAULT '0',
  `magicpaper` tinyint(6) NOT NULL DEFAULT '0',
  `magiccall` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_cache`
--

CREATE TABLE IF NOT EXISTS `uchome_cache` (
  `cachekey` varchar(16) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cachekey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_class`
--

CREATE TABLE IF NOT EXISTS `uchome_class` (
  `classid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `classname` char(40) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_click`
--

CREATE TABLE IF NOT EXISTS `uchome_click` (
  `clickid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `displayorder` tinyint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clickid`),
  KEY `idtype` (`idtype`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `uchome_click`
--

INSERT INTO `uchome_click` (`clickid`, `name`, `icon`, `idtype`, `displayorder`) VALUES
(1, '路过', 'luguo.gif', 'blogid', 0),
(2, '雷人', 'leiren.gif', 'blogid', 0),
(3, '握手', 'woshou.gif', 'blogid', 0),
(4, '鲜花', 'xianhua.gif', 'blogid', 0),
(5, '鸡蛋', 'jidan.gif', 'blogid', 0),
(6, '漂亮', 'piaoliang.gif', 'picid', 0),
(7, '酷毙', 'kubi.gif', 'picid', 0),
(8, '雷人', 'leiren.gif', 'picid', 0),
(9, '鲜花', 'xianhua.gif', 'picid', 0),
(10, '鸡蛋', 'jidan.gif', 'picid', 0),
(11, '搞笑', 'gaoxiao.gif', 'tid', 0),
(12, '迷惑', 'mihuo.gif', 'tid', 0),
(13, '雷人', 'leiren.gif', 'tid', 0),
(14, '鲜花', 'xianhua.gif', 'tid', 0),
(15, '鸡蛋', 'jidan.gif', 'tid', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_clickuser`
--

CREATE TABLE IF NOT EXISTS `uchome_clickuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `clickid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`,`idtype`,`dateline`),
  KEY `uid` (`uid`,`idtype`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_comment`
--

CREATE TABLE IF NOT EXISTS `uchome_comment` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `magicflicker` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `authorid` (`authorid`,`idtype`),
  KEY `id` (`id`,`idtype`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_config`
--

CREATE TABLE IF NOT EXISTS `uchome_config` (
  `var` varchar(30) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL,
  PRIMARY KEY (`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_config`
--

INSERT INTO `uchome_config` (`var`, `datavalue`) VALUES
('sitename', '我的空间'),
('template', 'default'),
('adminemail', 'webmaster@localhost'),
('onlinehold', '1800'),
('timeoffset', '8'),
('maxpage', '100'),
('starcredit', '100'),
('starlevelnum', '5'),
('cachemode', 'database'),
('cachegrade', '0'),
('allowcache', '1'),
('allowdomain', '0'),
('allowrewrite', '0'),
('allowwatermark', '0'),
('allowftp', '0'),
('holddomain', 'www|*blog*|*space*|x'),
('mtagminnum', '5'),
('feedday', '7'),
('feedmaxnum', '100'),
('feedfilternum', '10'),
('importnum', '100'),
('maxreward', '10'),
('singlesent', '50'),
('groupnum', '8'),
('closeregister', '0'),
('closeinvite', '0'),
('close', '0'),
('networkpublic', '1'),
('networkpage', '1'),
('seccode_register', '1'),
('uc_tagrelated', '1'),
('manualmoderator', '1'),
('linkguide', '1'),
('showall', '1'),
('sendmailday', '0'),
('realname', '0'),
('namecheck', '0'),
('namechange', '0'),
('name_allowviewspace', '1'),
('name_allowfriend', '1'),
('name_allowpoke', '1'),
('name_allowdoing', '1'),
('name_allowblog', '0'),
('name_allowalbum', '0'),
('name_allowthread', '0'),
('name_allowshare', '0'),
('name_allowcomment', '0'),
('name_allowpost', '0'),
('showallfriendnum', '10'),
('feedtargetblank', '1'),
('feedread', '1'),
('feedhotnum', '3'),
('feedhotday', '2'),
('feedhotmin', '3'),
('feedhiddenicon', 'friend,profile,task,wall'),
('uc_tagrelatedtime', '86400'),
('privacy', 'a:2:{s:4:"view";a:12:{s:5:"index";i:0;s:7:"profile";i:0;s:6:"friend";i:0;s:4:"wall";i:0;s:4:"feed";i:0;s:4:"mtag";i:0;s:5:"event";i:0;s:5:"doing";i:0;s:4:"blog";i:0;s:5:"album";i:0;s:5:"share";i:0;s:4:"poll";i:0;}s:4:"feed";a:21:{s:5:"doing";i:1;s:4:"blog";i:1;s:6:"upload";i:1;s:5:"share";i:1;s:4:"poll";i:1;s:8:"joinpoll";i:1;s:6:"thread";i:1;s:4:"post";i:1;s:4:"mtag";i:1;s:5:"event";i:1;s:4:"join";i:1;s:6:"friend";i:1;s:7:"comment";i:1;s:4:"show";i:1;s:9:"spaceopen";i:1;s:6:"credit";i:1;s:6:"invite";i:1;s:4:"task";i:1;s:7:"profile";i:1;s:5:"album";i:1;s:5:"click";i:1;}}'),
('cronnextrun', '1422844620'),
('my_status', '0'),
('uniqueemail', '1'),
('updatestat', '1'),
('my_showgift', '1'),
('topcachetime', '60'),
('newspacenum', '3'),
('sitekey', 'fb75d695WiW0BbrR');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_creditlog`
--

CREATE TABLE IF NOT EXISTS `uchome_creditlog` (
  `clid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cyclenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `experience` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clid`),
  KEY `uid` (`uid`,`rid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uchome_creditlog`
--

INSERT INTO `uchome_creditlog` (`clid`, `uid`, `rid`, `total`, `cyclenum`, `credit`, `experience`, `starttime`, `info`, `user`, `app`, `dateline`) VALUES
(1, 1, 1, 1, 1, 10, 0, 0, '', '', '', 1422844167),
(2, 1, 10, 1, 1, 15, 15, 0, '', '', '', 1422844167);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_creditrule`
--

CREATE TABLE IF NOT EXISTS `uchome_creditrule` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rulename` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1',
  `rewardtype` tinyint(1) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `experience` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `action` (`action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `uchome_creditrule`
--

INSERT INTO `uchome_creditrule` (`rid`, `rulename`, `action`, `cycletype`, `cycletime`, `rewardnum`, `rewardtype`, `norepeat`, `credit`, `experience`) VALUES
(1, '开通空间', 'register', 0, 0, 1, 1, 0, 10, 0),
(2, '实名认证', 'realname', 0, 0, 1, 1, 0, 20, 20),
(3, '邮箱认证', 'realemail', 0, 0, 1, 1, 0, 40, 40),
(4, '成功邀请好友', 'invitefriend', 4, 0, 20, 1, 0, 10, 10),
(5, '设置头像', 'setavatar', 0, 0, 1, 1, 0, 15, 15),
(6, '视频认证', 'videophoto', 0, 0, 1, 1, 0, 40, 40),
(7, '成功举报', 'report', 4, 0, 0, 1, 0, 2, 2),
(8, '更新心情', 'updatemood', 1, 0, 3, 1, 0, 3, 3),
(9, '热点信息', 'hotinfo', 4, 0, 0, 1, 0, 10, 10),
(10, '每天登陆', 'daylogin', 1, 0, 1, 1, 0, 15, 15),
(11, '访问别人空间', 'visit', 1, 0, 10, 1, 2, 1, 1),
(12, '打招呼', 'poke', 1, 0, 10, 1, 2, 1, 1),
(13, '留言', 'guestbook', 1, 0, 20, 1, 2, 2, 2),
(14, '被留言', 'getguestbook', 1, 0, 5, 1, 2, 1, 0),
(15, '发表记录', 'doing', 1, 0, 5, 1, 0, 1, 1),
(16, '发表日志', 'publishblog', 1, 0, 3, 1, 0, 5, 5),
(17, '上传图片', 'uploadimage', 1, 0, 10, 1, 0, 2, 2),
(18, '拍大头贴', 'camera', 1, 0, 5, 1, 0, 3, 3),
(19, '发表话题', 'publishthread', 1, 0, 5, 1, 0, 5, 5),
(20, '回复话题', 'replythread', 1, 0, 10, 1, 1, 1, 1),
(21, '创建投票', 'createpoll', 1, 0, 5, 1, 0, 2, 2),
(22, '参与投票', 'joinpoll', 1, 0, 10, 1, 1, 1, 1),
(23, '发起活动', 'createevent', 1, 0, 1, 1, 0, 3, 3),
(24, '参与活动', 'joinevent', 1, 0, 1, 1, 1, 1, 1),
(25, '推荐活动', 'recommendevent', 4, 0, 0, 1, 0, 10, 10),
(26, '发起分享', 'createshare', 1, 0, 3, 1, 0, 2, 2),
(27, '评论', 'comment', 1, 0, 40, 1, 1, 1, 1),
(28, '被评论', 'getcomment', 1, 0, 20, 1, 1, 1, 0),
(29, '安装应用', 'installapp', 4, 0, 0, 1, 3, 5, 5),
(30, '使用应用', 'useapp', 1, 0, 10, 1, 3, 1, 1),
(31, '信息表态', 'click', 1, 0, 10, 1, 1, 1, 1),
(32, '修改实名', 'editrealname', 0, 0, 1, 0, 0, 5, 0),
(33, '更改邮箱认证', 'editrealemail', 0, 0, 1, 0, 0, 5, 0),
(34, '头像被删除', 'delavatar', 0, 0, 1, 0, 0, 10, 10),
(35, '获取邀请码', 'invitecode', 0, 0, 1, 0, 0, 0, 0),
(36, '搜索一次', 'search', 0, 0, 1, 0, 0, 1, 0),
(37, '日志导入', 'blogimport', 0, 0, 1, 0, 0, 10, 0),
(38, '修改域名', 'modifydomain', 0, 0, 1, 0, 0, 5, 0),
(39, '日志被删除', 'delblog', 0, 0, 1, 0, 0, 10, 10),
(40, '记录被删除', 'deldoing', 0, 0, 1, 0, 0, 2, 2),
(41, '图片被删除', 'delimage', 0, 0, 1, 0, 0, 4, 4),
(42, '投票被删除', 'delpoll', 0, 0, 1, 0, 0, 4, 4),
(43, '话题被删除', 'delthread', 0, 0, 1, 0, 0, 4, 4),
(44, '活动被删除', 'delevent', 0, 0, 1, 0, 0, 6, 6),
(45, '分享被删除', 'delshare', 0, 0, 1, 0, 0, 4, 4),
(46, '留言被删除', 'delguestbook', 0, 0, 1, 0, 0, 4, 4),
(47, '评论被删除', 'delcomment', 0, 0, 1, 0, 0, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_cron`
--

CREATE TABLE IF NOT EXISTS `uchome_cron` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `uchome_cron`
--

INSERT INTO `uchome_cron` (`cronid`, `available`, `type`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES
(1, 1, 'system', '更新浏览数统计', 'log.php', 1422844514, 1422844800, -1, -1, -1, '0	5	10	15	20	25	30	35	40	45	50	55'),
(2, 1, 'system', '清理过期feed', 'cleanfeed.php', 1422844234, 1422903840, -1, -1, 3, '4'),
(3, 1, 'system', '清理个人通知', 'cleannotification.php', 1422844371, 1422911160, -1, -1, 5, '6'),
(4, 1, 'system', '同步UC的feed', 'getfeed.php', 1422844374, 1422844620, -1, -1, -1, '2	7	12	17	22	27	32	37	42	47	52'),
(5, 1, 'system', '清理脚印和最新访客', 'cleantrace.php', 1422844376, 1422900180, -1, -1, 2, '3');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_data`
--

CREATE TABLE IF NOT EXISTS `uchome_data` (
  `var` varchar(20) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_data`
--

INSERT INTO `uchome_data` (`var`, `datavalue`, `dateline`) VALUES
('mail', 'a:3:{s:8:"mailsend";s:1:"1";s:13:"maildelimiter";s:1:"0";s:12:"mailusername";s:1:"1";}', 1422844087),
('setting', 'a:4:{s:10:"thumbwidth";s:3:"100";s:11:"thumbheight";s:3:"100";s:12:"watermarkpos";s:1:"4";s:14:"watermarktrans";s:2:"75";}', 1422844087),
('network', 'a:5:{s:4:"blog";a:2:{s:4:"hot1";s:1:"3";s:5:"cache";s:3:"600";}s:3:"pic";a:2:{s:4:"hot1";s:1:"3";s:5:"cache";s:3:"700";}s:6:"thread";a:2:{s:4:"hot1";s:1:"3";s:5:"cache";s:3:"800";}s:5:"event";a:1:{s:5:"cache";s:3:"900";}s:4:"poll";a:1:{s:5:"cache";s:3:"500";}}', 1422844087),
('newspacelist', 'a:1:{i:0;a:6:{s:3:"uid";s:1:"1";s:8:"username";s:4:"test";s:4:"name";s:0:"";s:10:"namestatus";s:1:"0";s:11:"videostatus";s:1:"0";s:8:"dateline";s:10:"1422844167";}}', 1422844167);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_docomment`
--

CREATE TABLE IF NOT EXISTS `uchome_docomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upid` int(10) unsigned NOT NULL DEFAULT '0',
  `doid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `grade` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `doid` (`doid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_doing`
--

CREATE TABLE IF NOT EXISTS `uchome_doing` (
  `doid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `from` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `replynum` int(10) unsigned NOT NULL DEFAULT '0',
  `mood` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_event`
--

CREATE TABLE IF NOT EXISTS `uchome_event` (
  `eventid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `location` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follownum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(3) NOT NULL DEFAULT '0',
  `recommendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `grade` (`grade`,`recommendtime`),
  KEY `membernum` (`membernum`),
  KEY `uid` (`uid`,`eventid`),
  KEY `tagid` (`tagid`,`eventid`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventclass`
--

CREATE TABLE IF NOT EXISTS `uchome_eventclass` (
  `classid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(80) NOT NULL DEFAULT '',
  `poster` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `displayorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `uchome_eventclass`
--

INSERT INTO `uchome_eventclass` (`classid`, `classname`, `poster`, `template`, `displayorder`) VALUES
(1, '生活/聚会', 0, '费用说明：\r\n集合地点：\r\n着装要求：\r\n联系方式：\r\n注意事项：', 1),
(2, '出行/旅游', 0, '路线说明:\r\n费用说明:\r\n装备要求:\r\n交通工具:\r\n集合地点:\r\n联系方式:\r\n注意事项:', 2),
(3, '比赛/运动', 0, '费用说明：\r\n集合地点：\r\n着装要求：\r\n场地介绍：\r\n联系方式：\r\n注意事项：', 4),
(4, '电影/演出', 0, '剧情介绍：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：', 3),
(5, '教育/讲座', 0, '主办单位：\r\n活动主题：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：', 5),
(6, '其它', 0, '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventfield`
--

CREATE TABLE IF NOT EXISTS `uchome_eventfield` (
  `eventid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `limitnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `allowpic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowfellow` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventinvite`
--

CREATE TABLE IF NOT EXISTS `uchome_eventinvite` (
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tousername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`,`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventpic`
--

CREATE TABLE IF NOT EXISTS `uchome_eventpic` (
  `picid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`picid`),
  KEY `eventid` (`eventid`,`picid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_feed`
--

CREATE TABLE IF NOT EXISTS `uchome_feed` (
  `feedid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `dateline` (`dateline`),
  KEY `hot` (`hot`),
  KEY `id` (`id`,`idtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uchome_feed`
--

INSERT INTO `uchome_feed` (`feedid`, `appid`, `icon`, `uid`, `username`, `dateline`, `friend`, `hash_template`, `hash_data`, `title_template`, `title_data`, `body_template`, `body_data`, `body_general`, `image_1`, `image_1_link`, `image_2`, `image_2_link`, `image_3`, `image_3_link`, `image_4`, `image_4_link`, `target_ids`, `id`, `idtype`, `hot`) VALUES
(1, 1, 'profile', 1, 'test', 1422844167, 0, '3a7101a64ea7927f0b3f5179b7a457b3', 'ec7d775d9211880bca2ba1d401e3bcb9', '{actor} 开通了自己的个人主页', 'a:0:{}', '', 'a:0:{}', '', '', '', '', '', '', '', '', '', '', 0, '', 0),
(2, 1, 'thunder', 0, 'test', 1422844546, 0, '16c1e06f22720ee9995bc3d860bd466b', '17e28e2afad7bef6e9b29525c982be97', '<strong>{username} 发出了“雷鸣之声”</strong>', 'a:2:{s:3:"uid";s:1:"1";s:8:"username";s:34:"<a href="space.php?uid=1">test</a>";}', '大家好，我上线啦<br><a href="space.php?uid={uid}" target="_blank">欢迎来我家串个门</a>', 'a:2:{s:3:"uid";s:1:"1";s:13:"magic_thunder";s:1:"1";}', '', 'http://localhost/ucenter/ucenter/images/noavatar_middle.gif', 'space.php?uid=1', '', '', '', '', '', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friend`
--

CREATE TABLE IF NOT EXISTS `uchome_friend` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `note` varchar(50) NOT NULL DEFAULT '',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`),
  KEY `fuid` (`fuid`),
  KEY `status` (`uid`,`status`,`num`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friendguide`
--

CREATE TABLE IF NOT EXISTS `uchome_friendguide` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`),
  KEY `uid` (`uid`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friendlog`
--

CREATE TABLE IF NOT EXISTS `uchome_friendlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_invite`
--

CREATE TABLE IF NOT EXISTS `uchome_invite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `code` varchar(20) NOT NULL DEFAULT '',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_log`
--

CREATE TABLE IF NOT EXISTS `uchome_log` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magic`
--

CREATE TABLE IF NOT EXISTS `uchome_magic` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `forbiddengid` text NOT NULL,
  `charge` smallint(6) unsigned NOT NULL DEFAULT '0',
  `experience` smallint(6) unsigned NOT NULL DEFAULT '0',
  `provideperoid` int(10) unsigned NOT NULL DEFAULT '0',
  `providecount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `useperoid` int(10) unsigned NOT NULL DEFAULT '0',
  `usecount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `custom` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_magic`
--

INSERT INTO `uchome_magic` (`mid`, `name`, `description`, `forbiddengid`, `charge`, `experience`, `provideperoid`, `providecount`, `useperoid`, `usecount`, `displayorder`, `custom`, `close`) VALUES
('invisible', '隐身草', '让自己隐身登录，不显示在线，24小时内有效', '', 50, 5, 86400, 10, 86400, 1, 0, '', 0),
('friendnum', '好友增容卡', '在允许添加的最多好友数限制外，增加10个好友名额', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('attachsize', '附件增容卡', '使用一次，可以给自己增加 10M 的附件空间', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('thunder', '雷鸣之声', '发布一条全站信息，让大家知道自己上线了', '', 500, 5, 86400, 5, 86400, 1, 0, '', 0),
('updateline', '救生圈', '把指定对象的发布时间更新为当前时间', '', 200, 5, 86400, 999, 0, 1, 0, '', 0),
('downdateline', '时空机', '把指定对象的发布时间修改为过去的时间', '', 250, 5, 86400, 999, 0, 1, 0, '', 0),
('color', '彩色灯', '把指定对象的标题变成彩色的', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('hot', '热点灯', '把指定对象的热度增加站点推荐的热点值', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('visit', '互访卡', '随机选择10个好友，向其打招呼、留言或访问空间', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('icon', '彩虹蛋', '给指定对象的标题前面增加图标（最多8个图标）', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('flicker', '彩虹炫', '让评论、留言的文字闪烁起来', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('gift', '红包卡', '在自己的空间埋下积分红包送给来访者', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('superstar', '超级明星', '在个人主页，给自己的头像增加超级明星标识', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('viewmagiclog', '八卦镜', '查看指定用户最近使用的道具记录', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('viewmagic', '透视镜', '查看指定用户当前持有的道具', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('viewvisitor', '偷窥镜', '查看指定用户最近访问过的10个空间', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('call', '点名卡', '发通知给自己的好友，让他们来查看指定的对象', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('coupon', '代金券', '购买道具时折换一定量的积分', '', 0, 0, 0, 0, 0, 1, 0, '', 0),
('frame', '相框', '给自己的照片添上相框', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('bgimage', '信纸', '给指定的对象添加信纸背景', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('doodle', '涂鸦板', '允许在留言、评论等操作时使用涂鸦板', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('anonymous', '匿名卡', '在指定的地方，让自己的名字显示为匿名', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('reveal', '照妖镜', '可以查看一次匿名用户的真实身份', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('license', '道具转让许可证', '使用许可证，将道具赠送给指定好友', '', 10, 1, 3600, 999, 0, 1, 0, '', 0),
('detector', '探测器', '探测埋了红包的空间', '', 10, 1, 86400, 999, 0, 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicinlog`
--

CREATE TABLE IF NOT EXISTS `uchome_magicinlog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fromid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `type` (`type`,`fromid`,`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uchome_magicinlog`
--

INSERT INTO `uchome_magicinlog` (`logid`, `uid`, `username`, `mid`, `count`, `type`, `fromid`, `credit`, `dateline`) VALUES
(1, 1, 'test', 'thunder', 1, 1, 0, 500, 1422844543);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicstore`
--

CREATE TABLE IF NOT EXISTS `uchome_magicstore` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `storage` smallint(6) unsigned NOT NULL DEFAULT '0',
  `lastprovide` int(10) unsigned NOT NULL DEFAULT '0',
  `sellcount` int(8) unsigned NOT NULL DEFAULT '0',
  `sellcredit` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_magicstore`
--

INSERT INTO `uchome_magicstore` (`mid`, `storage`, `lastprovide`, `sellcount`, `sellcredit`) VALUES
('thunder', 4, 1422844243, 1, 500),
('gift', 999, 1422844518, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicuselog`
--

CREATE TABLE IF NOT EXISTS `uchome_magicuselog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`mid`),
  KEY `id` (`id`,`idtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uchome_magicuselog`
--

INSERT INTO `uchome_magicuselog` (`logid`, `uid`, `username`, `mid`, `id`, `idtype`, `count`, `data`, `dateline`, `expire`) VALUES
(1, 1, 'test', 'thunder', 0, '', 1, '', 1422844546, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mailcron`
--

CREATE TABLE IF NOT EXISTS `uchome_mailcron` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `sendtime` (`sendtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mailqueue`
--

CREATE TABLE IF NOT EXISTS `uchome_mailqueue` (
  `qid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`),
  KEY `mcid` (`cid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_member`
--

CREATE TABLE IF NOT EXISTS `uchome_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uchome_member`
--

INSERT INTO `uchome_member` (`uid`, `username`, `password`) VALUES
(1, 'test', 'f61063b23ad7f5086f421a470978ca93');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mtag`
--

CREATE TABLE IF NOT EXISTS `uchome_mtag` (
  `tagid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(40) NOT NULL DEFAULT '',
  `fieldid` smallint(6) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `postnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `announcement` text NOT NULL,
  `pic` varchar(150) NOT NULL DEFAULT '',
  `closeapply` tinyint(1) NOT NULL DEFAULT '0',
  `joinperm` tinyint(1) NOT NULL DEFAULT '0',
  `viewperm` tinyint(1) NOT NULL DEFAULT '0',
  `threadperm` tinyint(1) NOT NULL DEFAULT '0',
  `postperm` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `moderator` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagid`),
  KEY `tagname` (`tagname`),
  KEY `threadnum` (`threadnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mtaginvite`
--

CREATE TABLE IF NOT EXISTS `uchome_mtaginvite` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_myapp`
--

CREATE TABLE IF NOT EXISTS `uchome_myapp` (
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displaymethod` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `flag` (`flag`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_myinvite`
--

CREATE TABLE IF NOT EXISTS `uchome_myinvite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `myml` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `uid` (`touid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_notification`
--

CREATE TABLE IF NOT EXISTS `uchome_notification` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`new`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_pic`
--

CREATE TABLE IF NOT EXISTS `uchome_pic` (
  `picid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `albumid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `postip` varchar(20) NOT NULL DEFAULT '',
  `filename` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `filepath` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `click_6` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_7` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_8` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_9` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_10` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magicframe` tinyint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`picid`),
  KEY `albumid` (`albumid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_picfield`
--

CREATE TABLE IF NOT EXISTS `uchome_picfield` (
  `picid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`picid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_poke`
--

CREATE TABLE IF NOT EXISTS `uchome_poke` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromusername` varchar(15) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fromuid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_poll`
--

CREATE TABLE IF NOT EXISTS `uchome_poll` (
  `pid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `voternum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoice` tinyint(3) NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `percredit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `lastvote` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `voternum` (`voternum`),
  KEY `dateline` (`dateline`),
  KEY `lastvote` (`lastvote`),
  KEY `hot` (`hot`),
  KEY `percredit` (`percredit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_pollfield`
--

CREATE TABLE IF NOT EXISTS `uchome_pollfield` (
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `summary` text NOT NULL,
  `option` text NOT NULL,
  `invite` text NOT NULL,
  `hotuser` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_polloption`
--

CREATE TABLE IF NOT EXISTS `uchome_polloption` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_polluser`
--

CREATE TABLE IF NOT EXISTS `uchome_polluser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`pid`),
  KEY `pid` (`pid`,`dateline`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_post`
--

CREATE TABLE IF NOT EXISTS `uchome_post` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT '',
  `isthread` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_profield`
--

CREATE TABLE IF NOT EXISTS `uchome_profield` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `inputnum` smallint(3) unsigned NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `mtagminnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `manualmoderator` tinyint(1) NOT NULL DEFAULT '0',
  `manualmember` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `uchome_profield`
--

INSERT INTO `uchome_profield` (`fieldid`, `title`, `note`, `formtype`, `inputnum`, `choice`, `mtagminnum`, `manualmoderator`, `manualmember`, `displayorder`) VALUES
(1, '自由联盟', '', 'text', 100, '', 0, 0, 1, 0),
(2, '地区联盟', '', 'text', 100, '', 0, 0, 1, 0),
(3, '兴趣联盟', '', 'text', 100, '', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_profilefield`
--

CREATE TABLE IF NOT EXISTS `uchome_profilefield` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `maxsize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_report`
--

CREATE TABLE IF NOT EXISTS `uchome_report` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `uids` text NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `id` (`id`,`idtype`,`num`,`dateline`),
  KEY `new` (`new`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_session`
--

CREATE TABLE IF NOT EXISTS `uchome_session` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `magichidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `lastactivity` (`lastactivity`),
  KEY `ip` (`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_session`
--

INSERT INTO `uchome_session` (`uid`, `username`, `password`, `lastactivity`, `ip`, `magichidden`) VALUES
(1, 'test', 'f61063b23ad7f5086f421a470978ca93', 1422844547, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_share`
--

CREATE TABLE IF NOT EXISTS `uchome_share` (
  `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title_template` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_link` varchar(255) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `hot` (`hot`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_show`
--

CREATE TABLE IF NOT EXISTS `uchome_show` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `credit` (`credit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_space`
--

CREATE TABLE IF NOT EXISTS `uchome_space` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` int(10) NOT NULL DEFAULT '0',
  `experience` int(10) NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `namestatus` tinyint(1) NOT NULL DEFAULT '0',
  `videostatus` tinyint(1) NOT NULL DEFAULT '0',
  `domain` char(15) NOT NULL DEFAULT '',
  `friendnum` int(10) unsigned NOT NULL DEFAULT '0',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0',
  `notenum` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `mtaginvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventinvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `myinvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pokenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doingnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blognum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `albumnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threadnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsearch` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsend` int(10) unsigned NOT NULL DEFAULT '0',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `newpm` smallint(6) unsigned NOT NULL DEFAULT '0',
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `mood` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `domain` (`domain`),
  KEY `ip` (`ip`),
  KEY `updatetime` (`updatetime`),
  KEY `mood` (`mood`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_space`
--

INSERT INTO `uchome_space` (`uid`, `groupid`, `credit`, `experience`, `username`, `name`, `namestatus`, `videostatus`, `domain`, `friendnum`, `viewnum`, `notenum`, `addfriendnum`, `mtaginvitenum`, `eventinvitenum`, `myinvitenum`, `pokenum`, `doingnum`, `blognum`, `albumnum`, `threadnum`, `pollnum`, `eventnum`, `sharenum`, `dateline`, `updatetime`, `lastsearch`, `lastpost`, `lastlogin`, `lastsend`, `attachsize`, `addsize`, `addfriend`, `flag`, `newpm`, `avatar`, `regip`, `ip`, `mood`) VALUES
(1, 1, 24500, 20, 'test', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1422844167, 0, 0, 0, 1422844167, 0, 0, 0, 0, 1, 0, 0, 'unknown', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spacefield`
--

CREATE TABLE IF NOT EXISTS `uchome_spacefield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `newemail` varchar(100) NOT NULL DEFAULT '',
  `emailcheck` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(40) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `msn` varchar(80) NOT NULL DEFAULT '',
  `msnrobot` varchar(15) NOT NULL DEFAULT '',
  `msncstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videopic` varchar(32) NOT NULL DEFAULT '',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `blood` varchar(5) NOT NULL DEFAULT '',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `birthprovince` varchar(20) NOT NULL DEFAULT '',
  `birthcity` varchar(20) NOT NULL DEFAULT '',
  `resideprovince` varchar(20) NOT NULL DEFAULT '',
  `residecity` varchar(20) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `spacenote` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `theme` varchar(20) NOT NULL DEFAULT '',
  `nocss` tinyint(1) NOT NULL DEFAULT '0',
  `menunum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `css` text NOT NULL,
  `privacy` text NOT NULL,
  `friend` mediumtext NOT NULL,
  `feedfriend` mediumtext NOT NULL,
  `sendmail` text NOT NULL,
  `magicstar` tinyint(1) NOT NULL DEFAULT '0',
  `magicexpire` int(10) unsigned NOT NULL DEFAULT '0',
  `timeoffset` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_spacefield`
--

INSERT INTO `uchome_spacefield` (`uid`, `sex`, `email`, `newemail`, `emailcheck`, `mobile`, `qq`, `msn`, `msnrobot`, `msncstatus`, `videopic`, `birthyear`, `birthmonth`, `birthday`, `blood`, `marry`, `birthprovince`, `birthcity`, `resideprovince`, `residecity`, `note`, `spacenote`, `authstr`, `theme`, `nocss`, `menunum`, `css`, `privacy`, `friend`, `feedfriend`, `sendmail`, `magicstar`, `magicexpire`, `timeoffset`) VALUES
(1, 0, '', '', 0, '', '', '', '', 0, '', 0, 0, 0, '', 0, '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spaceinfo`
--

CREATE TABLE IF NOT EXISTS `uchome_spaceinfo` (
  `infoid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `startyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `endyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `startmonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `endmonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`infoid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spacelog`
--

CREATE TABLE IF NOT EXISTS `uchome_spacelog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `opuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opusername` char(15) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_stat`
--

CREATE TABLE IF NOT EXISTS `uchome_stat` (
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `login` smallint(6) unsigned NOT NULL DEFAULT '0',
  `register` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invite` smallint(6) unsigned NOT NULL DEFAULT '0',
  `appinvite` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doing` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blog` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pic` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll` smallint(6) unsigned NOT NULL DEFAULT '0',
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  `share` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thread` smallint(6) unsigned NOT NULL DEFAULT '0',
  `docomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blogcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `piccomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollvote` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventjoin` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharecomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `post` smallint(6) unsigned NOT NULL DEFAULT '0',
  `wall` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poke` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`daytime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_stat`
--

INSERT INTO `uchome_stat` (`daytime`, `login`, `register`, `invite`, `appinvite`, `doing`, `blog`, `pic`, `poll`, `event`, `share`, `thread`, `docomment`, `blogcomment`, `piccomment`, `pollcomment`, `pollvote`, `eventcomment`, `eventjoin`, `sharecomment`, `post`, `wall`, `poke`, `click`) VALUES
(20150202, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_statuser`
--

CREATE TABLE IF NOT EXISTS `uchome_statuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(20) NOT NULL DEFAULT '',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_statuser`
--

INSERT INTO `uchome_statuser` (`uid`, `daytime`, `type`) VALUES
(1, 0, 'login');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tag`
--

CREATE TABLE IF NOT EXISTS `uchome_tag` (
  `tagid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` char(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `blognum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`),
  KEY `tagname` (`tagname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tagblog`
--

CREATE TABLE IF NOT EXISTS `uchome_tagblog` (
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `blogid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`,`blogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tagspace`
--

CREATE TABLE IF NOT EXISTS `uchome_tagspace` (
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `grade` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`,`uid`),
  KEY `grade` (`tagid`,`grade`),
  KEY `uid` (`uid`,`grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_task`
--

CREATE TABLE IF NOT EXISTS `uchome_task` (
  `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttype` varchar(20) NOT NULL DEFAULT '',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `uchome_task`
--

INSERT INTO `uchome_task` (`taskid`, `available`, `name`, `note`, `num`, `maxnum`, `image`, `filename`, `starttime`, `endtime`, `nexttime`, `nexttype`, `credit`, `displayorder`) VALUES
(1, 1, '更新一下自己的头像', '头像就是你在这里的个人形象。<br>设置自己的头像后，会让更多的朋友记住您。', 0, 0, 'image/task/avatar.gif', 'avatar.php', 0, 0, 0, '', 20, 1),
(2, 1, '将个人资料补充完整', '把自己的个人资料填写完整吧。<br>这样您会被更多的朋友找到的，系统也会帮您找到朋友。', 0, 0, 'image/task/profile.gif', 'profile.php', 0, 0, 0, '2', 20, 0),
(3, 1, '发表自己的第一篇日志', '现在，就写下自己的第一篇日志吧。<br>与大家一起分享自己的生活感悟。', 0, 0, 'image/task/blog.gif', 'blog.php', 0, 0, 0, '', 5, 3),
(4, 1, '寻找并添加五位好友', '有了好友，您发的日志、图片等会被好友及时看到并传播出去；<br>您也会在首页方便及时的看到好友的最新动态。', 0, 0, 'image/task/friend.gif', 'friend.php', 0, 0, 0, '', 50, 4),
(5, 1, '验证激活自己的邮箱', '填写自己真实的邮箱地址并验证通过。<br>您可以在忘记密码的时候使用该邮箱取回自己的密码；<br>还可以及时接受站内的好友通知等等。', 0, 0, 'image/task/email.gif', 'email.php', 0, 0, 0, '', 10, 5),
(6, 1, '邀请10个新朋友加入', '邀请一下自己的QQ好友或者邮箱联系人，让亲朋好友一起来加入我们吧。', 0, 0, 'image/task/friend.gif', 'invite.php', 0, 0, 0, '', 100, 6),
(7, 1, '领取每日访问大礼包', '每天登录访问自己的主页，就可领取大礼包。', 0, 0, 'image/task/gift.gif', 'gift.php', 0, 0, 0, 'day', 5, 99);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_thread`
--

CREATE TABLE IF NOT EXISTS `uchome_thread` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `magiccolor` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `magicegg` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastauthor` char(15) NOT NULL DEFAULT '',
  `lastauthorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `click_11` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_12` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_13` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_14` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_15` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `tagid` (`tagid`,`displayorder`,`lastpost`),
  KEY `uid` (`uid`,`lastpost`),
  KEY `lastpost` (`lastpost`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `eventid` (`eventid`,`lastpost`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_topic`
--

CREATE TABLE IF NOT EXISTS `uchome_topic` (
  `topicid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `jointype` varchar(255) NOT NULL DEFAULT '',
  `joingid` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(100) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `joinnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topicid`),
  KEY `lastpost` (`lastpost`),
  KEY `joinnum` (`joinnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_topicuser`
--

CREATE TABLE IF NOT EXISTS `uchome_topicuser` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userapp`
--

CREATE TABLE IF NOT EXISTS `uchome_userapp` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `allowsidenav` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowprofilelink` tinyint(1) NOT NULL DEFAULT '0',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `menuorder` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`appid`),
  KEY `menuorder` (`uid`,`menuorder`),
  KEY `displayorder` (`uid`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userappfield`
--

CREATE TABLE IF NOT EXISTS `uchome_userappfield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profilelink` text NOT NULL,
  `myml` text NOT NULL,
  KEY `uid` (`uid`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userevent`
--

CREATE TABLE IF NOT EXISTS `uchome_userevent` (
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fellow` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventid`,`uid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `eventid` (`eventid`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usergroup`
--

CREATE TABLE IF NOT EXISTS `uchome_usergroup` (
  `gid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `grouptitle` varchar(20) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `banvisit` tinyint(1) NOT NULL DEFAULT '0',
  `explower` int(10) NOT NULL DEFAULT '0',
  `maxfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxattachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `searchinterval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `searchignore` tinyint(1) NOT NULL DEFAULT '0',
  `postinterval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `spamignore` tinyint(1) NOT NULL DEFAULT '0',
  `videophotoignore` tinyint(1) NOT NULL DEFAULT '0',
  `allowblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowdoing` tinyint(1) NOT NULL DEFAULT '0',
  `allowupload` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowmtag` tinyint(1) NOT NULL DEFAULT '0',
  `allowthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowcss` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoke` tinyint(1) NOT NULL DEFAULT '0',
  `allowfriend` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowclick` tinyint(1) NOT NULL DEFAULT '0',
  `allowevent` tinyint(1) NOT NULL DEFAULT '0',
  `allowmagic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewvideopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowmyop` tinyint(1) NOT NULL DEFAULT '0',
  `allowtopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowstat` tinyint(1) NOT NULL DEFAULT '0',
  `magicdiscount` tinyint(1) NOT NULL DEFAULT '0',
  `verifyevent` tinyint(1) NOT NULL DEFAULT '0',
  `edittrail` tinyint(1) NOT NULL DEFAULT '0',
  `domainlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `closeignore` tinyint(1) NOT NULL DEFAULT '0',
  `seccode` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `manageconfig` tinyint(1) NOT NULL DEFAULT '0',
  `managenetwork` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofilefield` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofield` tinyint(1) NOT NULL DEFAULT '0',
  `manageusergroup` tinyint(1) NOT NULL DEFAULT '0',
  `managefeed` tinyint(1) NOT NULL DEFAULT '0',
  `manageshare` tinyint(1) NOT NULL DEFAULT '0',
  `managedoing` tinyint(1) NOT NULL DEFAULT '0',
  `manageblog` tinyint(1) NOT NULL DEFAULT '0',
  `managetag` tinyint(1) NOT NULL DEFAULT '0',
  `managetagtpl` tinyint(1) NOT NULL DEFAULT '0',
  `managealbum` tinyint(1) NOT NULL DEFAULT '0',
  `managecomment` tinyint(1) NOT NULL DEFAULT '0',
  `managemtag` tinyint(1) NOT NULL DEFAULT '0',
  `managethread` tinyint(1) NOT NULL DEFAULT '0',
  `manageevent` tinyint(1) NOT NULL DEFAULT '0',
  `manageeventclass` tinyint(1) NOT NULL DEFAULT '0',
  `managecensor` tinyint(1) NOT NULL DEFAULT '0',
  `managead` tinyint(1) NOT NULL DEFAULT '0',
  `managesitefeed` tinyint(1) NOT NULL DEFAULT '0',
  `managebackup` tinyint(1) NOT NULL DEFAULT '0',
  `manageblock` tinyint(1) NOT NULL DEFAULT '0',
  `managetemplate` tinyint(1) NOT NULL DEFAULT '0',
  `managestat` tinyint(1) NOT NULL DEFAULT '0',
  `managecache` tinyint(1) NOT NULL DEFAULT '0',
  `managecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managecron` tinyint(1) NOT NULL DEFAULT '0',
  `managename` tinyint(1) NOT NULL DEFAULT '0',
  `manageapp` tinyint(1) NOT NULL DEFAULT '0',
  `managetask` tinyint(1) NOT NULL DEFAULT '0',
  `managereport` tinyint(1) NOT NULL DEFAULT '0',
  `managepoll` tinyint(1) NOT NULL DEFAULT '0',
  `manageclick` tinyint(1) NOT NULL DEFAULT '0',
  `managemagic` tinyint(1) NOT NULL DEFAULT '0',
  `managemagiclog` tinyint(1) NOT NULL DEFAULT '0',
  `managebatch` tinyint(1) NOT NULL DEFAULT '0',
  `managedelspace` tinyint(1) NOT NULL DEFAULT '0',
  `managetopic` tinyint(1) NOT NULL DEFAULT '0',
  `manageip` tinyint(1) NOT NULL DEFAULT '0',
  `managehotuser` tinyint(1) NOT NULL DEFAULT '0',
  `managedefaultuser` tinyint(1) NOT NULL DEFAULT '0',
  `managespacegroup` tinyint(1) NOT NULL DEFAULT '0',
  `managespaceinfo` tinyint(1) NOT NULL DEFAULT '0',
  `managespacecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managespacenote` tinyint(1) NOT NULL DEFAULT '0',
  `managevideophoto` tinyint(1) NOT NULL DEFAULT '0',
  `managelog` tinyint(1) NOT NULL DEFAULT '0',
  `magicaward` text NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `uchome_usergroup`
--

INSERT INTO `uchome_usergroup` (`gid`, `grouptitle`, `system`, `banvisit`, `explower`, `maxfriendnum`, `maxattachsize`, `allowhtml`, `allowcomment`, `searchinterval`, `searchignore`, `postinterval`, `spamignore`, `videophotoignore`, `allowblog`, `allowdoing`, `allowupload`, `allowshare`, `allowmtag`, `allowthread`, `allowpost`, `allowcss`, `allowpoke`, `allowfriend`, `allowpoll`, `allowclick`, `allowevent`, `allowmagic`, `allowpm`, `allowviewvideopic`, `allowmyop`, `allowtopic`, `allowstat`, `magicdiscount`, `verifyevent`, `edittrail`, `domainlength`, `closeignore`, `seccode`, `color`, `icon`, `manageconfig`, `managenetwork`, `manageprofilefield`, `manageprofield`, `manageusergroup`, `managefeed`, `manageshare`, `managedoing`, `manageblog`, `managetag`, `managetagtpl`, `managealbum`, `managecomment`, `managemtag`, `managethread`, `manageevent`, `manageeventclass`, `managecensor`, `managead`, `managesitefeed`, `managebackup`, `manageblock`, `managetemplate`, `managestat`, `managecache`, `managecredit`, `managecron`, `managename`, `manageapp`, `managetask`, `managereport`, `managepoll`, `manageclick`, `managemagic`, `managemagiclog`, `managebatch`, `managedelspace`, `managetopic`, `manageip`, `managehotuser`, `managedefaultuser`, `managespacegroup`, `managespaceinfo`, `managespacecredit`, `managespacenote`, `managevideophoto`, `managelog`, `magicaward`) VALUES
(1, '站点管理员', -1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 'red', 'image/group/admin.gif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ''),
(2, '信息管理员', -1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, 1, 0, 'blue', 'image/group/infor.gif', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3, '贵宾VIP', 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 3, 0, 0, 'green', 'image/group/vip.gif', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, '受限会员', 0, 0, -999999999, 10, 10, 0, 0, 600, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, '普通会员', 0, 0, 0, 100, 20, 0, 1, 60, 0, 60, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6, '中级会员', 0, 0, 100, 200, 50, 0, 1, 30, 0, 30, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 5, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7, '高级会员', 0, 0, 1000, 300, 100, 1, 1, 10, 1, 10, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8, '禁止发言', -1, 0, 0, 1, 1, 0, 0, 9999, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 99, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(9, '禁止访问', -1, 1, 0, 1, 1, 0, 0, 9999, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 99, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userlog`
--

CREATE TABLE IF NOT EXISTS `uchome_userlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usermagic`
--

CREATE TABLE IF NOT EXISTS `uchome_usermagic` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_usermagic`
--

INSERT INTO `uchome_usermagic` (`uid`, `username`, `mid`, `count`) VALUES
(1, 'test', 'thunder', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usertask`
--

CREATE TABLE IF NOT EXISTS `uchome_usertask` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `isignore` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`taskid`),
  KEY `isignore` (`isignore`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_visitor`
--

CREATE TABLE IF NOT EXISTS `uchome_visitor` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`vuid`),
  KEY `dateline` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_admins`
--

CREATE TABLE IF NOT EXISTS `uc_admins` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_applications`
--

CREATE TABLE IF NOT EXISTS `uc_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `authkey` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `viewprourl` varchar(255) NOT NULL,
  `apifilename` varchar(30) NOT NULL DEFAULT 'uc.php',
  `charset` varchar(8) NOT NULL DEFAULT '',
  `dbcharset` varchar(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` text NOT NULL,
  `tagtemplates` text NOT NULL,
  `allowips` text NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uc_applications`
--

INSERT INTO `uc_applications` (`appid`, `type`, `name`, `url`, `authkey`, `ip`, `viewprourl`, `apifilename`, `charset`, `dbcharset`, `synlogin`, `recvnote`, `extra`, `tagtemplates`, `allowips`) VALUES
(1, 'UCHOME', '个人家园', 'http://localhost/ucenter/uchome', 'k721tbBaiaY7x4d9P5C8I516L1e7AbY94eXehdRdgbAdufw2FfDcn2ScM0O0E6c5', '', '', 'uc.php', 'utf-8', 'utf8', 1, 1, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="template"><![CDATA[<a href="{url}" target="_blank">{subject}</a>]]></item>\r\n	<item id="fields">\r\n		<item id="subject"><![CDATA[日志标题]]></item>\r\n		<item id="uid"><![CDATA[用户 ID]]></item>\r\n		<item id="username"><![CDATA[用户名]]></item>\r\n		<item id="dateline"><![CDATA[日期]]></item>\r\n		<item id="spaceurl"><![CDATA[空间地址]]></item>\r\n		<item id="url"><![CDATA[日志地址]]></item>\r\n	</item>\r\n</root>', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_badwords`
--

CREATE TABLE IF NOT EXISTS `uc_badwords` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `find` (`find`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_domains`
--

CREATE TABLE IF NOT EXISTS `uc_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_failedlogins`
--

CREATE TABLE IF NOT EXISTS `uc_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_feeds`
--

CREATE TABLE IF NOT EXISTS `uc_feeds` (
  `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_friends`
--

CREATE TABLE IF NOT EXISTS `uc_friends` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`version`),
  KEY `uid` (`uid`),
  KEY `friendid` (`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_mailqueue`
--

CREATE TABLE IF NOT EXISTS `uc_mailqueue` (
  `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `failures` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailid`),
  KEY `appid` (`appid`),
  KEY `level` (`level`,`failures`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_memberfields`
--

CREATE TABLE IF NOT EXISTS `uc_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL,
  `blacklist` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_memberfields`
--

INSERT INTO `uc_memberfields` (`uid`, `blacklist`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_members`
--

CREATE TABLE IF NOT EXISTS `uc_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uc_members`
--

INSERT INTO `uc_members` (`uid`, `username`, `password`, `email`, `myid`, `myidkey`, `regip`, `regdate`, `lastloginip`, `lastlogintime`, `salt`, `secques`) VALUES
(1, 'test', '7f14d88245b5c4138608e191668e7587', 'test@126.com', '', '', 'unknown', 1422844149, 0, 0, '64a1cf', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_mergemembers`
--

CREATE TABLE IF NOT EXISTS `uc_mergemembers` (
  `appid` smallint(6) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  PRIMARY KEY (`appid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_newpm`
--

CREATE TABLE IF NOT EXISTS `uc_newpm` (
  `uid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_notelist`
--

CREATE TABLE IF NOT EXISTS `uc_notelist` (
  `noteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `succeednum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app1` tinyint(4) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `closed` (`closed`,`pri`,`noteid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uc_notelist`
--

INSERT INTO `uc_notelist` (`noteid`, `operation`, `closed`, `totalnum`, `succeednum`, `getdata`, `postdata`, `dateline`, `pri`, `app1`) VALUES
(1, 'updateapps', 1, 0, 0, '', '<?xml version="1.0" encoding="ISO-8859-1"?>\r\n<root>\r\n	<item id="1">\r\n		<item id="appid"><![CDATA[1]]></item>\r\n		<item id="type"><![CDATA[UCHOME]]></item>\r\n		<item id="name"><![CDATA[个人家园]]></item>\r\n		<item id="url"><![CDATA[http://localhost/ucenter/uchome]]></item>\r\n		<item id="ip"><![CDATA[]]></item>\r\n		<item id="charset"><![CDATA[utf-8]]></item>\r\n		<item id="synlogin"><![CDATA[1]]></item>\r\n		<item id="extra"><![CDATA[]]></item>\r\n	</item>\r\n	<item id="UC_API"><![CDATA[http://localhost/ucenter/ucenter]]></item>\r\n</root>', 0, 0, 0),
(2, 'updatecreditsettings', 1, 1, 1, '', '', 1422844436, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_indexes`
--

CREATE TABLE IF NOT EXISTS `uc_pm_indexes` (
  `pmid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_lists`
--

CREATE TABLE IF NOT EXISTS `uc_pm_lists` (
  `plid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pmtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  `members` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_max` varchar(17) NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastmessage` text NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `pmtype` (`pmtype`),
  KEY `min_max` (`min_max`),
  KEY `authorid` (`authorid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_members`
--

CREATE TABLE IF NOT EXISTS `uc_pm_members` (
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pmnum` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`plid`,`uid`),
  KEY `isnew` (`isnew`),
  KEY `lastdateline` (`uid`,`lastdateline`),
  KEY `lastupdate` (`uid`,`lastupdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_0`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_0` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_1`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_1` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_2`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_2` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_3`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_3` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_4`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_4` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_5`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_5` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_6`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_6` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_7`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_7` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_8`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_8` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_9`
--

CREATE TABLE IF NOT EXISTS `uc_pm_messages_9` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `plid` (`plid`,`delstatus`,`dateline`),
  KEY `dateline` (`plid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_protectedmembers`
--

CREATE TABLE IF NOT EXISTS `uc_protectedmembers` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_protectedmembers`
--

INSERT INTO `uc_protectedmembers` (`uid`, `username`, `appid`, `dateline`, `admin`) VALUES
(1, 'test', 1, 1422844506, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `uc_settings`
--

CREATE TABLE IF NOT EXISTS `uc_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_settings`
--

INSERT INTO `uc_settings` (`k`, `v`) VALUES
('accessemail', ''),
('censoremail', ''),
('censorusername', ''),
('dateformat', 'y-n-j'),
('doublee', '0'),
('nextnotetime', '0'),
('timeoffset', '28800'),
('privatepmthreadlimit', '25'),
('chatpmthreadlimit', '30'),
('chatpmmemberlimit', '35'),
('pmfloodctrl', '15'),
('pmcenter', '1'),
('sendpmseccode', '1'),
('pmsendregdays', '0'),
('maildefault', 'username@21cn.com'),
('mailsend', '1'),
('mailserver', 'smtp.21cn.com'),
('mailport', '25'),
('mailauth', '1'),
('mailfrom', 'UCenter <username@21cn.com>'),
('mailauth_username', 'username@21cn.com'),
('mailauth_password', 'password'),
('maildelimiter', '0'),
('mailusername', '1'),
('mailsilent', '1'),
('version', '1.6.0'),
('credits', 'a:1:{i:1;a:1:{i:1;a:2:{i:0;s:6:"积分";i:1;s:3:"个";}}}');

-- --------------------------------------------------------

--
-- 表的结构 `uc_sqlcache`
--

CREATE TABLE IF NOT EXISTS `uc_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sqlid`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_tags`
--

CREATE TABLE IF NOT EXISTS `uc_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_vars`
--

CREATE TABLE IF NOT EXISTS `uc_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_vars`
--

INSERT INTO `uc_vars` (`name`, `value`) VALUES
('noteexists', '0'),
('noteexists1', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
