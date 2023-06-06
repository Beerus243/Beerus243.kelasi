<?php
session_start();

// Vérifiez si les informations de l'utilisateur sont stockées dans la session
if (isset($_SESSION['user_info']) && isset($_SESSION['user_info']['id_eleve'])) {
    // Récupérez l'ID de l'élève à partir des informations de l'utilisateur
    $eleveId = $_SESSION['user_info']['id_eleve'];

    // Connexion à la base de données
    $db_username = 'root';
    $db_password = 'root';
    $db_name = 'kelasi';
    $db_host = 'localhost';
    $db = mysqli_connect($db_host, $db_username, $db_password, $db_name) or die('could not connect to database');

    // Récupération de la description de l'application de l'élève dans le cours
    $sql = "SELECT description FROM application WHERE id_eleve = $eleveId";
    $result = mysqli_query($db, $sql);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $description = $row['description'];

        // Vérification et affichage de la description
        if ($description !== null) {
            echo $description;
        } else {
            echo "Aucune description d'application trouvée pour cet élève.";
        }
    } else {
        echo "Erreur lors de l'exécution de la requête : " . mysqli_error($db);
    }

    // Fermeture de la connexion à la base de données
    mysqli_close($db);
} else {
    echo "Informations de l'utilisateur non trouvées dans la session.";
}
?>