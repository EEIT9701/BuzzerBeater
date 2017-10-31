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

--insert into Season values ('2015-16例行賽','2015-10-28','2016-04-13','2015-01-01','2015-9-30',null);
insert into Season values ('2016-17例行賽','2016-10-25','2017-04-12','2016-01-01','2016-9-30',null);
insert into Season values ('2017-18例行賽','2017-10-18','2018-04-12','2017-01-01','2017-9-30',null);
insert into Season values ('測試用例行賽','2018-10-18','2019-04-12','2017-10-01','2017-12-30',null);

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

 insert into Groups values ('1001','東區','8','4','1','15','7');
 insert into Groups values ('1001','西區','8','4','4','15','7');       -- 這個分組比賽資料為主

 insert into Groups values ('1002','東區','8','4','0','15','7');
 insert into Groups values ('1002','西區','8','4','0','15','7');

 insert into Groups values ('1003','測試A區','8','4','6','15','7');
 insert into Groups values ('1003','測試B區','8','4','8','15','7');
 
 select * from Groups
 GO

 ---------------------------------------------------------------------------------------------------------------
 
 create table Players        --球員
( 
  playerID        int primary key IDENTITY (70001,1),             --球員ID
  playerName      nvarchar(20),                                   --球員姓名
  id              varchar(20),                                    --身分證字號
  height          float,                                       --身高
  weights         float,                                            --體重
  birthday        date,                                           --生日
  nationality     varchar(30),                                    --國籍
  photo           varchar(max),                                           --照片
)
GO 

