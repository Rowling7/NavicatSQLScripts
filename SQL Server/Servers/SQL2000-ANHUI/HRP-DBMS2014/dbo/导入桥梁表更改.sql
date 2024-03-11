-------------------------------废弃开始

--导入 
/*truncate table tk060
insert into tk060(
[序号],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号],[跨径组合(孔*米）],[桥面净宽(米)],[主桥上部构造（结构类型）],[主桥上部构造代码],[主桥上部构造材料],[桥墩类型代码],[桥墩类型],[设计荷载等级代码],[设计荷载等级],[跨越地物代码],[跨越地物类型],[跨越地物名称],[建设单位],[设计单位],[施工单位],[监理单位],[建成通车日期],[管养单位名称],[监管单位名称],[收费性质],[评定等级],[评定日期],[评定单位],[改造年度],[完工日期],[改造部位],[工程性质],[改造施工单位],[是否部补助项目],[桥梁所在位置],[是否宽路窄桥],[是否在长大桥梁目录中],[备注],[桥梁身份码])
SELECT 
[序号],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号],[跨径组合(孔*米）],[桥面净宽(米)],[主桥上部构造（结构类型）],[主桥上部构造代码],[主桥上部构造材料],[桥墩类型代码],[桥墩类型],[设计荷载等级代码],[设计荷载等级],[跨越地物代码],[跨越地物类型],[跨越地物名称],[建设单位],[设计单位],[施工单位],[监理单位],[建成通车日期],[管养单位名称],[监管单位名称],[收费性质],[评定等级],[评定日期],[评定单位],[改造年度],[完工日期],[改造部位],[工程性质],[改造施工单位],[是否部补助项目],[桥梁所在位置],[是否宽路窄桥],[是否在长大桥梁目录中],[备注],[桥梁身份码]
from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240127 国省道桥梁对比\QL01280000.xls', sheet1$ ) 
*/
/*
update tk060 set [建成通车日期]='20150320',[完工日期]= '20190320' where [序号]='1010'
update tk060 set [建成通车日期]='20151001',[完工日期]= '20151001' where [序号]='1009'
update tk060 set [建成通车日期]='20161201',[完工日期]= '20181201' where [序号]='1008'
update tk060 set [建成通车日期]='20220515' where [序号]='1002'
update tk060 set [建成通车日期]='20220515' where [序号]='1003'
update tk060 set [建成通车日期]='20220515' where [序号]='1004'
update tk060 set [建成通车日期]='20220515' where [序号]='1005'
update tk060 set [建成通车日期]='20220515' where [序号]='1006'
update tk060 set [建成通车日期]='20220515' where [序号]='1007'
update tk060 set [建成通车日期]='20230715' where [序号]='1000'
update tk060 set [建成通车日期]='20230715' where [序号]='1001'
update tk060 set [评定日期]='20211003' where [序号]='1046'
update tk060 set [评定日期]='20220906' where [序号]='1045'
update tk060 set [评定日期]='20220930' where [序号]='1044'
update tk060 set [评定日期]='20231020',[完工日期]= '20200930' where [序号]='1013'
update tk060 set [评定日期]='20231020' where [序号]='1038'
update tk060 set [评定日期]='20231020' where [序号]='1039'
update tk060 set [评定日期]='20231020' where [序号]='1040'
update tk060 set [评定日期]='20231020' where [序号]='1041'
update tk060 set [评定日期]='20231020' where [序号]='1042'
update tk060 set [评定日期]='20231020' where [序号]='1043'
update tk060 set [评定日期]='20231025',[完工日期]= '20111212' where [序号]='1032'
update tk060 set [评定日期]='20231031' where [序号]='1037'
update tk060 set [完工日期]='20061212' where [序号]='1034'
update tk060 set [完工日期]='20061212' where [序号]='1035'
update tk060 set [完工日期]='20061212' where [序号]='1036'
update tk060 set [完工日期]='20111010' where [序号]='1033'
update tk060 set [完工日期]='20140701' where [序号]='1029'
update tk060 set [完工日期]='20140701' where [序号]='1030'
update tk060 set [完工日期]='20140701' where [序号]='1031'
update tk060 set [完工日期]='20141230' where [序号]='1028'
update tk060 set [完工日期]='20150901' where [序号]='1024'
update tk060 set [完工日期]='20150901' where [序号]='1025'
update tk060 set [完工日期]='20150901' where [序号]='1026'
update tk060 set [完工日期]='20150901' where [序号]='1027'
update tk060 set [完工日期]='20151001' where [序号]='1023'
update tk060 set [完工日期]='20151201' where [序号]='1020'
update tk060 set [完工日期]='20151201' where [序号]='1021'
update tk060 set [完工日期]='20151201' where [序号]='1022'
update tk060 set [完工日期]='20180301' where [序号]='1019'
update tk060 set [完工日期]='20190415' where [序号]='1017'
update tk060 set [完工日期]='20190415' where [序号]='1018'
update tk060 set [完工日期]='20190815' where [序号]='1016'
update tk060 set [完工日期]='20191231' where [序号]='1015'
update tk060 set [完工日期]='20200606' where [序号]='1014'
update tk060 set [完工日期]='20220120' where [序号]='1012'
update tk060 set [完工日期]='20220601' where [序号]='1011'
*/


