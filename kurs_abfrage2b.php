
<?php

// ---------- connection to database and query as PHP-script ----------

// 1) Execute connection to server (create connection object)
$conn=new PDO("mysql:host=localhost;
			dbname=mykurs21",
			"mykurs21",
			"mKiiS6" );
				
// 2) Prepare query (create query object)
$query=$conn->prepare('select * from Personal
						where firstname=:firstname');

// 3) Execute statement
$query->execute([ 'firstname' => 'Fritz' ]);
// --> produces an associative array

// 4) Get data (row by row)
//$row = $query->fetch();
// --> data gets taken from table and put in form to associative array by php (in commented out because it's now done on step 5b)

// 5) Show data
// var_dump($row);
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

?>