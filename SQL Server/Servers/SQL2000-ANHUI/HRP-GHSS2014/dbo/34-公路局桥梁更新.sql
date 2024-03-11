--以下桥梁的跨越物为河流（包括运河、湖泊、干河槽）时，跨越物名称不应为空、未知、无、路等，请填写具体的河流、湖泊等，情况属实可忽略。
/*
河流(含运河、湖泊、干河槽)  	1
沟壑                        	3
管道(大型输送管道)          	4
道路(含非机动车道)          	5
铁路                        	6
水渠                        	7
旱地                        	8
其它地物                    	9
*/
SELECT RTRIM(K0101),RTRIM(K6001),RTRIM(K6002),RTRIM(K6003),RTRIM(K6005),RTRIM(HK6005),RTRIM(K6006)
FROM K60
WHERE K6005<>'3' AND RTRIM(K6006) LIKE '%沟%'  and RTRIM(K6006) not  LIKE '%渠%'
and left(k0101,1) in ('g','s','h','t')

---更新沟 k60 459
update k60 set k6005='3',hk6005='沟壑'
FROM K60
WHERE K6005='1' AND RTRIM(K6006) LIKE '%沟%' 
and left(k0101,1) in ('g','s','h','t')

--查询渠363
SELECT RTRIM(K0101),RTRIM(K6001),RTRIM(K6002),RTRIM(K6003),RTRIM(K6005),RTRIM(HK6005),RTRIM(K6006)
FROM K60
WHERE K6005<>'7' AND RTRIM(K6006) LIKE '%渠%' 
and left(k0101,1) in ('g','s','h','t')

--更新渠
--update k60 set k6005='7',hk6005='水渠'
FROM K60
WHERE K6005<>'7' AND RTRIM(K6006) LIKE '%渠%' 
and left(k0101,1) in ('g','s','h','t')

SELECT RTRIM(K0101),RTRIM(K6001),RTRIM(K6002),RTRIM(K6003),RTRIM(K6005),RTRIM(HK6005),RTRIM(K6006)
--update k060 set k6005='4',hk6005='管道(大型输送管道)'
FROM K060
WHERE  rtrim(k6002)= '石油管道分离立交桥'

SELECT RTRIM(K0101),RTRIM(K6001),RTRIM(K6002),RTRIM(K6003),RTRIM(K6005),RTRIM(HK6005),RTRIM(K6006)
--update k60 set k6005='4',hk6005='管道(大型输送管道)'
FROM K60
WHERE K6005<>'4' AND RTRIM(K6006) LIKE '%管道%' 
and left(k0101,1) in ('g','s','h','t') and rtrim(k6001)='S246340825L0380'


SELECT rtrim(k6002)+rtrim(k6001)+rtrim(k6006),RTRIM(K6005),RTRIM(HK6005)
--update k060 set k6005='9',hk6005='其它地物'
from K060
where rtrim(k6002)+rtrim(k6006)in
(
'K1328+973通道桥左幅通道','K1332+432小桥左幅通道','K1333+222小桥左幅通道','凤凰冲中桥非常溢洪道','杨林闸大桥杨林闸','K3+830大桥右幅小汪桥','幸福冲桥幸福冲','刘府二桥刘府','刘府一桥刘府','刘府大桥刘府','文光桥刘府','三官桥陈桥','大兴桥考城','k36+560南将军山下游溢洪道中桥南将军山下游溢洪道','宝光寺桥宝光寺','K969+267中桥（左幅）泄洪道','K1319+096小桥左幅通道','中畈铺桥中畈铺桥','驿里闸桥驿里闸','153.283永丰中桥（右线）永丰','山洪截源桥山洪截源','复兴圩特大桥复兴圩','K478+559X008','K740+751淠淮航道大桥（右幅）淠淮航道','K740+751淠淮航道大桥（左幅）淠淮航道','袁村桥高源','K4+068金宝圩高架桥（右幅）金宝圩','K8+178联建圩高架桥（右幅）联建圩','高速立交桥南洛高速','七里桥袁家坡','陈圩桥陈圩','高速连接线桥小寨桥','四树大桥四树','夏郢桥夏郢','徐小寨桥（上行）张大庄','K969+267中桥（右幅）泄洪道','汊口2号桥碧源关','K1319+096小桥右幅通道','西坑1号桥山谷','K3+230大桥左幅小赵','K3+830大桥左幅小汪桥','K66+036东荒田大桥荒地','蛇坑一号大桥旱地','陈家桥陈家桥','含山南互通E匝道桥荒地','上跨3桥支线/京珠线','上跨沪渝高速桥G50沪渝高速','K1331+001通道桥右幅通道','石壁冲桥(下行)石壁冲','石壁冲桥(上行)石壁冲','153.283永丰中桥（左线）永丰','溢洪道大桥溢洪道','DK0+436.618匝道桥荒地','K1328+973通道桥右幅通道','田段桥九龙瀑','五三桥老318南青线','K4+068金宝圩高架桥（左幅）金宝圩','K8+178联建圩高架桥（左幅）联建圩','k36+560南将军山下游溢洪道中桥南将军山下游溢洪道','考城桥考城','K3+230大桥右幅小赵','K1332+432小桥右幅通道','K1333+222小桥右幅通道'
)


