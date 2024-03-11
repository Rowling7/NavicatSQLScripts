--MXT
--UPDATE TABLENAME SET COLUMNA = COLUMNB, COLUMNB = COLUMNA
--UPDATE INFO 	SET NAME =FIRSTNAME , FIRSTNAME= NAME 


--<------------------------------<---SQL 0.1 基础--->------------------------------>--

--ALL
SELECT * FROM DBO.INFO

--DISTINCT DISTINCT重复只显示一次
SELECT DISTINCT NAME FROM DBO.INFO

--INSERT
INSERT DBO.INFO VALUES ('20','LILU','','HUNAN')

--UPDATE
UPDATE DBO.INFO SET ID=3 WHERE ID =10 

---<TRUNCATE & DELETE >---
--DELETE 删除表中的数据可用WHERE 属于DML，可回滚
DELETE FROM DBO.INFO WHERE ID =20
--TRUNCATE TABLE 删除表中的所有行但是结构、约束、索引不会删除，并重建表
	--重置所有自动增量值、不可用WHERE、效率高于DELETE
	--属于DDL ，不可回滚
TRUNCATE TABLE K60

--TOP
SELECT TOP 60 PERCENT (NAME) ,ID,ADDRESS FROM DBO.INFO

--LIKE 开头%包含%结尾
SELECT * FROM DBO.INFO
WHERE NAME  LIKE '%三%'

--[]
SELECT * FROM DBO.INFO
WHERE NAME LIKE '%[三四五]%'

--IN 备份 选择插入数据
SELECT *FROM DBO.INFO
WHERE NAME IN ('张三','李四')

--BETWEEN
SELECT * FROM DBO.INFO
WHERE ID
BETWEEN '3' AND '15'

--UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。
--同时，每条 SELECT 语句中的列的顺序必须相同。
--联合结果由两个表中任意一个表或者两个表中都存在的行组成
SELECT * FROM INFO
UNION
SELECT * FROM INFO_COPY1

--CREATE
CREATE DATABASE INFOBACKUP

--INTO
SELECT *
INTO DBO.INFOBACKUP
FROM DBO.INFO

--清空表格数据
TRUNCATE TABLE DBO.TMPTABLE

--ALTER
ALTER TABLE TABLE_NAME
DROP(ADD) COLUMN COLUMN_NAME

ALTER TABLE DBO.INFO
ALTER COLUMN ID AUTO_INCREMENT

--AUTO-INCREMENT 会在新记录插入表中时生成一个唯一的数字。
--P_ID INT NOT NULL AUTO_INCREMENT

--INNULL
SELECT NAME,AGE*(AGE+ISNULL(AGE,0)) AS AGE
FROM DBO.INFO

--MID/SUBSTRING 提取字符
SELECT SUBSTRING(NAME,1,1) AS FNAME FROM DBO.INFO

--LEN 返回长度
SELECT LEN(NAME)AS 长度 FROM DBO.INFO

--ROUND四舍五入 DECIMALS 位数
SELECT ROUND(AGE,0) FROM DBO.INFO

--GETDATE()/NOW() 获取当前时间
SELECT *,GETDATE()AS 当前时间 FROM DBO.INFO

--FORMAT 格式化显示字段
SELECT *, FORMAT(NOW(),'YYYY-MM-DD') AS PERDATE
FROM DBO.INFO

--ONVERT(SQLSERVER有)格式化显示字段
SELECT *, CONVERT(VARCHAR(12) , GETDATE(), 111 ) AS 日期
FROM DBO.INFO

--查询长度 LEN 查询 字段后面的空格不算在内
SELECT LEN(NAME) 	LEN FROM INFO WHERE NAME LIKE 'ZZZ'
SELECT DATALENGTH(NAME) DATALENGTH FROM INFO WHERE  NAME LIKE 'ZZZ'

