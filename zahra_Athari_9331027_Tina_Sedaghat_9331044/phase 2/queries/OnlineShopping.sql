
drop database if exists OnlineShopping1;


create database OnlineShopping1;
use OnlineShopping1;



drop table if exists Utility;
drop table if exists HomeUtility;
drop table if exists DigitalUtility;
drop table if exists SportUtility;
drop table if exists Person;
drop table if exists RegisteredCostumer;
drop table if exists unRegisteredCostumer;
drop table if exists Supporters;
drop table if exists Tracking;
drop table if exists TrasnportMan;

drop table if exists Phone;
drop table if exists Opinion;
drop table if exists RegisteredCostumerUsernames;
drop table if exists Person_Address;
drop table if exists Person_Phone;
drop table if exists Person_Address;
drop table if exists Orders;
drop table if exists Bought;
drop table if exists BoughtDetail;
drop table if exists Company;
drop table if exists Bought;
drop table if exists MrLink;
drop table if exists CompanyLink;
drop table if exists CompanyAddress;
drop table if exists Company_phone;
drop table if exists Employee;
drop table if exists TransportManIndiviual;
drop table if exists TransportDetail;



-- -----------------------------------------------------
-- Utility
-- -----------------------------------------------------
CREATE TABLE Utility(
  UtilityName VARCHAR(45) ,
  UtilityCode INT primary key,
  UtilityCompany VARCHAR(45) ,
  UtilityCost INT ,
  UtilitySale REAL ,
  UtilityNExist INT,
  UtilityGroup VARCHAR(45) );
  
  insert into Utility values('toop', '11', 'adidas', '10000' , '0.10' , '3', 'sport'); 
  insert into Utility values('kafsh','12', 'ecco', '300000' , '0.20' , '2', 'sport'); 
  insert into Utility values('raket', '13', 'adidas', '25000' , '0.10' , '5', 'sport'); 
  insert into Utility values('laptop', '14', 'hp', '6000000' , '0.30' , '4', 'digital'); 
  insert into Utility values('mobl', '15', 'ikea', '10000000' , '0.50' , '7', 'home'); 
  insert into Utility values('miz', '16', 'ikea', '450000' , '0.25' , '1', 'home'); 
  insert into Utility values('ab mive giri', '17', 'tefal', '600000' , '0.00' , '3', 'home'); 
  insert into Utility values('mobile', '18', 'apple', '4000000' , '0.00' , '3', 'digital'); 
-- -----------------------------------------------------
-- HomeUtility
-- -----------------------------------------------------
CREATE TABLE HomeUtility(
  UtilityCode INT primary key references Utility(UtilityCode),
  ProduceDate DATE);  
  insert into HomeUtility values('15','2010-08-11');   
  insert into HomeUtility values('16','2000-08-21');   
  insert into HomeUtility values('17','2013-12-09'); 

  
-- -----------------------------------------------------
-- DigitalUtility
-- -----------------------------------------------------
CREATE TABLE DigitalUtility(
  UtilityCode INT primary key references Utility(UtilityCode));
  
    insert into DigitalUtility values('14'); 
    insert into DigitalUtility values('18'); 

  
-- -----------------------------------------------------
-- SportUtility
-- -----------------------------------------------------
CREATE TABLE SportUtility(
 UtilityCode INT primary key references Utility(UtilityCode),
  UtilityColor VARCHAR(45) NULL);
  
    
  insert into SportUtility values('11','abi'); 
  insert into SportUtility values('12','banafsh');
  insert into SportUtility values('13','ghermez'); 
  
