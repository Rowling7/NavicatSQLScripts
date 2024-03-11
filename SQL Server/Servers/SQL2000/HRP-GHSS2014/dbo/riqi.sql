select *
from da0101
where LEN(objjc)  =5 and objname like '2023%'
ORDER BY objname

select *
from da0101
where objjc  like'%季%' and objname like '2023%'
ORDER BY objname

select *
from da0101
where objjc  like'%旬%' and objname like '2023%'
ORDER BY objname

select *
from da0101
where objjc  like'%日%' and objname like '2023%'
ORDER BY objname



select * from da0101
where objname like '2023%' 












update da0101
set objname=replace(objname,'2013','2023'),
	objjc=replace(objjc,'2013','2023'),
	objpy=replace(objpy,'2013','2023'),
	objexplain=replace(objexplain,'2013','2023')
from da0101
where left(objname,4)='2013'

