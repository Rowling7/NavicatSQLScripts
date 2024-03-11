
SELECT a,SUBSTRING(a,charindex('自然村（组）代码=',a)+10,15),
SUBSTRING(a,charindex('名称=',a)+4,charindex('通达现状=',a)-charindex('名称=',a)-6),
SUBSTRING(a,charindex('优选通达路线代码=',a)+10,10)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet3$)


SELECT SUBSTRING(a,charindex('路段代码=',a)+6,10) a,z
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet4$)


SELECT k0101,k5404,b.a,b.z
--update k001 set k5404=b.z
from k001 
left join (
SELECT SUBSTRING(a,charindex('路段代码=',a)+6,10) a,z
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet4$)
) b on rtrim(k0101)=a 
where left(k0101,1)='w' and b.z is not null
ORDER BY b.z
  
 
SELECT K0101,k5404,K4002,HK5104
--update k001 set k5404=3.5,K4002=4
from k001 
WHERE RTRIM(K0101)IN 
('WC99340822','W691340881','W696340881','W699340881','W882340881','W633340881','WD02340822','W019340811','W862340881','W663340881','W651340881','W033340811','W690340881','W529340881','W635340881','W881340881','W826340881','WD02340822','W688340881','W878340881','W644340881','WC99340822','W689340881','W880340881')


SELECT V5701,V8104,V8105,H,L,K
--update V53 set V8104=L,V8105=k
from V53 
left join (
SELECT H,I,J,K,L
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet1$)
WHERE H IS NOT NULL
) b on V5701=H 
where B.H is not null



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



/*
SELECT RTRIM(K0101)+RTRIM(K0115),K5104,HK5104,K0304,HK0304,xls.z
from  luduan 
left join (
SELECT SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet12$)
) xls on RTRIM(K0101)+RTRIM(K0115)=xls.z
WHERE XLS.Z IS NOT NULL
*/



SELECT a, SUBSTRING(a,charindex('路段代码=',a)+6,10) XLSa,b
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104804'

SELECT a, SUBSTRING(a,charindex('路段代码=',a)+6,10) XLSa,b 
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104784'


--48
SELECT a0102,ha0102,rtrim(k0101)+rtrim(k0115) k0101,k0108,k0109,k0114,'2023年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123
from K001
where rtrim(k0101)+rtrim(k0115) in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,13)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104784')
UNION
SELECT a0102,ha0102,rtrim(k0101)+rtrim(k0115) k0101,k0108,k0109,k0114,'---2022年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123
from LUDUAN
where rtrim(k0101)+rtrim(k0115) in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,13)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104784')
ORDER BY k0101 desc,a desc ,k0108 asc





SELECT a0102,ha0102,rtrim(k0101)+rtrim(k0115) k0101,k0108,k0109,k0114,'2023年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123
--update k001 set k3912='14',hk3912='往年建成本年统计',K1302=NULL,K1303=NULL,K1304=NULL
--update k001 set k3912='21',hk3912='指标变更或地理位置变更',K1302=NULL,K1303=NULL,K1304=NULL

from K001
where rtrim(k0101)+rtrim(k0115) in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,13)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104784') AND K0123 =2
ORDER BY k0101 desc,a desc ,k0108 asc







/*


SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'2023年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123
from k001  
where k1302 in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,10)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104804')
 or rtrim(k0101)+rtrim(k0115) in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,13)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104804')
union
SELECT a0102,ha0102,rtrim(k0101) k0101,k0108,k0109,k0114,'---2022年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123
from LUDUAN
where rtrim(k0101)+rtrim(k0115) in (SELECT SUBSTRING(a,charindex('路段代码=',a)+6,13)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet13$)
where b='NCGL104804')
ORDER BY k0101 desc,a desc ,k0108 asc



*/



--上年此桩号范围内“是否已实施安防工程”为“1.已实施”时，本年不能为“2.未实施”
--路线编码='Y209341302',起点桩号='4.441',讫点桩号='5.000',是否需要实施安防工程='1',是否已实施安防工程='2',
--路线编码='Y209341302',起点桩号='4.441',讫点桩号='5.000',
--上年路线代码='Y209341302',上年安防起点桩号='4.441',上年安防讫点桩号='5.000',上年是否已实施安防工程='是'1
use [HRP-GHSS2014]
SELECT k0101,xls.Z,N.LXBM,k0108,xls.y,QDZH,
K0801 '23是否需要',SFXYSSAFSS '22是否需要',K0802 '23是否已实',SFYSSAFSS '22是否已实',
k0803,isnull(isnull(ssafgcsj,replace(k0803,'2023','2022')),'20221001'),
A0129
--UPDATE k08 SET K0801='2',hK0801='否',K0802='1',hK0802='已实施',k0803=isnull(isnull(ssafgcsj,replace(k0803,'2023','2022')),'20221001'),k0804='1',hk0804='齐全',k0805='1',hk0805='齐全',k0806='1',hk0806='齐全',k0807='1',hk0807='齐全',k0808='1',hk0808='齐全',k0809='1',hk0809='齐全',k0810='1',hk0810='齐全',k0811='1',hk0811='齐全',k0814='1',hk0814='齐全',k0815='1',hk0815='齐全'
from k08
left join (
SELECT a,SUBSTRING(a,7,10) Z,SUBSTRING(a,charindex(',起点桩号=',a)+7,charindex(',讫点桩号=',a)-26) y
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet3$)
)xls on k0101=xls.z and k0108=xls.y
LEFT JOIN [NCGL342022]..T_NCGLAFSS N ON  N.LXBM=K0101 AND QDZH=K0108
WHERE XLS.Z IS NOT NULL


