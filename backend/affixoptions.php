<?php 
$crossproductoptions="";
$choices=array("Y"=>_("Yes"),"N"=>_("No"));
foreach($choices as $k=>$r) $crossproductoptions.='<option value="'.$k.'" >'.$r.'</option>';

$affixclassoptions="";
$choices=array(
"SFX"=>"Suffix",
"PFX"=>"Prefix",
"CIRCUMFIX"=>"CIRCUMFIX",
"FULLSTRIP"=>"FULLSTRIP",
"FORBIDDENWORD"=>"FORBIDDENWORD",
"KEEPCASE"=>"KEEPCASE",
//ICONV not included
//OCONV not included
"NEEDAFFIX"=>"NEEDAFFIX",
"SUBSTANDARD"=>"SUBSTANDARD",
"CHECKSHARPS"=>"CHECKSHARPS",
"COMPOUNDBEGIN"=>"COMPOUNDBEGIN",
"COMPOUNDMIDDLE"=>"COMPOUNDMIDDLE",
"COMPOUNDEND"=>"COMPOUNDEND",
#"COMPOUNDLAST"=>"COMPOUNDLAST", # Manual has COMPOUNDLAST p. 6, but uses COMPOUNDEND in example p. 15...
"ONLYINCOMPOUND"=>"ONLYINCOMPOUND",
"COMPOUNDMIN"=>"COMPOUNDMIN",
"COMPOUNDFLAG"=>"COMPOUNDFLAG",
"WORDCHARS"=>"WORDCHARS",
"COMPOUNDPERMITFLAG"=>"COMPOUNDPERMITFLAG",
"COMPOUNDFORBIDFLAG"=>"COMPOUNDFORBIDFLAG",
"COMPOUNDMORESUFFIXES"=>"COMPOUNDMORESUFFIXES",
"COMPOUNDROOT"=>"COMPOUNDROOT",
"COMPOUNDWORDMAX"=>"COMPOUNDWORDMAX",
"CHECKCOMPOUNDCASE"=>"CHECKCOMPOUNDCASE",
"CHECKCOMPOUNDDUP"=>"CHECKCOMPOUNDDUP",
"CHECKCOMPOUNDTRIPLE"=>"CHECKCOMPOUNDTRIPLE",
"SIMPLIFIEDTRIPLE"=>"SIMPLIFIEDTRIPLE",
"CHECKCOMPOUNDREP"=>"CHECKCOMPOUNDREP",
"CHECKCOMPOUNDPATTERN"=>"CHECKCOMPOUNDPATTERN",
"FORCEUCASE"=>"FORCEUCASE",
"FORCEUCASE"=>"FORCEUCASE",
"NOSUGGEST"=>"NOSUGGEST",
"SYLLABLENUM"=>"SYLLABLENUM"
);

foreach($choices as $k=>$r) $affixclassoptions.='<option value="'.$k.'" >'.$r.'</option>';

$q='select `id`, `description` from affixclass where lang="'.$_SESSION['lang'].'" ORDER BY `description` ASC';
$result=$mysqli->query($q);

$affixoptions='';
while($r=$result->fetch_assoc()) $affixoptions.='<option value="'.$r["id"].'" >'.$r["description"].'</option>';


$q='select `id`, `morphdescr` from morphdescr f where lang="'.$_SESSION['lang'].'" ORDER BY `morphdescr` ASC';
$result=$mysqli->query($q);
$morphoptions='';
while($r=$result->fetch_assoc()) $morphoptions.='<option value="'.$r["id"].'" '.($filters["morphdescr"]==$r["id"]?"selected":"").'>'.$r["morphdescr"].'</option>';
