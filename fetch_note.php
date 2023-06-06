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

    // Récupération des notes de l'élève
    $sql = "SELECT n.note_devoir, n.note_interrogation, n.note_examen, c.nom_cours 
            FROM note n
            INNER JOIN cours c ON n.id_cours = c.id_cours
            WHERE n.id_eleve = $eleveId";
    $result = mysqli_query($db, $sql);

    if ($result) {
        if (mysqli_num_rows($result) > 0) {
            // Affichage des notes dans un tableau
            echo "<table>
                    <tr>
                        <th>Nom du cours</th>
                        <th>Note devoir</th>
                        <th>Note interrogation</th>
                        <th>Note examen</th>
                        <th>Totaux</th>
                    </tr>";

            while ($row = mysqli_fetch_assoc($result)) {
                $nomCours = $row['nom_cours'];
                $noteDevoir = $row['note_devoir'];
                $noteInterro = $row['note_interrogation'];
                $noteExam = $row['note_examen'];
                $Total = $noteDevoir + $noteInterro + $noteExam;

                echo "<tr>
                        <td>$nomCours</td>
                        <td>$noteDevoir</td>
                        <td>$noteInterro</td>
                        <td>$noteExam</td>
                        <td>$Total</td>
                      </tr>";
            }

            echo "</table>";
        } else {
            echo "Aucune note trouvée pour cet élève.";
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