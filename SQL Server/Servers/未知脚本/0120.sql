select k6122,rtrim(hk6122),count(*),sum(k6008) 
from k060 
where left(k0101,1)in('X','Y','C') 
and k6028 in('4','5') 
and left(a1305,4) in('2021','2022','2023')
group by k6122,hk6122


select k6122,rtrim(hk6122),count(*),sum(k6008) 
from k060 
where left(k0101,1)in('X','Y','C') 
and k6028 in('4','5') 
--and left(a1305,4) in('2021','2022','2023')
group by k6122,hk6122