select 
case when len(rtrim(objname))='5'then STUFF(rtrim(objname),3,1,null) else rtrim(objname) end  +'_'+rtrim(objjc)objjc
from DA0102
where len(rtrim(objname))=5 AND  (OBJJC LIKE '%干线公路%' or OBJJC LIKE '%农村公路%')   --筛选地地市
or (left(rtrim(objname),3)>=343 and len(rtrim(objname)) <5) --筛选高速单位
union 
select --查询市州
STUFF(rtrim(objname),3,1,null) +'_'+left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' 
order by objjc --综合排序




--LEFT JOIN AHDSH ON LEFT(STUFF(rtrim(A0102),3,1,null),4)=XZQH 
select --查询市州
STUFF(rtrim(objname),3,1,null) XZQH,rtrim(objname) GXGL,STUFF(rtrim(objname),3,1,2) NCGL,left(objjc,3) objjc
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%' 
order by STUFF(rtrim(objname),3,1,null)