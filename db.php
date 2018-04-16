<?php

$offlineHosts = array("127.0.0.1", "localhost", "192.168.1.16", "19.168.1.102");
//check if online or offline then update the settings accordingly
if (in_array($_SERVER['HTTP_HOST'], $offlineHosts)) {

    define("SERVER", "localhost");
    define("USER", "root");
    define("PASS", "root");
    define("DBNAME", "railway");
} //online DB config
else {
    define("SERVER", "localhost");
    define("USER", "");
    define("PASS", "");
    define("DBNAME", "");
}

// Create connection
$conn = new mysqli(SERVER, USER, PASS, DBNAME);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
