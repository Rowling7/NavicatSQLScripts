SELECT rtrim(a1314) [年报库|管养单位名称],rtrim(桥梁名称),rtrim(k6002)  [年报库|桥梁名称],CBMS桥梁编码,
桥梁中心桩号,k6003 [年报库|桥梁中心桩号],
桥梁身份码
--update k060 set k6002=rtrim(桥梁名称)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\工作簿1.xls',sheet1$)

left join k060 on k6040=桥梁身份码
where  桥梁中心桩号<>k6003 and rtrim(桥梁名称)=rtrim(k6002) and rtrim(a1314)not in ('合安中心' , '合肥处')
ORDER BY rtrim(a1314)


