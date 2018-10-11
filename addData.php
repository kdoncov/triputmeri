<?php
session_start();

    if($_SERVER['REQUEST_METHOD'] == 'POST'){

        $conn = mysqli_connect("localhost","root","") or die("cannot connect to database");
        $db = mysqli_select_db($conn, "triput_meri") or die("cannot connect to database");
        
        $add_name = mysqli_real_escape_string($conn, $_POST['name']);
        $add_type_id = mysqli_real_escape_string($conn, $_POST['type_id']);
        $add_price = mysqli_real_escape_string($conn, $_POST['price']);
        $add_desc = mysqli_real_escape_string($conn, $_POST['description']);
        $add_on_sale_from = mysqli_real_escape_string($conn, $_POST['on_sale_from']);
        $add_on_sale_to = mysqli_real_escape_string($conn, $_POST['on_sale_to']);
        $add_material = mysqli_real_escape_string($conn, $_POST['material']);
        //$add_category = mysqli_real_escape_string($conn, $_POST['category']);
        $add_subcat = mysqli_real_escape_string($conn, $_POST['subcategory']);
        if(isset($_POST['numb_of_peaces'])){
            $add_numb_of_peaces = $_POST['numb_of_peaces'];
        } else {$add_numb_of_peaces = '';}
        $current_date = date('Y/m/d');
        if(isset($_POST['published'])){
            $publish = 1;
            $published_on = date('Y/m/d H:i:s');
        } else {
            $publish = null;
            $published_on = null;

        }
        

            $sql1 = mysqli_query($conn, "SELECT * FROM product_type WHERE Type = '$add_subcat'");
            $row1 = mysqli_fetch_array($sql1);
            $result = $row1['ParentId'];

            $sql2 = mysqli_query($conn, "SELECT * FROM product_type WHERE Id = '$result'");
            $row2 = mysqli_fetch_array($sql2);
            $add_category = $row2['Type'];
            
                    

         
        $query =    "INSERT INTO product (Name, TypeId, Price, Description, OnSaleFromDate, OnSaleToDate, Material, Category, Subcategory, NumberOfPeaces, CreatedOn, PublishedOn, IsPublished) 
                    VALUES ('$add_name', '$add_type_id', '$add_price', '$add_desc', '$add_on_sale_from', '$add_on_sale_to', '$add_material', '$add_category', '$add_subcat', '$add_numb_of_peaces', '$current_date', '$published_on', '$publish')";
                    mysqli_query($conn, $query); //SQL query
                    $last_id = mysqli_insert_id($conn);
                    //echo "<script>alert('Succesfully updated!');</script>";
                   echo '<script>location.assign("editProduct.php?id='.$last_id.'");</script>';
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
    
     
    

           
            
?>