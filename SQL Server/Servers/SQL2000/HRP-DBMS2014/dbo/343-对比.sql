/*
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk060'))
drop table tk060
SELECT
[F1],[F2],[F3],[F4],[F5],[F6],[F7],[F8],[F9],[F10],[F11],[F12],[F13],[F14],[F15],[F16],[F17],[F18],[F19],[F20],[F21],[F22],[F23],[F24],[F25],[F26],[F27],[F28],[F29],[F30],[F31],[F32],[F33],[F34],[F35],[F36],[F37],[F38],[F39],[F40],[F41],[F42],[F43],[F44],[F45],[F46],[F47],[F48],[F49],[F50],[F51],[F52],[F53],[F54],[F55],[F56],[F57],[F58],[F59],[F60]
into tk060
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240228 桥梁对比\交控\343-1500.xlsx',sheet1$)

SELECT
[F1],[F2],[F3],[F4],[F5],[F6],[F7],[F8],[F9],[F10],[F11],[F12],[F13],[F14],[F15],[F16],[F17],[F18],[F19],[F20],[F21],[F22],[F23],[F24],[F25],[F26],[F27],[F28],[F29],[F30],[F31],[F32],[F33],[F34],[F35],[F36],[F37],[F38],[F39],[F40],[F41],[F42],[F43],[F44],[F45],[F46],[F47],[F48],[F49],[F50],[F51],[F52],[F53],[F54],[F55],[F56],[F57],[F58],[F59],[F60]
from  tk060



SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002
from  tk060
INNER join [HRP-DBMS2014]..k060  on k6040=F58 
ORDER BY [F1] 
*/


--桥梁名称 中心桩号  
SELECT
[F42],[F1],[F58],[F4],k6040,RTRIM(k6002) k6002,k6003,CASE WHEN CONVERT(DECIMAL(18,3),[F4])=RTRIM(k6003)THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6003=[F4]
from  tk060
INNER join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE  [F1]<>RTRIM(k6002)
ORDER BY DIFF 


--桥梁全长（米）	跨径总长 （米）	单孔最大跨径 （米）
SELECT
[F42],[F1],[F58],RTRIM(k6040) k6040,RTRIM(k6002) k6002,
[F9],k6008,
[F10],K6065,
[F11],K6063,
[F15],K6007,
[F16],HK6007,
CASE WHEN CONVERT(DECIMAL(18,3),[F9])=RTRIM(k6008)THEN 1 ELSE 0 END  DIFF,
CASE WHEN CONVERT(DECIMAL(18,3),[F10])=RTRIM(k6065)THEN 1 ELSE 0 END  DIFF2,
CASE WHEN CONVERT(DECIMAL(18,3),[F11])=RTRIM(k6063)THEN 1 ELSE 0 END  DIFF3
--UPDATE [HRP-DBMS2014]..k060 SET k6008=[F9],k6065=[F10],k6063=F11,k6007=F15,HK6007=rtrim(F16)
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE ([F9]<>RTRIM(k6008)OR [F10]<>RTRIM(k6065) OR [F11]<>RTRIM(k6063) OR [F15]<>RTRIM(K6007))
and (CASE WHEN CONVERT(DECIMAL(18,3),[F9])=RTRIM(k6008)THEN 1 ELSE '0' END ='0' or 
CASE WHEN CONVERT(DECIMAL(18,3),[F10])=RTRIM(k6065)THEN 1 ELSE '0' END ='0' or
CASE WHEN CONVERT(DECIMAL(18,3),[F11])=RTRIM(k6063)THEN 1 ELSE '0' END ='0' )
ORDER BY DIFF

--桥梁全宽 （米）	桥面净宽 （米）--4
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F13],k6066,
[F14],K6009,
CASE WHEN CONVERT(DECIMAL(18,3),RTRIM(k6066))=[F13]THEN 1 ELSE 0 END  DIFF,
CASE WHEN CONVERT(DECIMAL(18,3),RTRIM(K6009))=[F14]THEN 1 ELSE 0 END  DIFF2
--UPDATE [HRP-DBMS2014]..k060 SET k6066=RTRIM([F13]),K6009=RTRIM([F14])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE CONVERT(DECIMAL(18,3),RTRIM(k6066))<>[F13] OR CONVERT(DECIMAL(18,3),RTRIM(K6009))<>[F14]
ORDER BY [F1],DIFF 


