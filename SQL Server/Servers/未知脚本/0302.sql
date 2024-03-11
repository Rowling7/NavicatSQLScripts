if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk060'))
drop table ##tk060
SELECT b,
SUBSTRING(a,charindex(':',a)+1,charindex('的数据行',a)-charindex(':',a)-1) aa,
SUBSTRING(a,charindex('在',a)+1,charindex('不匹配，',a)-charindex('的数据行，在',a)-7)bb,
SUBSTRING(a,charindex('统计年报数据为：',a)+8,charindex('，系统中的数据为：',a)-charindex('统计年报数据为：',a)-8)cc,
rtrim(SUBSTRING(a,charindex('系统中的数据为：',a)+8,99)) dd
into ##tk060
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=E:\Report年报比对明细表20240302.xls',sheet1$)

SELECT * from ##tk060
where bb='主桥上部结构类型代码' --and b+aa<>'池州市公路管理服务直属分中心秋浦河大桥'


SELECT distinct bb from ##tk060

SELECT b+aa ,count(b+aa)
from ##tk060
where bb='评定单位' --and b+aa<>'池州市公路管理服务直属分中心秋浦河大桥'
GROUP BY b+aa
order by count(b+aa) desc


SELECT 
a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,[as],[at],au,av,aw,ax,ay,az,
ba,bb,bc,bd,be,bf,bg,bh,bi,bj,bk,bl,bm,bn
into nb
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=E:\交公路07表-03011800.xls',l071$)

SELECT ao,a,[as],[at],au,av 
from nb 



SELECT 
n.a,n.bn,t.k6002,t.k6040
--update nb set av=rtrim(t.dd)
from nb n
inner join k060  t on case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)=b
where  a0102 like '341%' and k6040 is not null and n.bn<>t.k6040 



SELECT 
n.ao,n.a,n.[as],n.[at],n.au,n.av ,
t.cc,t.dd
--update nb set av=rtrim(t.dd)
from nb n
inner join ##tk060  t on t.b+t.aa=n.ao+n.a and t.bb='评定单位'
where n.bn is not null and av<>rtrim(t.dd)

--256
SELECT a,k6001,av,k6050
--update k060 set k6050=rtrim(av)
from nb 
inner join k060 on bn=K6040
where av<>k6050 --and a0102 like '341%'

SELECT 
n.ao,n.a,n.[as],n.[at],n.au,n.av ,
t.cc,t.dd
--update nb set [as]='1',[at]=rtrim(t.dd)
from nb n
inner join ##tk060  t on t.b+t.aa=n.ao+n.a and t.bb='评定等级' --and t.dd='一类'
where n.bn is not null  and n.[at]<>t.dd
order by t.dd

--9
SELECT a,k6001,k6028,[as],hk6028,[at]
--update k060 set k6028=rtrim([as]),hk6028=rtrim([at])
from nb 
inner join k060 on bn=K6040
where [as]<>k6028 and a0102 like '341%'

SELECT 
n.ao,n.a,n.[as],n.[at],n.au,n.av ,
t.cc,t.dd
--update nb set au=rtrim(t.dd)
from nb n
inner join ##tk060  t on t.b+t.aa=n.ao+n.a and t.bb='评定日期' --and t.b+t.aa<>'池州市公路管理服务直属分中心秋浦河大桥'--and t.dd='一类'
where n.bn is not null  and n.au<>t.dd  and au=t.cc
order by t.dd


--465
SELECT a,k6001,a1305,au
--update k060 set a1305=RTRIM(au)
from nb 
inner join k060 on bn=K6040
where a1305<>au --and a0102 like '341%'


SELECT 
n.ao,n.a,n.[as],n.[at],n.au,n.av ,
t.cc,t.dd
--update nb set j=rtrim(t.dd)
from nb n
inner join ##tk060  t on t.b+t.aa=n.ao+n.a and t.bb='跨径组合' --and t.b+t.aa<>'池州市公路管理服务直属分中心秋浦河大桥'--and t.dd='一类'
where n.bn is not null  and n.j<>t.dd  and j=t.cc
order by t.dd

--1
SELECT a,k6001,K6064,j
--update k060 set K6064=RTRIM(j)
from nb 
inner join k060 on bn=K6040
where K6064<>j and a0102 like '341%'


SELECT 
n.ao,n.a,n.u,n.v,n.au,n.av ,
t.cc,t.dd
--update nb set v=rtrim(t.dd),u='11'
from nb n
inner join ##tk060  t on t.b+t.aa=n.ao+n.a-- and t.bb='桥墩类型' 
where n.bn is not null  and n.v<>t.dd  and v=t.cc --and t.dd='重力式墩'
order by t.dd

--17
SELECT a,k6001,K6017,u,HK6017,v
--update k060 set K6017=RTRIM(u),HK6017=RTRIM(v)
from nb 
inner join k060 on bn=K6040
where K6017<>u and a0102 like '341%'








