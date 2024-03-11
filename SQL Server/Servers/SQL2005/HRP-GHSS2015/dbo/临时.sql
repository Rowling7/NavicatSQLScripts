--最新报表
/*不显示零*/

select
case when grouping(objname)=1 then '合计' else max(RTRIM(objjc)) end,--管理单位名称
case when grouping(objname)=1 then '' else rtrim(objname) end,--管理单位代码
sum(isnull(a2711,0)),--储备中心（点）数量省级
sum(isnull(a2712,0)),--储备中心（点）数量地市及以下级
sum(isnull(a2702,0)),--编织袋
sum(isnull(a2703,0)),--融雪剂
sum(isnull(a2713,0)),--防滑剂
sum(isnull(a2701,0)),--战备钢梁
sum(isnull(a2714,0)),--机械化桥
sum(isnull(a2704,0)),--平板车
sum(isnull(a2705,0)),--挖掘机
sum(isnull(a2706,0)),--推土机
sum(isnull(a2707,0)),--装载机
sum(isnull(a2715,0)),--起重机
sum(isnull(a2716,0)),--多功能除雪（冰）车
sum(isnull(a2710,0)),--推雪铲
sum(isnull(a2717,0)),--除雪滚刷
sum(isnull(a2708,0)),--抽水机
sum(isnull(a2718,0)),--应急通讯车
sum(isnull(a2719,0)),--单兵装备
sum(isnull(a2720,0)),--无人机
sum(isnull(a2709,0)),--发电机组
sum(isnull(a2721,0)),--移动照明设备
sum(isnull(a2722,0))--移动照明设备

from a27 left join d028 on rtrim(a0102)=rtrim(objname)
where  left(a0102,3)='42A'
group by objname with rollup
order by objname
