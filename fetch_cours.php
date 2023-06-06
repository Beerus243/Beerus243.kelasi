<?php
session_start();
if(isset($_SESSION['user_info'])){
  $ideleve = $_SESSION['user_info'];
} else {
  echo "Erreur : ID de l'élève non trouvé dans la session.";
  exit;
}

// Connexion à la base de données
$host = 'localhost';
$dbname = 'kelasi';
$username = 'root';
$password = 'root';

try {
  $bddPDO = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
  $bddPDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  echo "Erreur de connexion à la base de données : " . $e->getMessage();
  exit;
}

// Requête pour récupérer les cours du jour avec les noms des enseignants
$dateCours = date('Y-m-d'); // Date du jour
$requete = "SELECT c.nom_cours, c.horaire_debut, c.horaire_fin, e.nom_ens
            FROM cours c
            INNER JOIN enseignant e ON c.id_enseignant = e.id_enseignant
            WHERE c.date_cours = :datecours";
$resultat = $bddPDO->prepare($requete);
$resultat->bindParam(':datecours', $dateCours);
$resultat->execute();

// Vérifier si la requête a réussi
if (!$resultat) {
  echo "Erreur lors de la récupération des cours du jour.";
  exit;
}

// Créer le tableau HTML avec les données des cours
$tableHTML = "<table>";
$tableHTML .= "<tr><th>Titre</th><th>Heure de début</th><th>Heure de fin</th><th>Enseignant</th></tr>";

while ($row = $resultat->fetch(PDO::FETCH_ASSOC)) {
  $titre = $row['nom_cours'];
  $heureDebut = $row['horaire_debut'];
  $heureFin = $row['horaire_fin'];
  $enseignant = $row['nom_ens'];

  $tableHTML .= "<tr>";
  $tableHTML .= "<td>$titre</td>";
  $tableHTML .= "<td>$heureDebut</td>";
  $tableHTML .= "<td>$heureFin</td>";
  $tableHTML .= "<td>$enseignant</td>";
  $tableHTML .= "</tr>";
}

$tableHTML .= "</table>";

// Afficher le tableau HTML des cours du jour
echo $tableHTML;
?>