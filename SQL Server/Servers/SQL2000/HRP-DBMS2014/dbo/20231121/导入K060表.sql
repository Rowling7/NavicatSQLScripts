
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K060]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K060]
CREATE TABLE ZCPT_K060(
	[A0102] [char](9) NULL,
	[HA0102] [char](50) NULL,
	[K0101] [char](15) null,  --路线编码
	[A0101] [char](4) NULL,		--时间
	[HA0101] [char](10) NULL,	--时间
	[K0112] [char](60) NULL,	--路线名称
	[K6003] [numeric](18, 3) null,--位置桩号
	[K6001] [char](50) null,	--桥梁代码
	[K6002] [char](100) null,	--桥梁名称
	[A0103] [char](12) NULL,	--行政区划
	[HA0103] [char](50) NULL,	--行政区划
	[K6028] [char](1) NULL,		--桥梁评定等级
	[HK6028] [char](20) NULL,	--桥梁评定等级
	[K6006] [char](40) NULL,	--桥梁跨越地物名称
	[K6005] [char](1) NULL,		--桥梁跨越地物类型
	[HK6005] [char](28) NULL,	--桥梁跨越地物类型
	[K0304] [char](2) NULL,		--所属路线技术等级
	[HK0304] [char](4) NULL,	--所属路线技术等级
	[K6080] [char](1) NULL,
	[HK6080] [char](15) NULL,
	[K6004] [char](1) NULL,		--桥梁使用年限分类
	[HK6004] [char](14) NULL,	--桥梁使用年限分类
	[K6007] [char](1) NULL,		--桥梁跨径
	[HK6007] [char](6) NULL,	--桥梁跨径
	[A1302] [char](3) NULL,		--桥梁收费性质
	[HA1302] [char](20) NULL,	--桥梁收费性质
	[A1305] [char](8) NULL,			--桥梁评定日期
	[K6062] [char](1) NULL,			--是否互通立交
	[HK6062] [char](12) NULL,		--是否互通立交
	[A1307] [char](3) NULL,			--桥梁交通管制
	[HA1307] [char](20) NULL,		--桥梁交通管制
	[K6008] [numeric](18, 2) NULL,  --桥梁全长
	[K6065] [numeric](18, 2) NULL,  --桥梁跨径总长
	[K6063] [numeric](18, 2) NULL,  --桥梁单孔最大跨径
	[K6064] [char](250) NULL,		--桥梁跨径组合
	[K6066] [numeric](18, 2) NULL,	--桥梁全宽
	[K6009] [numeric](18, 2) NULL,	--桥梁净宽
	[K6016] [char](4) NULL,			--桥梁上部结构类型
	[HK6016] [char](22) NULL,		--桥梁上部结构类型
	[A1306] [char](102) NULL,		--桥梁当前主要病害
	[HA1306] [char](200) NULL,		--桥梁当前主要病害
	[K6102] [char](200) NULL,		--桥梁主要病害描述
	[K6017] [char](2) NULL,			--桥梁桥墩类型
	[HK6017] [char](10) NULL,		--桥梁桥墩类型
	[A1328] [char](3) NULL,			--桥梁墩台防撞设施类型
	[HA1328] [char](6) NULL,		--桥梁墩台防撞设施类型
	[K6022] [char](2) NULL,			--桥梁设计荷载
	[HK6022] [char](16) NULL,		--桥梁设计荷载
	[K6023] [char](3) NULL,			--桥梁抗震等级
	[HK6023] [char](20) NULL,		--桥梁抗震等级
	[K6024] [char](2) NULL,			--桥梁通航等级
	[HK6024] [char](8) NULL,		--桥梁通航等级
	[A1317] [char](102) NULL,		--桥梁改造部位
	[HA1317] [char](200) NULL,		--桥梁改造部位
	[A1316] [char](8) NULL,			--桥梁改造完工日期
	[A1318] [char](3) NULL,			--桥梁改造工程性质
	[HA1318] [char](20) NULL,		--桥梁改造工程性质
	[A1319] [char](1) NULL,			--桥梁改造是否部补助项目
	[HA1319] [char](4) NULL,		--桥梁改造是否部补助项目
	[A1313] [char](3) NULL,			--管养单位性质
	[HA1313] [char](34) NULL,		--管养单位性质
	[A1314] [char](100) NULL,		--管养单位名称
	[K6079] [char](100) NULL,		--桥梁建设单位
	[K6030] [char](100) NULL,		--桥梁设计单位
	[K6031] [char](200) NULL,		--桥梁施工单位
	[K6032] [char](100) NULL,		--桥梁监理单位
	[K0116] [char](8) NULL,			--桥梁通车日期
	[A3219] [char](2) NULL,
	[HA3219] [char](10) NULL,
	[K0199] [text] NULL,
	[A9902] [char](9) NULL,
	[HA9902] [char](50) NULL,
	[A9903] [char](15) NULL,
	[A9904] [char](1) NULL,
	[HA9904] [char](20) NULL,
	[A9905] [numeric](18, 3) NULL,
	[A9906] [char](1) NULL,
	[HA9906] [char](4) NULL,
	[A9908] [numeric](18, 3) NULL,
	[A9907] [char](1) NULL,
	[HA9907] [char](4) NULL,
	[K0180] [char](4) NULL,		--桥梁修建年度
	[K0181] [char](4) NULL,		--桥梁改造年度
	[K0185] [numeric](12, 8) NULL,
	[K0186] [numeric](12, 8) NULL,
	[InsertLogin] [char](30) NULL,
	[ModifyLogin] [char](30) NULL,
	[K6110] [char](2) NULL,		--桥梁上部结构材料
	[HK6110] [char](20) NULL,	--桥梁上部结构材料
	[K6111] [char](100) NULL,	--桥梁监管单位名称
	[K3912] [char](2) NULL,
	[HK3912] [char](22) NULL,
	[KWYID] [char](100) NULL,
	[K6051] [char](200) NULL,		--桥梁改造施工单位
	[K6050] [char](100) NULL,		--桥梁评定单位
	[K6117] [char](1) NULL,			--桥梁所在位置
	[HK6117] [char](4) NULL,		--桥梁所在位置
	[K6118] [char](1) NULL,			--桥梁是否宽路窄桥
	[HK6118] [char](4) NULL,		--桥梁是否宽路窄桥
	[K6119] [char](1) NULL,			--桥梁是否在长大桥梁目录中
	[HK6119] [char](4) NULL,		--桥梁是否在长大桥梁目录中
	[K6120] [char](1) NULL,			--桥梁是否跨省桥梁
	[HK6120] [char](4) NULL,		--桥梁是否跨省桥梁
	[A1331] [char](1) NULL,
	[HA1331] [char](4) NULL,
	[K6067] [numeric](18, 2) NULL,
	[K0149] [char](1) NULL,			--桥梁防洪标准
	[HK0149] [char](10) NULL,		--桥梁防洪标准
	[K6041] [char](1) NULL,			--桥梁是否公铁两用
	[HK6041] [char](4) NULL,		--桥梁是否公铁两用
	[K6040] [char](100) NULL,		--桥梁身份码
	[K6121] [char](2) NULL,
	[HK6121] [char](8) NULL
	)
	
