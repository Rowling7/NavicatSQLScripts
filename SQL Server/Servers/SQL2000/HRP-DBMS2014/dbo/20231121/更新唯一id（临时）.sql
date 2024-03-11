update  ZCPT set zcpt.K6040 =nb.k6040
from ZCPT_K060  ZCPT
left join K060 nb on rtrim(replace(replace(replace(replace(nb.k0101,'D003',''),'D002',''),'D001',''),'000000',''))+rtrim(nb.a0103)+'L'+rtrim(nb.k6001) =rtrim(zcpt.k6001)

