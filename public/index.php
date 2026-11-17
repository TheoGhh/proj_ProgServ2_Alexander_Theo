<?php

require_once __DIR__ . '/../src/autoloader.php';
require_once __DIR__ . '/../src/functions.php';

use Database\Database;

$database = new Database();
$pdo = $database->getPdo();

$performances = getTopPerformances($pdo);
$lastReviews = getLatestReviews($pdo);

?>

<!DOCTYPE html>
<html lang="fr">

<?php render('head', [
    'title' => "PopCorn | Acting Reviewer",
    'description' => "PopCorn - Notez les performances des acteurs"
]); ?>

<body>
    <?php render('header', []); ?>

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

            <img src="public/images/popcorn-graphic-clipart-design-free-png.webp" alt="popcorn">
        </section>

        <section id="highestRatedPerformances">
            <h2>Les performances les mieux notées</h2>

            <?php foreach ($performances as $performance): ?>
                <article class="performanceCard">
                    <a href="public/performance.php?id=<?= $performance['id_role'] ?>">
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
