<?php

// Heading of table
echo "<table border='1'>	
    <tr>
        <th>Name</th>
        <th>Sex</th>
        <th>Year of birth</th>
        <th>Age</th>
        <th>Population</th>
        <th>Deleted</th>
        <th>Edit</th>
    </tr>";

//connection to DB
include('conf/config.php');

// Define & Execute query, fetch data from DB for all table rows
$query=$conn->prepare('SELECT individual.id, individual.name as iname, individual.sex, individual.birthyear, individual.age, population.name as pname, individual.deleted
    FROM individual
    LEFT JOIN population ON individual.id_population = population.id 
    WHERE individual.deleted=0
    LIMIT 15');	
    
$query->execute();

//Error message MySQL 
if ( $query->errorCode() > 0 ){
  $fehler=$query->errorInfo();
  echo "$fehler[2]";
  exit;
}

while($row=$query->fetch()){
  $id		= $row['id'];
  $name     = $row['iname'];
  $sex      = $row['sex'];
  $year     = $row['birthyear'];
  $age      = date("Y") - $year;
  $pop      = $row['pname'];
  $del      = $row['deleted'];
  
  echo "<tr>
         <td>$name</td>
         <td>$sex</td>
		 <td>$year</td>
		 <td>$age</td>
         <td>$pop</td>
         <td>$del</td>
         <td><a href='php/hide_ind.php?id=$id'> remove </a></td>
		</tr>";
}	
echo "</table>";	
?>