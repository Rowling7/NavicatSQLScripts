SELECT V0513,TDQK,hV0513,HTDQK,xzdm,xzmc
--update v52 set V0513=TDQK,hV0513=HTDQK
from v52 
left join sxzb on V0514=xzdm
where tdqk is not null  and NBTABLE ='v52' and nbnf='2023' 
ORDER BY HTDQK


SELECT V5708,TDQK,hV5708,HTDQK,v5701,hv5701,xzdm,xzmc
--update v53 set V5708=TDQK,hV5708=HTDQK
from v53 
left join sxzb on V5701=xzdm
where tdqk is not null and V5708<>tdqk and NBTABLE ='v53' and nbnf='2023'


SELECT V5708,TDQK,hV5708,HTDQK,v5701,hv5701,xzdm,xzmc
--DELETE  V53 
from v53 
left join sxzb on V5701=xzdm
where tdqk is not null and V5708<>tdqk and NBTABLE ='v53' and nbnf='2023'  and tdqk='3'