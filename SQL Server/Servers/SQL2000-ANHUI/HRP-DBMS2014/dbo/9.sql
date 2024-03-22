select --查询市州
STUFF(rtrim(objname),3,1,null) XZQH,rtrim(objname) GXGL,STUFF(rtrim(objname),3,1,2) NCGL,left(objjc,3) objjc,
case when STUFF(rtrim(objname),3,1,null)='3401'then'a合肥市'
when STUFF(rtrim(objname),3,1,null)='3406'then'b淮北市'
when STUFF(rtrim(objname),3,1,null)='3416'then'c亳州市'
when STUFF(rtrim(objname),3,1,null)='3413'then'd宿州市'
when STUFF(rtrim(objname),3,1,null)='3403'then'e蚌埠市'
when STUFF(rtrim(objname),3,1,null)='3412'then'f阜阳市'
when STUFF(rtrim(objname),3,1,null)='3404'then'g淮南市'
when STUFF(rtrim(objname),3,1,null)='3411'then'h滁州市'
when STUFF(rtrim(objname),3,1,null)='3415'then'i六安市'
when STUFF(rtrim(objname),3,1,null)='3405'then'j马鞍山市'
when STUFF(rtrim(objname),3,1,null)='3402'then'k芜湖市'
when STUFF(rtrim(objname),3,1,null)='3418'then'l宣城市'
when STUFF(rtrim(objname),3,1,null)='3407'then'm铜陵市'
when STUFF(rtrim(objname),3,1,null)='3417'then'n池州市'
when STUFF(rtrim(objname),3,1,null)='3408'then'o安庆市'
when STUFF(rtrim(objname),3,1,null)='3410'then'p黄山市'
when STUFF(rtrim(objname),3,1,null)='3422'then'q广德市'
when STUFF(rtrim(objname),3,1,null)='3421'then'r宿松县'end px
from DA0102
where len(rtrim(objname))=5 AND  OBJJC LIKE '%干线公路%'
order by px