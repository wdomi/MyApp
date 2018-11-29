<?php

// Heading of table
echo "<table border='1'>	
    <tr>
        <th>Name</th>
        <th>Kind</th>
        <th>Coord N</th>
        <th>Coord E</th>
        <th>Individual</th>
        <th>Deleted</th>
        <th>Edit</th>
    </tr>";

//connection to DB
include('conf/config.php');

// Define & Execute query, fetch data from DB for all table rows
$query=$conn->prepare('SELECT sample.id, sample.id_individual as idi, sample.name as sname, sample.kind, sample.coord_n, sample.coord_e, sample.deleted, individual.name as iname
    FROM sample
    LEFT JOIN individual ON sample.id_individual = Individual.id 
    WHERE sample.deleted=0
    LIMIT 15');	
    
$query->execute();

//Error message MySQL 
if ( $query->errorCode() > 0 ){
  $fehler=$query->errorInfo();
  echo "$fehler[2]";
  exit;
}

while($row=$query->fetch()){
  $id	    = $row['id'];
  $idi      = $row['iname'];
  $sname    = $row['sex'];
  $kind     = $row['birthyear'];
  $coon     = date("Y") - $year;
  $cooe     = $row['pname'];
  $del      = $row['deleted'];
  $iname    = $row['iname'];
  
  echo "<tr>
         <td>$sname</td>
         <td>$kind</td>
		 <td>$coon</td>
		 <td>$cooe</td>
         <td>$iname</td>
         <td>$del</td>
		 <td><a href='php/hide_ind.php?id=$id'> remove </td>
		</tr>";
}	
echo "</table>";	
?>