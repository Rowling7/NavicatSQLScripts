update V53 set v5708='2',hv5708='否' 
from V53 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231130\2.xls',sheet1$) on A=v5701
where v5701 is not null


update ZRC set v5708='2',hv5708='否' 
from ZRC 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231130\2.xls',sheet1$) on A=v5701
where v5701 is not null



update b set b.v0513='1',b.hv0513='是'
from V52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（是）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from V52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（否）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from v52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\129个仍不同建制村.xls',sheet1$) a on b.v0514=a.a


update b set b.v0513='1',b.hv0513='是'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（是）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（否）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\129个仍不同建制村.xls',sheet1$) a on b.v0514=a.a


