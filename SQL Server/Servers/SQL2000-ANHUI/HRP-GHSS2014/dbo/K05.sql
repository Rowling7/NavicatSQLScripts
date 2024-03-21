SELECT
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001','D'),'D002','D'),'D003','D')K0101,	路线编号,
	RTRIM(A50.K0112),	路线名称,
	convert( numeric(18,3), K05.K0105),		起点桩号,
	convert( numeric(18,3),K05.K0106),		终点桩号,
	RTRIM(OBJJC),		检测方向,
	RTRIM(HK0304),		技术等级,
	CASE WHEN K5104 IN ('11','21','22','23') THEN '沥青' WHEN K5104 IN ('12') THEN '水泥' ELSE '砂石' END,			路面类型,
	A5008,		路段长度,
	case when isnull(a5011,0)=0 then nullif(a5010,0) else nullif(a5010,0) end,			MQI,
	nullif(a5011,0),		PQI,
	case when isnull(a5011,0)=0 then nullif(a5011A,0) else nullif(a5011A,0) end,		PCI,
	case when isnull(a5011,0)=0 then nullif(a5011B,0) else nullif(a5011B,0) end,		RQI,
	case when isnull(a5011,0)=0 then nullif(a5011C,0) else nullif(a5011C,0) end,		RDI,
	case when isnull(a5011,0)=0 then nullif(a5011F,0) else nullif(a5011F,0) end,		PBI,
	case when isnull(a5011,0)=0 then nullif(a5011G,0) else nullif(a5011G,0) end,		PWI,
	case when isnull(a5011,0)=0 then nullif(a5011D,0) else nullif(a5011D,0) end,		SRI,
	case when isnull(a5011,0)=0 then nullif(a5011E,0) else nullif(a5011E,0) end,		PSSI,
	case when isnull(a5011,0)=0 then nullif(a5012,0) else  nullif(a5012,0) end,			SCI,
	case when isnull(a5011,0)=0 then nullif(a5013,0) else  nullif(a5013,0) end,			BCI,
	case when isnull(a5011,0)=0 then nullif(a5014,0) else  nullif(a5014,0) end,			TCI,
	case when k05.k0101 like '%D%' AND LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001','D'),'D002','D'),'D003','D'))=4 then '长链-'+cast(isnull(a0129,'') as varchar(100)) else cast(isnull(a0129,'') as varchar(100)) end		--备注
FROM 	K05 	LEFT JOIN D132 ON K05.A5009=D132.OBJNAME
LEFT JOIN A50 ON K05.A0102=A50.A0102 AND K05.K0101=A50.K0101
LEFT JOIN TK05 ON tK05.路线编号=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001','D'),'D002','D'),'D003','D') and tK05.起点桩号=K05.K0105 and tK05.终点桩号=K05.K0106 and RTRIM(检测方向)=RTRIM(HA5009)
WHERE	K05.A0102 LIKE '34%'
	AND LEFT(K05.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(K05.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(K05.A0101A),6,1)= '12'
AND (

	RTRIM(HK0304)<>技术等级
	OR CASE WHEN K5104 IN ('11','21','22','23') THEN '沥青' WHEN K5104 IN ('12') THEN '水泥' ELSE '砂石' END<>			路面类型
	OR A5008<>		路段长度
	OR case when isnull(a5011,0)=0 then nullif(a5010,0) else nullif(a5010,0) end<>		MQI
	OR nullif(a5011,0)<>		PQI
	OR case when isnull(a5011,0)=0 then nullif(a5011A,0) else nullif(a5011A,0) end<>		PCI
	OR case when isnull(a5011,0)=0 then nullif(a5011B,0) else nullif(a5011B,0) end<>		RQI
	OR case when isnull(a5011,0)=0 then nullif(a5011C,0) else nullif(a5011C,0) end<>		RDI
	OR case when isnull(a5011,0)=0 then nullif(a5011F,0) else nullif(a5011F,0) end<>		PBI
	OR case when isnull(a5011,0)=0 then nullif(a5011G,0) else nullif(a5011G,0) end<>		PWI
	OR case when isnull(a5011,0)=0 then nullif(a5011D,0) else nullif(a5011D,0) end<>		SRI
	OR case when isnull(a5011,0)=0 then nullif(a5011E,0) else nullif(a5011E,0) end<>		PSSI
	OR case when isnull(a5011,0)=0 then nullif(a5012,0) else  nullif(a5012,0) end<>			SCI
	OR case when isnull(a5011,0)=0 then nullif(a5013,0) else  nullif(a5013,0) end<>			BCI
	OR case when isnull(a5011,0)=0 then nullif(a5014,0) else  nullif(a5014,0) end<>			TCI


)