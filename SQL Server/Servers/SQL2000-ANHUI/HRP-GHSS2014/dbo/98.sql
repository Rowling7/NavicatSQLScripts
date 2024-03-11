

-------------x
--285.476 六安 
--135.550 广德
--121.089 芜湖
--105.886 阜阳
SELECT left(a0102,5),sum(isnull(a0314a,0)) a
from a11 
where A11.A3219 =   '2' and A11.A0203 =   'X' and SUBSTRING(A11.A0101,1,4) =   '2023'
group by left(a0102,5) with rollup
order by a asc

------------c
--521.829 芜湖
--241.732 六安
--225.354 安庆
--164.579 滁州
--156.222 合肥
--137.095 马鞍山
SELECT left(a0102,5),sum(isnull(a0314a,0)) a
from a11 
where A11.A3219 =   '2' and A11.A0203 =   'c' and SUBSTRING(A11.A0101,1,4) =   '2023'
group by left(a0102,5) with rollup
order by a asc