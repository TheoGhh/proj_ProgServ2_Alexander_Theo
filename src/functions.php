<?php

function render(string $component, array $data = []): void {
    // Le chemin est calculé avant `extract()` afin qu'une valeur de `$data` ne
    // puisse pas écraser la variable `$componentPath`.
    $componentPath = __DIR__ . '/../components/' . $component . '.php';

    // `extract()` transforme les clés du tableau en variables locales à la
    // fonction. `EXTR_SKIP` empêche d'écraser les variables qui existent déjà
    // ici (`$component`, `$data` et `$componentPath`).
    extract($data, EXTR_SKIP);

    // `require` et non `require_once`, afin de pouvoir afficher plusieurs fois
    // le même composant dans une même page.
    require $componentPath;
}

function getTopPerformances(PDO $pdo): array {
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

    return $stmt->fetchAll();
}

function getLatestReviews(PDO $pdo): array {
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

    return $stmt->fetchAll();
}
