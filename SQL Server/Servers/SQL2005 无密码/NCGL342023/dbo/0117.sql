--DK6306
---10.未变更
---11.新建
---14.往年建成本年统计
---21.指标变更或地理位置变更
SELECT RTRIM(K001.K0101)+RTRIM(K0115),k3912,k1302,k1303,k1304,XLS.Z
--UPDATE K001 SET K3912='21',HK3912='指标变更或地理位置变更'
from K001 
LEFT JOIN (
SELECT a,SUBSTRING(a,charindex(',路段代码=',a)+7,13) Z
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表.xls',sheet9$)
)XLS ON RTRIM(K001.K0101)+RTRIM(K0115)=XLS.Z
WHERE XLS.Z IS NOT NULL