-- -----------------------------------------------------
-- Person
-- -----------------------------------------------------
CREATE TABLE Person(
  PersonID INT primary key,
  PersonName VARCHAR(45) NULL,
  PersonFamilyName VARCHAR(45) NULL);
  
  insert into Person values('111','Tina' , 'Sedaghat'); 
  insert into Person values('112','Hedie' , 'Athari');
  insert into Person values('113','Afsane' , 'Baghestani'); 
  insert into Person values('114','Hoda' , 'Elmi');
  insert into Person values('115','Saeede' , 'Malekan'); 
  insert into Person values('116','Negin' , 'Ghasemi');
  insert into Person values('117','Amirhossein' , 'Sohrabbeig'); 
  insert into Person values('118','Sina' , 'Malakooti');
  
  insert into Person values('119','ali' , 'shirazi');
  insert into Person values('120','naghi' , 'shirazi');
  insert into Person values('121','taghi' , 'shirazi');
  
  insert into Person values('122','ali' , 'alizade');
  insert into Person values('123','milad' , 'lotfi');
  insert into Person values('124','majid' , 'amini');
  
  
  insert into Person values('131','Akbar' , 'Akbari');
  insert into Person values('132','Ahmad' , 'Ahmadi');
  insert into Person values('133','Amir' , 'Amiri');
  insert into Person values('134','Omid' , 'Omidi');
  insert into Person values('135','Hassan' , 'Hassani');
  insert into Person values('136','Ehsan' , 'Ehsani');
  insert into Person values('137','Asghar' , 'Asghari');
  
  insert into Person values('2001','goli' , 'vahidi');
  insert into Person values('2002','amir' , 'ghafoor');


  
  
-- -----------------------------------------------------
-- RegisteredCostumer
-- -----------------------------------------------------
CREATE TABLE RegisteredCostumer(
  CostumerID INT primary key references Person(PersonID),
  CostumerCredit INT NULL,
  RegisteredDate DATETIME NULL);
  
  insert into RegisteredCostumer values('111','120000' , '2017-07-07');
  insert into RegisteredCostumer values('112','110000' , '2016-12-07');
  insert into RegisteredCostumer values('113','10000' , '2017-12-03');
  insert into RegisteredCostumer values('114','5000' , '2015-05-30');
  insert into RegisteredCostumer values('115','100' , '2013-02-21');
  insert into RegisteredCostumer values('116','30000' , '2012-05-04');
  insert into RegisteredCostumer values('117','50000' , '2014-09-06');
  insert into RegisteredCostumer values('118','27000' , '2016-08-03');
  
  insert into RegisteredCostumer values('2001','24000' , '2016-09-03');
  insert into RegisteredCostumer values('2002','25000' , '2006-08-23');

create view creditWithGift(CostumerID,CostumerCredit) as
select CostumerID,10 * (RegisteredCostumer.CostumerCredit / 100) + RegisteredCostumer.CostumerCredit
from RegisteredCostumer;


-- -----------------------------------------------------
-- RegisteredCostumerUsernames
-- -----------------------------------------------------
CREATE TABLE RegisteredCostumerUsernames(
  CostumerID INT primary key,
  CostumerUsername VARCHAR(45)
  );
  
  create table history_of_deleted_RegisteredCostumerUsernames(
  CostumerID INT primary key,
  CostumerUsername VARCHAR(45),
  action VARCHAR(50) DEFAULT NULL,
  changedat DATETIME DEFAULT NULL
  );
  
  DELIMITER $$
CREATE TRIGGER before_deleting_RegisteredCostumerUsernames
    BEFORE DELETE ON RegisteredCostumerUsernames
    FOR EACH ROW 
BEGIN
    INSERT INTO history_of_deleted_RegisteredCostumerUsernames
    SET action = 'delete',
	CostumerID = OLD.CostumerID,
	CostumerUsername = OLD.CostumerUsername,
	changedat = NOW(); 
END$$
DELIMITER ;




  insert into RegisteredCostumerUsernames values('111','tinased');
  insert into RegisteredCostumerUsernames values('112','hedinik');
  insert into RegisteredCostumerUsernames values('113','afbaghetani');
  insert into RegisteredCostumerUsernames values('114','helmi');
  insert into RegisteredCostumerUsernames values('115','smalekan');
  insert into RegisteredCostumerUsernames values('116','negin12');
  insert into RegisteredCostumerUsernames values('117','Sohrabbeig11');
  insert into RegisteredCostumerUsernames values('118','Malakooti11');
  insert into RegisteredCostumerUsernames values('2001','golii');
  insert into RegisteredCostumerUsernames values('2002','amirgh');
  
  delete from RegisteredCostumerUsernames where costumerID='111';
  





 
  
-- -----------------------------------------------------
-- UnRegisteredCostumer
-- -----------------------------------------------------
CREATE TABLE UnRegisteredCostumer(
  CostumerID INT primary key references Person(PersonID));
  
  insert into UnRegisteredCostumer values('119');
  insert into UnRegisteredCostumer values('120');
  insert into UnRegisteredCostumer values('121');

  
