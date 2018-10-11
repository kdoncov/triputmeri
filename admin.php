<?php
session_start();
if($_SESSION['user'] == 'admin'){ //checks if user is logged in
    
}
else {
   header("location:index.php"); //redirects if user is not logged in.
}
?>
<html>
<head>
<?php
        include("includes/head.inc.php");  
    ?>
</head>
<body>
<header>
    <?php
        include("includes/header.inc.php");
    ?>
</header>
<section>
<div class="padd-20">
    <table id="products">
        <tr>
            <th colspan="13"><a href="addNewEntry.php"><u>Dodaj novi proizvod</u></a></th>
        </tr>
        <tr>
            <td>Naziv</td>
            <td>Vrsta proizvoda</td>
            <td>Tip</td>
            <td>Materijal</td>
            <td>Broj delova</td>
            <td>Cena</td>
            <td>Opis</td>
            <td>Sniženo od</td>
            <td>Sniženo do</td>
            <td>Slika</td>
            <td>Izmeni</td>
            <td>Obriši</td>
            <td>Objavljeno</td>
        </tr>

        <?php
        $conn = mysqli_connect("localhost","root","") or die("cannot connect to database");
        $db = mysqli_select_db($conn, "triput_meri") or die("cannot connect to database");
        $result = mysqli_query($conn, "SELECT * FROM product WHERE UserDeleted IS NULL");

        while ($row = mysqli_fetch_array($result)){

            $tempProdId = $row['Id'];
            $sql = mysqli_query($conn, "SELECT * FROM images WHERE ProductId ='$tempProdId'AND IsCover = 1"); 
            $rowId = mysqli_fetch_array($sql);
            $coverImgPath = $rowId['ImagePath'];
            
                if($row['IsPublished']==1){
                    $publish = 'DA';
                } else {
                    $publish = 'NE'; 
                }
                echo    '<tr>
                            <td>'. $row['Name'] . '</td>
                            <td>'. $row['Subcategory'] . '</td>
                            <td>'. $row['TypeId'] . '</td>
                            <td>'. $row['Material'] . '</td>
                            <td>'. $row['NumberOfPeaces'] . '</td>
                            <td>'. $row['Price'] . '</td>
                            <td>'. $row['Description'] . '</td>
                            <td>'. $row['OnSaleFromDate'] . '</td>
                            <td>'. $row['OnSaleToDate'] . '</td>
                            <td><img src='.$coverImgPath.' style="width:80px; height:80px"/></td>
                            <td><a href="editProduct.php?id=' .$row['Id'].'"><u>Edit</u></a></td>
                            <td><a href="#" onclick="myFunction('.$row['Id'].')"><img src="images/drop.png" ></a></td>
                            <td>'. $publish . '</td>
                            </tr>';
        }
    
    ?> 
    </table>
</div>
</section>
<footer>
    <?php   
        include("includes/footer.inc.php");
    ?>
</footer>

<script>
    function myFunction(id)
    {
       var r = confirm("Are you sure you want to delete this record?");
       if(r == true)
       {
          window.location.assign("delete.php?remove=" + id);
       }
    }
</script>
</body>
</html>