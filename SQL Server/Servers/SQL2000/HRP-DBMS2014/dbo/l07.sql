drop table #aa
select 
桥梁名称,
桥梁代码,
桥梁中心桩号,
路线编号,
[桥梁全长(米)],
[跨径总长(米)],
[单孔最大跨径(米)],
[跨径组合(孔*米)],
[桥梁全宽(米)],
[桥面净宽(米)],
桥梁按跨径分类代码,
桥梁按使用年限分类代码,
主桥上部结构类型代码,
主桥上部结构材料代码,
桥墩类型代码,
桥梁设计荷载等级代码,
桥梁抗震等级代码,
case when 桥梁通航等级='不通航' then '0' when 桥梁通航等级='一级' then '1' when 桥梁通航等级='二级' then '2' when 桥梁通航等级='三级' then '3'when 桥梁通航等级='四级' then '4' when 桥梁通航等级='五级' then '5' when 桥梁通航等级='六级' then '6' else  '7'	end 桥梁通航等级,
桥梁跨越地物代码,
桥梁跨越地物名称,
case when 桥梁墩台防撞设施类型='无防护' then '3' when 桥梁墩台防撞设施类型='软防护' then '1' else '2' end 桥梁墩台防撞设施类型,
case when 桥梁是否互通立交='是' then'1' else  '6'end 桥梁是否互通立交,
桥梁建设单位,
桥梁设计单位,
桥梁施工单位,
桥梁监理单位,
桥梁修建年度,
桥梁建成通车日期,
桥梁管养单位性质代码,
桥梁管养单位名称,
桥梁监管单位名称,
桥梁收费性质代码,
技术状况评定代码,
技术状况评定日期,
技术状况评定单位,
所在政区代码,
备注,
桥梁身份码	
INTO ##AA 	
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=D:\Desktop\汇总\交公路07表-03011511 (3).xls',L07$)




/*
SELECT K6002 
FROM K060 
INNER JOIN #AA ON 		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' and left(k0101,1)in ('g','h') ('s','t')*/




----------------------桥梁设计荷载等级代码
SELECT K6022,桥梁设计荷载等级代码
--update k060 set K6022=rtrim(桥梁设计荷载等级代码)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  and K6022<>桥梁设计荷载等级代码

SELECT A0102,K6002,K6022,HK6022 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6022=RTRIM(OBJJC)
FROM K060 
LEFT JOIN WQ010 ON K6022=OBJNAME
WHERE HK6022<>OBJNAME


-------------[桥梁全长(米)]
SELECT A0102,case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001),桥梁代码,[桥梁全长(米)],K6008--SUM(CAST ([桥梁全长(米)] AS NUMERIC(18,3)))
FROM #AA 
INNER JOIN K060 ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
WHERE LEFT (桥梁代码,1) IN ('G','H') AND [桥梁全长(米)]<>K6008

update k060 set K6008=[桥梁全长(米)]
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 


----------------桥梁身份码
update k060 set k6040=桥梁身份码
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 

------桥梁名称
SELECT K6002,RTRIM(桥梁名称)
--update k060 set K6002=RTRIM(桥梁名称)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 
and  K6002<>RTRIM(桥梁名称)

---------桥梁中心桩号
SELECT K6003,桥梁中心桩号
--update k060 set K6003=桥梁中心桩号
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  and K6003<>桥梁中心桩号


update k060 set K6008=[桥梁全长(米)],K6065=[跨径总长(米)],K6063=[单孔最大跨径(米)],K6064=[跨径组合(孔*米)],K6066=[桥梁全宽(米)],K6009=[桥面净宽(米)],K6007=桥梁按跨径分类代码
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 

SELECT A0102,K6002,K6007,HK6007 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6007=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6003 ON LEFT(K6007,2)=OBJNAME 
WHERE HK6007<>OBJJC

SELECT A0102,K6002,K6007,HK6007 ,OBJNAME,OBJJC
--UPDATE K060 SET K6007=RTRIM(OBJNAME)
FROM K060 
LEFT JOIN DK6003 ON HK6007=OBJJC 
WHERE K6007<>OBJNAME

SELECT
K6004,桥梁按使用年限分类代码,
K6016,主桥上部结构类型代码,
k6024,桥梁通航等级
--update k060 set K6004=桥梁按使用年限分类代码,K6016=主桥上部结构类型代码,k6024=桥梁通航等级
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  --and k6002='十八里铺桥'
and (K6004<>桥梁按使用年限分类代码
or K6016<>left(主桥上部结构类型代码,2)
or k6024<>桥梁通航等级)



