<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="login.css">
  </head>
  <body>
    <div class="logo">
      <img src="logo_kelasi.png" alt="Logo KELASI" width="170" height="60">
    </div>
    <div class="login-container">
      <form method="POST"  action="login.php">
        <h1><img src="logo_accueil.png" alt="Logo KELASI" width="170" height="60"></h1>
        <?php
          if (isset($_GET['error']) && !empty($_GET['error'])) {
            $error_message = $_GET['error'];
            echo '<p class="error_message">' . $error_message . '</p>';
          }
        ?>
        <input type="email" name="email" placeholder="Adresse email" required>
        <input type="password" name="password" placeholder="Mot de passe" required>
        <button type="submit" value="Valider" name="boutton-valider">Se connecter</button>
      </form>
    </div>
  </body>
</html>
