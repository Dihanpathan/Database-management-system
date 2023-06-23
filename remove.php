
<?php
    if(isset($_GET['d_id'])) $delete_id=$_GET['d_id'];
        
    try{
        $conn=new PDO("mysql:host=localhost:3306;dbname=doorstep","root","");


        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(PDOException $ex){
    ?>
        <script>
            alert("Database connection error");    
        </script>
    <?php
    }
        
        
    $mysqlquery="delete from service where s_id=$delete_id"; 
    ///echo $mysqlquery;
        
    $conn->exec($mysqlquery);
        
    echo "<script>location.assign('home.php');</script>";    
?>

<?php
        
