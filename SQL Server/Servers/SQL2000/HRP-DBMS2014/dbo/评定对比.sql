if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk060'))
drop table ##tk060

SELECT
桥梁身份码,
桥梁代码,
评定等级代码,
评定等级汉字,
评定日期,
评定单位 
INTO ##TK060
FROM(
	SELECT
	NULL AS 桥梁身份码,
	桥梁代码,
	评定等级代码,
	评定等级汉字,
	REPLACE(评定日期,'-','') 评定日期,
	评定单位
	from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240304 评定信息\Report资产库桥梁明细表--20240304.xls',明细表$)
	WHERE LEFT(桥梁代码,1)IN ('G','H')
	UNION
	SELECT
	桥梁身份码,
	NULL AS 桥梁代码,
	评定等级代码,
	评定等级汉字,
	评定日期,
	评定单位
	from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240304 评定信息\公路桥梁明细表（国省道）-安徽省交通控股集团有限公司(2024-03-04).xls',SHEET1$)
	WHERE 桥梁身份码 IS NOT NULL
)A

SELECT * FROM ##TK060


---------------------G
SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON B=replace(replace(T.桥梁代码,'G206340802L0590','G206341721L0590'),'G206340802L0600','G206341721L0600')
WHERE LEFT(B,1) IN ('H','G') AND BN NOT IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and [AS]<>评定等级代码 
--and 桥梁代码='G105340828L0010'
ORDER BY 桥梁代码

SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON B=replace(replace(T.桥梁代码,'G206340802L0590','G206341721L0590'),'G206340802L0600','G206341721L0600')
WHERE LEFT(B,1) IN ('H','G') AND BN NOT IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and  AU<>评定日期 
ORDER BY 桥梁代码

SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON B=replace(replace(T.桥梁代码,'G206340802L0590','G206341721L0590'),'G206340802L0600','G206341721L0600')
WHERE LEFT(B,1) IN ('H','G') AND BN NOT IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and  AV<>评定单位
ORDER BY 桥梁代码




------------------------G9
SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON BN=桥梁身份码
WHERE LEFT(B,1) IN ('H','G') AND BN  IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and [AS]<>评定等级代码 
ORDER BY A--桥梁代码

SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON BN=桥梁身份码
WHERE LEFT(B,1) IN ('H','G') AND BN  IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and  AU<>评定日期 
ORDER BY 桥梁代码

SELECT A,BN,B,桥梁代码,[AS],评定等级代码,[AT],评定等级汉字,AU,评定日期,AV,评定单位
FROM NB
INNER JOIN ##TK060 T  ON BN=桥梁身份码
WHERE LEFT(B,1) IN ('H','G') AND BN  IN(SELECT 桥梁身份码 FROM ##TK060 WHERE 桥梁代码 IS NULL)
and  AV<>评定单位
ORDER BY 桥梁代码










---评定等级代码
SELECT
SUBSTRING(F1,charindex('桥梁代码_年报:',F1)+8,charindex('评定等级代码_年报:',F1)-charindex('桥梁代码_年报:',F1)-10) F,
SUBSTRING(F1,charindex('桥梁身份码:',F1)+6,20) F2,
SUBSTRING(F1,charindex('评定等级代码_年报:',F1)+10,1) F3,
SUBSTRING(F1,charindex('评定日期_年报:',F1)+8,8) F4,
SUBSTRING(F1,charindex('评定等级代码_国桥库:',F1)+11,1) F6,
SUBSTRING(F1,charindex('评定日期_国桥库:',F1)+9,8) F7
FROM OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240304 评定信息\公路桥梁明细表（国省道）-安徽省交通控股集团有限公司(2024-03-04).xls',SHEET2$)
WHERE  SUBSTRING(F1,charindex('评定等级代码_年报:',F1)+10,1)<>SUBSTRING(F1,charindex('评定等级代码_国桥库:',F1)+11,1)---F3<>F6


---评定日期
SELECT --F1,
SUBSTRING(F1,charindex('桥梁身份码:',F1)+6,20) F2,
SUBSTRING(F1,charindex('评定等级代码_年报:',F1)+10,1) F3,
SUBSTRING(F1,charindex('评定日期_年报:',F1)+8,8) F4,
SUBSTRING(F1,charindex('评定等级代码_国桥库:',F1)+11,1) F6,
SUBSTRING(F1,charindex('评定日期_国桥库:',F1)+9,8) F7
FROM OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240304 评定信息\公路桥梁明细表（国省道）-安徽省交通控股集团有限公司(2024-03-04).xls',SHEET2$)
WHERE  SUBSTRING(F1,charindex('评定日期_年报:',F1)+8,8)<>SUBSTRING(F1,charindex('评定日期_国桥库:',F1)+9,8)---F4<>F7


---评定单位
SELECT --F1,
SUBSTRING(F1,charindex('桥梁身份码:',F1)+6,20) F2,
SUBSTRING(F1,charindex('评定等级代码_年报:',F1)+10,1) F3,
SUBSTRING(F1,charindex('评定日期_年报:',F1)+8,8) F4,
SUBSTRING(F1,charindex('评定单位_年报:',F1)+8,charindex('桥梁代码_国桥库',F1)-charindex('评定单位_年报:',F1)-10) F5,
SUBSTRING(F1,charindex('评定等级代码_国桥库:',F1)+11,1) F6,
SUBSTRING(F1,charindex('评定日期_国桥库:',F1)+9,8) F7,
SUBSTRING(F1,charindex('评定单位_国桥库:',F1)+9,99) F8
FROM OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240304 评定信息\公路桥梁明细表（国省道）-安徽省交通控股集团有限公司(2024-03-04).xls',SHEET2$)
WHERE  SUBSTRING(F1,charindex('评定单位_年报:',F1)+8,charindex('桥梁代码_国桥库',F1)-charindex('评定单位_年报:',F1)-10)<>SUBSTRING(F1,charindex('评定单位_国桥库:',F1)+9,99)