EXEC sp_attach_db @dbname = N'NCGL342023', 
@filename1 = N'E:\NCGL\202401281430\NCGL342023_0128.MDF'



use NCGL342023
SELECT t2023.qlbm,t2023.qlmc,t2023.bgyy,t2023.jcsj,t2023.yqlbm,t2022.qlmc,t2023.JSZKPDDJ,t2022.JSZKPDDJ
from T_ql t2023
right JOIN (
SELECT a,SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z,SUBSTRING(left(a,len(a)-1),charindex(',桥梁名称=',a)+7,15) y
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0128.xls',sheet1$)
)XLS ON xls.z=t2023.qlbm
left join [NCGL342022]..t_ql t2022 on t2022.qlbm=t2023.qlbm --and t2022.qlmc=t2023.qlmc
where t2022.qlmc is not null  and t2022.JSZKPDDJ   in ('4','5')


use NCGL342023
SELECT t2023.qlbm,t2023.qlmc,t2023.bgyy,t2023.jcsj,t2023.yqlbm,t2022.qlmc,t2023.JSZKPDDJ,t2022.JSZKPDDJ
from T_ql t2023
right JOIN (
SELECT a,SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z,SUBSTRING(left(a,len(a)-1),charindex(',桥梁名称=',a)+7,15) y
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0128.xls',sheet1$)
)XLS ON xls.z=t2023.qlbm
left join [NCGL342022]..t_ql t2022 on t2022.qlbm=t2023.qlbm --and t2022.qlmc=t2023.qlmc
where t2022.qlmc is not null  and t2022.JSZKPDDJ   in ('4','5')




------20个删除yqlbm
use NCGL342023
UPDATE t2023 SET t2023.yqlbm=null
from T_ql t2023
right JOIN (
SELECT a,SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) Z,SUBSTRING(left(a,len(a)-1),charindex(',桥梁名称=',a)+7,15) y
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0128.xls',sheet1$)
)XLS ON xls.z=t2023.qlbm
left join [NCGL342022]..t_ql t2022 on t2022.qlbm=t2023.qlbm --and t2022.qlmc=t2023.qlmc
where t2022.qlmc is not null  and t2022.JSZKPDDJ not  in ('4','5')
