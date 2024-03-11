if object_id('tempdb..##tk60') is not null
drop table ##tk060
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\　东方永德\hrp-ghss\标准版\单机版\2014'
	,'path' , @softpath output
set @filepath=@softpath+'资产平台桥梁明细表.xls'
declare @query nvarchar(1000);
set @query = 
    'drop table ##tk060
		--insert into ##tk060
		select 
        *
				into ##tk060
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [明细表$]'')';

exec(@query);


SELECT *  from ##tk060


IF
begin( )