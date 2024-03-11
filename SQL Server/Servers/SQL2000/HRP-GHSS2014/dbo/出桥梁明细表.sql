/*不显示零*/
SELECT
[a0102]=	k60.a0102 ,--管理单位代码
[ha0102]=	k60.ha0102 ,--管理单位名称
[K6002]=	RTRIM(REPLACE(K6002,' ','')) ,--桥梁名称
[K6001]=	RTRIM(K60.K6001) ,--桥梁代码
[K6003]=	K6003 ,--桥梁中心桩号
[K0101]=	RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),--路线编号
[K0112]=	RTRIM(A50.K0112),--路线名称
[HK0304]=	RTRIM(D.OBJJC) ,--技术等级
[K6008]=	K6008,--桥梁全长
[K6065]=	K6065,--跨径总长
[K6063]=	K6063,--单孔最大跨径
[K6064]=	RTRIM(REPLACE(K6064,' ','')),--跨径组合
[A6066]=	A6066,--桥梁全宽
[K6009]=	K6009,--桥面净宽
[K6007]=	K6007,--跨径分
[HK6007]=	HK6007,	--跨径分
[K6004]=	K6004,
[HK6004]=	REPLACE(HK6004,'桥',''),--使用年限分
[K6016]=	K6016,
[HK6016]=	HK6016,--主桥上部结构
[K6110]=	K6110,
[HK6110]=	RTRIM(HK6110),--主桥上部结构材料
[K6017]=	K6017,--桥墩类型
[HK6017]=	CASE WHEN RTRIM(HK6017)='X形墩' THEN 'X 形墩' WHEN RTRIM(HK6017)='Y形墩' THEN 'Y 形墩' WHEN RTRIM(HK6017)='V形墩' THEN 'V 形墩' WHEN 		RTRIM(HK6017)='H形墩' THEN 'H 形墩' ELSE RTRIM(HK6017) END,--桥墩类型
[K6022]=	K6022,
[HK6022]=	HK6022,--设计荷载等级
[K6023]=	K6023,
[HK6023]=	HK6023,--抗震等级
[K6005]=	K6005,
[HK6005]=	CASE WHEN HK6005='其它地物' THEN '其它' ELSE HK6005 END ,--跨越类型
[K6006]=	RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(K6006,CHAR(13),''),CHAR(10),''),CHAR(9),''),CHAR(32),''))),--跨越地物名称
[HK0149]=	RTRIM(REPLACE(HK0149,'年','')),--防洪标准
[HK6024]=	HK6024,--通航等级
[HA1328]=	HA1328,--墩台防撞类型
[HK6062]=	(CASE WHEN K6062='1' THEN '是' ELSE '否' END),--是否互通立交
[K6079]=	K6079,--建设单位
[K6030]=	RTRIM(K6030),--设计单位
[K6031]=	RTRIM(K6031),--施工单位
[K6032]=	RTRIM(K6032),--监理单位
[K0180]=	K0180,--修建年度
[K0116]=	K60.K0116,--通车日期
[A1313]=	A1313,--管养单位性质代码
[A1314]=	LTRIM(RTRIM(REPLACE(A1314,' ',''))),--管养单位名称
[K6111]=	RTRIM(REPLACE(REPLACE(K6111,' ',''),CHAR(127),'')),--监管单位名称
[A1302]=	A1302,
[HA1302]=	CASE WHEN ISNULL(A1302,'1')='1' THEN '非收费' WHEN ISNULL(A1302,'1')='2' THEN '还贷' WHEN ISNULL(A1302,'1')='3' THEN '经营' END,--收费性质
[K6028]=	K6028,
[HK6028]=	HK6028,--评定等级
[A1305]=	A1305,--评定日期
[K6050]=	RTRIM(REPLACE(K6050,' ','')),--技术状况评定单位
[K0181]=	K0181,--改造年度
[A1316]=	A1316,--改造完工日期
[HA1317]=	HA1317,--改造部位
[HA1318]=	HA1318,--工程性质代码
[K6051]=	RTRIM(REPLACE(K6051,' ','')),--改造施工单位
[HA1319]=	NULLIF(HA1319,''),--是否部补助项目
[HA1306]=	CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(HA1306) ELSE NULL END,--主要病害位置
[K6102]=	CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(K6102) ELSE NULL END,--主要病害描述
[A1307]=	CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN A1307 ELSE '' END,
[HA1307]=	CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN HA1307 ELSE '' END,--采取交通管制措施
[A0103]=	LEFT(A0103,6),--所在政区代码
[HK6117]=	RTRIM(ISNULL(HK6117,'双向')),--桥梁所在位置
[HK6118]=	RTRIM(ISNULL(HK6118,'否')),--是否宽路窄桥
[HK6119]=	RTRIM(ISNULL(HK6119,'否')),--是否在长大桥梁目录中
[HK6120]=	RTRIM(ISNULL(HK6120,'否')),--是否跨省桥梁
[HK6041]=	RTRIM(ISNULL(HK6041,'否')),--是否公铁两用桥梁
[K0199]=	K60.K0199,--备注
[K6040]=	CASE WHEN LEFT(K60.K0101,1) IN ('G','H') THEN RTRIM(ISNULL(K6040,'')) ELSE '' END ,--国道桥梁身份码
[uid]=	  rtrim(uid)
FROM K60
LEFT JOIN
  (
  SELECT A.A0102,A.K0101,A.K6001,MAX(B.K0304) K0304
  FROM K60 A LEFT JOIN K01 B ON A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K6003>=B.K0108 AND A.K6003<=B.K0109
  WHERE LEFT(A.K0101,1) IN ('G','H','S','T') AND A.A0102 LIKE '34%' AND A.A0101 <= '2023' --AND B.K0304 <> '10'
  GROUP BY A.A0102,A.K0101,A.K6001
  ) C ON K60.A0102=C.A0102 AND K60.K0101=C.K0101 AND K60.K6001=C.K6001
LEFT JOIN D002 D  ON  D.OBJNAME=C.K0304
LEFT JOIN A50  ON K60.A0102=A50.A0102 AND K60.K0101=A50.K0101
LEFT JOIN DA0102 ON K60.A0102=DA0102.OBJNAME
WHERE LEFT(K60.K0101,1) IN ('G','H','S','T') AND K60.A0102 LIKE '#OYDS_单位代码#%' AND A0101 <= '2023'--AND C.K0304 <> '10'
ORDER BY REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'C','ZZ'),K60.K6003
