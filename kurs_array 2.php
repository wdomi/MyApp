<?php

/* 

$kursleiter[]='Roberto Mazzoni';
$kursleiter[]='Peter Vollenweider';
$kursleiter[]='Jann Forrer';
$kursleiter[]='David Meier';

$t = 'Kursleiter ';

echo $t, '1: ', $kursleiter[0], '<br>';
echo $t, '2: ', $kursleiter[1], '<br>';
echo $t, '3: ', $kursleiter[2], '<br>';
echo $t, '4: ', $kursleiter[3], '<br>';

or better see below


 
'<br>';
'<hd>';
'<br>';


$kursleiter=['Roberto Mazzoni',
			'Peter Vollenweider',
			'Jann Forrer',
			'David Meier'];

for ($i=0;$i<count($kursleiter);$i++){
	echo "Kursleiter $i: $kursleiter[$i]<br>";
}



$name = 'Meier';
// $name = '';

if ($name){
	echo "Sie haben $name eingegeben";
}
else{
	echo "Sie haben nichts eingegeben";
}

// ----------------------------


unset($kursleiter);  // leert die Variabel


// Assoziative Arrays:

$kursleiter['maz']='Roberto Mazzoni';
$kursleiter['vol']='Peter Vollenweider';
$kursleiter['for']='Jann Forrer';
$kursleiter['mei']='David Meier';

echo 'Kursleiter maz: ',$kursleiter['maz'],'<br>'; 
echo 'Kursleiter vol: ',$kursleiter['vol'],'<br>'; 
echo 'Kursleiter mei: ',$kursleiter['mei'],'<br>'; 
echo 'Kursleiter for: ',$kursleiter['for'],'<br>'; 

*/

$kursleiter = ['maz' => 'Roberto Mazzoni',
               'vol' => 'Peter Vollenweider',
               'for' => 'Jann Forrer',
               'mei' => 'David Meier'];

// This is a loop
foreach($kursleiter as $key => $wert){
  echo "kursleiter $key $wert <br>";
}

echo '<br>';


// Quick command to look at the array, not nice but quick
var_dump($kursleiter);





?>