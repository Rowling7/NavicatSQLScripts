--更新桥梁名称
update openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\34\mapdata.sdd';'admin';'',QL)
set
LXBM=UPPER(RTRIM(LXBM)),
FSBM=UPPER(RTRIM(FSBM)),
fsmc=rtrim(k6002),
DWMC=RTRIM(B.HA0102)
from [HRP-DBMS2014]..k060 b 
where rtrim(dwdm)=b.a0102 and rtrim(lxbm)=b.k0101 and rtrim(fsbm)=k6001




SELECT 
rtrim(dwdm),b.a0102,
LXBM,UPPER(RTRIM(LXBM)),
FSBM,UPPER(RTRIM(FSBM)),
fsmc,rtrim(k6002),
DWMC,RTRIM(B.HA0102)
from [HRP-DBMS2014]..k060 b 
LEFT JOIN openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\34\mapdata.sdd';'admin';'',QL)
ON rtrim(dwdm)=b.a0102 and rtrim(lxbm)=b.k0101 and rtrim(fsbm)=k6001
WHERE fsmc<>rtrim(k6002)