/*不显示零*/
if object_id('tempdb..#jishu') is not null  drop table #jishu
select a0103,rtrim(max(ha0103)) ha0103,sum(isnull(k0114,0)) 合计,
[等级公路小计]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304 in ('10','11','22','23','24')  THEN K0114 ELSE 0 END),
[高速]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='10'  THEN K0114 ELSE 0 END),
[一级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='11'  THEN K0114 ELSE 0 END),
[二级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='22'  THEN K0114 ELSE 0 END),
[三级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='23'  THEN K0114 ELSE 0 END),
[四级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='24'  THEN K0114 ELSE 0 END),
[等外]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='30'  THEN K0114 ELSE 0 END),
[晴雨通车]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A0320 ELSE 0 END),
[可绿化]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A3101 ELSE 0 END),
[已绿化]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A3102 ELSE 0 END),
[养护里程]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' THEN A1001 ELSE 0 END)
into #jishu
from k01
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and A0102 like '34%'
group by a0103
order by left(a0103,4),left(a0103,6)


--以下按面层类型出
if object_id('tempdb..#mianceng') is not null  drop table #mianceng
select a0103,rtrim(max(ha0103)) ha0103,sum(isnull(k0114,0)) 合计,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='1' then isnull(K0114,0) else 0 end) as 有铺装,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,2)='12' then isnull(K0114,0) else 0 end) as 水泥混凝土,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='2' then isnull(K0114,0) else 0 end) as 简易铺装,
sum(case when isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(K5104,1)='3' then isnull(K0114,0) else 0 end) as 未铺装 
into #mianceng
from k01
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and A0102 like '34%'
group by a0103
order by a0103


------以下按行政等级计算
if object_id('tempdb..#xingzheng') is not null  drop table #xingzheng
select a0103,rtrim(max(ha0103)) ha0103,sum(isnull(k0114,0)) 合计,
[国道]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='G'  THEN K0114 ELSE 0 END),
[国家高速公路]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='G' AND A50.A0203='GA' THEN K0114 ELSE 0 END),
[省道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='S'  THEN K0114 ELSE 0 END),
[县道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='X'  THEN K0114 ELSE 0 END),
[乡道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Y'  THEN K0114 ELSE 0 END),
[专用公路]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Z'  THEN K0114 ELSE 0 END),
[村道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='C'  THEN K0114 ELSE 0 END)
into #xingzheng
from k01 left join a50 on k01.a0102=a50.a0102 and k01.k0101=a50.k0101
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(K01.k0101,1) in ('G','S','X','Y','Z','C') and k01.A0102 like '34%'
group by a0103
order by a0103


if object_id('tempdb..#zonghe') is not null  drop table #zonghe
select 
	case when grouping(left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),4))=1 then (select rtrim(objjc) from da0102 where objname='34')
			when grouping(left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),6))=1 then '  '+max(replace(replace(replace(a.objname,'340826','3421'),'341822','3422'),'341882','3422')) else '    '+max(replace(replace(replace(b.objname,'340826','342100'),'341822','342200'),'341882','342200')) end a,
	replace((case when grouping(left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),4))=1 then '2023'+'年度总计' 
			when grouping(left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),6))=1 then ' '+rtrim(max(replace(replace(replace(a.objjc,'安徽省',''),'安庆市宿松县','宿松县'),'宣城市广德县','广德县'))) else '   '+rtrim(max(replace(replace(replace(b.objjc,'安徽省',''),'安庆市宿松县','宿松县'),'宣城市广德县','广德县'))) end),'安徽省','') quhua,

	sum(c.合计) b,sum(等级公路小计) bb,sum(高速) c,sum(一级) d,sum(二级) e,sum(三级) f,sum(四级) g,sum(等外) h,sum(晴雨通车) h1,sum(可绿化) h2,sum(已绿化) h3,sum(已绿化)*100/nullif(sum(可绿化),0.000) h4,sum(养护里程) h5,
	' ' i,
	sum(有铺装) j,sum(水泥混凝土) jj,sum(简易铺装) k ,sum(未铺装) l,
	' ' m,
	sum(国道) n,sum(国家高速公路) o,sum(省道) p,sum(县道) q,sum(乡道) r,sum(专用公路) s,sum(村道) t
into #zonghe
from #jishu c
	left join #mianceng d on c.a0103=d.a0103
	left join #xingzheng e on c.a0103=e.a0103
	left join dz0101 a on left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),4)=replace(replace(replace(a.objname,'340826','3421'),'341822','3422'),'341882','3422')
	left join dz0101 b on left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),6)=replace(replace(replace(b.objname,'340826','342100'),'341822','342200'),'341882','342200')
group by left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),4),left(replace(replace(replace(c.a0103,'340826','342100'),'341822','342200'),'341882','342200'),6) with rollup


select 
replace(replace(replace(replace(a.a,'342100','340826'),'3421','340826'),'342200','341822'),'3422','341882') aaa,
a.a,a.quhua,a.b,a.bb,a.c,a.d,a.e,a.f,a.g,a.h,a.h1,a.h2,a.h3,a.h4,a.h5,a.i,a.j,a.jj,a.k,a.l,a.m,a.n,a.o,p,a.q,a.r,a.s,a.t,
'',b.a0104,b.a0105,a.b/nullif(b.a0104,0),a.b/nullif(b.a0105,0)
from #zonghe a 
left join 
(
	select a0103,max(a0104) a0104,max(a0105) a0105 from a21 where (a0102='34' or left(a0102,3) in ('341')) and a0101='2023' group by a0103
) b on replace(replace(replace(replace(replace(ltrim(rtrim(a.a)),'安徽省交通运输厅','34'),'342100','340826'),'3421','340826'),'342200','341882'),'3422','341882')=b.a0103
order by replace(ltrim(rtrim(a.a)),'安徽省交通运输厅','34')

