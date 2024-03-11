/*
1、序号从1开始依次往后顺排，序号需转换为字符格式。
2、所有非数值字段需去掉字符串的空格。
3、上行隧道和下行隧道分别将长度填在相应字段内。
4、所在地域优先取隧道所在地点，若隧道所在地点为空则取行政区划的汉字描述。
5、查询结果按照隧道名称，所在路线排序
*/

SELECT 
    CONVERT(VARCHAR, ROW_NUMBER() OVER (ORDER BY k0101 DESC)) AS oyds_number,
    RTRIM(k0112) AS oyds_k0112,
    rtrim(k0101) k0101,
    RTRIM(K6302) AS oyds_k6302,
    k6304,
    CASE WHEN HK6127 = '上行' THEN K6305 ELSE 0 END AS '上行',
    CASE WHEN HK6127 = '下行' THEN K6305 ELSE 0 END AS '下行',
		COALESCE(NULLIF(RTRIM(K6326), ''), RTRIM(HA0103)) AS oyds_priority --k6326 隧道所在地点
    -- COALESCE(NULLIF(RTRIM(HK6127), ''), RTRIM(HA0103)) AS oyds_priority --HK6127隧道所在位置
FROM k063



SELECT count(*)
from k060



SELECT
    CONVERT(VARCHAR, ROW_NUMBER() OVER (ORDER BY  c1.K0112, c1.k6003 DESC)) AS oyds_number,
    RTRIM(c1.K6002) AS K6002,
    RTRIM(c1.K0112) AS K0112,
    c1.K6003,
    c1.K6008,
    c1.K6066,
    RTRIM(c1.hK6022) AS hK6022,
    c2.K0306,
    COALESCE(NULLIF(RTRIM(c1.K6070), ''), RTRIM(c1.HA0103)) AS oyds_priority,
    c1.k0101
FROM
    K060 AS c1
JOIN
    K001 AS c2 ON c1.A0102 = c2.A0102 and c1.K0101=c2.K0101 and  c1.K6003>c2.K0108 AND c1.K6003<c2.K0109
