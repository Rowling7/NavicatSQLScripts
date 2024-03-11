----------------12.2.ah

select 
CASE WHEN GROUPING(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))=1 THEN '合计' 
	ELSE MAX(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))
END K0101,
CASE WHEN GROUPING(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))=1 THEN ''
	ELSE MAX(RTRIM(A50.K0112)) 
END K0112,
sum(isnull(a3011,0)+isnull(a3065,0)+isnull(a3078,0)+isnull(a3086,0)+isnull(a3087,0)),--本年投资合计
sum(isnull(a3011,0)), --日常养护本年完成投资
sum(isnull(a3065,0)),--预防养护本年完成投资
sum(isnull(a3076,0)),--预防养护路面本年完成投资
	sum(isnull(a3077,0)) a3077,--预防养护路面本年完成里程
	sum(isnull(a3078,0)) a3078,--修复养护本年完成投资
	sum(isnull(a3080,0)) a3080,--修复养护路面本年完成投资
    sum(isnull(a3081,0)) a3081,--修复养护路面本年完成里程
	sum(isnull(a3082,0)) a3082,--修复养护桥梁本年完成投资
	sum(isnull(a3083,0)) a3083,--修复养护桥梁本年完成里程
	sum(isnull(a3084,0)) a3084,--修复养护隧道本年完成投资
	sum(isnull(a3085,0)) a3085,--修复养护隧道本年完成里程
	sum(isnull(a3086,0)) a3086,--专项修复本年完成投资
	sum(isnull(a3087,0)) a3087,--应急养护本年完成投资
	sum(isnull(a3088,0)) a3088,--本年绿化投入资金合计
	sum(isnull(a3092,0)) a3092,--废旧沥青路面材料生成量
	sum(isnull(a3093,0)) a3093,--废旧沥青路面材料循环利用量
CAST(sum(isnull(a3093,0))/nullif(sum(isnull(a3092,0)),0)*100 as NUMERIC(5,2)) a3091,--公路废旧沥青路面材料循环利用率
--CAST(SUM(CASE WHEN ISNULL(A3077,0)<>0 OR ISNULL(A3081,0)<>0 THEN (ISNULL(A3077,0)+ISNULL(A3081,0))*ISNULL(A3091,0) ELSE 0 END)/
--	NULLIF(SUM(CASE WHEN ISNULL(A3077,0)<>0 OR ISNULL(A3081,0)<>0 THEN ISNULL(A3077,0)+ISNULL(A3081,0) ELSE 0 END),0) AS NUMERIC(5,2))  a3091 --（旧算法）公路废旧沥青路面材料循环利用率
a3094,ha3094,--循环利用方式
sum(isnull(a3095,0)) a3095 --废旧沥青路面材料实际用量
from B17 left join a50 on B17.a0102=a50.a0102 and B17.k0101=a50.k0101
left join k01 on a50.a0102=k01.a0102 and a50.k0101=k01.k0101
where 
B17.a0102 like '34%'  and isnull(k01.k0304,'')<>'10'
	and B17.a0101 = '2023' and left(b17.k0101,1) in ('G','H','S','T')
GROUP BY RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),a3094,ha3094 WITH ROLLUP
having grouping(a3094)=grouping(ha3094)  and (grouping(a3094)=0 or (grouping(a3094)=1 and grouping(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))=1))
ORDER BY RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(B17.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))








