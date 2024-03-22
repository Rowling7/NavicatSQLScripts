select left(a0103,4),objjc,sum(isnull(k0114,0)) 合计,
[等级公路小计]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304 in ('10','11','22','23','24')  THEN K0114 ELSE 0 END),
[高速]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='10'  THEN K0114 ELSE 0 END),
[一级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='11'  THEN K0114 ELSE 0 END),
[二级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='22'  THEN K0114 ELSE 0 END),
[三级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='23'  THEN K0114 ELSE 0 END),
[四级]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='24'  THEN K0114 ELSE 0 END),
[等外]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND K0304='30'  THEN K0114 ELSE 0 END)
from k01
left join ahdsh on left(a0103,4)=xzqh
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and A0102 like '34%'
group by left(a0103,4),objjc with ROLLup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4),objjc


select  left(a0103,4),objjc,sum(isnull(k0114,0)) 合计,
[国道]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='G'  THEN K0114 ELSE 0 END),
[国家高速公路]	= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='G' AND A50.A0203='GA' THEN K0114 ELSE 0 END),
[省道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='S'  THEN K0114 ELSE 0 END),
[县道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='X'  THEN K0114 ELSE 0 END),
[乡道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Y'  THEN K0114 ELSE 0 END),
[专用公路]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='Z'  THEN K0114 ELSE 0 END),
[村道]		= SUM(CASE WHEN (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' AND left(K01.k0101,1)='C'  THEN K0114 ELSE 0 END)
from k01 left join a50 on k01.a0102=a50.a0102 and k01.k0101=a50.k0101
left join ahdsh on left(a0103,4)=xzqh
where (K0124 IS NULL OR K0124 = '') AND ISNULL(K0123,'2') = '2' and left(K01.k0101,1) in ('G','S','X','Y','Z','C') and k01.A0102 like '34%'
group by left(a0103,4),objjc,px with ROLLup
having grouping(px)=grouping(objjc) and grouping(left(a0103,4))=grouping(objjc)
order by px