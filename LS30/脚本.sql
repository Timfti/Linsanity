/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.188
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : 192.168.1.188:3306
 Source Schema         : EducationMng

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 19/12/2022 17:26:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Admins
-- ----------------------------
DROP TABLE IF EXISTS `Admins`;
CREATE TABLE `Admins`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Admins
-- ----------------------------
INSERT INTO `Admins` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for Banners
-- ----------------------------
DROP TABLE IF EXISTS `Banners`;
CREATE TABLE `Banners`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BannerUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Banners
-- ----------------------------
INSERT INTO `Banners` VALUES (1, 'upload/20221219132413.jpg');
INSERT INTO `Banners` VALUES (2, 'upload/20221219132427.jpg');
INSERT INTO `Banners` VALUES (3, 'upload/20221219151029.jpg');
INSERT INTO `Banners` VALUES (4, 'upload/20221219151326.jpg');

-- ----------------------------
-- Table structure for CourseChapters
-- ----------------------------
DROP TABLE IF EXISTS `CourseChapters`;
CREATE TABLE `CourseChapters`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseId` int(11) NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of CourseChapters
-- ----------------------------
INSERT INTO `CourseChapters` VALUES (1, 1, '第一章.环境配置', '测试测试11');
INSERT INTO `CourseChapters` VALUES (2, 1, '第二章.HelloWorld', '测试');
INSERT INTO `CourseChapters` VALUES (3, 1, '第三章.数据类型', '测试测试112');
INSERT INTO `CourseChapters` VALUES (5, 2, '第一章.课程介绍', '测试测试');
INSERT INTO `CourseChapters` VALUES (6, 2, '第二章.测试', '测试111');
INSERT INTO `CourseChapters` VALUES (8, 3, '第一章.测试', '测试');
INSERT INTO `CourseChapters` VALUES (9, 3, '第二章.测试', '测试');
INSERT INTO `CourseChapters` VALUES (10, 4, '第一章.测试', '测试');
INSERT INTO `CourseChapters` VALUES (11, 4, '第二章.测试', '测试');

-- ----------------------------
-- Table structure for Courses
-- ----------------------------
DROP TABLE IF EXISTS `Courses`;
CREATE TABLE `Courses`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FilePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TimeLength` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Courses
-- ----------------------------
INSERT INTO `Courses` VALUES (1, 'JAVA开发', 'upload/20221219132724.jpg', '100时', '测试');
INSERT INTO `Courses` VALUES (2, '数据结构', 'upload/20221219132900.jpg', '150时', '测试');
INSERT INTO `Courses` VALUES (3, '测试', 'upload/20221219151040.jpg', '111', '测试');
INSERT INTO `Courses` VALUES (4, '测试赛所所', 'upload/20221219151339.jpg', '111', '测试');

