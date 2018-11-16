<?php

//°° ---------- connection to database and query as PHP-script ----------

//_ this is just so you are allowed to see the error print while developing, take it off when it goes for real!
ini_set("display_errors", 1); 

//? 1) CONNECTION: Execute connection to database server (create connection object)
include('conf/config.php');

//? 2) CREATE TABLE: create table
        

//* 3) QUERY: Prepare query (create query object)
$query = $conn->prepare('select sampleID, "col.iris", kind, age, sex from samples where sampleID like "AZ%" order by sampleID asc'); // query in SQL language


//* 3) Execute statement (also object)
$query->execute();

//_ Check conection: gives the kind of error in case SQL or connection are not correct

if ($query->errorCode() > 0) {
  $fehler = $query->errorInfo();
  echo "$fehler[2]";
  exit;
}


//* 3a) GET & SHOW short: Get data (row by row)
// $row = $query->fetch();
// Data gets taken from table and put in form to associative array by php

//*  GET & SHOW short: Show data in a line
// var_dump($row);

// echo '<br><br><br>';


//* 3b)  GET & SHOW extended: for better overview
while ($row = $query->fetch()) {			// This is an associative array, keys=fieldnames
  $sampleid = $row['sampleID'];
  $colony = $row['col.iris'];
  $kind = $row['kind'];
  $age = $row['age'];
  $sex = $row['sex'];
  echo "$sampleid<br>
        $colony<br>
        $kind<br>
        $age<br>
        $sex<br><br>";
}

?>



<!-- You need to have also this file to deny access to security folder "conf" and protect "config.php" containing the password and username

Nested in:
conf/.htaccess:

Contains only one line of code:
deny from all

-->