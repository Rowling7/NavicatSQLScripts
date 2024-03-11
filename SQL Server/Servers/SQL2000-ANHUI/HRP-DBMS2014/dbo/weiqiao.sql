SELECT t004,m,t005,n,xls.k,kwyid,t002,l
--update  weiqiao set t004=m,t005=n,t006=null,t002=l
from weiqiao 
left join (
SELECT k,l,m,n
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet99$)
)xls on xls.k=kwyid
where  t001='不是危桥' 
--and t004 ='狮子口桥'

SELECT k.kwyid,k.k6028,t002
FROM weiqiao w 
left join qiaoliang  k on k.kwyid =w.kwyid
where  t001='不是危桥'

SELECT k.kwyid,k.k6028,t002
FROM weiqiao w 
left join k060  k on k.kwyid =w.kwyid
where  t001='不是危桥'
order by k.kwyid

SELECT k.kwyid,k.k6028,t002,rtrim(k6002)+rtrim(k6003) ,rtrim(t004)+rtrim(t005),k.k6028
FROM weiqiao w 
left join k060  k on rtrim(k6002)+rtrim(k6003)=rtrim(t004)+rtrim(t005)
where  t001='不是危桥' and rtrim(k6002)+rtrim(k6003) is not null
order by k.kwyid


SELECT k.kwyid,rtrim(w.kwyid),rtrim(k0101)+'L'+rtrim(k6001) ,rtrim(t002) t002,k.k6002,t004,k.k6003,t005,k.k6028
FROM weiqiao w 
left join k060  k on rtrim(k0101)+'L'+rtrim(k6001)=rtrim(t002)  or k.kwyid =w.kwyid
--and rtrim(t005)=rtrim(k.k6003)--and rtrim(t004)=rtrim(k6002) and rtrim(t005)=rtrim(k.k6003)
where  t001='不是危桥'  --and t004 ='东关北桥'
order by k.kwyid,k.k6002,t002


SELECT rtrim(k0101)+'L'+rtrim(k6001),a,b,kwyid,rtrim(k6002),c,k6028
--update  k060  set kwyid=b
from k060 
left join (
SELECT a,b,c
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\表0118.xls',sheet7$)
)xls on xls.a=rtrim(k0101)+'L'+rtrim(k6001)
where xls.a is not null
order by k6028

--168
SELECT a1331,count(a1331)
from k060 
where left(K0101,1) in ('X','Y','Z','C') --and k0181='2023'
and AKJFL in ('1','2','3')
GROUP BY a1331




SELECT ZXGZSFSYWQGZXM
from NCGL342022