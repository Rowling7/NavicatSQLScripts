#SUBDATE(date,INTERVAL expr unit)
	#date:日期或者时间 data/TIME
	#INTERVAL expr unit:间隔的时间  可以是 DAY WEEK MONTH YEAR HOUR
#curdate():返回当前日期
#date_format(curdate(),'%w'):日期格式化为星期的i形式%w
#当前week的第一天：  
select date_sub(curdate(),INTERVAL WEEKDAY(curdate()) + 1 DAY);
#当前week的最后一天：  
select date_sub(curdate(),INTERVAL WEEKDAY(curdate()) - 5 DAY);

#周日起始：
	#开始日期：
SELECT date_format(curdate(),'%w')-6;
select subdate(curdate(),date_format(curdate(),'%w'));
	#结束日期：
select subdate(curdate(),date_format(curdate(),'%w') - 6);

#本周过生日的记录
SELECT * from student
WHERE SUBSTRING(sage,6,5)<SUBSTRING(subdate(curdate()/*返回当前日期*/,date_format(curdate(),'%w')/*日期格式化为星期的i形式%w*/ - 6) ,6,5)#出生日期小于当前周的周六
 AND SUBSTRING(sage,6,5)>SUBSTRING(subdate(curdate(),date_format(curdate(),'%w')),6,5)#出生日期大于当前周的周日


#多字段排序 必须同时加DESC/ASC或者同时不加
SELECT 
	C.ID AS '课程ID' ,
	C.NAME AS '课程NAME',
	MAX(SC.SCORE ) 最高分,
	MIN(SC.SCORE)最低分,
	AVG(SC.SCORE) 平均分,
	#SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) 及格人数,
	COUNT(SC.SCORE) 选修人数,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='60' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 及格率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='70' AND SC.SCORE<'80'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 中等率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='80' AND SC.SCORE<'90'  THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 优良率,
	CONCAT(ROUND((SUM(CASE WHEN SC.SCORE>='90' THEN 1 ELSE 0 END ) /COUNT(SC.SCORE)*100),2),'%') 优秀率
FROM COURSE C
LEFT JOIN SC ON C.ID=SC.C_ID
GROUP BY C.ID,C.NAME
ORDER BY COUNT(SC.SCORE) DESC ,C.ID ASC;



#mysql 成绩前三 TOP 3
SELECT T1.C_ID,T1.S_ID,T1.SCORE
FROM  SC T1
LEFT JOIN (SELECT DISTINCT C_ID, SCORE FROM SC) T2 ON T1.C_ID = T2.C_ID AND T1.SCORE < T2.SCORE
GROUP BY T1.C_ID,T1.S_ID,T1.SCORE
HAVING	COUNT(1) < 3
ORDER BY T1.C_ID,T1.SCORE DESC;
