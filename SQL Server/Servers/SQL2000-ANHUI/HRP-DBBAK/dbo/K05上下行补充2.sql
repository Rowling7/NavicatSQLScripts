INSERT INTO [dbo].[K05] ([A0102], [HA0102], [K0101], [A0101A], [HA0101A], [K0105], [K0106], [A5009], [HA5009], [A5010], [A5011], [A5012], [A5013], [A5014], [A0129],  [A5008], [K0304], [HK0304], [K5104], [HK5104], [A5011A], [A5011B], [A5011C], [A5011D], [A5011E], [A5011F], [A5011G]) 
SELECT 
[A0102], [HA0102], [K0101], [A0101A], [HA0101A], [K0105], [K0106], '3', '下行', [A5010], [A5011], [A5012], [A5013], [A5014], [A0129],  [A5008], [K0304], [HK0304], [K5104], [HK5104], [A5011A], [A5011B], [A5011C], [A5011D], [A5011E], [A5011F], [A5011G]
from k05
where left(a0101a,4)='2023' AND RTRIM(A0102)+RTRIM(K0101) +RTRIM(K0105) +left(a0101a,4)+A5009 in (
SELECT id from ##t)