/*


--查询不一致

SELECT  [序号],
rtrim([桥梁名称])  桥梁名称,rtrim(K6002) K6002,
rtrim([桥梁代码])  桥梁代码,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) ,
rtrim([桥梁中心桩号])  桥梁中心桩号,rtrim(K6003) K6003,
rtrim([路线编号])  路线编号,rtrim(K0101) K0101,
rtrim([跨径组合(孔*米）])  [跨径组合(孔*米）],rtrim(K6064) K6064,
rtrim([桥面净宽(米) ])  [桥面净宽(米)] ,rtrim(K6009) K6009,
rtrim([主桥上部构造（结构类型）])  [主桥上部构造（结构类型）],rtrim(hK6016) hK6016,
rtrim([主桥上部构造代码])  主桥上部构造代码,rtrim(K6110) K6110,
rtrim([主桥上部构造材料])  主桥上部构造材料,rtrim(hK6110) hK6110,
rtrim([桥墩类型代码])  桥墩类型代码,rtrim(K6017) K6017,
rtrim([桥墩类型])  桥墩类型,rtrim(hK6017) hK6017,
rtrim([设计荷载等级代码])  设计荷载等级代码,rtrim(K6022) K6022,
rtrim([设计荷载等级])  设计荷载等级,rtrim(hK6022) hK6022,
rtrim([跨越地物代码])  跨越地物代码,rtrim(K6005) K6005,
rtrim([跨越地物类型])  跨越地物类型,rtrim(hK6005) hK6005,
rtrim([跨越地物名称])  跨越地物名称,rtrim(K6006) K6006,
rtrim([建设单位])  建设单位,rtrim(K6079) K6079,
rtrim([设计单位])  设计单位,rtrim(K6030) K6030,
rtrim([施工单位])  施工单位,rtrim(K6031) K6031,
rtrim([监理单位])  监理单位,rtrim(K6032) K6032,
rtrim([建成通车日期])  建成通车日期,rtrim(K0116) K0116,
rtrim([管养单位名称])  管养单位名称,rtrim(A1314) A1314,
rtrim([监管单位名称])  监管单位名称,rtrim(K6111) K6111,
rtrim([收费性质])  收费性质,rtrim(hA1302) hA1302,
rtrim([评定等级])  评定等级,rtrim(hK6028) hK6028,
rtrim([评定日期])  评定日期,rtrim(A1305) A1305,
rtrim([评定单位])  评定单位,rtrim(K6050) K6050,
rtrim([改造年度])  改造年度,rtrim(K0181) K0181,
rtrim([完工日期])  完工日期,rtrim(A1316) A1316,
rtrim([改造部位])  改造部位,rtrim(hA1317) hA1317,
rtrim([工程性质])  工程性质,rtrim(hA1318) hA1318,
rtrim([改造施工单位])  改造施工单位,rtrim(K6051)  K6051,
rtrim([是否部补助项目])  是否部补助项目,rtrim(hA1319)  hA1319,
rtrim([桥梁所在位置])  桥梁所在位置,rtrim(hK6117)  hK6117,
rtrim([是否宽路窄桥])  是否宽路窄桥,rtrim(hK6118)  hK6118,
rtrim([是否在长大桥梁目录中])  是否在长大桥梁目录中,rtrim(hK6119)  hK6119,
rtrim([备注])  备注,rtrim(convert(varchar(255),K0199)) K0199,
rtrim([桥梁身份码])  桥梁身份码,rtrim(K6040)  K6040


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
rtrim([备注])<>rtrim(convert(varchar(255),K0199))
)



UNION


SELECT  [序号],
rtrim([桥梁名称])  桥梁名称,rtrim(K6002) K6002,
rtrim([桥梁代码])  桥梁代码,left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) ,
rtrim([桥梁中心桩号])  桥梁中心桩号,rtrim(K6003) K6003,
rtrim([路线编号])  路线编号,rtrim(K0101) K0101,
rtrim([跨径组合(孔*米）])  [跨径组合(孔*米）],rtrim(K6064) K6064,
rtrim([桥面净宽(米) ])  [桥面净宽(米)] ,rtrim(K6009) K6009,
rtrim([主桥上部构造（结构类型）])  [主桥上部构造（结构类型）],rtrim(hK6016) hK6016,
rtrim([主桥上部构造代码])  主桥上部构造代码,rtrim(K6110) K6110,
rtrim([主桥上部构造材料])  主桥上部构造材料,rtrim(hK6110) hK6110,
rtrim([桥墩类型代码])  桥墩类型代码,rtrim(K6017) K6017,
rtrim([桥墩类型])  桥墩类型,rtrim(hK6017) hK6017,
rtrim([设计荷载等级代码])  设计荷载等级代码,rtrim(K6022) K6022,
rtrim([设计荷载等级])  设计荷载等级,rtrim(hK6022) hK6022,
rtrim([跨越地物代码])  跨越地物代码,rtrim(K6005) K6005,
rtrim([跨越地物类型])  跨越地物类型,rtrim(hK6005) hK6005,
rtrim([跨越地物名称])  跨越地物名称,rtrim(K6006) K6006,
rtrim([建设单位])  建设单位,rtrim(K6079) K6079,
rtrim([设计单位])  设计单位,rtrim(K6030) K6030,
rtrim([施工单位])  施工单位,rtrim(K6031) K6031,
rtrim([监理单位])  监理单位,rtrim(K6032) K6032,
rtrim([建成通车日期])  建成通车日期,rtrim(K0116) K0116,
rtrim([管养单位名称])  管养单位名称,rtrim(A1314) A1314,
rtrim([监管单位名称])  监管单位名称,rtrim(K6111) K6111,
rtrim([收费性质])  收费性质,rtrim(hA1302) hA1302,
rtrim([评定等级])  评定等级,rtrim(hK6028) hK6028,
rtrim([评定日期])  评定日期,rtrim(A1305) A1305,
rtrim([评定单位])  评定单位,rtrim(K6050) K6050,
rtrim([改造年度])  改造年度,rtrim(K0181) K0181,
rtrim([完工日期])  完工日期,rtrim(A1316) A1316,
rtrim([改造部位])  改造部位,rtrim(hA1317) hA1317,
rtrim([工程性质])  工程性质,rtrim(hA1318) hA1318,
rtrim([改造施工单位])  改造施工单位,rtrim(K6051)  K6051,
rtrim([是否部补助项目])  是否部补助项目,rtrim(hA1319)  hA1319,
rtrim([桥梁所在位置])  桥梁所在位置,rtrim(hK6117)  hK6117,
rtrim([是否宽路窄桥])  是否宽路窄桥,rtrim(hK6118)  hK6118,
rtrim([是否在长大桥梁目录中])  是否在长大桥梁目录中,rtrim(hK6119)  hK6119,
rtrim([备注])  备注,rtrim(convert(varchar(255),K0199)) K0199,
rtrim([桥梁身份码])  桥梁身份码,rtrim(K6040)  K6040


from k060 
right join  tk060 on left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)=tk060.[桥梁代码]
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) is not null
 AND rtrim(k6040)is  null
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
rtrim([备注])<>rtrim(convert(varchar(255),K0199))
)





*/