-- 插入资产平台桥梁数据
insert into ZCPT_K060(
	K6002,		--桥梁名称
	K6001,		--桥梁代码
	K6003,		--桥梁中桩号
	K0101,		--路线编码
	K0112,		--路线名称
	K0304,		--所属路线技术等级
	HK0304,		--所属路线技术等级
	K6008,		--桥梁全长
	K6065,		--桥梁跨径总长
	K6063,		--桥梁单孔最大跨径
	K6064,		--桥梁跨径组合
	K6066,		--桥梁全宽
	K6009,		--桥梁净宽
	K6007,		--桥梁跨径
	HK6007,		--桥梁跨径
	K6004,		--桥梁使用年限分类
	HK6004,		--桥梁使用年限分类
	K6016,		--桥梁上部结构类型
	HK6016,		--桥梁上部结构类型
	K6110,		--桥梁上部结构材料
	HK6110,		--桥梁上部结构材料
	K6017,		--桥梁桥墩类型
	HK6017,		--桥梁桥墩类型
	K6022,		--桥梁设计荷载
	HK6022,		--桥梁设计荷载
	K6023,		--桥梁抗震等级
	HK6023,		--桥梁抗震等级
	K6005,		--桥梁跨越地物类型
	HK6005,		--桥梁跨越地物类型
	K6006,		--桥梁跨越地物名称
	K0149,		--桥梁防洪标准
	HK0149,		--桥梁防洪标准
	K6024,		--桥梁通航等级
	HK6024,		--桥梁通航等级
	A1328,		--桥梁墩台防撞设施类型
	HA1328,		--桥梁墩台防撞设施类型
	K6062,		--是否互通立交
	HK6062,		--是否互通立交
	K6079,		--桥梁建设单位
	K6030,		--桥梁设计单位
	K6031,		--桥梁施工单位
	K6032,		--桥梁监理单位
	K0180,		--桥梁修建年度
	K0116,		--桥梁通车日期
	A1313,		--管养单位性质
	HA1313,		--管养单位性质
	A1314,		--管养单位名称
	K6111,		--桥梁监管单位名称
	A1302,		--桥梁收费性质
	HA1302,		--桥梁收费性质
	K6028,		--桥梁评定等级
	HK6028,		--桥梁评定等级
	A1305,		--桥梁评定日期
	K6050,		--桥梁评定单位
	K0181,		--桥梁改造年度
	A1316,		--桥梁改造完工日期
	A1317,		--桥梁改造部位
	HA1317,		--桥梁改造部位
	A1318,		--桥梁改造工程性质
	HA1318,		--桥梁改造工程性质
	K6051,		--桥梁改造施工单位
	A1319,		--桥梁改造是否部补助项目
	HA1319,		--桥梁改造是否部补助项目
	A1306,		--桥梁当前主要病害
	HA1306,		--桥梁当前主要病害
	K6102,		--桥梁主要病害描述
	A1307,		--桥梁交通管制
	HA1307,		--桥梁交通管制
	A0103,		--行政区划
	HA0103,		--行政区划
	K6117,		--桥梁所在位置
	HK6117,		--桥梁所在位置
	K6118,		--桥梁是否宽路窄桥
	HK6118,		--桥梁是否宽路窄桥
	K6119,		--桥梁是否在长大桥梁目录中
	HK6119,		--桥梁是否在长大桥梁目录中
	K6120,		--桥梁是否跨省桥梁
	HK6120,		--桥梁是否跨省桥梁
	K6041,		--桥梁是否公铁两用
	HK6041,		--桥梁是否公铁两用
	K6040,		--桥梁身份码
	a0101
	)
