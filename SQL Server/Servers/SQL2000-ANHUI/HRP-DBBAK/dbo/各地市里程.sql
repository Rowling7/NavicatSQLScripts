USE [HRP-GHSS2014-2022年报]
SELECT
LEFT(K01.A0103,4),A.OBJJC,
sum( isnull(K01.k0114,'') ) '总里程'
FROM K01 
LEFT JOIN 
(
select --查询市州
STUFF(rtrim(objname),3,1,null) A0103 ,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%'  
)A ON LEFT(K01.A0103,4)=A.A0103
WHERE isnull(K01.k0123,'2')='2' and nullif(K01.k0124,'') is null
AND LEFT(K01.K0101,1)IN ('G','S','X','Y','C','Z')--AND RTRIM(K0304)='10'
GROUP BY LEFT(K01.A0103,4),A.OBJJC with rollup
HAVING OBJJC IS NOT NULL
ORDER BY LEFT(K01.A0103,4)



select --查询市州
STUFF(rtrim(objname),3,1,null) ,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' 
order by STUFF(rtrim(objname),3,1,null) --综合排序