/*
--更新



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

*/




-------------------------------废弃结束

/*
--导入表
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk060'))
drop table #tk060
SELECT [序号],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号],[主桥上部构造代码],[主桥上部构造材料],[桥墩类型代码],[桥墩类型],[建设单位],[设计单位],[施工单位],[监理单位],[管养单位名称],[监管单位名称],[收费性质代码],[收费性质汉字],[评定单位],[改造年度],[完工日期],[改造部位],[工程性质],[改造施工单位],[是否宽路窄桥代码],[是否宽路窄桥],[桥梁身份码]
INTO #TK060
from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240127 国省道桥梁对比\QL01280001.xls', sheet5$ ) 



update #tk060 set [完工日期]= '20190320' where [序号]='1010'
update #tk060 set [完工日期]= '20151001' where [序号]='1009'
update #tk060 set [完工日期]= '20181201' where [序号]='1008'
update #tk060 set [完工日期]= '20200930' where [序号]='1013'
update #tk060 set [完工日期]= '20111212' where [序号]='1032'
update #tk060 set [完工日期]='20061212' where [序号]='1034'
update #tk060 set [完工日期]='20061212' where [序号]='1035'
update #tk060 set [完工日期]='20061212' where [序号]='1036'
update #tk060 set [完工日期]='20111010' where [序号]='1033'
update #tk060 set [完工日期]='20140701' where [序号]='1029'
update #tk060 set [完工日期]='20140701' where [序号]='1030'
update #tk060 set [完工日期]='20140701' where [序号]='1031'
update #tk060 set [完工日期]='20141230' where [序号]='1028'
update #tk060 set [完工日期]='20150901' where [序号]='1024'
update #tk060 set [完工日期]='20150901' where [序号]='1025'
update #tk060 set [完工日期]='20150901' where [序号]='1026'
update #tk060 set [完工日期]='20150901' where [序号]='1027'
update #tk060 set [完工日期]='20151001' where [序号]='1023'
update #tk060 set [完工日期]='20151201' where [序号]='1020'
update #tk060 set [完工日期]='20151201' where [序号]='1021'
update #tk060 set [完工日期]='20151201' where [序号]='1022'
update #tk060 set [完工日期]='20180301' where [序号]='1019'
update #tk060 set [完工日期]='20190415' where [序号]='1017'
update #tk060 set [完工日期]='20190415' where [序号]='1018'
update #tk060 set [完工日期]='20190815' where [序号]='1016'
update #tk060 set [完工日期]='20191231' where [序号]='1015'
update #tk060 set [完工日期]='20200606' where [序号]='1014'
update #tk060 set [完工日期]='20220120' where [序号]='1012'
update #tk060 set [完工日期]='20220601' where [序号]='1011'




SELECT * from #tk060
*/