-- -----------------------------------------------------
-- Supporters
-- -----------------------------------------------------
CREATE TABLE Supporters(
  SupporterID INT primary key references Person(PersonID));
  
  insert into supporters values('122');
  insert into supporters values('123');
  insert into supporters values('124');

  create table SupporterStatus(
  SupporterID int references  Supporters(SupporterID),
  OnlineTime datetime,
  OfflineTime datetime,
  CHECK (OfflineTime>OnlineTime)
  );
  
  insert into SupporterStatus values('122','2016-08-03 00:00:00' , '2016-08-03 00:00:50');
  insert into SupporterStatus values('122','2017-08-12 01:00:00' , '2017-08-03 03:00:50');
  insert into SupporterStatus values('123','2011-04-13 01:00:00' , '2011-04-13 01:30:30');
  insert into SupporterStatus values('123','2016-11-23 14:40:00' , '2016-11-23 16:40:00');
  insert into SupporterStatus values('124','2013-12-08 10:31:00' , '2013-12-08 11:00:50');
  insert into SupporterStatus values('124','2012-05-29 12:00:00' , '2012-05-29 14:30:50');
  
  
  -- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE Employee(
  EmployeeID INT primary key,
  CompanyID VARCHAR(45) references Company(CompanyID));
  
  insert into Employee values('2001','1001');
  insert into Employee values('2002','1001');
  insert into Employee values('2003','1001');
  
  insert into Employee values('2004','1002');
  
  insert into Employee values('2005','1003');
  insert into Employee values('2006','1004');
  
  insert into Employee values('2007','1005');
  insert into Employee values('2008','1005');
  
  
 
-- -----------------------------------------------------
-- Tracking
-- -----------------------------------------------------
CREATE TABLE Tracking(
  TrackingID INT primary key,
  TrackingKind VARCHAR(45) NULL,
  CostumerID VARCHAR(45) NULL,
  SuporterID VARCHAR(45) NULL,
  BoughtID VARCHAR(45) NULL,
  TrackingText VARCHAR(200) NULL,
  TrackingAnswer VARCHAR(200) NULL,
  TrackingTime DATETIME NULL);
  
    insert into Tracking values('211','dirkard','111','124','12','salam chera nemirese?????' , 'hamin alan mirese' , '2017-07-29');
	insert into Tracking values('212','shekayat','112' , '123','14','sharzheresh kharabe','yeki dg ersal shod' ,'2016-02-24');
    insert into Tracking values('213','pasokhgooiy','113','124','15','salam chera nemirese???' , 'alan mirese' , '2015-12-09');
	insert into Tracking values('214','pasokhgooiy','114' , '123','16',' kharabe','dobare ersal shod' ,'2016-02-14');
	insert into Tracking values('215','dirkard','111','122','11','salam chera nemirese?????' , 'hamin alan mirese' , '2017-04-20');
-- -----------------------------------------------------
-- TrasnportMan
-- -----------------------------------------------------
CREATE TABLE TrasnportMan (
-- personID chi?
  TransportManPelak varchar(4) primary key,
  TrasnportManCar VARCHAR(45) NULL,
  TrasnportManShenasname INT NULL);
  
  
 insert into TrasnportMan values('P311','peykan','0018484');
 insert into TrasnportMan values('P312','vanet abi','0018485');
 insert into TrasnportMan values('P313','patrol','0018486');
 

-- -----------------------------------------------------
-- Opinion
-- -----------------------------------------------------
CREATE TABLE Opinion(
  CustomerUsername VARCHAR(45),
  UtilityCode VARCHAR(45),
  Comments VARCHAR(45) , -- comment keyworde
  Rank VARCHAR(45),
  primary key (CustomerUsername, UtilityCode));
  
  
 insert into Opinion values('hedinik','12','khoobe','9');
 insert into Opinion values('afbaghestani','15','ghashange', '7');
 insert into Opinion values('tinased','16','bade', '3');
  
  
-- -----------------------------------------------------
-- Person_Address
-- -----------------------------------------------------
CREATE TABLE Person_Address(
  PersonID INT,
  City VARCHAR(45),
  Street VARCHAR(45),
  Pelak VARCHAR(45),
primary key (PersonID, City,Street, pelak ));