insert into Players values ('Matt Barnes','A122968632','201 ','103 ','1980/3/9','us',null);
insert into Players values ('Ian Clark','A122968633','191 ','79 ','1991/3/7','us',null);
insert into Players values ('Stephen Curry','A122968634','191 ','86 ','1988/3/14','us',null);
insert into Players values ('Kevin Durant','A122968635','206 ','109 ','1988/9/29','us',null);
insert into Players values ('Draymond Green','A122968636','201 ','104 ','1990/3/4','us',null);
insert into Players values ('Andre Iguodala','A122968637','198 ','98 ','1984/1/28','us',null);
insert into Players values ('Damian Jones','A122968638','213 ','111 ','1995/6/30','us',null);
insert into Players values ('Shaun Livingston','A122968639','201 ','87 ','1985/9/11','us',null);
insert into Players values ('Kevon Looney','A122968640','206 ','100 ','1996/2/6','us',null);
insert into Players values ('James Michael McAdoo','A122968641','206 ','104 ','1993/1/4','us',null);
insert into Players values ('Patrick McCaw','A122968642','201 ','84 ','1995/10/25','us',null);
insert into Players values ('JaVale McGee','A122968643','213 ','123 ','1988/1/19','us',null);
insert into Players values ('Zaza Pachulia','A122968644','211 ','123 ','1984/2/10','ge',null);
insert into Players values ('Klay Thompson','A122968645','201 ','98 ','1990/2/8','us',null);
insert into Players values ('Anderson Varejao','A122968646','208 ','124 ','1982/9/28','br',null);
insert into Players values ('Briante Weber','A122968647','188 ','75 ','1992/12/29','us',null);
insert into Players values ('David West','A122968648','206 ','114 ','1980/8/29','us',null);
insert into Players values ('LaMarcus Aldridge','A122968649','211 ','118 ','1985/7/19','us',null);
insert into Players values ('Kyle Anderson','A122968650','206 ','104 ','1993/9/20','us',null);
insert into Players values ('Joel Anthony','A122968651','206 ','111 ','1982/8/9','ca',null);
insert into Players values ('Davis Bertans','A122968652','208 ','95 ','1992/11/12','lv',null);
insert into Players values ('Dewayne Dedmon','A122968653','213 ','111 ','1989/8/12','us',null);
insert into Players values ('Bryn Forbes','A122968654','191 ','86 ','1993/7/23','us',null);
insert into Players values ('Pau Gasol','A122968655','213 ','114 ','1980/7/6','es',null);
insert into Players values ('Manu Ginobili','A122968656','198 ','93 ','1977/7/28','ar',null);
insert into Players values ('Danny Green','A122968657','198 ','98 ','1987/6/22','us',null);
insert into Players values ('Nicolas Laprovittola','A122968658','193 ','82 ','1990/1/31','ar',null);
insert into Players values ('David Lee','A122968659','206 ','111 ','1983/4/29','us',null);
insert into Players values ('Kawhi Leonard','A122968660','201 ','104 ','1991/6/29','us',null);
insert into Players values ('Patty Mills','A122968661','183 ','84 ','1988/8/11','au',null);
insert into Players values ('Dejounte Murray','A122968662','196 ','77 ','1996/9/19','us',null);
insert into Players values ('Tony Parker','A122968663','188 ','84 ','1982/5/17','be',null);
insert into Players values ('Jonathon Simmons','A122968664','198 ','89 ','1989/9/14','us',null);
insert into Players values ('Ryan Anderson','A122968665','208 ','109 ','1988/5/6','us',null);
insert into Players values ('Trevor Ariza','A122968666','203 ','98 ','1985/6/30','us',null);
insert into Players values ('Patrick Beverley','A122968667','185 ','84 ','1988/7/12','us',null);
insert into Players values ('Corey Brewer','A122968668','206 ','84 ','1986/3/5','us',null);
insert into Players values ('Bobby Brown','A122968669','188 ','79 ','1984/9/24','us',null);
insert into Players values ('Clint Capela','A122968670','208 ','109 ','1994/5/18','ch',null);
insert into Players values ('Sam Dekker','A122968671','206 ','104 ','1994/5/6','us',null);
insert into Players values ('Tyler Ennis','A122968672','191 ','88 ','1994/8/24','ca',null);
insert into Players values ('Eric Gordon','A122968673','193 ','98 ','1988/12/25','us',null);
insert into Players values ('James Harden','A122968674','196 ','100 ','1989/8/26','us',null);
insert into Players values ('Montrezl Harrell','A122968675','203 ','109 ','1994/1/26','us',null);
insert into Players values ('Nene Hilario','A122968676','211 ','114 ','1982/9/13','br',null);
insert into Players values ('K.J. McDaniels','A122968677','198 ','93 ','1993/2/9','us',null);
insert into Players values ('Chinanu Onuaku','A122968678','208 ','111 ','1996/11/1','us',null);
insert into Players values ('Isaiah Taylor','A122968679','191 ','77 ','1994/7/11','us',null);
insert into Players values ('Lou Williams','A122968680','185 ','79 ','1986/10/27','us',null);
insert into Players values ('Troy Williams','A122968681','201 ','99 ','1994/12/30','us',null);
insert into Players values ('Kyle Wiltjer','A122968682','208 ','109 ','1992/10/20','us',null);
insert into Players values ('Alan Anderson','A122968683','198 ','100 ','1982/10/16','us',null);
insert into Players values ('Brandon Bass','A122968684','203 ','114 ','1985/4/30','us',null);
insert into Players values ('Jamal Crawford','A122968685','196 ','91 ','1980/3/20','us',null);
insert into Players values ('Raymond Felton','A122968686','185 ','93 ','1984/6/26','us',null);
insert into Players values ('Blake Griffin','A122968687','208 ','114 ','1989/3/16','us',null);
insert into Players values ('Brice Johnson','A122968688','208 ','104 ','1994/6/27','us',null);
insert into Players values ('Wesley Johnson','A122968689','201 ','98 ','1987/7/11','us',null);
insert into Players values ('DeAndre Jordan','A122968690','211 ','120 ','1988/7/21','us',null);
insert into Players values ('Luc Mbah a Moute','A122968691','203 ','104 ','1986/9/9','cm',null);
insert into Players values ('Chris Paul','A122968692','183 ','79 ','1985/5/6','us',null);
insert into Players values ('Paul Pierce','A122968693','201 ','107 ','1977/10/13','us',null);
insert into Players values ('J.J. Redick','A122968694','193 ','86 ','1984/6/24','us',null);
insert into Players values ('Austin Rivers','A122968695','193 ','91 ','1992/8/1','us',null);
insert into Players values ('Marreese Speights','A122968696','208 ','116 ','1987/8/4','us',null);
insert into Players values ('Diamond Stone','A122968697','211 ','116 ','1997/2/10','us',null);
insert into Players values ('Joel Bolomboy','A122968698','206 ','107 ','1994/1/28','ua',null);
insert into Players values ('Alec Burks','A122968699','198 ','97 ','1991/7/20','us',null);
insert into Players values ('Boris Diaw','A122968700','203 ','114 ','1982/4/16','fr',null);
insert into Players values ('Dante Exum','A122968701','198 ','86 ','1995/7/13','au',null);
insert into Players values ('Derrick Favors','A122968702','208 ','120 ','1991/7/15','us',null);
insert into Players values ('Rudy Gobert','A122968703','216 ','111 ','1992/6/26','fr',null);
insert into Players values ('Gordon Hayward','A122968704','203 ','103 ','1990/3/23','us',null);
insert into Players values ('George Hill','A122968705','191 ','85 ','1986/5/4','us',null);
insert into Players values ('Rodney Hood','A122968706','203 ','94 ','1992/10/20','us',null);
insert into Players values ('Joe Ingles','A122968707','203 ','103 ','1987/10/2','au',null);
insert into Players values ('Joe Johnson','A122968708','201 ','109 ','1981/6/29','us',null);
insert into Players values ('Trey Lyles','A122968709','208 ','106 ','1995/11/5','ca',null);
insert into Players values ('Shelvin Mack','A122968710','191 ','92 ','1990/4/22','us',null);
insert into Players values ('Raul Neto','A122968711','185 ','81 ','1992/5/19','br',null);
insert into Players values ('Jeff Withey','A122968712','213 ','105 ','1990/3/7','us',null);
insert into Players values ('Alex Abrines','A122968713','198 ','86 ','1993/8/1','es',null);
insert into Players values ('Steven Adams','A122968714','213 ','116 ','1993/7/20','nz',null);
insert into Players values ('Semaj Christon','A122968715','191 ','86 ','1992/11/1','us',null);
insert into Players values ('Norris Cole','A122968716','188 ','79 ','1988/10/13','us',null);
insert into Players values ('Nick Collison','A122968717','208 ','116 ','1980/10/26','us',null);
insert into Players values ('Taj Gibson','A122968718','206 ','102 ','1985/6/24','us',null);
insert into Players values ('Jerami Grant','A122968719','203 ','95 ','1994/3/12','us',null);
insert into Players values ('Josh Huestis','A122968720','201 ','104 ','1991/12/19','us',null);
insert into Players values ('Ersan Ilyasova','A122968721','208 ','107 ','1987/5/15','tr',null);
insert into Players values ('Enes Kanter','A122968722','211 ','111 ','1992/5/20','ch',null);
insert into Players values ('Joffrey Lauvergne','A122968723','211 ','100 ','1991/9/30','fr',null);
insert into Players values ('Doug McDermott','A122968724','203 ','102 ','1992/1/3','us',null);
insert into Players values ('Anthony Morrow','A122968725','196 ','95 ','1985/9/27','us',null);
insert into Players values ('Victor Oladipo','A122968726','193 ','95 ','1992/5/4','us',null);
insert into Players values ('Cameron Payne','A122968727','191 ','84 ','1994/8/8','us',null);
insert into Players values ('Andre Roberson','A122968728','201 ','95 ','1991/12/4','us',null);
insert into Players values ('Domantas Sabonis','A122968729','211 ','109 ','1996/5/3','us',null);
insert into Players values ('Kyle Singler','A122968730','203 ','104 ','1988/5/4','us',null);
insert into Players values ('Russell Westbrook','A122968731','191 ','91 ','1988/11/12','us',null);
insert into Players values ('Tony Allen','A122968732','193 ','97 ','1982/1/11','us',null);
insert into Players values ('Wade Baldwin','A122968733','193 ','92 ','1996/3/29','us',null);
insert into Players values ('Vince Carter','A122968734','198 ','100 ','1977/1/26','us',null);
insert into Players values ('Mike Conley','A122968735','185 ','79 ','1987/10/11','us',null);
insert into Players values ('Troy Daniels','A122968736','193 ','93 ','1991/7/15','us',null);
insert into Players values ('Deyonta Davis','A122968737','211 ','108 ','1996/12/2','us',null);
insert into Players values ('Toney Douglas','A122968738','188 ','89 ','1986/3/16','us',null);
insert into Players values ('James Ennis','A122968739','201 ','95 ','1990/7/1','us',null);
insert into Players values ('Marc Gasol','A122968740','216 ','116 ','1985/1/29','es',null);
insert into Players values ('JaMychal Green','A122968741','206 ','103 ','1990/6/21','us',null);
insert into Players values ('Andrew Harrison','A122968742','198 ','97 ','1994/10/28','us',null);
insert into Players values ('Jarell Martin','A122968743','208 ','109 ','1994/5/24','us',null);
insert into Players values ('Chandler Parsons','A122968744','208 ','104 ','1988/10/25','us',null);
insert into Players values ('Zach Randolph','A122968745','206 ','118 ','1981/7/16','us',null);
insert into Players values ('Wayne Selden','A122968746','196 ','104 ','1994/9/30','us',null);
insert into Players values ('Troy Williams','A122968747','201 ','99 ','1994/12/30','us',null);
insert into Players values ('Brandan Wright','A122968748','208 ','95 ','1987/10/5','us',null);
insert into Players values ('Al-Farouq Aminu','A122968749','206 ','100 ','1990/9/21','us',null);
insert into Players values ('Pat Connaughton','A122968750','196 ','94 ','1993/1/6','us',null);
insert into Players values ('Allen Crabbe','A122968751','198 ','95 ','1992/4/9','us',null);
insert into Players values ('Ed Davis','A122968752','208 ','109 ','1989/6/5','us',null);
insert into Players values ('Maurice Harkless','A122968753','206 ','98 ','1993/5/11','us',null);
insert into Players values ('Jake Layman','A122968754','206 ','95 ','1994/3/7','us',null);
insert into Players values ('Meyers Leonard','A122968755','216 ','111 ','1992/2/27','us',null);
insert into Players values ('Damian Lillard','A122968756','191 ','89 ','1990/7/15','us',null);
insert into Players values ('C.J. McCollum','A122968757','191 ','86 ','1991/9/19','us',null);
insert into Players values ('Shabazz Napier','A122968758','185 ','79 ','1991/7/14','us',null);
insert into Players values ('Jusuf Nurkic','A122968759','213 ','127 ','1994/8/23','ba',null);
insert into Players values ('Mason Plumlee','A122968760','211 ','111 ','1990/3/5','us',null);
insert into Players values ('Tim Quarterman','A122968761','198 ','89 ','1994/10/27','us',null);
insert into Players values ('Evan Turner','A122968762','201 ','100 ','1988/10/27','us',null);
insert into Players values ('Noah Vonleh','A122968763','208 ','109 ','1995/8/24','us',null);
 
 select * from Players 
 GO
 ---------------------------------------------------------------------------------------------------------------
 
