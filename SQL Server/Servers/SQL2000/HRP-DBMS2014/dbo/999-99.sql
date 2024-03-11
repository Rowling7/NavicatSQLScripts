SELECT replace(replace(left(k0101,1),'h','G'),'T','S'),k6028 ,count(k6028)
from k060 
group by replace(replace(left(k0101,1),'h','G'),'T','S'),k6028 with ROLLup

select  rtrim(FSBM) FSBM,rtrim(FSMC) FSMC,*
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3418\mapdata.sdd';'admin';'',QL)
WHERE LEFT(FSBM,1) IN ('G','S','H','T') --and FSMC='K633+676中桥'
order by  rtrim(FSBM)



--Microsoft.Jet.OLEDB.4.0
select  rtrim(FSBM) FSBM,rtrim(FSMC) FSMC,case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3418\mapdata.sdd';'admin';'',QLp)
INNER JOIN K060 ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=rtrim(FSBM) 
WHERE LEFT(K0101,1) IN ('G','S','H','T')
order by  rtrim(FSBM)



--Microsoft.Jet.OLEDB.4.0
select  rtrim(FSBM) FSBM,rtrim(FSMC) FSMC,桥梁代码,WZZH,桥梁中心桩号
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3418\mapdata.sdd';'admin';'',QL)
INNER JOIN 
(
select 
桥梁名称,
桥梁代码,
桥梁中心桩号
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\汇总\交公路07表国道全 -2033.xls',L07$)
)A ON RTRIM(桥梁代码)=rtrim(FSBM) 
WHERE LEFT(桥梁代码,1) IN ('G','S','H','T') --AND WZZH<>桥梁中心桩号
order by  rtrim(FSBM)