SELECT LEFT(F1,20),RTRIM(F2),BH,f3
--UPDATE NB SET BH=RTRIM(F3)
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE=D:\Desktop\新建 Microsoft Excel 工作表.xls',sheet2$)
LEFT JOIN NB  ON LEFT(F1,20)=BN 
WHERE BH<>RTRIM(F3) 
AND RTRIM(F2)=BH
AND  BN IN (
'34160120061242000007','34160120061232000006','34160120061222000013','34160120061232000004','34160120061222000002','34160120061222000003','34160120061242000005','34160120061242000012','34160120061232000009','34160120061222000010','34160120061222000011','34160120061222000015','34160120061222000014','34100120040432000002','34012120071122000010','34012120071132000007','34012120071132000004','34012120071132000003','34012120071132000017','34012120071132000022','34012120071132000023','34012120071132000026','34012120071132000029','34012120071132000032','34012120071132000002','34012120071132000001','34012120071122000005','34012120071122000006','34010220071132000005','34100120021032000001','34012220221232000047','34012220221232000015','34012220221232000022','34012220221232000040','34012220221222000053','34012220221222000018','34010220071132000010','34010220071132000011','34010220071132000001','34010220071132000002','34010220071132000012','34012220071132000003','34012220071132000006','34012220071132000011','34012220071132000012','34012220071132000013','34012220071132000022','34012220160922000001','34012220071122000002','34012220071122000001','34012220221222000031','34018120221232000001','34018120221232000025','34018120221232000031','34018120221232000028','34018120221232000032','34018120221232000003','34018120221232000037','34018120221232000012','34018120221232000020','34012220221232000044','34012220221222000019','34012220221222000048','34012220221222000017','34012220221232000009','34012220221222000023','34160120061232000018','34160120061232000001','34160120061222000008')



SELECT 
rtrim(a) a,rtrim(b) b,rtrim(c) c,rtrim(d) d,rtrim(e) e,rtrim(f) f,rtrim(g) g,rtrim(h) h,rtrim(i) i,rtrim(j) j,rtrim(k) k,rtrim(l) l,rtrim(m) m,rtrim(n) n,rtrim(o) o,rtrim(p) p,left(q,2) q,rtrim(r) r,rtrim(s) s,rtrim(t) t,rtrim(u) u,rtrim(v) v,rtrim(w) w,rtrim(x) x,left(y,1) y,rtrim(z) z,rtrim(aa) aa,rtrim(ab) ab,rtrim(ac) ac,rtrim(ad) ad,rtrim(ae) ae,rtrim(af) af,rtrim(ag) ag,rtrim(ah) ah,rtrim(ai) ai,rtrim(aj) aj,rtrim(ak) ak,rtrim(al) al,rtrim(am) am,rtrim(an) an,rtrim(ao) ao,rtrim(ap) ap,rtrim(aq) aq,rtrim(ar) ar,rtrim([as]) [as],rtrim([at]) [at],rtrim(au) au,rtrim(av) av,rtrim(aw) aw,rtrim(ax) ax,rtrim(ay) ay,rtrim(az) az,rtrim(ba) ba,rtrim(bb) bb,rtrim(bc) bc,rtrim(bd) bd,rtrim(be) be,rtrim(bf) bf,rtrim(bg) bg,rtrim(bh) bh,rtrim(bi) bi,rtrim(bj) bj,rtrim(bk) bk,rtrim(bl) bl,rtrim(bm) bm,rtrim(bn) bn
from nb 



SELECT a,k6001,A1314,AO
--update k060 set A1314=RTRIM(AO)
from nb 
inner join k060 on bn=K6040
where A1314<>RTRIM(AO) --and a0102 like '341%'


SELECT a,k6001,A1314,AO
--update k060 set A1314=RTRIM(AO)
from nb 
inner join k060 on bn=K6040
where A1314<>RTRIM(AO) --and a0102 like '341%'


SELECT * 
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 8.0;HDR=YES;DATABASE= D:\Desktop\2220\新建 Microsoft Excel 工作表.xls',sheet3$)





SELECT a,k6001,HK0149,RTRIM(AD)+'年'
--update k060 set HK0149=RTRIM(AD)+'年'
from nb 
inner join k060 on BN=K6040
where HK0149<>RTRIM(AD)+'年' --and AD='25'



SELECT A0102,RTRIM(K6002) K6002,K0149,RTRIM(HK0149),OBJNAME,OBJJC
--UPDATE K060 SET K0149=RTRIM(OBJNAME)
FROM K060 
LEFT JOIN DK0149 ON HK0149=RTRIM(OBJJC) 
WHERE K0149<>RTRIM(OBJNAME)









SELECT a,k6001,bi,k6118
--update k060 set HK0149=RTRIM(AD)+'年'
from nb 
inner join k060 on BN=K6040
where bi<>hk6118


SELECT a,k6001,bj,k6119
--update k060 set HK0149=RTRIM(AD)+'年'
from nb 
inner join k060 on BN=K6040
where bj<>hk6119



SELECT a,k6001,bk,k6120
--update k060 set HK0149=RTRIM(AD)+'年'
from nb 
inner join k060 on BN=K6040
where bk<>hk6120


SELECT a,k6001,bl,k6041
--update k060 set HK0149=RTRIM(AD)+'年'
from nb 
inner join k060 on BN=K6040
where bl<>hk6041

SELECT distinct k6004 ,hk6004 
from k060


SELECT  A1307 ,hA1307
from k060 
INNER JOIN NB ON  B =		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
WHERE BE<>A1307






SELECT  BI,K6118 ,hK6118
--UPDATE K060 SET K6118='2' ,hK6118='否'
from k060 
INNER JOIN NB ON B =		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
WHERE BI<>hK6118


SELECT  B,COUNT(B)
FROM NB 
GROUP BY b
ORDER BY COUNT(B) DESC







SELECT  BI,convert (VARCHAR(255),k0199)
--UPDATE K060 SET K6118='2' ,hK6118='否'
from k060 
INNER JOIN NB ON B =		case when left(k0101,1) in ('G','S','H','T') THEN rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(rtrim(a0103),6) ELSE rtrim(K0101) END+'L'+rtrim(K6001)
WHERE Bm<> convert (VARCHAR(255),k0199)






SELECT [as],[at],au,av ,k6028,hk6028,a1305,k6050
--update nb set [as]=k6028,[at]=rtrim(hk6028),au=a1305
from nb 
INNER JOIN k060 on BN=K6040
where [as]<>k6028 or au<>a1305 or av <>k6050