SELECT A0102,RTRIM(K6002) K6002,K6016,HK6016 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6016=RTRIM(OBJJC)
FROM K060 
LEFT JOIN WQ007 ON K6016=OBJNAME 
WHERE HK6016<>OBJJC --AND a0102 like '341%'

SELECT A0102,RTRIM(K6002) K6002,K6016,HK6016 ,OBJNAME,OBJJC
--UPDATE K060 SET K6007=RTRIM(OBJNAME)
FROM K060 
LEFT JOIN WQ007 ON HK6016=OBJJC 
WHERE K6016<>OBJNAME


SELECT A0102,RTRIM(K6002) K6002,K6004,HK6004 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6016=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6001 ON K6004=OBJNAME 
WHERE HK6004<>OBJJC --AND a0102 like '341%'

SELECT A0102,RTRIM(K6002) K6002,K6004,HK6004 ,OBJNAME,OBJJC
--UPDATE K060 SET K6007=RTRIM(OBJNAME)
FROM K060 
LEFT JOIN DK6001 ON HK6004=OBJJC 
WHERE K6004<>OBJNAME


SELECT A0102,RTRIM(K6002) K6002,K6024,HK6024 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6024=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6012 ON K6024=OBJNAME 
WHERE HK6024<>OBJJC --AND a0102 like '341%'

SELECT A0102,RTRIM(K6002) K6002,K6004,HK6004 ,OBJNAME,OBJJC
--UPDATE K060 SET K6024=RTRIM(OBJNAME)
FROM K060 
LEFT JOIN DK6012 ON HK6024=OBJJC 
WHERE K6024<>OBJNAME


------------主桥上部结构材料代码
SELECT
桥梁代码,
K6110,主桥上部结构材料代码
--update k060 set K6110=left(主桥上部结构材料代码,2)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  
and (K6110<>left(主桥上部结构材料代码,2))

SELECT A0102,RTRIM(K6002) K6002,K6110,HK6110 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6110=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6035 ON K6110=OBJNAME 
WHERE HK6110<>OBJJC



SELECT K0180,桥梁修建年度
--update k060 set K0180=桥梁修建年度
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' and K0180<>桥梁修建年度


SELECT A0102,K0180,桥梁修建年度
FROM #AA 
INNER JOIN K060 ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
WHERE LEFT (桥梁代码,1) IN ('G','H') AND (K0180='2023' OR 桥梁修建年度='2023' )
-- AND K0180<>桥梁修建年度


SELECT  K0180,A3219,HA3219--,COUNT(*) 
--UPDATE K060 SET A3219='9',HA3219='其他'
FROM K060 
WHERE HA3219='新建'
AND K0180 <>'2023' 
AND LEFT(K0101,1) in('G','H')


SELECT  K0180,HA3219
--UPDATE K060 SET A3219='1',HA3219='新建'
FROM K060 
WHERE K0180 ='2023' and HA3219='其他'

 
SELECT  a3219,HA3219,count(*)
--UPDATE K060 SET A3219='1',HA3219='新建'
FROM K060 
where LEFT(K0101,1) in('G','H')
GROUP BY a3219,HA3219



update k060 set K6005=桥梁跨越地物代码,K6062=桥梁是否互通立交,K0180=桥梁修建年度
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 


SELECT A0102,RTRIM(K6002) K6002,K6005,HK6005 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6005=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6002 ON K6005=OBJNAME 
WHERE HK6005<>OBJJC 

SELECT A0102,RTRIM(K6002) K6002,K6062,HK6062 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6062=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6016 ON K6062=OBJNAME 
WHERE HK6062<>OBJJC 


update k060 set K0116=桥梁建成通车日期,A1302=桥梁收费性质代码
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 

SELECT A0102,RTRIM(K6002) K6002,A1302,HA1302 ,OBJNAME,OBJJC
--UPDATE K060 SET HA1302=RTRIM(OBJJC)
FROM K060 
LEFT JOIN WQ003 ON A1302=OBJNAME 
WHERE HA1302<>OBJJC 


select  A1305,技术状况评定日期
--update k060 set A1305=rtrim(技术状况评定日期)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  and A1305<>技术状况评定日期


