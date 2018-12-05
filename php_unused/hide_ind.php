<?php
// makes connection to DB
include('../conf/config.php');

// defines query: assigns $variable to values of column "id" & says SQL instruction ($id becomes :id)
$id=$_GET['id'];

$sql="  UPDATE individual
        SET     deleted = 1
		WHERE id=:id";
		
// prepare and execute query
$query=$conn->prepare($sql);
$query->execute(['id' => $id]);

// output on webpage
echo "The record has been removed <br>";
?>

<a href='../individuals.php'>back</a>