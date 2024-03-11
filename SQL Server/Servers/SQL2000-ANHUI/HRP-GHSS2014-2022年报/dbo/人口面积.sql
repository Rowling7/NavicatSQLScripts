--面积
SELECT left(a0103,4),sum(isnull(a0104,0)) a0104
from a21 
where a0101 like '2023%'
GROUP BY left(a0103,4)with rollup


--renkou 
SELECT left(a0103,4),sum(isnull(a0105,0)) a0105
from a21 
where a0101 like '2023%'
GROUP BY left(a0103,4) with rollup



--面积
SELECT left(a0103,4),sum(isnull(a0104,0)) a0104
from a21 
where a0101 like '2022%'
GROUP BY left(a0103,4)with rollup


--renkou 
SELECT left(a0103,4),sum(isnull(a0105,0)) a0105
from a21 
where a0101 like '2022%'
GROUP BY left(a0103,4) with rollup