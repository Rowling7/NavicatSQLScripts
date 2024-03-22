----A17
/*
select   a.a0102 ,a.ha0102,a.a0203,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a17表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,left(k0101,1) a0203
	from k01 
	where left(k0101,1) in ('x','y','c') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a0203
		from a17
		where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a0203
	)b on a.a0102=b.a0102 and a.a0203=b.a0203 
where a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			and (b.a0102 is null or b.a0101<>'#TJND#')
group by a.a0102 ,a.ha0102,a.a0203,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102

*/

select   a.a0102 ,a.ha0102,a.a0203,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,left(k0101,1) a0203
	from k01 
	where left(k0101,1) in ('x','y','c') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a0203
		from a17
		--where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a0203
	)b on a.a0102=b.a0102 and a.a0203=b.a0203 
where --a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			--and (b.a0102 is null or b.a0101<>'#TJND#')
			(b.a0102 is null or b.a0101<>'2023')
group by a.a0102 ,a.ha0102,a.a0203,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102


---A15
/*
select   a.a0102 ,a.ha0102,a.a0103,objjc,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,left(a0103,6) a0103,objjc
	from k01 
	left join dz0101 on left(a0103,6)=objname
	where left(k0101,1) in ('x','y','c') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a0103
		from a15
		where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a0103
	)b on a.a0102=b.a0102 and left(a.a0103,6)=b.a0103 
where a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			and (b.a0102 is null or b.a0101<>'#TJND#')
group by a.a0102 ,a.ha0102,a.a0103,objjc,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102
*/

select   a.a0102 ,a.ha0102,a.a0103,objjc,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,left(a0103,6) a0103,objjc
	from k01 
	left join dz0101 on left(a0103,6)=objname
	where left(k0101,1) in ('x','y','c') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a0103
		from a15
		--where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a0103
	)b on a.a0102=b.a0102 and left(a.a0103,6)=b.a0103 
where --a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			--and (b.a0102 is null or b.a0101<>'#TJND#')
			(b.a0102 is null or b.a0101<>'2023')
group by a.a0102 ,a.ha0102,a.a0103,objjc,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102

--B17
/*
select   RTRIM(a.a0102) a0102,RTRIM(a.ha0102) ha0102,a.K0101,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101
	from k01 
	where left(k0101,1) in ('g','s') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1' 
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101
		from B17
		where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),K0101
	)b on a.a0102=b.a0102 and a.K0101=b.K0101 
where a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			and (b.a0102 is null or b.a0101<>'#TJND#')
group by a.a0102 ,a.ha0102,a.K0101,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102
*/

select   RTRIM(a.a0102) a0102,RTRIM(a.ha0102) ha0102,a.K0101,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年a15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101
	from k01 
	where left(k0101,1) in ('g','s') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1' 
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101
		from B17
		--where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),K0101
	)b on a.a0102=b.a0102 and a.K0101=b.K0101 
where --a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			--and (b.a0102 is null or b.a0101<>'#TJND#')
			(b.a0102 is null or b.a0101<>'2023')
group by a.a0102 ,a.ha0102,a.K0101,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102

-----B15
/*
select   RTRIM(a.a0102) a0102,RTRIM(a.ha0102) ha0102,a.a1660,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年b15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,case when k0304='10'then '1'when left(k0101,1)in('g','h')and k0304<>'10' then '2' else '3'end a1660
	from k01 
	where left(k0101,1) in ('g','s','h','t') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a1660
		from B15
		where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a1660
	)b on a.a0102=b.a0102 and a.a1660=b.a1660 
where a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			and (b.a0102 is null or b.a0101<>'#TJND#')
group by a.a0102 ,a.ha0102,a.a1660,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102
*/

select   RTRIM(a.a0102) a0102,RTRIM(a.ha0102) ha0102,a.a1660,case when b.a0101 is not null then  b.a0101 else '无记录'end '最近一次填写年度','#TJND#年b15表数据未填写，请核实是否漏填写。' '审核结果'
from 
(
	select distinct a0102,ha0102,case when k0304='10'then '1'when left(k0101,1)in('g','h')and k0304<>'10' then '2' else '3'end a1660
	from k01 
	where left(k0101,1) in ('g','s','h','t') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and k0121 <>'1'
) a
left join
	(
		select  rtrim(a0102)a0102 ,max(left(a0101,4))a0101,a1660
		from B15
		--where a0102 like '#A0102#%' and a0102 like '#GLDW#%'
		group by rtrim(a0102),a1660
	)b on a.a0102=b.a0102 and a.a1660=b.a1660 
where --a.a0102 like '#A0102#%' and a.a0102 like '#GLDW#%'
			--and (b.a0102 is null or b.a0101<>'#TJND#')
			(b.a0102 is null or b.a0101<>'2023')
group by a.a0102 ,a.ha0102,a.a1660,case when b.a0101 is not null then  b.a0101 else '无记录'end
order by a.a0102

