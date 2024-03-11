SELECT count(*)
from  k060 
where  left(k0101,1) in ('g','h','s','t')


--6947
SELECT count(*)
from  k060 
where a0102  like '341%'  and left(k0101,1) in ('g','h','s','t')

--SELECT 1261+4133+1577


----g
--2527---1283+1069 1245+1282
--2329+176+22
SELECT LEFT(A0102,5),count(*)
from  k060 
where a0102  like '341%'  and left(k0101,1) in ('g','h')
GROUP BY LEFT(A0102,5) WITH ROLLUP
ORDER  BY LEFT(A0102,5)
----s
--4420  --287+4133
SELECT count(*)
from  k060 
where a0102  like '341%'  and left(k0101,1) in ('s','t')





SELECt rtrim(k0101) k0101, k6117,rtrim(hk6117) hk6117 
from  k060
where rtrim(hk6117)<>case when left(rtrim(k0101),1)='g' then '上行'else '下行' end 
and k6117  in('1','2') and left (k0101,1) in('g','h')

SELECt rtrim(k0101) k0101, k6117,rtrim(hk6117) hk6117 
--update k060 set k6117='1', hk6117='上行'
from k060 
where k6117  in('2') and left (k0101,1) in('g')

SELECt rtrim(k0101) k0101, k6117,rtrim(hk6117) hk6117 
--update k060 set k6117='2', hk6117='下行'
from k060 
where k6117  in('1') and left (k0101,1) in('h')



(A.A0102 like'34103%'or A.A0102 like'34104%'or A.A0102 like'34107%'or A.A0102 like'34108%' or A.A0102 like'34110%' or A.A0102 like'34111%' or A.A0102 like'34112%'or A.A0102 like'34117%'or A.A0102 like'34121%')