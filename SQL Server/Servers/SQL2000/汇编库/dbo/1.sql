
_WA_Sys_HK6005_31C11CDA	[HK6005] ASC	Non-Clustered	False	



-- 删除索引
DROP INDEX k060._WA_Sys_HK6005_31C11CDA;
ALTER TABLE K060
ALTER COLUMN HK6005 VARCHAR(100);
-- 创建非聚集索引
CREATE INDEX _WA_Sys_HK6005_31C11CDA
ON k060 (HK6005);


UPDATE V52 SET V0513 ='1'
WHERE V0513='2'
SELECT DISTINCT V0513 
FROM V52

UPDATE V51 SET V0502 ='1'
WHERE V0502='2'
SELECT DISTINCT V0502 
FROM V51
WHERE V0502='2'