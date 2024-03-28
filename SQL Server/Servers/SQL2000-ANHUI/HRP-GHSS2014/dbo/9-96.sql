/*不显示零*/
SELECT  distinct
	[COL03] = RTRIM(K0112), 	--路线标准名称
	[COL01] = RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),	--路线代码
	[COL04] = RTRIM(K0110),		--路段起点名称
	[COL05] = RTRIM(K0111),		--路段止点名称
	[COL08] = K0114 ,		--里程
	[COL12] = REPLACE(REPLACE(REPLACE(REPLACE(RTRIM(K0404),'A','10'),'C','12'),'E','14'),'G','16'),		--车道分类代码
	[COL18] = K0306,		--设计时速
	[COL15] = K4002,		--路基宽度
	[COL14] = RTRIM(HK5104),	--面层类型
	[COL10] = RTRIM(HK0304),	--技术等级
	[COL06] = K0108,		--路段起点桩号
	[COL07] = K0109,		--路段止点桩号 
	b.k6002
FROM K01 
LEFT JOIN (
SELECT RTRIM(K6002)K6002,K6003,RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))K01011,k60.hk6007,k60.hk6117
from k60 
where LEFT(K60.K0101,1) IN ('G','H','S','T')  and k60.k6007='1' 
) b on RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(k01.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=b.k01011
AND b.K6003>=k01.K0108 AND b.K6003<=k01.K0109
WHERE	A0102 LIKE '34%' AND
	LEFT(K0101,1) IN ('G','S','H','T') 

/*
SELECT sum(isnull(K0114,0))
from [HRP-GHSS2014-2022年报]..k01 
where 	LEFT(K0101,1) IN ('G','S','H','T') 

*/