create table LocationInfo     --場地資訊
(
  locationID             int primary key IDENTITY (101,1),  --場地ID
  locationName           nvarchar(20),						--場地名稱
  locationAddr           nvarchar(500),						--地址
  locationMark           nvarchar(500),                      --Mark(googleMap)
  locationPhoto          nvarchar(max),                 --場地圖片
)
GO

insert into LocationInfo values ('甲骨文體育館','美國加州奧克蘭','Oracle Arena 美國 California, Oakland, Coliseum Way','');
insert into LocationInfo values ('AT&T中心','德克薩斯州聖安東尼奧','AT&T中心 美國 Texas, San Antonio, AT&T Center Parkway','');
insert into LocationInfo values ('豐田中心球館','德克薩斯州休士頓','Toyota Center, 1510 Polk St, Houston, TX 77002美國','');
insert into LocationInfo values ('史坦波中心','蓋瑞福尼亞州洛杉磯史坦波中心','史坦波中心 美國 California, Los Angeles, S Figueroa St','');

insert into LocationInfo values ('Vivint智慧家庭體育館','猶他州鹽湖城','能源方案球館 美國 Utah, Salt Lake City, S Temple','');
insert into LocationInfo values ('切薩皮克能源球場','奧克拉荷馬州奧克拉荷馬市','契薩皮克能源公司球場 美國 Oklahoma, Oklahoma City, W Reno Ave','');
insert into LocationInfo values ('聯邦快遞廣場','田納西州曼非斯','聯邦快遞廣場 美國 Tennessee, Memphis, Beale St, 郵政編碼: 38103','');
insert into LocationInfo values ('摩達中心','奧勒岡州波特蘭','摩達中心 美國 Oregon, Portland, N Center Ct St, 郵政編碼: 97227','');


select * from LocationInfo
GO

---------------------------------------------------------------------------------------------------------------

 create table Teams			--球隊
(
  teamID                  int primary key IDENTITY (3001,1),        --球隊ID
  captainID               int,                                       --隊長ID
  captainEmail            varchar(40),                              --隊長Email
  captainPhone            varchar(20),                              --隊長連絡電話
  locationID              int,	                                    --主場ID
  teamName                nvarchar(40),                             --球隊名稱
  coachName               nvarchar(30),                             --總教練
  bossName                nvarchar(30),                             --老闆
  teamBadge               nvarchar(max),                                    --隊徽
  totalWin                int,                                      --總勝場數
  totalLose               int,                                      --總敗場數
  winRate                 float,                                    --勝率
  remarks                 nvarchar(200),                            --備註
)
GO

insert into Teams values('70001','GoldenStateWarriors@gmail.com','0911123456','101','金州勇士','Steve Kerr','Joe Lacob','0x1234','','','','');
insert into Teams values('70002','SanAntonioSpurs@gmail.com','09121222666','102','聖安東尼奧馬刺','Gregg Popovich','Peter Holt','0x1234','','','','');
insert into Teams values('70003','HoustonRockets@ymail.com','0913125568','103','休士頓火箭','Mike DAntoni','Leslie Alexander','0x1234','','','','');
insert into Teams values('70004','LosAngelesClippers@ymail.com','0914125568','104','洛杉磯快艇','Doc Rivers','Steve Anthony Ballmer','','','','','');

insert into Teams values('70005','UtahJazz@ymail.com','0915125568','105','Utah Jazz','猶他爵士','Larry H. Miller','0x1234','','','','');
insert into Teams values('70006','OklahomaCityThunder@ymail.com','0916125568','106','奧克拉荷馬市雷霆','Billy Donovan','Clay Bennett','','','','','');
insert into Teams values('70007','MemphisGrizzlies@ymail.com','0917125568','107','曼斐斯灰熊','David Fizdale','Robert Pera','','','','','');
insert into Teams values('70008','PortlandTrail@ymail.com','0917125568','108','波特蘭拓荒者','Terry Stotts','Paul Gardner Allen','','','','','');


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

 insert into Games values('2002','102','3002','129','3001','100','3002','2016-10-25 10:30','2016-10-25 12:30');
 insert into Games values('2002','103','3003','132','3001','127','3003','2016-10-25 12:30','2016-10-25 14:30');
 insert into Games values('2002','101','3001','115','3004','98','3001','2016-10-25 14:30','2016-10-25 16:30');
 insert into Games values('2002','104','3004','116','3002','92','3004','2016-10-26 10:30','2016-10-26 12:30');
 insert into Games values('2002','103','3003','101','3002','99','3003','2016-10-26 12:30','2016-10-26 14:30');
 insert into Games values('2002','104','3003','140','3004','116','3004','2016-10-26 16:30','2016-10-26 18:30');

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
  primary key(teamID,groupID)
 )
