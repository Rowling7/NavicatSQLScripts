SELECT left(A0102,5),SUM(ISNULL(K0114,0)) 
FROM K001 
WHERE k0180='2023' and left(k0101,1) in ('x','y','c')
and k5104='12'
group by left(A0102,5) with rollup
order by left(A0102,5)

select --查询市州
STUFF(rtrim(objname),3,1,null) ,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' 
order by objjc --综合排序

use  [HRP-GHSS2014]
SELECT sum(isnull(k0109,0)-isnull(k0108,0))
from k08 
where k0803 like '2023%'


--今年不通，去年通
use [HRP-DBMS2014]
SELECT a.v0513 ,b.v0513
from v52 a
inner join [HRP-DBMS2014-2022年报]..v52 b on a.v0514= b.v0514 
where a.v0513='2' and b.v0513 ='1'


--去年不通，今年通
use [HRP-DBMS2014]
SELECT a.v0513 ,b.v0513
from v52 a
inner join [HRP-DBMS2014-2022年报]..v52 b on a.v0514= b.v0514 
where a.v0513='1' and b.v0513 ='2'


USE [HRP-DBMS2014-2021年报]
SELECT  left(a1305,4),count(*),sum(isnull(k6008,0))
from k060 
where left(k0101,1)in('X','Y','C') and k6028 in ('4','5')
group by left(a1305,4)
--977

USE [HRP-DBMS2014-2022年报]
SELECT  left(a1305,4),count(*),sum(isnull(k6008,0))
from k060 
where left(k0101,1)in('X','Y','C') and k6028 in ('4','5')
group by left(a1305,4)
--888

USE [HRP-DBMS2014]
SELECT  left(a1305,4),count(*),sum(isnull(k6008,0))
from k060 
where left(k0101,1)in('X','Y','C') and k6028 in ('4','5')
group by left(a1305,4)





SELECT  left(a1305,4),k6122,count(*),sum(isnull(k6008,0))
from k060 
where left(k0101,1)in('X','Y','C') and k6028 in ('4','5') --AND left(a1305,4)='2023'
group by left(a1305,4),k6122 WITH ROLLUP
order by left(a1305,4),k6122
--714











use  [HRP-DBMS2014-2021年报]
select k6122,rtrim(hk6122),count(*),sum(k6008) 
from k060 where left(k0101,1)in('X','Y','C') and k6028 in('4','5') 
--and left(a1305,4) in('2021','2022','2023')
group by k6122,hk6122

