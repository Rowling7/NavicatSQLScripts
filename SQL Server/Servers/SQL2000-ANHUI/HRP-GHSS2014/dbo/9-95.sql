SELECT a0101,b.objjc,a.a0103,a0104 
from a21 a
left join ahdsh b on a.a0103=b.a0103
where  a0101 IN('2021','2022','2023')and a0104 is not null and b.objjc is not null
order by b.px,a0101



SELECT a0101,a0102,a.a0103,a0104 
from a21 a
where  a0101 ='2023' and a0102<'342'

SELECT a0101,a0102,a.a0103,a0104 
from a21 a
where  a0101 ='2022'and a0102<'342' and a0104 is not null  and len(a0102)=5

