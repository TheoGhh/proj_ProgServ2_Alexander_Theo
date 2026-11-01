<?php

require_once __DIR__ . '/../src/autoloader.php';

$database = new Database();
$pdo = $database->getPdo();

$sql = "SELECT 
            roles.id as id_role,
            acteurs.nom as acteur,
            acteurs.photo,
            oeuvres.titre,
            roles.personnage,
            ROUND(AVG(critiques.note), 1) AS score
        FROM critiques
        JOIN roles   ON critiques.id_role = roles.id
        JOIN acteurs ON roles.id_acteur   = acteurs.id
        JOIN oeuvres ON roles.id_oeuvre   = oeuvres.id
        GROUP BY roles.id, acteurs.nom, acteurs.photo, oeuvres.titre, roles.personnage
        ORDER BY score DESC
        LIMIT 4";

$stmt = $pdo->prepare($sql);

$stmt->execute();

$performances = $stmt->fetchAll();


$sql = "SELECT
            critiques.id as id_critique,
            utilisateurs.photo_utilisateur,
            utilisateurs.nom_utilisateur as utilisateur,
            critiques.date_creation,
            acteurs.nom,
            roles.personnage,
            oeuvres.titre,
            critiques.note,
            critiques.commentaire
        FROM critiques
        JOIN utilisateurs ON critiques.id_utilisateur = utilisateurs.id
        JOIN roles        ON critiques.id_role        = roles.id
        JOIN acteurs      ON roles.id_acteur          = acteurs.id
        JOIN oeuvres      ON roles.id_oeuvre          = oeuvres.id
        ORDER BY critiques.date_creation DESC
        LIMIT 6";

$stmt = $pdo->prepare($sql);

$stmt->execute();

$lastReviews = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PopCorn : Acting Reviewer</title>
</head>

<body>
    <header>
        <h1>PopCorn</h1>
        <nav>
            <ul>
                <li><a href="./actorsCatalog.php">Acteurs</a></li>
                <li><a href="./filmsSeriesCatalog.php">Films & séries</a></li>
            </ul>
        </nav>

        <div class="connectionSection">
            <ul>
                <li><a href="./login.php">Connexion</a></li>
                <li><a href="./registration.php">S'inscrire</a></li>
            </ul>
        </div>
    </header>

    <main>
        <section id="introduction">
            <div class="left">
                <p id="hook">Critique de performance d'acteurs</p>
                <h2>
                    On ne note pas les films.<br>
                    On note ceux qui les jouent.
                </h2>
                <p>
                    Brad Pitt était-il meilleur dans Fight Club ou dans Troie ?
                    Distribue tes pop-corns à chaque rôle et compare les
                    performances d'un acteur d'un film ou d'une série à l'autre.
                </p>
                <search>
                    <form action="" method="get">
                        <label for="searchBar">Rechercher un acteur ou une oeuvre</label>
                        <input type="search" id="searchBar" name="searchBar">
                        <button type="submit">Rechercher</button>
                    </form>
                </search>
            </div>

            <img src="./../img/popcorn-graphic-clipart-design-free-png.webp" alt="popcorn">
        </section>

        <section id="highestRatedPerformances">
            <h2>Les performances les mieux notées</h2>

            <?php foreach ($performances as $performance): ?>
                <article class="performanceCard">
                    <a href="./performance.php?id=<?= $performance['id_role'] ?>">
                        <img
                            src="<?= htmlspecialchars($performance['photo']) ?>"
                            alt="Photo de <?= htmlspecialchars($performance['acteur']) ?>">

                        <h3><?= htmlspecialchars($performance['acteur']) ?></h3>

                        <p><?= htmlspecialchars($performance['titre']) ?> - <?= htmlspecialchars($performance['personnage']) ?></p>

                        <p><span><?= $performance['score'] ?></span>popScore</p>
                    </a>
                </article>
            <?php endforeach; ?>

        </section>

        <section id="lastReviews">
            <h2>Dernières critiques</h2>

            <?php foreach ($lastReviews as $review): ?>
                <article class="reviewCard">
                    <header class="reviewHeader">
                        <?php if (!empty($review['photo_utilisateur'])): ?>
                            <img
                                class="avatar"
                                src="<?= htmlspecialchars($review['photo_utilisateur']) ?>"
                                alt="">
                        <?php else: ?>
                            <span class="avatar" aria-hidden="true">
                                <?= htmlspecialchars(mb_strtoupper((mb_substr($review['utilisateur'], 0, 1)))) ?>
                            </span>
                        <?php endif; ?>

                        <div>
                            <p class="reviewAuthor"><?= htmlspecialchars($review['utilisateur']) ?></p>
                            <time datetime=""></time>
                        </div>
                    </header>


                </article>
            <?php endforeach; ?>
        </section>
    </main>

    <footer></footer>

</body>

</html>
