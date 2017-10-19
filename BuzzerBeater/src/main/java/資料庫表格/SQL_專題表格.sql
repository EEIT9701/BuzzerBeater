--���� BasketBallDB
USE master
DROP DATABASE BasketBallDB
GO

--�Ы� BasketBallDB
CREATE DATABASE BasketBallDB
GO

USE BasketBallDB
GO

---------------------------------------------------------------------------------------------------------------

create table Season			--�ɩu
(
  seasonID              int PRIMARY KEY IDENTITY (1001,1),   --�ɩuID
  seasonName            nvarchar(20),						 --�ɩu�W��
  seasonBeginDate       datetime,							 --�ɩu�}�l�ɶ�
  seasonEndDate         datetime,                            --�ɩu�����ɶ�
  signUpBegin           datetime,                            --���W�}�l�ɶ�
  signUpEnd             datetime,                            --���W�I��ɶ�
  descriptions          nvarchar(max),                       --�Ƶ�
)
GO

insert into Season values ('�ĤQ���u�Ҧ���','2018-01-01','2018-06-30','2017-10-01','2017-11-30',null);
insert into Season values ('�ĤQ���u�u����','2018-06-01','2018-08-20','2018-05-26','2018-05-31',null);
insert into Season values ('�ĤQ�|�u�Ҧ���','2017-01-01','2017-06-30','2016-10-01','2016-11-30',null);
insert into Season values ('�ĤQ�|�u�u����','2017-06-01','2017-08-20','2017-05-26','2017-05-31',null);
insert into Season values ('�ĤQ�T�u�Ҧ���','2016-01-01','2016-06-30','2015-10-01','2016-11-30',null);
insert into Season values ('�ĤQ�T�u�u����','2016-06-01','2016-08-20','2016-05-26','2016-05-31',null);

select * from Season
GO

---------------------------------------------------------------------------------------------------------------

create table Groups			--����
(
  groupID                 int PRIMARY KEY IDENTITY (2001,1),	       --����ID
  seasonID                int references Season(seasonID),             --�u��ID
  groupName               nvarchar(20),                                --���զW��
  maxTeams                int,                                         --�y���ƶq�W��
  minTeams                int,                                         --�y���ƶq�U��
  currentTeams            int,                                         --�ثe�y���ƶq
  maxPlayers              int,                                         --�y�������W��
  minPlayers              int,                                         --�y�������U��
 )
 GO 

 insert into Groups values ('1001','�F��','8','4','5','15','7');
 insert into Groups values ('1001','���','8','4','0','15','7');
 insert into Groups values ('1002','�F��','8','4','5','15','7');
 insert into Groups values ('1002','���','8','4','0','15','7');
 insert into Groups values ('1003','�F��','8','4','5','15','7');
 insert into Groups values ('1003','���','8','4','0','15','7');
 insert into Groups values ('1004','�F��','8','4','5','15','7');
 insert into Groups values ('1005','���','8','4','0','15','7');
 insert into Groups values ('1006','�F��','8','4','5','15','7');
 insert into Groups values ('1006','���','8','4','0','15','7');

 select * from Groups
 GO

 ---------------------------------------------------------------------------------------------------------------
 
 create table Players        --�y��
( 
  playerID        int primary key IDENTITY (70001,1),             --�y��ID
  playerName      nvarchar(20),                                   --�y���m�W
  id              varchar(20),                                    --�����Ҧr��
  height          smallint,                                       --����
  weights         int,                                            --�魫
  birthday        date,                                           --�ͤ�
  nationality     varchar(30),                                    --���y
  photo           image                                           --�Ӥ�
)
GO 

 insert into Players values ('�L�ѽn','A122968632','210','90','1987-07-28','taiwan',0x1234);
 insert into Players values ('������','A126139660','200','69','1985-03-01','taiwan',0x1234);
 insert into Players values ('������','A127805471','190','84','1993-09-05','taiwan',0x1234);
 insert into Players values ('�����E','A125677552','182','78','1991-05-20','taiwan',0x1234);
 insert into Players values ('���@��','A124525651','204','87','1982-11-14','taiwan',0x1234);
 insert into Players values ('���l��','A127770997','197','94','1983-04-05','taiwan',0x1234);
 insert into Players values ('Ĭ����','A124178380','194','82','1985-09-11','taiwan',0x1234);
 insert into Players values ('�P����','A124987511','181','84','1992-09-11','taiwan',0x1234);
 insert into Players values ('�����','A126588446','184','69','1995-05-22','taiwan',0x1234);
 insert into Players values ('������','A124435847','202','68','1995-01-07','taiwan',0x1234);
 insert into Players values ('�f�F��','A124178380','194','82','1985-09-11','taiwan',0x1234);
 insert into Players values ('�P�h�W','A121734759','200','84','1982-05-04','taiwan',0x1234);
 insert into Players values ('�L���]','A126897658','199','83','1989-12-14','taiwan',0x1234);
 insert into Players values ('���R�w','A123199735','199','73','1988-06-22','taiwan',0x1234);
 insert into Players values ('�L�y��','A126337429','195','69','1993-11-24','taiwan',0x1234);
 insert into Players values ('�_�ب�','A125746649','205','79','1994-09-04','taiwan',0x1234);
 insert into Players values ('²����','A125411371','187','84','1994-02-04','taiwan',0x1234);
 insert into Players values ('�P�f��','A122755235','194','71','1989-10-13','taiwan',0x1234);
 insert into Players values ('���t�a','A122583115','189','86','1991-08-14','taiwan',0x1234);
 insert into Players values ('�i�ճ�','A121693866','183','88','1995-09-28','taiwan',0x1234);
 insert into Players values ('�L����','A126417438','187','89','1984-12-16','taiwan',0x1234);
 insert into Players values ('���_��','A121395548','207','65','1981-04-06','taiwan',0x1234);
 insert into Players values ('�P�B��','A129695227','208','80','1990-10-19','taiwan',0x1234);
 insert into Players values ('������','A122939189','187','84','1989-02-09','taiwan',0x1234);
 insert into Players values ('�i�B��','A127195327','194','77','1985-12-05','taiwan',0x1234);
 insert into Players values ('����','A129859494','185','91','1983-08-23','taiwan',0x1234);
 insert into Players values ('�I�C�v','A123624169','188','77','1985-01-25','taiwan',0x1234);
 insert into Players values ('�I�ʳ�','A127854445','207','85','1982-01-20','taiwan',0x1234);
 insert into Players values ('�����v','A126277964','182','67','1994-04-12','taiwan',0x1234);
 insert into Players values ('�x�ӵ�','A121214688','196','78','1982-06-10','taiwan',0x1234);
 insert into Players values ('�J�͵�','A127224877','198','75','1987-09-17','taiwan',0x1234);
 insert into Players values ('�B����','A128219458','189','81','1988-05-01','taiwan',0x1234);
 insert into Players values ('���ֳ�','A127695785','210','67','1983-11-19','taiwan',0x1234);
 insert into Players values ('������','A124525225','186','81','1985-02-17','taiwan',0x1234);
 insert into Players values ('����޳','A128364473','191','77','1984-09-24','taiwan',0x1234);

 select * from Players
 GO

 ---------------------------------------------------------------------------------------------------------------
 
create table LocationInfo     --���a��T
(
  locationID             int primary key IDENTITY (101,1),  --���aID
  locationName           nvarchar(50),						--���a�W��
  locationAddr           nvarchar(100),						--�a�}
  --locationPhoto          image,								--���a�Ϥ�
)
GO

insert into LocationInfo values ('�s�˥�����|�]','�s�˥������295��');
insert into LocationInfo values ('��饫����|�]','��饫���ϤT�����@�q�@��');
insert into LocationInfo values ('��������s��|�]','��������s����|��65��');
insert into LocationInfo values ('�s�_���F����|�B��L����','�s�_����L�Ϥ�����81��');

select * from LocationInfo
GO

---------------------------------------------------------------------------------------------------------------

 create table Teams			--�y��
