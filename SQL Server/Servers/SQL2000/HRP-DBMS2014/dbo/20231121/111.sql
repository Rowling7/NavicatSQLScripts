SELECT 
		'K060'+'&k0101 ='''+RTRIM(CAST(k060.k0101 AS VARCHAR))+''' AND k6002='''+RTRIM(CAST(k060.k6002 AS VARCHAR))+''' AND K6003 ='+RTRIM(right(CAST(k060.K6003 AS VARCHAR),4))  AS 编辑,		
k0101,
K6002 ,K060.ZCPT_K6002,case WHEN isnull(K6002,'')<>isnull(k060.ZCPT_K6002,'') then '桥梁名称不一致' else null end 桥梁名称对比,
K6001 ,K060.ZCPT_K6001,case WHEN isnull(K6001,'')<>isnull(K060.ZCPT_K6001,'') then '桥梁代码不一致' else null end  桥梁代码对比,
K6003 ,K060.ZCPT_K6003,case WHEN isnull(K6003,'')<>isnull(K060.ZCPT_K6003,'') then '桥梁中心桩号不一致' else null end  桥梁中心桩号对比

FROM (
select A0102,left(rtrim(a.k0101),4) k0101,
a.K6002,b.K6002 'ZCPT_K6002',
case when left(a.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(a.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'L'+rtrim(a.k6001)
else left(a.k0101,4)+left(a.a0103,6)+'L'+rtrim(a.k6001) end K6001,rtrim(b.K6001) 'ZCPT_K6001',
a.K6003,b.K6003 'ZCPT_K6003'

FROM k060 a inner join ZCPT_K060	b on 
case when left(a.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(a.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'L'+rtrim(a.k6001)
else left(a.k0101,4)+left(a.a0103,6)+'L'+rtrim(a.k6001) end =rtrim(b.K6001)
) k060 
where  K060.k0101 is not null
and  k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' 
and COALESCE(case WHEN isnull(K6002,'')<>isnull(k060.ZCPT_K6002,'') then '桥梁名称不一致' else null end,case WHEN isnull(K6001,'')<>isnull(K060.ZCPT_K6001,'') then '桥梁代码不一致' else null end,case WHEN isnull(K6003,'')<>isnull(K060.ZCPT_K6003,'') then '桥梁中心桩号不一致' else null end)  like '%不一致%'