SELECT b.[桥梁中心桩号],rtrim(k6003),b.[桥梁名称],rtrim(k6002)
from k060 
inner join 
(
 SELECT [桥梁名称],	[桥梁代码],	[桥梁中心桩号]

from OPENROWSET ('Microsoft.JET.OLEDB.4.0', 'Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240127 国省道桥梁对比\QL01280001.xls', sheet1$ ) 

 
 ) b on b.[桥梁代码]=left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)
where b.[桥梁名称]<>rtrim(k6002)


/*
--查询不一致
SELECT [序号],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号],[主桥上部构造代码],[主桥上部构造材料],[桥墩类型代码],[桥墩类型],[建设单位],[设计单位],[施工单位],[监理单位],[管养单位名称],[监管单位名称],[收费性质代码],[收费性质汉字],[评定单位],[改造年度],[完工日期],[改造部位],[工程性质],[改造施工单位],[是否宽路窄桥代码],[是否宽路窄桥],[桥梁身份码]
update k060 set 
from k060
right join  #tk060 tk060 on rtrim(k6040)=tk060.[桥梁身份码]  
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) is not null
and (
	rtrim([主桥上部构造代码])<>rtrim(K6110)or
	rtrim([主桥上部构造材料])<>rtrim(hK6110)or
	rtrim([桥墩类型代码])<>rtrim(K6017)or
	rtrim([桥墩类型])<>rtrim(hK6017)or
	rtrim([建设单位])<>rtrim(K6079)or
	rtrim([设计单位])<>rtrim(K6030)or
	rtrim([施工单位])<>rtrim(K6031)or
	rtrim([监理单位])<>rtrim(K6032)or
	--rtrim([管养单位名称])<>rtrim(A1314)or
	rtrim([监管单位名称])<>rtrim(K6111)or
	rtrim([收费性质代码])<>rtrim(A1302)or
	rtrim([收费性质汉字])<>rtrim(hA1302)or
	rtrim([评定单位])<>rtrim(K6050)or
	rtrim([改造年度])<>rtrim(K0181)or
	rtrim([完工日期])<>rtrim(A1316)or
	rtrim([改造部位])<>rtrim(hA1317)or
	rtrim([工程性质])<>rtrim(hA1318)or
	rtrim([改造施工单位])<>rtrim(K6051)or
	rtrim([是否宽路窄桥])<>rtrim(hK6118)
)
*/

