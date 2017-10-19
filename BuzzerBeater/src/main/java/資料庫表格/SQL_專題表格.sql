--移除 BasketBallDB
USE master
DROP DATABASE BasketBallDB
GO

--創建 BasketBallDB
CREATE DATABASE BasketBallDB
GO

USE BasketBallDB
GO

---------------------------------------------------------------------------------------------------------------

create table Season			--賽季
(
  seasonID              int PRIMARY KEY IDENTITY (1001,1),   --賽季ID
  seasonName            nvarchar(20),						 --賽季名稱
  seasonBeginDate       datetime,							 --賽季開始時間
  seasonEndDate         datetime,                            --賽季結束時間
  signUpBegin           datetime,                            --報名開始時間
  signUpEnd             datetime,                            --報名截止時間
  descriptions          nvarchar(max),                       --備註
)
GO

insert into Season values ('第十五季例行賽','2018-01-01','2018-06-30','2017-10-01','2017-11-30',null);
insert into Season values ('第十五季季後賽','2018-06-01','2018-08-20','2018-05-26','2018-05-31',null);
insert into Season values ('第十四季例行賽','2017-01-01','2017-06-30','2016-10-01','2016-11-30',null);
insert into Season values ('第十四季季後賽','2017-06-01','2017-08-20','2017-05-26','2017-05-31',null);
insert into Season values ('第十三季例行賽','2016-01-01','2016-06-30','2015-10-01','2016-11-30',null);
insert into Season values ('第十三季季後賽','2016-06-01','2016-08-20','2016-05-26','2016-05-31',null);

select * from Season
GO

---------------------------------------------------------------------------------------------------------------

create table Groups			--分組
(
  groupID                 int PRIMARY KEY IDENTITY (2001,1),	       --分組ID
  seasonID                int references Season(seasonID),             --季賽ID
  groupName               nvarchar(20),                                --分組名稱
  maxTeams                int,                                         --球隊數量上限
  minTeams                int,                                         --球隊數量下限
  currentTeams            int,                                         --目前球隊數量
  maxPlayers              int,                                         --球隊成員上限
  minPlayers              int,                                         --球隊成員下限
 )
 GO 

 insert into Groups values ('1001','東區','8','4','5','15','7');
 insert into Groups values ('1001','西區','8','4','0','15','7');
 insert into Groups values ('1002','東區','8','4','5','15','7');
 insert into Groups values ('1002','西區','8','4','0','15','7');
 insert into Groups values ('1003','東區','8','4','5','15','7');
 insert into Groups values ('1003','西區','8','4','0','15','7');
 insert into Groups values ('1004','東區','8','4','5','15','7');
 insert into Groups values ('1005','西區','8','4','0','15','7');
 insert into Groups values ('1006','東區','8','4','5','15','7');
 insert into Groups values ('1006','西區','8','4','0','15','7');

 select * from Groups
 GO

 ---------------------------------------------------------------------------------------------------------------
 
 create table Players        --球員
