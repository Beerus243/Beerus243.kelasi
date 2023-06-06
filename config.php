<?php
// Paramètres de connexion à la base de données
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_NAME', 'kelasi');

// Connexion à la base de données MySQL avec l'extension MySQLi
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Vérification de la connexion
if($link === false){
    die("ERREUR : Impossible de se connecter à la base de données " . mysqli_connect_error());
}
?>