SELECT [序号],[桥梁名称],[桥梁代码],[桥梁中心桩号],[路线编号],[桥梁身份码],
	K6110 , case when	rtrim([主桥上部构造代码])	 is not null then	rtrim([主桥上部构造代码])	else	rtrim(K6110)	end,
	hK6110 , case when	rtrim([主桥上部构造材料])	 is not null then	rtrim([主桥上部构造材料])	else	rtrim(hK6110)	end,
	K6017 , case when	rtrim([桥墩类型代码])	 is not null then	rtrim([桥墩类型代码])	else	rtrim(K6017)	end,
	hK6017 , case when	rtrim([桥墩类型])	 is not null then	rtrim([桥墩类型])	else	rtrim(hK6017)	end,
	K6079 , case when	rtrim([建设单位])	 is not null then	rtrim([建设单位])	else	rtrim(K6079)	end,
	K6030 , case when	rtrim([设计单位])	 is not null then	rtrim([设计单位])	else	rtrim(K6030)	end,
	K6031 , case when	rtrim([施工单位])	 is not null then	rtrim([施工单位])	else	rtrim(K6031)	end,
	K6032 , case when	rtrim([监理单位])	 is not null then	rtrim([监理单位])	else	rtrim(K6032)	end,
	A1314 , case when	rtrim([管养单位名称])	 is not null then	rtrim([管养单位名称])	else	rtrim(A1314)	end,
	K6111 , case when	rtrim([监管单位名称])	 is not null then	rtrim([监管单位名称])	else	rtrim(K6111)	end,
	A1302 , case when	rtrim([收费性质代码])	 is not null then	rtrim([收费性质代码])	else	rtrim(A1302)	end,
	hA1302 , case when	rtrim([收费性质汉字])	 is not null then	rtrim([收费性质汉字])	else	rtrim(hA1302)	end,
	K6050 , case when	rtrim([评定单位])	 is not null then	rtrim([评定单位])	else	rtrim(K6050)	end,
	K0181 , case when	rtrim([改造年度])	 is not null then	rtrim([改造年度])	else	rtrim(K0181)	end,
	A1316 , case when	rtrim([完工日期])	 is not null then	rtrim([完工日期])	else	rtrim(A1316)	end,
	hA1317 , case when	rtrim([改造部位])	 is not null then	rtrim([改造部位])	else	rtrim(hA1317)	end,
	hA1318 , case when	rtrim([工程性质])	 is not null then	rtrim([工程性质])	else	rtrim(hA1318)	end,
	K6051 , case when	rtrim([改造施工单位])	 is not null then	rtrim([改造施工单位])	else	rtrim(K6051)	end,
	K6118 , case when	rtrim([是否宽路窄桥代码])	 is not null then	rtrim([是否宽路窄桥代码])	else	rtrim(K6118)	end,
	hK6118 , case when	rtrim([是否宽路窄桥])	 is not null then	rtrim([是否宽路窄桥])	else	rtrim(hK6118)	end