insert into Person_Address values('111','tehran', 'yas' ,'12');
insert into Person_Address values('112','tehran', 'lavasan' ,'3');
insert into Person_Address values('113','rasht', 'valieasr' ,'5');
insert into Person_Address values('114','esfahan', 'beheshti' ,'6');
insert into Person_Address values('115','tabriz', 'motahari' ,'13');
insert into Person_Address values('116','tehran', 'farmanie' ,'114');
insert into Person_Address values('117','tehran', 'bahonar' ,'54');
insert into Person_Address values('118','tehran', 'taleghani' ,'56');

insert into Person_Address values('131','tabriz', 'ferdosi' ,'561');
insert into Person_Address values('132','zanjan', 'naderi' ,'8');
insert into Person_Address values('133','arak', 'sohrevardi' ,'99');
insert into Person_Address values('134','abadan', 'rasht' ,'23');
insert into Person_Address values('135','shiraz', 'saeed' ,'645');
insert into Person_Address values('136','ahvaz', 'enghelab' ,'523');
insert into Person_Address values('137','booshehr', 'azadi' ,'675');


  
-- -----------------------------------------------------
-- Person_Phone
-- -----------------------------------------------------
CREATE TABLE Person_Phone(
  PersonID INT,
  PhoneNumber VARCHAR(45),
  primary key (PersonID,PhoneNumber));
  
  
  insert into Person_Phone values('111','0912111');
  insert into Person_Phone values('112','0912112');
  insert into Person_Phone values('113','0912113');
  insert into Person_Phone values('114','0912114');
  insert into Person_Phone values('115','0912115');
  insert into Person_Phone values('116','0912116');
  insert into Person_Phone values('117','0912117');
  insert into Person_Phone values('118','0912118');
  insert into Person_Phone values('119','0912119');
  insert into Person_Phone values('120','0912120');
  insert into Person_Phone values('121','0912121');
  insert into Person_Phone values('122','0912564');
  insert into Person_Phone values('123','0912424');
  insert into Person_Phone values('124','0912556');
  insert into Person_Phone values('131','0912776');
  insert into Person_Phone values('132','0912423');
  insert into Person_Phone values('133','0912467');
  insert into Person_Phone values('134','0912112');
  insert into Person_Phone values('135','0912177');
  insert into Person_Phone values('136','0912687');
  insert into Person_Phone values('137','0912133');

  
  
-- -----------------------------------------------------
-- Order
-- -----------------------------------------------------
CREATE TABLE Orders ( -- order keyword bood 
  OrderID INT primary key,
  CostumerID VARCHAR(45) NULL,
  UtilityCode VARCHAR(45) NULL);
  
  insert into orders values('411','111','12');
  insert into orders values('412','111','13');
  insert into orders values('413','111','14');
  insert into orders values('414','112','14');
  insert into orders values('415','112','15');
  insert into orders values('416','112','18');
  insert into orders values('417','113','15');
  insert into orders values('418','114','16');
  insert into orders values('419','114','17');
  insert into orders values('420','114','18');
  insert into orders values('421','116','11');
  insert into orders values('422','116','12');
  insert into orders values('423','116','13');
  insert into orders values('424','116','14');
  insert into orders values('425','116','15');
  insert into orders values('426','118','15');
  insert into orders values('427','118','16');
-- -----------------------------------------------------
-- Bought
-- -----------------------------------------------------
CREATE TABLE Bought (
  BoughtID INT primary key,
  CostumerID INT NULL,
  UtilityTotalCost INT NULL, -- alaki
  UtilityTotalTax INT NULL, -- alaki
  BoughtDateTime DATETIME NULL,
  PayStatus VARCHAR(45) NULL,
  CostumerCity VARCHAR(45) NULL,
  CostumerStreet VARCHAR(45) NULL,
  CostumerPelak VARCHAR(45) NULL,
  BoughtStatus VARCHAR(45) NULL);
  
  insert into Bought values('5001','112','1','1','2017-10-19','1','tehran','yas','12','readytodeliever');
  insert into Bought values('5002','112','2','2','2017-09-22','1','tehran','lavasan','3','transporting');
  insert into Bought values('5003','113','3','3','2017-10-02','2','rasht','valieasr','5','delivered');
  insert into Bought values('5004','116','4','4','2009-12-11','2','tehran','farmanie','114','notdelivered');
  insert into Bought values('5005','118','5','5','2001-08-10','1','tehran','taleghani','56','readytodeliever');
  insert into Bought values('5006','119','5','5','2001-01-11','1','shiraz','sadi','6','readytodeliever');
  insert into Bought values('5007','120','5','5','2001-08-15','1','shiraz','taleghani','9','readytodeliever');
  
  insert into Bought values('5008','2001','5','5','2017-10-15','1','gilan','bahar','921','readytodeliever');
  insert into Bought values('5009','2002','5','5','2017-10-15','1','gilan','hafez','2','delivered');
  insert into Bought values('5010','2003','5','5','2001-08-15','1','gilan','safayi','3','transporting');

  insert into Bought values('5011','2007','5','5','2017-10-15','1','gilan','yas','4','transporting');
  insert into Bought values('5012','2007','5','5','2001-10-15','1','gilan','rasht','55','transporting');
  
  insert into Bought values('5013','2004','5','5','2017-10-15','1','gilan','saedi','6','transporting');
  
  
