<?php

//° ---------- connection to database and query as PHP-script ----------

ini_set("display_errors", 1); // this is just so you can see the error while developing, take it off when it goes for real!


//* 1) Execute CONNECTION to database server (create connection object)
include('conf/config.php');
            
//+ 2) Attempt to CREATE a TABLE query execution

//+ 3) Prepare QUERY (create query object)
$query = $conn->prepare('select * from personnel'); // query in SQL language

//+ 3a) Execute statement (also object)
$query->execute();

// gives the kind of error in case SQL or connection are not correct
if ($query->errorCode() > 0) {
    $fehler = $query->errorInfo();
    echo "$fehler[2]";
    exit;
}

//+ 3bi) Get data (row by row)
// $row = $query->fetch();
// Data gets taken from table and put in form to associative array by php

//+ 3bii) Show data
//var_dump($row);
// echo '<br><br><br>';

//+ 3c) extend for better visual

while ($row = $query->fetch()) {			// This is an associative array, keys=fieldnames
    $firstname = $row['firstname'];
    $lastname = $row['lastname'];
    $nick = $row['nick'];
    $email = $row['email'];
    $salary = $row['salary'];
    echo "$firstname<br>
        $lastname<br>
        $nick<br>
        $email<br>
        $salary<br><br>";
}

?>