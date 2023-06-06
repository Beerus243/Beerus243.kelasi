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

    // Calcul du pourcentage de l'élève
    $sql = "SELECT SUM(pourcentage) AS total_pourcentage
            FROM pourcentage
            WHERE eleve_id = $eleveId";
    $result = mysqli_query($db, $sql);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $totalPourcentage = $row['total_pourcentage'];

        // Vérification et affichage du pourcentage
        if ($totalPourcentage !== null) {
            $pourcentage = $totalPourcentage / 100;
            echo "Pourcentage obtenu : " . ($pourcentage * 100) . "%";
        } else {
            echo "Aucun pourcentage trouvé pour cet élève.";
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