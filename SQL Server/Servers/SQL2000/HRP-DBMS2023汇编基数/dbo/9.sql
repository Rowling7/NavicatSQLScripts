
/*
1、按路线编码，6位县区行政区划编码分组统计
2、要求1条汇总全省数据，每条路线有一条汇总各县区的数据，然后再是每条路线每个县区的各项里程
3、查询结果按路线编码，县区代码排序。
*/
/*
SELECT
RTRIM(CASE WHEN LEFT(K0101,1) IN ('g','s')and  LEN(K0101)>9 THEN LEFT(K0101,4)ELSE K0101 END) '路线编码',
case when left(A0102,4) = '4290' then left(A0102,6) else left(A0103 ,6) end '县区代码',
da0102.objjc '县区名称',
sum(isnull(K0114,0)) '总里程',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '通车里程',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '1' THEN isnull(K0114,0) else 0 END) '断头路里程',
sum(CASE WHEN K0124 is not null and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '重复路段里程'
from K001
left join da0102 on case when left(A0102,4) = '4290' then left(A0102,6) else left(A0103 ,6) end=rtrim(objname)
where left(k0101,1) in ('G','S')
GROUP BY 
	RTRIM(CASE WHEN LEFT(K0101,1) IN ('g','s')and  LEN(K0101)>9 THEN LEFT(K0101,4)ELSE K0101 END),
	case when left(A0102,4) = '4290' then left(A0102,6) else left(A0103 ,6) end,da0102.objjc with  rollup 
HAVING GROUPING(case when left(A0102,4) = '4290' then left(A0102,6) else left(A0103 ,6) end)=GROUPING(da0102.objjc) 
order by  '路线编码','县区代码'

*/

/*
1、按表头所列字段第一行为汇总全省数据，第二行开始分组汇总17个市州的数据，
2、所有非数值字段需去掉字符串的空格。
3、注意桥隧需要统计上下行桥隧。
*/



