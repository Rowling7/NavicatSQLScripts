---------------------20240117
--变更原因='10',原乡（镇）代码='340124109000',乡（镇）代码='340124109000',乡（镇）名称='白湖镇'

	USE [NCGL342023]
SELECT xzBm,xls.b,BGYY_XC
--UPDATE T_xz SET BGYY_XC='21'
from T_xz 
left join (
SELECT a,SUBSTRING(a,charindex('乡（镇）代码=',a)+8,12) b
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet6$)
)xls on xzBm=xls.b
WHERE XLS.B IS NOT NULL


SELECT JZCBm,xls.Z,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
left join (
SELECT a,SUBSTRING(a,charindex(',建制村代码=',a)+8,12) Z,B,C,D
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet7$)
)xls on JZCBm=xls.Z
WHERE XLS.Z IS NOT NULL


SELECT ZRCZDM,xls.Z,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='21'
from T_ZRC
left join (
SELECT a,SUBSTRING(a,charindex(',自然村（组）代码=',a)+11,15) Z
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet8$)
)xls on ZRCZDM=xls.Z
WHERE XLS.Z IS NOT NULL


---------------------20240122
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
--UPDATE T_xz SET BGYY_XC='11'
from T_xz 
where  xzBm in('340827001000','340827002000','340827003000','340826001000','340826002000')

SELECT JZCBm,jzcmc,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
where  JZCBm in
('340102101001','340102101002','340102101003','340102101004','340102101005','340102101006','340102101007','340102451006','340102451007','340102451008','340193004001','340193004002','340193004003','340193004004','340193004005','340193004006','340193004007','340193004008','340193004009','340193004010','340193005001','340193005002','340193005003','340193005004','340193005005','340193005007','340193005008','340193005010','340193005011','340193450001','340193450002','340193450003','340193450004','340193450005','340193450006','340193450007','340193460001','340193460002','340193460003','340193460005','340193460006')

---------------------20240123
use [HRP-DBMS2014]
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0123.xls',sheet1$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL

SELECT a1001,* from k001 
--update k001 set a1001='0.606' 
where a0102='3420825'and k0101='X304340825' and k0115='010'

SELECT HK0404,* from k001 
--update k001 set K0404='2',HK0404='双车道' 
where  k0101='X553341225' and k0115='005'

SELECT RTRIM(K060.K0101)+'L'+RTRIM(K6001),k3912,HK3912,XLS.Z
--UPDATE K060 SET K3912='21',HK3912='指标变更或地理位置变更'
from K060
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0123.xls',sheet2$)
)XLS ON RTRIM(K060.K0101)+'L'+RTRIM(K6001)=XLS.Z
WHERE XLS.Z IS NOT NULL

USE NCGL342023
SELECT JZCBm,xls.Z,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
left join (
SELECT a,SUBSTRING(a,charindex(',建制村代码=',a)+8,12) Z
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0123.xls',sheet3$)
)xls on JZCBm=xls.Z
WHERE XLS.Z IS NOT NULL



use [HRP-DBMS2014]
--“路段路面类型”为“1/2”时，“养护里程”应等于“路段里程”
SELECT a1001,k0114
--update k001 set  a1001=k0114
from k001 
where 
rtrim(k0101)+rtrim(k0115)in(
'CS02341323005','CS02341323006','CS02341323007','X042341323001','X042341323002','X042341323003','C9Z1341321001','C9Z1341321002','C9Z1341321003','C9Z3341302001','C9Z3341322001','C9Z3341322002','C9Z3341322003','C9Z3341324001','C9Z3341324002','C9Z3341324003','C9Z3341324004','C9Z3341324005','C9Z3341324006','C9Z3341324007','C9Z3341324008','X303340828021','Y078340825001','Y078340825002','Y078340825003','Y078340825004','X207341702001','X425340124008','X018341882001','X211340123001','X211340123002','X211340123003','Y103340882001','CI54341802001','X002341321001','X002341321002','X002341321003','X002341321004','X100340181012')

use [HRP-DBMS2014]
--“路段路面类型”为“1/2”时，“养护里程”应等于“路段里程”
SELECT k0101,a1001,k0114
--update k001 set  a1001=k0114
from k001 
where a1001<>k0114 and  isnull(k0123,'2')='2' and nullif(k0124,'') is null and left (k0101,1)in ('x','y','c')

