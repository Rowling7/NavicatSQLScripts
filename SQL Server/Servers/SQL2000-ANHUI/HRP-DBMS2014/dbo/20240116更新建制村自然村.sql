
INSERT into SXZB
SELECT NUM,
convert(varchar(255),cast(convert(float,XZDM) as decimal)),XZMC,TDQK,HTDQK,NBTABLE,nbnf
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\东方永德软件OYDSOFT安徽\SXZB20240116.xls',sheet2$)
where num>1000

INSERT into SXZB
SELECT NUM,
convert(varchar(255),XZDM),XZMC,TDQK,HTDQK,NBTABLE,nbnf
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\东方永德软件OYDSOFT安徽\SXZB20240116.xls',sheet3$)
where num>1000




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


select k0199,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001),xzdm,tdqk,k6002,xzmc,htdqk,K6028
--update k060 set k0199='2024计划'+tdqk+htdqk
--update k060 set k0199=null
from k060
left join sxzb on left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)=xzdm
where /*tdqk is not null  and*/ NBTABLE ='k060' and nbnf='2023' 
 
