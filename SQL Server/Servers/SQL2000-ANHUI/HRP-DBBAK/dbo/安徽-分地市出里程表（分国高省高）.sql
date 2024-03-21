SELECT  
replace(replace(LEFT(A0103,4),'3408','3421'),'3418','3422'),
replace(replace(OBJJC,'安庆市','宿松县'),'宣城市','广德市'),
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
LEFT JOIN AHDSH ON LEFT(A0103,4)=XZQH 
where isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1)in('G','S','X','Y','C','Z')
--AND (LEFT(A0103,6) LIKE '340826%' OR LEFT(A0103,6) LIKE '341882%')
GROUP BY replace(replace(LEFT(A0103,4),'3408','3421'),'3418','3422'),replace(replace(OBJJC,'安庆市','宿松县'),'宣城市','广德市') with rollup
HAVING GROUPING(replace(replace(LEFT(A0103,4),'3408','3421'),'3418','3422'))=GROUPING(replace(replace(OBJJC,'安庆市','宿松县'),'宣城市','广德市'))
ORDER BY replace(replace(LEFT(A0103,4),'3408','3421'),'3418','3422'),replace(replace(OBJJC,'安庆市','宿松县'),'宣城市','广德市')

