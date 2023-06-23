<!DOCTYPE html>

<html>

    <head>
        <meta charset="utf-8">
        <title>Doorstep Diagnostics</title>
        
        <style>
             table{
                width: 100%;
             }
                        
              table, th, td{
                 border: 1px solid blue;
                 border-collapse: collapse;
                 text-align: center;
              }
                
              tr:hover{
                  background-color: bisque;
                        }
             </style>
    </head>
    
    <body>
        
        <br/>
        <h1 style="font-family:verdana;color:blue;text-align: center;">Doorstep Diagnostics</h1>
        <br/>    
        
        <div id="homebody">
                        
            <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Diagnostic Centre</th>
                    <th>Price</th>

                    <th>Update/Delete</th>
                </tr>
            </thead>

                <tbody>
                    <?php

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

                        $mysqlquery="select * from service";

                        $result=$conn->query($mysqlquery); ///$result object
                        ///no of rows, $result->rowCount();

                        ///reading the whole table
                        $table=$result->fetchAll();


                        ////print_r($table);


                        ///processing
                        for($i=0;$i<count($table);$i++){
                            ///$row 1D array
                            $row=$table[$i];
                            ?>

                            <tr>
                                <td><?php echo $row['s_id'] ?></td>
                                <td><?php echo $row['s_name'] ?></td>
                                <td><img src="<?php echo $row['s_img_path'] ?>" width="80" height="80"></td>
                                <td><?php echo $row['s_price'] ?></td>
                            
                                <td><input type="button" value="Update" onclick="updatefn(<?php echo $row['s_id'] ?>);"><input type="button" value="Delete" onclick="deletefn(<?php echo $row['s_id'] ?>);"></td>
                            </tr>

                            <?php
                                }
                            ?>
                        </tbody>
                    </table>
                        
                    </div>
                <br/>
                <a href="add.php">Add Product</a>
                <br/>
                <br/>
                <a href="logout.php">Click to Logout</a>
                
        
                <script>
                    function deletefn(del_prod_id){
                        var choice=confirm("Do you want to delete this?");
                        if(choice){
                            location.assign("remove.php?d_id="+del_prod_id);
                        }
                    }

                    function updatefn(upd_prod_id){
                        location.assign("update.php?u_id="+upd_prod_id);
                    }
                </script>
            </body>
</html>