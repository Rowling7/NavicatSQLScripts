-------202540124 交通部
update k05 set a5008=(isnull(k0106,0)-isnull(k0105,0))*1000

--select a0102,ha0102,k0101,a0101a,a5009,ha5009,a5008,[检测路段|起点桩号]=k0105,[检测路段|止点桩号]=k0106,[检测路段|起止点差值]=(isnull(k0106,0)-isnull(k0105,0))*1000,a0129
from k05
where ( k0106<=k0105 or ((isnull(k0106,0)-isnull(k0105,0))*1000<>isnull(a5008,0)) ) and left(a0101a,4)='2023' and A0102 like '34%' 

SELECT CONVERT(VARCHAR(255),a0129)
--UPDATE K03 SET A0129=NULL
from k03
where CONVERT(VARCHAR(255),a0129) in('A','W','H','E','Y')

SELECT CONVERT(VARCHAR(255),a0129)
--UPDATE K03 SET A0129=NULL
from k03
where CONVERT(VARCHAR(255),a0129) ='2023'

SELECT CONVERT(VARCHAR(255),a0129)
--UPDATE K03 SET A0129='五类桥梁'
from k03
where CONVERT(VARCHAR(255),a0129) ='五类桥'