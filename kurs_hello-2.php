<?php

$name = 'Mueller';
$vorname = 'Gion';

echo 'Du bist nicht ', $vorname, ' ', $name, ', ';
// oder
echo "ich bin $vorname $name!";

echo '<br>',"<br>\n";  // das ist ein Zeilenbruch in PHP, das "<br>\n" wiedergibt das Zeilenumbruch im HTML Seitenquellentext

$i = 5;
$y = 100;
echo $i,'+',$y,' = ',$i+$y;
// oder
echo $i.'+'.$y.'= ',$i+$y;

?>

<br>  <!-- das ist jetzt ein Zeilenbruch in HTML -->
<br>
<br>

<?php

$k = 20000;
$z = 1+5.3/100;
$t = 'Kapital nach Jahr ';

$k1 = $k*$z;
$k1r = round($k1,2);
$k2 = $k1*$z;
$k2r = round($k2,2);
$k3 = $k2*$z;
$k3r = round($k3,2);
$k4 = $k3*$z;
$k4r = round($k4,2);

/*
echo "Anfangskapital: $k<br>\n";
echo "$t 1:  $k1r<br>\n";
echo "$t 2:  $k2r<br>\n";
echo "$t 3:  $k3r<br>\n";
echo "$t 4:  $k4r<br>\n";
*/

$kaps = [$k,$k1r,$k2r,$k3r,$k4r];

"<br>
<hr>";
for ($i=1;$i<count($kaps)+1;$i++){
	echo 'Kapital Ende von Jahr ', $i-1, ': ', $kaps[$i],'<br>';
}
"<br>
<hr>";

?>

<br>
<br>

<table>
	<tr> 
		<td> 
		<?php echo $t, '0: '; ?>
		</td>
		<td>  
		<?php echo $k; ?>
		</td>
	</tr>
	<tr> 
		<td> 
		<?php echo  $t, '1: '; ?>
		</td>
		<td>
		<?php echo $k1r; ?>
		</td>
	</tr>
	<tr> 
		<td> 
		<?php echo  $t, '2: '; ?>
		</td>
		<td>
		<?php echo $k2r; ?>
		</td>
	</tr>
	<tr> 
		<td> 
		<?php echo  $t, '3: '; ?>
		</td>
		<td>
		<?php echo $k3r; ?>
		</td>
	</tr>
	<tr> 
		<td> 
		<?php echo  $t, '4: '; ?>
		</td>
		<td> 
		<?php echo $k4r; ?>
		</td>
	</tr>
</table>

<?php
include('fusszeile.php');
?>