GO  

insert into GroupRegistration values('3001','2002','1','2016-06-06 11:58','45671');
insert into GroupRegistration values('3002','2002','1','2016-06-07 09:48','45672');
insert into GroupRegistration values('3003','2002','1','2016-06-07 12:58','45673');
insert into GroupRegistration values('3004','2002','1','2016-06-08 15:38','45674');


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
  primary key(teamID,playerID)
) 
GO

insert into TeamComposition values ('3001','70001','22','SF','2016/6/6','');
insert into TeamComposition values ('3001','70002','21','SG','2016/6/6','');
insert into TeamComposition values ('3001','70003','30','PG','2016/6/6','');
insert into TeamComposition values ('3001','70004','35','SF','2016/6/6','');
insert into TeamComposition values ('3001','70005','23','PF','2016/6/6','');
insert into TeamComposition values ('3001','70006','9','SF','2016/6/6','');
insert into TeamComposition values ('3001','70007','15','C','2016/6/6','');
insert into TeamComposition values ('3001','70008','34','PG','2016/6/6','');
insert into TeamComposition values ('3001','70009','5','C','2016/6/6','');
insert into TeamComposition values ('3001','70010','20','PF','2016/6/6','');
insert into TeamComposition values ('3001','70011','0','SG','2016/6/6','');
insert into TeamComposition values ('3001','70012','1','C','2016/6/6','');
insert into TeamComposition values ('3001','70013','27','C','2016/6/6','');
insert into TeamComposition values ('3001','70014','11','SG','2016/6/6','');
insert into TeamComposition values ('3001','70015','18','C','2016/6/6','');
insert into TeamComposition values ('3001','70016','2','PG','2016/6/6','');
insert into TeamComposition values ('3001','70017','3','C','2016/6/6','');
insert into TeamComposition values ('3002','70018','12','PF','2016/6/7','');
insert into TeamComposition values ('3002','70019','1','SG','2016/6/7','');
insert into TeamComposition values ('3002','70020','30','C','2016/6/7','');
insert into TeamComposition values ('3002','70021','42','PF','2016/6/7','');
insert into TeamComposition values ('3002','70022','3','C','2016/6/7','');
insert into TeamComposition values ('3002','70023','11','SG','2016/6/7','');
insert into TeamComposition values ('3002','70024','16','C','2016/6/7','');
insert into TeamComposition values ('3002','70025','20','SG','2016/6/7','');
insert into TeamComposition values ('3002','70026','14','SG','2016/6/7','');
insert into TeamComposition values ('3002','70027','27','PG','2016/6/7','');
insert into TeamComposition values ('3002','70028','10','PF','2016/6/7','');
insert into TeamComposition values ('3002','70029','2','SF','2016/6/7','');
insert into TeamComposition values ('3002','70030','8','PG','2016/6/7','');
insert into TeamComposition values ('3002','70031','5','PG','2016/6/7','');
insert into TeamComposition values ('3002','70032','9','PG','2016/6/7','');
insert into TeamComposition values ('3002','70033','17','SG','2016/6/7','');
insert into TeamComposition values ('3003','70034','3','PF','2016/6/7','');
insert into TeamComposition values ('3003','70035','1','SF','2016/6/7','');
insert into TeamComposition values ('3003','70036','2','SG','2016/6/7','');
insert into TeamComposition values ('3003','70037','33','SF','2016/6/7','');
insert into TeamComposition values ('3003','70038','8','PG','2016/6/7','');
insert into TeamComposition values ('3003','70039','15','C','2016/6/7','');
insert into TeamComposition values ('3003','70040','7','SF','2016/6/7','');
insert into TeamComposition values ('3003','70041','6','PG','2016/6/7','');
insert into TeamComposition values ('3003','70042','10','SG','2016/6/7','');
insert into TeamComposition values ('3003','70043','13','PG','2016/6/7','');
insert into TeamComposition values ('3003','70044','5','C','2016/6/7','');
insert into TeamComposition values ('3003','70045','42','C','2016/6/7','');
insert into TeamComposition values ('3003','70046','32','SF','2016/6/7','');
insert into TeamComposition values ('3003','70047','21','C','2016/6/7','');
insert into TeamComposition values ('3003','70048','17','PG','2016/6/7','');
insert into TeamComposition values ('3003','70049','12','SG','2016/6/7','');
insert into TeamComposition values ('3003','70050','14','SF','2016/6/7','');
insert into TeamComposition values ('3003','70051','30','PF','2016/6/7','');
insert into TeamComposition values ('3004','70052','9','SF','2016/6/8','');
insert into TeamComposition values ('3004','70053','30','PF','2016/6/8','');
insert into TeamComposition values ('3004','70054','11','SG','2016/6/8','');
insert into TeamComposition values ('3004','70055','2','PG','2016/6/8','');
insert into TeamComposition values ('3004','70056','32','PF','2016/6/8','');
insert into TeamComposition values ('3004','70057','10','PF','2016/6/8','');
insert into TeamComposition values ('3004','70058','33','SF','2016/6/8','');
insert into TeamComposition values ('3004','70059','6','C','2016/6/8','');
insert into TeamComposition values ('3004','70060','12','SF','2016/6/8','');
insert into TeamComposition values ('3004','70061','3','PG','2016/6/8','');
insert into TeamComposition values ('3004','70062','34','SF','2016/6/8','');
insert into TeamComposition values ('3004','70063','4','SG','2016/6/8','');
insert into TeamComposition values ('3004','70064','25','SG','2016/6/8','');
insert into TeamComposition values ('3004','70065','5','C','2016/6/8','');
insert into TeamComposition values ('3004','70066','0','C','2016/6/8','');



select * from TeamComposition
GO

---------------------------------------------------------------------------------------------------------------