from k060
inner join  #tk060 tk060 on left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)=tk060.[桥梁代码]  
where  1 =1
and (
	rtrim([主桥上部构造代码])<>rtrim(K6110)or
	rtrim([主桥上部构造材料])<>rtrim(hK6110)or
	rtrim([桥墩类型代码])<>rtrim(K6017)or
	rtrim([桥墩类型])<>rtrim(hK6017)or
	rtrim([建设单位])<>rtrim(K6079)or
	rtrim([设计单位])<>rtrim(K6030)or
	rtrim([施工单位])<>rtrim(K6031)or
	rtrim([监理单位])<>rtrim(K6032)or
	rtrim([管养单位名称])<>rtrim(A1314)or
	rtrim([监管单位名称])<>rtrim(K6111)or
	rtrim([收费性质代码])<>rtrim(A1302)or
	rtrim([收费性质汉字])<>rtrim(hA1302)or
	rtrim([评定单位])<>rtrim(K6050)or
	rtrim([改造年度])<>rtrim(K0181)or
	rtrim([完工日期])<>rtrim(A1316)or
	rtrim([改造部位])<>rtrim(hA1317)or
	rtrim([工程性质])<>rtrim(hA1318)or
	rtrim([改造施工单位])<>rtrim(K6051)or
	rtrim([是否宽路窄桥代码])<>rtrim(K6118)or
	rtrim([是否宽路窄桥])<>rtrim(hK6118)
)



update k060 set 

	K6110 = case when	rtrim([主桥上部构造代码])	 is not null then	rtrim([主桥上部构造代码])	else	rtrim(K6110)	end,
	hK6110 = case when	rtrim([主桥上部构造材料])	 is not null then	rtrim([主桥上部构造材料])	else	rtrim(hK6110)	end,
	K6017 = case when	rtrim([桥墩类型代码])	 is not null then	rtrim([桥墩类型代码])	else	rtrim(K6017)	end,
	hK6017 = case when	rtrim([桥墩类型])	 is not null then	rtrim([桥墩类型])	else	rtrim(hK6017)	end,
	K6079 = case when	rtrim([建设单位])	 is not null then	rtrim([建设单位])	else	rtrim(K6079)	end,
	K6030 = case when	rtrim([设计单位])	 is not null then	rtrim([设计单位])	else	rtrim(K6030)	end,
	K6031 = case when	rtrim([施工单位])	 is not null then	rtrim([施工单位])	else	rtrim(K6031)	end,
	K6032 = case when	rtrim([监理单位])	 is not null then	rtrim([监理单位])	else	rtrim(K6032)	end,
	--A1314 = case when	rtrim([管养单位名称])	 is not null then	rtrim([管养单位名称])	else	rtrim(A1314)	end,
	K6111 = case when	rtrim([监管单位名称])	 is not null then	rtrim([监管单位名称])	else	rtrim(K6111)	end,
	A1302 = case when	rtrim([收费性质代码])	 is not null then	rtrim([收费性质代码])	else	rtrim(A1302)	end,
	hA1302 = case when	rtrim([收费性质汉字])	 is not null then	rtrim([收费性质汉字])	else	rtrim(hA1302)	end,
	K6050 = case when	rtrim([评定单位])	 is not null then	rtrim([评定单位])	else	rtrim(K6050)	end,
	K0181 = case when	rtrim([改造年度])	 is not null then	rtrim([改造年度])	else	rtrim(K0181)	end,
	--A1316 = case when	rtrim([完工日期])	 is not null then	rtrim([完工日期])	else	rtrim(A1316)	end,
	hA1317 = case when	rtrim([改造部位])	 is not null then	rtrim([改造部位])	else	rtrim(hA1317)	end,
	hA1318 = case when	rtrim([工程性质])	 is not null then	rtrim([工程性质])	else	rtrim(hA1318)	end,
	K6051 = case when	rtrim([改造施工单位])	 is not null then	rtrim([改造施工单位])	else	rtrim(K6051)	end,
	K6118 = case when	rtrim([是否宽路窄桥代码])	 is not null then	rtrim([是否宽路窄桥代码])	else	rtrim(K6118)	end,
	hK6118 = case when	rtrim([是否宽路窄桥])	 is not null then	rtrim([是否宽路窄桥])	else	rtrim(hK6118)	end
