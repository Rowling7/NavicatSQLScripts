--审核脚本
----管养单位和资产平台比较
select 
		'K060'+'&K0101 ='''+RTRIM(CAST(K0101 AS VARCHAR))+''' AND A0102='''+RTRIM(CAST(A0102 AS VARCHAR))+''' AND K6001 ='''+RTRIM(CAST(K6001 AS VARCHAR))+''''  AS 编辑,
	a0102,ha0102,k0101,k0112,k6002,k6001,k6003,a1314,rtrim(objjc) '资产平台|管养单位名称','管养单位名称不一致' '对比结果'
from k060 
left join GuanYangDanWei on a1314 = rtrim(objjc)
where rtrim(objjc) is null
AND A0102 LIKE '#A0102#%' AND A0102 LIKE '#GLDW#%'
ORDER BY A0102,K0101,K6003


-------------国道桥梁对比
----根据桥梁身份码和资产库桥梁比较
--比对属性库或者资产库不存在的数据
select
	a.a0102,
	a.ha0102,
	a.k0101,
	a.k0112,
	rtrim(replace(replace( replace( replace( a.k0101, 'D003', '' ), 'D002', '' ), 'D001', '' ),	'000000','' ) ) + rtrim( a.a0103 ) + 'L' + rtrim( a.k6001 ) k6001,
	a.k6002,
	a.k6003,
	b.k0101 [资产平台路线编码],
	b.k0112 [资产平台路线编名称],
	b.k6001 [资产平台桥梁编码],
	b.k6002 [资产平台桥梁名称],
	b.k6003 [资产平台桥梁位置桩号],
case 	when a.a0102 is not null then'年报属性库存在而资产库不存在的桥梁' else '资产库存在而年报属性库不存在的桥梁' end '对比结果'
from 
( select * from K060 where left(k0101,1)='G') a
full join ( select * from ZCPT_K060 where left(k0101,1)='G') b on a.k6040=b.k6040 
where (a.a0102 is null or b.k6001 is null)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'


--比对路线编码、路线名称、桥梁编码、桥梁名称、桥梁位置桩号不一致的数据
select 
'K060' + '&K0101 =''' + RTRIM( CAST ( a.K0101 AS VARCHAR ) ) + ''' AND A0102=''' + RTRIM( CAST ( a.A0102 AS VARCHAR ) ) + ''' AND K6001 =''' + RTRIM( CAST ( a.K6001 AS VARCHAR ) ) + '''' AS 编辑,
a.a0102,
a.ha0102,
replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000','') k0101,
b.k0101 [资产平台路线编码],
a.k0112,
b.k0112 [资产平台路线名称],
rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001) k6001,
b.k6001 [资产平台桥梁编码],
a.k6002,
b.k6002 [资产平台桥梁名称],
a.k6003,
b.k6003 [资产平台桥梁位置桩号]
from 
k060 a
join ZCPT_K060 b on a.k6040=b.k6040 
where  (replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000','')<>b.K0101
or a.k0112<>b.k0112
or rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001)<>b.k6001
or a.k6002<>b.k6002 or a.k6003<>b.k6003
)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'


--比对桥梁全长、桥梁跨径总长、单孔最大跨径、跨径组和
--桥梁全宽，桥面全宽，桥面净宽，人行道宽；注：资产平台没有桥面全宽和人行道宽带
select 
		'K060'+'&K0101 ='''+RTRIM(CAST(a.K0101 AS VARCHAR))+''' AND A0102='''+RTRIM(CAST(a.A0102 AS VARCHAR))+''' AND K6001 ='''+RTRIM(CAST(a.K6001 AS VARCHAR))+''''  AS 编辑,
a.a0102,
a.ha0102,
a.k0101,
rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001) k6001,
a.k6002,
a.k6008,
b.k6008 [资产库桥梁全长],
a.K6065,
b.K6065 [资产库跨径总长],
a.K6063,
b.K6063 [资产库单孔最大跨径],
a.K6066,
b.K6066 [资产库桥梁全宽],
--isnull(a.K6067,0) k6067,isnull(b.K6067,0) [资产库桥面全宽],isnull(a.K6069,0),isnull(b.K6069,0) [资产库人行道宽],
a.K6009,
b.K6009 [资产库桥面净宽],
a.k6064,
b.k6064 [资产库跨径组和]
from 
k060 a
join ZCPT_K060 b on a.k6040=b.k6040 
where  (a.k6008<>b.k6008 or a.K6065<>b.K6065 or  a.K6063<>b.K6063 or  a.K6066<>b.K6066 or  
--isnull(a.K6067,0)<>isnull(b.K6067,0) or isnull(a.K6069,0)<>isnull(b.K6069,0) or 
a.K6009<>b.K6009 or a.k6064<>b.k6064
)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'

--比对桥梁使用类别
select 
		'K060'+'&K0101 ='''+RTRIM(CAST(a.K0101 AS VARCHAR))+''' AND A0102='''+RTRIM(CAST(a.A0102 AS VARCHAR))+''' AND K6001 ='''+RTRIM(CAST(a.K6001 AS VARCHAR))+''''  AS 编辑,
a.a0102,a.ha0102,a.k0101,rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001) k6001,a.k6002,
	a.K6007,		--桥梁跨径
	a.HK6007,		--桥梁跨径
	b.K6007,		--桥梁跨径
	b.HK6007 [资产库桥梁按跨径分类],	
	a.K6004,		--桥梁使用年限分类
	a.HK6004,		--桥梁使用年限分类
	b.K6004,		--桥梁使用年限分类
	b.HK6004 [资产库桥梁按使用年限分类]		--桥梁使用年限分类
from 
k060 a
join ZCPT_K060 b on a.k6040=b.k6040 
where  (rtrim(a.HK6007)<>rtrim(b.HK6007) or rtrim(a.HK6004)<>rtrim(b.HK6004)
)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'



--比对桥梁建筑情况-主桥上部结构，桥墩类型
select 
		'K060'+'&K0101 ='''+RTRIM(CAST(a.K0101 AS VARCHAR))+''' AND A0102='''+RTRIM(CAST(a.A0102 AS VARCHAR))+''' AND K6001 ='''+RTRIM(CAST(a.K6001 AS VARCHAR))+''''  AS 编辑,
a.a0102,a.ha0102,a.k0101,rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001) k6001,a.k6002,

	--K6016,		--桥梁上部结构类型
	a.HK6016,		--桥梁上部结构类型
	b.HK6016,		--桥梁上部结构类型
	--K6110,		--桥梁上部结构材料
	a.HK6110,		--桥梁上部结构材料
	b.HK6110,		--桥梁上部结构材料
	--K6017,		--桥梁桥墩类型
	a.HK6017,		--桥梁桥墩类型
	b.HK6017,		--桥梁桥墩类型
	--A1328,		--桥梁墩台防撞设施类型
	a.HA1328,		--桥梁墩台防撞设施类型
	b.HA1328		--桥梁墩台防撞设施类型
from 
k060 a
join ZCPT_K060 b on a.k6040=b.k6040 
where  (
	a.HK6016<>b.HK6016	
	or  a.HK6110<>b.HK6110	--桥梁上部结构材料
	or	a.HK6017<>b.HK6017		--桥梁桥墩类型
	or	a.HA1328<>b.HA1328		--桥梁墩台防撞设施类型
)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'


--比对桥梁建筑情况-，设计荷载，抗震等级，防洪标准，通航等级；备注：防洪标准没有，站不审核
select 
		'K060'+'&K0101 ='''+RTRIM(CAST(a.K0101 AS VARCHAR))+''' AND A0102='''+RTRIM(CAST(a.A0102 AS VARCHAR))+''' AND K6001 ='''+RTRIM(CAST(a.K6001 AS VARCHAR))+''''  AS 编辑,
a.a0102,a.ha0102,a.k0101,rtrim(replace(replace(replace(replace(a.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(a.a0103)+'L'+rtrim(a.k6001) k6001,a.k6002,

	--K6022,		--桥梁设计荷载
	a.HK6022,		--桥梁设计荷载
	b.HK6022,		--桥梁设计荷载
	--K6023,		--桥梁抗震等级
	a.HK6023,		--桥梁抗震等级
	b.HK6023,		--桥梁抗震等级
	--K6005,		--桥梁跨越地物类型
	a.HK6005,		--桥梁跨越地物类型
	b.HK6005,		--桥梁跨越地物类型
	a.K6006,		--桥梁跨越地物名称
	b.K6006,		--桥梁跨越地物名称
	--K0149,		--桥梁防洪标准
	--a.HK0149,		--桥梁防洪标准
	--b.HK0149,		--桥梁防洪标准
	--K6024,		--桥梁通航等级
	a.HK6024,		--桥梁通航等级
	b.HK6024		--桥梁通航等级
from 
k060 a
join ZCPT_K060 b on a.k6040=b.k6040 
where  (
	a.HK6022<>b.HK6022	--桥梁设计荷载
	or		--桥梁抗震等级
	a.HK6023<>b.HK6023		--桥梁抗震等级
	or	--桥梁跨越地物类型
	a.HK6005<>b.HK6005 		--桥梁跨越地物类型
	ora.K6006<>b.K6006		--桥梁跨越地物名称
	--or		--桥梁防洪标准
	--a.HK0149<>b.HK0149		--桥梁防洪标准
	or		--桥梁通航等级
	a.HK6024<>b.HK6024		--桥梁通航等级
)
AND a.A0102 LIKE '#A0102#%' AND a.A0102 LIKE '#GLDW#%'



