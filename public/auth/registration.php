<?php
require_once __DIR__ . '/../../src/autoloader.php';
require_once __DIR__ . '/../../src/functions.php';

use Database\Database;
use Users\User;
use Users\UsersManager;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"] ?? '';
    $email = $_POST["email"] ?? '';
    $password = $_POST["password"] ?? '';

    $errors = [];

    try {
        $user = new User(null, $username, $email, $password);
    } catch (InvalidArgumentException $e) {
        $errors['form'] = $e->getMessage();
    }

    if (empty($errors)) {
        $usersManager = new UsersManager(new Database());

        if ($usersManager->isUsernameTaken($username)) {
            $errors['username'] = "Ce nom d'utilisateur est déjà utilisé.";
        }

        if ($usersManager->isEmailTaken($email)) {
            $errors['email'] = "Cette adresse e-mail est déjà utilisée.";
        }
    }

    if (empty($errors)) {
        try {
            $usersManager->addUser($user);

            header('Location: ./registration.php?success=1');
            exit;
        } catch (PDOException $e) {
            $errors['form'] = "Une erreur est survenue lors de la création du compte utilisateur.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="fr">

<?php render('head', [
    'title' => "Inscription | PopCorn",
    'description' => "PopCorn - Crée un compte et partage toi aussi ton avis !"
]); ?>

<body>
    <?php render('header', []); ?>

    <main>
        <section class="formCard">
            <h1>Création de compte</h1>

            <?php if (!empty($errors)) { ?>
                <div class="formErrors">
                    <p>Le formulaire contient des erreurs :</p>
                    <ul>
                        <?php foreach ($errors as $error) { ?>
                            <li><?= htmlspecialchars($error) ?></li>
                        <?php } ?>
                    </ul>
                </div>
            <?php } ?>

            <?php if (isset($_GET['success'])) { ?>
                <p class="formSuccess">Ton compte a bien été créé !</p>
            <?php } else { ?>
                <form action="./registration.php" method="POST">
                    <label for="username">Nom d'utilisateur</label>
                    <input type="text" id="username" name="username" value="<?= htmlspecialchars($username ?? ''); ?>" required minlength="<?= User::USERNAME_MIN_LENGTH ?>" maxlength="<?= User::USERNAME_MAX_LENGTH ?>">

                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" value="<?= htmlspecialchars($email ?? ''); ?>" required maxlength="<?= User::EMAIL_MAX_LENGTH ?>">

                    <label for="password">Mot de passe</label>
                    <input type="password" id="password" name="password" required minlength="<?= User::PASSWORD_MIN_LENGTH ?>">

                    <button type="submit">Créer</button>
                </form>
            <?php } ?>
        </section>
    </main>
</body>

</html>
