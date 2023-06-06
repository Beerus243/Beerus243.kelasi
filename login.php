<?php
session_start();
if (isset($_POST['email']) && isset($_POST['password'])) {
    // Connexion à la base de données
    $db_username = 'root';
    $db_password = 'root';
    $db_name = 'kelasi';
    $db_host = 'localhost';
    $db = mysqli_connect($db_host, $db_username, $db_password, $db_name) or die('could not connect to database');

    // Échapper les valeurs des champs de formulaire pour éviter les attaques par injection SQL et XSS
    $email = mysqli_real_escape_string($db, htmlspecialchars($_POST['email']));
    $password = mysqli_real_escape_string($db, htmlspecialchars($_POST['password']));

    if ($email !== "" && $password !== "") {
        $requete = "SELECT count(*) FROM eleve WHERE email = '".$email."' AND mot_de_passe = '".$password."'";
        $exec_requete = mysqli_query($db, $requete);
        $reponse = mysqli_fetch_array($exec_requete);
        $count = $reponse['count(*)'];

        if ($count != 0) {
            // Récupérer les informations de l'élève
            $requete_info = "SELECT * FROM eleve WHERE email = '".$email."'";
            $exec_requete_info = mysqli_query($db, $requete_info);
            $resultat_info = mysqli_fetch_assoc($exec_requete_info);

            // Stocker l'ID de l'élève dans $_SESSION['user_info']
            $_SESSION['user_info']['id_eleve'] = $resultat_info['id_eleve'];

            header('Location: accueil.php');
        } else {
            $error_message = "Email ou mot de passe incorrect.";
            header('Location: index.php?error='.$error_message);
        }
    } else {
        $error_message = "Email ou mot de passe vide.";
        header('Location: index.php?error='.$error_message);
    }

    mysqli_close($db);
} else {
    header('Location: index.php');
}
?>