---------------------20240124



use NCGL342023
SELECT JZCBm,JZCMC,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
WHERE jzcbm  in ('341225121201','341225200201','341225206200','341225206201')

use NCGL342023
SELECT JZCBm,JZCMC,BGYY_XC,YXTDLXDJ,YXTDLXBM
--UPDATE T_JZC SET YXTDLXDJ='Y'
from T_JZC 
WHERE jzcbm  in ('341225206200','341225206201')

use NCGL342023
SELECT JZCBm,JZCMC,BGYY_XC,YXTDLXDJ,YXTDLXBM
--UPDATE T_JZC SET YXTDLXDJ='C'
from T_JZC 
WHERE jzcbm  in ('340722108215')

--本年村道代码为C001340604001与上年村道代码为C001340604001的图形发生变更
use [HRP-DBMS2014]
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,8,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0124.xls',sheet3$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL and RTRIM(K001.K0101)<> 'Y028341504'
order by k3912

use [HRP-DBMS2014]
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='10',HK3912='未变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,8,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0124.xls',sheet4$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL
order by k3912


use NCGL342023
SELECT JZCBm,xls.Z,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
left join (
SELECT a,SUBSTRING(a,9,12) Z
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0124.xls',sheet5$)
)xls on JZCBm=xls.Z
WHERE XLS.Z IS NOT NULL and jzcbm not in ('341225121201','341225121205','341225121208')


use NCGL342023
SELECT JZCBm,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
WHERE  jzcbm in (

'341124101209','340521109208','341002103211','341225121201','341225121205','341225121208')


SELECT ZRCZDM,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='21'
from T_ZRC
WHERE ZRCZDM in (

'341124101209011','340521109208001','340521109208003','340521109208005','340521109208007','341002103211003','341002103211004','341002103211006','341002103211007','341002103211008','341002103211010','341002103211003','341002103211004','341002103211006','341002103211007','341002103211008','341002103211010','341225118200008','341225118200009','341225118200010','341225118200011','341225118200012','341225206200011','341225206200013','341225206201011','341225121205007','341225121201001','341225121205003','341225121208007','341504200200019','341504200200020','341524112213025','341225200201001','341225200201013','341225200201019','341225200201022','341504104231010','341504104231013','341504104231017'
)

SELECT ZRCZDM,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='21'
from T_ZRC
WHERE ZRCZDM in (

'340621105215006','340621105207019','340621105215004')


SELECT ZRCZDM,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='10'
from T_ZRC
WHERE ZRCZDM in (
'341504200200019','341504200200020','341225121205007','341002103211003','341002103211004',',341002103211006','340521109208001','340521109208003','340521109208005','340521109208007')

use NCGL342023
SELECT ZRCZDM,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='21'
from T_ZRC
WHERE ZRCZDM in (
'340422201206019','340706102215010','340706103203017', '340706103222002', '340706105213003','340706201223002', '340722114204101','340722114204102','340722114204103','340722114204104','340722114204105','341122102200004', '341124100200008','341503104201007','341503203205004','341602100233010','341602105207010','341602111220019', '341602115219004')

SELECT ZRCZDM,BGYY_XC
--UPDATE T_ZRC SET BGYY_XC='10'
from T_ZRC
WHERE ZRCZDM in (
'341002103211006')

use NCGL342023
SELECT JZCBm,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
WHERE  jzcbm in (
'341002103211','341124101209','341225121205','341225121208')


------------------0125
use NCGL342023
SELECT JZCBm,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='21'
from T_JZC 
WHERE  jzcbm in (
'341225118200')



use NCGL342023
SELECT JZCBm,BGYY_XC
--UPDATE T_JZC SET BGYY_XC='10'
from T_JZC 
where JZCBm in
('340722106200','340722106207','340722108215','340722109210','340722110212','340722110215','340722111202','340722112220','340722113208','340722113209','340722113214','340722115205','340722116201','340722116208','340722116215','340722116217','340722118231','340722118234','340722119203','340722120203','340722120207','340722120234')