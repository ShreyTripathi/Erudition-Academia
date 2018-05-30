-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: modif_eru_acad
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `auserid` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL,
  PRIMARY KEY (`auserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('fac1id','2002','faculty');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` varchar(30) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `dated` varchar(25) NOT NULL,
  PRIMARY KEY (`announcementid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'105','Welcome to Design and Analysis of Algorithms','Dear student\r\n\r\nWelcome to Erudition Academia!\r\n\r\nThank you for signing up for our online course \"Design and Analysis of Algorithms\". We wish you an enjoyable and informative learning experience.\r\n\r\nThe course will begin on July 24 2018. Please watch the lectures, follow the course regularly and submit all assessments and assignments before the due date. Your regular participation is vital for learning.\r\nOnce again, thanks for your interest in our online courses and certification. Happy learning.\r\n\r\n- EA team ','2018-04-01'),(2,'105','Quiz Release','Two quizzes have been released. The first one is a basic quiz while the second quiz would require you to grasp some knowledge about searching, sorting and graphs. Read about them from the content provided.','2018-05-26'),(3,'BS101','Welcome to Foundations of Everyday Leadership','Dear student Welcome to Erudition Academia! Thank you for signing up for our online course \"Foundations of Everyday Leadership\". We wish you an enjoyable and informative learning experience. Please watch the lectures, follow the course regularly and submit all assessments and assignments before the due date. Your regular participation is vital for learning. Once again, thanks for your interest in our online courses and certification. Happy learning. - EA team','2018-05-26'),(4,'CS101','Welcome to Ruby on Rails an introduction','Dear student Welcome to Erudition Academia! Thank you for signing up for our online course \"Ruby on Rails: An Introduction\". We wish you an enjoyable and informative learning experience. Please watch the lectures, follow the course regularly and submit all quizzes before the due date, however it is not a compulsion. Your regular participation is vital for learning. Once again, thanks for your interest in our online courses. Happy learning. - EA team','2018-05-27'),(5,'CS101','Content Release','PDF content related to ruby on rails has been released and is available for viewing in the browser and even for download.','2018-05-27'),(6,'CS101','Video Release','Two videos such as the \"introduction to ruby on rails\" and \"introduction to sublime text editor\" have been released. These give a breif intro about ruby and the open source text editor which can be used to write code.','2018-05-27'),(7,'BS101','Quiz Release','Glad to announce that the first quiz of this course has been released. The questions in the quiz are related to Basic Leadership. The questions are tough so make sure to view the videos as well as the content thoroughly before attempting the quiz in order to complete it.                                    \r\nAll the best.                                                \r\n-EA team','2018-05-27'),(8,'B102','Welcome to Business for All','Dear student Welcome to Erudition Academia! Thank you for signing up for our online course \"Business for All\". We wish you an enjoyable and informative learning experience.Please watch the lectures, follow the course regularly and submit all quizzes. Your regular participation is vital for learning. Once again, thanks for your interest in our online courses.                          \r\nHappy learning. - EA team','2018-05-27'),(9,'B102','Video Release','Three Videos have been released. The videos are related to writing business plan, studying business plan and business management.','2018-05-27'),(10,'109','Welcome to Introduction to ML','Dear student Welcome to Erudition Academia! Thank you for signing up for our online course \"Introduction to ML\". We wish you an enjoyable and informative learning experience.Please watch the lectures, follow the course regularly and submit all quizzes. Your regular participation is vital for learning. Once again, thanks for your interest in our online courses.Happy learning. - EA team','2018-05-28'),(11,'109','Video Release','Some of the videos have been released. These videos will help to understand different things like regression and classification which are very important for a beginner in ML.','2018-05-28'),(12,'SS101','Welcome to Ancient History','Dear student Welcome to Erudition Academia! Thank you for signing up for our online course \"Ancient History\". We wish you an enjoyable and informative learning experience. Please watch the lectures, follow the course regularly and submit all assessments and assignments before the due date. Your regular participation is vital for learning. Once again, thanks for your interest in our online courses and certification. Happy learning. - EA team','2018-05-28'),(13,'SS101','Video Release','Videos related to the different stone ages have been added and the videos related to the Harappan and Indus Valley Civilization have also been added.','2018-05-28'),(14,'SS101','Content Release','There is no other material that provides the understanding of all the topics of Ancient History other than the NCERT so it has been added.','2018-05-28'),(15,'SS101','Quiz Released','The quiz contains questions related to current affairs about History. So you need a deep understanding of the history in order to attempt it properly. All the Best.','2018-05-28');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `courseid` varchar(10) NOT NULL,
  `unitname` varchar(20) NOT NULL,
  `path` varchar(300) NOT NULL,
  `filename` varchar(150) NOT NULL,
  `filetype` varchar(10) NOT NULL,
  `filetitle` varchar(150) NOT NULL,
  KEY `courseid` (`courseid`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES ('105','unit1','/opt/tomcat/webapps/ROOT/videoplayback.mp4','videoplayback.mp4','video','Introduction Video'),('CS101','unit1','/opt/tomcat/webapps/ROOT/What is Ruby on Rails.mp4','What is Ruby on Rails.mp4','video','Intro to Ruby on Rails'),('CS101','unit1','/opt/tomcat/webapps/ROOT/Sublime Text Basics- All the Best Features in One Video.mp4','Sublime Text Basics- All the Best Features in One Video.mp4','video','Intro to Sublime Text Editor'),('CS101','unit1','/opt/tomcat/webapps/ROOT/ruby-on-rails-tutorial.pdf','ruby-on-rails-tutorial.pdf','pdf','Ruby on Rails Tutorial'),('BS101','unit1','/opt/tomcat/webapps/ROOT/Inspiring Leadership through Emotional Intelligence with Richard Boyatzis.mp4','Inspiring Leadership through Emotional Intelligence with Richard Boyatzis.mp4','video','Inspiring Leadership through Emotional Intelligence with Richard Boyatzis'),('BS101','unit1','/opt/tomcat/webapps/ROOT/Business Leadership MicroMasters Program.mp4','Business Leadership MicroMasters Program.mp4','video','Business Leadership MicroMasters Program'),('BS101','unit2','/opt/tomcat/webapps/ROOT/Introduction to People Management  IIMBx on edX  Course About Video.mp4','Introduction to People Management  IIMBx on edX  Course About Video.mp4','video',' Introduction to People Management'),('BS101','unit2','/opt/tomcat/webapps/ROOT/Design Thinking for Leading and Learning  MITx and Microsoft on edX  Course About Video.mp4','Design Thinking for Leading and Learning  MITx and Microsoft on edX  Course About Video.mp4','video','Design Thinking for Leading and Learning'),('BS101','unit3','/opt/tomcat/webapps/ROOT/Strategic Management  IIMBx on edX.mp4','Strategic Management  IIMBx on edX.mp4','video','Strategic Management'),('BS101','unit4','/opt/tomcat/webapps/ROOT/Introduction to Operations Management  IIMBx on edX  Course About Video.mp4','Introduction to Operations Management  IIMBx on edX  Course About Video.mp4','video','Introduction to Operations Management'),('BS101','unit1','/opt/tomcat/webapps/ROOT/business_and_human_rights_web.pdf','business_and_human_rights_web.pdf','pdf','Business And Human Rights'),('BS101','unit2','/opt/tomcat/webapps/ROOT/businessmodelsbusinessstrategy.pdf','businessmodelsbusinessstrategy.pdf','pdf','Business Models and Strategies'),('BS101','unit1','/opt/tomcat/webapps/ROOT/project_business_2011.pdf','project_business_2011.pdf','pdf','Project Business'),('105','unit1','/opt/tomcat/webapps/ROOT/Why Study Algorithms.mp4','Why Study Algorithms.mp4','video','Why Study Algorithms'),('BS101','unit1','/opt/tomcat/webapps/ROOT/Research_on_Online_Business_Models_IBM_en.pdf','Research_on_Online_Business_Models_IBM_en.pdf','pdf','Research By IBM'),('109','unit1','/opt/tomcat/webapps/ROOT/fundamentals_ml_springer.pdf','fundamentals_ml_springer.pdf','pdf','Fundamentals of ML'),('109','unit2','/opt/tomcat/webapps/ROOT/Pattern_Classification 2nd Ed--Duda.pdf','Pattern_Classification 2nd Ed--Duda.pdf','pdf','Pattern Recognition'),('109','unit1','/opt/tomcat/webapps/ROOT/Linear Regression With Multiple Variables.mp4','Linear Regression With Multiple Variables.mp4','video','Linear Regression With Multiple Variables'),('109','unit1','/opt/tomcat/webapps/ROOT/The Differences between Artificial Intelligence, Machine Learning and Deep Learning.mp4','The Differences between Artificial Intelligence, Machine Learning and Deep Learning.mp4','video','The Differences between Artificial Intelligence, Machine Learning and Deep Learning'),('109','unit2','/opt/tomcat/webapps/ROOT/Features Music Example.mp4','Features Music Example.mp4','video','Features and Labels Musical Example'),('109','unit2','/opt/tomcat/webapps/ROOT/Classification By Eye.mp4','Classification By Eye.mp4','video','Classification By Eye'),('105','unit1','/opt/tomcat/webapps/ROOT/Introduction to Algorithms(Cormen,Leiserson,Rivest and Stein) - MIT Press.pdf','Introduction to Algorithms(Cormen,Leiserson,Rivest and Stein) - MIT Press.pdf','pdf','Introduction to Algorithms(CLRS)'),('105','unit2','/opt/tomcat/webapps/ROOT/all.pdf','all.pdf','pdf','Algorithms(S. Dasgupta)'),('B102','unit1','/opt/tomcat/webapps/ROOT/Your business plan step-by-step.mp4','Your business plan step-by-step.mp4','video','Business plan_by_plan'),('B102','unit2','/opt/tomcat/webapps/ROOT/videoplayback (3).mp4','videoplayback (3).mp4','video','Writing Business Plan'),('B102','unit3','/opt/tomcat/webapps/ROOT/What is Business Management _ Business Management 101.mp4','What is Business Management _ Business Management 101.mp4','video','Business Management'),('B102','unit1','/opt/tomcat/webapps/ROOT/Strategy_business.pdf','Strategy_business.pdf','pdf','Business_strategy'),('B102','unit2','/opt/tomcat/webapps/ROOT/e_business.pdf','e_business.pdf','pdf','E_Business'),('SS101','unit1','/opt/tomcat/webapps/ROOT/indus_valley.mp4','indus_valley.mp4','video','Indus Valley'),('SS101','unit2','/opt/tomcat/webapps/ROOT/paleolithic.mp4','paleolithic.mp4','video','Paleolithic Age'),('SS101','unit1','/opt/tomcat/webapps/ROOT/neolithic.mp4','neolithic.mp4','video','Neolithic Age'),('SS101','unit3','/opt/tomcat/webapps/ROOT/Harrapa.mp4','Harrapa.mp4','video','Harappan Culture'),('SS101','unit4','/opt/tomcat/webapps/ROOT/Ancient-India-RS-Sharma.pdf','Ancient-India-RS-Sharma.pdf','pdf','NCERT XII');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseid` varchar(10) NOT NULL,
  `coursename` varchar(100) NOT NULL,
  `sdate` varchar(28) DEFAULT NULL,
  `edate` varchar(28) DEFAULT NULL,
  `duration` varchar(20) NOT NULL,
  `fee` varchar(8) NOT NULL,
  `fuserid` varchar(20) NOT NULL,
  `category` varchar(80) NOT NULL,
  `imagepath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `fuserid` (`fuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('105','Design and Analysis Of Algorithm','2018-03-29','2018-04-14','25 hrs','2000','fac1id','Technology','ea.jpeg'),('109','Introduction to Machine Learning','2018-03-28','2018-04-25','20 hrs','1000','fac2_id','Technology','ea.jpeg'),('B102','Business for All(Economy)','2018-05-11','2018-05-17','24 hrs','0','fac2_id','Business','business.jpg'),('BS101','Foundations of Everyday Leadership','2018-04-10','2018-04-26','20 hrs','0','fac1id','Business','business.jpg'),('CS101','Ruby on Rails: An Introduction','2018-04-14','2018-04-28','30hrs','0','fac1id','Technology','ea.jpeg'),('SS101','Ancient History','2018-05-26','2018-06-08','18 hrs','0','fac2_id','Social Sciences',NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_det`
--

DROP TABLE IF EXISTS `course_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_det` (
  `courseid` varchar(10) NOT NULL,
  `courseinfo` text NOT NULL,
  `unit1info` text,
  `unit2info` text,
  `unit3info` text,
  `unit4info` text,
  `passcri` varchar(150) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  KEY `courseid` (`courseid`),
  CONSTRAINT `course_det_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_det`
--

LOCK TABLES `course_det` WRITE;
/*!40000 ALTER TABLE `course_det` DISABLE KEYS */;
INSERT INTO `course_det` VALUES ('109','With the increased availability of data from varied sources there has been increasing attention paid to the various data driven disciplines such as analytics and machine learning. In this course we intend to introduce some of the basic concepts of machine learning from a mathematically well motivated perspective. We will cover the different learning paradigms and some of the more popular algorithms and architectures used in each of these paradigms.','Introduction: Statistical Decision Theory - Regression, Classification, Bias Variance','Linear Regression, Multivariate Regression, Subset Selection,Shrinkage Methods, Principal Component Regression, Partial Least squares,Linear Classification, Logistic Regression, Linear Discriminant Analysis','Perceptron, Support Vector Machines, Neural Networks - Introduction, Early Models, Perceptron Learning,                   Backpropagation, Initialization, Training & Validation, Parameter Estimation - MLE, MAP, Bayesian Estimation','null','Pass all the quiz with average greater than 40%','English'),('105','This course will cover basic concepts in the design and analysis of algorithms such as Asymptotic complexity, O() notation Sorting and search Algorithms on graphs: exploration, connectivity, shortest paths, directed acyclic graphs, spanning trees Design techniques: divide and conquer, greedy, dynamic programming Data structures: heaps, union of disjoint sets, search trees,Intractability','Introduction, Examples and motivation, Asymptotic complexity: informal concepts, Asymptotic complexity: formal notation, Asymptotic complexity: examples','Searching in list: binary search, Sorting: insertion sort, Sorting: selection sort, Sorting: merge sort, Sorting: quicksort,','null','null','score greater than or equal to 40%','English'),('CS101','Did you ever want to build a web application? Perhaps you even started down that path in a language like Java or C#, when you realized that there was so much ?climbing the mountain? that you had to do? Maybe you have heard about web services being all the rage, but thought they were too complicated to integrate into your web application. Or maybe you wondered how deploying web applications to the cloud works, but there was too much to set up just to get going. In this course, we will explore how to build web applications with the Ruby on Rails web application framework, which is geared towards rapid prototyping. Yes, that means building quickly! At the conclusion of this course, you will be able to build a meaningful web application and deploy it to the ?cloud? using a Heroku PaaS (Platform as a Service). Best of all, it will almost feel effortless? Really! ?But wait?, you will say, ?there is no way that we can build a useful application if there is no database involved. You need the data for an application to be useful.? Great point! But what if? instead of getting the data from the database, we get it from the internet by tapping into one of the web services out there that readily provides data needed by our application? ?Ok, but that?s probably very complicated?, you will say. Take this course and you will be pleasantly surprised at just how easy it is!','In this module, we will install software required to develop Ruby on Rails applications. We will also demonstrate the use of a popular Ruby on Rails editor called ?Sublime Text?. We will finish the module by familiarizing ourselves with a version control system called ?Git? that will be used later in the course to submit assignments, as well as to deploy Ruby on Rails applications to a PaaS (platform as a service) called ?Heroku?.','In this module, we will become familiar with core concepts behind Ruby on Rails, such as CoC (Convention Over Configuration) and MVC (Model-View-Controller). <p>We will then learn about consuming JSON API with HTTParty, a Ruby gem. We will then integrate this ability to consume JSON API to serve as the data layer for our Rails application.</p>Finally, to conclude this module we will deploy the application to Heroku and write a unit test that will verify the desired functionality.','In this module, we will install software required to develop Ruby on Rails applications. We will also demonstrate the use of a popular Ruby on Rails editor called ?Sublime Text?. We will finish the module by familiarizing ourselves with a version control system called ?Git? that will be used later in the course to submit assignments, as well as to deploy Ruby on Rails applications to a PaaS (platform as a service) called ?Heroku?.','null','Pass all graded assignments to complete the course.','English'),('BS101','In this course you will learn about the ?head and heart? of everyday leadership, individual decision making, group decision making, and managing motivation. The objectives are to understand why and how leadership skills are so critical to organizational success, and learn the foundations of effective leadership skills.','This module will examine what critical levers an everyday leader has available (the management of information and the management of motivation) to accomplish a leader?s core tasks (making and implementing decisions), and why inclusiveness may be the most important skill in a leader?s toolbox.','This module will focus on the management of information (head) side of everyday leadership. We will examine decision analysis as a systematic approach to using information to make decisions, as well as the weaknesses and limitations of decision analysis.','This module will focus on group decision making as a vehicle for helping an everyday leader address some of the limitations of individual decision making. We will also consider the three key determinants of process loss in group decision making that need to be overcome for group decision making to be effective.','This module will focus on the managing motivation (heart) side of everyday leadership.  We will examine how leaders can best manage motivation, and the importance for individual motivation of a leader management of interdependence among group members.','Pass all graded assignments','English'),('B102','In this course the students will learn how the market started and went on to become what it is today. They will also learn how they can make the use of the market to grow their own businesses.','Here we are going to discuss the market scenarios of different countries in the 18th century and how they changed in the 19th century.','In this Unit we discuss about some of the pitfalls or loopholes in todays market schemes and how to take advantage of them.','Some techniques for checking whether the choice made is correct.','null','Pass all the Quizzes.','English'),('SS101','.Indias history and culture are dynamic, spanning back to the beginning of human civilization. It begins with a mysterious culture along the Indus River and in farming communities in the southern lands of India. The history of India is punctuated by constant integration of migrating people with the diverse cultures that surround India. Available evidence suggests that the use of iron, copper and other metals were widely prevalent in the Indian sub-continent at a fairly early period, which is indicative of the progress that this part of the world had made. By the end of the fourth millennium BC, India had emerged as a region of highly developed civilization.','For the convenience of students, the entire course has been divided into seven parts viz., \r\n 1. The Beginning\r\n 2. Indus Valley Civilization \r\n 3. Vedic Period and Iron Age\r\n 4. Mauryan Period\r\n 5. Post-Mauryan Period\r\n 6. Gupta Period\r\n 7. Post-Gupta Period.\r\n \r\n This is an overview lesson of the Part-I. This part deals with the sources of Indian History, its problems, techniques of study and positioning, along with the three segments of Stone Age plus Chalcolithic Age and Megalithic Cultures. So this set of eight lessons will constitute The Beginning of Indian History. This is least cared and perhaps least interesting portion of the Indian history as it becomes extremely difficult for us to correlate it with the past. Nevertheless, we have tried to make it as lucrative as possible.','India belongs to the \"Old World\" and one of the oldest civilizations, and perhaps the only surviving civilization since past four millennia. That gives us ample sources of indigenous as well as foreign observations about India. The footprints of the people, kings, personalities, religious figures,etc. left behind tell us what the country, society and circumstances looked like. Many travellers too tell us what India was in the past. \r\n These all constitute \"The Sources of Indian History\", which has been broadly classified into three distinct categories :\r\n 1.	Literary Sources : Whatever was written\r\n 2.	Archaeological Sources : Whatever has been unearthed or recovered from the past in physical form.\r\n 3.	Other Sources : Whatever is left behind and not covered under the previous two categories. \r\n This is how the history of India can be interpreted.','Usually we start studying history from Stone Age. The Stone Age is divided into three parts, the first one being Palaeolithic Age or Old Stone Age in Greek. This Palaeolithic Age itself is divided into three sub-parts ? lower, middle and upper.\r\n Man was basically a hunter and food gatherer throughout this period. The only notable differences were those of types of stones and variety of tools. So these two things bifurcated the three Paleolithic periods. \r\n There is also a map used in the lesson to depict the various palaeolithic sites to enable the understanding and locating comfortably on blank maps, especially in the Mains','Mesolithic Age saw a sea change in lifestyle of humans. They changed their habitat and methods of hunting, tools, etc. Domestication of animals also began during this period as evidenced from Adamgadh and Bagore, \r\n The most striking feature of this age is use of Microliths and flourishing of Microlithic industry. You can understand what microliths are, through the pictures used in the lesson.\r\n By the end of Mesolithic Period, man started initial farming and therefore started producing food. So in a nutshell, it can be said that the tale of transformation of man from food gatherer to food producer is the history of Mesolithic Period.\r\n As it was previously done for the lesson on Palaeolithic Age, a map has been used to depict the various palaeolithic sites to enable the understanding and locating comfortably on blank maps, especially in the Mains.','Attempt all quizzes','English');
/*!40000 ALTER TABLE `course_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doubt`
--

DROP TABLE IF EXISTS `doubt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doubt` (
  `doubtid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  `doubtheading` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `dated` varchar(28) NOT NULL,
  `doubtanswer` text NOT NULL,
  PRIMARY KEY (`doubtid`),
  KEY `userid` (`userid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `doubt_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `student` (`suserid`),
  CONSTRAINT `doubt_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doubt`
--

LOCK TABLES `doubt` WRITE;
/*!40000 ALTER TABLE `doubt` DISABLE KEYS */;
INSERT INTO `doubt` VALUES (2,'hi@123','105','fasfasdfasfasfa','sfasfasfasfasfaf','2018-05-29','null');
/*!40000 ALTER TABLE `doubt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled` (
  `userid` varchar(10) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  KEY `courseid` (`courseid`),
  KEY `userid` (`userid`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `student` (`suserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES ('hi@123','105'),('hi@123','BS101'),('hi@123','CS101');
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fuserid` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `ffname` varchar(20) NOT NULL,
  `flname` varchar(20) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `graduate` varchar(4) NOT NULL,
  `postgrad` varchar(4) NOT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` int(10) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  PRIMARY KEY (`fuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('12345','12345','qwerty','qwerty','2018-04-06','male','no','no','qwe','wqe','dsg','dsg',234340,'fgfdg@f.co','1234567890'),('fac1id','2002','fac1_first','fac1_last','1996-06-13','male','yes','no','thaana 9','my_city','UP','INDIA',243001,'fac1@user.com','8990029221'),('fac2_id','fac2_pass','fac2_first','fac2_last','1996-02-16','male','yes','yes','My_Street','my_city','UP','INDIA',23131,'kumarsheenam5@gmail.com','891911912');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(20) NOT NULL,
  `courserate` int(11) NOT NULL,
  `contentrate` int(11) NOT NULL,
  `improve` varchar(150) DEFAULT NULL,
  `suserid` varchar(10) NOT NULL,
  `understand` int(11) NOT NULL,
  PRIMARY KEY (`feedid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'desxc',3,2,'bvcxc','12345',5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `quesid` int(11) NOT NULL AUTO_INCREMENT,
  `topicid` int(11) NOT NULL,
  `quesdet` text NOT NULL,
  `choice1` text NOT NULL,
  `choice2` text NOT NULL,
  `choice3` text NOT NULL,
  `choice4` text NOT NULL,
  `correct_ans` varchar(7) NOT NULL,
  `diff_level` varchar(6) NOT NULL,
  PRIMARY KEY (`quesid`),
  KEY `topicid` (`topicid`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`topicid`) REFERENCES `topic` (`topicid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (3,13,'in the code fragment below, start and end are integer values and gcd(x,y) is a function that computes the greatest common divisor of x and y.\r\n    i := 0; j := 0; k := 0;\r\n    for (m := start; m <= end; m := m+1){\r\n      if (gcd(m,9381) > 2){\r\n        i := i + m;\r\n        k := k + m;\r\n      }else{\r\n        j := j + m;\r\n        k := k + m;\r\n      }\r\n    } ','k == i - j',' k == j - i','k == i + j',' depends on start and end','choice3','medium'),(4,13,'how many times does the while loop get executed if the following function is called as f(120,13)?\r\nf(m,n) {\r\n     ans = 1\r\n     while (m - n >= 0) {\r\n       ans = ans * 2\r\n       m = m - n\r\n     }\r\n     return(ans)\r\n   }','10','9','infinite','12','choice2','low'),(5,13,'let f(n) = 16n4 +10 n log n and g(n) = 8758 n3 log n + 9248 n2. which of the following is true?','f(n) is o(g(n)) and g(n) is o(f(n)).',' f(n) is o(g(n)), but g(n) is not o(f(n))','g(n) is o(f(n)), but f(n) is not o(g(n))','f(n) is not o(g(n)) and g(n) is not o(f(n))','choice3','medium'),(6,13,'if t(n) = n &#8730; n then:','t(n) is o(n*n*n)',' t(n) is o(n log n)','t(n) is o(n)','none of these','choice1','high'),(7,13,'a new algorithm maxpack for optimally packing furniture in a transportation container claims to have worst case complexity o(n2 log n), where n is the number of items to be packed.\r\n\r\nfrom this, we can conclude that:','for every n, for every input of size n, maxpack requires time proportional to n2 log n.','for some n, for every input of size n, maxpack requires time proportional to n2 log n.','for every n, every input of size n can be solved by maxpack within time proportional to n2 log n.\r\n',' for every n, there is an input of size n for which maxpack requires time proportional to n2 log n.','choice3','high'),(9,15,'consider the following variation of the merge function, where the input lists a and b are assumed to be sorted, with no duplicated elements, and c is the output list.\r\n  function strangemerge(a,m,b,n,c) {\r\n    // a has m elements, b has n elements\r\n    i = 0; j = 0; k = 0; \r\n \r\n    while (k < m+n) {\r\n      if (i == m) {j++; k++;}  \r\n      if (j == n) {c[k] = a[i]; i++; k++;} \r\n\r\n      if (i != m and j != n) {\r\n        if (a[i] < b[j]) {c[k] = a[i]; i++; k++;}\r\n        if (a[i] == b[j]) {i++; j++;}\r\n        if (a[i] > b[j]) {j++;}\r\n      }\r\n    }\r\n  }\r\nwhat does c contain after executing strangemerge(a,m,b,n,c)?','c contains the intersection of a and b.','c contains all values in b that do not occur in a.','c contains all values in a that do not occur in b.','c contains all values that occur in either a or b, but not in both input lists.','choice3','medium'),(10,15,'suppose we modify mergesort as follows. we split the input into three equal segments, recursively sort each segment and then do a three way merge of the three sorted segments to obtain a fully sorted output.\r\n\r\nif we work out the recurrence for this variant, we find that the worst case complexity is o(n log3 n), as opposed to o(n log2 n) for the usual divide and conquer that splits the input into two equal segments.\r\n\r\nlet us call the new version 3-way mergesort. what can we say about the asymptotic worst case complexity of 3-way-mergesort with the usual mergesort?','the asymptotic worst case complexity of 3-way mergesort is better than that of usual mergesort.','the asymptotic worst case complexity of 3-way mergesort is the same as that of usual mergesort.','the asymptotic worst case complexity of 3-way mergesort is worse than that of usual mergesort.','this depends on the length and the initial arrangement of values of the input.','choice2','low'),(11,15,'suppose a new generation cpu can process 10^10 operations per second. you have to sort an array with 10^8 elements. which of the following is true?','insertion sort could take several hours while merge sort will always take less than 1 second.','insertion sort will always take several hours while quicksort will always take less than 1 second.','insertion sort will always take several hours while merge sort will always take less than 1 second.','insertion sort could take several hours while quicksort will always take less than 1 second.','choice1','high'),(12,15,'which of the following statements is not true about quicksort?','for every fixed strategy to choose a pivot for quicksort, we can construct a worst case input that requires time o(n^2).',' if we randomly choose a pivot element each time, quicksort will always terminate in time o(n log n).','if we could find the median in time o(n), quicksort would have worst case complexity o(n log n).',' quicksort and merge sort are both examples of divide and conquer algorithms.','choice2','medium'),(13,15,'we have a list of three dimensional points [(7,1,8),(3,5,7),(6,1,4),(6,5,9),(0,2,5),(9,0,9)]. we sort these in ascending order by the second coordinate. which of the folllowing corresponds to a stable sort of this input?','[(9,0,9),(7,1,8),(6,1,4),(0,2,5),(6,5,9),(3,5,7)]','[(0,2,5),(3,5,7),(6,1,4),(6,5,9),(7,1,8),(9,0,9)]','[(9,0,9),(6,1,4),(7,1,8),(0,2,5),(3,5,7),(6,5,9)]','[(9,0,9),(7,1,8),(6,1,4),(0,2,5),(3,5,7),(6,5,9)]','choice4','low'),(14,15,'an airline serves 200 cities and runs 1100 direct flights each day between these cities. which of the following is a good data structure to represent the collection of flights?','a 200 × 200 array a, where a[i][j] = 1 if there is a direct flight from city i to city j and 0 otherwise.','a stack containing values (i, j) for each pair of cities i, j for which there is a direct flight from city i to city j.','a queue containing values (i,j) for each pair of cities i, j for which there is a direct flight from city i to city j.','a list containing values (i, j) for each pair of cities i, j for which there is a direct flight from city i to city j.','choice4','low'),(15,15,'an undirected graph g has 300 nodes and the minimum degree of any vertex is 3. which of the following is the most precise statement we can make about m, the number of edges in g?','m is at least 900.','m is at least 450.','m is at least 300.','m is at least 100.','choice2','high'),(16,15,'which of the following statements is not true about breadth-first search (bfs) in an undirected graph starting at a vertex v?','bfs identifies all vertices reachable from v.','using an adjacency list instead of an adjacency matrix can improves the worst case complexity to o(n + m).','bfs cannot be used to check for cycles in the graph.','bfs can be used to identify the furthest vertex from v in any graph, in terms of number of edges.','choice3','medium'),(17,15,'applying for permits to put up a factory is an 11 step process. some steps depend on others, as described below.\r\nstep 1 must be completed before steps 3 and 4 start.\r\nstep 2 must be completed before steps 3, 6 and 7 start.\r\nstep 3 must be completed before step 7 starts.\r\nstep 4 must be completed before step 5 starts.\r\nstep 5 must be completed before step 7 starts.\r\nstep 7 must be completed before steps 8 and 9 start.\r\nstep 9 must be completed before steps 10 and 11 start.\r\neach step takes a week to complete. what is the minimum number of weeks required to get all the permits in place?','4','6','8','9','choice2','high'),(18,15,'we are given a directed graph, using an adjacency matrix representation. for each vertex v, we want to compute the set of incoming edges (u, v). which of the following is the most accurate description of the complexity of this computation. (recall that n is the number of vertices and m is the number of edges.)','o(n)','o(n+m)','o(n^2)','o(m)','choice3','low'),(19,15,'consider the following strategy to solve the single source shortest path problem with edge weights from sources.\r\nreplace each edge with weight w by w edges of weight 1 connected by new intermediate nodes.\r\nrun bfs(s) on the modified graph to find the shortest path to each of the original vertices in the graph.\r\nwhich of the following statements is correct?','this strategy will solve the problem correctly but is not as efficient as dijkstras algorithm.','this strategy will solve the problem correctly and is as efficient as dijkstras algorithm.','this strategy will not solve the problem correctly.','this strategy will only work if the graph is acyclic.','choice1','high'),(20,15,'an airline charges a fixed price for each direct flight. for each sequence of hopping flights, the ticket price is the sum of the fares of the individual sectors. tripguru has precalculated the cheapest routes between all pairs of cities so that it can offer an optimum choice instantly to customers visiting its website. overnight, the government has added a 13% luxury service surcharge to the cost of each individual flight. which of the following describes the impact of this surcharge on tripgurus computation?','there is no impact. cheapest routes between all pairs of cities remains unchanged.','the surcharge favours hopping flights with fewer sectors. tripguru should recompute any cheapest route where there is a shorter route in terms of number of flights.','the surcharge favours hopping flights with more sectors. tripguru should recompute any cheapest route where there is a longer route in terms of number of flights.','the impact is unpredictable. tripguru should recompute all cheapest routes.','choice1','high'),(21,15,'how can we use the bellman-ford algorithm to detect negative cycles in a weighted graph with n vertices?','check if the shortest path between some pair of vertices is negative.','check if the distance between some pair of vertices decreases after any iteration.','check if the distance between some pair of vertices decreases after the nth iteration.','the bellman-ford algorithm cannot be used to detect negative cycles.','choice3','medium'),(22,15,'suppose we run prim?s algorithm and kruskal?s algorithm on a graph g and the two algorithms produce minimum-cost spanning trees tp and tk, respectively. which of the following is true?','tp must be identical to tk.','if e is a minimum cost edge in g, e belongs to both tp and tk.','if tp is different from tk, some pair of edges in g have the same weight.','if e is a maximum cost edge in g, e belongs to neither tp nor tk.','choice2','medium'),(23,16,' an individual who is able to exert leadership and to manage an operation is called a:','leader.','leader-manager','manager','first line supervisor','choice2','low'),(24,16,'the capacity to influence people and accomplish desired objectives is called:','power','leadership','authority','status','choice2','low'),(25,16,'the ability to influence people through granting or withholding benefits that are of interest to them is called.','reward power','coercive power','export power','reference power','choice1','medium'),(26,16,'coercive power may occur in which of the following organizations?','service firm.','non-profit organization.','manufacturing firm','all of the above','choice4','high'),(27,16,'mr. x is the only person in the company with expertise in the e-commerce field. this source of power is called:','reward power','knowledge power','reference power','none of the above','choice2','low'),(28,16,'in which of the following organizations is reference power more likely to be evident?','telecommunication business.','religious organization','service organization.','baseball team','choice2','high'),(29,16,'a leadership theory that focuses on the traits of those who have assumed powers and who are considered to be effective is called','trait theories','behavorial theories','contingency theories','structural theories','choice1','medium'),(30,16,'michael is a type of manager who is concerned primarily with accomplishing goals and objectives and concentrates on the task itself. his behavioral style is called:',' authoritarian.','democratic','task oriented','people oriented','choice3','medium'),(31,16,'the recognition that task-oriented and people-oriented behavioral styles are important and that people have different orientations that they bring to the management process is the result of the research of:','hersey & blanchard.','fieldler','blake & mccanne','none of the above','choice3','high'),(32,16,'an approach to leadership in which the leaders behavior is first categorized on a scale from task orientation to people orientation, and efforts are made to find a work situation to which that particular style is best suited is called:',' hersey-blanchard theory.','vroom-jago model','fielders lpc theory','path goal theory','choice3','high'),(33,16,'in the hersey-blanchard situational leadership model, the authors suggest that the right mix of leadership style is best found by focusing on which characteristic?','intelligence.',' motivation','confidence',' maturity','choice4','high'),(34,16,'a leadership theory that postulates that an effective leader is one who develops a variety of leadership styles, and in each situation applies the style that best fits the circumstance.','vroom-jago model.','path goal theory.','lpc theory.','none of the above.','choice1','medium'),(35,16,' according to path goal theory, which of the following is not a leadership behavior?','directive behavior.','supportive behavior.','participative behavior.',' none of the above.','choice4','low'),(36,16,'according to the text, lee iococca of chrysler and pat farrah of home depot exhibited what type of leadership?','transactional','transformational','autocratic','contingency','choice2','high'),(37,16,'which of the following are self-management strategies?',' self-set goals.','self observation','self rewards','all of the above.','choice4','medium'),(38,17,'which of the following is supported by ruby?','multiple programming paradigms','dynamic type system',' automatic memory management','all of the mentioned','choice4','low'),(39,17,'which of the following features does the 2.0 version of ruby supports?','method keyword arguments','new literals','security fixes','all of the mentioned','choice4','low'),(40,17,' which of the following languages syntax matches with the ruby?s syntax?','perl','php','java','jquery','choice1','medium'),(41,17,'what is the extension used for saving the ruby file?','.ruby extension','.rb extension','.rrb extension','none of the mentioned','choice2','low'),(42,17,'which of the following are valid floating point literal?',' .5','2','0.5','none of the mentioned','choice3','high'),(43,17,'which of the following datatypes are valid in ruby?','numbers','boolean','string','all of the mentioned','choice4','low'),(44,17,'what will any variable evaluate to if it is of boolean data type?','true','nil','false',' either true or false','choice4','medium'),(45,17,'why can not we use quotation marks with boolean?','it indicates that we are talking about a string','it indicates that we are assigning a value','it indicates that that we are replacing boolean data type with string data type','none of the mentioned','choice1','high'),(46,17,'what is the size of an integer data type in ruby?','-2^30 to 2^30',' -2^30 to 2^(30-1)','-2^29 to 2^30',' -2^60 to 2^61','choice2','medium'),(47,17,'what is the output of the given code?\r\nboolean_1 = 77<78\r\n   puts(boolean_1)','nil','true','false','error','choice2','low'),(48,17,'objects of which class does the integer from the range -2^30 to 2^(30-1) belong to?','bignum','octal','fixnum','binary','choice3','medium'),(49,17,'what does the notataion  stands for?','escape','space','backspace','newline','choice3','medium'),(50,17,'what is the sequence of ruby strings?','16-bit bytes','8-bit bytes','10-bit bytes','none of the mentioned','choice2','medium'),(51,17,'what is the output of the given code?<br>\r\nmy_string=ruby<br>\r\n    puts(my_string)','ruby','nil','error','none of the mentioned','choice3','medium'),(52,17,'which of the following is not a valid datatype?','float','integer','binary','timedate','choice4','medium'),(53,18,'which of the following has announced an initiative to educate women?','mobikwik','paytm','phonepe','mswipe','choice2','medium'),(54,18,'which becomes the first company to achieve rs 7 lakh crore m-cap milestone?','itc','hdfc','tcs','reliance industrie','choice3','medium'),(55,18,'which software company acquires magento for usd 1.68 billion?','microsoft','autodesk','adobe','oracle','choice3','medium'),(56,18,'tripura signs mou with which of the company to boost pineapple export?','vistara','spice jet merchandise','etihad airways','ibibo group','choice2','high'),(57,18,'infosys formed a blockchain-based trade finance network with how many banks?','5','7','4','8','choice2','low'),(58,18,'this company will host the international rail coach expo (irce-2018).','integral coach factory, chennai','rail coach factory, kapurthala','modern coach factory, raebareli','electric locomotive factory, madhepura','choice1','low'),(59,18,'this mobile netrwork has signed a mou with sap to jointly offer gst solutions to indian enterprises.','airtel','bsnl','vodafone','reliance jio','choice2','medium'),(60,18,'	\r\n__________ has signed mou with union ministry of mines, setting highest ever target of rs 9350 crore revenue for financial year 2018-19.','nalco','bhel','tata power','coal india','choice1','high'),(61,18,'	\r\nwhich payments bank launched a digital suite products that can be accessed online and through mobile phones with the focus to build the transaction platform?','airtel payment bank','fino payments bank','paytm','phonepe','choice2','high'),(62,18,'indias first, indigenous lithium-ion battery charger has been developed by ___________.','milltex engineers','hulikkal electro india','ampere vehicles','next techni solution','choice3','high'),(63,18,'which of the following purchased leading pakistani online retailer \"daraz\" recently?','alibaba','wallmart','amazon','ebay','choice1','high'),(64,18,' this us based company will acquire 77% stake in indias largest e-commerce flipkart for 16 billion dollars','amazon','costco','walmart','kroger','choice3','low'),(65,18,'nasa and ________ have signed an agreement to explore putting flying taxis in the skies over us cities.','curb','google','uber','lyft','choice3','medium'),(66,18,'which mobile company acquires us internet of things start-up spacetime insight recently?','nokia','samsung','lenovo','oppo','choice1','high'),(67,18,'this fuel company has launched home-delivery of diesel in mumbai after ioc.','bharat petroleum','reliance petroleum limited','hpcl','essar oil','choice3','medium'),(68,18,'niti aayog and this company has signed a soi to help grow ai ecosystem in india.','facebook','google','microsoft','ibm','choice2','medium'),(69,18,'__________ has inked a pact with the ministry of power to incur capital expenditure of rs.25,000 crore for the current fiscal.','mtnl','l&t','bhel','pgcil','choice4','high'),(70,18,'in which of the following state google will install 25,000 wi-fi hotspots?','andra pradesh','kerala','tamilnadu','telangana','choice1','low'),(71,19,'the parameters obtained in linear regression','can take any value in the real space','are strictly integers','always lie in the range [0,1]','can take only non zero values','choice1','low'),(72,19,'given a set of n data points, (x1,y1),(x2,y2),?,(xn,yn), the best least squares fit f(x) is obtained by minimization of:','&#8721;ni=1[yi&#8722;f(xi)]','min(yi&#8722;f(xi))','&#8721;ni=1[yi&#8722;f(xi)]^2','max(yi&#8722;f(xi))','choice3','medium'),(73,19,'consider forward selection, backward selection and best subset selection with respect to the same data set. which of the following is true?','best subset selection can be computationally more expensive than forward selection','forward selection and backward selection always lead to the same result','best subset selection can be computationally less expensive than backward selection','best subset selection and forward selection are computationally equally expensive','choice1','high'),(74,19,'adding interaction terms (such as products of two dimensions) along with original features in linear regression','increases training error.','reduces training error','does not affect training error.','none of the above.','choice2','medium'),(75,19,'consider the following five training examples<br>\r\nx=[2 3 4 5 6]<br>\r\ny=[12.8978 17.7586 23.3192 28.3129 32.1351]<br>\r\nwe want to learn a function f(x) of the form f(x)=ax+b which is parameterized by (a,b). using squared error as the loss function, which of the following parameters would you use to model this function.','(4,3)',' (5,1)','(5,3)','(1,5)','choice3','medium'),(76,19,'knn regressor outputs the average of the k nearest neighbours of a query point. consider a variant of knn regressor where instead of returning the average we fit a linear regression model on the k neighbours. which of the following do not hold true for this new variant?','this method makes an assumption that the data is globally linear.','this method makes an assumption that the data is locally linear',' this method has lower bias compared to knn',' this method has higher bias compared to knn','choice1','low'),(77,19,'which of the following shrinkage methods leads to sparse solution?','ridge regression','lasso regression','lasso and ridge regression both return sparse solutions','none of the above','choice2','medium'),(78,19,'consider the design matrix x of dimension n×(p+1). which of the following statements are true?','the row space of x is the same as the column space of x^t','the rowspace of x is not the same as the rowspace of x^t','the eigenvalues of (xx)^t are the same as the eigenvalues of (x)^t*(x)','all of the above','choice4','medium'),(79,19,'principal component regression (pcr) is an approach to find an orthogonal set of basis vectors which can then be used to reduce the dimension of the input. which of the following matrices contains the principal component directions as its columns','x','s','v','u','choice3','high'),(80,19,'when using svms, what effect, in general, can you expect on the size of the margins when the c parameter is decreased?','the margins may become wider\r\n','the margins may become narrower','no relation between c and margin sizes','first margin becomes narrower and then wider','choice1','high'),(81,19,'train a linear regression model (without regularization) on the synthetic dataset( available on the internet ). report the coefficients of the best fit model. report the coefficients in the following format:<br> \r\n&#946;0 , &#946;1 , &#946;2 , &#946;3','-1.2 , 2.1 , 2.2 , 1','1, 1.2, 2.1, 2.2','-1, 1.2, 2.1, 2.2',' 1, -1.2, 2.1, 2.2','choice4','medium'),(82,19,'train a l2 regularized linear regression model on the synthetic dataset ( available on the internet ). vary the regularization parameter from 1 to 10. as you increase the regularization parameter, absolute value of the coefficients (excluding the intercept) of the model:','increase','first increase then decrease','decrease','first decrease then increase','choice3','medium'),(83,19,'train a l2 regularized logistic regression classifier on the modified iris dataset ( first 100 points as train and next 50 points as test dataset ). we recommend using sklearn. use only the first two features for your model. we encourage you to explore the impact of varying different hyperparameters of the model. kindly note that the c parameter mentioned below is the inverse of the regularization parameter &#955;. as part of the assignment, train a model with the following hyperparameters:<br>\r\nmodel: logistic regression with one-vs-rest classifier, c = 1e4\r\n<br>\r\nfor the above set of hyperparameters, report the best classification accuracy','0.88','0.86','0.92','0.68','choice2','medium'),(84,19,'train an svm classifier on the modified iris dataset ( first 100 data points as train and next 50 points as test data set ). we recommend using sklearn. use only the first two features for your model. we encourage you to explore the impact of varying different hyperparameters of the model. specifically try different kernels and the associated hyperparameters. as part of the assignment train models with the following set of hyperparameters:<br>\r\nrbf-kernel, gamma=0.5 , one-vs-rest classifier, no-feature-normalization.<br>\r\ntry c = [0.01, 1, 10 ]. for the above set of hyperparameters, report the best classification accuracy along with total number of support vectors on the test data.','0.88, 69',' 0.44, 69','0.68, 44','0.34, 44','choice1','medium'),(85,19,'which of the following dimensionality reduction methods are hard thresholding methods?<br>\r\n( a method is soft-thresholding if it contains parameters that vary in a continuous fashion )\r\n','forward stepwise regression and backward stepwise regression','backward stepwise regression and forward stagewise regression','principal component regression and partial least squares method',' ridge regression and least absolute shrinkage and selection operator (lasso)','choice4','high'),(86,19,'suppose that in applying linear regression, we are working with a data set where there are a large number of features, many of which we suspect to be redundant. we have discussed how using regularization we can constrain the magnitude of the weights associated with each feature. in fact, using regularization we can eliminate certain redundant features where the magnitude of the weights are found to be zero. suppose we have a choice between two regularization schemes, ridge regularization, where the additional penalty term is the sum of squares of the weights and lasso regularization, where the penalty term is the sum of the absolute values of the weights. which method do you think will result in eliminating more features (by reducing corresponding weights to zero)?','lasso',' ridge','either of lasso or ridge regression can be used','none of them reduces corresponding weights to zero','choice1','low'),(87,19,'which of the following is true about a logistic regression based classifier?','the logistic function is non-linear in the weights and the decision boundary is linear in the weights','the logistic function is non-linear in the weights and the decision boundary is linear in the weights','the logistic function is linear in the weights and the decision boundary is linear in the weights','the logistic function is linear in the weights and the decision boundary is non-linear in the weights','choice1','low'),(88,19,'you work as a data analyst and your job is to analyse the growth of sale of a product. suppose you decide to fit a linear regression model on a multivariate dataset. you find that a particular feature has a very high negative coefficient. what can you infer from this?','we cannot comment on the importance of this feature without any additional information','since the feature has a large negative coefficient, so it is not an important feature. it is better to discard it.','since the magnitude of the coefficient is very high, we should never discard that feature.','features with low coefficient should be discarded ','choice1','high'),(89,19,'for a two class classification problem, which among the following are true?','if both the covariance matrices are spherical and equal, the within class variance term has an effect on the lda derived direction while if both the covariance matrices are spherical but unequal, the within class variance term has an effect on the lda derived direction. ','if both the covariance matrices are spherical and equal, the within class variance term has an effect on the lda derived direction while if both the covariance matrices are spherical but unequal, the within class variance term has no effect on the lda derived direction.',' if both the covariance matrices are spherical and equal, the within class variance term has no effect on the lda derived direction while  if both the covariance matrices are spherical but unequal, the within class variance term has an effect on the lda derived direction.','if both the covariance matrices are spherical and equal, the within class variance term has no effect on the lda derived direction while if both the covariance matrices are spherical but unequal, the within class variance term has no effect on the lda derived direction.','choice4','high'),(90,20,'which among the following kings was also known as mamallan (great wrestler)? ','pulakesi ii','mahendravarman i ','narasimhavarman i','none of the above','choice3','medium'),(91,20,'which among the following is the correct set of the plays written by harshavardhan in sanskrit? ','malavikagnimitram,vikramorvashiiyam and abhijñanasakuntalam ','svapna vasavadattam, pancharatra and pratijna yaugandharayaanam ','nagananda, priyadarshika and ratnavali. ','none of these.','choice3','high'),(92,20,'where and when was the second buddhist council held? ','patliputra in 250 b.c.','sri lanka in 1st century b.c.','vaishali in 383 b.c.','mandalay in 1871 a.d.','choice3','low'),(93,20,'who among the following succeeded samudragupta as the next ruler of gupta dynasty ? ','chandragupta ii ','chandragupta i','vishnugupta','mahendra','choice1','high'),(94,20,'as per asoka inscriptions, which among the following place was declared tax free and proclaimed only 1/8th part as taxable? ','kushinagar','lumbini','kathmandu','sarnath','choice2','medium'),(95,20,'which among the following places have given the earliest evidence of agriculture in indian subcontinent? ','pratapgarh','mehrgarh','quetta ','kalat','choice2','high'),(96,20,' which among the following vakataka ruler performed all the seven sacrifices viz. agnishtoma, aptoryama, ukthya, shodasin, atiratra, vajapeya, brihaspatisava, sadyaskra and four asvamedhas ? ','rudrasena-i ','pravarsena-i ','prithvisena-i','narendrasena-i','choice2','low'),(97,20,'who among the following was the 23rd jain tirthankara ? ','nemi natha','mahavira','parshvanath','malinath','choice3','medium'),(98,20,'the satapatha brahmana and taitriya brahmana are the brahmana texts of ___: ','rigveda ','yajurveda','samaveda','atharavaveda','choice2','low'),(99,20,'which among the following is the most unique feature of dholavira site of the indus valley civilization? ','its cities were horizontally divided in multiple parts ','its cities were unevenly divided ','its cities were divided into 2 parts ','none of these','choice3','medium'),(100,20,'to perform which among the following functions, rajukas were appointed by asoka?','revenue functions','judicial functions','religious functions','military functions\r\n','choice2','low'),(101,20,' which among the following kushana king adopted the epithet dharma-thida? ','vima kadaphises','kuzul kadaphises','kanishka the great','huvishka','choice2','medium'),(102,20,'which among the following gupta emperors called himself ?lichchhavi-dauhitra?? ','shrigupta','chandragupta i','chandragupta ii','samudragupta','choice4','low');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `suserid` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `sfname` varchar(20) NOT NULL,
  `slname` varchar(20) NOT NULL,
  `sdob` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `graduate` varchar(4) NOT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` int(10) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  PRIMARY KEY (`suserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('12345','cvbnm','Harsh','Katiyan','2018-04-11','female','yes','jifjodjsfj','jnnjnj','jjojoj','INDIA',243001,'kumarsheenam5@gmail.com','7788991245'),('hi@123','12344','Student_fname','Student_lname','2018-03-01','male','no','Saraswati Street','Ghaziabad','UP','India',231323,'mayank@gmail.com','931313444');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topicid` int(11) NOT NULL AUTO_INCREMENT,
  `topicname` varchar(150) NOT NULL,
  `courseid` varchar(10) DEFAULT NULL,
  `lastdate` varchar(28) NOT NULL,
  PRIMARY KEY (`topicid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (13,'introductory quiz','105','2018-04-13'),(15,'Searching, Sorting and Graphs','105','2018-06-09'),(16,'Basic Leadership','BS101','2018-06-02'),(17,'Basics of Ruby on Rails','CS101','2018-06-08'),(18,'Current Affairs Related to Business','B102','2018-06-08'),(19,'Linear Regression, Classification and SVM','109','2018-06-16'),(20,'General Knowledge about Ancient History','SS101','2018-06-09'),(21,'designs','105','2018-05-03');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_question`
--

DROP TABLE IF EXISTS `user_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_question` (
  `userid` varchar(10) NOT NULL,
  `quesid` int(11) NOT NULL,
  `user_choice` text,
  `correct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_question`
--

LOCK TABLES `user_question` WRITE;
/*!40000 ALTER TABLE `user_question` DISABLE KEYS */;
INSERT INTO `user_question` VALUES ('hi@123',25,'coercive power',0),('hi@123',29,'behavorial theories',0),('hi@123',23,'leader-manager',1),('hi@123',24,'leadership',1),('hi@123',27,'knowledge power',1),('hi@123',30,' authoritarian.',0),('hi@123',34,'path goal theory.',0),('hi@123',37,'all of the above.',1),('hi@123',35,'participative behavior.',0),('hi@123',90,'narasimhavarman i',1),('hi@123',94,'sarnath',0),('hi@123',97,'mahavira',0),('hi@123',92,'vaishali in 383 b.c.',1),('hi@123',96,'rudrasena-i ',0),('hi@123',98,'samaveda',0),('hi@123',100,'judicial functions',1),('hi@123',102,'chandragupta i',0);
/*!40000 ALTER TABLE `user_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-29 16:28:34
