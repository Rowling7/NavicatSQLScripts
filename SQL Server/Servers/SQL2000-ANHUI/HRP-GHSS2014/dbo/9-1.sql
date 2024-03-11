if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#tk060'))
drop table #tk060
SELECT
[F1],[F2],[F3],[F4],[F5],[F6],[F7],[F8],[F9],[F10],[F11],[F12],[F13],[F14],[F15],[F16],[F17],[F18],[F19],[F20],[F21],[F22],[F23],[F24],[F25],[F26],[F27],[F28],[F29],[F30],[F31],[F32],[F33],[F34],[F35],[F36],[F37],[F38],[F39],[F40],[F41],[F42],[F43],[F44],[F45],[F46],[F47],[F48],[F49],[F50],[F51],[F52],[F53],[F54],[F55],[F56],[F57],[F58],[F59],[F60],[F61],[F62],[F63],[F64],[F65],[F66],[F67]
into #tk060
from OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\2.安徽工作文件\1.工作文件（日期分类）\20240228 桥梁对比\各地市国道桥梁\07-g (2).xls',Sheet1$)
WHERE [F1] IS NOT NULL

SELECT [F1],[F2],[F3],[F4],[F5],[F6],[F7],[F8],[F9],[F10],[F11],[F12],[F13],[F14],[F15],[F16],[F17],[F18],[F19],[F20],[F21],[F22],[F23],[F24],[F25],[F26],[F27],[F28],[F29],[F30],[F31],[F32],[F33],[F34],[F35],[F36],[F37],[F38],[F39],[F40],[F41],[F42],[F43],[F44],[F45],[F46],[F47],[F48],[F49],[F50],[F51],[F52],[F53],[F54],[F55],[F56],[F57],[F58],[F59],[F60],[F61],[F62],[F63],[F64],[F65],[F66],[F67]
FROM #TK060



SELECT [F1],count([F1])
FROM #TK060 
group by [F1] WITH ROLLUP
ORDER by [F1]