--I|iⅠ 主桥上部构造结构形式			--5

SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F19],k6016,
[F20],hK6016,
CASE WHEN RTRIM(k6016)=[F19]THEN 1 ELSE 0 END  DIFF,
CASE WHEN RTRIM(hK6016)=[F20]THEN 1 ELSE 0 END  DIFF2
--UPDATE [HRP-DBMS2014]..k060 SET k6016=RTRIM([F19]),hK6016=RTRIM([F20])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE (RTRIM(k6016)<>[F19] OR RTRIM(hK6016)<>[F20] ) --AND F19 <>'14'
ORDER BY [F1],DIFF


---	主桥上部构造结构形式材料	
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F21],k6110,
[F22],hk6110,
CASE WHEN RTRIM(k6110)=[F21]THEN 1 ELSE 0 END  DIFF,
CASE WHEN RTRIM(hk6110)=[F22]THEN 1 ELSE 0 END  DIFF2
--UPDATE [HRP-DBMS2014]..k060 SET k6110=RTRIM([F21])--,hK6016=RTRIM([F20])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE (RTRIM(k6110)<>[F21] OR RTRIM(hk6110)<>[F22] )--and f20 not  like '薄壳桥%' --AND F19 <>'14'
ORDER BY [F1],DIFF --SELECT * from [HRP-DBMS2014]..dk6035

SELECT rtrim(k6040),k6110,rtrim(objname),hk6110,RTRIM([objjc])
--update [HRP-DBMS2014]..k060 set hk6110=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..dk6035 on k6110=rtrim(objname)
where hk6110<>RTRIM([objjc])


--桥墩类型---38
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F23],k6017,
[F24],hk6017,
CASE WHEN RTRIM(k6017)=[F23]THEN 1 ELSE 0 END  DIFF,
CASE WHEN RTRIM(hk6017)=[F24]THEN 1 ELSE 0 END  DIFF2
--UPDATE [HRP-DBMS2014]..k060 SET k6017=RTRIM([F23])--,hk6017=RTRIM([F24])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE (RTRIM(k6017)<>[F23] OR RTRIM(hk6017)<>[F24]) --and [F42]='宿州中心'
ORDER BY [F1],DIFF

SELECT rtrim(k6040),k6017,rtrim(objname),hk6017,RTRIM([objjc])
--update [HRP-DBMS2014]..k060 set hk6017=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..dk6005 on k6017=rtrim(objname)
where hk6017<>RTRIM([objjc])



--设计荷载等级
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F25],k6022,
CASE WHEN RTRIM(k6022)=[F25]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6022=RTRIM([F25])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k6022)<>[F25] 
ORDER BY [F1],DIFF

SELECT rtrim(k6040),k6022,rtrim(objname),hk6022,RTRIM([objjc])
--update [HRP-DBMS2014]..k060 set hk6022=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..WQ010 on k6022=rtrim(objname)
where hk6022<>RTRIM([objjc])



--跨越地物类型
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F29],k6005,
CASE WHEN RTRIM(k6005)=[F29]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6005=RTRIM([F29])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k6005)<>[F29] 
ORDER BY [F1],DIFF

SELECT rtrim(k6040),k6005,rtrim(objname),hk6005,RTRIM([objjc])
--update [HRP-DBMS2014]..k060 set hk6005=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..DK6002 on k6005=rtrim(objname)
where hk6005<>RTRIM([objjc])


--跨越地物名称  --2
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F31],k6006,
CASE WHEN RTRIM(k6005)=[F29]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6006=RTRIM([F31])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k6006)<>[F31]  --and [f42]<>'芜湖中心'
ORDER BY [F1],DIFF


