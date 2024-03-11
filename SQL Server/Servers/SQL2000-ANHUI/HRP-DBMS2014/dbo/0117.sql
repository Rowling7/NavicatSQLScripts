--DK6306
---10.未变更
---11.新建
---14.往年建成本年统计
---21.指标变更或地理位置变更
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet9$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL

--------------------0118
---路段指标发生变更，“变更原因”不能填写为“10.未变更”
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet1$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL

----检查“路段平交路口数(个)”与“平交路口共有减速带数量(个)”的关系
SELECT k0812,k0813,rtrim(k0101)+rtrim(k0108)
--update k08 set k0812=1
from k08 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路线编码=',a)+7,10)+SUBSTRING(a,charindex(',起点桩号=',a)+7,charindex(',讫点桩号=',a)-42) z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet2$)
)XLS ON rtrim(k0101)+rtrim(k0108)=XLS.Z
WHERE XLS.Z IS NOT NULL


--“路段路面类型”为“1/2”时，“养护里程”应等于“路段里程”
USE [NCGL342023]
SELECT LDBM,YHLC,Z
--UPDATE T_LD SET YHLC=NULL
from T_LD 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet6$)
)XLS ON LDBM=XLS.Z
WHERE XLS.Z IS NOT NULL


--“路段路面类型”为“1/2”时，“养护里程”应等于“路段里程”
USE [NCGL342023]
SELECT LDBM,YHLC,Z,RTRIM(LK.K0101)+RTRIM(LK.K0115),LK.A1001 LA1001,RTRIM(K.K0101)+RTRIM(K.K0115),K.A1001 A1001
--UPDATE T_LD SET YHLC=NULL
from T_LD 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet6$)
)XLS ON LDBM=XLS.Z
LEFT JOIN [HRP-DBMS2014-2022年报]..K001 LK ON RTRIM(LK.K0101)+RTRIM(LK.K0115)= XLS.Z
LEFT JOIN [HRP-DBMS2014]..K001 K ON RTRIM(K.K0101)+RTRIM(K.K0115)= XLS.Z
WHERE XLS.Z IS NOT NULL
