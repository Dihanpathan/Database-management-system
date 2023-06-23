

<?php
    if(isset($_POST['s_name']) && isset($_POST['s_price'])){
        $newname=$_POST['s_name'];
        $newprice=$_POST['s_price'];
        $myid=$_POST['up_id'];
        
        ///echo $myid;
        
        try{
            $conn=new PDO("mysql:host=localhost:3306;dbname=doorstep","root","");


            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch(PDOException $ex){
            ?>
    <!--                                        outside php -->
            <script>
                alert("Database connection error");    
            </script>
            <?php
        }

        $mysqlquery="update service set s_name='$newname', s_price=$newprice where s_id=$myid";
        
        ///echo $mysqlquery;
        
        $conn->exec($mysqlquery);
        
        echo "<script>location.assign('home.php')</script>";
        
    }
    else{
        ///echo "outside if";
    }
?>
<?php
?>
        
