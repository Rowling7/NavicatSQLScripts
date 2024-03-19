SELECT  
LEFT(A0103,4),
OBJJC,
round(sum(isnull(k0114,0)),0),
round(SUM(CASE WHEN  left(k0101,1)in('G') THEN isnull(k0114,0) ELSE 0 END ),0) 'G',
round(SUM(CASE WHEN  left(k0101,1)in('G')AND K0304='10' THEN isnull(k0114,0) ELSE 0 END ),0) 'GA',
round(SUM(CASE WHEN  left(k0101,1)in('S') THEN isnull(k0114,0) ELSE 0 END ),0) 'S',
round(SUM(CASE WHEN  left(k0101,1)in('S')AND K0304='10' THEN isnull(k0114,0) ELSE 0 END ),0)'SA',
round(SUM(CASE WHEN  left(k0101,1)in('X') THEN isnull(k0114,0) ELSE 0 END ),0) 'X',
round(SUM(CASE WHEN  left(k0101,1)in('Y') THEN isnull(k0114,0) ELSE 0 END ),0) 'Y',
round(SUM(CASE WHEN  left(k0101,1)in('Z') THEN isnull(k0114,0) ELSE 0 END ),0) 'Z',
round(SUM(CASE WHEN  left(k0101,1)in('C') THEN isnull(k0114,0) ELSE 0 END ),0) 'C'
from k01
LEFT JOIN AHDSH ON LEFT(A0103,4)=XZQH 
where isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1)in('G','S','X','Y','C','Z')
AND (LEFT(A0103,6)NOT LIKE '340826%' AND LEFT(A0103,6)NOT LIKE '341882%')
GROUP BY LEFT(A0103,4),OBJJC WITH ROLLUP
HAVING GROUPING(LEFT(A0103,4))=GROUPING(OBJJC)
ORDER BY LEFT(A0103,4),OBJJC