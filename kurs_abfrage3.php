
<?php

// ---------- connection to database and query as PHP-script ----------

ini_set("display_errors", 1); // this is just so you can see the error while developing, take it off when it goes for real!


// 1) Execute connection to server (create connection object)
include('conf/config.php');
				
// 2) Prepare query (create query object)
$query=$conn->prepare('select * from personnel'); // query in SQL language

// 3) Execute statement (also object)
$query->execute();

// gives the kind of error in case SQL or connection are not correct

if ( $query->errorCode() > 0 ){
  $fehler=$query->errorInfo();
  echo "$fehler[2]";
  exit;
}

// 4) Get data (row by row)
// $row = $query->fetch();
// Data gets taken from table and put in form to associative array by php

// 5) Show data
//var_dump($row);
// echo '<br><br><br>';

// 5b) extend for better visual

while ($row = $query->fetch()){			// This is an associative array, keys=fieldnames
  $firstname     = $row['firstname']; 
  $lastname      = $row['lastname'];
  $nick          = $row['nick'];
  $email         = $row['email'];
  $salary        = $row['salary'];
  echo "$firstname<br>
        $lastname<br>
        $nick<br>
        $email<br>
        $salary<br><br>";
}    



/*
3)    conf/config.php schützen mit conf/.htaccess:

     deny from all
*/

?>