SELECT rtrim(k0101)+'L'+rtrim(k6001),xls.b,k6118,hk6118,k3912
--UPDATE T_xz SET BGYY_XC='21'
from k060
left join (
SELECT 
a,
SUBSTRING(a,charindex(',桥梁代码=',a)+7,15) b,
SUBSTRING(a,charindex(',路面宽度=',a)+7,charindex(',桥面净宽=',a)-charindex(',路面宽度=',a)-8) c,
SUBSTRING(a,charindex(',桥梁全宽=',a)+7,charindex(',桥梁代码=',a)-charindex(',桥梁全宽=',a)-8) d
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0124.xls',sheet1$)
)xls on rtrim(k0101)+'L'+rtrim(k6001)=xls.b
WHERE XLS.B IS NOT NULL
order by k3912



SELECT rtrim(k0101)+'L'+rtrim(k6001),xls.b,k3912,hk3912
--UPDATE T_xz SET BGYY_XC='21'
from k060
left join (
SELECT 
a,
SUBSTRING(a,charindex('[QLBM]',a)+10,15) b
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\表0124.xls',sheet2$)
)xls on rtrim(k0101)+'L'+rtrim(k6001)=xls.b
WHERE XLS.B IS NOT NULL
order by k3912
