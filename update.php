


<?php
    if(isset($_GET['u_id'])) $up_id=$_GET['u_id'];
        
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

    $mysqlquery="select * from service where s_id=$up_id";

    $result=$conn->query($mysqlquery); ///$result object
    ///no of rows, $result->rowCount();
        
    if($result->rowCount()==1){
        ///reading the whole table
        $table=$result->fetchAll();
        
        $row=$table[0];
        
        ?>
        

        <form action="updatedata.php" method="post">
            Product Name: <input type="text" id="s_name" name="s_name" value="<?php echo $row['s_name'] ?>"> 
            <br/>
            Product Price: <input type="text" id="s_price" name="s_price" value="<?php echo $row['s_price'] ?>"> 
            <br/>
            
            <input type="hidden" name="up_id" value="<?php echo $row['s_id']; ?>" >
            
            <input type="submit" value="Update Data">
        </form>
<?php
        
    }    
?>



