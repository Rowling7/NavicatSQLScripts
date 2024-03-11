--1、取年报属性库桥梁明细(主要指标)
if object_id('tempdb..#nb') is not null drop table #nb
select rtrim(a.a0102) a0102,
		rtrim(a.ha0102) ha0102,
		left(rtriM(a.a0103),6) a0103,
		rtrim(a.k6002) k6002,case when len(rtrim(a.k0101))<10 then rtrim(a.k0101) else left(rtrim(a.k0101),4) end k0101,
		rtrim(b.hk0304) hk0304,
		rtrim(a.k6001) wk6001,a.k6003,
		(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'L'+rtrim(a.K6001)
			else null end) k6001,
		rtrim(a.k6040) k6040
into #nb
from k060 a left join k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6003>b.k0108 and a.k6003<b.k0109
where left(a.k0101,1) in ('G','H','S','T') and left(a.a0102,3)<>'42A'
order by a.k6040 desc,a.k0101,a.k6003


--2、国桥库导出最新文件
if object_id('tempdb..#qlk') is not null drop table #qlk
select 桥梁身份码,replace(桥幅编号,'R','L') 桥幅编号,桥幅名称,中心桩号,路线编号,路线技术等级
into #qlk
from OPENROWSET('MICROSOFT.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230731 桥梁 隧道\4211\0807 7.0\桥梁综合信息列表-黄冈市公路管理局(2023-08-04) (2).xls',sheet1$)
order by 桥梁身份码 desc,桥幅编号,中心桩号


--3、对比主要指标
select a0102,ha0102,a0103,k6002,桥幅名称,k0101,路线编号,hk0304,路线技术等级,k6003,中心桩号,k6001,桥幅编号,k6040,桥梁身份码,
case when  k6002<>桥幅名称 then '桥名不一致' else '' end,
case when  hk0304<>left(路线技术等级,2) then '所在路线技术等级不一致' else '' end,
case when  k6003<>中心桩号 then '中心桩号不一致' else '' end,
case when replace(replace(k6001,'H','G'),'T','S')<>桥幅编号 OR k6001 IS NULL OR 桥幅编号 IS NULL then '桥幅编号不一致' else '' end,
case when  isnull(k6040,0)<>桥梁身份码 then '桥梁身份码不一致' else '' end
from 
(
select a0102,ha0102,a0103,k6002,桥幅名称,k0101,路线编号,hk0304,路线技术等级,k6003,中心桩号,k6001,桥幅编号,k6040,桥梁身份码
from #nb full join #qlk on k6040=桥梁身份码
where k6040 is not null and 桥梁身份码 is not null
union
select a0102,ha0102,a0103,k6002,桥幅名称,k0101,路线编号,hk0304,路线技术等级,k6003,中心桩号,k6001,桥幅编号,k6040,桥梁身份码
from #nb full join #qlk on replace(replace(k6001,'H','G'),'T','S')=桥幅编号 and k6002=桥幅名称 --and k6003=中心桩号 
where k6040 is null
) as a
where k6002<>桥幅名称 or hk0304<>left(路线技术等级,2) or k6003<>中心桩号 or replace(replace(k6001,'H','G'),'T','S')<>桥幅编号 or isnull(k6040,0)<>桥梁身份码
or a0102 is null or 桥幅名称 is null
order by k6040