create table PersonalData    --個人比賽數據
( 
  playerID            int references Players(playerID),   --球員ID
  gameID              int references Games(gameID),       --賽事ID
  teamID              int  references Teams(teamID),      --球隊ID
  gameTime			  int,               --出場時間 (單位: 秒)
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
  personalFouls       INT,                --犯規    %%
  points			  INT,                --得分    %%
  startingPlayer      INT             --是否先發
  primary key(playerID,gameID)
) 
GO

insert into PersonalData values (70018,4001,3002,2111,10,20,1,1,5,6,8,6,3,1,0,2,1,26,1);
insert into PersonalData values (70029,4001,3002,1923,10,21,0,3,15,15,3,2,3,5,0,2,1,35,1);
insert into PersonalData values (70032,4001,3002,1588,4,9,1,2,0,0,0,3,4,0,0,2,4,9,1);
insert into PersonalData values (70019,4001,3002,1344,1,1,1,1,0,0,2,2,0,1,0,0,1,3,1);
insert into PersonalData values (70024,4001,3002,1096,1,4,0,0,0,0,0,4,1,0,0,1,3,2,1);
insert into PersonalData values (70033,4001,3002,1690,8,14,3,5,1,3,1,3,3,0,1,2,2,20,0);
insert into PersonalData values (70025,4001,3002,1252,4,10,2,6,0,0,0,5,2,1,0,0,1,10,0);
insert into PersonalData values (70030,4001,3002,1071,4,9,3,5,0,0,0,1,5,4,0,0,1,11,0);
insert into PersonalData values (70022,4001,3002,994,1,4,0,0,0,0,4,4,0,1,2,1,3,2,0);
insert into PersonalData values (70028,4001,3002,668,2,4,0,0,2,2,3,3,2,0,0,2,1,6,0);
insert into PersonalData values (70021,4001,3002,221,2,2,1,1,0,0,0,1,0,0,0,0,0,5,0);
insert into PersonalData values (70023,4001,3002,221,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70027,4001,3002,221,0,0,0,0,0,0,0,0,2,0,0,1,1,0,0);
insert into PersonalData values (70004,4001,3001,2196,11,18,1,3,4,5,0,10,4,2,2,0,2,27,1);
insert into PersonalData values (70003,4001,3001,2046,9,18,3,10,5,6,0,3,4,0,0,4,1,26,1);
insert into PersonalData values (70014,4001,3001,2001,5,13,1,6,0,0,0,1,2,0,0,1,4,11,1);
insert into PersonalData values (70005,4001,3001,1957,7,14,2,5,2,2,5,7,6,5,1,2,2,18,1);
insert into PersonalData values (70013,4001,3001,1205,1,1,0,0,0,0,1,2,1,0,0,3,2,2,1);
insert into PersonalData values (70006,4001,3001,1608,1,3,0,2,0,0,1,1,3,1,0,1,3,2,0);
insert into PersonalData values (70002,4001,3001,802,2,8,0,4,1,2,0,0,2,0,1,0,0,5,0);
insert into PersonalData values (70008,4001,3001,774,1,3,0,1,0,0,0,2,0,1,0,1,0,2,0);
insert into PersonalData values (70017,4001,3001,639,1,2,0,0,0,0,1,1,0,1,1,4,2,2,0);
insert into PersonalData values (70011,4001,3001,540,1,3,0,2,0,0,0,0,2,1,1,0,0,2,0);
insert into PersonalData values (70012,4001,3001,221,1,2,0,0,0,1,0,0,0,0,0,0,0,2,0);
insert into PersonalData values (70009,4001,3001,221,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70015,4001,3001,190,0,0,0,0,1,2,0,0,0,0,0,0,3,1,0);
insert into PersonalData values (70043,4002,3003,2748,8,23,2,11,11,14,1,14,13,2,1,7,4,29,1);
insert into PersonalData values (70034,4002,3003,2694,9,17,5,10,6,7,2,3,0,0,0,2,4,29,1);
insert into PersonalData values (70035,4002,3003,2572,5,13,0,7,2,2,1,3,2,1,0,0,3,12,1);
insert into PersonalData values (70036,4002,3003,1738,1,6,1,3,0,0,1,6,2,4,0,2,2,3,1);
insert into PersonalData values (70039,4002,3003,1492,5,8,0,0,0,3,1,3,0,0,2,3,4,10,1);
insert into PersonalData values (70042,4002,3003,2325,9,19,4,9,1,1,0,1,5,1,0,3,3,23,0);
insert into PersonalData values (70040,4002,3003,1568,4,9,2,3,1,2,4,4,2,2,0,2,4,11,0);
insert into PersonalData values (70044,4002,3003,1487,6,10,0,0,1,1,5,5,1,0,1,0,3,13,0);
insert into PersonalData values (70037,4002,3003,776,1,3,0,1,0,0,0,2,1,1,0,0,1,2,0);
insert into PersonalData values (70045,4002,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70041,4002,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70051,4002,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70046,4002,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70004,4002,3001,2948,12,28,3,11,12,12,1,13,2,3,3,2,3,39,1);
insert into PersonalData values (70014,4002,3001,2832,4,20,3,13,4,6,0,6,3,0,0,2,1,15,1);
insert into PersonalData values (70005,4002,3001,2815,9,15,0,2,2,5,5,10,9,2,1,4,6,20,1);
insert into PersonalData values (70003,4002,3001,2303,9,22,4,13,6,6,1,2,5,3,1,5,6,28,1);
insert into PersonalData values (70013,4002,3001,503,0,1,0,0,2,2,3,0,1,0,1,1,2,2,1);
insert into PersonalData values (70006,4002,3001,2503,3,4,2,3,2,4,1,2,5,0,0,0,2,10,0);
insert into PersonalData values (70008,4002,3001,1185,2,4,0,0,0,0,1,2,3,1,0,0,2,4,0);
insert into PersonalData values (70002,4002,3001,726,2,6,0,2,0,0,1,0,1,0,0,0,0,4,0);
insert into PersonalData values (70011,4002,3001,566,0,0,0,0,0,0,0,1,1,0,0,1,1,0,0);
insert into PersonalData values (70010,4002,3001,499,2,2,0,0,0,0,0,2,1,1,0,0,1,4,0);
insert into PersonalData values (70012,4002,3001,244,0,0,0,0,1,2,0,1,0,2,0,1,1,1,0);
insert into PersonalData values (70017,4002,3001,198,0,2,0,0,0,0,0,2,0,0,0,1,2,0,0);
insert into PersonalData values (70009,4002,3001,78,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0);
insert into PersonalData values (70014,4003,3001,2105,8,18,3,6,5,5,2,2,3,0,0,1,1,24,1);
insert into PersonalData values (70003,4003,3001,1997,7,16,0,8,5,5,0,4,6,7,0,3,3,19,1);
insert into PersonalData values (70004,4003,3001,1911,5,17,1,5,5,6,0,8,7,1,0,0,3,16,1);
insert into PersonalData values (70005,4003,3001,1891,8,10,3,5,3,4,3,2,4,2,0,1,4,22,1);
insert into PersonalData values (70013,4003,3001,1300,2,4,0,1,0,0,3,2,3,0,1,2,3,4,1);
insert into PersonalData values (70006,4003,3001,1521,5,8,0,2,0,0,1,5,2,0,2,0,0,10,0);
insert into PersonalData values (70008,4003,3001,1049,2,2,0,0,1,2,0,1,2,1,0,2,0,5,0);
insert into PersonalData values (70002,4003,3001,775,3,7,0,2,1,1,0,3,1,0,0,0,2,7,0);
insert into PersonalData values (70017,4003,3001,672,0,1,0,0,2,2,0,5,3,0,0,0,3,2,0);
insert into PersonalData values (70011,4003,3001,464,0,2,0,2,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70009,4003,3001,285,1,1,0,0,0,0,2,0,0,0,1,0,4,2,0);
insert into PersonalData values (70012,4003,3001,257,1,2,0,0,2,2,1,0,1,0,1,0,0,4,0);
insert into PersonalData values (70010,4003,3001,174,0,1,0,0,0,2,0,2,0,0,0,1,1,0,0);
insert into PersonalData values (70061,4003,3004,1930,7,14,1,6,0,0,1,5,5,1,0,2,4,15,1);
insert into PersonalData values (70059,4003,3004,1905,5,7,0,0,0,4,5,7,0,0,2,0,3,10,1);
insert into PersonalData values (70056,4003,3004,1854,5,20,0,1,2,4,4,5,2,1,0,7,4,12,1);
insert into PersonalData values (70063,4003,3004,1294,1,4,0,2,0,0,0,1,0,0,0,2,2,2,1);
insert into PersonalData values (70060,4003,3004,879,0,3,0,0,2,2,0,1,0,0,0,0,1,2,1);
insert into PersonalData values (70054,4003,3004,2125,7,17,3,6,4,4,2,0,4,1,0,0,2,21,0);
insert into PersonalData values (70064,4003,3004,1710,4,10,2,4,4,4,0,2,2,0,0,0,2,14,0);
insert into PersonalData values (70065,4003,3004,975,6,11,1,3,2,2,2,7,0,0,0,0,3,15,0);
insert into PersonalData values (70058,4003,3004,929,1,4,1,2,4,4,2,2,1,0,0,2,2,7,0);
insert into PersonalData values (70052,4003,3004,800,0,2,0,2,0,0,1,0,1,0,0,0,1,0,0);
insert into PersonalData values (70055,4003,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70062,4003,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70053,4003,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70059,4004,3004,1799,4,8,0,0,0,0,1,7,1,0,3,0,3,8,1);
insert into PersonalData values (70056,4004,3004,1749,13,19,0,2,2,3,1,4,3,1,0,0,2,28,1);
insert into PersonalData values (70061,4004,3004,1715,4,11,0,1,1,1,1,7,10,2,0,1,2,9,1);
insert into PersonalData values (70063,4004,3004,1467,5,9,2,3,2,2,1,1,1,2,0,1,1,14,1);
insert into PersonalData values (70060,4004,3004,1462,5,9,2,4,1,1,0,1,1,1,0,1,2,13,1);
insert into PersonalData values (70054,4004,3004,1560,6,10,3,5,1,1,0,3,2,0,1,2,1,16,0);
insert into PersonalData values (70064,4004,3004,1314,3,10,0,3,0,0,0,1,1,1,1,1,2,6,0);
insert into PersonalData values (70055,4004,3004,1139,2,3,1,1,0,0,0,1,3,1,1,1,0,5,0);
insert into PersonalData values (70058,4004,3004,1114,1,4,0,1,0,0,1,3,1,0,0,1,4,2,0);
insert into PersonalData values (70065,4004,3004,1081,4,8,1,3,6,6,2,6,1,0,0,0,2,15,0);
insert into PersonalData values (70052,4004,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70062,4004,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70053,4004,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70029,4004,3002,1675,3,13,0,3,8,8,1,5,1,1,1,2,1,14,1);
insert into PersonalData values (70018,4004,3002,1510,7,13,3,3,2,2,1,5,0,0,1,1,2,19,1);
insert into PersonalData values (70030,4004,3002,1510,1,7,0,3,2,2,1,2,5,0,0,2,3,4,1);
insert into PersonalData values (70024,4004,3002,1238,3,5,1,2,4,6,1,3,1,0,1,2,1,11,1);
insert into PersonalData values (70019,4004,3002,965,0,0,0,0,0,0,0,2,2,1,0,0,1,0,1);
insert into PersonalData values (70027,4004,3002,1316,4,5,3,4,0,0,1,1,5,0,0,2,1,11,0);
insert into PersonalData values (70022,4004,3002,1117,2,4,0,0,0,0,0,3,0,1,1,1,4,4,0);
insert into PersonalData values (70033,4004,3002,1112,3,6,0,1,0,0,1,3,2,2,0,2,0,6,0);
insert into PersonalData values (70021,4004,3002,975,0,3,0,2,0,0,0,1,0,0,1,1,1,0,0);
insert into PersonalData values (70028,4004,3002,855,1,4,0,0,3,4,1,3,1,0,0,0,1,5,0);
insert into PersonalData values (70023,4004,3002,812,2,4,0,2,1,1,0,1,1,0,0,0,1,5,0);
insert into PersonalData values (70025,4004,3002,773,2,6,1,3,2,2,0,4,1,0,0,1,1,7,0);
insert into PersonalData values (70031,4004,3002,542,2,4,2,2,0,0,0,0,0,0,0,1,1,6,0);
insert into PersonalData values (70043,4005,3003,2450,9,19,1,5,5,7,2,10,15,1,0,8,1,24,1);
insert into PersonalData values (70035,4005,3003,2440,4,8,1,5,0,0,0,5,3,4,0,3,4,9,1);
insert into PersonalData values (70034,4005,3003,2185,5,11,4,6,6,7,1,8,0,1,0,0,2,20,1);
insert into PersonalData values (70039,4005,3003,1071,5,8,0,0,2,4,2,3,0,0,1,2,4,12,1);
insert into PersonalData values (70037,4005,3003,847,0,5,0,4,0,0,1,1,1,0,0,1,1,0,1);
insert into PersonalData values (70042,4005,3003,2033,5,14,2,7,3,3,0,1,2,0,1,2,3,15,0);
insert into PersonalData values (70045,4005,3003,1281,2,3,0,0,0,0,0,2,1,0,1,2,4,4,0);
insert into PersonalData values (70040,4005,3003,1077,4,5,2,2,0,0,0,7,1,1,1,1,1,10,0);
insert into PersonalData values (70041,4005,3003,430,2,4,0,1,0,0,1,0,1,0,0,0,3,4,0);
insert into PersonalData values (70044,4005,3003,298,1,1,0,0,1,1,1,0,1,0,0,0,1,3,0);
insert into PersonalData values (70046,4005,3003,289,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70038,4005,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70051,4005,3003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70029,4005,3002,2339,11,26,4,6,8,8,2,5,1,1,2,2,1,34,1);
insert into PersonalData values (70030,4005,3002,2020,3,8,0,4,2,2,2,1,10,0,0,0,1,8,1);
insert into PersonalData values (70018,4005,3002,1831,5,15,0,1,4,5,3,2,2,2,1,3,3,14,1);
insert into PersonalData values (70026,4005,3002,1560,3,9,2,8,0,0,0,3,2,4,1,1,2,8,1);
insert into PersonalData values (70024,4005,3002,775,1,2,0,0,0,0,1,6,1,1,0,1,1,2,1);
insert into PersonalData values (70025,4005,3002,1250,1,7,0,2,6,6,0,1,3,2,0,1,2,8,0);
insert into PersonalData values (70033,4005,3002,1244,3,4,0,0,3,3,0,3,1,1,1,0,2,9,0);
insert into PersonalData values (70028,4005,3002,930,4,6,0,0,2,4,1,3,2,1,0,1,1,10,0);
insert into PersonalData values (70027,4005,3002,860,2,5,1,2,0,0,0,0,0,1,0,1,0,5,0);
insert into PersonalData values (70019,4005,3002,772,0,2,0,0,0,0,1,4,0,1,0,0,1,0,0);
insert into PersonalData values (70021,4005,3002,570,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0);
insert into PersonalData values (70022,4005,3002,249,0,0,0,0,1,2,0,0,0,0,0,0,0,1,0);
insert into PersonalData values (70031,4005,3002,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70059,4006,3004,1807,9,11,0,0,2,2,4,9,1,0,1,1,3,20,1);
insert into PersonalData values (70060,4006,3004,1573,2,6,1,3,0,0,1,0,1,2,0,1,3,5,1);
insert into PersonalData values (70063,4006,3004,1508,3,9,2,6,0,0,1,0,1,0,0,1,3,8,1);
insert into PersonalData values (70058,4006,3004,1433,3,7,2,5,2,3,1,4,1,3,0,1,4,10,1);
insert into PersonalData values (70064,4006,3004,881,3,8,1,3,2,3,0,1,3,0,0,0,1,9,1);
insert into PersonalData values (70055,4006,3004,1868,10,20,4,7,2,2,1,4,8,1,0,5,1,26,0);
insert into PersonalData values (70054,4006,3004,1817,2,10,1,4,0,0,0,1,4,1,1,2,2,5,0);
insert into PersonalData values (70052,4006,3004,1502,4,9,0,2,2,2,0,3,3,0,0,0,4,10,0);
insert into PersonalData values (70065,4006,3004,1195,6,11,2,3,1,1,2,5,0,0,2,1,3,15,0);
insert into PersonalData values (70053,4006,3004,816,3,5,0,0,2,3,1,0,0,1,0,3,1,8,0);
insert into PersonalData values (70061,4006,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70062,4006,3004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70035,4006,3003,2239,6,11,5,10,1,2,0,4,7,2,0,1,0,18,1);
insert into PersonalData values (70043,4006,3003,2019,10,15,2,5,8,9,1,12,10,5,2,6,1,30,1);
insert into PersonalData values (70036,4006,3003,1966,5,9,2,4,3,3,2,5,3,1,0,0,4,15,1);
insert into PersonalData values (70034,4006,3003,1376,2,10,1,8,1,1,0,3,0,0,0,0,2,6,1);
insert into PersonalData values (70045,4006,3003,954,0,1,0,1,5,8,2,3,1,0,0,4,1,5,1);
insert into PersonalData values (70044,4006,3003,1813,10,14,0,0,9,11,2,0,3,1,1,0,4,29,0);
insert into PersonalData values (70042,4006,3003,1456,5,7,4,5,5,5,0,4,3,0,1,2,1,19,0);
insert into PersonalData values (70040,4006,3003,1139,4,8,0,4,0,0,1,1,1,0,0,0,0,8,0);
insert into PersonalData values (70037,4006,3003,986,3,5,0,2,4,4,1,2,1,3,0,0,4,10,0);
insert into PersonalData values (70046,4006,3003,113,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70041,4006,3003,113,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0);
insert into PersonalData values (70038,4006,3003,113,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0);
insert into PersonalData values (70051,4006,3003,113,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0);