-- -----------------------------------------------------
-- BoughtDetail
-- -----------------------------------------------------
CREATE TABLE BoughtDetail(
  BoughtID INT,
  UtilityID INT,
  NumberOfUtility INT,
  primary key (BoughtID, UtilityID, NumberOfUtility ));
  
  
	insert into BoughtDetail values('5001','12','2');
	insert into BoughtDetail values('5002','14','1');
	insert into BoughtDetail values('5003','15','5');
	insert into BoughtDetail values('5004','11','4');
	insert into BoughtDetail values('5005','15','3');
	insert into BoughtDetail values('5006','12','10');
	insert into BoughtDetail values('5007','13','1');
    
    -- employee
	insert into BoughtDetail values('5008','17','1');
	insert into BoughtDetail values('5009','17','2');
	insert into BoughtDetail values('5010','17','3');
	insert into BoughtDetail values('5011','17','2');
	insert into BoughtDetail values('5012','17','1');
	insert into BoughtDetail values('5013','17','10');
   
   	
-- -----------------------------------------------------
-- Company
-- -----------------------------------------------------
CREATE TABLE Company (
  CompanyID INT primary key,
  CompanyName VARCHAR(45) NULL,
  RegisteredDate DATETIME NULL);
  
  
  insert into Company values('1001','Fanap', '2010-11-1');
  insert into Company values('1002','Ertebate farda' , '2003-01-19');
  insert into Company values('1003','Farasoo', '2007-04-25');
  insert into Company values('1004','Meyar', '2017-07-29');
  insert into Company values('1005','Saba System', '2014-07-17');

    
    create view cost(utilityID, totalnumber) as 
      select utilityId, sum(numberofutility)     
      from boughtdetail      
      group by utilityId;
      
      
      create view cost2(utilityID, numberofutility,BoughtDateTime) as 
      select utilityId, numberofutility , Bought.BoughtDateTime   
      from boughtdetail natural join bought; 
      
	  create view cost3(employeeID ,utilityID, numberofutility,BoughtDateTime, companyName) as 
      select Employee.EmployeeID ,utilityId, numberofutility , Bought.BoughtDateTime, company.Companyname
      from boughtdetail, bought, Employee, company
      where bought.boughtId = boughtDetail.boughtID and Employee.EmployeeID = bought.costumerID and employee.CompanyID=company.CompanyID ;
      
      
      
      create view q17(employeeID ,totalcost , companyname) as
      select cost3.employeeID, sum(cost3.numberofutility*utility.utilitycost) as totalcostpercustomer , cost3.companyname
	  from cost3, utility
	  where cost3.utilityID=utility.utilityCode and month(cost3.BoughtDateTime) = 10 and year(cost3.BoughtDateTime)=2017
	  group by cost3.employeeID;
      
      -- in takhfife employeearo mide 
      create view employeewithdiscount(employeeID, totalcost, companyname) as 
      select q17.employeeID, if(totalcost<5000000,0.9*totalcost,totalcost-500000), q17.companyname
	  from q17;

-- -----------------------------------------------------
-- Table `mydb`.`MrLink`
-- -----------------------------------------------------
CREATE TABLE MrLink (
  PersonID INT primary key references Person(PersonID));
  
    insert into MrLink values('131');
    insert into MrLink values('132');
    insert into MrLink values('133');
    insert into MrLink values('134');
    insert into MrLink values('135');
    insert into MrLink values('136');
    insert into MrLink values('137');

  
