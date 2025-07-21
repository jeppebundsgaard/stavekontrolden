-- Sammensætninger mangler nok alle sidst i sammensætnings-klassen. (se $as i skabdic). Måske skal alle fugelementer bare have den tilføjet... det er nok det...
-- #Fugeelementets affixclass hentes ind og bindestreg
		--if($fuge) $dic.=(($wordclass or $sidst)?",":"/").$idarr[$fugeclasses[$fuge]].($fuge!="-"?",".$idarr[$fugeclasses["bindestreg"]]:""); //Hvis fugeelementet er dobbeltbindestreg (så har det ingen fugeclass) så accepteres kun sammensætninger med bindestreg
		
--select * from stavekontroldendk.smartsiteinput_main_affixrule where morphdescrid not in (select id from stavekontrolden.morphdescr)
-- select * from stavekontroldendk.smartsiteinput_main_affixrule where affixclassid not in (select id from stavekontrolden.affixclass)

insert into affixclass (lang,id,crossproduct,description,affixclass) select "da_DK", id,crossproduct,description,affixclass from stavekontroldendk.smartsiteinput_main_affixclass ;

insert into morphdescr (lang,id,morphdescr) select "da_DK", id,morphdescr from stavekontroldendk.smartsiteinput_main_morphdescr ;
-- Opretter id 905 - skal rettes til 0...
INSERT INTO `morphdescr` (`lang`, `id`, `morphdescr`) VALUES ('da_DK', '0', '');

insert into affixrule (lang,id,	affixclassid 	,stripchars 	,affix 	,`condition` 	,morphdescrid 	,description) select "da_DK", id,	affixclassid 	,stripchars 	,affix 	,`condition` 	,morphdescrid 	,description from stavekontroldendk.smartsiteinput_main_affixrule o where o.affixclassid!=0;


--select * from stavekontroldendk.smartsiteinput_main_affixruleassociation where affixruleid not in (select id from stavekontrolden.affixrule)
-- giver affixruleid: 1093 som mangler
insert into affixrule_to_affixclass (lang,affixruleid,affixclassid) select "da_DK", affixruleid 	,associeretaffixruleid from stavekontroldendk.`smartsiteinput_main_affixruleassociation` o where o.affixruleid!=1093;

insert into wordclass (lang,id,wordclass) select "da_DK", id,Ordklasse from stavekontroldendk.smartsiteinput_main_ordklasse ;

insert into wordclass_to_affixclass (lang,wordclassid,affixclassid) select "da_DK", ordklasseid,affixclassid from stavekontroldendk.`smartsiteinput_main_ordklassetilaffixclass` ;

--select * from stavekontroldendk.smartsiteinput_main_ord where ordklasseid not in (select id from stavekontrolden.wordclass)
--Indsæt ordklasse med id 0

insert into words	(lang,id,word,wordclass,wordstatus,alternatives,lastuser,contributor,word_definition,comments,technical_term,fugeelementid,strong_declension,apostroph,log,lastchange) select "da_DK", o.id,Ord,ordklasseid,if(`status`>1 and `status`<2,1,if(`status`<-1 and `status`>-2,-1,`status`)),alternativer,behandler,bidrager,ordforklaring,Kommentare,Fagterm,f.id,staerkeformer,if(apostrof="",0,1),historie,tidforinput from stavekontroldendk.`smartsiteinput_main_ord` o left join fugeelement f on o.fugeelement=f.fugeelement

	
update `affixrule` set description=concat("Verdenshjørne, ",affix)  WHERE description LIKE "Verdenshjørne"

SET @a:=0;
UPDATE affixclass SET id=@a:=@a+1 WHERE 1 ORDER BY description;

SET @a:=0;
UPDATE affixrule SET id=@a:=@a+1 WHERE 1 ORDER BY description;

SET @a:=0;
UPDATE words SET id=@a:=@a+1 WHERE 1 ORDER BY word;

SET @a:=0;
UPDATE wordclass SET id=@a:=@a+1 WHERE 1 ORDER BY wordclass;

SET @a:=-1;
UPDATE morphdescr SET id=@a:=@a+1 WHERE 1 ORDER BY morphdescr;

SET @max_id = (SELECT MAX(id)+1 FROM `affixclass` );
SET @sql = CONCAT('ALTER TABLE `affixclass` AUTO_INCREMENT = ', @max_id);
PREPARE st FROM @sql;
EXECUTE st;

SET @max_id = (SELECT MAX(id)+1 FROM `affixrule` );
SET @sql = CONCAT('ALTER TABLE `affixrule` AUTO_INCREMENT = ', @max_id);
PREPARE st FROM @sql;
EXECUTE st;

SET @max_id = (SELECT MAX(id)+1 FROM `wordclass` );
SET @sql = CONCAT('ALTER TABLE `wordclass` AUTO_INCREMENT = ', @max_id);
PREPARE st FROM @sql;
EXECUTE st;

SET @max_id = (SELECT MAX(id)+1 FROM `words` );
SET @sql = CONCAT('ALTER TABLE `words` AUTO_INCREMENT = ', @max_id);
PREPARE st FROM @sql;
EXECUTE st;

SET @max_id = (SELECT MAX(id)+1 FROM `morphdescr` );
SET @sql = CONCAT('ALTER TABLE `morphdescr` AUTO_INCREMENT = ', @max_id);
PREPARE st FROM @sql;
EXECUTE st;