--建设单位	设计单位	施工单位	监理单位
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F35],rtrim(k6079) k6079,
[F36],rtrim(k6030) k6030,
[F37],rtrim(k6031) k6031,
[F38],rtrim(k6032) k6032,
CASE WHEN RTRIM(k6079)=[F35]THEN 1 ELSE 0 END  DIFF,
CASE WHEN RTRIM(k6030)=[F36]THEN 1 ELSE 0 END  DIFF2,
CASE WHEN RTRIM(k6031)=[F37]THEN 1 ELSE 0 END  DIFF3,
CASE WHEN RTRIM(k6032)=[F38]THEN 1 ELSE 0 END  DIFF4
--UPDATE [HRP-DBMS2014]..k060 SET k6079=RTRIM([F35]),k6030=RTRIM([F36]),k6031=RTRIM([F37]),k6032=RTRIM([F38])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k6079)<>[F35] OR 
RTRIM(k6030)<>[F36]OR 
RTRIM(k6031)<>[F37]OR --160
RTRIM(k6032)<>[F38] --133
ORDER BY [F1],DIFF


--修建年度	建成通车日期
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F39],k0180,
[F40],K0116,
CASE WHEN RTRIM(k0180)=[F39]THEN 1 ELSE 0 END  DIFF,
CASE WHEN RTRIM(K0116)=[F40]THEN 1 ELSE 0 END  DIFF2
--UPDATE [HRP-DBMS2014]..k060 SET k0180=RTRIM([F39]),K0116=RTRIM([F40])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k0180)<>[F39] OR 
RTRIM(K0116)<>[F40] 
ORDER BY [F1]



--评定等级	
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F46],k6028,
CASE WHEN RTRIM(k6028)=[F46]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6028=RTRIM([F46])
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(k6028)<>[F46] 
ORDER BY [F1],DIFF

SELECT rtrim(k6040),k6028,rtrim(objname),hk6028,RTRIM([objjc])
--update [HRP-DBMS2014]..k060 set hk6028=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..DK6014 on k6028=rtrim(objname)
where hk6028<>RTRIM([objjc])              

--评定日期	
SELECT
[F42],[F1],[F58],rtrim(k6040) k6040,RTRIM(k6002) k6002,
[F48],A1305,
[F49],K6050,
CASE WHEN RTRIM(A1305)=[F48]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET A1305=RTRIM([F48]),K6050=rtrim([F49]) 
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE RTRIM(A1305)<>[F48] OR RTRIM(K6050)<>[F49] 
ORDER BY [F1],DIFF
																																																													
--防洪 --100年																																																												
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F59],REPLACE(Hk0149,'年','') Hk0149,
CASE WHEN REPLACE(Hk0149,'年','')=[F59]THEN 1 ELSE 0 END  DIFF,RTRIM([F59])+'年'
--UPDATE [HRP-DBMS2014]..k060 SET k0149='7',hk0149='100年'
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE REPLACE(Hk0149,'年','')<>[F59] and [f59]='100'
ORDER BY [F1],DIFF

--防洪 --300年
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F59],REPLACE(Hk0149,'年','') Hk0149,
CASE WHEN REPLACE(Hk0149,'年','')=[F59]THEN 1 ELSE 0 END  DIFF,RTRIM([F59])+'年'
--UPDATE [HRP-DBMS2014]..k060 SET k0149='8',hk0149='300年'
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE REPLACE(Hk0149,'年','')<>[F59] and [f59]='300'
ORDER BY [F1],DIFF

--防洪--101
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F59],REPLACE(Hk0149,'年','') Hk0149,
CASE WHEN REPLACE(Hk0149,'年','')=[F59]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k0149='7',hk0149='100年'
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE REPLACE(Hk0149,'年','')<>[F59] AND [f59]='其他'
ORDER BY [F1],DIFF



--所在位置
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F53],k6117,rtrim(hk6117) hk6117,
CASE WHEN rtrim(hk6117)=[F53]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6117='2',hk6117='下行'
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE rtrim(hk6117)<>[F53] and [F53]='下行'  --169
ORDER BY [F1],DIFF

SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F53],k6117,rtrim(hk6117) hk6117,
CASE WHEN rtrim(hk6117)=[F53]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET k6117='1',hk6117='上行'
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE rtrim(hk6117)<>[F53] and [F53]='上行'  --169
ORDER BY [F1],DIFF