--CI 指定不区分大小写，CS 指定区分大小写
--CHARINDEX 找到字符（CHAR）的位置（INDEX）  全匹配
SELECT CHARINDEX('TEST','THIS TEST IS TEST') --6
SELECT CHARINDEX('TEST','THIS TEST IS TEST',7)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CS_AS)  --14
SELECT CHARINDEX('TEST','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--PATINDEX 判断一个字符串中是否包含另一个字符串  模糊匹配
SELECT PATINDEX('%TER%','INTERESTING DATA')  --3
SELECT PATINDEX('%T_NG%','INTERESTING DATA')  --8
SELECT PATINDEX('%ES%','THIS TEST IS TEST' COLLATE LATIN1_GENERAL_CS_AS)  --15
SELECT PATINDEX('%T_S%','THIS TEST IS TEST'COLLATE LATIN1_GENERAL_CI_AS)  --6

--ISNULL(VALUE1,VALUE2)
        --VALUE1与VALUE2的数据类型必须一致。
        --如果VALUE1的值不为NULL，结果返回VALUE1。
        --如果VALUE1为NULL，结果返回VAULE2的值。VAULE2是你设定的值。
USE [MYDB]
SELECT *,[返回值]=ISNULL(AGE,'999')
FROM INFO  
WHERE ISNULL(AGE,'0')='0'







--<------------------------------<---SQL 0.1.1 基础2.0--->------------------------------>--

--WAITFOR  直到所设定的等待时间已过或所设定的时间已到才继续往下执行
WAITFOR DELAY '00:00:03' --'00:00:03' 固定格式，等待3秒后执行
WAITFOR TIME  '16:02:50'	  --'16:02:50'	固定格式，等到16时02分50秒开始执行
SELECT * FROM INFO

--查询 SQL 语句执行时长
SET STATISTICS PROFILE ON;
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO
/*--你的SQL脚本开始*/
--WAITFOR DELAY '00:00:03'
--WAITFOR TIME  '16:52:20'
SELECT * FROM INFO
/*你的SQL脚本结束*/
GO
SET STATISTICS PROFILE OFF;
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;






--<------------------------------<---SQL 0.2 审核--->------------------------------>--

--2.1.28 NULLIF:如果两个表达式具有相同的值，则返回 NULL 的函数，否则返回EXPRESSION1。NULLIF(EXPRESSION1,EXPRESSION2)
SELECT A0102,HA0102,K0101,RTRIM(K0112) K0112,K0108,K0109,RTRIM(K0110) K0110,RTRIM(K0111) K0111,K0191,K3905,HK3905
FROM K001
WHERE ( (NULLIF(LTRIM(RTRIM(K0191)),'') IS NULL AND NULLIF(K3905,'') IS NOT NULL) 
	OR (NULLIF(LTRIM(RTRIM(K0191)),'') IS NOT NULL AND LEFT(RTRIM(K0191),4)='#TJND#' AND NULLIF(K3905,'') IS NULL) )

SELECT LTRIM(K0191) AS L,RTRIM(K0191) AS R ,NULLIF(LTRIM(K0191),RTRIM(K0191))AS "L/R" ,CAST(LTRIM(K0191) AS NUMERIC)-CAST(RTRIM(K0191)AS NUMERIC)
FROM  K001 
ORDER BY "L/R" DESC

--2.131
--ISDATE函数判断指定字符串是否是有效日期。ISDATE(DATE) 返回值：INT,是1否0
--CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END ,2021
SELECT HA0102,K0101,K0108,K0109,K0190,HK3905,K0191 改建年度,K0155 AS 最近一次维修年度,
CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END AS 统计年份
FROM K001
WHERE K0155 IS NOT NULL AND 
(
ISDATE(K0155)=0 OR 
LEN(RTRIM(LTRIM(K0155)))<>4 OR
K0155>CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END OR
K0155<=K0190 OR
(K0155=LEFT(RTRIM(K0191),4) AND K3905 NOT IN ('1','2'))
)

SELECT CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END
FROM K001

---2.3
--把数据库表ARTICLE中的所有TITLE字段里的SCHOOL字符串替换成HELLO。
--UPDATE `ARTICLE` SET TITLE=REPLACE(TITLE,'SCHOOL','HELLO');
--REPLACE函数定义
--REPLACE(ORIGINAL-STRING 被替换列，SEARCH-STRING 被替换值，REPLACE-STRING 替换值)
SELECT 	A0102,HA0102,K0101,RTRIM( K0112 ) K0112,	K0108,K0109,RTRIM( K0110 ) K0110,RTRIM( K0111 ) K0111,K0124 
FROM K001 
WHERE ( LEFT(REPLACE(LTRIM(K0101),'C','ZZ'),1)<LEFT(REPLACE(LTRIM(K0124),'C','ZZ'),1) 
OR(LEFT(LTRIM(K0101),1)=LEFT(LTRIM(K0124),1) 
AND (LEN(LTRIM(RTRIM(K0101)))<LEN(LTRIM(RTRIM(K0124))) 
OR LTRIM(RTRIM(K0101))<LTRIM(RTRIM(K0124)))) )


--2.4.10
-- ROUND()四舍五入 ROUND（P1,P2,P3）;P1被操作数 P2 小数点位数	P3（0/1）0四舍五入 1截断
-- NUMERIC() NUMERIC（18，0）总的位数为18位数字，小数点后的位数为0位。
SELECT
	A.K0101,
	A.K0112,
	[路线总里程(千米)] = ZLC,
	[可绿化里程(千米)] = KLV,
	[桥梁总长度(千米)] = CAST ( ROUND( ISNULL( QLCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ),
	[隧道总长度(千米)] = CAST ( ROUND( ISNULL( SDCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ),
	[路线里程与桥隧长度的差值(千米)] = ZLC - CAST ( ROUND( ISNULL( QLCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ) - CAST ( ROUND( ISNULL( SDCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ) 
FROM
	(
	SELECT
		K0101,
		MAX ( RTRIM( K0112 ) ) K0112,
		SUM ( ISNULL( K0114, 0 ) ) ZLC,
		SUM ( ISNULL( A3101, 0 ) ) KLV 
	FROM
		K001 
	WHERE
		A0102 LIKE '#A0102#%' 
		AND A0102 LIKE '#GLDW#%' 
		AND LEFT ( K0101, 1 ) IN ( 'G', 'S', 'X', 'Y', 'C', 'Z' ) 
		AND ISNULL( K0123, '2' ) = '2' 
		AND RTRIM( K0124 ) IS NULL 
	GROUP BY
		K0101 
	) A
	LEFT JOIN (
	SELECT
		K0101,
		SUM ( ISNULL( K6008, 0 ) ) / 1000 QLCD 
	FROM
		K060 
	WHERE
		A0102 LIKE '#A0102#%' 
		AND A0102 LIKE '#GLDW#%' 
		AND LEFT ( K0101, 1 ) IN ( 'G', 'S', 'X', 'Y', 'C', 'Z' ) 
		AND NOT ( K6002 LIKE '%左桥%' OR K6002 LIKE '%(左)%' OR K6002 LIKE '%（左）%' ) 
	GROUP BY
		K0101 
	) B ON A.K0101= B.K0101
	LEFT JOIN (
	SELECT
		K0101,
		SUM ( ISNULL( K6305, 0 ) ) / 1000 SDCD 
	FROM
		K063 
	WHERE
		A0102 LIKE '#A0102#%' 
		AND A0102 LIKE '#GLDW#%' 
		AND LEFT ( K0101, 1 ) IN ( 'G', 'S', 'X', 'Y', 'C', 'Z' ) 
		AND NOT ( K6302 LIKE '%隧道左%' OR K6302 LIKE '%(左)%' OR K6302 LIKE '%（左）%' ) 
	GROUP BY
		K0101 
	) C ON A.K0101= C.K0101 
WHERE
	( QLCD IS NOT NULL OR SDCD IS NOT NULL ) 
	AND KLV - (
	ZLC - CAST ( ROUND( ISNULL( QLCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ) - CAST ( ROUND( ISNULL( SDCD, 0 ), 3 ) AS NUMERIC ( 10, 3 ) ) 
	) > 0.001

--3.1.1.1
--ISDATA() 返回值 1是 0否
SELECT
RTRIM(HA0102),RTRIM(K0101),K6001,RTRIM(K6002),HK6007,HK6028,A1305,K6050
FROM K060 
WHERE A1305 IS NULL OR  A1305='' OR  LEN(A1305)<>8 OR  ISDATE(A1305)<>1 OR
 LEFT(CASE WHEN ISDATE(A1305)<>1 THEN '1900' ELSE A1305 END,4)<=(CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END)-3 OR
 RTRIM(ISNULL(K6050,''))=''





--<------------------------------<---SQL 0.3 报表--->------------------------------>--

--L01

		
SELECT 
[公路里程总计]=(ISNULL(SUM(A0307),0)+ISNULL(SUM(A0308),0)+ISNULL(SUM(A0310),0)+ISNULL(SUM(A0311),0)),
[合计]=(ISNULL(SUM(A0304),0)+ISNULL(SUM(A0305),0)+ISNULL(SUM(A0306),0)+ISNULL(SUM(A0307),0)+ISNULL(SUM(A0308),0)+ISNULL(SUM(A0310),0)+ISNULL(SUM(A0311),0)),
[小计]=(ISNULL(SUM(A0304),0)+ISNULL(SUM(A0305),0)+ISNULL(SUM(A0306),0)),
ISNULL(SUM(A0304),0) 四车道,
ISNULL(SUM(A0305),0) 六车道,
ISNULL(SUM(A0306),0) 八车道及以上,
ISNULL(SUM(A0307),0) 一级,
ISNULL(SUM(A0308),0) 二级,
ISNULL(SUM(A0309),0) 一幅高速,
ISNULL(SUM(A0310),0) 三级,
ISNULL(SUM(A0311),0) 四级,
ISNULL(SUM(A0312),0) 等外公路
FROM A11 
WHERE SUBSTRING(A11.A0101,1,4)<2022 
--AND A0203 = 'S'
AND A0203 LIKE 'G%'







--<------------------------------<---SQL 0.4 文档知识--->------------------------------>--

--#T 临时私人表，生命周期是连接期间，其他人无法访问（建立表链接可以）。
--##T 全局临时表，其他人可访问
--删除的正确格式
IF OBJECT_ID('TEMPDB..#T') IS NOT NULL
DROP TABLE #T


--CASE
SELECT [人名]=CASE WHEN LEFT(NAME,1)='张'THEN '张' ELSE '王'END,
	[	人数]	=SUM(1)
	FROM INFO 
	WHERE NAME<>''
	GROUP BY CASE WHEN LEFT(NAME,1)='张'THEN '张' ELSE '王'END
	
	




--<------------------------------<---SQL 0.5 LV.5--->------------------------------>--

--------------------存储过程--------------------
CREATE PROCEDURE PROCEDURE_NAME
--PROCEDURE_NAME为存储过程名(不能以阿拉伯数字开头)，在一个数据库中触发器名是唯一的。名字的长度不能超过个字。PROCEDURE可以简写为PROC。
@PARAM1 DATATYPE,@PARAM2 DATATYPE 
--@PARAM1和@PARAM2为存储过程的参数，DATATYPE为参数类型,多个参数用逗号隔开,最多允许个参数。
AS
--存储过程要执行的操作
BEGIN
--BEGIN跟END组成一个代码块，可以写也可以不写，如果存储过程中执行的SQL语句比较复杂，用BEGIN和END会让代码更加整齐，更容易理解。
END
GO
--GO就代表结操作完毕　　
EXEC PROCEDURE_NAME [参数名] 
--调用存储过程PROCEDURE_NAME。
DROP PROCEDURE PROCEDURE_NAME 
--删除存储过程PROCEDURE_NAME，不能在一个存储过程中删除另一个存储过程，只能调用另一个存储过程
SHOW PROCEDURE STATUS 
--显示数据库中所有存储的存储过程基本信息，包括所属数据库，存储过程名称，创建时间等
SHOW CREATE PROCEDURE PROCEDURE_NAME 
--显示存储过程PROCEDURE_NAME的详细信息
EXEC SP_HELPTEXT PROCEDURE_NAME 
--显示你这个PROCEDURE_NAME这个对象创建文本



-------------------- 存储过程&声明变量&执行函数--------------------
CREATE  PROCEDURE  FACTORIAL  --创建存储过程,简写PROC亦可
@M INT 
AS
BEGIN--BEGIN  END 为一组
	DECLARE
		@N INT,@L INT --DECLARE：声明变量@N @L
	SELECT
		@N = 1,@L = 1
	WHILE
			@N <@M BEGIN
				SET @L =@L *@N --相乘
				SET @N =@N + 1 
			END PRINT @L --PRINT 打印
			
		END
		
EXEC FACTORIAL 2  --执行函数(EXEC)  函数名(FACTORIAL)  @M的值为(2)



--------------------SET & SELECT  区别-------------------

-- (错误的)表达式<返回多个值>时，使用 SET 赋值
USE MYDB
DECLARE @NAME VARCHAR(128)
SET @NAME=(SELECT NAME FROM INFO)
PRINT @NAME
/*
出错信息为
服务器: 消息 512，级别 16，状态 1，行 2
子查询返回的值多于一个。当子查询跟随在=、!=、<、<=、>、>=之后，或子查询用作表达式时，这种情况是不允许的。
*/

--表达式<返回多个值>时，使用 SELECT 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SELECT @NAME= NAME FROM INFO
PRINT @NAME --结果集中最后一个 USERNAME 列的值
--结果 老六


--表达式<未返回值>时，使用 SET 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SET @NAME= (SELECT NAME FROM INFO WHERE NAME='NOT')
PRINT @NAME  --NULL值
--结果 NULL

--表达式<未返回值>时，使用 SELECT 赋值
USE MYDB
DECLARE @NAME VARCHAR(20)
SET @NAME='JACK'
SELECT @NAME=NAME FROM INFO WHERE  NAME='张三'
PRINT @NAME  --JACK,保存原来的值
--结果 JACK

