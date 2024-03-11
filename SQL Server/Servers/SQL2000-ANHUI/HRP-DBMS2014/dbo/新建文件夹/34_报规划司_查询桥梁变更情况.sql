-----变更桥梁
SELECT RTRIM(a.kwyid) kwyid,rtrim(a.a0102) a0102,rtrim( a.HA0102 )HA0102,rtrim(a.k0101) k0101,rtrim(a.K6001) K6001,
	RTRIM(b.kwyid) Lkwyid,rtrim(b.a0102) La0102,rtrim( a.HA0102 ) LHA0102,rtrim(b.k0101) Lk0101,rtrim(b.K6001) LK6001
from K060 a
left join qiaoliang  b on a.kwyid =b.kwyid
--left join [HRP-DBMS2014-2022年报]..K060  b on a.kwyid =b.kwyid

where 
(
rtrim( a.A0102 ) <> rtrim( b.A0102 ) or
rtrim( a.HA0102 ) <> rtrim( b.HA0102 ) or
rtrim( a.K0101 ) <> rtrim( b.K0101 ) or
rtrim( a.K0112 ) <> rtrim( b.K0112 ) or
rtrim( a.K6003 ) <> rtrim( b.K6003 ) or
rtrim( a.K6001 ) <> rtrim( b.K6001 ) or
rtrim( a.K6002 ) <> rtrim( b.K6002 ) or
rtrim( a.K0143 ) <> rtrim( b.K0143 ) or
rtrim( a.A0103 ) <> rtrim( b.A0103 ) or
rtrim( a.K6006 ) <> rtrim( b.K6006 ) or
rtrim( a.K6005 ) <> rtrim( b.K6005 ) or
rtrim( a.HK6005 ) <> rtrim( b.HK6005 ) or
rtrim( a.K6080 ) <> rtrim( b.K6080 ) or
rtrim( a.HK6080 ) <> rtrim( b.HK6080 ) or
rtrim( a.K6004 ) <> rtrim( b.K6004 ) or
rtrim( a.HK6004 ) <> rtrim( b.HK6004 ) or
rtrim( a.K6007 ) <> rtrim( b.K6007 ) or
rtrim( a.HK6007 ) <> rtrim( b.HK6007 ) or
rtrim( a.A1302 ) <> rtrim( b.A1302 ) or
rtrim( a.HA1302 ) <> rtrim( b.HA1302 ) or
rtrim( a.K6028 ) <> rtrim( b.K6028 ) or
rtrim( a.HK6028 ) <> rtrim( b.HK6028 ) or
rtrim( a.A1305 ) <> rtrim( b.A1305 ) or
rtrim( a.K6062 ) <> rtrim( b.K6062 ) or
rtrim( a.HK6062 ) <> rtrim( b.HK6062 ) or
rtrim( a.A1307 ) <> rtrim( b.A1307 ) or
rtrim( a.HA1307 ) <> rtrim( b.HA1307 ) or
rtrim( a.K6008 ) <> rtrim( b.K6008 ) or
rtrim( a.K6065 ) <> rtrim( b.K6065 ) or
rtrim( a.K6063 ) <> rtrim( b.K6063 ) or
rtrim( a.K6064 ) <> rtrim( b.K6064 ) or
rtrim( a.K6066 ) <> rtrim( b.K6066 ) or
rtrim( a.K6009 ) <> rtrim( b.K6009 ) or
rtrim( a.K6069 ) <> rtrim( b.K6069 ) or
rtrim( a.K6016 ) <> rtrim( b.K6016 ) or
rtrim( a.HK6016 ) <> rtrim( b.HK6016 ) or
rtrim( a.A1306 ) <> rtrim( b.A1306 ) or
rtrim( a.HA1306 ) <> rtrim( b.HA1306 ) or
rtrim( a.K6102 ) <> rtrim( b.K6102 ) or
rtrim( a.K6017 ) <> rtrim( b.K6017 ) or
rtrim( a.HK6017 ) <> rtrim( b.HK6017 ) or
rtrim( a.A1328 ) <> rtrim( b.A1328 ) or
rtrim( a.HA1328 ) <> rtrim( b.HA1328 ) or
rtrim( a.K6022 ) <> rtrim( b.K6022 ) or
rtrim( a.HK6022 ) <> rtrim( b.HK6022 ) or
rtrim( a.K6023 ) <> rtrim( b.K6023 ) or
rtrim( a.HK6023 ) <> rtrim( b.HK6023 ) or
rtrim( a.K6024 ) <> rtrim( b.K6024 ) or
rtrim( a.HK6024 ) <> rtrim( b.HK6024 ) or
rtrim( a.A1317 ) <> rtrim( b.A1317 ) or
rtrim( a.HA1317 ) <> rtrim( b.HA1317 ) or
rtrim( a.A1316 ) <> rtrim( b.A1316 ) or
rtrim( a.A1318 ) <> rtrim( b.A1318 ) or
rtrim( a.HA1318 ) <> rtrim( b.HA1318 ) or
rtrim( a.A1319 ) <> rtrim( b.A1319 ) or
rtrim( a.HA1319 ) <> rtrim( b.HA1319 ) or
rtrim( a.A1313 ) <> rtrim( b.A1313 ) or
rtrim( a.HA1313 ) <> rtrim( b.HA1313 ) or
rtrim( a.A1314 ) <> rtrim( b.A1314 ) or
rtrim( a.K6079 ) <> rtrim( b.K6079 ) or
rtrim( a.K6030 ) <> rtrim( b.K6030 ) or
rtrim( a.K6031 ) <> rtrim( b.K6031 ) or
rtrim( a.K6032 ) <> rtrim( b.K6032 ) or
rtrim( a.K0116 ) <> rtrim( b.K0116 ) or
rtrim( a.A3219 ) <> rtrim( b.A3219 ) or
rtrim( a.HA3219 ) <> rtrim( b.HA3219 ) or
rtrim( a.A9902 ) <> rtrim( b.A9902 ) or
rtrim( a.HA9902 ) <> rtrim( b.HA9902 ) or
rtrim( a.A9903 ) <> rtrim( b.A9903 ) or
rtrim( a.A9904 ) <> rtrim( b.A9904 ) or
rtrim( a.HA9904 ) <> rtrim( b.HA9904 ) or
rtrim( a.A9905 ) <> rtrim( b.A9905 ) or
rtrim( a.A9906 ) <> rtrim( b.A9906 ) or
rtrim( a.HA9906 ) <> rtrim( b.HA9906 ) or
rtrim( a.A9908 ) <> rtrim( b.A9908 ) or
rtrim( a.A9907 ) <> rtrim( b.A9907 ) or
rtrim( a.HA9907 ) <> rtrim( b.HA9907 ) or
rtrim( a.K0180 ) <> rtrim( b.K0180 ) or
rtrim( a.K0181 ) <> rtrim( b.K0181 ) or
rtrim( a.K6110 ) <> rtrim( b.K6110 ) or
rtrim( a.HK6110 ) <> rtrim( b.HK6110 ) or
rtrim( a.K6111 ) <> rtrim( b.K6111 ) or
rtrim( a.KWYID ) <> rtrim( b.KWYID ) or
rtrim( a.K6051 ) <> rtrim( b.K6051 ) or
rtrim( a.K6050 ) <> rtrim( b.K6050 ) or
rtrim( a.HA0103 ) <> rtrim( b.HA0103 ) or
rtrim( a.K6117 ) <> rtrim( b.K6117 ) or
rtrim( a.HK6117 ) <> rtrim( b.HK6117 ) or
rtrim( a.K6118 ) <> rtrim( b.K6118 ) or
rtrim( a.HK6118 ) <> rtrim( b.HK6118 ) or
rtrim( a.K6119 ) <> rtrim( b.K6119 ) or
rtrim( a.HK6119 ) <> rtrim( b.HK6119 ) or
rtrim( a.K6120 ) <> rtrim( b.K6120 ) or
rtrim( a.HK6120 ) <> rtrim( b.HK6120 ) or
rtrim( a.A1331 ) <> rtrim( b.A1331 ) or
rtrim( a.HA1331 ) <> rtrim( b.HA1331 ) or
rtrim( a.K6067 ) <> rtrim( b.K6067 ) or
rtrim( a.K0149 ) <> rtrim( b.K0149 ) or
rtrim( a.HK0149 ) <> rtrim( b.HK0149 ) or
rtrim( a.K6041 ) <> rtrim( b.K6041 ) or
rtrim( a.HK6041 ) <> rtrim( b.HK6041 ) or
rtrim( a.K6040 ) <> rtrim( b.K6040 ) or
rtrim( a.K6121 ) <> rtrim( b.K6121 ) or
rtrim( a.HK6121 ) <> rtrim( b.HK6121 )  OR
rtrim( a.K0185	)	<>	rtrim( b.K0185	)	or
rtrim( a.K0186	)	<>	rtrim( b.K0186	)	

) 
--AND LEFT (A.K0101,1) in ('X','Y','C','Z')
ORDER BY a0102


--新增桥梁
SELECT RTRIM(a.kwyid) kwyid,rtrim(a.a0102) a0102,rtrim( a.HA0102 )HA0102,rtrim(a.k0101) k0101,rtrim(a.K6001) K6001
from K060 a
where a.kwyid is null --and   LEFT (a.K0101,1) in ('X','Y','C','Z') 

/*
SELECT left(a.k0101,1),count(*)
from K060 a
where a.k0180 = '2023' and left(k0101,1)<>'w'
GROUP BY left(a.k0101,1) with rollup
*/

--删除桥梁
SELECT RTRIM(a.kwyid) kwyid,rtrim(a.a0102) a0102,rtrim( a.HA0102 )HA0102,rtrim(a.k0101) k0101,rtrim(a.K6001) K6001,
	RTRIM(b.kwyid) Lkwyid,rtrim(b.a0102) La0102,rtrim( b.HA0102 ) LHA0102,rtrim(b.k0101) Lk0101,rtrim(b.K6001) LK6001
from K060 a
right join qiaoliang  b on a.kwyid =b.kwyid
where b.kwyid is not null and a.kwyid is  null --and   LEFT (a.K0101,1) in ('X','Y','C','Z') 
