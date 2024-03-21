SELECT a5082
--update K03 set a5082='1',ha5082='5210' 
from k03
where k0304 in ('11','22') and a5082 in ('2');
/*
--2、高速一级路且沥青路面，5210,0.35*PCI+0.3*RQI+35=PQI ,反推RQI

select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011) 差值,
cast((a5011-35-0.35*isnull(a5011a,0))/0.3 as numeric(5,2))
from K03 where k0304 in('10','11') and k5104 in ('11','21','22','23') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
order by a0102,k0101,k0108

--先处理a5011b大于0
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011) 差值,
cast((a5011-35-0.35*isnull(a5011a,0))/0.3 as numeric(5,2))
--update K03 set a5011b=cast((a5011-35-0.35*isnull(a5011a,0))/0.3 as numeric(5,2))
from K03
where k0304 in('10','11') and k5104 in ('11','21','22','23') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and (a5011-35-0.35*isnull(a5011a,0))/0.3>0
order by a0102,k0101,k0108

--再处理a5011b小于0
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011) 差值,
cast((a5011-35-0.35*isnull(a5011a,0))/0.3 as numeric(5,2))
--update K03 set a5011b=0  --先a5011b赋值0
from K03 
where k0304 in('10','11') and k5104 in ('11','21','22','23') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and (a5011-35-0.35*isnull(a5011a,0))/0.3<0
order by a0102,k0101,k0108

--再处理a5011a
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011) 差值,
cast((a5011-35-0.3*isnull(a5011b,0))/0.35 as numeric(5,2))
--update K03 set a5011a=cast((a5011-35-0.3*isnull(a5011b,0))/0.35 as numeric(5,2))
from K03 
where k0304 in('10','11') and k5104 in ('11','21','22','23') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.35+isnull(a5011b,0)*0.3+35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and (a5011-35-0.35*isnull(a5011a,0))/0.3<0
order by a0102,k0101,k0108


--3、高速一级路且水泥路面，5210,0.5*PCI+0.3*RQI+20=PQI ,反推RQI
--190
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011) 差值,
cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))
from K03 where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
order by a0102,k0101,k0108

--先处理大于0，小于100
--190
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011) 差值,
cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))
--update K03 set a5011b=cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))
from K03 
where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))>0 and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))<=100
order by a0102,k0101,k0108

--再处理小于0
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011) 差值,
cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))
--update K03 set a5011b=0
from K03 where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))<0
order by a0102,k0101,k0108

--再处理a5011a
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011) 差值,
cast((a5011-20-0.3*isnull(a5011b,0))/0.5 as numeric(5,2))
--update K03 set a5011a=cast((a5011-20-0.3*isnull(a5011b,0))/0.5 as numeric(5,2))
from K03 
where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))<0
order by a0102,k0101,k0108


--再处理大于100的，a5011b赋值100，也要改a5011a
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011) 差值,
cast((a5011-20-0.3*isnull(a5011b,0))/0.5 as numeric(5,2))
from K03 where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))>100
order by a0102,k0101,k0108


--update K03 set a5011b=100
where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))>100


--update K03 set a5011a=cast((a5011-20-0.3*isnull(a5011b,0))/0.5 as numeric(5,2))
where k0304 in('10','11') and k5104 in ('12') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.5+isnull(a5011b,0)*0.3+20 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-20-0.5*isnull(a5011a,0))/0.3 as numeric(5,2))>100


--4、二三四级路，5210,0.6*PCI+0.4*RQI=PQI ,反推RQI
--31421
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))
from K03 where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
order by a0102,k0101,k0108


--处理大于0小于100
--29795
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))
from K03 where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>0 and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<=100
order by a0102,k0101,k0108

--29795
update K03 set a5011b=cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))
where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>0 and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<=100


--处理小于0
--4
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2)),cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
from K03 where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<0
order by a0102,k0101,k0108


--a5011b赋值0
update K03 set a5011b=0
where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<0


--a5011a赋值
update K03 set a5011a=cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<0


--处理大于100
--1622
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2)),cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
from K03 where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100
order by a0102,k0101,k0108


--a5011b赋值100
update K03 set a5011b=100
where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100


--a5011a赋值
--1617
update K03 set a5011a=cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
where k0304 in('22','23','24') and a5082='1'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
--and k0101 = 'C113421003'
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100


--5、三级路且沥青，指南，0.6*PCI+0.4*RQI=PQI
--8050
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2)),cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
order by a0102,k0101,k0108


--处理大于0小于100
--6025
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2)),cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>0 and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<=100
order by a0102,k0101,k0108


--8025
update K03 set a5011b=cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))
where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>0 and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))<=100


--处理大于100
--21
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011) 差值,
cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2)),cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100 
order by a0102,k0101,k0108


--先赋值a5011b=100
update K03 set a5011b=100
 where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100 


--再赋值a5011a
update K03 set a5011a=cast((a5011-0.4*isnull(a5011b,0))/0.6 as numeric(5,2))
 where k0304 in('23') and k5104 in ('11','21','22','23') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.6+isnull(a5011b,0)*0.4 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.6*isnull(a5011a,0))/0.4 as numeric(5,2))>100 


--------------------------------------------------------------修改为>=0.01
--6、四级路，等外路且沥青或水泥，三级及以下并且砂石，指南，PCI=PQI
--7169/4735
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,a5011,a5011a,a5011b,a5082,abs(a5011a-a5011) 差值
from K03 
where ((k0304 in('24','30') and k5104 in ('11','12','21','22','23')) or (k0304 in('23','24','30') and k5104 in ('31')))
and a5082='2'
and abs(a5011a-a5011)>=0.01
and (a5010<>0 or a5011<>0)
order by a0102,k0101,k0108

--7169/4735
update K03 set a5011a=a5011
where ((k0304 in('24','30') and k5104 in ('11','12','21','22','23')) or (k0304 in('23','24','30') and k5104 in ('31')))
and a5082='2'
and abs(a5011a-a5011)>=0.01
and (a5010<>0 or a5011<>0)


--7、三级路且水泥，指南，0.65*PCI+0.35*RQI=PQI
--7448/445
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011) 差值,
cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2)),cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
order by a0102,k0101,k0108


--处理大于0小于100
--7350/418
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011) 差值,
cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2)),cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))>0 and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))<=100
order by a0102,k0101,k0108


--7350/418
update K03 set a5011b=cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))
where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))>0 and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))<=100


--处理小于0
--34
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011) 差值,
cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2)),cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))<0
order by a0102,k0101,k0108


--赋值a5011b=0
--34
update K03 set a5011b=0
where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))<0


--赋值a5011a
--34
update K03 set a5011a=cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))<0


--处理大于100
--64/27
select k0101,k0108,ha5009,k0304,hk0304,left(hk5104,2) hk5104,a5010,cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2)) 计算pqi,a5011,a5011a,a5011b,a5082,abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011) 差值,
cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2)),cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
from K03 where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))>100
order by a0102,k0101,k0108


--赋值a5011b=100
--64/27
update K03 set a5011b=100
where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))>100


--赋值a5011a
--64/27
update K03 set a5011a=cast((a5011-0.35*isnull(a5011b,0))/0.65 as numeric(5,2))
where k0304 in('23') and k5104 in ('12') and a5082='2'
and abs(cast(isnull(a5011a,0)*0.65+isnull(a5011b,0)*0.35 as numeric(5,2))-a5011)>0.01
and (a5010<>0 or a5011<>0)
and cast((a5011-0.65*isnull(a5011a,0))/0.35 as numeric(5,2))>100
*/