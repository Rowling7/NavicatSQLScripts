--use [HRP-DBMS2015]

------------------------------------------------------------------
---------------------------------上年路线数据起止点桩号有交叉的

IF OBJECT_ID('TEMPDB..#tempSNLX') IS NOT NULL DROP TABLE #tempSNLX
IF OBJECT_ID('TEMPDB..#tempSNLXB') IS NOT NULL DROP TABLE #tempSNLXB

SELECT
NULL 序号,
A0102,
HA0102,
rtrim(K1302) K1302,
K1303,
K1304,
IDS=0
INTO #tempSNLX
FROM K001
WHERE left(K0101,1) in ('X','Y','Z','C') 
	and rtrim(K1302) is not null and left(K1302,1) in ('X','Y','Z','C')
order by rtrim(K1302),K1303,k1304

DECLARE @X CHAR(7)
DECLARE @M CHAR(20)
DECLARE @N INT
DECLARE @Y CHAR(20)
DECLARE @Z INT

SET @X = 1
SET @M = 1
SET @N = 1 
SET @Y = 1
SET @Z = 0

UPDATE #tempSNLX SET
@N = CASE WHEN rtrim(@M) = rtrim(K1302) THEN @N+1 ELSE 1 END,
@M = rtrim(K1302),
IDS = @N

UPDATE #tempSNLX SET
@Z = CASE WHEN rtrim(@Y)!= rtrim(K1302) THEN @Z+1 ELSE @Z END,
@Y = rtrim(K1302),
序号 = @Z

select T1.Ha0102,T1.K1302,
[上年起点桩号]=T2.K1303,
[上年止点桩号]=T2.K1304,[下一路段的上年起点桩号]=T1.K1303,[下一路段的上年止点桩号]=T1.K1304,[差值]=T2.K1304 - T1.K1303
INTO #tempSNLXB 
FROM #tempSNLX T1
JOIN #tempSNLX T2
ON T1.K1302 = T2.K1302 AND T1.IDS = T2.IDS +1 AND T1.序号=T2.序号 
where T2.K1304 - T1.K1303<>0

DELETE #tempSNLXB WHERE [差值]<>0 AND [差值]<0

--18
SELECT * FROM #tempSNLXB


孝昌县公路管理局                        	Y063420921	.000	.976	.000	.976
潜江市公路管理局                        	CQ72429005	.000	.754	.000	.754
仙桃市公路管理局                        	CF01429004	.000	.302	.000	.302
竹山县公路管理局                        	C031420323	.000	3.255	.000	3.255
阳新县公路管理局                        	X212420222	.000	9.054	.000	9.054
随县公路管理局                          	Y012421321	.000	2.316	.000	2.316
随县公路管理局                          	Y395421321	.000	1.303	.000	1.303
仙桃市公路管理局                        	Y301429004	.000	.165	.000	.165
随县公路管理局                          	Y477421321	.000	1.848	.000	1.848
仙桃市公路管理局                        	Y192429004	.000	.729	.000	.729
仙桃市公路管理局                        	CN74429004	.000	.474	.000	.474
潜江市公路管理局                        	X010429005	.000	.393	.000	.393
仙桃市公路管理局                        	CT85429004	.000	.960	.000	.960
老河口市公路管理局                      	C228420682	.000	1.100	.000	1.100
老河口市公路管理局                      	C163420682	.000	1.851	.000	1.851
仙桃市公路管理局                        	CQ70429004	.000	1.676	.000	1.676
随县公路管理局                          	Y302421321	.000	4.074	.000	4.074
大悟县公路管理局                        	Y057420922	.000	10.331	.000	10.331

--19
select rtrim(a0102),rtrim(k0101),k0108,k0109,rtrim(k0115),b.k1302,b.k1303,b.k1304
FROM #tempSNLXB a left join k001 b on rtrim(a.k1302)=rtrim(b.k1302) and [上年起点桩号]=b.K1303 and [上年止点桩号]=b.K1304
where a0102 is not null
order by a0102,k0101,k0108


---------------------------------上年止点桩号小于等于起点桩号的
--460
select k1302,k1303,k1304,a0102,ha0102,k0101,k0108,k0109,k0112,k0114
from k001
WHERE left(K0101,1) in ('X','Y','Z','C') --and A0102 like '#A0102#%' and A0102 like '#GLDW#%' 
	and rtrim(K1302) is not null and left(K1302,1) in ('X','Y','Z','C')
	and isnull(k1304,0)<=isnull(k1303,0)

