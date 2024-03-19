if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk03')) drop table #tk03

SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
INTO #tk03
FROM
(
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\新建文件夹\34-报公路局-L11-2-202403011500-1.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\新建文件夹\34-报公路局-L11-2-202403011500-2.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\新建文件夹\34-报公路局-L11-2-202403011500-3.xlsx',sheet1$)

UNION
SELECT A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240220 11-2表\新建文件夹\34-报公路局-L11-2-202403011500-4.xlsx',sheet1$)
) XLS
SELECT *  into tk03 FROM #TK03
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
WHERE a5008<>LDLC




SELECT A,K0101,F,HA5009,D,E,K0108,K0109,M,N,A5011A,A5011B
--UPDATE [HRP-GHSS2014]..K03 SET A5011A=M,A5011B=N
FROM #TK03 T
INNER JOIN [HRP-GHSS2014]..K03 K ON T.A=K.K0101 AND T.D=K.K0108 AND T.E=K.K0109 AND F=HA5009

--2023年全省农村公路评定里程为209830.664公里，其中县道32860.939公里，乡道44780.357公里，村道132189.368公里。
--all 210180.872  -350.208
--x 32909.036  		-48.097
--c 132370.216		-180.848
--y 44901.620			-121.263
SELECT b,left(a,1),sum(i/1000) 
from tk03 
where CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%市政道路%' and
			--CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%五类桥梁%' and
			--f like '%上行%' and
			--left(a,1) ='c' and 
			b like '340421%'
group by b,left(a,1)
order by b,left(a,1)	
			
SELECT sum(a5008/1000) 
from k03 
where CAST(ISNULL(a0129,'') AS VARCHAR(100)) not LIKE '%市政道路%' and
			--CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%五类桥梁%' and
			--ha5009 like '%上行%' and
			left(k0101,1) ='c'

SELECT distinct r 
from tk03


SELECT * from k03 where a0103 like '340421%' and left(k0101,1) ='y'

SELECT b,left(a,1),sum(i/1000)
from tk03 
where CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%市政道路%' and
			--CAST(ISNULL(r,'') AS VARCHAR(100)) not LIKE '%五类桥梁%' and
			--f like '%上行%' and
			--left(a,1) ='y' and 
			b like '340421%'
group by b,left(a,1)
order by b,left(a,1)	