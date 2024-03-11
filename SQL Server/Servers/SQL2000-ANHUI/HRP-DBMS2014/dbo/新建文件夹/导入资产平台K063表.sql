IF OBJECT_ID('TEMPDB..##TK63') IS NOT NULL
DROP TABLE ##TK063
DECLARE @SoftPath VARCHAR(255);
DECLARE @FilePath VARCHAR(255);
exec master..xp_regread	'HKEY_LOCAL_MACHINE'
	,'Software\　东方永德\HRP-GHSS\标准版\单机版\2014'
	,'Path' , @SoftPath OUTPUT
set @FilePath=@SoftPath+'资产平台隧道明细表.xls'
DECLARE @query NVARCHAR(1000);
SET @query = 
    'SELECT 
        *
				into ##TK063
    FROM OPENROWSET(''Microsoft.jet.OLEDB.4.0'', ''Excel 5.0;Database=' + @FilePath + ';HDR=YES'', ''SELECT * FROM [明细表$]'')';

EXEC(@query);

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K063]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K063]
GO

CREATE TABLE [dbo].[ZCPT_K063] (
	[A0102] char(9) COLLATE Chinese_PRC_CI_AS   NULL,
	[HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6302] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [SDDM] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6303] numeric(18,3)  NULL,
  [k0101] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
  [k0304] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6305] numeric(18,2)  NULL,
  [K6306] numeric(18,2)  NULL,
  [K6307] numeric(18,2)  NULL,
  [K6304] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6304] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6335] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6079] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6030] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6031] char(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6032] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K0116] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [A1313] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [A0130] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6111] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6346] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6344] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [K6345] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [hK6336] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6347] char(8) COLLATE Chinese_PRC_CI_AS NULL,
  [K6348] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [HK6349] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6350] char(8) COLLATE Chinese_PRC_CI_AS NULL,
  [K6351] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [HK6352] char(30) COLLATE Chinese_PRC_CI_AS NULL,
  [K6353] char(8) COLLATE Chinese_PRC_CI_AS NULL,
	[K6354] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [K0181] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [A1316] char(8) COLLATE Chinese_PRC_CI_AS NULL,
	[K6337] char(40) COLLATE Chinese_PRC_CI_AS NULL,
  [A1318] char(5) COLLATE Chinese_PRC_CI_AS NULL,
	[K6338] char(40) COLLATE Chinese_PRC_CI_AS NULL,
  [K6339] char(200) COLLATE Chinese_PRC_CI_AS NULL,
	[A0103] char(12) COLLATE Chinese_PRC_CI_AS NULL,
  [K6370] char(50) COLLATE Chinese_PRC_CI_AS NULL,
  [K6355] char(2) COLLATE Chinese_PRC_CI_AS NULL,
  [K6371] char(2) COLLATE Chinese_PRC_CI_AS NULL,
  [K0199] text COLLATE Chinese_PRC_CI_AS NULL,
  [SDGCS] char(6) COLLATE Chinese_PRC_CI_AS NULL,
  [K0185] numeric(12,8) NULL,
  [K0186] numeric(12,8) NULL,
  [K6343] char(4) COLLATE Chinese_PRC_CI_AS NULL	
)
GO