-- ----------------------------
-- Table structure for Knows
-- ----------------------------
DROP TABLE IF EXISTS `Knows`;
CREATE TABLE `Knows`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 381 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Knows
-- ----------------------------
INSERT INTO `Knows` VALUES (1, '教育的本质特点', '理解');
INSERT INTO `Knows` VALUES (2, '教师进行教学的直接依据', '掌握');
INSERT INTO `Knows` VALUES (3, '教育行动研究', '掌握');
INSERT INTO `Knows` VALUES (4, '个体身心发展的规律', '了解');
INSERT INTO `Knows` VALUES (5, '学生主观能动性', '了解');
INSERT INTO `Knows` VALUES (6, '心理起源说', '理解');
INSERT INTO `Knows` VALUES (7, '神话起源说', '了解');
INSERT INTO `Knows` VALUES (8, '生物起源说', '掌握');
INSERT INTO `Knows` VALUES (9, '劳动起源说', '了解');
INSERT INTO `Knows` VALUES (10, '我国体育的目标', '理解');
INSERT INTO `Knows` VALUES (11, '国外最早的教育学著作', '掌握');
INSERT INTO `Knows` VALUES (12, '学校教育', '理解');
INSERT INTO `Knows` VALUES (13, '夸美纽斯', '掌握');
INSERT INTO `Knows` VALUES (14, '赫尔巴特', '掌握');
INSERT INTO `Knows` VALUES (15, '国民教育制度的核心', '掌握');
INSERT INTO `Knows` VALUES (16, '《学记》', '了解');
INSERT INTO `Knows` VALUES (17, '义务教育法', '理解');
INSERT INTO `Knows` VALUES (18, '壬寅学制', '理解');
INSERT INTO `Knows` VALUES (19, '癸卯学制', '理解');
INSERT INTO `Knows` VALUES (20, '壬子癸丑学制', '了解');
INSERT INTO `Knows` VALUES (21, '壬戌学制', '了解');
INSERT INTO `Knows` VALUES (22, '双轨制教育', '掌握');
INSERT INTO `Knows` VALUES (23, '杨贤江', '掌握');
INSERT INTO `Knows` VALUES (24, '教育的规律', '了解');
INSERT INTO `Knows` VALUES (25, '教育方针', '掌握');
INSERT INTO `Knows` VALUES (26, '教育的本质特点是：有目的地培养人\n', '了解');
INSERT INTO `Knows` VALUES (27, '教师进行教学的直接依据是：课程标准\n', '了解');
INSERT INTO `Knows` VALUES (28, '教育行动研究：是指在现实教学中教师在教学情景中的反思并以解决工作情景中所出现的问题\n', '了解');
INSERT INTO `Knows` VALUES (29, '简述家庭和学校联系的基本方式\n1.家访2.班级家长会3.家长沙龙4.家长学校5.家长委员会\n', '了解');
INSERT INTO `Knows` VALUES (30, '个体身心发展的规律：阶段性，顺序性，个别差异性，不平衡性，互补性\n', '理解');
INSERT INTO `Knows` VALUES (31, '现代教育发展的根本动因是科学技术的进步和知识的发展\n', '理解');
INSERT INTO `Knows` VALUES (32, '学生主观能动性：自觉性、独立性、创造性   被动：塑造性\n', '掌握');
INSERT INTO `Knows` VALUES (33, '教育目的的根本问题是要培养什么样的人\n', '掌握');
INSERT INTO `Knows` VALUES (34, '教学是实现教育目的的基本途径\n', '了解');
INSERT INTO `Knows` VALUES (35, '学校教育的一些特殊性有助于学生个体的发展，如目标明确、时间集中、有专人指导\n', '掌握');
INSERT INTO `Knows` VALUES (36, '“建国君民，教学为先”体现的是社会本位论\n', '掌握');
INSERT INTO `Knows` VALUES (37, '心理起源说：孟禄\n神话起源说：朱熹\n生物起源说：利托尔诺 /沛西·能 /桑代克\n劳动起源说：米丁斯基/凯洛夫\n', '了解');
INSERT INTO `Knows` VALUES (38, '我国体育的目标是：\n1.增强体质、增进健康\n2.丰富社会文化生活\n3.提高运动技术水平\n4.提高国民素质\n', '了解');
INSERT INTO `Knows` VALUES (39, '国外最早的教育学著作是《论演说家的教育》---昆体良---模仿-理论-练习\n', '理解');
INSERT INTO `Knows` VALUES (40, '杜威：实用主义（现代教育代言人） 新三中心（儿童、活动、经验） \n倡导“从做中学”\n', '了解');
INSERT INTO `Knows` VALUES (41, '聪明早慧，大器晚成----个别差异性\n关键期或最佳期----不平衡性\n', '理解');
INSERT INTO `Knows` VALUES (42, '狭义的教育主要是指：学校教育\n', '理解');
INSERT INTO `Knows` VALUES (43, '以僧为师，以吏为师---古埃及\n', '掌握');
INSERT INTO `Knows` VALUES (44, '学校教育最早产生于奴隶社会\n义务教育最早产生于德国的资本主义\n', '理解');
INSERT INTO `Knows` VALUES (45, '教育与政治的关系是相互依存相互促进的关系\n', '掌握');
INSERT INTO `Knows` VALUES (46, '夸美纽斯：教育学之父；教师是太阳底下最关辉的职业；\n《大教学论》的发表是教育走向独立发展道路的标志；\n几个教学原则（直观、系统、量力、巩固）；班级授课制；\n自然教育；泛智教育；百科全书式课程 \n', '了解');
INSERT INTO `Knows` VALUES (47, '赫尔巴特：学新知识想旧观念；三中心论（教师，教材，课堂）\n四阶段教学（明了，联想，系统，方法）\n教育与教学相结合\n', '理解');
INSERT INTO `Knows` VALUES (48, '国民教育制度的核心：学校教育制度\n', '了解');
INSERT INTO `Knows` VALUES (49, '世界上最早专门论述教育教学问题的著作---《学记》\n', '掌握');
INSERT INTO `Knows` VALUES (50, '义务教育法：以县级人民政府为主的管理体制\n', '了解');
INSERT INTO `Knows` VALUES (51, '壬寅学制：第一次颁布未实施（1902年）\n癸卯学制：第一次实施并实施  体现“中学为体西学为用” 规定男女不许同校（1904年）\n壬子癸丑学制：第一个资本主义学制 第一次规定男女同校 废止读经尊孔（1912-1913年）\n壬戌学制：以美国学制为蓝本 “六三三学制” 沿用至解放初期（时间最长）\n', '理解');
INSERT INTO `Knows` VALUES (52, '双轨制教育（英国，法国，联邦德国）具有阶级性\n贵族阶级：中学---大学    普通民众：小学---初级职业学校系统\n', '理解');
INSERT INTO `Knows` VALUES (53, '杨贤江：新教育大纲，最早用马克思主义为指导的教育学著作\n', '掌握');
INSERT INTO `Knows` VALUES (54, '舒尔茨---人力资本论---美国\n', '理解');
INSERT INTO `Knows` VALUES (55, '制约人们受教育权利的首要因素是政治制度\n', '理解');
INSERT INTO `Knows` VALUES (56, '教育现代化的最高目标是实现人的现代化\n', '掌握');
INSERT INTO `Knows` VALUES (57, '教育的规律体现在两个方面：教育与社会发展相互制约，教育与人的身心发展相互制约\n', '掌握');
INSERT INTO `Knows` VALUES (58, '学校教育促进人的主体意识提升\n', '掌握');
INSERT INTO `Knows` VALUES (59, '教育方针：为谁培养，培养什么样的人\n教育目的：对人的培养的质量和规格\n', '理解');
INSERT INTO `Knows` VALUES (60, '观察法是教育科学研究中广泛使用的，基本的研究方法\n', '掌握');
INSERT INTO `Knows` VALUES (61, '原始教育没有阶级性\n', '理解');
INSERT INTO `Knows` VALUES (62, '学校文化的核心是观念文化又称精神文化\n', '了解');
INSERT INTO `Knows` VALUES (63, '课外、校外教育在课程计划和学科课程标准之外\n', '掌握');
INSERT INTO `Knows` VALUES (64, '科学技术影响受教育者的数量和教育质量\n', '了解');
INSERT INTO `Knows` VALUES (65, '生产力发展水平决定教育：规模、速度、结构变化、内容、手段\n', '理解');
INSERT INTO `Knows` VALUES (66, '1623 培根 首次把教育作为独立学科， 夸美纽斯来实现\n', '了解');
INSERT INTO `Knows` VALUES (67, '克鲁普斯卡娅是最早以马克思主义为基础探讨教育问题的教育家\n', '了解');
INSERT INTO `Knows` VALUES (68, '陶行知：毛泽东称为“人民的教育家”；提出了“生活即教育”、“社会即学校”、“教学做合一”三大主张，生活教育理论是核心\n', '掌握');
INSERT INTO `Knows` VALUES (69, '单纯强调人的自然属性就会陷入遗传决定论\n', '了解');
INSERT INTO `Knows` VALUES (70, '西周六艺教育：礼、乐、射、御、书、数\n', '掌握');
INSERT INTO `Knows` VALUES (71, '教育史上最早使用“班级”一词的教育家是埃拉斯莫斯（我爱上了班级）\n', '掌握');
INSERT INTO `Knows` VALUES (72, '社会本位论思想：赫尔巴特、柏拉图、孔德、涂尔干\n（造就合格公民）(有位公民拨打恐吓电话，涂害社会)\n个体本位论思想：孟子、罗杰斯、卢梭、福禄贝尔、裴斯泰洛齐\n（孟子啰嗦一路无人陪）\n', '掌握');
INSERT INTO `Knows` VALUES (73, '华生：外铄论 把一打婴儿培养成各种职业\n', '了解');
INSERT INTO `Knows` VALUES (74, '遗传因素在人的发展当中呈现递减趋势\n', '了解');
INSERT INTO `Knows` VALUES (75, '教育一词最早提出者是孟子\n', '了解');
INSERT INTO `Knows` VALUES (76, '亚里士多德第一次提出教育遵循自然\n', '了解');
INSERT INTO `Knows` VALUES (77, '制度化教育是封闭的，基本特征是：制度化，封闭化，学校化\n', '理解');
INSERT INTO `Knows` VALUES (78, '外铄论：荀子、洛克、华生、斯金纳（外婆荀找洛华生和斯金纳）\n内铄论：孟子（性善论）、弗洛伊德、威尔逊、格赛尔（成熟势力说）\n', '掌握');
INSERT INTO `Knows` VALUES (79, '欧洲中世纪的教育内容是七艺和神学  \n七艺包括算法，几何，天文，音乐（四学），文法，修辞，辩证法（三科）\n', '理解');
INSERT INTO `Knows` VALUES (80, '古希腊百科全书：亚里士多德（政治学）\n', '理解');
INSERT INTO `Knows` VALUES (81, '凯洛夫--《教育学》--世界上第一部马克思主义教育学著作\n', '理解');
INSERT INTO `Knows` VALUES (82, '家庭教育对人发展的作用：先导性，针对性，权威性，终身性\n', '理解');
INSERT INTO `Knows` VALUES (83, '现代学制根据选拔分层功能可以划分为：双轨制，单轨制，分支制\n', '掌握');
INSERT INTO `Knows` VALUES (84, '古代教育（奴隶社会）最显著的特点是教育与生产劳动的分离\n', '掌握');
INSERT INTO `Knows` VALUES (85, '教学目标是评价教学成果最客观可靠的标准\n', '理解');
INSERT INTO `Knows` VALUES (86, '制度化教育典型标志：学制的建立\n', '掌握');
INSERT INTO `Knows` VALUES (87, '我国的课程改革：小学：综合  初中：分科和综合  高中：分科\n', '理解');
INSERT INTO `Knows` VALUES (88, '考察事物发生和发展的过程是历史法\n', '理解');
INSERT INTO `Knows` VALUES (89, '各类学校总体系叫学校教育制度\n', '掌握');
INSERT INTO `Knows` VALUES (90, '互补性：自信和努力的品质\n', '掌握');
INSERT INTO `Knows` VALUES (91, '教育的最高理想---教育目的\n', '掌握');
INSERT INTO `Knows` VALUES (92, '许慎---教，上所施，下所效也（《说文解字》）\n', '理解');
INSERT INTO `Knows` VALUES (93, '终身教育论：《教育--财富蕴藏其中》---1965年法国保罗·郎格格提出\n', '掌握');
INSERT INTO `Knows` VALUES (94, '马卡连柯：从事流浪汉和犯罪儿童教育，著有《教育诗》、《论共产主义教育》\n', '了解');
INSERT INTO `Knows` VALUES (95, '课程的文本一般表现为课程计划、课程标准和教科书\n', '理解');
INSERT INTO `Knows` VALUES (96, '真正全面系统论证活动课程价值的是杜威\n', '掌握');
INSERT INTO `Knows` VALUES (97, '基础教育课程改革:是2001年小学阶段以综合课为主，初中阶段设置分科与综合相结合，高中以分科课程为主\n', '理解');
INSERT INTO `Knows` VALUES (98, '综合实践活动课程从小学至高中的必修课\n', '理解');
INSERT INTO `Knows` VALUES (99, '斯宾塞：什么知识最有价值、课程归为教育学专业术语\n', '掌握');
INSERT INTO `Knows` VALUES (100, '课程计划：未经允许不可轻易改动\n', '掌握');
INSERT INTO `Knows` VALUES (101, '制约课程发展的三大因素：学生、知识、社会\n', '理解');
INSERT INTO `Knows` VALUES (102, '课程改革要求改变课程结构过于强调学科本位、科目过多和缺乏整合的现状\n', '理解');
INSERT INTO `Knows` VALUES (103, '课程改革的实质就是课程的现代化问题\n', '掌握');
INSERT INTO `Knows` VALUES (104, '学校课程：特色课程，选修课程的形式出现\n', '理解');
INSERT INTO `Knows` VALUES (105, '杜威：活动中心，活动课程\n', '了解');
INSERT INTO `Knows` VALUES (106, '研究性课程具有活动性课堂的特点\n', '了解');
INSERT INTO `Knows` VALUES (107, '分科课程：逻辑严密，条理清晰\n', '掌握');
INSERT INTO `Knows` VALUES (108, '斯宾塞：什么知识最有价值（把课程用于教育科学的专业术语），实证主义\n', '了解');
INSERT INTO `Knows` VALUES (109, '泰勒：课程目标的主导作用\n', '理解');
INSERT INTO `Knows` VALUES (110, '隐性课程：杰克逊\n', '理解');
INSERT INTO `Knows` VALUES (111, '综合实践活动课程：信息技术教育，研究性学习，社区服务与社会实践，劳动与技术教育\n', '了解');
INSERT INTO `Knows` VALUES (112, '我国学科课程的雏形：六艺（礼乐射御书数）\n', '掌握');
INSERT INTO `Knows` VALUES (113, '教学活动材料---教科书\n', '了解');
INSERT INTO `Knows` VALUES (114, '预期---实际：目的游离评价模式\n', '了解');
INSERT INTO `Knows` VALUES (115, '领会知识是教学过程基本阶段里中心环节，包括：感知教材和理解教材\n', '掌握');
INSERT INTO `Knows` VALUES (116, '课程计划是学校组织教育和教学工作的重要依据\n', '了解');
INSERT INTO `Knows` VALUES (117, '赫尔巴特：教师，教材，课堂中心\n杜威：儿童，活动，经验\n', '掌握');
INSERT INTO `Knows` VALUES (118, '课程内容即教材：夸美纽斯\n', '理解');
INSERT INTO `Knows` VALUES (119, '综合实践活动课程是从小学至高中的必修课\n', '理解');
INSERT INTO `Knows` VALUES (120, '综合课程的形式：相关课程，广域课程，融合课程，核心课程（相域融核）\n', '理解');
INSERT INTO `Knows` VALUES (121, '根据学习要求：分为必修课和选修课\n根据内容属性分：学科课程和活动课程\n', '理解');
INSERT INTO `Knows` VALUES (122, '学科课程最有利于学生系统掌握人类取得的经验和科学知识\n', '掌握');
INSERT INTO `Knows` VALUES (123, '简述国家型课程的特点：强制性；统一性；公共性；基础性；神圣性\n', '掌握');
INSERT INTO `Knows` VALUES (124, '简述分科课程的主要特点：\n（1）从不同的知识体系出发设计课程，强调知识本位\n（2）以知识的逻辑体系为中心编制课程\n（3）重视学科理论知识，强调把各门学科中的基本概念、基本原理、规律和事实教给学生\n', '理解');
INSERT INTO `Knows` VALUES (125, '简述课程的作用：\n1.课程是实现教育目的、培养全面发展的人的保证\n2.课程是教师教和学生学的依据，是联系师生的纽带\n3.课程是教学方法的选择、教学组织形式的确定、教学手段应用的根据\n4.课程是国家对学校教学进行检查和监督的依据\n第三章 中学教学\n', '了解');
INSERT INTO `Knows` VALUES (126, '按评价功能或者作用分，教学评价分为：诊断性，形成性，总结性评价\n安置性测验：分班\n形成性测验：针对教学单元，调控教学\n诊断性测验：找到困难的成因\n总结性测验：一个段落或一门课程结束\n', '掌握');
INSERT INTO `Knows` VALUES (127, '定性评价：评出等级，评语\n', '掌握');
INSERT INTO `Knows` VALUES (128, '“开而弗达”体现了教学的启发性原则\n', '了解');
INSERT INTO `Knows` VALUES (129, '相对评价--常模参照--成绩排名\n绝对评价--目标参照--教学目标\n', '了解');
INSERT INTO `Knows` VALUES (130, '欣赏法：体验真善美\n', '掌握');
INSERT INTO `Knows` VALUES (131, '夸美纽斯（一切知识都从感官的知觉开始）--大教学论：班级授课制（最早从理论上阐述）\n', '理解');
INSERT INTO `Knows` VALUES (132, '班级授课制的特殊形式：复式教学\n', '理解');
INSERT INTO `Knows` VALUES (133, '产婆术----苏格拉底问答法----谈话法\n', '了解');
INSERT INTO `Knows` VALUES (134, '直观性原则：通过形象描述，引导学生思维，丰富学生感性认识\n', '理解');
INSERT INTO `Knows` VALUES (135, '实施启发式教学的关键：创设问题情境\n', '掌握');
INSERT INTO `Knows` VALUES (136, '特朗普制：大班教学、小班研究、个别教学结合起来\n', '了解');
INSERT INTO `Knows` VALUES (137, '非指导性教学----罗杰斯----让学生自由学习\n', '了解');
INSERT INTO `Knows` VALUES (138, '教学过程的特殊性就在于它的教育性（间接性，引导性，简捷性）\n', '理解');
INSERT INTO `Knows` VALUES (139, '在教学过程中，学生以学习间接经验为主\n', '了解');
INSERT INTO `Knows` VALUES (140, '选拔性考试一般是典型的常模参照测验（相对性评价）\n', '了解');
INSERT INTO `Knows` VALUES (141, '教学过程的结构教学是指教学进程的基本阶段\n', '了解');
INSERT INTO `Knows` VALUES (142, '“教学相长”“启发诱导”指的是教学原则\n', '理解');
INSERT INTO `Knows` VALUES (143, '信度：一致性、可信度，稳定性，可靠度\n效度：准确性、能测出想测的东西\n区分度：区分不同水平考生的能力\n难度：难易\n', '掌握');
INSERT INTO `Knows` VALUES (144, '最早出现的教学组织形式：个别教学\n', '掌握');
INSERT INTO `Knows` VALUES (145, '变式：改变非本质特征，突出本质特征\n', '理解');
INSERT INTO `Knows` VALUES (146, '教师成长三阶段：关注生存，关注情境，关注学生\n', '了解');
INSERT INTO `Knows` VALUES (147, '杜威五步教学法：困难、问题、假设、验证、结论（难闻的假睫毛）\n', '了解');
INSERT INTO `Knows` VALUES (148, '备好课是上好课的先决条件\n', '了解');
INSERT INTO `Knows` VALUES (149, '赫尔巴特最早提出教育性原则\n', '了解');
INSERT INTO `Knows` VALUES (150, '赫尔巴特和斯宾塞的实质教育论：传授生活知识，忽略智力培养\n', '理解');
INSERT INTO `Knows` VALUES (151, '古代的中国、埃及、希腊的大学大多采用：个别教学\n', '理解');
INSERT INTO `Knows` VALUES (152, '读书指导法是一种以语言传授为主的方法\n', '了解');
INSERT INTO `Knows` VALUES (153, '教学过程的本质是一种认识过程\n', '了解');
INSERT INTO `Knows` VALUES (154, '1862年清末，癸卯学制，最早开始班级授课制\n', '理解');
INSERT INTO `Knows` VALUES (155, '学校课外活动的基本组织形式是小组活动\n', '了解');
INSERT INTO `Knows` VALUES (156, '探究式教学，又称发现法、研究法，最大的缺点是太耗费时间\n', '了解');
INSERT INTO `Knows` VALUES (157, '保加利学者洛扎诺夫---启发式暗示教学法\n', '掌握');
INSERT INTO `Knows` VALUES (158, '在教学过程中，学生以学习间接经验为主\n', '了解');
INSERT INTO `Knows` VALUES (159, '现代教学的辅助形式有个别教学和现场教学两种\n', '掌握');
INSERT INTO `Knows` VALUES (160, '提出教学目的是教案的核心\n', '了解');
INSERT INTO `Knows` VALUES (161, '教学组织的基本形式是课堂教学\n', '掌握');
INSERT INTO `Knows` VALUES (162, '克伯屈首先提出设计教学法\n', '了解');
INSERT INTO `Knows` VALUES (163, '道尔顿制：美国-道尔顿城教育家---帕克赫斯特首次提出\n', '理解');
INSERT INTO `Knows` VALUES (164, '教学原则是依据教育教学目的和教学过程规律制定的\n', '掌握');
INSERT INTO `Knows` VALUES (165, '巴班斯基：最优理论\n赫尔巴特：四步教学\n布鲁纳：学科知识结构\n凯洛夫：确保学生掌握系统的知识\n', '理解');
INSERT INTO `Knows` VALUES (166, '教师怎样才能上好一堂课\n1.目标明确\n2.内容正确\n3.方法得当\n4.表达清晰\n5.组织严密\n6.气氛热烈\n', '了解');
INSERT INTO `Knows` VALUES (167, '简述学校教学活动的基本环节\n备课、上课、课外作业的布置与反馈、课外辅导、学业成绩的检查与评定，其中，上课是中心环节\n', '理解');
INSERT INTO `Knows` VALUES (168, '教学的基本规律：\n1.教师主导与学生主体相统一的规律\n2.传授知识与思想教育相统一的规律\n3.间接经验与直接经验相统一的规律\n4.掌握知识与发展能力相统一的规律\n', '理解');
INSERT INTO `Knows` VALUES (169, '简述班级授课制的优点\n1.有利于经济有效的，大面积的培养人才\n2.有利于发挥教师的主导作用\n3.有利于发挥班集体的教学作用\n4.有利于学生获得系统的科学知识\n5.有利于学生德智体多方面发展\n6.有利于进行教学管理和教学检查\n', '了解');
INSERT INTO `Knows` VALUES (170, '巩固性教学原则的要求：\n在理解的基础上巩固\n合理组织复习，教会学生记忆的方法\n在扩充，改组和运用知识的过程中巩固知识\n', '理解');
INSERT INTO `Knows` VALUES (171, '简述教学过程的结构：\n1）创设问题情境，引起学生学习动机\n2）引导学生理解、领会知识\n3）课堂练习，巩固知识\n4）引导和组织学生运用知识\n5）布置、批改并辅导学生课外作业，检查学生对知识的理解和运用程度\n', '理解');
INSERT INTO `Knows` VALUES (172, '思维形式包括：概念，判断，推理\n', '掌握');
INSERT INTO `Knows` VALUES (173, '感觉是一切知识和经验的基础，是正常心理活动的必要条件\n', '理解');
INSERT INTO `Knows` VALUES (174, '学习策略包括：认知策略，元认知策略和资源管理策略\n', '理解');
INSERT INTO `Knows` VALUES (175, '“温故而知新”是顺向正迁移\n', '了解');
INSERT INTO `Knows` VALUES (176, '偏旁部首识字是组织策略--列提纲，图画，画表，图形，概括总结\n', '理解');
INSERT INTO `Knows` VALUES (177, '思维的品质：广阔性与深刻性、独立性和批判性、灵活性和敏捷性\n', '掌握');
INSERT INTO `Knows` VALUES (178, '支架式教学，维果斯基的最近发展区，构建主义学习理论\n', '理解');
INSERT INTO `Knows` VALUES (179, '影响创造力发展的因素有：智力、知识、认知风格、人格特征、动机和环境\n', '了解');
INSERT INTO `Knows` VALUES (180, '运气好坏：外在的不稳定的不可控归因\n能力高低：内在的稳定的不可控归因\n身体状况：内在的不稳定的不可控归因\n外界因素：外在的不稳定的不可控的归因\n', '了解');
INSERT INTO `Knows` VALUES (181, '皮亚杰认为个体适应环境的方式是同化和顺应\n', '了解');
INSERT INTO `Knows` VALUES (182, '注意是伴随心理过程的一种心理状态\n', '掌握');
INSERT INTO `Knows` VALUES (183, '从无到有绝对阈限  从有到变差别阈限\n', '理解');
INSERT INTO `Knows` VALUES (184, '感官所能觉察的最小、最弱的刺激量---绝对感受阈限\n个体能够觉察这种微弱刺激量的能力叫绝对感受性 \n', '掌握');
INSERT INTO `Knows` VALUES (185, '记忆的三个过程是编码、保存和提取\n', '理解');
INSERT INTO `Knows` VALUES (186, '人类思维的基本过程是分析和综合，也是最基础的阶段\n', '掌握');
INSERT INTO `Knows` VALUES (187, '注意分配：“一心二用”“眼观六路，耳听八方”\n', '了解');
INSERT INTO `Knows` VALUES (188, '感觉记忆又称瞬时记忆，容量大，形象鲜明，易消退\n', '掌握');
INSERT INTO `Knows` VALUES (189, '气质是指个人生来就具有的心理活动的动力特征（气质-与生俱来）\n', '理解');
INSERT INTO `Knows` VALUES (190, '“一朝被蛇咬，十年怕井绳”是情绪记忆\n', '理解');
INSERT INTO `Knows` VALUES (191, '投射效应是指自己具有某一特性，他人也有这种特性\n', '了解');
INSERT INTO `Knows` VALUES (192, '注意的两种最基本的特性：指向性和集中性\n', '掌握');
INSERT INTO `Knows` VALUES (193, '有意注意（随意注意）：有目的，需要努力\n无意注意（不随意注意）：无目的，不需要努力\n有意后注意（随意后注意）：有目的，不需要注意\n无意注意与有意注意是可以转化的\n', '理解');
INSERT INTO `Knows` VALUES (194, '个体因自己的胜任或工作能力而赢得相应地位的需要，称自我提高内驱力\n', '理解');
INSERT INTO `Knows` VALUES (195, '知觉---整体性\n', '了解');
INSERT INTO `Knows` VALUES (196, '“当机立断”：意志特征\n', '了解');
INSERT INTO `Knows` VALUES (197, '解释遗忘原因理论：\n奥苏泊尔---同化说---知识的组织与认知结构简化\n弗洛伊德---动机说（压抑理论）---不想记起\n', '了解');
INSERT INTO `Knows` VALUES (198, '“以退为进”---爬山法\n', '理解');
INSERT INTO `Knows` VALUES (199, '感知运动阶段：（0-2岁）\n前运算阶段：自我中心，思维不可逆（2-6岁、7岁）\n具体运算阶段的标志：守恒概念的出现，才具有可逆性（6、7-11、12岁）\n形式运算：具有逻辑推理（11、12-14、15岁）\n青少年的思维处于形式运算阶段\n', '理解');
INSERT INTO `Knows` VALUES (200, '远景的间接性动机----学生的社会意义，个人前途\n', '理解');
INSERT INTO `Knows` VALUES (201, '巴甫洛夫的高级神经活动类型说中，对应强，不平衡神经活动类型的气质类型是：胆汁质\n', '掌握');
INSERT INTO `Knows` VALUES (202, '“诗中有画，画中有诗”是一种想象\n', '了解');
INSERT INTO `Knows` VALUES (203, '提出假设是问题解决的关键阶段\n', '了解');
INSERT INTO `Knows` VALUES (204, '艾宾浩斯发现的遗忘规律的进程不均衡，表现为先快后慢，先多后少\n', '掌握');
INSERT INTO `Knows` VALUES (205, '吃了糖以后接着吃桔子会觉得 桔子酸，这是继时对比\n', '掌握');
INSERT INTO `Knows` VALUES (206, '注意的广度---数量   注意的稳定性---时间\n', '掌握');
INSERT INTO `Knows` VALUES (207, '场独立型认知风格：不容易收外界环境影响，因此能够从比较复杂的图形中把隐藏的简单图形分离出来\n', '了解');
INSERT INTO `Knows` VALUES (208, '发散思维---变通，流畅，独特\n', '了解');
INSERT INTO `Knows` VALUES (209, '发散思维也叫求异思维，“头脑风暴”属于发散思维\n', '了解');
INSERT INTO `Knows` VALUES (210, '触景生情属于无意识记\n', '理解');
INSERT INTO `Knows` VALUES (211, '人类思维的基本过程是分析和综合，也是最基础的阶段\n', '掌握');
INSERT INTO `Knows` VALUES (212, '“情人眼里出西施”属于晕轮效应（光环效应）\n', '了解');
INSERT INTO `Knows` VALUES (213, '心理学中的“视觉悬崖”实验说明婴儿具有：深度知觉\n', '掌握');
INSERT INTO `Knows` VALUES (214, '个体自身的成败经验是影响自我效能感的最重要的因素\n', '掌握');
INSERT INTO `Knows` VALUES (215, '感受性与感觉阈限之间的关系是成反比例\n', '理解');
INSERT INTO `Knows` VALUES (216, '提取失败说：是缺乏线索，建立良好的知识结构是为了更好的提取线索\n', '掌握');
INSERT INTO `Knows` VALUES (217, '皮亚杰认为，图式是人类认识事物的基础，图式的形成和变化是认知发展\n', '理解');
INSERT INTO `Knows` VALUES (218, '小考小玩，大考大玩，耶克斯-多德森定律，最佳动机水平\n', '掌握');
INSERT INTO `Knows` VALUES (219, '写作、阅读、运算、解题等所属的技能类型是智力技能\n', '了解');
INSERT INTO `Knows` VALUES (220, '维果斯基--人的高级心理机能--文化历史发展观\n', '了解');
INSERT INTO `Knows` VALUES (221, '心智技能形成--安德森：认知，联结，自动化阶段\n', '了解');
INSERT INTO `Knows` VALUES (222, '皮亚杰：图式：为了应付某一特定情境而产生的认知结构\n同化：把新的刺激整合到已有认知结构中\n顺应：改变原有认知结构，适应新的变化\n', '掌握');
INSERT INTO `Knows` VALUES (223, '知识和日常生活常识的记忆是有关事实的记忆，属于陈述记忆\n', '了解');
INSERT INTO `Knows` VALUES (224, '最近发展区实际上是两个邻近发展阶段间的过渡状态---维果斯基\n', '了解');
INSERT INTO `Knows` VALUES (225, '“为中华之崛起而读书”属于远景的间接性动机\n', '掌握');
INSERT INTO `Knows` VALUES (226, '问题解决具有目的性、认知性和序列性的特点\n', '了解');
INSERT INTO `Knows` VALUES (227, '成就动机①趋于成功 选择50%的任务\n②避免失败 选择非常容易或者非常难的任务\n', '理解');
INSERT INTO `Knows` VALUES (228, '元认知策略：检查与监控\n', '了解');
INSERT INTO `Knows` VALUES (229, '儿童认知能力中，最先发展且速度最快的领域是--感知觉\n', '掌握');
INSERT INTO `Knows` VALUES (230, '医生通过观察、号脉、听诊诊断病情是由于思维的间接性\n', '了解');
INSERT INTO `Knows` VALUES (231, '人们经常借助于外在的具体形式，如图表、路线图等表征问题，这是理解问题的过程\n', '掌握');
INSERT INTO `Knows` VALUES (232, '韦纳认为学生的成功动机应当归于内部的，不稳定的，可控的因素\n', '掌握');
INSERT INTO `Knows` VALUES (233, '对弹琴、骑车等活动进行操作的记忆是程序性记忆\n', '理解');
INSERT INTO `Knows` VALUES (234, '灵感是创造者长期酝酿，属于豁朗期\n', '掌握');
INSERT INTO `Knows` VALUES (235, '学习期待是对目标的估计\n', '理解');
INSERT INTO `Knows` VALUES (236, '努力是唯一一个可控的因素\n', '掌握');
INSERT INTO `Knows` VALUES (237, '马斯洛的缺失需求：生理需要，安全需要，归属与爱的需要，尊重需要   成长需求包括：认知需要，审美需要，自我实现需要\n', '了解');
INSERT INTO `Knows` VALUES (238, '黑色给人以深沉的感觉，紫色给人以高贵的感觉这种现象是联觉\n', '了解');
INSERT INTO `Knows` VALUES (239, '好奇心---认知内驱力   好孩子---寻求认可取向阶段\n', '理解');
INSERT INTO `Knows` VALUES (240, '“夜来风雨声，花落知多少”反映了思维的间接性\n', '理解');
INSERT INTO `Knows` VALUES (241, '奖赏，报酬作为强化理论\n', '理解');
INSERT INTO `Knows` VALUES (242, '节俭属于性格的态度特征\n', '了解');
INSERT INTO `Knows` VALUES (243, '沙赫特-辛格的情绪二因素论☞认知和生理唤醒两因素，而起决定性作用的是认知\n', '掌握');
INSERT INTO `Knows` VALUES (244, '理智感是智力活动\n', '理解');
INSERT INTO `Knows` VALUES (245, '加涅根据学习结果将学习分为言语信息，智慧技能，认知策略，态度和动作技能\n', '掌握');
INSERT INTO `Knows` VALUES (246, '第三势的理论流派是人本主义心理学，代表人物：马斯洛，罗杰斯\n', '理解');
INSERT INTO `Knows` VALUES (247, '构建主义学习理论强调情境学习\n', '理解');
INSERT INTO `Knows` VALUES (248, '班杜拉认为人类学习的重要形式是观察学习\n', '掌握');
INSERT INTO `Knows` VALUES (249, '复述策略：画线与批注，分散复习和多种感官参与\n精加工策略：记忆术，做笔记，理论联系实际，提问，生成\n精细加工策略：谐音联想法\n组织策略：写概要，列提纲，利用图形和利用表格\n', '掌握');
INSERT INTO `Knows` VALUES (250, '班杜拉---自我效能感理论（注意，保持，再现，动机）\n', '了解');
INSERT INTO `Knows` VALUES (251, '总括学习又叫上位学习，指的是后面学习的概念是上位概念\n', '掌握');
INSERT INTO `Knows` VALUES (252, '科勒的完形顿说，强调对整理关系的理解和顿悟\n', '理解');
INSERT INTO `Knows` VALUES (253, '桑代克在迁移研究中的最大的贡献是用实验事实否定了形式训练说\n', '了解');
INSERT INTO `Knows` VALUES (254, '布鲁纳：获得，转化，评价\n', '掌握');
INSERT INTO `Knows` VALUES (255, '在练习期出现停顿现象，在心理学上称：高原现象\n', '掌握');
INSERT INTO `Knows` VALUES (256, '学习迁移按照迁移性质的不同，可分为正迁移和负迁移\n', '理解');
INSERT INTO `Knows` VALUES (257, '重视对情境关系的理解的迁移理论是关系转化说\n', '掌握');
INSERT INTO `Knows` VALUES (258, '学习迁移的基本理论\n形式训练说（心理学基础：官能心理学）\n相同要素说（桑代克 伍德沃斯）\n概括说（经验类化说）---贾德---水下打靶试验\n关系转化说：苛德--小鸡觅食实验\n奥苏贝尔的认知观（有意义学习）\n', '了解');
INSERT INTO `Knows` VALUES (259, '建构主义心理学的创始人：皮亚杰\n建构主义学习理论：（新知识的生长点）\n（1）知识是对客观世界的一种解释\n（2）知识不可能以实体的形式存在于具体个体之外，不同个体会依据自己的经验背景对相同的命题进行不同的构建\n（3）学生对知识的“接受”只能通过构建来完成\n', '了解');
INSERT INTO `Knows` VALUES (260, '排除厌恶刺激叫负强化，呈现厌恶刺激叫惩罚\n', '掌握');
INSERT INTO `Knows` VALUES (261, '准备律可以看作尝试错误说的动机原则\n', '了解');
INSERT INTO `Knows` VALUES (262, '逃避条件作用是厌恶刺激出现，回避条件作用是厌恶刺激还没有出现\n', '理解');
INSERT INTO `Knows` VALUES (263, '取消惩罚，激励上进，是负强化\n', '了解');
INSERT INTO `Knows` VALUES (264, '班杜卡观察布鲁纳（教育过程）发展奥苏泊尔有意义学习\n', '了解');
INSERT INTO `Knows` VALUES (265, '斯金纳的操作性条件作用理论认为，学习实质上是一种反应概率的变化，而强化是增强反应概率的手段\n', '掌握');
INSERT INTO `Knows` VALUES (266, '食物引发狗的唾液分泌反应是无条件反射\n狗是无条件反应，食物是无条件刺激\n', '掌握');
INSERT INTO `Knows` VALUES (267, '关系转换说认为迁移产生的实质是个体对事物间关系的理解\n', '理解');
INSERT INTO `Knows` VALUES (268, '先行组织者的提出者是美国著名心理学家奥苏伯尔\n', '掌握');
INSERT INTO `Knows` VALUES (269, '巴甫洛夫：分化 泛化 获得与消退\n', '理解');
INSERT INTO `Knows` VALUES (270, '桑代克是联结主义学习理论、教育心理学的创始人(尝试错误理论提出者）\n', '理解');
INSERT INTO `Knows` VALUES (271, '下位学习：把后面的归纳到前面\n', '了解');
INSERT INTO `Knows` VALUES (272, '学生不是空着脑子走进教室的，这一观点源自于建构主义学习理论\n', '理解');
INSERT INTO `Knows` VALUES (273, '顺应性迁移行成更高一级的认知结构\n', '掌握');
INSERT INTO `Knows` VALUES (274, '操作技能动作不能合并，心智技能动作可以合并\n', '了解');
INSERT INTO `Knows` VALUES (275, '桑代克 尝试错误说 联结主义学习（没有中介）\n', '了解');
INSERT INTO `Knows` VALUES (276, '评价，反馈自己认知的不足---监控策略   预计结果---计划策略\n', '理解');
INSERT INTO `Knows` VALUES (277, '多次练习体现了强化的频繁程度，称之为频因律\n', '了解');
INSERT INTO `Knows` VALUES (278, '学习规律：桑代克（准备、练习、效果）\n巴甫洛夫（消退、泛化、习得）\n', '了解');
INSERT INTO `Knows` VALUES (279, '斯金纳--操作性条件作用理论（强化理论）-程序教学-小步骤教学\n苛勒---完形-顿悟理论（格式塔学派：考夫卡，韦特默）\n巴甫洛夫---经典性条件作用理论\n加涅---信息加工学习理论（行为主义+认知主义）\n最高级的学习层次：解决问题学习\n', '理解');
INSERT INTO `Knows` VALUES (280, '巴甫洛夫经典条件作用理论 第一信号系统：物理性的条件刺激 \n第二信号系统：以语言为中介的条件刺激（只有人类才有）\n', '掌握');
INSERT INTO `Knows` VALUES (281, '知识点名', '教学目标（了解，理解，掌握）');

