if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t')) DROP TABLE #T


SELECT  RTRIM(A0102) A0102,RTRIM(HA0102) HA0102,RTRIM(K0101) K0101,RTRIM(K0105) K0105,left(a0101a,4) a0101a,RTRIM(A5009) A5009,RTRIM(HA5009)HA5009
into #t
from k05
where left(a0101a,4) ='2023'

SELECT * from #t

update #t set a5009='2' ,ha5009='上行'
from #t
where A5009='1' AND left(a0101a,4)='2023'


SELECT a0102+k0101+a0101a+k0105+hA5009,count(a0102+k0101+a0101a+k0105+hA5009)
from #t
GROUP BY a0102+k0101+a0101a+k0105+hA5009
having count(a0102+k0101+a0101a+k0105+hA5009)>1
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#t')) DROP TABLE #T


/*
update k05 set a5009='2' ,ha5009='上行'
from k05
where A5009='1' AND left(a0101a,4)='2023'

SELECT 
RTRIM(A0102) +RTRIM(HA0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) +RTRIM(HA5009)HA5009,count(RTRIM(A0102) +RTRIM(HA0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) +RTRIM(HA5009))
from k05
GROUP BY RTRIM(A0102) +RTRIM(HA0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) +RTRIM(HA5009)
having count(RTRIM(A0102) +RTRIM(HA0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4) +RTRIM(HA5009))>1

*/