--4、取年报属性库桥梁明细(其他指标)
if object_id('tempdb..#nb2') is not null drop table #nb2
select rtrim(a.a0102) a0102,
		rtrim(a.ha0102) ha0102,
		left(rtriM(a.a0103),6) a0103,
		rtrim(a.k6002) k6002,case when len(rtrim(a.k0101))<10 then rtrim(a.k0101) else left(rtrim(a.k0101),4) end k0101,
		rtrim(b.hk0304) hk0304,
		rtrim(a.k6001) wk6001,a.k6003,
		(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'L'+rtrim(a.K6001)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'L'+rtrim(a.K6001)
			else null end) k6001,
		rtrim(a.k6040) k6040,
		k6008,K6065,k6063,k6064,k6066,isnull(k6009,0) k6009,rtrim(hk6007) hk6007,rtrim(hk6004) hk6004,rtrim(hk6016) hk6016,rtrim(hk6111) hk6111,rtrim(hk6017) hk6017,rtrim(hk6022) hk6022,rtrim(a.hk6023) hk6023,
		rtrim(hk6005) hk6005,rtrim(k6006) k6006,rtrim(hK6024) hK6024,rtrim(ha1328) ha1328,(case when k6062='1' then '是' else '否' end) k6062,
		rtrim(K6079) k6079,rtrim(K6030) k6030,rtrim(K6031) K6031,rtrim(K6032) K6032,K6100,a.K0116,
		rtrim(hA1313) hA1313,rtrim(a1314) a1314,rtrim(K6112) K6112,rtrim(ha1302) ha1302,
		rtrim(hk6028) hk6028,rtrim(a1305) a1305,rtrim(ha1307) ha1307,rtrim(c.objjc) ha0103,rtrim(hk6117) hk6117,rtrim(hk6118) hk6118,rtrim(hk6119) hk6119,rtrim(hk6120) hk6120
into #nb2
from k060 a left join k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6003>b.k0108 and a.k6003<b.k0109
left join dz0101 c on left(rtriM(a.a0103),6)=rtrim(c.objname)
where left(a.k0101,1) in ('G','H','S','T') and left(a.a0102,3)<>'42A'
order by a.k6040 desc,a.k0101,a.k6003


--5、国桥库导出（其他指标1）
if object_id('tempdb..#qlk2') is not null drop table #qlk2
select 桥梁身份码,replace(桥幅编号,'R','L') 桥幅编号,桥幅名称,中心桩号,路线编号,路线技术等级,
桥梁全长,跨径总长,最大跨径,跨径组合,桥面总宽,桥面净宽,跨径分类,桥梁性质
,replace(replace(主桥上部类型,'Ⅰ形梁','I形梁'),'Ⅱ形梁','II形梁') 主桥上部类型
,replace(主桥上部材料,'预应力混凝土','预应力钢筋混凝土') 主桥上部材料
,桥墩类型
,case when rtrim(设计荷载等级)='公路Ⅰ级' then '公路－I级'
		when rtrim(设计荷载等级)='公路Ⅱ级' then '公路－II级'
		when rtrim(设计荷载等级)='汽车-超20级' then '汽车－超20级'
		when rtrim(设计荷载等级)='汽车-20级' then '汽车－20级'
		when rtrim(设计荷载等级)='汽车-15级' then '汽车－15级'
		when rtrim(设计荷载等级)='汽车-13级' then '汽车－13级'
		when rtrim(设计荷载等级)='汽车-10级' then '汽车－10级'
		when rtrim(设计荷载等级)='低于汽车-10级' then '低于汽车－10级' else '' end 设计荷载等级
,case when rtrim(抗震等级)='6度以下' then '< 0.05或6度以下'
		when rtrim(抗震等级)='6度' then '0.05或6度'
		when rtrim(抗震等级)='7度' then '0.10、0.15或7度'
		when rtrim(抗震等级)='8度' then '0.20、0.30或8度'
		when rtrim(抗震等级)='9度及以上' then '≥0.40或9度及以上' else '' end 抗震等级,
replace(replace(replace(rtrim(跨越地物类型),'（','('),'）',')'),'包括','含') 跨越地物类型,rtrim(跨越地物名称) 跨越地物名称,
replace(通航等级,'航道','') 通航等级,
墩台防撞设施类型,
是否互通立交,
建设单位,设计单位,施工单位,监理单位,修建年度,replace(通车时间,'-','') 通车时间,
管养单位性质,[管理（养）单位],监管单位,case when 收费性质='还贷' then '政府还贷' when 收费性质='经营' then '经营性' else 收费性质 end 收费性质,
case when 桥梁技术状况='1类' then '一类' 
	when 桥梁技术状况='2类' then '二类' 
	when 桥梁技术状况='3类' then '三类' 
	when 桥梁技术状况='4类' then '四类' when 桥梁技术状况='5类' then '五类' else 桥梁技术状况 end 桥梁技术状况,replace(最近评定日期,'-','') 最近评定日期,
