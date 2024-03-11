
drop table #ldc
drop table #ldy
drop table #ldx
drop table #tdlx  
drop table #zrc  
drop table #jzc  
drop table #sd 
drop table #ql 
drop table #dk 
drop table #ldx 
drop table #ldy
drop table #ldc
drop table #xz




select * into #ldc
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',road_cl) 
select * into #ldy
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',road_yl) 
select * into #ldx
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',road_xl) 
select * into #dk
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',dkpp) 
select * into #ql
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',qlpp) 
select * into #sd
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',sdpp)
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##xz')) drop table #xz 
select * into #xz
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',xzpp) 
select * into #jzc
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',jzcpp) 
select * into #zrc
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',zrcpp) 
select * into #tdlx
from openrowset('Microsoft.Jet.OLEDB.4.0',  --
'D:\东方永德软件OYDSOFT安徽\HRP-GIS2014\MAPDATA\3417\mapdata.sdd';'admin';'',zrc_tdlxl) 






--村道路段编码一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldc a full join (select * from t_ld where left(ldbm,1)='C') b on a.ldbm=b.ldbm 
where a.ldbm is null or b.ldbm is null
--村道路段名称一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldc a full join (select * from t_ld where left(ldbm,1)='C') b on a.ldbm=b.ldbm 
where a.lxmc<>b.lxmc
--乡道路段编码一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldy a full join (select * from t_ld where left(ldbm,1)='Y') b on a.ldbm=b.ldbm 
where a.ldbm is null or b.ldbm is null
--乡道路段名称一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldy a full join (select * from t_ld where left(ldbm,1)='Y') b on a.ldbm=b.ldbm 
where a.lxmc<>b.lxmc
--县道路段编码一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldx a full join (select * from t_ld where left(ldbm,1)='X') b on a.ldbm=b.ldbm 
where a.ldbm is null or b.ldbm is null
--县道路段名称一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #ldx a full join (select * from t_ld where left(ldbm,1)='X') b on a.ldbm=b.ldbm 
where a.lxmc<>b.lxmc
--渡口一致性查询
select a.dkbm,b.dkbm,a.dkbm,b.dkbm from #dk a full join t_dk b on a.dkbm=b.dkbm where a.dkbm is null or b.dkbm is null
--渡口名称一致性查询
select a.dkbm,b.dkbm,a.dkbm,b.dkbm from #dk a full join t_dk b on a.dkbm=b.dkbm where a.dkmc<>b.dkmc
--桥梁一致性查询
select a.qlbm,b.qlbm,a.qlmc,b.qlmc from #ql a full join t_ql b on a.qlbm=b.qlbm where a.qlbm is null or b.qlbm is null
--桥梁名称一致性查询
select a.qlbm,b.qlbm,a.qlmc,b.qlmc from #ql a full join t_ql b on a.qlbm=b.qlbm where a.qlmc<>b.qlmc
--隧道一致性查询
select a.sdbm,b.sdbm,a.sdmc,b.sdmc from #sd a full join t_sd b on a.sdbm=b.sdbm where a.sdbm is null or b.sdbm is null
--隧道名称一致性查询
select a.sdbm,b.sdbm,a.sdmc,b.sdmc from #sd a full join t_sd b on a.sdbm=b.sdbm where a.sdmc<>b.sdmc
--乡镇一致性查询
select a.xzbm,b.xzbm,a.xzmc,b.xzmc from #xz a full join t_xz b on a.xzbm=b.xzbm where a.xzbm is null or b.xzbm is null
--乡镇名称一致性查询
select a.xzbm,b.xzbm,a.xzmc,b.xzmc from #xz a full join t_xz b on a.xzbm=b.xzbm where a.xzmc<>b.xzmc
--建制村一致性查询
select a.jzcbm,b.jzcbm,a.jzcmc,b.jzcmc from #jzc a full join t_jzc b on a.jzcbm=b.jzcbm where a.jzcbm is null or b.jzcbm is null
--建制村名称一致性查询
select a.jzcbm,b.jzcbm,a.jzcmc,b.jzcmc from #jzc a full join t_jzc b on a.jzcbm=b.jzcbm where a.jzcmc<>b.jzcmc
--自然村一致性查询
select a.zrczdm,b.zrczdm,a.zrczmc,b.zrczmc from #zrc a full join t_zrc b on a.zrczdm=b.zrczdm where a.zrczdm is null or b.zrczdm is null
--自然村名称一致性查询
select a.zrczdm,b.zrczdm,a.zrczmc,b.zrczmc from #zrc a full join t_zrc b on a.zrczdm=b.zrczdm where a.zrczmc<>b.zrczmc
--通达路线一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #tdlx a full join t_zrctyxtdlx b on a.ldbm=b.ldbm where a.ldbm is null or b.ldbm is null
--通达路线名称一致性查询
select a.ldbm,b.ldbm,a.lxmc,b.lxmc from #tdlx a full join t_zrctyxtdlx b on a.ldbm=b.ldbm where a.lxmc<>b.lxmc