( 
  playerID        int primary key IDENTITY (70001,1),             --球員ID
  playerName      nvarchar(20),                                   --球員姓名
  id              varchar(20),                                    --身分證字號
  height          smallint,                                       --身高
  weights         int,                                            --體重
  birthday        date,                                           --生日
  nationality     varchar(30),                                    --國籍
  photo           image                                           --照片
)
GO 

 insert into Players values ('林書緯','A122968632','210','90','1987-07-28','taiwan',0x1234);
 insert into Players values ('戴維斯','A126139660','200','69','1985-03-01','taiwan',0x1234);
 insert into Players values ('李維哲','A127805471','190','84','1993-09-05','taiwan',0x1234);
 insert into Players values ('李秉鴻','A125677552','182','78','1991-05-20','taiwan',0x1234);
 insert into Players values ('陳世念','A124525651','204','87','1982-11-14','taiwan',0x1234);
 insert into Players values ('陳子威','A127770997','197','94','1983-04-05','taiwan',0x1234);
 insert into Players values ('蘇翊傑','A124178380','194','82','1985-09-11','taiwan',0x1234);
 insert into Players values ('周儀翔','A124987511','181','84','1992-09-11','taiwan',0x1234);
 insert into Players values ('蔡文誠','A126588446','184','69','1995-05-22','taiwan',0x1234);
 insert into Players values ('李維哲','A124435847','202','68','1995-01-07','taiwan',0x1234);
 insert into Players values ('呂政儒','A124178380','194','82','1985-09-11','taiwan',0x1234);
 insert into Players values ('周士淵','A121734759','200','84','1982-05-04','taiwan',0x1234);
 insert into Players values ('林金榜','A126897658','199','83','1989-12-14','taiwan',0x1234);
 insert into Players values ('蔣淯安','A123199735','199','73','1988-06-22','taiwan',0x1234);
 insert into Players values ('林宜輝','A126337429','195','69','1993-11-24','taiwan',0x1234);
 insert into Players values ('于煥亞','A125746649','205','79','1994-09-04','taiwan',0x1234);
 insert into Players values ('簡偉儒','A125411371','187','84','1994-02-04','taiwan',0x1234);
 insert into Players values ('周柏臣','A122755235','194','71','1989-10-13','taiwan',0x1234);
 insert into Players values ('宋宇軒','A122583115','189','86','1991-08-14','taiwan',0x1234);
 insert into Players values ('張博勝','A121693866','183','88','1995-09-28','taiwan',0x1234);
 insert into Players values ('林韋翰','A126417438','187','89','1984-12-16','taiwan',0x1234);
 insert into Players values ('李愷諺','A121395548','207','65','1981-04-06','taiwan',0x1234);
 insert into Players values ('周伯勳','A129695227','208','80','1990-10-19','taiwan',0x1234);
 insert into Players values ('陳順詳','A122939189','187','84','1989-02-09','taiwan',0x1234);
 insert into Players values ('張伯維','A127195327','194','77','1985-12-05','taiwan',0x1234);
 insert into Players values ('陳堅恩','A129859494','185','91','1983-08-23','taiwan',0x1234);
 insert into Players values ('施顏宗','A123624169','188','77','1985-01-25','taiwan',0x1234);
 insert into Players values ('施晉堯','A127854445','207','85','1982-01-20','taiwan',0x1234);
 insert into Players values ('朱億宗','A126277964','182','67','1994-04-12','taiwan',0x1234);
 insert into Players values ('洪志善','A121214688','196','78','1982-06-10','taiwan',0x1234);
 insert into Players values ('胡凱翔','A127224877','198','75','1987-09-17','taiwan',0x1234);
 insert into Players values ('劉韋辰','A128219458','189','81','1988-05-01','taiwan',0x1234);
 insert into Players values ('郭少傑','A127695785','210','67','1983-11-19','taiwan',0x1234);
 insert into Players values ('王泰傑','A124525225','186','81','1985-02-17','taiwan',0x1234);
 insert into Players values ('李啟瑋','A128364473','191','77','1984-09-24','taiwan',0x1234);

 select * from Players
 GO

 ---------------------------------------------------------------------------------------------------------------
 
create table LocationInfo     --場地資訊
(
  locationID             int primary key IDENTITY (101,1),  --場地ID
  locationName           nvarchar(50),						--場地名稱
  locationAddr           nvarchar(100),						--地址
  --locationPhoto          image,								--場地圖片
)
GO

insert into LocationInfo values ('新竹市立體育館','新竹市公園路295號');
insert into LocationInfo values ('桃園市立體育館','桃園市桃園區三民路一段一號');
insert into LocationInfo values ('高雄市鳳山體育館','高雄市鳳山區體育路65號');
insert into LocationInfo values ('新北市政府體育處樹林場區','新北市樹林區水源街81號');

select * from LocationInfo
GO

---------------------------------------------------------------------------------------------------------------

 create table Teams			--球隊
