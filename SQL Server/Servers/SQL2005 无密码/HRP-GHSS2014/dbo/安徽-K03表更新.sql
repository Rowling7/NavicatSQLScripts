if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk03')) drop table #tk03

SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
INTO #tk03
FROM
(
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\34-报公路局-L11-2-202403011500-1.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\34-报公路局-L11-2-202403011500-2.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\34-报公路局-L11-2-202403011500-4.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\34-报公路局-L11-2-202403011500-3.xlsx',sheet1$)
) XLS
SELECT count(*) FROM #TK03 --order by a
SELECT count(*) FROM K03  where left(k0101,1)<>'z' --order by k0101 
SELECT * FROM [NCGL3420230205-2]..T_LD
/*
--132764
SELECT A,SUM(ISNULL(I,0))I
FROM #TK03
GROUP BY A

--132764
SELECT LEFT(LDBM,10),SUM(ISNULL(LDLC,0))
FROM [NCGL3420230205-2]..T_LD
where SFWGYLD<>'1' AND SFWDGTLD='2'
GROUP BY LEFT(LDBM,10)

--136832
SELECT k0101,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(hk0304,'一级','2'),'二级','3'),'三级','4'),'四级','5'),'五级','6') hk0304,
SUM(ISNULL(a5008,0))/1000 a5008
FROM [HRP-GHSS2014]..k03
GROUP BY k0101,hk0304
*/


SELECT A ,LDBM M,g,LDJSDJ,I ,LDLC
FROM
(
--136829
SELECT A,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(G,'一级','2'),'二级','3'),'三级','4'),'四级','5'),'五级','6') g,SUM(ISNULL(I,0))/1000 I
FROM #TK03
GROUP BY A,G
)XLS

LEFT JOIN
(
--138629
SELECT LEFT(LDBM,10)LDBM,LDJSDJ,CASE WHEN LDJSDJ='2' THEN SUM(ISNULL(LDLC,0))*2 ELSE SUM(ISNULL(LDLC,0))END LDLC
FROM [NCGL3420230205-2]..T_LD
where SFWGYLD<>'1' AND SFWDGTLD='2'
GROUP BY LEFT(LDBM,10),LDJSDJ
)NCGL ON XLS.A=NCGL.LDBM and xls.g=ncgl.LDJSDJ
WHERE I<>LDLC



SELECT k0101,LDBM M,hk0304,LDJSDJ,a5008,LDLC
FROM
(
--136829
SELECT k0101,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(hk0304,'一级','2'),'二级','3'),'三级','4'),'四级','5'),'五级','6') hk0304,
SUM(ISNULL(a5008,0))/1000 a5008
FROM [HRP-GHSS2014]..k03
where left(k0101,1)<>'z'
GROUP BY k0101,hk0304
)ghss

LEFT JOIN
(
--138629
SELECT LEFT(LDBM,10)LDBM,LDJSDJ,CASE WHEN LDJSDJ='2' THEN SUM(ISNULL(LDLC,0))*2 ELSE SUM(ISNULL(LDLC,0))END LDLC
FROM [NCGL3420230205-2]..T_LD
where SFWGYLD<>'1' AND SFWDGTLD='2'
GROUP BY LEFT(LDBM,10),LDJSDJ
)NCGL ON rtrim(ghss.k0101)=NCGL.LDBM and ghss.hk0304=ncgl.LDJSDJ
WHERE a5008<>LDLC and ncgl.LDLC is null




SELECT A,K0101,F,HA5009,D,E,K0108,K0109,M,N,A5011A,A5011B
--UPDATE [HRP-GHSS2014]..K03 SET A5011A=M,A5011B=N
FROM #TK03 T
INNER JOIN [HRP-GHSS2014]..K03 K ON T.A=K.K0101 AND T.D=K.K0108 AND T.E=K.K0109 AND F=HA5009 
where A5011A<>M or A5011B<>N

SELECT A,K0101,F,HA5009,D,E,K0108,K0109,A5010,k 
--UPDATE [HRP-GHSS2014]..K03 SET A5010=k
FROM #TK03 T
INNER JOIN [HRP-GHSS2014]..K03 K ON T.A=K.K0101 AND T.D=K.K0108 AND T.E=K.K0109 AND F=HA5009 
where A5010<>k  
--where left(k.k0101,1)<>'z' or left(t.a,1)<>'z'