select * from PersonalData
GO

 ---------------------------------------------------------------------------------------------------------------

create table GameMedia    --賽事影音
(
mediaID                 int  primary key IDENTITY (6001,1),    --影音編號
gameID					int  references Games(gameID ),        --賽事ID
mediasName              nvarchar(20),                          --影音名稱
gameVideo			    varchar(200),                          --賽事影片(連結)
gamePhoto			    nvarchar(max),                                 --賽事照片
mediaType               varchar(10),                           --檔案類型
mediaDate               datetime,                              --日期
descriptions            nvarchar(200),                         --描述
tag                     nvarchar(200),                         --Tag
)
GO 

insert into GameMedia values('4001','Curry單手爆扣','001.mp4','','video','2016-10-25','技壓全場!!Curry連過三人單手爆扣!!','金州勇士,Curry,單手爆扣');
insert into GameMedia values('4002','哈登監視器','002.mp4','','video','2016-10-25','哈登監視器模式!!','休士頓火箭,哈登,監視器');
insert into GameMedia values('4003','保羅船長過人','003.mp4','','video','2016-10-25','保羅船長換手過人!','洛杉磯快艇,保羅,運球過人');
insert into GameMedia values('4004','Kawhi Leonard 受傷','004.mp4','','video','2016-10-26','Kawhi Leonard 受傷 踩到Zaza的腳','聖安東尼奧馬刺,Kawhi Leonard,受傷');
insert into GameMedia values('4001','Stephen Curry','','','photo','2016-10-25','Curry手插腰','金州勇士,Curry,吐護齒套');
insert into GameMedia values('4002','James Harden','','','photo','2016-10-25','炸彈超人哈登','休士頓火箭,哈登,炸彈超人');
insert into GameMedia values('4003','Chris Paul','','','photo','2016-10-25','保羅發呆','洛杉磯快艇,保羅,發呆');
insert into GameMedia values('4004','Kawhi Leonard','','','photo','2016-10-26','Kawhi Leonard看得你心發寒','聖安東尼奧馬刺,Kawhi Leonard,黑幫');