(
  teamID                  int primary key IDENTITY (3001,1),        --球隊ID
  captainID               int references Players(playerID ),        --隊長ID
  captainEmail            varchar(30),                              --隊長Email
  captainPhone            varchar(20),                              --隊長連絡電話
  locationID              int,	                                    --主場ID
  teamName                nvarchar(10),                             --球隊名稱
  coachName               nvarchar(10),                             --總教練
  bossName                nvarchar(10),                             --老闆
  teamBadge               image,                                    --隊徽
  totalWin                int,                                      --總勝場數
  totalLose               int,                                      --總敗場數
  winRate                 float,                                    --勝率
  remarks                 nvarchar(200),                            --備註
)
GO

insert into Teams values('70001','adfs156@gmail.com','0910123456','104','富邦勇士','顏行書','富邦育樂股份有限公司','','17','13','56.6','');
insert into Teams values('70002','agfsdg43@gmail.com','0910987564','102','台灣啤酒','周俊三','台灣菸酒公司','','30','8','60.54','');
insert into Teams values('70003','gndf65ndnvb@ymail.com','0910125568','','臺灣銀行','韋陳明','臺灣銀行','','20','25','78.56','');
insert into Teams values('70004','gnddn40684@ymail.com','0910216508','103','金門酒廠','楊哲宜','金門酒廠','','25','28','87.87','');
insert into Teams values('70005','gfsdhsd0890@gmail.com','0910123256','','裕隆納智捷','魏永泰','裕隆汽車','','37','32','43.38','');
insert into Teams values('70006','gfsdhsd0890@gmail.com','0910123256','','桃園璞園建築','麥班達','璞園建築','','14','16','46.66','');
insert into Teams values('70007','gfsdhsd0890@gmail.com','0910123256','','臺北達欣工程','邱大宗','達欣工程','','21','9','70.00','');

select * from Teams
GO

---------------------------------------------------------------------------------------------------------------


 create table Games			--賽事
(
  gameID                       int primary key IDENTITY (4001,1),                  --賽事ID
  groupID                      int  references Groups(groupID ),	               --分組ID  
  locationID                   int  references LocationInfo(locationID ),          --比賽地點
  teamAID                      int  references Teams(teamID ),					   --A隊ID
  teamAScore                   int,                                                --A隊得分
  teamBID                      int  references Teams(teamID ),					   --B隊ID
  teamBScore                   int,                                                --B隊得分
  winnerID                     int,                                                --獲勝隊伍ID
  gameBeginDate                datetime,                                           --賽事開始時間
  gameEndDate                  datetime,                                           --賽事結束時間
 )
 GO


 insert into Games values('2001','101','3001','80','3002','75','3001','2018-01-20 10:00','2018-01-20 12:00');
 insert into Games values('2001','101','3002','78','3003','75','3002','2018-01-21 10:00','2018-01-21 12:00');
 insert into Games values('2001','101','3004','82','3002','55','3004','2018-01-22 10:00','2018-01-22 12:00');
 insert into Games values('2001','101','3003','90','3002','77','3003','2018-01-23 10:00','2018-01-23 12:00');
 insert into Games values('2001','101','3001','80','3002','55','3001','2018-01-24 10:00','2018-01-24 12:00');

 select * from Games
 GO


 ---------------------------------------------------------------------------------------------------------------

 create table GroupRegistration                    --分組報名表
(
  teamID                       int references Teams(teamID ),	         --球隊ID
  groupID                      int references Groups(groupID ),          --分組ID
  teamStat                     int,                                      --球隊報名狀態
  registerDate                 datetime,                                 --球隊報名時間
  paymentNumber                char(5),                                  --繳費後五碼

   CONSTRAINT GroupReg_CPK PRIMARY KEY (teamID, groupID)
 )
GO  

