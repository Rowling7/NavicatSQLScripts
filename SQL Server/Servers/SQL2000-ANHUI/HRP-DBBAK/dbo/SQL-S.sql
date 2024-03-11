--备份库 更新了历史表
backup database [HRP-DBMS2014] to disk ='E:\HRP-DBMS2014-02010912改池州路段行区划'

--备份库 更新了历史表
backup database [HRP-GHSS2014] to disk ='E:\HRP-GHSS2014-0103-1'


backup database [NCGL342023] to disk ='E:\NCGL342023-202401231003'


USE [HRP-DBMS2014]
USE [HRP-DBMS2014]
DECLARE @path varchar(200)
set @path='E:\HRP-DBMS2014-'+left(replace(replace(replace(CONVERT(varchar, getdate(), 120 ),'-',''),' ',''),':',''),12)+'(BAK)'
TRUNCATE table OYDST_USERTABLELOGData
backup database [HRP-DBMS2014] to disk =@path

USE [HRP-GHSS2014]
USE [HRP-GHSS2014]
DECLARE @path2 varchar(200)
set @path2='E:\HRP-GHSS2014-'+left(replace(replace(replace(CONVERT(varchar, getdate(), 120 ),'-',''),' ',''),':',''),12)+'(BAK)'
--TRUNCATE table OYDST_USERTABLELOGData
backup database [HRP-GHSS2014] to disk =@path2



/*
use [HRP-GHSS2014]
update K08
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k03
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))


use [HRP-DBMS2014]
update v53
set v8105=rtrim(ltrim(replace(replace(replace(replace(v8105,char(13),''),char(10),''),char(9),''),char(32),'')))
update v52
set v8105=rtrim(ltrim(replace(replace(replace(replace(v8105,char(13),''),char(10),''),char(9),''),char(32),'')))
update v51
set v8105=rtrim(ltrim(replace(replace(replace(replace(v8105,char(13),''),char(10),''),char(9),''),char(32),'')))
update v71
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k060
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k063
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k065
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k098
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k088
set k0112=rtrim(ltrim(replace(replace(replace(replace(k0112,char(13),''),char(10),''),char(9),''),char(32),'')))
update k060
set k6050=rtrim(ltrim(replace(replace(replace(replace(k6050,char(13),''),char(10),''),char(9),''),char(32),'')))
*/