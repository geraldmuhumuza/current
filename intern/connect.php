<?php
$supervisorname=filter_input(INPUT_POST,"supervisor-name");
$email=filter_input(INPUT_POST,"email");
$telephone=filter_input(INPUT_POST,"telephone");
$password=filter_input(INPUT_POST,"password");
$confirm=filter_input(INPUT_POST,"confirm");
$institution = 1;

if($confirm==$password){
    $host ="localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "internship";
    
    $conn = mysqli_connect($host, $dbuser, $dbpassword, $dbname);
    if(mysqli_connect_error()) {

        die("Connect Error (". mysqli_connect_error() .")". mysqli_connect_error());
    }
    else {
        $sql="INSERT INTO supervisor (supervisor_name,email,telephone,password,institution_institution_id) VALUES
        (?,?,?,?,?);";
        $stmt=$conn->prepare($sql);
        $stmt->bind_param("ssssi", $supervisorname,$email,$telephone,$password,$institution) ;
        
        $stmt->execute() ;
        
        echo "record inserted";
        $stmt->close();
    

    
        $conn->close();
    }
}
else
{
    echo "Confirm password should be matching with the password";
    die();
}
?>