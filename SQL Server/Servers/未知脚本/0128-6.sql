
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk060'))
drop table #tk060
SELECT SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z
into #tk060
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0128.xls',sheet1$)

SELECT * from #tk060

if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk0601'))
drop table #tk0601
use NCGL342023
SELECT t2023.qlbm
--UPDATE t2023 SET t2023.yqlbm=null

into #tk0601
from T_ql t2023
right JOIN (
SELECT a,SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z,SUBSTRING(left(a,len(a)-1),charindex(',桥梁名称=',a)+7,15) y
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0128.xls',sheet1$)
)XLS ON xls.z=t2023.qlbm
left join [NCGL342022]..t_ql t2022 on t2022.qlbm=t2023.qlbm --and t2022.qlmc=t2023.qlmc
where t2022.qlmc is not null  and t2022.JSZKPDDJ not  in ('4','5')

SELECT * from #tk0601

DELETE #tk060 
from #tk060
left join #tk0601 on z=qlbm
where qlbm is not null


SELECT  k0181,A1331,HA1331,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)
from [HRP-DBMS2014]..k060 
right join #tk060  on z=left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)