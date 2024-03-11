/*不显示零*/
select 1,sum (isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0)+isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0)+isnull(a1667,0)+isnull(a1668,0)+isnull(a1669,0)),--资金来源合计
sum (case when isnull(a1660,'')='1' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0)+isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0)+isnull(a1667,0)+isnull(a1668,0)+isnull(a1669,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0)+isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0)+isnull(a1667,0)+isnull(a1668,0)+isnull(a1669,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0)+isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0)+isnull(a1667,0)+isnull(a1668,0)+isnull(a1669,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 2,sum (isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0)),--中央资金小计
sum (case when isnull(a1660,'')='1' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1661,0)+isnull(a1662,0)+isnull(a1663,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 3,sum (isnull(a1661,0)),--成品油税费返还
sum (case when isnull(a1660,'')='1' then isnull(a1661,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1661,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1661,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 4,sum (isnull(a1662,0)),--车购税
sum (case when isnull(a1660,'')='1' then isnull(a1662,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1662,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1662,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 5,sum (isnull(a1663,0)),--中央其他资金
sum (case when isnull(a1660,'')='1' then isnull(a1663,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1663,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1663,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 6,sum (isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0)),--地方财政资金小计
sum (case when isnull(a1660,'')='1' then isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1664,0)+isnull(a1665,0)+isnull(a1666,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 7,sum (isnull(a1664,0)),--省级资金
sum (case when isnull(a1660,'')='1' then isnull(a1664,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1664,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1664,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 8,sum (isnull(a1665,0)),--市级资金
sum (case when isnull(a1660,'')='1' then isnull(a1665,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1665,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1665,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 9,sum (isnull(a1666,0)),--县乡级资金
sum (case when isnull(a1660,'')='1' then isnull(a1666,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1666,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1666,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 10,sum (isnull(a1667,0)),--公路通行费资金
sum (case when isnull(a1660,'')='1' then isnull(a1667,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1667,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1667,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 11,sum (isnull(a1668,0)),--银行贷款资金
sum (case when isnull(a1660,'')='1' then isnull(a1668,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1668,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1668,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023' 
union/*不显示零*/
select 12,sum (isnull(a1669,0)),--其他地方资金
sum (case when isnull(a1660,'')='1' then isnull(a1669,0) else 0.0000 end),--高速公路
sum (case when isnull(a1660,'')='2' then isnull(a1669,0) else 0.0000 end),--普通国道
sum (case when isnull(a1660,'')='3' then isnull(a1669,0) else 0.0000 end)--普通省道
from B15 a where a0102 like '34%' and a0101='2023'