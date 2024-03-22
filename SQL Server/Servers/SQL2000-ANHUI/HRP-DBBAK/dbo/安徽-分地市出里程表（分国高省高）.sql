SELECT  
ahdsh.a0103,
OBJJC,px,
sum(isnull(k0114,0)),
SUM(CASE WHEN  left(k0101,1)in('G') THEN isnull(k0114,0) ELSE 0 END ) 'G',
SUM(CASE WHEN  left(k0101,1)in('G')AND K0304='10' THEN isnull(k0114,0) ELSE 0 END ) 'GA',
SUM(CASE WHEN  left(k0101,1)in('S') THEN isnull(k0114,0) ELSE 0 END ) 'S',
SUM(CASE WHEN  left(k0101,1)in('S')AND K0304='10' THEN isnull(k0114,0) ELSE 0 END )'SA',
SUM(CASE WHEN  left(k0101,1)in('X') THEN isnull(k0114,0) ELSE 0 END ) 'X',
SUM(CASE WHEN  left(k0101,1)in('Y') THEN isnull(k0114,0) ELSE 0 END ) 'Y',
SUM(CASE WHEN  left(k0101,1)in('Z') THEN isnull(k0114,0) ELSE 0 END ) 'Z',
SUM(CASE WHEN  left(k0101,1)in('C') THEN isnull(k0114,0) ELSE 0 END ) 'C'
from k01
LEFT JOIN AHDSH ON LEFT(replace(replace(LEFT(k01.A0103,6),'340826','3421'),'341882','3422'),4)=ahdsh.xzqh
where isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1)in('G','S','X','Y','C','Z')
--AND (LEFT(A0103,6) LIKE '340826%' OR LEFT(A0103,6) LIKE '341882%')
GROUP BY ahdsh.a0103,OBJJC,px with rollup
HAVING GROUPING(ahdsh.a0103)=GROUPING(OBJJC)and GROUPING(OBJJC)=GROUPING(px)
ORDER BY px





select ahdsh.a0103,
OBJJC,px,sum(isnull(k0114,0)) 合计,
[等级公路小计]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304 in ('10','11','22','23','24')  THEN K0114 ELSE 0 END),
[高速]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='10'  THEN K0114 ELSE 0 END),
[一级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='11'  THEN K0114 ELSE 0 END),
[二级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='22'  THEN K0114 ELSE 0 END),
[三级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='23'  THEN K0114 ELSE 0 END),
[四级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='24'  THEN K0114 ELSE 0 END),
[等外]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='30'  THEN K0114 ELSE 0 END),
[晴雨通车]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A0320 ELSE 0 END),
[可绿化]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A3101 ELSE 0 END),
[已绿化]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A3102 ELSE 0 END),
[养护里程]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A1001 ELSE 0 END)
from k01
LEFT JOIN AHDSH ON LEFT(replace(replace(LEFT(k01.A0103,6),'340826','3421'),'341882','3422'),4)=ahdsh.xzqh
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and A0102 like '34%'
GROUP BY ahdsh.a0103,OBJJC,px with rollup
HAVING GROUPING(ahdsh.a0103)=GROUPING(OBJJC)and GROUPING(OBJJC)=GROUPING(px)
ORDER BY px



select ahdsh.a0103,
OBJJC,px,sum(isnull(k0114,0)) 合计,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='1' then isnull(K0114,0) else 0 end) as 有铺装,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,2)='12' then isnull(K0114,0) else 0 end) as 水泥混凝土,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='2' then isnull(K0114,0) else 0 end) as 简易铺装,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='3' then isnull(K0114,0) else 0 end) as 未铺装 
from k01
LEFT JOIN AHDSH ON LEFT(replace(replace(LEFT(k01.A0103,6),'340826','3421'),'341882','3422'),4)=ahdsh.xzqh
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and A0102 like '34%'
GROUP BY ahdsh.a0103,OBJJC,px with rollup
HAVING GROUPING(ahdsh.a0103)=GROUPING(OBJJC)and GROUPING(OBJJC)=GROUPING(px)
ORDER BY px






