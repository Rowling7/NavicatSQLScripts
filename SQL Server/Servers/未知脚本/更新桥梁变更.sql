update k060 set 

	K6064 = case when	rtrim([跨径组合(孔*米）])	 is not null then	rtrim([跨径组合(孔*米）])	else	rtrim(K6064)	end,
	K6009 = case when	rtrim([桥面净宽(米)])	 is not null then	rtrim([桥面净宽(米)])	else	rtrim(K6009)	end,
	hK6016 = case when	rtrim([主桥上部构造（结构类型）])	 is not null then	rtrim([主桥上部构造（结构类型）])	else	rtrim(hK6016)	end,
	K6110 = case when	rtrim([主桥上部构造代码])	 is not null then	rtrim([主桥上部构造代码])	else	rtrim(K6110)	end,
	hK6110 = case when	rtrim([主桥上部构造材料])	 is not null then	rtrim([主桥上部构造材料])	else	rtrim(hK6110)	end,
	K6017 = case when	rtrim([桥墩类型代码])	 is not null then	rtrim([桥墩类型代码])	else	rtrim(K6017)	end,
	hK6017 = case when	rtrim([桥墩类型])	 is not null then	rtrim([桥墩类型])	else	rtrim(hK6017)	end,
	K6022 = case when	rtrim([设计荷载等级代码])	 is not null then	rtrim([设计荷载等级代码])	else	rtrim(K6022)	end,
	hK6022 = case when	rtrim([设计荷载等级])	 is not null then	rtrim([设计荷载等级])	else	rtrim(hK6022)	end,
	K6005 = case when	rtrim([跨越地物代码])	 is not null then	rtrim([跨越地物代码])	else	rtrim(K6005)	end,
	hK6005 = case when	rtrim([跨越地物类型])	 is not null then	rtrim([跨越地物类型])	else	rtrim(hK6005)	end,
	K6006 = case when	rtrim([跨越地物名称])	 is not null then	rtrim([跨越地物名称])	else	rtrim(K6006)	end,
	K6079 = case when	rtrim([建设单位])	 is not null then	rtrim([建设单位])	else	rtrim(K6079)	end,
	K6030 = case when	rtrim([设计单位])	 is not null then	rtrim([设计单位])	else	rtrim(K6030)	end,
	K6031 = case when	rtrim([施工单位])	 is not null then	rtrim([施工单位])	else	rtrim(K6031)	end,
	K6032 = case when	rtrim([监理单位])	 is not null then	rtrim([监理单位])	else	rtrim(K6032)	end,
	K0116 = case when	left([建成通车日期],8)	 is not null then	left([建成通车日期],8)	else	rtrim(K0116)	end,
	A1314 = case when	rtrim([管养单位名称])	 is not null then	rtrim([管养单位名称])	else	rtrim(A1314)	end,
	K6111 = case when	rtrim([监管单位名称])	 is not null then	rtrim([监管单位名称])	else	rtrim(K6111)	end,
	hA1302 = case when	rtrim([收费性质])	 is not null then	rtrim([收费性质])	else	rtrim(hA1302)	end,
	hK6028 = case when	rtrim([评定等级])	 is not null then	rtrim([评定等级])	else	rtrim(hK6028)	end,
	A1305 = case when	rtrim([评定日期])	 is not null then	rtrim([评定日期])	else	rtrim(A1305)	end,
	K6050 = case when	rtrim([评定单位])	 is not null then	rtrim([评定单位])	else	rtrim(K6050)	end,
	K0181 = case when	rtrim([改造年度])	 is not null then	rtrim([改造年度])	else	rtrim(K0181)	end,
	A1316 = case when	rtrim([完工日期])	 is not null then	rtrim([完工日期])	else	rtrim(A1316)	end,
	hA1317 = case when	rtrim([改造部位])	 is not null then	rtrim([改造部位])	else	rtrim(hA1317)	end,
	hA1318 = case when	rtrim([工程性质])	 is not null then	rtrim([工程性质])	else	rtrim(hA1318)	end,
	K6051 = case when	rtrim([改造施工单位])	 is not null then	rtrim([改造施工单位])	else	rtrim(K6051)	end,
	hA1319 = case when	rtrim([是否部补助项目])	 is not null then	rtrim([是否部补助项目])	else	rtrim(hA1319)	end,
	hK6117 = case when	rtrim([桥梁所在位置])	 is not null then	rtrim([桥梁所在位置])	else	rtrim(hK6117)	end,
	hK6118 = case when	rtrim([是否宽路窄桥])	 is not null then	rtrim([是否宽路窄桥])	else	rtrim(hK6118)	end,
	hK6119 = case when	rtrim([是否在长大桥梁目录中])	 is not null then	rtrim([是否在长大桥梁目录中])	else	rtrim(hK6119)	end,
	K0199 = case when	rtrim([备注])	 is not null then	rtrim([备注])	else	rtrim(convert(varchar(255),K0199))	end

from k060
right join  tk060 on rtrim(k6040)=tk060.[桥梁身份码]  
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) is not null
and (
	rtrim([桥梁名称])<>rtrim(K6002)or
	rtrim([桥梁代码])<>left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)or
	rtrim([桥梁中心桩号])<>rtrim(K6003)or
	rtrim([路线编号])<>rtrim(K0101)or
	rtrim([跨径组合(孔*米）])<>rtrim(K6064)or
	rtrim([桥面净宽(米)])<>rtrim(K6009)or
	rtrim([主桥上部构造（结构类型）])<>rtrim(hK6016)or
	rtrim([主桥上部构造代码])<>rtrim(K6110)or
	rtrim([主桥上部构造材料])<>rtrim(hK6110)or
	rtrim([桥墩类型代码])<>rtrim(K6017)or
	rtrim([桥墩类型])<>rtrim(hK6017)or
	rtrim([设计荷载等级代码])<>rtrim(K6022)or
	rtrim([设计荷载等级])<>rtrim(hK6022)or
	rtrim([跨越地物代码])<>rtrim(K6005)or
	rtrim([跨越地物类型])<>rtrim(hK6005)or
	rtrim([跨越地物名称])<>rtrim(K6006)or
	rtrim([建设单位])<>rtrim(K6079)or
	rtrim([设计单位])<>rtrim(K6030)or
	rtrim([施工单位])<>rtrim(K6031)or
	rtrim([监理单位])<>rtrim(K6032)or
	rtrim([建成通车日期])<>rtrim(K0116)or
	rtrim([管养单位名称])<>rtrim(A1314)or
	rtrim([监管单位名称])<>rtrim(K6111)or
	rtrim([收费性质])<>rtrim(hA1302)or
	rtrim([评定等级])<>rtrim(hK6028)or
	rtrim([评定日期])<>rtrim(A1305)or
	rtrim([评定单位])<>rtrim(K6050)or
	rtrim([改造年度])<>rtrim(K0181)or
	rtrim([完工日期])<>rtrim(A1316)or
	rtrim([改造部位])<>rtrim(hA1317)or
	rtrim([工程性质])<>rtrim(hA1318)or
	rtrim([改造施工单位])<>rtrim(K6051)or
	rtrim([是否部补助项目])<>rtrim(hA1319)or
	rtrim([桥梁所在位置])<>rtrim(hK6117)or
	rtrim([是否宽路窄桥])<>rtrim(hK6118)or
	rtrim([是否在长大桥梁目录中])<>rtrim(hK6119)or
	rtrim([备注])<>rtrim(convert(varchar(255),K0199))or
	rtrim([桥梁身份码])<>rtrim(K6040)
)