-- ----------------------------
-- Table structure for TiMus
-- ----------------------------
DROP TABLE IF EXISTS `TiMus`;
CREATE TABLE `TiMus`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UnitName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NanYiDu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `A` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `B` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `C` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `D` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsRight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of TiMus
-- ----------------------------
INSERT INTO `TiMus` VALUES (52, '新闻', '1', '简单', '1加1等于几', 10, '1', '2', '3', '4', 'B');
INSERT INTO `TiMus` VALUES (53, '新闻', '1', '简单', '1加2等于', 10, '1', '2', '3', '4', 'C');

-- ----------------------------
-- Table structure for UserTiMus
-- ----------------------------
DROP TABLE IF EXISTS `UserTiMus`;
CREATE TABLE `UserTiMus`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NULL DEFAULT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `AddDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of UserTiMus
-- ----------------------------
INSERT INTO `UserTiMus` VALUES (39, 62, 10, '2022-12-19 15:15:38');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReallyName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ClassName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (62, 'user1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1');
INSERT INTO `Users` VALUES (63, 'user2', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1');

-- ----------------------------
-- Table structure for Videos
-- ----------------------------
DROP TABLE IF EXISTS `Videos`;
CREATE TABLE `Videos`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FilePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Videos
-- ----------------------------
INSERT INTO `Videos` VALUES (1, '环境配置', 'upload/20221219142751.mp4', '测试');
INSERT INTO `Videos` VALUES (2, '数据类型', 'upload/20221219142756.mp4', '测试');
INSERT INTO `Videos` VALUES (8, '测试', 'upload/20221219151112.mp4', '测试');
INSERT INTO `Videos` VALUES (9, '测试', 'upload/20221219151408.mp4', '测试');

-- ----------------------------
-- Procedure structure for proc_queryUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_queryUser`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_queryUser`()
begin

	select * from Users;

end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
