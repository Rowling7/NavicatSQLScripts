SELECT k0101,k0108,CONVERT(varchar(255),k0199)
from k001 
where CONVERT(varchar(255),k0199) like '%渡口%'
and left(k0101,1)in ('g','s')
and rtrim(k0101)+rtrim(k0108) in (
SELECT rtrim(k0101)+rtrim(k6503)
from k065
where  left(k0101,1)in ('g','s')
)
order by  rtrim(k0101)+rtrim(k0108)


SELECT rtrim(k0101)+rtrim(k6503)
from k065
where  left(k0101,1)in ('g','s')
ORDER BY rtrim(k0101)+rtrim(k6503)