select  K6028,技术状况评定代码,case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001),桥梁代码
--update k060  set K6028=rtrim(技术状况评定代码)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  
and K6028<>技术状况评定代码 

SELECT A0102,RTRIM(K6002) K6002,K6028,HK6028 ,OBJNAME,OBJJC
--UPDATE K060 SET HK6028=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6014 ON K6028=OBJNAME 
WHERE HK6028<>OBJJC -- AND K6028 ='9'

select  rtrim(K6050),rtrim(技术状况评定单位)
--update k060  set K6050=rtrim(技术状况评定单位)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'  and rtrim(K6050)<>rtrim(技术状况评定单位)

update k060 set A0103=所在政区代码,a1314=桥梁管养单位名称
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 

SELECT A0102,RTRIM(K6002) K6002,A0103,HA0103 ,OBJNAME,OBJJC
--UPDATE K060 SET HA0103=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DZ0101 ON A0103=OBJNAME 
WHERE HA0103<>OBJJC

update k060 set k0199=备注
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 

SELECT
k6079,桥梁建设单位,
k6030,桥梁设计单位,
k6031,桥梁施工单位,
k6032,桥梁监理单位,
K6111,桥梁监管单位名称
--update k060 set k6079=rtrim(桥梁建设单位),k6030=rtrim(桥梁设计单位),k6031=rtrim(桥梁施工单位),k6032=rtrim(桥梁监理单位),K6111=rtrim(桥梁监管单位名称)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 
and (
k6079<>桥梁建设单位 or 
k6030<>桥梁设计单位 or 
k6031<>桥梁施工单位 or 
k6032<>桥梁监理单位 OR 
K6111<>桥梁监管单位名称
)



SELECT
桥梁代码,k6017,桥墩类型代码,hk6017
--update k060 set k6017=left(桥墩类型代码,2)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%'
and 
k6017<>left(桥墩类型代码,2)


SELECT A0102,RTRIM(K6002) K6002,k6017,Hk6017,OBJNAME,OBJJC
--UPDATE K060 SET Hk6017=RTRIM(OBJJC)
FROM K060 
LEFT JOIN DK6005 ON k6017=OBJNAME 
WHERE Hk6017<>OBJJC 


SELECT
桥梁代码,A1313,桥梁管养单位性质代码,hA1313
--update k060 set A1313=RTRIM(桥梁管养单位性质代码)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' 
and 
A1313<>桥梁管养单位性质代码


SELECT A0102,RTRIM(A1313) K6002,A1313,HA1313,OBJNAME,OBJJC
--UPDATE K060 SET HA1313=RTRIM(OBJJC)
FROM K060 
LEFT JOIN WQ004 ON A1313=OBJNAME 
WHERE HA1313<>OBJJC 



---------桥梁墩台防撞设施类型
SELECT
桥梁代码,A1328,桥梁墩台防撞设施类型,hA1328
--update k060 set A1313=RTRIM(桥梁管养单位性质代码)
from K060 
INNER JOIN #AA  ON case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=桥梁代码
where  a0102 like '341%' --AND 桥梁代码='G220341225L0830'
and 
A1328<>桥梁墩台防撞设施类型


SELECT A0102,RTRIM(K6002) K6002,A1328,HA1328,OBJNAME,OBJJC
--UPDATE K060 SET HA1328=RTRIM(OBJJC)
FROM K060 
LEFT JOIN WQ009 ON A1328=OBJNAME 
WHERE HA1328<>OBJJC 





-----------更新 K060 
SELECT BN,K6040,A,B,K6002,G,K6008
FROM  K060
INNER JOIN  NB ON BN=K6040 
WHERE RTRIM(A)<>RTRIM(K6002) 
OR G<>K6008

SELECT K6040,A,B,K6002,H,K6065
FROM  K060
INNER JOIN  NB ON BN=K6040 
WHERE H<>K6065



--出桥梁表

SELECT 
[a],[b],[c],[d],[e],[f],[g],[h],[i],[j],[k],[l],[m],[n],[o],[p],[q],[r],[s],[t],[u],[v],[w],[x],[y],[z],[aa],[ab],[ac],[ad],[ae],[af],[ag],[ah],[ai],[aj],[ak],[al],[am],[an],[ao],[ap],[aq],[ar],[as],[at],[au],[av],[aw],[ax],[ay],[az],[ba],[bb],[bc],[bd],[be],[bf],[bg],[bh],[bi],[bj],[bk],[bl],[bm],[bn]
FROM NB