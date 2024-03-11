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