--重复
SELECT KWYID, count(KWYID)
FROM k001 
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM k060
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM k063
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM k065
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM l001 
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM l060
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM l063
GROUP BY KWYID
ORDER BY count(KWYID) desc

SELECT KWYID, count(KWYID)
FROM l065
GROUP BY KWYID
ORDER BY count(KWYID) desc


--空
SELECT KWYID
FROM k001 
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM k060
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM k063
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM k065
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM l001 
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM l060
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM l063
WHERE  KWYID is null or KWYID=''

SELECT KWYID
FROM l065
WHERE  KWYID is null or KWYID=''

--一一对应
SELECT k.KWYID,l.KWYID
FROM k001 k
LEFT JOIN l001 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and k.k0108=l.k0108
where l.KWYID is null

SELECT k.KWYID,l.KWYID
FROM k060 k
LEFT JOIN l060 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and k.k6001=l.k6001 
where l.KWYID is null

SELECT k.KWYID,l.KWYID
FROM k063 k
LEFT JOIN l063 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and k.k6301=l.k6301 
where l.KWYID is null

SELECT k.KWYID,l.KWYID
FROM k065 k
LEFT JOIN l065 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and k.k6501=l.k6501 
where l.KWYID is null

--
SELECT k.KWYID,l.KWYID
FROM k001 k
LEFT JOIN [HRP-GHSS2023]..k01 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and k.k0108=l.k0108
where l.KWYID is null

SELECT rtrim(k.KWYID),rtrim(l.KWYID)
FROM k060 k
LEFT JOIN [HRP-GHSS2023]..k60 l on rtrim(k.KWYID)=rtrim(l.KWYID) and k.a0102=l.a0102 and k.k0101=l.k0101 and (case when len(rtrim(K.k0101))<=9 and charindex('D',rtrim(K.k0101))=0 then rtrim(K.k0101)+left(rtrim(K.a0103),6)+'L'+rtrim(K.K6001)
			when len(rtrim(K.k0101))<=9 and charindex('D',rtrim(K.k0101))<>0 then left(rtrim(K.k0101),charindex('D',rtrim(K.k0101))-1)+left(rtrim(K.a0103),6)+'L'+rtrim(K.K6001)
			when len(rtrim(K.k0101))>9 and left(rtrim(K.k0101),1) in ('G','H','S','T') then left(rtrim(K.k0101),4)+left(rtrim(K.a0103),6)+'L'+rtrim(K.K6001)
			when len(rtrim(K.k0101))>9 and left(rtrim(K.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(K.k0101),10)+'L'+rtrim(K.K6001)
			else null end)=rtrim(l.k6001)
where rtrim(l.KWYID) is null


SELECT k.KWYID,l.KWYID
FROM k063 k
LEFT JOIN [HRP-GHSS2023]..k63 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and (case when len(rtrim(k.k0101))<=9 and charindex('D',rtrim(k.k0101))=0 then rtrim(k.k0101)+left(rtrim(k.a0103),6)+'U'+rtrim(k.K6301)
			when len(rtrim(k.k0101))<=9 and charindex('D',rtrim(k.k0101))<>0 then left(rtrim(k.k0101),charindex('D',rtrim(k.k0101))-1)+left(rtrim(k.a0103),6)+'U'+rtrim(k.K6301)
			when len(rtrim(k.k0101))>9 and left(rtrim(k.k0101),1) in ('G','H','S','T') then left(rtrim(k.k0101),4)+left(rtrim(k.a0103),6)+'U'+rtrim(k.K6301)
			when len(rtrim(k.k0101))>9 and left(rtrim(k.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k.k0101),10)+'U'+rtrim(k.K6301)
			else null end)=rtrim(l.k6301)
where l.KWYID is null

SELECT k.KWYID,l.KWYID
FROM k065 k
LEFT JOIN [HRP-GHSS2023]..k65 l on k.KWYID=l.KWYID and k.a0102=l.a0102 and k.k0101=l.k0101 and (case when len(rtrim(k.k0101))<=9 and charindex('D',rtrim(k.k0101))=0 then rtrim(k.k0101)+left(rtrim(k.a0103),6)+'D'+rtrim(k.K6501)
			when len(rtrim(k.k0101))<=9 and charindex('D',rtrim(k.k0101))<>0 then left(rtrim(k.k0101),charindex('D',rtrim(k.k0101))-1)+left(rtrim(k.a0103),6)+'D'+rtrim(k.K6501)
			when len(rtrim(k.k0101))>9 and left(rtrim(k.k0101),1) in ('G','H','S','T') then left(rtrim(k.k0101),4)+left(rtrim(k.a0103),6)+'D'+rtrim(k.K6501)
			when len(rtrim(k.k0101))>9 and left(rtrim(k.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k.k0101),10)+'D'+rtrim(k.K6501)
			else null end)=rtrim(l.k6501)
where l.KWYID is null