--460
update k001 set k1302=nullif(k1302,k1302),k1303=nullif(k1303,k1303),k1304=nullif(k1304,k1304)
from k001
WHERE left(K0101,1) in ('X','Y','Z','C') --and A0102 like '#A0102#%' and A0102 like '#GLDW#%' 
	and rtrim(K1302) is not null and left(K1302,1) in ('X','Y','Z','C')
	and isnull(k1304,0)<=isnull(k1303,0)

---------------------------------
select
a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304
from k001 a
where left(K0101,1) in ('X','Y','Z','C') 
	and rtrim(K1302) is not null and left(K1302,1) not in ('X','Y','Z','C','G','S')
order by a0102,k0101,k0108

--37
update a set k1302=nullif(k1302,k1302),k1303=nullif(k1303,k1303),k1304=nullif(k1304,k1304)
from k001 a
where left(K0101,1) in ('X','Y','Z','C') 
	and rtrim(K1302) is not null and left(K1302,1) not in ('X','Y','Z','C','G','S')

---------------------------------
--起点不在上年路段桩号范围内
select
'K001'+'&A0102 ='''+rtrim(cast(a.A0102 as varchar))+''' and K0101='''+rtrim(cast(a.K0101 as varchar))+''' and K0108 ='+rtrim(cast(a.K0108 as varchar))  as 编辑,
a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304,a.k0199
from K001 a left join luduan b 
	on rtrim(a.k1302) is not null and rtrim(a.k1302)=rtrim(b.k0101) and a.k1303>=b.k0108 and a.k1303<b.k0109
where  left(a.K0101,1) in ('X','Y','Z','C') and left(a.K1302,1) in ('X','Y','Z','C')
	and rtrim(a.K1302) is not null and b.a0102 is null

---------------------------------
--止点不在上年路段桩号范围内 30
select
'K001'+'&A0102 ='''+rtrim(cast(a.A0102 as varchar))+''' and K0101='''+rtrim(cast(a.K0101 as varchar))+''' and K0108 ='+rtrim(cast(a.K0108 as varchar))  as 编辑,
a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304,a.k0199,b.k0101,b.k0108,b.k0109
from K001 a left join L001 b 
	on rtrim(a.k1302) is not null and rtrim(a.k1302)=rtrim(b.k0101) and a.k1304>b.k0108 and a.k1304<=b.k0109
where  left(a.K0101,1) in ('X','Y','Z','C') and left(a.K1302,1) in ('X','Y','Z','C')
	and rtrim(a.K1302) is not null and b.a0102 is null

update a set a.k1302=nullif(a.k1302,a.k1302),a.k1303=nullif(a.k1303,a.k1303),a.k1304=nullif(a.k1304,a.k1304),
		a.k3909='14',a.hk3909='往年建成本年统计'
from K001 a left join L001 b 
	on rtrim(a.k1302) is not null and rtrim(a.k1302)=rtrim(b.k0101) and a.k1304>b.k0108 and a.k1304<=b.k0109
where  left(a.K0101,1) in ('X','Y','Z','C') and left(a.K1302,1) in ('X','Y','Z','C')
	and rtrim(a.K1302) is not null and b.a0102 is null

---------------------------------4342
select
k3909,hk3909,a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304
from k001 a
where left(K0101,1) in ('X','Y','Z','C') 
	and rtrim(K1302) is null and rtrim(k3909) not in ('11','14')
order by a0102,k0101,k0108


update a set a.k1302=nullif(a.k1302,a.k1302),a.k1303=nullif(a.k1303,a.k1303),a.k1304=nullif(a.k1304,a.k1304),
		a.k3909='14',a.hk3909='往年建成本年统计'
from k001 a
where left(K0101,1) in ('X','Y','Z','C') 
	and rtrim(K1302) is null and rtrim(k3909) not in ('11','14')

---------------------------------
--0
select
k3909,hk3909,a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304
from k001 a
where left(K0101,1) in ('X','Y','Z','C')  and rtrim(k0190)='2022'
	and rtrim(K1302) is not null 
order by a0102,k0101,k0108

--2
select
k3909,hk3909,a.A0102,a.HA0102,a.K0101,a.K0112,a.K0108,a.K0109,a.K0110,a.K0111,
a.k1302,a.k1303,a.k1304
from k001 a
where left(K0101,1) in ('X','Y','Z','C')  and rtrim(k0190)='2022'
	and rtrim(k3909)<>'11'
order by a0102,k0101,k0108

---------------------------------

