INSERT INTO [dbo].[A21] ([A0102], [HA0102], [A0101], [HA0101], [A0103], [HA0103], [A0104], [A0105], [A0110], [A1504], [A0111], [A0112], [A1526], [A0113], [A0114], [A0117], [A0106], [A0107], [A0108], [A0109], [A0129], [A0199], [A1505], [A1506], [A1528], [A1529], [A1507], [A1508], [A1509], [A1517], [A1518], [A1519], [InsertLogin], [ModifyLogin], [A1560], [A1561], [A1562], [A1563], [A0830], [A0831], [A0821], [A0832], [A0822], [A0823], [A0833], [A0834], [A0824], [A0836], [A0835], [A0361]) VALUES ('34101    ', '合肥市公路管理服务中心(干线公路)                  ', '2023', '2023年    ', '3401        ', '合肥市                                            ', 114.08, 896.3547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



SELECT K0130,HK0130,sum(isnull(k0114,0))
from [HRP-GHSS2014-2022年报]..k01 
where  isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1) in('G','S','X','Y','C','Z')
GROUP BY K0130,HK0130


SELECT K0130,HK0130,sum(isnull(k0114,0))
from [HRP-GHSS2014]..k01 
where  isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1) in('G','S','X','Y','C','Z')
GROUP BY K0130,HK0130



SELECT K0131,HK0131,sum(isnull(k0114,0))
from [HRP-GHSS2014-2022年报]..k01 
where  isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1) in('G','S','X','Y','C','Z')
GROUP BY K0131,HK0131


SELECT K0131,HK0131,sum(isnull(k0114,0))
from [HRP-GHSS2014]..k01 
where  isnull(k0123,'2')='2' and nullif(k0124,'') is null and left(k0101,1) in('G','S','X','Y','C','Z')
GROUP BY K0131,HK0131