insert into GroupRegistration values('3001','2001','1','2017-06-06 11:58','45789');
insert into GroupRegistration values('3002','2001','1','2017-07-08 12:55','12345');
insert into GroupRegistration values('3003','2001','1','2017-08-08 10:25','54458');
insert into GroupRegistration values('3004','2001','1','2017-08-06 08:58','45684');
insert into GroupRegistration values('3005','2001','1','2017-07-06 10:00','12345');
insert into GroupRegistration values('3002','2002','1','2017-05-06 11:22','14789');
insert into GroupRegistration values('3004','2002','1','2017-06-06 11:52','12366');

select * from GroupRegistration
GO

 --------------------------------------------------------------------------------------------------------------- 

create table TeamComposition        --球隊構成表
( 
  teamID                     int  references Teams(teamID),       --球隊ID
  playerID                   int  references Players(playerID),   --球員ID
  playerNo                   tinyint,                             --背號
  playerRole                 varchar(2),                          --位置
  joinTeamDate               smalldatetime,                       --加入球隊時間
  leaveTeamDate              smalldatetime,                       --離開球隊時間

  CONSTRAINT TeamComposition_CPK PRIMARY KEY (teamID, playerID)
) 
GO

insert into TeamComposition values ('3001','70001','53','SF','2014-03-14','1900-01-01');
insert into TeamComposition values ('3002','70002','4','SG','2013-09-30','1900-01-01');
insert into TeamComposition values ('3003','70003','10','C','2015-11-17','1900-01-01');
insert into TeamComposition values ('3004','70004','92','PF','2015-09-03','1900-01-01');
insert into TeamComposition values ('3005','70005','84','C','2017-12-08','1900-01-01');
insert into TeamComposition values ('3006','70006','43','SF','2014-02-25','1900-01-01');
insert into TeamComposition values ('3007','70007','34','SG','2013-02-26','1900-01-01');
insert into TeamComposition values ('3001','70008','23','PF','2011-01-26','1900-01-01');
insert into TeamComposition values ('3002','70009','4','C','2013-01-10','1900-01-01');
insert into TeamComposition values ('3003','70010','87','PF','2013-06-22','1900-01-01');
insert into TeamComposition values ('3004','70011','79','SG','2011-04-15','1900-01-01');
insert into TeamComposition values ('3005','70012','47','SF','2017-05-19','1900-01-01');
insert into TeamComposition values ('3006','70013','11','SF','2012-09-10','1900-01-01');
insert into TeamComposition values ('3007','70014','98','PF','2011-04-26','1900-01-01');
insert into TeamComposition values ('3001','70015','70','PF','2015-02-14','1900-01-01');
insert into TeamComposition values ('3002','70016','76','SG','2016-02-11','1900-01-01');
insert into TeamComposition values ('3003','70017','31','SG','2015-11-05','1900-01-01');
insert into TeamComposition values ('3004','70018','30','SG','2015-08-06','1900-01-01');
insert into TeamComposition values ('3005','70019','76','PF','2012-09-24','1900-01-01');
insert into TeamComposition values ('3006','70020','89','PG','2013-08-03','1900-01-01');
insert into TeamComposition values ('3007','70021','82','PG','2013-12-07','1900-01-01');
insert into TeamComposition values ('3001','70022','63','SG','2013-11-30','1900-01-01');
insert into TeamComposition values ('3002','70023','83','SG','2013-01-02','1900-01-01');
insert into TeamComposition values ('3003','70024','57','C','2015-11-03','1900-01-01');
insert into TeamComposition values ('3004','70025','54','PF','2014-11-14','1900-01-01');
insert into TeamComposition values ('3005','70026','52','SG','2016-07-07','1900-01-01');
insert into TeamComposition values ('3006','70027','35','PG','2012-04-15','1900-01-01');
insert into TeamComposition values ('3007','70028','10','PG','2013-01-10','1900-01-01');
insert into TeamComposition values ('3001','70029','81','SG','2016-02-14','1900-01-01');
insert into TeamComposition values ('3002','70030','75','SF','2017-02-21','1900-01-01');
insert into TeamComposition values ('3003','70031','83','PG','2015-11-26','1900-01-01');
insert into TeamComposition values ('3004','70032','5','SG','2013-01-22','1900-01-01');
insert into TeamComposition values ('3005','70033','51','C','2013-06-26','1900-01-01');
insert into TeamComposition values ('3006','70034','28','SF','2011-12-28','1900-01-01');
insert into TeamComposition values ('3007','70035','91','SF','2016-11-11','1900-01-01');

