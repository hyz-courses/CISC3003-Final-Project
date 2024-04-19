<?php
include ('config-db.php');

// Get user ID and password
$u_name = $_POST['u_name'];
$u_pwd = $_POST['u_pwd'];

// Initialize Connection.
$conn = initConnection($host, $username, $password, $dbname);

// Hashing user input password for validation.
$u_pwd_hash = hash("sha256", $u_pwd);


// Prepare SQL statement
$sql = '
    SELECT u_pwd FROM qa_user WHERE u_name = ?;
';

$stmt = mysqli_stmt_init($conn);
if (!mysqli_stmt_prepare($stmt, $sql)) {
    die('wrong');
}

// bind variables
mysqli_stmt_bind_param($stmt, 's', $u_name);

// execute the query.
mysqli_stmt_execute($stmt);

// bind result to variable $db_u_pwd
mysqli_stmt_bind_result($stmt, $db_u_pwd_hash);

// fetch result
if (mysqli_stmt_fetch($stmt) && $db_u_pwd_hash == $u_pwd_hash) {
    echo "Password: " . $u_pwd . "<br>";
    echo "Login Success!!!";
} else {
    echo "Login Failed <br>";
    echo "Password Inputted: " . $u_pwd . "<br>";
    echo "Password Hash: " . $u_pwd_hash . "<br>";
    echo "Password Hash from DB: " . $db_u_pwd_hash . "<br>";
}

mysqli_stmt_close($stmt);
mysqli_close($conn);