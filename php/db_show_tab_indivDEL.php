<!DOCTYPE html>
<html>

    <?php
        //* connection to DB   
        include('conf/config.php');
        $php_self = $_SERVER['PHP_SELF']; //This is the filename of the currently executing script, relative to the document root providing path information.

        //? message for restored record
        if ($_GET['res_id']){
            $rid=$_GET['res_id'];
            $sql_indiv = "SELECT * FROM individual WHERE id=:res_id";
            $select_indiv = $conn->prepare($sql_indiv);
            $select_indiv->execute(['res_id' => $rid]);
            $indiv = $select_indiv->fetch();
            $id = $indiv['id'];
            $name = $indiv['name'];

            $restore = "UPDATE individual SET deleted = 0 WHERE id=:id";
            $restore_indiv = $conn->prepare($restore);
            $restore_indiv->execute(['id' => $rid]);
            echo "<em>$name (ID $id) has been restored.</em><br><br>";
        }        

        //* Show all records
        // Define & Execute query, fetch data from DB for all table rows
        $sql = 'SELECT individual.id, individual.name as iname, individual.sex, individual.birthyear, individual.age, population.name as pname, individual.deleted
            FROM individual
            LEFT JOIN population ON individual.id_population = population.id 
            WHERE individual.deleted=1
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
        echo "Extract of <strong>removed</strong> records in the individuals table: <br>";  
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
                <td>
                    <a href='$php_self?res_id=$id> restore</a> 
                </td>
                </tr>";
        }	
        echo "</table><br>";	
    ?>

</html>