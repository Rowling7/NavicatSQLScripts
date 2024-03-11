 SELECT * FROM info limit 3 OFFSET 2  
 --limit一共取三条数据，offset 从第二个开始

INSERT INTO  A_COPY1 select * FROM A   
--将查询结果插入其他表中