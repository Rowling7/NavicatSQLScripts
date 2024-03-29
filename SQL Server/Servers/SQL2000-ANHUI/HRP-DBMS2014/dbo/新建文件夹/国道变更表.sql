--出本年路段表

--DROP TABLE #TEMP1
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#TEMP1'))
DROP TABLE #TEMP1
SELECT	
	K0101,
	'20221230'	A,
	'未变'		B,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(K001.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(K001.A0102,2)+'0000','') 
	END		C,
	K0108		D,
	K0109		E,
	K0114		F,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			G,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(K001.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(K001.A0102,2)+'0000','')
	END		H,
	K0108		I,
	K0109		J,
	K0114		K,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			L,
	'无变化'	M,
	RTRIM(A0133)	N,
	RTRIM(A0122)	O,
	NULL		P
INTO #TEMP1
FROM K001 LEFT JOIN A01 ON K001.A0102=A01.A0102
WHERE LEFT(K0101,1)='G' AND ISNULL(K0124,'')='' AND ISNULL(K0123,'2')='2' AND ISNULL(k0180,'')<>'2022' AND K0101 NOT LIKE '%ZD%'
ORDER BY K0101,K0108


EXEC('ALTER TABLE #TEMP1 ADD TID INT')

CREATE CLUSTERED INDEX #TEMP1
	ON #TEMP1 (K0101,D)

		
DECLARE @IW1 INT,@PARENTID1 CHAR(15),@ZH NUMERIC(18,3)
SET @IW1=0
UPDATE #TEMP1
SET 
	@IW1 = CASE WHEN @PARENTID1=K0101 AND D=@ZH THEN @IW1 ELSE @IW1+1 END,
	@PARENTID1 =K0101,
	@ZH=E,
	TID=@IW1 
		
SELECT
	MAX(A),
	MAX(B),
	MAX(C),
	MIN(D),
	MAX(E),
	SUM(F),
	MAX(G),
	MAX(H),
	MIN(I),
	MAX(J),
	SUM(K),
	MAX(L),
	MAX(M),
	MAX(N),
	MAX(O)
FROM #TEMP1
GROUP BY TID
ORDER BY MAX(C),MIN(D)


--出上年路段表



if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#TEMP1'))
DROP TABLE #TEMP1

SELECT	
	K0101,
	'20221230'	A,
	'未变'		B,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(A.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(A.A0102,2)+'0000','') 
	END		C,
	K0108		D,
	K0109		E,
	K0114		F,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			G,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(A.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(A.A0102,2)+'0000','')
	END		H,
	K0108		I,
	K0109		J,
	K0114		K,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			L,
	'无变化'	M,
	RTRIM(A0133)	N,
	RTRIM(A0122)	O,
	NULL		P
INTO #TEMP1
FROM [HRP-DBMS2014-2022年报]..K001 A LEFT JOIN [HRP-DBMS2014-2022年报]..A01 B ON A.A0102=B.A0102
WHERE LEFT(K0101,1)='G' AND ISNULL(K0124,'')='' AND ISNULL(K0123,'2')='2' AND K0101 NOT LIKE '%ZD%'
ORDER BY K0101,K0108


EXEC('ALTER TABLE #TEMP1 ADD TID INT')

CREATE CLUSTERED INDEX #TEMP1
	ON #TEMP1 (K0101,D)

		
DECLARE @IW1 INT,@PARENTID1 CHAR(15),@ZH NUMERIC(18,3)
SET @IW1=0
UPDATE #TEMP1
SET 
	@IW1 = CASE WHEN @PARENTID1=K0101 AND D=@ZH THEN @IW1 ELSE @IW1+1 END,
	@PARENTID1 =K0101,
	@ZH=E,
	TID=@IW1 
		
SELECT
	MAX(A),
	MAX(B),
	MAX(C),
	MIN(D),
	MAX(E),
	SUM(F),
	MAX(G),
	MAX(H),
	MIN(I),
	MAX(J),
	SUM(K),
	MAX(L),
	MAX(M),
	MAX(N),
	MAX(O)
FROM #TEMP1
GROUP BY TID
ORDER BY MAX(C),MIN(D)


--出本年新建路段

if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#TEMP1'))
DROP TABLE #TEMP1

SELECT	
	K0101,
	'20221230'	A,
	'新增'		B,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(K001.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(K001.A0102,2)+'0000','') 
	END		C,
	K0108		D,
	K0109		E,
	K0114		F,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			G,
	CASE WHEN LEN(K0101)=10 AND LEFT(K0101,1) IN ('G','S') THEN LEFT(K0101,4) 
		WHEN CHARINDEX('D00',K0101) <> 0 THEN REPLACE(REPLACE(RTRIM(LEFT(K0101,CHARINDEX('D00',K0101)-1)),'000000',''),LEFT(K001.A0102,2)+'0000','') 
	ELSE REPLACE(REPLACE(REPLACE(RTRIM(K0101),'000000',''),'00000',''),LEFT(K001.A0102,2)+'0000','')
	END		H,
	K0108		I,
	K0109		J,
	K0114		K,
	 CASE WHEN CHARINDEX('D00',K0101) <> 0 THEN '是' ELSE '否' END
			L,
	'本年新建'	M,
	RTRIM(A0133)	N,
	RTRIM(A0122)	O,
	NULL		P
INTO #TEMP1
FROM K001 LEFT JOIN A01 ON K001.A0102=A01.A0102
WHERE LEFT(K0101,1)='G' AND ISNULL(K0124,'')='' AND ISNULL(K0123,'2')='2' AND ISNULL(k0180,'')='2022' AND K0101 NOT LIKE '%ZD%'
ORDER BY K0101,K0108


EXEC('ALTER TABLE #TEMP1 ADD TID INT')

CREATE CLUSTERED INDEX #TEMP1
	ON #TEMP1 (K0101,D)

		
DECLARE @IW1 INT,@PARENTID1 CHAR(15),@ZH NUMERIC(18,3)
SET @IW1=0
UPDATE #TEMP1
SET 
	@IW1 = CASE WHEN @PARENTID1=K0101 AND D=@ZH THEN @IW1 ELSE @IW1+1 END,
	@PARENTID1 =K0101,
	@ZH=E,
	TID=@IW1 
		
SELECT
	MAX(A),
	MAX(B),
	'',
	'',
	'',
	'',
	'',
	MAX(H),
	MIN(I),
	MAX(J),
	SUM(K),
	MAX(L),
	MAX(M),
	MAX(N),
	MAX(O)
FROM #TEMP1
GROUP BY TID
ORDER BY MAX(C),MIN(D)