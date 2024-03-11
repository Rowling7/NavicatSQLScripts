SELECT XLS.A,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001),
from k060
RIGHT JOIN 
(
SELECT a 
from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0127.xls', sheet1$ ) 
) XLS ON XLS.A= left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)
WHERE 	XLS.A IS NOT NULL



SELECT QLBM ,QLMC,BGYY,JSZKPDDJ,YQLBM,XLS.A,XLS.B
FROM T_QL 
RIGHT JOIN 
(
SELECT a ,B
from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0127.xls', sheet1$ ) 
) XLS ON QLBM=XLS.A

------------354 20在23找不到
USE [HRP-DBMS2014]
SELECT 
left(k.k0101,4)+left(k.a0103,6)+'L'+rtrim(k.k6001) '2023年桥梁代码',RTRIM(k.K6002) '2023年K6002',RTRIM(k.K6028) '2023年K6028',RTRIM(k.HK6028) '2023年HK6028',rtrim(k.k3912) k3912,
l060.ql '2022年桥梁代码',l060.k6002 '2022年桥梁K6002',l060.A 'excel表桥梁代码',l060.B 'excel表桥梁名称'
from k060  k  ---查询2023年的桥梁代码
right join 
(
	SELECT left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) ql,RTRIM(K6002) K6002,RTRIM(K6028) K6028,RTRIM(HK6028) HK6028,XLS.A a,XLS.B b
	FROM QIAOLIANG --QIAOLIANG为桥梁历史表
	RIGHT JOIN 
(
	SELECT a ,B --查询2020年桥梁代码在2023年找不到的桥梁代码
	from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0127.xls', sheet1$ ) 
) XLS ON left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)=XLS.A
) l060 on  l060.ql=left(k.k0101,4)+left(k.a0103,6)+'L'+rtrim(k.k6001)