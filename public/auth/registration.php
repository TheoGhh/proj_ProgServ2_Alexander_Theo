<?php
require_once __DIR__ . '/../../src/functions.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    $errors = [];
}
?>

<!DOCTYPE html>
<html lang="fr">

<?php render('head', [
    'title' => "Sign in | PopCorn",
    'description' => "PopCorn - Crée un compte et partage toi aussi ton avis !"
]); ?>

<body>
    <?php render('header', []); ?>

    <main>
        <form action="./registration.php" method="POST">
            <label for="username">Nom d'utilisateur</label>
            <input type="text" id="username" name="username" value="<?= htmlspecialchars($username ?? ''); ?>" required minlength="3" maxlength="30">

            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" value="<?= htmlspecialchars($email ?? ''); ?>" required maxlength="120">

            <label for="password">Mot de passe</label>
            <input type="password" id="password" name="password" required minlength="8">

            <button type="submit">Créer</button>
        </form>
    </main>
</body>

</html>