交通管制措施,
所在政区,
行车方向,
是否宽路窄桥,
是否在长大桥梁目录,
是否为跨省桥梁
into #qlk2
from OPENROWSET('MICROSOFT.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230731 桥梁 隧道\4211\0807 7.0\桥梁综合信息列表-黄冈市公路管理局(2023-08-04) (2).xls',sheet1$)
order by 桥梁身份码 desc,桥幅编号,中心桩号

--6、对比其他指标1
select a0102,ha0102,a0103,k6002,k0101,hk0304,k6003,k6001,k6040,
k6008,桥梁全长,K6065,跨径总长,k6063,最大跨径,k6066,桥面总宽,k6009,桥面净宽,hk6007,跨径分类,hk6004,桥梁性质,hk6016,主桥上部类型,hk6111,主桥上部材料,hk6017,桥墩类型,hk6022,设计荷载等级,hk6023,抗震等级,
hk6005,跨越地物类型,k6006,跨越地物名称,hK6024,通航等级,ha1328,墩台防撞设施类型,k6062,是否互通立交,
k6079,建设单位,k6030,设计单位,K6031,施工单位,K6032,监理单位,K6100,修建年度,K0116,通车时间,
hA1313,管养单位性质,a1314,[管理（养）单位],K6112,监管单位,ha1302,收费性质,
hk6028,桥梁技术状况,a1305,最近评定日期,ha1307,交通管制措施,ha0103,所在政区,hk6117,行车方向,hk6118,是否宽路窄桥,hk6119,是否在长大桥梁目录,hk6120,是否为跨省桥梁,
case when  k6008<>桥梁全长 then '桥梁全长不一致' else '' end,
case when  K6065<>跨径总长 then '跨径总长不一致' else '' end,
case when  k6063<>最大跨径 then '最大跨径不一致' else '' end,
case when  k6066<>桥面总宽 then '桥面总宽不一致' else '' end,
case when  k6009<>桥面净宽 then '桥面净宽不一致' else '' end,
case when  hk6007<>跨径分类 then '跨径分类不一致' else '' end,
case when  hk6004<>桥梁性质 then '桥梁性质不一致' else '' end,
case when  hk6016<>主桥上部类型 then '主桥上部类型不一致' else '' end,
case when  hk6111<>主桥上部材料 then '主桥上部材料不一致' else '' end,
case when  桥墩类型 not like (''+hk6017+'%') then '桥墩类型不一致' else '' end,
--case when  桥墩类型<>hk6017 then '桥墩类型不一致' else '' end,
case when  hk6022<>设计荷载等级 then '设计荷载等级不一致' else '' end,
case when  hk6023<>抗震等级 then '抗震等级不一致' else '' end,
case when hk6005<>跨越地物类型 then '跨越地物类型不一致' else '' end,
case when k6006<>跨越地物名称 then '跨越地物名称不一致' else '' end,
case when hK6024<>通航等级 then '通航等级不一致' else '' end,
case when ha1328<>墩台防撞设施类型 then '墩台防撞设施类型不一致' else '' end,
case when k6062<>是否互通立交 then '是否互通立交不一致' else '' end,
case when k6079<>建设单位 then '建设单位不一致' else '' end,
case when k6030<>设计单位 then '设计单位不一致' else '' end,
case when K6031<>施工单位 then '施工单位不一致' else '' end,
case when K6032<>监理单位 then '监理单位不一致' else '' end,
case when K6100<>修建年度 then '修建年度不一致' else '' end,
case when K0116<>通车时间 then '通车时间不一致' else '' end,
case when hA1313<>管养单位性质 then '管养单位性质不一致' else '' end,
case when a1314<>[管理（养）单位] then '管养单位名称不一致' else '' end,
case when K6112<>监管单位 then '监管单位不一致' else '' end,
case when ha1302<>收费性质 then '收费性质不一致' else '' end,
case when hk6028<>桥梁技术状况 then '桥梁技术状况不一致' else '' end,
case when a1305<>最近评定日期 then '最近评定日期不一致' else '' end,
case when ha1307<>交通管制措施 then '交通管制措施不一致' else '' end,
case when ha0103<>所在政区 then '所在政区不一致' else '' end,
case when hk6117<>行车方向 then '行车方向不一致' else '' end,
case when hk6118<>是否宽路窄桥 then '是否宽路窄桥不一致' else '' end,
case when hk6119<>是否在长大桥梁目录 then '是否在长大桥梁目录不一致' else '' end,
case when hk6120<>是否为跨省桥梁 then '是否为跨省桥梁不一致' else '' end
from 
(
select a0102,ha0102,a0103,k6002,k0101,hk0304,k6003,k6001,k6040,
k6008,桥梁全长,K6065,跨径总长,k6063,最大跨径,k6064,跨径组合,k6066,桥面总宽,k6009,桥面净宽,hk6007,跨径分类,hk6004,桥梁性质,hk6016,主桥上部类型,hk6111,主桥上部材料,hk6017,桥墩类型,hk6022,设计荷载等级,hk6023,抗震等级,
hk6005,跨越地物类型,k6006,跨越地物名称,hK6024,通航等级,ha1328,墩台防撞设施类型,k6062,是否互通立交,
k6079,建设单位,k6030,设计单位,K6031,施工单位,K6032,监理单位,K6100,修建年度,K0116,通车时间,
hA1313,管养单位性质,a1314,[管理（养）单位],K6112,监管单位,ha1302,收费性质,
hk6028,桥梁技术状况,a1305,最近评定日期,ha1307,交通管制措施,ha0103,所在政区,hk6117,行车方向,hk6118,是否宽路窄桥,hk6119,是否在长大桥梁目录,hk6120,是否为跨省桥梁
from #nb2 full join #qlk2 on k6040=桥梁身份码
where k6040 is not null and 桥梁身份码 is not null
union
select a0102,ha0102,a0103,k6002,k0101,hk0304,k6003,k6001,k6040,
k6008,桥梁全长,K6065,跨径总长,k6063,最大跨径,k6064,跨径组合,k6066,桥面总宽,k6009,桥面净宽,hk6007,跨径分类,hk6004,桥梁性质,hk6016,主桥上部类型,hk6111,主桥上部材料,hk6017,桥墩类型,hk6022,设计荷载等级,hk6023,抗震等级,
hk6005,跨越地物类型,k6006,跨越地物名称,hK6024,通航等级,ha1328,墩台防撞设施类型,k6062,是否互通立交,
k6079,建设单位,k6030,设计单位,K6031,施工单位,K6032,监理单位,K6100,修建年度,K0116,通车时间,
hA1313,管养单位性质,a1314,[管理（养）单位],K6112,监管单位,ha1302,收费性质,
hk6028,桥梁技术状况,a1305,最近评定日期,ha1307,交通管制措施,ha0103,所在政区,hk6117,行车方向,hk6118,是否宽路窄桥,hk6119,是否在长大桥梁目录,hk6120,是否为跨省桥梁
from #nb2 full join #qlk2 on replace(replace(k6001,'H','G'),'T','S')=桥幅编号 and k6002=桥幅名称 and k6003=中心桩号 
where k6040 is null
) as a
where k6008<>桥梁全长 
or K6065<>跨径总长 
or k6063<>最大跨径 
or k6066<>桥面总宽 
or k6009<>桥面净宽 
or hk6007<>跨径分类 
or hk6004<>桥梁性质 
or hk6016<>主桥上部类型 
or hk6111<>主桥上部材料 
or 桥墩类型 not like (''+hk6017+'%')
--or hk6017<>桥墩类型
or hk6022<>设计荷载等级
or hk6023<>抗震等级
or hk6005<>跨越地物类型
or k6006<>跨越地物名称
or hK6024<>通航等级
or ha1328<>墩台防撞设施类型
or k6062<>是否互通立交
or k6079<>建设单位
or k6030<>设计单位
or K6031<>施工单位
or K6032<>监理单位
or K6100<>修建年度
or K0116<>通车时间
or hA1313<>管养单位性质
or a1314<>[管理（养）单位]
or K6112<>监管单位
or ha1302<>收费性质
or hk6028<>桥梁技术状况
or a1305<>最近评定日期
or ha1307<>交通管制措施
or ha0103<>所在政区
or hk6117<>行车方向
or hk6118<>是否宽路窄桥
or hk6119<>是否在长大桥梁目录
or hk6120<>是否为跨省桥梁
order by k6040 desc