--F52
SELECT
[F42],[F1],[F58],k6040,RTRIM(k6002) k6002,
[F52],a0103,ha0103,
CASE WHEN rtrim(a0103)=[F52]THEN 1 ELSE 0 END  DIFF
--UPDATE [HRP-DBMS2014]..k060 SET a0103=[F52]
from  tk060
left join [HRP-DBMS2014]..k060  on k6040=F58 
WHERE rtrim(a0103)<>[F52] 
ORDER BY [F1],DIFF


SELECT rtrim(k6040),a0103,rtrim(objname) objname,ha0103,RTRIM([objjc]) objjc
--update [HRP-DBMS2014]..k060 set ha0103=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..Dz0101 on a0103=rtrim(objname)
where ha0103<>RTRIM([objjc]) 

SELECT rtrim(k6040),a0103,rtrim(objname) objname,ha0103,RTRIM([objjc]) objjc
--update [HRP-DBMS2014]..k060 set ha0103=RTRIM([objjc])
from [HRP-DBMS2014]..k060
left join [HRP-DBMS2014]..Dz0101 on ha0103=rtrim(objjc)
where a0103<>RTRIM([objname]) 


--桥梁编号
DROP TABLE #tk0060
SELECT *  
into #tk0060
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240228 桥梁对比\交控\jiaokong.xls',sheet3$)
where 改动情况 ='按左侧编号改年报'



SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座] --and k0101 in ('H36') and a0102 ='34303'
--and a0102 ='34322'
--group by rtrim(k0101)
--and [392座] in ('g0321','H0321')
order by a0102


--34303------H0321  G0321  --62+62
SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
--update [HRP-DBMS2014]..k060 set k0101='H369'
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座]   and k0101 in ('g0321') and a0102 ='34303'

SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
--update [HRP-DBMS2014]..k060 set k0101='G369'
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座]   and k0101 in ('H0321') and a0102 ='34303'

select a0102,k0101
-- update [HRP-DBMS2014]..k060 set k0101='H0321'
from k060
where k0101='H369'and a0102 ='34303'

select a0102,k0101
-- update [HRP-DBMS2014]..k060 set k0101='G0321'
from k060
where k0101='G369'and a0102 ='34303'



----34322-H0321 --34
SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
--update [HRP-DBMS2014]..k060 set k0101='h0321'
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座]   and [392座] in ('H0321') and a0102 ='34322'


---------------
SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
--update [HRP-DBMS2014]..k060 set k0101='H369'
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座]   and k0101 in ('g36') and a0102 ='34303'

SELECT a0102,rtrim(k0101) k0101,[392座] ,k6040,[F1],CASE WHEN rtrim(k0101)=[392座]THEN 1 ELSE 0 END  DIFF
--update [HRP-DBMS2014]..k060 set k0101='G369'
from #tk0060
left join [HRP-DBMS2014]..k060  on k6040=[F1]
where rtrim(k0101)<>[392座]   and k0101 in ('h36') and a0102 ='34303'

select a0102,k0101
-- update [HRP-DBMS2014]..k060 set k0101='H36'
from k060
where k0101='H369'and a0102 ='34303'

select a0102,k0101
-- update [HRP-DBMS2014]..k060 set k0101='G36'
from k060
where k0101='G369'and a0102 ='34303'



select  rtrim(a0102)+replace(rtrim(k0101),'H369','H36')+'A'+rtrim(k6001),COUNT(rtrim(a0102)+replace(rtrim(k0101),'H369','H36')+'A'+rtrim(k6001))
from k060 
where k0101 in('H369','H36')and a0102 ='34303'
GROUP BY rtrim(a0102)+replace(rtrim(k0101),'H369','H36')+'A'+rtrim(k6001)
ORDER BY COUNT(rtrim(a0102)+replace(rtrim(k0101),'H369','H36')+'A'+rtrim(k6001)) DESC


select k0101
--update [HRP-DBMS2014]..k060 set k0101=upper(k0101)
from [HRP-DBMS2014]..k060 
where k0101 collate Chinese_PRC_CS_AI like '%[abcdefghijklmnopqrstuvwxyz]%'