from k060
inner join  #tk060 tk060 on left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)=tk060.[桥梁代码]  
where  1 =1



---完工日期
update k060 set A1316='20190415'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340202L0170'
update k060 set A1316='20190415'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340202L0180'
update k060 set A1316='20191231'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340209L0200'
update k060 set A1316='20180301'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340209L0210'
update k060 set A1316='20220601'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340223L0260'
update k060 set A1316='20190815'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G205340223L0290'
update k060 set A1316='20200606'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G329340210L0011'
update k060 set A1316='20181201'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S208340210L0070'
update k060 set A1316='20061212'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S208340223L0090'
update k060 set A1316='20111010'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S212340207L0010'
update k060 set A1316='20200930'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S339340212L0090'
update k060 set A1316='20111212'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S339340212L0100'
update k060 set A1316='20220120'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S451340281L0030'
update k060 set A1316='20190320'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S460340223L0090'
update k060 set A1316='20061212'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S463340223L0020'
update k060 set A1316='20061212'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S463340223L0030'
update k060 set A1316='20151001'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0280'
update k060 set A1316='20151001'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0290'
update k060 set A1316='20150901'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0300'
update k060 set A1316='20150901'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0320'
update k060 set A1316='20150901'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0331'
update k060 set A1316='20150901'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206340123L0330'
update k060 set A1316='20151201'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340124L0310'
update k060 set A1316='20151201'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0330'
update k060 set A1316='20141230'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0320'
update k060 set A1316='20151201'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0072'
update k060 set A1316='20140701'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0340'
update k060 set A1316='20140701'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0350'
update k060 set A1316='20140701'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G330340123L0360'


--管养单位名称,管养单位性质

update k060 set A1314='巢湖市市政处',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G329340181L0020'
update k060 set A1314='巢湖市市政处',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G346340181L0010'
update k060 set A1314='合肥市政',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S230340104L0080'
update k060 set A1314='枞阳县市政处',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G237340722L0230'
update k060 set A1314='枞阳县市政处',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G237340722L0260'
update k060 set A1314='铜陵市交通投资有限责任公司',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G237340722L0280'
update k060 set A1314='枞阳县市政处',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G347340722L0240'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0010'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0020'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0030'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0040'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0050'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0060'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0070'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0080'
update k060 set A1314='宿州骏达',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='G206341302L0090'
update k060 set A1314='宿州安水',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0040'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0050'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0060'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0070'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0080'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0090'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0100'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0110'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0120'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0130'
update k060 set A1314='宿州中铁',a1313='9',ha1313='其他部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='S407341302L0140'
update k060 set A1314='休宁县交通运输管理服务中心',a1313='1',ha1313='公路交通部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='SF08341022L0400'
update k060 set A1314='休宁县交通运输管理服务中心',a1313='1',ha1313='公路交通部门养护管理'where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001)='SF08341022L0700'