select * from TeamComposition
GO

---------------------------------------------------------------------------------------------------------------

create table PersonalData    --個人比賽數據
( 
  playerID            int references Players(playerID),   --球員ID
  gameID              int references Games(gameID),       --賽事ID
  teamID              int  references Teams(teamID),      --球隊ID
  quarters            char,               --節數
  quarterTime         INT,                --單節出場時間 (單位:秒)
  twoPoint            INT,                --兩分命中數
  twoPointShot        INT,                --兩分出手數
  threePoint          INT,                --三分命中數
  threePointShot      INT,                --三分出手數
  fg                  INT,                --罰球命中數
  fgShot              INT,                --罰球出手數
  offReb              INT,                --進攻籃板
  defReb              INT,                --防守籃板
  assist              INT,                --助攻
  steal               INT,                --抄截
  blocks              INT,                --阻攻
  turnover            INT,                --失誤
  startingPlayer      TINYINT             --是否先發

  CONSTRAINT PersonalData_CPK PRIMARY KEY (playerID, gameID,quarters)
) 
GO

insert into PersonalData values ('70001','4001','3001','1','600','3','4','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70001','4001','3001','2','388','2','5','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70001','4001','3001','4','542','10','12','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70002','4001','3001','1','555','2','4','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70002','4001','3001','3','600','8','8','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70003','4002','3001','2','352','5','8','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70003','4002','3001','3','250','0','3','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70004','4002','3001','2','600','0','2','2','2','1','2','3','6','2','1','0','1','1');
insert into PersonalData values ('70004','4002','3001','4','550','1','4','2','2','1','2','3','6','2','1','0','1','1');

select * from PersonalData
GO

 ---------------------------------------------------------------------------------------------------------------

create table GameMedia    --賽事影音
(
gameID					int  references Games(gameID ),        --賽事ID
mediaID                 int  primary key IDENTITY (6001,1),    --影音編號
mediasName              nvarchar(20),                          --影音名稱
gameVideo			    varchar(200),                          --賽事影片(連結)
gamePhoto			    Image,                                 --賽事照片
mediaType               varchar(10),                           --檔案類型
mediaDate               datetime,                              --日期
descriptions            nvarchar(200),                         --描述
tag                     nvarchar(200),                         --Tag
)
GO 

insert into GameMedia values('4001','張君雅單手爆扣','https://youtube.com/d2gKL2548GD','','video','2017-06-06','技壓全場!!張君雅連過三人單手爆扣!!','達欣,張君雅,單手爆扣');


select * from GameMedia
GO

---------------------------------------------------------------------------------------------------------------

create table MemberInfo --會員資料
(
memberID             int  primary key IDENTITY (8001,1),  --會員ID
acc                  varchar(20),                                           --帳號(Gmail)
name                 varchar(20),                                           --名稱
auth                 varchar(20),                                           --權限
registerTime         datetime,                                              --註冊時間
teamID               int,                                                   --球隊ID
)

insert into MemberInfo values('admin123@gmail.com','admin01','admin','2017-09-23','');
insert into MemberInfo values('zxcv456@gmail.com','達欣','teams','2017-09-23','7001');
insert into MemberInfo values('gjdio398@gmail.com','張偉','parttime','2017-09-23','');

select * from MemberInfo
GO

---------------------------------------------------------------------------------------------------------------

create table PlayerGroups      --球員分組表
(
 groupID              int references Groups(groupID ),	    --分組ID 
 playerID             int references Players(playerID ),    --球員ID

 CONSTRAINT PlayerGroups_CPK PRIMARY KEY (groupID, playerID)
)

select * from PlayerGroups
GO