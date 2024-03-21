SELECT k6002,hk6028,a1305 ,k6050,		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
from [HRP-DBMS2014]..k060
where case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001) in (
'G237340421L0130','g237340422L0010','g237340422L0040','G237340422L0170','G237340422L0140','G104341122L0310')
order by k6002


SELECT a0102,ha0102,k6002,hk6028,a1305 ,k6050,		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
from [HRP-DBMS2014]..qiaoliang 
where case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001) in (
'G237340421L0130','g237340422L0010','g237340422L0040','G237340422L0170','G237340422L0140','G104341122L0310')
order by k6002