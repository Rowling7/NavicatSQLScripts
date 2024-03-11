if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk001'))
drop table #tk001
SELECT K0101
INTO #TK001
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\工作簿2.xlsx',sheet9$)

SELECT T.K0101 ,K.K1302,K.K1303,K.K1304
FROM #TK001 T
LEFT JOIN K001 K ON RTRIM(K.K0101)+RTRIM(K0115)=T.K0101
WHERE (K.K1302 IS NULL OR K.K1303 IS NULL OR K.K1304 IS NULL )and k.k3912 not IN('11','14')




SELECT k.K0101 ,K.K1302,K.K1303,K.K1304
FROM K001 K 
where  k.k3912  IN('11','14')