<?php
$host = "localhost:3306";
$dbuser = "root";
$dbpassword = "";
$dbname = "internship";

$btn = $_POST['btnrole'];
try {
    $conn = mysqli_connect($host, $dbuser, $dbpassword,$dbname);
} catch (Exception $th) {
    echo $th->getMessage();
}

if($conn==false){
    echo "Error: ". mysqli_connect_error();
    die("Connect Error (". mysqli_connect_error() .")". mysqli_connect_error());
}
if(isset($btn)){
    $rolename = $_POST["role"];
    if($rolename!=""){
        $sql="INSERT INTO role(rolename) VALUES (?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $rolename);
        $stmt->execute();

        $stmt=null;
        echo "RECORD ADDED";
        
        $conn->close();    
    }
}
?>
<script>alert("Record entered");</script>