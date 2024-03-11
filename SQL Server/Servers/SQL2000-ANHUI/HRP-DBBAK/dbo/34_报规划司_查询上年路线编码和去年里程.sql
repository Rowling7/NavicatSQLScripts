--查询上年路线编码和去年里程
DECLARE @k0101 varchar(200)
set @k0101='Y142341302'--X018340212 X22734021
SELECT a0102,ha0102,rtrim(k0101) k0101,RTRIM(K0115) K0115,k0108,k0109,k0114,'2023年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123,k5404,k0404
from k001  
where k1302 like @k0101+'%' or k0101 like @k0101+'%'
union
SELECT a0102,ha0102,rtrim(k0101) k0101,RTRIM(K0115) K0115,k0108,k0109,k0114,'---2022年' a,k1302 '上年路线编码',k1303'上年起点桩号',k1304'上年止点桩号',k0180,k3912,Hk3912,HK5104,HK0304,k0123,k5404,k0404
from [HRP-DBMS2014-2022年报]..k001
--from LUDUAN
where k0101 like @k0101+'%'

/*union
SELECT ''a0102,''ha0102,rtrim(k0101) k0101,k0108,k0109,k0109-k0108 k0114,'##tk001' a,'' '上年路线编码',k0108 '上年起点桩号',k0109 '上年止点桩号',''k0180,''k3912,''Hk3912
from ##tk001  
where k0101 like @k0101+'%' --or k0101 like @k0101+'%'
*/
ORDER BY a desc ,k0108 asc


/*
SELECT  K0180,COUNT(*)
FROM K001 
WHERE left(K0101,1) in ('X','Y','Z','C') AND K0180 IS NULL
GROUP BY K0180
*/


