<?php

$conn = mysqli_connect("localhost","root","","internship");
$passcode = filter_input(INPUT_POST,"password");
$mail = filter_input(INPUT_POST,"mail");
if (mysqli_connect_errno()) {
    echo "Error: ". mysqli_connect_error();
    exit(1);
}
$query="SELECT password from supervisor where email='$mail';";
$result=mysqli_query($conn,$query);
if (mysqli_num_rows($result)> 0) {
    while ($row=mysqli_fetch_assoc($result)) {
        if ($row["password"] == $passcode) {
        echo "mmmm".$row["password"];
    }
    else {
        echo '<script>
        alert("Wrong password");
        </script>';
        echo '
        <!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <center>
            <form action="config.php" method="post">
                <p class="heading"><u>LOGIN FORM</u></p>
                <div class="email-input">
                    <label for="email">EMAIL  ADDRESS:</label>
                    <input type="text" placeholder="Email" id="email" name="mail" required>
                </div>
                <div class="password-input">
                    <label for="password">PASSWORD:</label>
                    <input type="text" placeholder="password" id="password" required>
                </div>
                <button class="btnlogin">LOGIN</button>
            </form>
        </center>
    </body>
    <style>
        form{
            background-color: rgb(210, 121, 167);
            height: 220px;
            width: 330px;
            margin: 20px;
            text-align: center;
            border: black;
            border-radius: 20px;
            padding: 10px;
            box-shadow:0 0 10px #97d8ea;
            
        }
        form .heading{
            font-size: 17px;
            font-weight: bold;
            font-style: oblique;
        }
        form .email-input input{
            margin-top: 10px;
            width: 270px;
            height: 30px;
            border: none;
            border-radius: 4px;
            position:flex;
            font-size: 17px;
            text-transform: lowercase;
            text-align: left;
            margin-bottom: 10px;
        }
        form .password-input input{
            margin-top: 10px;
            
            width: 270px;
            height: 30px;
            border: none;
            border-radius: 4px;
            position:flex;
            font-size: 17px;
            text-transform: none;
            text-align: left;
        }
        form .btnlogin{
            background-color: rgb(2, 58, 4);
            color: rgb(254, 254, 254);
            margin-top: 10px;
            width: 100px;
            height: 30px;
            border: none;
            font-size: 20px;
            border-radius: 9px;
            text-align: center;
            font-family:Arial Narrow Bold;
        }
        form .email-input label{
            margin-top: 5px;
            font-weight: 100;
        }
        form .password-input label{
            margin-top: 10px;
            padding-top: 20px;
            font-weight: 100;
        }
    </style>
</html>
        ';
    }
}
}
?>