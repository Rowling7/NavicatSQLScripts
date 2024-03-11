--use[HRP-GHSS2008]

select 
--'UPDATE '+C2.FCODE+' SET H'+C1.FIELDNAME+' = OBJJC FROM K01 JOIN '+C2.FCODE+' ON '+C1.FIELDNAME+' = OBJNAME'
--RTRIM(c1.fieldname)+',--'+c2.objjc,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--CASE WHEN FTYPE = 'N' THEN 'SUM(ISNULL('+RTRIM(c1.fieldname)+',0)),--'+c2.objjc ELSE 'RTRIM(MAX('+RTRIM(c1.fieldname)+')),--'+c2.objjc END,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--CASE WHEN FTYPE = 'N' THEN 'ISNULL('+RTRIM(c1.fieldname)+',0)=0 and ' +c2.objjc ELSE 'RTRIM('+RTRIM(c1.fieldname)+') is null and '+c2.objjc  END,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--RTRIM(OBJJC)+'|'+RTRIM(OBJNAME)
--''''+c2.objjc+''','
case when c2.ftype = 'd' then c1.fieldname+',h'+c1.fieldname+',--' else rtrim(c1.fieldname)+',--' end+c2.objjc,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--case when c2.ftype = 'd' then 'rtrim('+c1.fieldname+'),rtrim(h'+c1.fieldname+'),--' else rtrim(c1.fieldname)+',--' end+c2.objjc,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--CASE WHEN FTYPE = 'N' THEN 'ISNULL(a.'+RTRIM(c1.fieldname)+',0)-ISNULL(b.'+RTRIM(c1.fieldname)+',0) ['+c2.objjc+'],' ELSE 'RTRIM(MAX('+RTRIM(c1.fieldname)+')),--'+c2.objjc END,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--CASE WHEN FTYPE = 'N' THEN ''''+c2.objjc+''''+',' ELSE 'RTRIM(MAX('+RTRIM(c1.fieldname)+')),--'+c2.objjc END,c2.ftype,c2.flen,c2.fdec,C2.FCODE
--CASE WHEN FTYPE = 'N' THEN 'SUM(ISNULL('+RTRIM(c1.fieldname)+',0)) '+RTRIM(c1.fieldname)+',--'+c2.objjc ELSE 'RTRIM(MAX('+RTRIM(c1.fieldname)+')),--'+c2.objjc END,c2.ftype,c2.flen,c2.fdec,C2.FCODE
        from oydst_fieldcont1 as p
             join
             oydst_fieldcont1 as c1
             on p.objid = c1.parentid
             join
             oydst_fields as c2
             on c1.fieldname = c2.objname
        where (        
                c1.fieldname is not null
                and
                p.tablename = 'A51'
                --and
                --p.tablejc is not null
                --AND
                --C2.FTYPE = 'D'
               )
        order by p.tablename,c1.fieldname
	
	
	SELECT count(*) from A51
--
/*
select a.tablename,
case when c.ftype = 'd' then 'h'+b.fieldname+','+b.fieldname+',--'+c.objjc+space(10)+isnull(b.fkey,'') else b.fieldname+',--'+c.objjc+space(10)+isnull(b.fkey,'') end
,c.ftype,c.flen,c.fdec,b.fkey
from oydst_fieldcont1 a
join oydst_fieldcont1 b on a.objid = b.parentid
join oydst_fields c on b.fieldname = c.objname
where a.tablename = 'a11'
and b.fieldname is not null
order by b.fkey,b.fieldname
*/


select rtrim(a.K0154),--起点分界点类别
rtrim(a.K0158)--止点分界点类别
from k001 a