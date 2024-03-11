SELECT  A.A0102,A.HA0102,RTRIM(A.K0101)
FROM A50 A
--LEFT JOIN  K001 K ON A.A0102 =K.A0102 AND RTRIM(A.K0101)=RTRIM(K.K0101)
--WHERE isnull(K.k0123,'2')='2' and K.k0124 is null AND LEFT(A.K0101,1)IN ('G','S')
GROUP BY A.A0102,A.HA0102,RTRIM(A.K0101)
ORDER BY A.A0102


SELECT  A.A0102,A.HA0102,RTRIM(A.K0101)
FROM A50 A
WHERE LEFT(A.K0101,1)IN ('G','S')


SELECT  A.A0102,A.HA0102,RTRIM(A.K0101),SUM(K.K0114)
FROM A50 A
LEFT JOIN  K001 K ON A.A0102 =K.A0102 AND RTRIM(A.K0101)=RTRIM(K.K0101)
WHERE isnull(K.k0123,'2')='2' and K.k0124 is null AND LEFT(A.K0101,1)IN ('G','S')
GROUP BY A.A0102,A.HA0102,RTRIM(A.K0101)
ORDER BY A.A0102

--更新A50 ha0102
/*
update a
set a.ha0102=objjc
--SELECT a0102,objname ,ha0102,objjc
from a50 a
left join da0102 on a.a0102=objname 
*/

SELECT objname ,objjc
from da0102
left join  a50 on a0102=objname


SELECT distinct a50.a0102
from a50
left join k001 on a50.k0101 =k001.k0101



SELECT * from da0102 
where objname not in (SELECT distinct a50.a0102
from a50
left join k001 on a50.k0101 =k001.k0101) and objname like '42a%'