--年度内新增已实施安防工程，原则上应在上年农村公路安防设施明细表中需要实施但未实施安防工程路段的范围内
--路线编码='X107341226',起点桩号='4.000',讫点桩号='5.000',
--是否需要实施安防工程='2',是否已实施安防工程='1',实施时间='20230901',
--上年是否需要实施安防工程='2',上年是否已实施安防工程='1',上年实施安防工程时间='20010708'
use [HRP-GHSS2014]
SELECT k0101,xls.Z,N.LXBM,k0108,xls.y,QDZH,
K0801 '23是否需要',SFXYSSAFSS '22是否需要',K0802 '23是否已实',SFYSSAFSS '22是否已实',
k0803 '23时间',isnull(isnull(ssafgcsj,replace(k0803,'2023','2022')),'20221001') '22时间',x,
A0129
--UPDATE k08 SET k0803=x
from k08
left join (
SELECT a,SUBSTRING(a,7,10) Z,SUBSTRING(a,charindex(',起点桩号=',a)+7,charindex(',讫点桩号=',a)-26) y,SUBSTRING(a,charindex(',上年实施安防工程时间=',a)+13,8) x
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet4$)
)xls on k0101=xls.z and k0108=xls.y
LEFT JOIN [NCGL342022]..T_NCGLAFSS N ON  N.LXBM=K0101 AND QDZH=K0108
WHERE XLS.Z IS NOT NULL


--年度需要实施但未实施安防工程路段，原则上应在上年农村公路安防设施明细表中需要实施但未实施安防工程路段的范围内
--路线编码='X303341522',起点桩号='29.000',讫点桩号='29.858',是否需要实施安防工程='1',是否已实施安防工程='2',实施时间='',
--上年是否需要实施安防工程='2',上年是否已实施安防工程='1',上年实施安防工程时间='20000909'
use [HRP-GHSS2014]
SELECT 
k.k0101,Lk.k0101,xls.Z,N.LXBM,
k.k0108,Lk.k0108,xls.y,QDZH,
k.K0801 '23是否需要',lk.K0801 'L22是否需要',SFXYSSAFSS 'N22是否需要',
k.K0802 '23是否已实',Lk.K0802 'L22是否已实',SFYSSAFSS  'N22是否已实',
k.k0803 '23时间',Lk.k0803 'l22时间',isnull(isnull(ssafgcsj,replace(k.k0803,'2023','2022')),'20221001') 'N22时间',x,
K.A0129
--UPDATE k08 SET K0801='2',hK0801='否',K0802='1',hK0802='已实施',k0803=isnull(isnull(x,replace(K.k0803,'2023','2022')),'20221001'),k0804='1',hk0804='齐全',k0805='1',hk0805='齐全',k0806='1',hk0806='齐全',k0807='1',hk0807='齐全',k0808='1',hk0808='齐全',k0809='1',hk0809='齐全',k0810='1',hk0810='齐全',k0811='1',hk0811='齐全',k0814='1',hk0814='齐全',k0815='1',hk0815='齐全'
from k08 k
left join (
SELECT a,SUBSTRING(a,7,10) Z,SUBSTRING(a,charindex(',起点桩号=',a)+7,charindex(',讫点桩号=',a)-26) y,SUBSTRING(a,charindex(',上年实施安防工程时间=',a)+13,8) x ,SUBSTRING(a,charindex(',上年是否需要实施安防工程=',a)+15,1) U ,SUBSTRING(a,charindex(',上年是否已实施安防工程=',a)+14,1) V
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet5$)
)xls on k.k0101=xls.z and k.k0108=xls.y
left join [HRP-GHSS2014-2022年报]..k08 lk on k.k0101=lk.k0101 and k.k0108= lk.k0108
LEFT JOIN [NCGL342022]..T_NCGLAFSS N ON  N.LXBM=k.K0101 AND QDZH=k.K0108
WHERE XLS.Z IS NOT NULL





use [HRP-GHSS2014]
SELECT a,SUBSTRING(a,7,10) Z,SUBSTRING(a,charindex(',起点桩号=',a)+7,charindex(',讫点桩号=',a)-26) y,SUBSTRING(a,charindex(',上年实施安防工程时间=',a)+13,8) x 
INTO #TAFSS
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet5$)
--UPDATE k08 SET K0801='2',hK0801='否',K0802='1',hK0802='已实施',k0803=isnull(isnull(X,replace(K.k0803,'2023','2022')),'20221001'),k0804='1',hk0804='齐全',k0805='1',hk0805='齐全',k0806='1',hk0806='齐全',k0807='1',hk0807='齐全',k0808='1',hk0808='齐全',k0809='1',hk0809='齐全',k0810='1',hk0810='齐全',k0811='1',hk0811='齐全',k0814='1',hk0814='齐全',k0815='1',hk0815='齐全'
from k08 k
left join (
SELECT A,Z,Y,X FROM #TAFSS
)xls on k.k0101=xls.z and k.k0108=xls.y
WHERE XLS.Z IS NOT NULL