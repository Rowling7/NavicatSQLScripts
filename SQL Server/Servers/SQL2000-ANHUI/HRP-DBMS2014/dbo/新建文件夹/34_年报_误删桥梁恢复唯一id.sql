--误删桥梁恢复唯一id
SELECT rtrim(a.kwyid) kwyid,rtrim(b.kwyid) Lkwyid,a.a0102,a.k0101,a.k6001,A.K6002,b.a0102,b.k0101,b.k6001,B.K6002,A.K6003,B.K6003
--update  a set a.kwyid=b.kwyid
from k060 a
LEFT JOIN qiaoliang b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6001=b.k6001 and A.K6003=B.K6003AND RTRIM(A.K6002)=RTRIM(B.K6002)
WHERE B.KWYID IS NOT NULL AND A.KWYID IS NULL 