SELECT a.objname,a.objjc 
from da0102  a
left join ahdsh b on a.objjc
where len(a.objname)=5 and a.objname<'343'
