--“路段路面类型”为“1/2”时，“养护里程”应等于“路段里程”
SELECT a1001,a3101,a3102,k0114
--update k001 set  a1001=k0114
from k001 
where 
rtrim(k0101)+rtrim(k0115)in(
'CS02341323005','CS02341323006','CS02341323007','X042341323001','X042341323002','X042341323003','C9Z1341321001','C9Z1341321002','C9Z1341321003','C9Z3341302001','C9Z3341322001','C9Z3341322002','C9Z3341322003','C9Z3341324001','C9Z3341324002','C9Z3341324003','C9Z3341324004','C9Z3341324005','C9Z3341324006','C9Z3341324007','C9Z3341324008','X303340828021','Y078340825001','Y078340825002','Y078340825003','Y078340825004','X207341702001','X425340124008','X018341882001','X211340123001','X211340123002','X211340123003','Y103340882001','CI54341802001','X002341321001','X002341321002','X002341321003','X002341321004','X100340181012')

--DK6306
---10.未变更
---11.新建
---14.往年建成本年统计
---21.指标变更或地理位置变更

--本年地理位置发生变更，变更原因填写错误
--sELECT a,SUBSTRING(a,8,13) xlsa1,SUBSTRING(a,charindex('与上年村道代码为',a)+8,13) xlsa2
SELECT rtrim(k0101)+rtrim(k0115),K3912,HK3912
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from k001 
where rtrim(k0101)+rtrim(k0115) in (
SELECT SUBSTRING(a,8,13) xlsa1
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet1$)
)

--SELECT a,SUBSTRING(a,8,13) xlsa1,SUBSTRING(a,charindex('与上年村道代码为',a)+8,13) xlsa2
SELECT rtrim(K.k0101)+rtrim(K.k0115),K.K3912,K.HK3912,xlsa1
--UPDATE K SET K.K3912='21',K.HK3912='指标变更或地理位置变更'
from k001 K
LEFT JOIN  (
SELECT SUBSTRING(a,8,13) xlsa1
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet1$)
)XLS ON rtrim(K.k0101)+rtrim(K.k0115)=XLS.XLSA1
where XLSA1 IS NOT NULL  

/*
SELECT count(SUBSTRING(a,8,13) ),SUBSTRING(a,8,13) xlsa1
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet1$)
GROUP BY SUBSTRING(a,8,13)
ORDER BY count(SUBSTRING(a,8,13) ) desc
*/


--D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\34_XXX\mapdata.sdd
--未更新编号导致
SELECT COUNT(LDBM),LDBM
FROM openrowset('Microsoft.Jet.OLEDB.4.0', 'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\34_XXX\mapdata.sdd';'admin';'',ZRC_TDLXL)
GROUP BY LDBM
ORDER BY COUNT(LDBM) desc


USE [HRP-DBMS2014]
--本年地理位置和属性未发生变更，变更原因填写错误
SELECT rtrim(k0101)+'L'+rtrim(k6001),K3912,HK3912
--UPDATE K060 SET K3912='10',HK3912='未变更'
from k060 k 
LEFT JOIN  (
SELECT a,SUBSTRING(a,8,15) xlsa1
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet3$)
)XLS ON rtrim(k0101)+'L'+rtrim(k6001)=XLSA1
WHERE xlsa1 IS NOT NULL
ORDER BY K3912


SELECT rtrim(k0101)+'L'+rtrim(k6001),K3912,HK3912
from k060 k 
--UPDATE K060 SET K3912='10',HK3912='未变更'
WHERE  rtrim(k0101)+'L'+rtrim(k6001) IN  (
SELECT SUBSTRING(a,8,15) xlsa1
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet3$)
)



USE [NCGL342023]
--本年地理位置发生变更，变更原因填写错误
SELECT ZRCZDM,xls.Z,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='21'
from T_ZRC
left join (
SELECT a,SUBSTRING(a,18,15) z
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet2$)
where b =21
)xls on ZRCZDM=xls.Z
WHERE XLS.Z IS NOT NULL

--本年地理位置和属性未发生变更，变更原因填写错误
SELECT ZRCZDM,xls.Z,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='10'
from T_ZRC
left join (
SELECT a,SUBSTRING(a,18,15) z
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet2$)
where b =10
)xls on ZRCZDM=xls.Z
WHERE XLS.Z IS NOT NULL


--本年地理位置发生变更，变更原因填写错误
SELECT JZCBm,xls.Z,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
left join (
SELECT a,SUBSTRING(a,9,12) z,B
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet4$)
where b =21
)xls on JZCBm=xls.Z
WHERE XLS.Z IS NOT NULL

--本年地理位置和属性未发生变更，变更原因填写错误
SELECT JZCBm,xls.Z,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
left join (
SELECT a,SUBSTRING(a,9,12) z,B
from  OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0122.xls',sheet4$)
where b =10
)xls on JZCBm=xls.Z
WHERE XLS.Z IS NOT NULL


USE NCGL342023
SELECT ssx,xzBm,xzmc,BGYY_XC
--UPDATE T_xz SET BGYY_XC='10'
from T_xz 
where  xzBm in('340102101000','340102451000','340193450000','340193460000')


USE NCGL342023
SELECT ssx,xzBm,xzmc,BGYY_XC
--UPDATE T_xz SET BGYY_XC='14'
from T_xz 
where  xzBm in('340827001000','340827002000','340827003000','340826001000','340826002000')



SELECT JZCBm,jzcmc,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
where  JZCBm in
('340102101001','340102101002','340102101003','340102101004','340102101005','340102101006','340102101007','340102451006','340102451007','340102451008','340193004001','340193004002','340193004003','340193004004','340193004005','340193004006','340193004007','340193004008','340193004009','340193004010','340193005001','340193005002','340193005003','340193005004','340193005005','340193005007','340193005008','340193005010','340193005011','340193450001','340193450002','340193450003','340193450004','340193450005','340193450006','340193450007','340193460001','340193460002','340193460003','340193460005','340193460006')