select * from GameMedia
GO


---------------------------------------------------------------------------------------------------------------

create table MemberInfo --會員資料
(
memberID             int  primary key IDENTITY (8001,1),  --會員ID
acc                  varchar(40),                                           --帳號(Gmail)
name                 nvarchar(20),                                           --名稱
auth                 varchar(20),                                           --權限
registerTime         datetime,                                              --註冊時間
teamID               int,                                                   --球隊ID
)
GO 

insert into MemberInfo values('admin123@gmail.com','admin01','admin','2017-09-23','');
insert into MemberInfo values('GoldenStateWarriors@gmail.com','金州勇士','teams','2016-01-01','3001');
insert into MemberInfo values('aSnAntonioSpurs@gmail.com','聖安東尼奧馬刺','teams','2016-01-11','3002');
insert into MemberInfo values('HoustonRockets@ymail.com','休士頓火箭','teams','2016-01-15','3003');
insert into MemberInfo values('LosAngelesClippers@ymail.com','洛杉磯快艇','teams','2016-01-17','3004');

insert into MemberInfo values('UtahJazz@ymail.com','猶他爵士','teams','2016-02-01','3005');
insert into MemberInfo values('OklahomaCityThunder@ymail.com','奧克拉荷馬雷霆','teams','2016-02-11','3006');
insert into MemberInfo values('MemphisGrizzlies@ymail.com','曼菲斯灰熊','teams','2016-02-15','3007');
insert into MemberInfo values('PortlandTrail@ymail.com','波特蘭拓荒者','teams','2016-02-17','3008');

