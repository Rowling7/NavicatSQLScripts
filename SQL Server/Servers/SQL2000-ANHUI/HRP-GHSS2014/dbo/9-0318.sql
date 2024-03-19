
--2023年全省农村公路评定里程为209830.664公里，其中县道32860.939公里，乡道44780.357公里，村道132189.368公里。
--all 210180.872  -350.208
--x 32909.036  		-48.097
--c 132370.216		-180.848
--y 44901.620			-121.263
SELECT sum(i/1000) 
from tk03 
where CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%市政道路%' and
			--CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%五类桥梁%' and
			--f like '%上行%' and
			--left(a,1) ='c' and 
			q is not null

			
SELECT sum(a5008/1000) 
from k03 
where CAST(ISNULL(a0129,'') AS VARCHAR(100)) not LIKE '%市政道路%' and
			--CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%五类桥梁%' and
			--ha5009 like '%上行%' and
			left(k0101,1) ='c'

SELECT distinct r 
from tk03

SELECT * from tk03 where b like '340421%' and left(a,1) ='y' and q is not null
SELECT * from k03 where a0103 like '340421%' and left(k0101,1) ='y'

SELECT b,left(a,1),sum(i/1000)
from tk03 
where CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%市政道路%' and q is not null
group by b,left(a,1)
order by b,left(a,1)







--2023年全省农村公路评定里程为209830.664公里，其中县道32860.939公里，乡道44780.357公里，村道132189.368公里。

SELECT Left(a,1),sum(i/1000)
from tk03 
where CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%市政道路%' and q is not null
group by left(a,1)
order by left(a,1)

--2023年全省农村公路评定里程为209830.664公里，其中县道32860.939公里，乡道44780.357公里，村道132189.368公里。
	select
		LEFT(K0101,1) DD,		
		nullif(sum(isnull(a5008,0)/1000),0)
		from k03 a
	where CAST(ISNULL(A0129,'') AS VARCHAR(100)) not LIKE '%市政道路%' AND a5082 is not null 
	GROUP BY LEFT(K0101,1)


SELECT DISTINCT CAST(ISNULL(A0129,'') AS VARCHAR(100)) FROM K03

