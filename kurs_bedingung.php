<?php

$vorname = 'Max';
$name = 'Huber';
$abteilung = 'IT';

if ($abteilung == 'IT'){
	echo "$vorname $name: die Aktion wurde erfolgreich ausgefuehrt.";
}
else {
	echo "$vorname $name, die Aktion konnte nicht ausgeführt werden. Nur IT Mitarbeitende sind berechtigt.";
}

$kursleiter['maz']='Roberto Mazzoni';
$kursleiter['vol']='Peter Vollenweider';
$kursleiter['for']='Jann Forrer';
$kursleiter['mei']='David Meier';

echo 'Kursleiter maz: ',$kursleiter['maz'],'<br>'; 
echo 'Kursleiter vol: ',$kursleiter['vol'],'<br>'; 
echo 'Kursleiter mei: ',$kursleiter['mei'],'<br>'; 
echo 'Kursleiter for: ',$kursleiter['for'],'<br>'; 


?>