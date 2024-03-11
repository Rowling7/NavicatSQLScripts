SELECT	'V52'+'&A0102 ='''+RTRIM(CAST(A.A0102 AS VARCHAR))+''' AND V0514='''+RTRIM(CAST(A.V0514 AS VARCHAR))+'''' AS 编辑,
	A.HV0514,
	A.HV0505,
	A.HV0513,
	B.HV0513 [本年下发数据是否已通双车道]
FROM V52 A LEFT JOIN JZC B ON A.KWYID=B.KWYID
WHERE 
	(
		(B.A0102 IS NULL AND B.V0514 IS NULL)
		OR ISNULL(A.V0513,'')<>ISNULL(B.V0513,'')
	)
	AND A.A0102 LIKE '#A0102#%' AND A.A0102 LIKE '#GLDW#%'
ORDER BY B.V0513




SELECT  'V53'+'&A0102 ='''+RTRIM(CAST(v53.A0102 AS VARCHAR))+''' AND V0514='''+RTRIM(CAST(v53.V0514 AS VARCHAR))+''' AND V5701='''+RTRIM(CAST(v53.V5701 AS VARCHAR))+'''' AS 编辑,
v53.a0102 a0102,v53.Ha0102 Ha0102,
v53.V0514 V0514,v53.HV0514 HV0514,
v53.V5701 V5701,v53.HV5701 HV5701,
v53.v5708 v5708,v53.Hv5708 Hv5708,
zrc.v5708 '上一年通达情况|代码',zrc.Hv5708 '上一年通达情况|汉字',
sxzb.TDQK '三项指标|通达情况',sxzb.HTDQK '三项指标| 通达情况',
CASE WHEN SXZB.NBTABLE is null THEN '请核实通达情况是否属实'	ELSE 'error' END '审核说明'
from V53
LEFT JOIN zrc on v53.V5701=zrc.V5701
left join sxzb on v53.V5701 =sxzb.xzdm
where  isnull(v53.v5708,'9999')<>isnull(zrc.v5708,'9999')
AND NBTABLE IS NULL  and  v53.A0102 LIKE '#A0102#%' AND v53.A0102 LIKE '#GLDW#%'