(
  teamID                  int primary key IDENTITY (3001,1),        --�y��ID
  captainID               int references Players(playerID ),        --����ID
  captainEmail            varchar(30),                              --����Email
  captainPhone            varchar(20),                              --�����s���q��
  locationID              int,	                                    --�D��ID
  teamName                nvarchar(10),                             --�y���W��
  coachName               nvarchar(10),                             --�`�нm
  bossName                nvarchar(10),                             --����
  teamBadge               image,                                    --����
  totalWin                int,                                      --�`�ӳ���
  totalLose               int,                                      --�`�ѳ���
  winRate                 float,                                    --�Ӳv
  remarks                 nvarchar(200),                            --�Ƶ�
)
GO

insert into Teams values('70001','adfs156@gmail.com','0910123456','104','�I���i�h','�C���','�I���|�֪ѥ��������q','','17','13','56.6','');
insert into Teams values('70002','agfsdg43@gmail.com','0910987564','102','�x�W��s','�P�T�T','�x�W�Ұs���q','','30','8','60.54','');
insert into Teams values('70003','gndf65ndnvb@ymail.com','0910125568','','�O�W�Ȧ�','������','�O�W�Ȧ�','','20','25','78.56','');
insert into Teams values('70004','gnddn40684@ymail.com','0910216508','103','�����s�t','�����y','�����s�t','','25','28','87.87','');
insert into Teams values('70005','gfsdhsd0890@gmail.com','0910123256','','�ζ��Ǵ���','�Q�î�','�ζ��T��','','37','32','43.38','');
insert into Teams values('70006','gfsdhsd0890@gmail.com','0910123256','','���\��ؿv','���Z�F','�\��ؿv','','14','16','46.66','');
insert into Teams values('70007','gfsdhsd0890@gmail.com','0910123256','','�O�_�F�Y�u�{','���j�v','�F�Y�u�{','','21','9','70.00','');

select * from Teams
GO

---------------------------------------------------------------------------------------------------------------


 create table Games			--�ɨ�
(
  gameID                       int primary key IDENTITY (4001,1),                  --�ɨ�ID
  groupID                      int  references Groups(groupID ),	               --����ID  
  locationID                   int  references LocationInfo(locationID ),          --���ɦa�I
  teamAID                      int  references Teams(teamID ),					   --A��ID
  teamAScore                   int,                                                --A���o��
  teamBID                      int  references Teams(teamID ),					   --B��ID
  teamBScore                   int,                                                --B���o��
  winnerID                     int,                                                --��Ӷ���ID
  gameBeginDate                datetime,                                           --�ɨƶ}�l�ɶ�
  gameEndDate                  datetime,                                           --�ɨƵ����ɶ�
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

 create table GroupRegistration                    --���ճ��W��
(
  teamID                       int references Teams(teamID ),	         --�y��ID
  groupID                      int references Groups(groupID ),          --����ID
  teamStat                     int,                                      --�y�����W���A
  registerDate                 datetime,                                 --�y�����W�ɶ�
  paymentNumber                char(5),                                  --ú�O�᤭�X

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

create table TeamComposition        --�y���c����
( 
  teamID                     int  references Teams(teamID),       --�y��ID
  playerID                   int  references Players(playerID),   --�y��ID
  playerNo                   tinyint,                             --�I��
  playerRole                 varchar(2),                          --��m
  joinTeamDate               smalldatetime,                       --�[�J�y���ɶ�
  leaveTeamDate              smalldatetime,                       --���}�y���ɶ�

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

create table PersonalData    --�ӤH���ɼƾ�
( 
  playerID            int references Players(playerID),   --�y��ID
  gameID              int references Games(gameID),       --�ɨ�ID
  teamID              int  references Teams(teamID),      --�y��ID
  quarters            char,               --�`��
  quarterTime         INT,                --��`�X���ɶ� (���:��)
  twoPoint            INT,                --����R����
  twoPointShot        INT,                --����X���
  threePoint          INT,                --�T���R����
  threePointShot      INT,                --�T���X���
  fg                  INT,                --�@�y�R����
  fgShot              INT,                --�@�y�X���
  offReb              INT,                --�i���x�O
  defReb              INT,                --���u�x�O
  assist              INT,                --�U��
  steal               INT,                --�ۺI
  blocks              INT,                --����
  turnover            INT,                --���~
  startingPlayer      TINYINT             --�O�_���o

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

create table GameMedia    --�ɨƼv��
(
gameID					int  references Games(gameID ),        --�ɨ�ID
mediaID                 int  primary key IDENTITY (6001,1),    --�v���s��
mediasName              nvarchar(20),                          --�v���W��
gameVideo			    varchar(200),                          --�ɨƼv��(�s��)
gamePhoto			    Image,                                 --�ɨƷӤ�
mediaType               varchar(10),                           --�ɮ�����
mediaDate               datetime,                              --���
descriptions            nvarchar(200),                         --�y�z
tag                     nvarchar(200),                         --Tag
)
GO 

insert into GameMedia values('4001','�i�g������z��','https://youtube.com/d2gKL2548GD','','video','2017-06-06','��������!!�i�g���s�L�T�H����z��!!','�F�Y,�i�g��,����z��');


select * from GameMedia
GO

---------------------------------------------------------------------------------------------------------------

create table MemberInfo --�|�����
(
memberID             int  primary key IDENTITY (8001,1),  --�|��ID
acc                  varchar(20),                                           --�b��(Gmail)
name                 varchar(20),                                           --�W��
auth                 varchar(20),                                           --�v��
registerTime         datetime,                                              --���U�ɶ�
teamID               int,                                                   --�y��ID
)

insert into MemberInfo values('admin123@gmail.com','admin01','admin','2017-09-23','');
insert into MemberInfo values('zxcv456@gmail.com','�F�Y','teams','2017-09-23','7001');
insert into MemberInfo values('gjdio398@gmail.com','�i��','parttime','2017-09-23','');

select * from MemberInfo
GO

---------------------------------------------------------------------------------------------------------------

create table PlayerGroups      --�y�����ժ�
(
 groupID              int references Groups(groupID ),	    --����ID 
 playerID             int references Players(playerID ),    --�y��ID

 CONSTRAINT PlayerGroups_CPK PRIMARY KEY (groupID, playerID)
)

select * from PlayerGroups
GO