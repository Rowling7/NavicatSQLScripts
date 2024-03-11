/*
--导入excle数据
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk060')) drop table #tk060
SELECT 
[桥梁身份码],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号]
INTO #TK060
from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240127 国省道桥梁对比\QL01280001.xls', sheet4$ ) 
SELECT * FROM #TK060
*/
/*
--核对国道桥梁->图层
SELECT [桥梁身份码],k6040,[桥梁名称],k6002,[桥梁代码],qlbm,[桥梁中心桩号],k6003,[路线编号],k0101
from (
SELECT 
[桥梁身份码],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号]
from #TK060
)xls
inner join (
SELECT rtrim(k6040) k6040,rtrim(k6002) k6002,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) qlbm,rtrim(k6003) k6003,rtrim(k0101) k0101
from k060 
where left(k0101,1)in ('g','s')
) k060 on [桥梁身份码]=k060.k6040  OR [桥梁代码]=k060.qlbm
where left([路线编号],1)in ('G','H')
----560 
*/

--核对省道桥梁->图层
SELECT [桥梁名称],k6002,[桥梁代码],qlbm,[桥梁中心桩号],k6003,[路线编号],k0101
from (
SELECT 
[桥梁身份码],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号]
from #TK060
)xls
inner join (
SELECT rtrim(k6040) k6040,rtrim(k6002) k6002,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) qlbm,rtrim(k6003) k6003,rtrim(k0101) k0101
from k060 
where left(k0101,1)in ('s','t')
) k060 on [桥梁代码]=k060.qlbm  --551+995 1546
where left([路线编号],1)in ('s','t')
--995 
--共1555匹配完整


