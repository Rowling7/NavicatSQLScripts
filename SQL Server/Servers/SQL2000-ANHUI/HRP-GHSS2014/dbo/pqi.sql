
SELECT A0102,AA,left(a0101a,6),CC,A0203,DD ,A5011,RTRIM(PQI)	,A5042,RTRIM(AA5042),A5043,RTRIM(AA5043),A5044,RTRIM(AA5044),A5045,RTRIM(AA5045),A5046,RTRIM(AA5046)
--UPDATE K04 SET A5011=RTRIM(PQI)	,A5042=RTRIM(AA5042),A5043=RTRIM(AA5043),A5044=RTRIM(AA5044),A5045=RTRIM(AA5045),A5046=RTRIM(AA5046)
FROM K04
LEFT JOIN 
(	
	select
		A0102 AA,
		MAX(ha0102) BB,
		MAX(a0101a) CC,
		LEFT(K0101,1) DD,
		CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI,
		CAST((ISNULL(SUM(CASE WHEN isnull(A5011,0)>=90 AND k0304 in ('10','11') THEN isnull(a5008,0) END)/2,0)+
		ISNULL(SUM(CASE WHEN isnull(A5011,0)>=90 AND k0304 in ('22','23','24','30')THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AA5042,
		CAST((ISNULL(SUM(CASE WHEN isnull(A5011,0)>=80  AND isnull(A5011,0)<90 AND k0304 in ('10','11') THEN isnull(a5008,0) END)/2,0)+
		ISNULL(SUM(CASE WHEN isnull(A5011,0)>=80  AND isnull(A5011,0)<90 AND k0304 in ('22','23','24','30')THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AA5043,
		CAST((ISNULL(SUM(CASE WHEN isnull(A5011,0)>=70  AND isnull(A5011,0)<80 AND k0304 in ('10','11') THEN isnull(a5008,0) END)/2,0)+
		ISNULL(SUM(CASE WHEN isnull(A5011,0)>=70  AND isnull(A5011,0)<80 AND k0304 in ('22','23','24','30')THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AA5044,
		CAST((ISNULL(SUM(CASE WHEN isnull(A5011,0)>=60  AND isnull(A5011,0)<70 AND k0304 in ('10','11') THEN isnull(a5008,0) END)/2,0)+
		ISNULL(SUM(CASE WHEN isnull(A5011,0)>=60  AND isnull(A5011,0)<70 AND k0304 in ('22','23','24','30')THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AA5045,
		CAST((ISNULL(SUM(CASE WHEN isnull(A5011,0)<60 AND k0304 in ('10','11') THEN isnull(a5008,0) END)/2,0)+
		ISNULL(SUM(CASE WHEN isnull(A5011,0)<60 AND k0304 in ('22','23','24','30')THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AA5046
	from k03 a
	where 	ISNULL(K5104,'') IN ('11','12','21','22','23') 
		and not(
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%市政道路%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%改扩建施工%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%预防养护施工%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%修复养护施工%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%其他施工-%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%其他单位-%' or 
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%缺陷责任期-%'
			)
		and left(a0101a,6)='2023'+'43' and A0102 like '34%' and A0102 like '34%'
	GROUP BY A0102,LEFT(K0101,1)
)TK04 ON AA=A0102 AND  CC= left(a0101a,6) AND A0203=DD 
WHERE left(a0101a,6)='2023'+'43'

---cast((sum(case when k0304 in ('22','23','24','30') then a5008 else 0 end)+sum(case when k0304 in ('10','11') then a5008 else 0 end)/2)/1000 as numeric(8,3))