EXEC sp_attach_db @dbname = N'NCGL342023', 
@filename1 = N'E:\NCGL\202401281608\01281610上报\NCGL342023_0128.MDF'

use [HRP-DBMS2014]
SELECT K0182,HK0182,k0101
from k001 
where rtrim(k0101) like '%d0%' and left(k0101,1) in('g','s','h','t') 
and rtrim(k0101) not like '%zd%'
and  isnull(k0123,'2')='2'
 
 
 
 
 
select rtrim(k0182),rtrim(hk0182),rtrim(k0101),k0108,k0109,*
from k001
where left(rtrim(k0101),1) in ('G','S','H','T') and charindex('D',rtrim(k0101))<>0 and rtrim(k0182)<>'2'




select rtrim(k0182),rtrim(hk0182),rtrim(k0101),k0108,k0109,*
from k001
where left(rtrim(k0101),1) in ('G','S','H','T') and charindex('D',rtrim(k0101))=0 and rtrim(k0182)='2'