TRUNCATE table zcpt_k063
INSERT INTO zcpt_k063(
K6302,-- 隧道名称
SDDM,-- 隧道代码
K6303,-- 隧道入口桩号
k0101,-- 路线编号
K0112,-- 路线名称
k0304,-- 技术等级
K6305,-- 隧道长度（米）
K6306,-- 隧道净宽（米）
K6307,-- 隧道净高（米）
K6304,-- 按隧道长度分类
hK6304,-- 按隧道长度分类
K6335,-- 是否水下隧道
K0180,-- 修建年度
K6079,-- 建设单位名称
K6030,-- 设计单位名称
K6031,-- 施工单位名称
K6032,-- 监理单位名称
K0116,-- 建成通车时间
A1313,-- 单位性质代码
A0130,-- 名称
K6111,-- 监管单位名称
hK6346,-- 评定等级
K6344,-- 评定日期
K6345,-- 评定单位
hK6336,-- 评定等级
K6347,-- 评定日期
K6348,-- 评定单位
hK6349,-- 评定等级
K6350,-- 评定日期
K6351,-- 评定单位
hK6352,-- 评定等级
K6353,-- 评定日期
K6354,-- 评定单位
K0181,-- 改造年度
A1316,-- 完工日期
K6337,-- 改造部位
A1318,-- 工程性质
K6338,-- 病害部位
K6339,-- 病害描述
A0103,-- 所在政区代码
K6370,-- 隧道所在位置
K6355,-- 是否在长大隧道目录中
K6371,-- 是否跨省隧道
K0199,-- 备注
SDGCS,-- 隧道工程师
K0185,-- 经度
K0186,-- 纬度
K6343-- 隧道养护等级
)
SELECT
case when len(隧道名称) >0 then 隧道名称 when len(隧道名称) =0 or 隧道名称 is null then null end 隧道名称	,
case when len(隧道代码) >0 then 隧道代码 when len(隧道代码) =0 or 隧道代码 is null then null end 隧道代码	,
case when len(隧道入口桩号) >0 then 隧道入口桩号 when len(隧道入口桩号) =0 or 隧道入口桩号 is null then null end 隧道入口桩号	,
case when len(rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) >0 then rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) when len(rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) =0 or rtrim(replace(replace(replace(replace(replace(路线编号,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) is null then null end 路线编号	,
case when len(路线名称) >0 then 路线名称 when len(路线名称) =0 or 路线名称 is null then null end 路线名称	,
case when len(技术等级) >0 then 技术等级 when len(技术等级) =0 or 技术等级 is null then null end 技术等级	,
case when len(隧道长度) >0 then 隧道长度 when len(隧道长度) =0 or 隧道长度 is null then null end 隧道长度	,
case when len(隧道净宽) >0 then 隧道净宽 when len(隧道净宽) =0 or 隧道净宽 is null then null end 隧道净宽	,
case when len(隧道净高) >0 then 隧道净高 when len(隧道净高) =0 or 隧道净高 is null then null end 隧道净高	,
case when len(按隧道长度分类1) >0 then 按隧道长度分类1 when len(按隧道长度分类1) =0 or 按隧道长度分类1 is null then null end 按隧道长度分类1	,
case when len(按隧道长度分类) >0 then 按隧道长度分类 when len(按隧道长度分类) =0 or 按隧道长度分类 is null then null end 按隧道长度分类	,
case when len(是否水下隧道) >0 then 是否水下隧道 when len(是否水下隧道) =0 or 是否水下隧道 is null then null end 是否水下隧道	,
case when len(REPLACE(修建年度, '-' ,'')) >0 then REPLACE(修建年度, '-' ,'') when len(REPLACE(修建年度, '-' ,'')) =0 or REPLACE(修建年度, '-' ,'') is null then null end 修建年度	,
case when len(建设单位名称) >0 then 建设单位名称 when len(建设单位名称) =0 or 建设单位名称 is null then null end 建设单位名称	,
case when len(设计单位名称) >0 then 设计单位名称 when len(设计单位名称) =0 or 设计单位名称 is null then null end 设计单位名称	,
case when len(施工单位名称) >0 then 施工单位名称 when len(施工单位名称) =0 or 施工单位名称 is null then null end 施工单位名称	,
case when len(监理单位名称) >0 then 监理单位名称 when len(监理单位名称) =0 or 监理单位名称 is null then null end 监理单位名称	,
case when len(REPLACE(建成通车时间, '-' ,'')) >0 then REPLACE(建成通车时间, '-' ,'') when len(REPLACE(建成通车时间, '-' ,'')) =0 or REPLACE(建成通车时间, '-' ,'') is null then null end 建成通车时间	,
case when len(单位性质代码) >0 then 单位性质代码 when len(单位性质代码) =0 or 单位性质代码 is null then null end 单位性质代码	,
case when len(名称) >0 then 名称 when len(名称) =0 or 名称 is null then null end 名称	,
case when len(监管单位名称) >0 then 监管单位名称 when len(监管单位名称) =0 or 监管单位名称 is null then null end 监管单位名称	,
case when len(评定等级总体) >0 then 评定等级总体 when len(评定等级总体) =0 or 评定等级总体 is null then null end 评定等级总体	,
case when len(REPLACE(评定日期总体, '-', '')) >0 then REPLACE(评定日期总体, '-', '') when len(REPLACE(评定日期总体, '-', '')) =0 or REPLACE(评定日期总体, '-', '') is null then null end 评定日期总体	,
case when len(评定单位总体) >0 then 评定单位总体 when len(评定单位总体) =0 or 评定单位总体 is null then null end 评定单位总体	,
case when len(评定等级土建结构) >0 then 评定等级土建结构 when len(评定等级土建结构) =0 or 评定等级土建结构 is null then null end 评定等级土建结构	,
case when len(REPLACE(评定日期土建结构, '-', '')) >0 then REPLACE(评定日期土建结构, '-', '') when len(REPLACE(评定日期土建结构, '-', '')) =0 or REPLACE(评定日期土建结构, '-', '') is null then null end 评定日期土建结构	,
case when len(评定单位土建结构) >0 then 评定单位土建结构 when len(评定单位土建结构) =0 or 评定单位土建结构 is null then null end 评定单位土建结构	,
case when len(评定等级机电设施) >0 then 评定等级机电设施 when len(评定等级机电设施) =0 or 评定等级机电设施 is null then null end 评定等级机电设施	,
case when len(REPLACE(评定日期机电设施, '-', '')) >0 then REPLACE(评定日期机电设施, '-', '') when len(REPLACE(评定日期机电设施, '-', '')) =0 or REPLACE(评定日期机电设施, '-', '') is null then null end 评定日期机电设施	,
case when len(评定单位机电设施) >0 then 评定单位机电设施 when len(评定单位机电设施) =0 or 评定单位机电设施 is null then null end 评定单位机电设施	,
case when len(评定等级其他工程设施) >0 then 评定等级其他工程设施 when len(评定等级其他工程设施) =0 or 评定等级其他工程设施 is null then null end 评定等级其他工程设施	,
case when len(REPLACE(评定日期其他工程设施, '-', '') ) >0 then REPLACE(评定日期其他工程设施, '-', '')  when len(REPLACE(评定日期其他工程设施, '-', '') ) =0 or REPLACE(评定日期其他工程设施, '-', '')  is null then null end 评定日期其他工程设施	,
case when len(评定单位其他工程设施) >0 then 评定单位其他工程设施 when len(评定单位其他工程设施) =0 or 评定单位其他工程设施 is null then null end 评定单位其他工程设施	,
case when len(改造年度) >0 then 改造年度 when len(改造年度) =0 or 改造年度 is null then null end 改造年度	,
case when len(REPLACE(完工日期 ,'-' ,'')) >0 then REPLACE(完工日期 ,'-' ,'') when len(REPLACE(完工日期 ,'-' ,'')) =0 or REPLACE(完工日期 ,'-' ,'') is null then null end  完工日期	,
case when len(改造部位) >0 then 改造部位 when len(改造部位) =0 or 改造部位 is null then null end 改造部位	,
case when len(工程性质) >0 then 工程性质 when len(工程性质) =0 or 工程性质 is null then null end 工程性质	,
case when len(病害部位) >0 then 病害部位 when len(病害部位) =0 or 病害部位 is null then null end 病害部位	,
case when len(病害描述) >0 then 病害描述 when len(病害描述) =0 or 病害描述 is null then null end 病害描述	,
case when len(所在政区代码) >0 then 所在政区代码 when len(所在政区代码) =0 or 所在政区代码 is null then null end 所在政区代码	,
case when len(隧道所在位置) >0 then 隧道所在位置 when len(隧道所在位置) =0 or 隧道所在位置 is null then null end 隧道所在位置	,
case when len(是否在长大隧道目录中) >0 then 是否在长大隧道目录中 when len(是否在长大隧道目录中) =0 or 是否在长大隧道目录中 is null then null end 是否在长大隧道目录中	,
case when len(是否跨省隧道) >0 then 是否跨省隧道 when len(是否跨省隧道) =0 or 是否跨省隧道 is null then null end 是否跨省隧道	,
case when len(备注) >0 then 备注 when len(备注) =0 or 备注 is null then null end 备注	,
case when len(隧道工程师) >0 then 隧道工程师 when len(隧道工程师) =0 or 隧道工程师 is null then null end 隧道工程师	,
case when len(经度) >0 then 经度 when len(经度) =0 or 经度 is null then null end 经度	,
case when len(纬度) >0 then 纬度 when len(纬度) =0 or 纬度 is null then null end 纬度	,
case when len(隧道养护等级) >0 then 隧道养护等级 when len(隧道养护等级) =0 or 隧道养护等级 is null then null end 隧道养护等级	
from ##TK063


-- ----------------------------
-- Indexes structure for table K063_copy1
-- ----------------------------
CREATE NONCLUSTERED INDEX [_WA_Sys_A0102_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0102] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_HA0102_42EBA8DC] ON [dbo].[ZCPT_K063] ([HA0102] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6302_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6302] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_SDDM_42EBA8DC] ON [dbo].[ZCPT_K063] ([SDDM] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6303_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6303] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_k0101_42EBA8DC] ON [dbo].[ZCPT_K063] ([k0101] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0112_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0112] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_k0304_42EBA8DC] ON [dbo].[ZCPT_K063] ([k0304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6305_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6305] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6306_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6306] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6307_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6307] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6304_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6304_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6304] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6335_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6335] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0180_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0180] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6079_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6079] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6030_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6030] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6031_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6031] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6032_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6032] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0116_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0116] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1313_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1313] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A0130_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0130] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6111_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6111] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6346_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6346] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6344_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6344] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6345_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6345] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6336_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6336] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6347_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6347] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6348_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6348] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6349_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6349] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6350_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6350] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6351_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6351] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_hK6352_42EBA8DC] ON [dbo].[ZCPT_K063] ([hK6352] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6353_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6353] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6354_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6354] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0181_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0181] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1316_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1316] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6337_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6337] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A1318_42EBA8DC] ON [dbo].[ZCPT_K063] ([A1318] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6338_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6338] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6339_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6339] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_A0103_42EBA8DC] ON [dbo].[ZCPT_K063] ([A0103] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6370_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6370] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6355_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6355] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6371_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6371] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_SDGCS_42EBA8DC] ON [dbo].[ZCPT_K063] ([SDGCS] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0185_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0185] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K0186_42EBA8DC] ON [dbo].[ZCPT_K063] ([K0186] ASC)
GO
CREATE NONCLUSTERED INDEX [_WA_Sys_K6343_42EBA8DC] ON [dbo].[ZCPT_K063] ([K6343] ASC)
GO


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k063
SET zcpt_k063.a0102=rtrim(k001.a0102),zcpt_k063.ha0102=rtrim(k001.ha0102)
--SELECT zcpt_k063.a0102,rtrim(k001.a0102),zcpt_k063.ha0102,rtrim(k001.ha0102)
FROM zcpt_k063
left JOIN [HRP-DBMS2014-2022年报]..k001 k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and ISNULL(zcpt_k063.k6303,0)>=ISNULL(k001.k0108,0) and ISNULL(zcpt_k063.k6303,0)<=ISNULL(k001.k0109,0)

DROP TABLE ##TK063