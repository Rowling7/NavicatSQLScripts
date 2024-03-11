if object_id('tempdb..#JZC_34') is not null  drop table #JZC_34
if object_id('tempdb..#JZC_map') is not null  drop table #JZC_map
if object_id('tempdb..#JZC_dbms') is not null  drop table #JZC_dbms
if object_id('tempdb..#id') is not null  drop table #id

 select * into #JZC_34  from openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\341\MAPDATA.SDD';'admin';'',JZC)  

 SET NO_BROWSETABLE ON

SELECT a.smid, DWDM,DWMC,BM,MC 
into #JZC_map
FROM #JZC_34 AS A 
LEFT JOIN V52 as B  on  a.DWDM = rtrim(b.A0102) and a.BM = rtrim(b.V0514) 
where  b.A0102 is null and b.V0514 is null




 if object_id('tempdb..#JZC_341') is not null  drop table #JZC_341

 select * 
 into #JZC_341 
 from openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\341\MAPDATA.SDD';'admin';'',JZC)  

SET NO_BROWSETABLE ON

SELECT  A0102 as DWDM,HA0102 as DWMC,V0514 as BM,HV0514 as MC 
into #JZC_dbms
FROM V52  
left JOIN #JZC_341 as B  on  rtrim(V52.A0102) = b.DWDM and rtrim(V52.V0514) = b.BM 

where  b.DWDM is null and b.BM is null


SELECT a.smid, a.DWDM adwdm,a.DWMC adwmc,a.BM abm,a.MC amc, dbms.DWDM dwdm2,dbms.DWMC dwmc2,dbms.BM bm2,dbms.MC  mc2
into #id
from #JZC_map a,#JZC_dbms dbms
where a.mc=dbms.mc
SELECT * from #id

SELECT b.smid,c.smid,b.BM,c.bm2
from openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\341\MAPDATA.SDD';'admin';'',JZC)   B
left join #id c on b.smid=c.smid
where c.smid is not null

update openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\341\MAPDATA.SDD';'admin';'',JZC)
set BM=RTRIM(c.bm2)
--SELECT BM,RTRIM(c.bm2)
from openrowset('Microsoft.Jet.OLEDB.4.0','D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\341\MAPDATA.SDD';'admin';'',JZC)   B
left join #id c on b.smid=c.smid
where  b.smid in ('3353','3355','3349','3275','3254','3344','3343','3345','3352','3339','3228','3340','3350','3348','3246','3351','3315','3231','3306','3301','3250','3325','3234','3233','3335','3255','3238')
AND B.MC=C.MC2


