SELECT 
	B.HA0102,rtrim(B.K0101) K0101,B.K0108,A.HK1301,rtrim(B.K1302) K1302,B.K1303,B.K1304
FROM A50 A INNER JOIN K001 B ON A.A0102=B.A0102 AND A.K0101=B.K0101
	LEFT JOIN LUDUAN C ON LTRIM(RTRIM(B.K1302))=C.K0101 AND ISNULL(B.K1303,9999)>=C.K0108 AND ISNULL(B.K1303,9999)<C.K0109
WHERE (ISNULL(B.K1303,9999)<>9999 AND C.K0101 IS NULL) OR LEFT(LTRIM(RTRIM(B.K1302)),1) NOT IN ('X','Y','Z','C')  and left(B.K0101,1)<>'w'

UNION 

SELECT 
	B.HA0102,rtrim(B.K0101),B.K0108,A.HK1301,rtrim(B.K1302),B.K1303,B.K1304
FROM A50 A INNER JOIN K001 B ON A.A0102=B.A0102 AND A.K0101=B.K0101
	LEFT JOIN LUDUAN C ON LTRIM(RTRIM(B.K1302))=C.K0101 AND ISNULL(B.K1304,9999)>C.K0108 AND ISNULL(B.K1304,9999)<=C.K0109
WHERE (ISNULL(B.K1304,9999)<>9999 AND C.K0101 IS NULL) OR LEFT(LTRIM(RTRIM(B.K1302)),1) NOT IN ('X','Y','Z','C')  and left(B.K0101,1)<>'w'