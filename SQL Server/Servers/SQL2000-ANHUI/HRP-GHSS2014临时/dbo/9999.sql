SELECT rtrim(k0101)+rtrim(k0115),k1302,K3912
--update k001 set k3912='21',hk3912='指标变更或地理位置变更'
from k001 
where rtrim(k0101)+rtrim(k0115) in ('C124340491001','X020340491004','C004340491001','C006340491001','C008340491001','C010340491001','C012340491001','C013340491001','C013340522002','C013340522003','C014340491001','C016340491001','C018340491001','C020340491001','C021340491001','C023340491001','C024340491001','C024340491002','C027340491001','C029340491001','C032340491001','C033340491001','C034340491001','C035340491001','C036340491001','C037340491001','C038340491001','C039340491001','C040340491001','C041340491001','C043340491001','C043340491002','C043340491003','C044340491001','C045340491001','C047340523001','C049340491001','C049340491002','C050340491001','C051340491001','C052340491001','C053340491001','C054340491001','C055340491001','C057340491001','C058340491001','C059340491001','C060340491001','C061340491001','C062340491001','C065340491001','C066340491001','C067340491001','C068340491001','C071340491001','C072340491001','C074340491001','C075340491001','C076340491001','C077340491001','C078340491001','C079340491001','C080340491001','C081340491001','C082340491001','C083340491001','C084340491001','C085340491001','C085340491002','C086340491001','C090340491001','C091340491001','C091340491002','C092340491001','C093340491001','C095340491001','C096340491001','C097340491001','C098340491001','C099340491001','C100340491001','C101340491001','C102340491001','C103340491001','C104340491001','C105340491001','C107340491001','C108340491001','C109340491001','C111340491001','C112340491001','C113340491001','C114340491001','C115340491001','C116340491001','C117340491001','C118340491001','C119340491001','C120340491001','C121340491001','C123340491001','C125340491001','C126340491001','C127340491001','C129340491001','C130340491001','C131340491001','C132340491001','C133340491001','C137340491001','C138340491001','C140340491001','C141340491001','C143340491001','C144340491001','C145340491001','C147340491001','C148340491001','C149340491001','C150340491001','C151340491001','C152340491001','C153340491001','C154340491001','C155340491001','C156340491001','C158340491001','C159340491001','C160340491001','C162340491001','C164340491001','C165340491001','C166340491001','C167340491001','C169340491001','C170340491001','C171340491001','C172340491001','C173340491001','C174340491001','C175340491001','C176340491001','C177340491001','C179341203002','C180340491001','C182340491001','C183340491001','C184340491001','C185340491001','C187340491001','C188340491001','C189340491001','C190340491001','C191340491001','C192340491001','C193340491001','C194340491001','C195340491001','C197340491001','C198340491001','C200340491001','C202340491001','C203340491001','C204340491001','C205340491001','C206340491001','C207340491001','C209340491001','C210340491001','C211340491001','C212340491001','C213340491001','C215340491001','C216340491001','C217340491001','C218340491001','C219340491001','C221340491001','C222340491001','C223340491001','C224340491001','C225340491001','C226340491001','C227340491001','C228340491001','C229340491001','C230340491001','C231340491001','C232340491001','C233340491001','C234340491001','C235340491001','C236340491001','C237340491001','C238340491001','C239340491001','C240340491001','C242340491001','C243340491001','C244340491001','C245340491001','C246340491001','C258340491001','C259340491001','C260340491001','C261340491001','C262340491001','C263340491001','C264340491001','C265340491001','C266340491001','C267340491001','C268340491001','C269340491001','C338341202001','C345341202001','C399341202005','C545341203001','C576341202002','C823340522002','C850340522001','C852340522001','C859340522001','C890340522001','C906341202001','C907341202001','C908341202001','C914341202001','C917341202001','C920341202001','C921341202001','CB02341203001','CB03341203001','CB03341203002','CB06341203001','CD25340522003','CE90341723001','CM65341723001','CM66341723001','CM67341723001','X004340504001','X017340595001','X017340595002','X018340595001','X018340595002','X020340491001','X020340491002','X020340491003','X020340491005','X024340491001','X024340491002','X024340491003','X024340491004','X024340491005','X024340491006','X024340491007','X024340491008','X104341202019','X104341202020','X104341202021','X104341202022','X104341202023','X104341202024','X104341202025','X104341202026','X104341202027','X104341202028','X108341203002','X108341203006','X203341203001','X203341203003','X203341203004','X207341202006','X306341203003','X306341203004','X306341203005','X306341203008','X307341225010','X307341225011','X307341225012','X307341225013','X307341225014','X307341225015','X307341225016','X307341225017','X307341225018','X316341323006','X321341323001','X321341323004','X428341823005','X509341203001','X509341203002','X509341723002','X510341203002','X511341203001','X511341203005','X512341203003','X512341203007','X512341203008','X512341203019','X512341203020','X514341203006','X543341225011','Y001340491001','Y001340491002','Y002340491003','Y003340405001','Y003340491001','Y004340491001','Y004340491002','Y004340491007','Y004340523001','Y004340523003','Y004340595001','Y005340491001','Y005340491002','Y006340491001','Y006340523001','Y006340523002','Y007340523001','Y007340523002','Y008340491001','Y008340491002','Y009340491001','Y009340491002','Y011340523001','Y011340523002','Y012340491001','Y013340595001','Y013340595002','Y014340595001','Y015340491001','Y015340491002','Y015340491003','Y015340491004','Y016340491001','Y016340491002','Y016340491003','Y018340491001','Y020340491001','Y020340491002','Y020340491003','Y022340491001','Y022340491002','Y022341202007','Y022341202008','Y022341202009','Y022341202010','Y023340491001','Y025340372001','Y025340491004','Y033341202004','Y040340523002','Y056341202001','Y058341202001','Y058341202003','Y066341202004','Y075341722004','Y075341722006','Y096341323009','Y124340522001','Y125340522001','Y125340522003','Y125340522004','Y148341723001','Y149341723001','Y150341723001','Y166341723001') --and k3912 is null
order by k3912


SELECT k3912 ,hk3912 
from k001 
where k3912 ='21'