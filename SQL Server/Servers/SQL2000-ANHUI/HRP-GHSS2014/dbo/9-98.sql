/*不显示零*/
select
	[col01] = rtrim(k63.k6302),   	--隧道名称
	[col02] = rtrim(k63.K6301),  	--隧道代码
 	--[col03] = k63.k6303,		--隧道入口桩号
	[col03] = round((k63.K6303+k63.K6305/2000) ,3,1) ,--隧道中心桩号
  [col04] = rtrim(replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),  	--路线编码
	[col05] = rtrim(a50.k0112),   	--路线简称
	[col06] = rtrim(d.objjc),	--技术等级
	k0185,--经度
k0186,--纬度
	[col07] = k63.k6305,		--隧道长度
	[col10] = rtrim(k63.k6304),  	--隧道分类代码
	[col11] = rtrim(k63.hk6304),  	--隧道分类名称
	[col08] = k63.k6306,		--隧道净宽
	[col09] = k63.k6307,		--隧道净高
	[col12] = ISNULL(HK6335,'否')  --是否水下隧道
from k63
	left join a50 on k63.a0102 = a50.a0102 and k63.k0101 = a50.k0101
	left join da0102 on k63.a0102=da0102.objname
	left join 
		(select a.a0102,a.k0101,a.k6301,max(b.k0304) k0304
		from K63 a left join K01 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6324>=b.k0108 and a.k6324<=b.k0109
		where LEFT(A.K0101,1) IN ('G','S','H','T') AND a.A0102 like '34%' and a.a0101 <= '2023'
		group by a.a0102,a.k0101,a.k6301) c
	     on k63.a0102=c.a0102 and k63.k0101=c.k0101 and k63.k6301=c.k6301
	left join Dk0301 d  on  d.objname=c.k0304
	left join(
	SELECT 		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'U'+rtrim(K6301) k63011,
k0185,--经度
k0186--纬度
from [HRP-DBMS2014]..k063 )e on k63.K6301=e.k63011
where	LEFT(k63.K0101,1) IN ('G','S','H','T')
	AND k63.a0102 like '34%' and k63.a0101 <= '2023' and rtrim(d.objjc)<>'高速'
order by  replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''),k63.k6303

/*
k0185--经度
k0186--纬度
case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'U'+rtrim(K6301)
*/

/*
SELECT 		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'U'+rtrim(K6301) k63011,
k0185,--经度
k0186--纬度
from [HRP-DBMS2014]..k063 

4213 20221026
20221024
*/
