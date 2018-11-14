
<?php

// ---------- connection to database and query as PHP-script ----------


// 1) Execute connection to server (create connection object)
$conn=new PDO("mysql:host=localhost;
			dbname=mykurs21",
			"mykurs21",
			"mKiiS6" );
				
// 2) Prepare query (create query object)
$query=$conn->prepare('select * from personnel'); // query in SQL language

// 3) Execute statement (also object)
$query->execute();

// 4) Get data (row by row)
$row = $query->fetch();
// Data gets taken from table and put in form to associative array by php

// 5) Show data
var_dump($row);

// 5b) extend for better visual
echo '<br><br><br>';

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

?>