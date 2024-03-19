/*不显示零*/
select
LEFT(STUFF(rtrim(A0102),3,1,null),4),
OBJJC,
ROUND(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0),2) 'MQI优良路率',
ROUND(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0),2) 'MQI评定结果',
ROUND(sum(isnull(a5042,0)+isnull(a5043,0))*100/nullif(sum(isnull(a5042,0)+isnull(a5043,0)+isnull(a5044,0)+isnull(a5045,0)+isnull(a5046,0)),0),2)'PQI优良路率',
ROUND(sum(isnull(a5011,0)*(isnull(a5042,0)+isnull(a5043,0)+isnull(a5044,0)+isnull(a5045,0)+isnull(a5046,0)))/nullif(sum(isnull(a5042,0)+isnull(a5043,0)+isnull(a5044,0)+isnull(a5045,0)+isnull(a5046,0)),0),2)'PQI评定结果'

from  K04
LEFT JOIN AHDSH ON LEFT(STUFF(rtrim(A0102),3,1,null),4)=XZQH 
where left(a0203,1) IN ('X','Y','Z','C')  
and left(a0101a,4) = '2023'
and (substring(rtrim(a0101a),5,1)-1)*3+substring(rtrim(a0101a),6,1)= '12'
GROUP BY LEFT(STUFF(rtrim(A0102),3,1,null),4),OBJJC WITH ROLLUP
HAVING GROUPING(LEFT(STUFF(rtrim(A0102),3,1,null),4))=GROUPING(OBJJC)
ORDER BY LEFT(STUFF(rtrim(A0102),3,1,null),4),OBJJC