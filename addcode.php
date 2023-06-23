<?php


    if(isset($_GET['uid']) && $_GET['uname'] && $_GET['ufile'] && isset($_GET['uprice'])){
       
        $k=$_GET['uid'];
        $i=$_GET['uname'];
        $l=$_GET['ufile'];
        $s='images/';
        $st=$s.$l;
        $j=$_GET['uprice'];
        
        try{
            ///try to connect with database
            $conn=new PDO("mysql:host=localhost:3306;dbname=doorstep", "root", "");
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch(PDOException $ex){
            
            echo "<script>location.assign('add.php');</script>";
        }
        
        ///if database connection is ok
            $mysqlcode="INSERT INTO service VALUES($k,'$i','$st',$j)";
            
            try{
                $conn->exec($mysqlcode);
            
                echo "<script>location.assign('home.php');</script>";
            }
            catch(PDOException $ex){
                echo "<script>location.assign('add.php');</script>";
            }
            
            
        }
    
?>