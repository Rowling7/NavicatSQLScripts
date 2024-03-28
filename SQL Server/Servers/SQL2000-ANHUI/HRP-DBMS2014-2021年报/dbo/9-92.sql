
SELECT left(v5701,4),b.objjc,count(*)
from v53 
left join ahdsh b on left(v5701,4)=b.a0102
group by left(v5701,4),b.objjc,b.px
ORDER BY b.px