-- -----------------------------------------------------
-- CompanyLink`
-- -----------------------------------------------------
CREATE TABLE CompanyLink(
  CompanyID INT,
  LinkID INT,
  introducedDate DATETIME,
primary key (CompanyID,LinkID));


    insert into CompanyLink values('1002', '131', '2017-05-19');
    insert into CompanyLink values('1002', '132', '2017-05-19');
    insert into CompanyLink values('1003', '133', '2003-01-19');
    insert into CompanyLink values('1004', '134', '2004-04-19');
    insert into CompanyLink values('1005', '135', '2017-05-19');
    insert into CompanyLink values('1001', '136', '2017-01-19');
    insert into CompanyLink values('1003', '137', '2013-01-19');

  
  -- -----------------------------------------------------
-- Table `mydb`.`CompanyAddress`
-- -----------------------------------------------------
CREATE TABLE CompanyAddress(
  CompanyID INT primary key,
  CompanyCity VARCHAR(45) NULL,
  CompanyStreet VARCHAR(45) NULL,
  CompanyPelak VARCHAR(45) NULL);
  
  
    insert into CompanyAddress values('1001', 'Tehran', 'Enghelab', '21');
    insert into CompanyAddress values('1002', 'Tehran', 'Azadi', '43');
    insert into CompanyAddress values('1003', 'Esfehan', 'Taleghani', '8');
    insert into CompanyAddress values('1004', 'Mashhad', 'Bahar', '19');
    insert into CompanyAddress values('1005', 'Tehran', 'Arjantin', '5');

  
  -- -----------------------------------------------------
-- Table `mydb`.`Company_phone`
-- -----------------------------------------------------
CREATE TABLE Company_phone (
  CompanyID INT references CompanyAddress(CompanyID),
  CompanyPhone INT,
  primary key (CompanyID,CompanyPhone));


    insert into Company_phone values('1001', '021667799');
    insert into Company_phone values('1001', '021874837');
    insert into Company_phone values('1001', '021488897');
    insert into Company_phone values('1002', '021847894');
    insert into Company_phone values('1003', '033875997');
    insert into Company_phone values('1004', '077826482');
    insert into Company_phone values('1005', '018323828');
    insert into Company_phone values('1005', '012872876');

  
  
  
  -- -----------------------------------------------------
-- Table `mydb`.`TransportManIndiviual`
-- -----------------------------------------------------
CREATE TABLE TransportManIndiviual(
  TransportManName VARCHAR(45) ,
  TransportManFamilyName VARCHAR(45) ,
  TransportManShenasname INT primary key);
  
  insert into TransportManIndiviual values('hassan','abbasi','11111111');
  insert into TransportManIndiviual values('abbas','hassani','11111112');
  insert into TransportManIndiviual values('gholi','gholizade','11111113');
  insert into TransportManIndiviual values('ali','asgari','11111114');
  insert into TransportManIndiviual values('armin','mahdvi','11111115');
  insert into TransportManIndiviual values('ramtin','maleki','11111116');
  
  -- -----------------------------------------------------
-- Table `mydb`.`TransportDetail`
-- -----------------------------------------------------
CREATE TABLE TransportDetail(
  TransportManPelak varchar(4),
  BoughtId INT,
  RecievedDate DATETIME,
  primary key (TransportManPelak,BoughtId));
  
  insert into TransportDetail values('P311','5001','2017-05-20');
  insert into TransportDetail values('P311','5002','2017-05-23');
  insert into TransportDetail values('P312','5003','2017-11-04');
  insert into TransportDetail values('P313','5004','2009-12-12');
  insert into TransportDetail values('P313','5005','2001-08-10');
  

CREATE TABLE employees_audit (
EmployeeID INT primary key,
  CompanyID VARCHAR(45) references Company(CompanyID),
    action VARCHAR(50) DEFAULT NULL
);
DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON Employee
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
  employeeID = OLD.employeeID,
  CompanyID = OLD.CompanyID;
	-- changedat = NOW(); 
END$$
DELIMITER ;

UPDATE Employee 
SET 
    companyID = 'Phan'
WHERE
    employeeID = 2001;
  