SELECT rtrim(k6002)+rtrim(k6001)+rtrim(k6006),RTRIM(K6005),RTRIM(HK6005)
--update k60 set k6005='9',hk6005='其它地物'
from K60
where rtrim(k6002)+rtrim(k6001)+rtrim(k6006)in
(
'K1328+973通道桥左幅H3341022L5710通道','K1332+432小桥左幅H3341002L5740通道','K1333+222小桥左幅H3341002L5750通道','凤凰冲中桥S603341523L0050非常溢洪道','杨林闸大桥G347340826L0010杨林闸','K3+830大桥右幅S30340281L0030小汪桥','幸福冲桥S443341524L0020幸福冲','刘府二桥S315341126L0100刘府','刘府一桥S315341126L0110刘府','刘府大桥S315341126L0120刘府','文光桥S315341126L0130刘府','三官桥S315341126L0140陈桥','大兴桥S315341126L0160考城','k36+560南将军山下游溢洪道中桥T12341103L0058南将军山下游溢洪道','宝光寺桥S229341302L0010宝光寺','K969+267中桥（左幅）H3341125L1743泄洪道','K1319+096小桥左幅H3341022L5580通道','中畈铺桥G318341702L0350中畈铺桥','驿里闸桥G347340826L0080驿里闸','153.283永丰中桥（右线）G4212340881L0035永丰','山洪截源桥S408341323L0080山洪截源','复兴圩特大桥S232340722L0120复兴圩','K478+559G0321341321L0270X008','K740+751淠淮航道大桥（右幅）G0321340422L0051淠淮航道','K740+751淠淮航道大桥（左幅）H0321340422L0550淠淮航道','袁村桥S228341723L0050高源','K4+068金宝圩高架桥（右幅）S28341802L0198金宝圩','K8+178联建圩高架桥（右幅）S28340210L0200联建圩','高速立交桥G329341222L0010南洛高速','七里桥S315341126L0070袁家坡','陈圩桥S315341126L0090陈圩','高速连接线桥S301341321L0050小寨桥','四树大桥G206340121L0773四树','夏郢桥G206340121L0100夏郢','徐小寨桥（上行）S102341203L0160张大庄','K969+267中桥（右幅）G3341125L1743泄洪道','汊口2号桥G205341022L3700碧源关','K1319+096小桥右幅G3341004L5590通道','西坑1号桥G3341022L6150山谷','K3+230大桥左幅T30340281L0130小赵','K3+830大桥左幅T30340281L0110小汪桥','K66+036东荒田大桥H4211340521L9807荒地','蛇坑一号大桥G3341022L5970旱地','陈家桥S464340828L0040陈家桥','含山南互通E匝道桥G4221340522L3637荒地','上跨3桥G318340828L0280支线/京珠线','上跨沪渝高速桥S246340825L0350G50沪渝高速','K1331+001通道桥右幅G3341004L5740通道','石壁冲桥(下行)S332341525L0090石壁冲','石壁冲桥(上行)S332341525L0100石壁冲','153.283永丰中桥（左线）H4212340881L0134永丰','溢洪道大桥S603341523L0200溢洪道','DK0+436.618匝道桥G4221340522L3638荒地','K1328+973通道桥右幅G3341004L5720通道','田段桥G205341003L0800九龙瀑','五三桥S457340223L0150老318南青线','K4+068金宝圩高架桥（左幅）T28341802L0313金宝圩','K8+178联建圩高架桥（左幅）T28340210L0315联建圩','k36+560南将军山下游溢洪道中桥S12341103L0057南将军山下游溢洪道','考城桥S315341126L0170考城','K3+230大桥右幅S30340281L0010小赵','K1332+432小桥右幅G3341022L5750通道','K1333+222小桥右幅G3341002L5760通道')


！！！/*
手动更新
   ****>L07-1:ERROR0094:以下桥梁的跨越物为其它时，该种跨越物应是跨越地物类型1~8无法确定的类型，多种跨越物的请选择主要跨越物进行调整
      ^1:省份代码:34  桥梁名称:K66+036东荒田大桥  桥梁代码:H4211340521L9807  跨越地物代码:9  跨越地物:其它  跨越地物名称:荒地
      ^2:省份代码:34  桥梁名称:蛇坑一号大桥  桥梁代码:G3341022L5970  跨越地物代码:9  跨越地物:其它  跨越地物名称:旱地
      ^3:省份代码:34  桥梁名称:DK0+436.618匝道桥  桥梁代码:G4221340522L3638  跨越地物代码:9  跨越地物:其它  跨越地物名称:荒地
      ^4:省份代码:34  桥梁名称:含山南互通E匝道桥  桥梁代码:G4221340522L3637  跨越地物代码:9  跨越地物:其它  跨越地物名称:荒地

*/
