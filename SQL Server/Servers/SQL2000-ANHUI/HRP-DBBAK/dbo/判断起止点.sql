---------------------------------上年止点桩号小于等于起点桩号的
select k1302,k1303,k1304,a0102,ha0102,k0101,k0108,k0109,k0112,k0114
from k001
WHERE left(K0101,1) in ('X','Y','Z','C')
	and rtrim(K1302) is not null and left(K1302,1) in ('X','Y','Z','C')
	and isnull(k1304,0)<=isnull(k1303,0)


--起点不在上年路段桩号范围内
select
'K001'+'&A0102 ='''+rtrim(cast(a.A0102 as varchar))+''' and K0101='''+rtrim(cast(a.K0101 as varchar))+''' and K0108 ='+rtrim(cast(a.K0108 as varchar))  as 编辑,
a.A0102,a.HA0102,rtrim(a.K0101) K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304,a.k0199
from K001 a left join luduan b 
	on rtrim(a.k1302) is not null and rtrim(a.k1302)=rtrim(b.k0101) and a.k1303>=b.k0108 and a.k1303<b.k0109
where  left(a.K0101,1) in ('X','Y','Z','C') and left(a.K1302,1) in ('X','Y','Z','C')
	and rtrim(a.K1302) is not null and b.a0102 is null

---------------------------------
--止点不在上年路段桩号范围内 30
select

a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304,a.k0199,b.k0101,b.k0108,b.k0109
from K001 a left join luduan b 
	on rtrim(a.k1302) is not null and rtrim(a.k1302)=rtrim(b.k0101) and a.k1304>b.k0108 and a.k1304<=b.k0109
where  left(a.K0101,1) in ('X','Y','Z','C') and left(a.K1302,1) in ('X','Y','Z','C')
	and rtrim(a.K1302) is not null and b.a0102 is null
