--止点
--UPDATE K001 SET K0158= Case when len(K0158)  >0 then K0158   when len(K0158)  =0 or K0158   is null then null end
SELECT DISTINCT  K0158
FROM K001 
WHERE K0158 NOT in('1','2','3','4')

--UPDATE K001 SET HK0158= Case when len(HK0158)  >0 then HK0158   when len(HK0158)  =0 or HK0158   is null then null end
SELECT DISTINCT  HK0158
FROM K001 
WHERE HK0158 NOT LIKE'%界'



--UPDATE K001 SET K0157= Case when len(K0157)  >0 then K0157   when len(K0157)  =0 or K0157   is null then null end
SELECT DISTINCT  K0157
FROM K001 
WHERE K0157 NOT in('1','2')

--UPDATE K001 SET HK0157= Case when len(HK0157)  >0 then HK0157   when len(HK0157)  =0 or HK0157   is null then null end
SELECT DISTINCT  HK0157
FROM K001 
WHERE HK0157 NOT in('是','否')


--起点
--UPDATE K001 SET K0154= Case when len(K0154)  >0 then K0154   when len(K0154)  =0 or K0154   is null then null end
SELECT DISTINCT  K0154
FROM K001 
WHERE K0154 NOT in('1','2','3','4')

--UPDATE K001 SET HK0154= Case when len(HK0154)  >0 then HK0154   when len(HK0154)  =0 or HK0154   is null then null end
SELECT DISTINCT  HK0154
FROM K001 
WHERE HK0154 NOT LIKE'%界'


--UPDATE K001 SET K0153= Case when len(K0153)  >0 then K0153   when len(K0153)  =0 or K0153   is null then null end
SELECT DISTINCT  K0153
FROM K001 
WHERE K0153 NOT in('1','2')

--UPDATE K001 SET HK0153= Case when len(HK0153)  >0 then HK0153   when len(HK0153)  =0 or HK0153   is null then null end
SELECT DISTINCT  HK0153
FROM K001 
WHERE HK0153 NOT in('是','否')



--UPDATE K060 SET k6122= Case when len(k6122)  >0 then k6122   when len(k6122)  =0 or k6122   is null then null end,hk6122= Case when len(hk6122)  >0 then hk6122   when len(hk6122)  =0 or hk6122   is null then null end
FROM K060 
WHERE K0157 NOT in('1','2')



use [HRP-GHSS2014]
--UPDATE K60 SET a1317= Case when len(a1317)  >0 then a1317   when len(a1317)  =0 or a1317   is null then null end,ha1317= Case when len(ha1317)  >0 then ha1317   when len(ha1317)  =0 or ha1317   is null then null end
FROM K60 

--UPDATE K60 SET a1318= Case when len(a1318)  >0 then a1318   when len(a1318)  =0 or a1318   is null then null end,ha1318= Case when len(ha1318)  >0 then ha1318   when len(ha1318)  =0 or ha1318   is null then null end
FROM K60 

--UPDATE K60 SET a1319= Case when len(a1319)  >0 then a1319   when len(a1319)  =0 or a1319   is null then null end,ha1319= Case when len(ha1319)  >0 then ha1319   when len(ha1319)  =0 or ha1319   is null then null end
FROM K60 