insert into MemberInfo values('javaeeit972017@gmail.com','叡叡','parttime','2017-06-23','');
insert into MemberInfo values('frank810618@gmail.com','資策會金城武','admin','2017-09-23','');
insert into MemberInfo values('s988309@gmail.com','金城武','admin','2017-09-23','');
insert into MemberInfo values('qwe020488952@gmail.com','金城武666','admin','2017-09-23','');
select * from MemberInfo
GO

---------------------------------------------------------------------------------------------------------------

create table PlayerGroups      --球員分組表
(
 groupID              int references Groups(groupID ),	    --分組ID 
 playerID             int references Players(playerID ),    --球員ID
 primary key(groupID,playerID)
)



insert into PlayerGroups values('2002','70001');
insert into PlayerGroups values('2002','70002');
insert into PlayerGroups values('2002','70003');
insert into PlayerGroups values('2002','70004');
insert into PlayerGroups values('2002','70005');
insert into PlayerGroups values('2002','70006');
insert into PlayerGroups values('2002','70007');
insert into PlayerGroups values('2002','70008');
insert into PlayerGroups values('2002','70009');
insert into PlayerGroups values('2002','70010');
insert into PlayerGroups values('2002','70011');
insert into PlayerGroups values('2002','70012');
insert into PlayerGroups values('2002','70013');
insert into PlayerGroups values('2002','70014');
insert into PlayerGroups values('2002','70015');
insert into PlayerGroups values('2002','70016');
insert into PlayerGroups values('2002','70017');
insert into PlayerGroups values('2002','70018');
insert into PlayerGroups values('2002','70019');
insert into PlayerGroups values('2002','70020');
insert into PlayerGroups values('2002','70021');
insert into PlayerGroups values('2002','70022');
insert into PlayerGroups values('2002','70023');
insert into PlayerGroups values('2002','70024');
insert into PlayerGroups values('2002','70025');
insert into PlayerGroups values('2002','70026');
insert into PlayerGroups values('2002','70027');
insert into PlayerGroups values('2002','70028');
insert into PlayerGroups values('2002','70029');
insert into PlayerGroups values('2002','70030');
insert into PlayerGroups values('2002','70031');
insert into PlayerGroups values('2002','70032');
insert into PlayerGroups values('2002','70033');
insert into PlayerGroups values('2002','70034');
insert into PlayerGroups values('2002','70035');
insert into PlayerGroups values('2002','70036');
insert into PlayerGroups values('2002','70037');
insert into PlayerGroups values('2002','70038');
insert into PlayerGroups values('2002','70039');
insert into PlayerGroups values('2002','70040');
insert into PlayerGroups values('2002','70041');
insert into PlayerGroups values('2002','70042');
insert into PlayerGroups values('2002','70043');
insert into PlayerGroups values('2002','70044');
insert into PlayerGroups values('2002','70045');
insert into PlayerGroups values('2002','70046');
insert into PlayerGroups values('2002','70047');
insert into PlayerGroups values('2002','70048');
insert into PlayerGroups values('2002','70049');
insert into PlayerGroups values('2002','70050');
insert into PlayerGroups values('2002','70051');
insert into PlayerGroups values('2002','70052');
insert into PlayerGroups values('2002','70053');
insert into PlayerGroups values('2002','70054');
insert into PlayerGroups values('2002','70055');
insert into PlayerGroups values('2002','70056');
insert into PlayerGroups values('2002','70057');
insert into PlayerGroups values('2002','70058');
insert into PlayerGroups values('2002','70059');
insert into PlayerGroups values('2002','70060');
insert into PlayerGroups values('2002','70061');
insert into PlayerGroups values('2002','70062');
insert into PlayerGroups values('2002','70063');
insert into PlayerGroups values('2002','70064');
insert into PlayerGroups values('2002','70065');
insert into PlayerGroups values('2002','70066');


select * from PlayerGroups
GO


---------------------------------------------------------------------------------------------------------------

create table TeamStat      --分組狀態表
(
 teamStatID        int primary key,	    --分組ID 
 teamStatus           nvarchar(50),    --分組狀態
)

insert into TeamStat values(0,'報名成功待繳費');

select * from TeamStat