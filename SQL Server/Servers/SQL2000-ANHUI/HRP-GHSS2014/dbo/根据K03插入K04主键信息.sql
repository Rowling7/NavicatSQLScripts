--根据K03插入K04主键信息
INSERT INTO [dbo].[K04] ([A0102], [HA0102], [A0203], [HA0203],[A0101A], [HA0101A] )
	SELECT rtrim(a0102) a0102,rtrim(HA0102) HA0102,left(k0101,1) k0101,case when left(k0101,1)='x' then '县道'  when left(k0101,1)='y' then '乡道'when left(k0101,1)='c' then '村道'else '专用公路' end,'202443','2024年12月'
	from k03 
	where not(
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%市政道路%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%改扩建施工%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%预防养护施工%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%修复养护施工%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%其他施工-%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%其他单位-%' or
				CAST(ISNULL(A0129,'') AS VARCHAR(100)) LIKE '%缺陷责任期-%'
			)
	GROUP BY rtrim(a0102),rtrim(HA0102),left(k0101,1)