select [桥梁明细表],F2,F3,F4,F5,'',F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,left(F17,2),F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,'',F30,'',rtrim(F31),'',F32,'',F33,
F34,F35,F36,F37,left(F38,4),replace(F39,'-',''),'','',F42,F43,F44,F45,F46,F47,replace(F48,'-',''),F49,F50,replace(F51,'-',''),
'',F52,'',F53,F54,'',F55,'',F56,F57,F58,F59,F60,F61,
'',F62,'',F63,'',F64,'',F65,'',F66, case when len(F67)>0 then F67 when len(F67)=0 or F67 is null then null end,--,F68,F69,F70,F71,F72,F73,F74,F75,F76,F77,F78,F79,F80,F81,F82,F83,F84,F85,F86,F87,F88,F89
null
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\3.安徽工作文件\20231030 导入路段表\Report资产库桥梁明细表 (黄山区) (2).xls',明细表$)

------修改属性数据  
-----开始
--修改桥梁技术等级
update a set hk6028=objjc 
from ZCPT_K060 a
left join DK6014 on dk6014.objname=k6028
--修改桥梁所属路线技术等级
update a set k0304=objname 
from ZCPT_K060 a
left join DK0301 on DK0301.objjc=hk0304
--修改桥梁防护类型
update a set a1328=objname 
from ZCPT_K060 a
left join WQ009 on objjc=ha1328
--修改桥梁防震等级
update a set hk6023=objjc 
from ZCPT_K060 a
left join WQ008 on objname=k6023
--更新桥梁上部结构
update a set k6016=objname
from ZCPT_K060 a
left join WQ007 on objjc=Hk6016
--更新桥梁通航等级
update ZCPT_K060 set Hk6024=left(Hk6024,2) where isnull(Hk6024,'')<> '不通航'
update a set k6024=objname
from ZCPT_K060 a
left join DK6012 on objjc=Hk6024
--更新桥梁改造部位
update a set A1317=objname
from ZCPT_K060 a
left join WQ001 on objjc=HA1317
--更新桥梁改造工程性质
update a set A1318=objname
from ZCPT_K060 a
left join WQ005 on objjc=HA1318
--更新桥梁使用年限
update a set HK6004=objjc
from ZCPT_K060 a
left join DK6001 on objname=K6004
--更新桥梁设计荷载
update a set HK6022=objjc
from ZCPT_K060 a
left join Wq010 on objname=K6022
--更新桥梁跨越物类型
update a set HK6005=objjc
from ZCPT_K060 a
left join DK6002 on objname=K6005
--修改管理单位信息
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from ZCPT_K060 a
left join k001 b on a.k0101=rtrim(replace(replace(replace(replace(replace(b.k0101,'D003',''),'D002',''),'D001',''),'000000',''),'340000','')) and a.k6003>=b.k0108 and a.k6003<b.k0109
--修改所以判断
update ZCPT_K060
set k6062=case when isnull(hk6062,'')='是' then '1' when isnull(hk6062,'')='否' then 2 else '' end,
a1319=case when isnull(ha1319,'')='是' then '1' when isnull(ha1319,'')='否' then 2 else '' end,
k6118=case when isnull(hk6118,'')='是' then '1' when isnull(hk6118,'')='否' then 2 else '' end,
k6119=case when isnull(hk6119,'')='是' then '1' when isnull(hk6119,'')='否' then 2 else '' end,
k6041=case when isnull(hk6041,'')='是' then '1' when isnull(hk6041,'')='否' then 2 else '' end,
k6120=case when isnull(hk6120,'')='是' then '1' when isnull(hk6120,'')='否' then 2 else '' end
-----结束
------修改属性数据  
