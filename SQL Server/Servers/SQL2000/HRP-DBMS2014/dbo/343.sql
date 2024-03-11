UPDATE K060 SET 
A1306 =case when len(A1306)>0 then A1306 when len(A1306)=0 or A1306 is null then null end ,
HA1306 =case when len(HA1306)>0 then HA1306 when len(HA1306)=0 or HA1306 is null then null end ,
K6102 =case when len(K6102)>0 then K6102 when len(K6102)=0 or K6102 is null then null end ,
A1317 =case when len(A1317)>0 then A1317 when len(A1317)=0 or A1317 is null then null end ,
HA1317 =case when len(HA1317)>0 then HA1317 when len(HA1317)=0 or HA1317 is null then null end ,
A1316 =case when len(A1316)>0 then A1316 when len(A1316)=0 or A1316 is null then null end ,
A1318 =case when len(A1318)>0 then A1318 when len(A1318)=0 or A1318 is null then null end ,
HA1318 =case when len(HA1318)>0 then HA1318 when len(HA1318)=0 or HA1318 is null then null end ,
A1319 =case when len(A1319)>0 then A1319 when len(A1319)=0 or A1319 is null then null end ,
HA1319 =case when len(HA1319)>0 then HA1319 when len(HA1319)=0 or HA1319 is null then null end 


FROM K060

update k060 set k6032='武汉广益交通科技股份有限公司'
from K060
where k6032='1.武汉广益交通科技股份有限公司；2安徽省中兴工程监?'     


update k060 set k6032='武汉广益交通科技股份有限公司'
from K060
where k6032='1.武汉广益交通科技股份有限公司；2安徽省中兴工程监理有限公司'                                                                                  