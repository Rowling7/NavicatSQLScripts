

----------MQI 按区划计算全省优良路率
select left(a0103,6),rtrim(objjc),
[总评定里程]=cast((sum(case when k0304 in ('22','23','24','30') then a5008 else 0 end)+sum(case when  k0304 in ('10','11') then a5008 else 0 end)/2)/1000 as numeric(18,3)),
[优]=sum(case when isnull(a5010,0)>=90 then isnull(a5008,0)/1000 else 0 end),
[良]=sum(case when isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0)/1000 else 0 end),
[中]=sum(case when isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0)/1000 else 0 end),
[次]=sum(case when isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0)/1000 else 0 end),
[差]=sum(case when  isnull(a5010,0)<60 then isnull(a5008,0)/1000 else 0 end),
[优良路率]=round(sum(case when isnull(a5010,0)>=80 then isnull(a5008,0)/1000 else 0 end)/nullif(sum(isnull(a5008,0)/1000),0)*100,1),
[评定值]=round(sum(isnull(a5010,0)*isnull(a5008,0))/sum(isnull(a5008,0)),1),
[县道总评定里程]=cast((sum(case when left(k0101,1)='X'and k0304 in ('22','23','24','30') then a5008 else 0 end)+sum(case when left(k0101,1)='X'and k0304 in ('10','11') then a5008 else 0 end)/2)/1000 as numeric(18,3)),
[县道优]=sum(case when left(k0101,1)='X' and isnull(a5010,0)>=90 then isnull(a5008,0)/1000 else 0 end),
[县道良]=sum(case when left(k0101,1)='X' and isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0)/1000 else 0 end),
[县道中]=sum(case when left(k0101,1)='X' and isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0)/1000 else 0 end),
[县道次]=sum(case when left(k0101,1)='X' and isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0)/1000 else 0 end),
[县道差]=sum(case when left(k0101,1)='X' and isnull(a5010,0)<60 then isnull(a5008,0)/1000 else 0 end),
[县道优良路率] = ROUND(SUM(CASE WHEN LEFT(k0101, 1) = 'X' AND ISNULL(a5010, 0) >= 80 THEN ISNULL(a5008, 0) / 1000 ELSE 0 END) / NULLIF(SUM(CASE WHEN LEFT(k0101, 1) = 'X' THEN ISNULL(a5008, 0) / 1000 ELSE 0 END), '0') * 100, 1),
[县道评定值] = ROUND(SUM(CASE WHEN LEFT(k0101, 1) = 'X' THEN ISNULL(a5008, 0) ELSE 0 END * ISNULL(a5010, 0)) / NULLIF(SUM(CASE WHEN LEFT(k0101, 1) = 'X' THEN ISNULL(a5008, 0) ELSE 0 END), '0'), 1),
[乡道总评定里程]=cast((sum(case when left(k0101,1)='Y'and k0304 in ('22','23','24','30') then a5008 else 0 end)+sum(case when left(k0101,1)='Y'and k0304 in ('10','11') then a5008 else 0 end)/2)/1000 as numeric(18,3)),
[乡道优]=sum(case when left(k0101,1)='Y' and isnull(a5010,0)>=90 then isnull(a5008,0)/1000 else 0 end),
[乡道良]=sum(case when left(k0101,1)='Y' and isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0)/1000 else 0 end),
[乡道中]=sum(case when left(k0101,1)='Y' and isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0)/1000 else 0 end),
[乡道次]=sum(case when left(k0101,1)='Y' and isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0)/1000 else 0 end),
[乡道差]=sum(case when left(k0101,1)='Y' and isnull(a5010,0)<60 then isnull(a5008,0)/1000 else 0 end),
[乡道优良路率]=round(sum(case when left(k0101,1)='Y' and isnull(a5010,0)>=80 then isnull(a5008,0)/1000 else 0 end)/case when (sum(case when left(k0101,1)='Y' then isnull(a5008,0)/1000 else 0 end))=0 then 1 else sum(case when left(k0101,1)='Y' then isnull(a5008,0)/1000 else 0 end) end*100,1),
[乡道评定值]=round(sum(case when left(k0101,1)='Y' then isnull(a5008,0) else 0 end*isnull(a5010,0))/case when (sum(case when left(k0101,1)='Y' then isnull(a5008,0) else 0 end))=0 then 1 else sum(case when left(k0101,1)='Y' then isnull(a5008,0) else 0 end) end,1),
[村道总评定里程]=cast((sum(case when left(k0101,1)='C'and k0304 in ('22','23','24','30') then a5008 else 0 end)+sum(case when left(k0101,1)='C'and k0304 in ('10','11') then a5008 else 0 end)/2)/1000 as numeric(18,3)),
[村道优]=sum(case when left(k0101,1)='C' and isnull(a5010,0)>=90 then isnull(a5008,0)/1000 else 0 end),
[村道良]=sum(case when left(k0101,1)='C' and isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0)/1000 else 0 end),
[村道中]=sum(case when left(k0101,1)='C' and isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0)/1000 else 0 end),
[村道次]=sum(case when left(k0101,1)='C' and isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0)/1000 else 0 end),
[村道差]=sum(case when left(k0101,1)='C' and isnull(a5010,0)<60 then isnull(a5008,0)/1000 else 0 end),
[村道优良路率]=round(sum(case when left(k0101,1)='C' and isnull(a5010,0)>=80 then isnull(a5008,0)/1000 else 0 end)/case when (sum(case when left(k0101,1)='C' then isnull(a5008,0)/1000 else 0 end))=0 then 1 else sum(case when left(k0101,1)='C' then isnull(a5008,0)/1000 else 0 end) end*100,1),
[村道评定值]=round(sum(case when left(k0101,1)='C' then isnull(a5008,0) else 0 end*isnull(a5010,0))/case when (sum(case when left(k0101,1)='C' then isnull(a5008,0) else 0 end))=0 then 1 else sum(case when left(k0101,1)='C' then isnull(a5008,0) else 0 end) end,1)
 from k03 left join DZ0101 on left(a0103,6)=rtrim(objname)
where left(k5104,1) in ('1','2') and left(rtrim(k0101),1) in ('X','Y','C') and a0102='3421124'
group by left(a0103,6),rtrim(objjc) with rollup
having grouping(left(a0103,6))=grouping(rtrim(objjc))
order by left(a0103,6)
