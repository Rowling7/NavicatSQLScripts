select
[管理单位名称]=rtrim(a.HA0102), 
[路线代码]=rtrim(a.K0101), 
[路线简称]=rtrim(a.K0112), 
[渡口代码]=(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'D'+rtrim(a.K6501)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'D'+rtrim(a.K6501)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'D'+rtrim(a.K6501)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'D'+rtrim(a.K6501)
			else null end), 
[渡口名称]=rtrim(a.K6502), 
a.K6503,
b.k0108,b.k0109,
[路段K001表中备注]=b.k0199
from K065 a left join K001 b
on a.a0102=b.a0102 and a.k0101=b.k0101 and
 a.K6503>=K0108 and a.K6503<K0109 
where ( b.a0102 is null or (b.a0102 is not null and left(a.k0101,1) in ('X','J','Y','Z','C') and a.K6503<>b.K0108) )
and  a.A0102 like '#A0102#%' and a.A0102 like '#GLDW#%'