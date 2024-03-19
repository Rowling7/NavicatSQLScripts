DECLARE @a0101 as varchar(8)
DECLARE @a0203 as varchar(8)
set @a0101='2022'
set @a0203='Y'
SELECT A.A0102 ,A.SUM1+B.SUM2
FROM (
	SELECT 
	STUFF(rtrim(a0102),3,1,2) A0102,
	sum(isnull(a0304,'0')+isnull(a0305,'0')+isnull(a0306,'0')+isnull(a0307,'0')+
		isnull(a0308,'0')+isnull(a0309,'0')+isnull(a0310,'0')+isnull(a0311,'0')+isnull(a0312,'0')) SUM1
	from A11 
	where a0102  in ('3411523','3410522','3410828','3411125','3410422','3411322', '3411623','3411225','3411221','3411324') 
	--('3421523','3420522','3420828','3421125','3420422','3421322', '3421623','3421225','3421221','3421324') 
	and a0203 =@a0203
	and a0101<=@a0101
	group by a0102
)A
RIGHT JOIN 
(
	SELECT 
	a0102,
	sum(isnull(a0304,'0')+isnull(a0305,'0')+isnull(a0306,'0')+isnull(a0307,'0')+
		isnull(a0308,'0')+isnull(a0309,'0')+isnull(a0310,'0')+isnull(a0311,'0')+isnull(a0312,'0'))SUM2
	from A11 
	where a0102  in ('3421523','3420522','3420828','3421125','3420422','3421322', '3421623','3421225','3421221','3421324') 
	and a0203 =@a0203
	and a0101<=@a0101
	group by a0102
)B ON A.A0102=B.A0102
