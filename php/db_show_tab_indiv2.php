<!DOCTYPE html>
<html>

    <?php
        //* connection to DB
        include('conf/config.php');
        $php_self = $_SERVER['PHP_SELF']; //This is the filename of the currently executing script, relative to the document root providing path information.

        //? message for removed record
        if ($_GET['del_id']){
            $did=$_GET['del_id'];
            $sql_indiv = "SELECT * FROM individual WHERE id=:del_id";
            $select_indiv = $conn->prepare($sql_indiv);
            $select_indiv->execute(['del_id' => $did]);
            $indiv = $select_indiv->fetch();
            $id = $indiv['id'];
            $name = $indiv['name'];

            $remove = "UPDATE individual SET deleted = 1 WHERE id=:id";
            $remove_indiv = $conn->prepare($remove);
            $remove_indiv->execute(['id' => $did]);
            echo "<em>$name (ID $id) has been removed!</em><br><br>";
        }

        //* Show all records
        // Define & Execute query, fetch data from DB for all table rows
        $sql = 'SELECT individual.id, individual.name as iname, individual.sex, individual.birthyear, individual.age, population.name as pname, individual.deleted
                FROM individual
                LEFT JOIN population ON individual.id_population = population.id 
                WHERE individual.deleted=0
                LIMIT 15';
        $query = $conn->prepare($sql);
        $query->execute();

        //Error message MySQL 
        if ( $query->errorCode() > 0 ){
            $fehler=$query->errorInfo();
            echo "$fehler[2]";
            exit;
        }


        //* Heading of table, plot data
        echo "$did <br> $name<br>$php_self<br>'$php_self?id=$id'<br><br>";
        echo "Extract of individuals table: <br>";
        echo "<table border='1'>	
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Year of birth</th>
                <th>Age</th>
                <th>Population</th>
                <th>Deleted</th>
                <th>Edit</th>
            </tr>";

        while($row=$query->fetch()){
        $id		= $row['id'];
        $name     = $row['iname'];
        $sex      = $row['sex'];
        $year     = $row['birthyear'];
        $age      = date("Y") - $year;
        $pop      = $row['pname'];
        $del      = $row['deleted'];
        echo "<tr>
                <td>$id</td>
                <td>$name</td>
                <td>$sex</td>
                <td>$year</td>
                <td>$age</td>
                <td>$pop</td>
                <td>$del</td>
                <td>
                    <a href='$php_self?del_id=$id'> remove </a>
                </td>
                </tr>";
        }	
        echo "</table><br>";	
    ?>

</html>