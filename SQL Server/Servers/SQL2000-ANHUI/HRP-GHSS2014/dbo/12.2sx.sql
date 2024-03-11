
select 
(case when grouping(b17.k0101)=1 then '合计' else
	case when (charindex('D',b17.k0101) = 0 and len(b17.k0101)>9) then left(rtrim(b17.k0101),4) else rtrim(b17.k0101) end end),  	--路线编码
(case when grouping(b17.k0101)=1 then '' else max(rtrim(a50.k0112)) end),  --路线名称
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
FROM B17
LEFT JOIN A50 ON B17.A0102=A50.A0102 AND B17.K0101=A50.K0101
left join k01 on B17.A0102=k01.A0102 AND B17.K0101=k01.K0101
WHERE B17.A0102 LIKE '34%' 
and  k01.k0304<>'10'
AND B17.A0101 = '2023'
and left(b17.k0101,1) in ('G','H','S','T')
 
group by B17.k0101,a3094,ha3094 with rollup
having grouping(a3094)=grouping(ha3094)  and (grouping(a3094)=0 or (grouping(a3094)=1 and grouping(b17.k0101)=1))
order by B17.k0101
