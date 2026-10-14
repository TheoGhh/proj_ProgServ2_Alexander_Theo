# Cahier des charges fonctionnel — PopCorn

## 1. Présentation du projet

### 1.1. Contexte

Jeu d'acteur est une application web permettant aux utilisateurs d'évaluer les performances des acteurs dans des œuvres cinématographiques et télévisuelles.

Contrairement aux plateformes comme Letterboxd, IMDb ou Rotten Tomatoes, qui proposent notamment d'évaluer des films ou des séries dans leur ensemble, Jeu d'acteur se concentre sur l'interprétation d'un acteur dans un rôle précis.

Par exemple, un utilisateur ne note pas *Fight Club* dans son ensemble, mais la performance de Brad Pitt dans le rôle de Tyler Durden.

Chaque performance correspond donc à l'association d'un acteur, d'une œuvre et d'un personnage interprété. Les utilisateurs peuvent lui attribuer une note et publier un commentaire facultatif.

### 1.2. Objectifs

L'application a pour objectifs de :

- Permettre aux utilisateurs de consulter les acteurs, les œuvres et leurs distributions.
- Évaluer les performances individuelles des acteurs grâce à un système de notation sur 5 étoiles.
- Permettre la publication, la modification et la suppression de critiques.
- Calculer et afficher les notes moyennes des performances.
- Proposer des classements fondés sur les évaluations des utilisateurs.
- Permettre la recherche d'acteurs et d'œuvres.
- Fournir un espace d'administration pour gérer les données et modérer les contenus.
- Garantir la sécurité des comptes et la cohérence des données enregistrées.

### 1.3. Public cible

Le site s'adresse aux amateurs de cinéma et de séries, aux personnes souhaitant partager leur avis sur les performances des acteurs et aux utilisateurs désirant découvrir des interprétations appréciées par la communauté.

### 1.4. Définitions

Les termes suivants sont utilisés dans l'ensemble du document :

- **Acteur :** personne interprétant un ou plusieurs personnages dans une œuvre.
- **Œuvre :** film ou série enregistré dans la base de données.
- **Performance :** association d'un acteur, d'une œuvre et d'un personnage interprété.
- **Critique :** évaluation publiée par un membre, comprenant obligatoirement une note et éventuellement un commentaire.
- **Membre :** utilisateur disposant d'un compte sur le site.
- **Administrateur :** utilisateur disposant de droits supplémentaires pour gérer les données et modérer les contenus.
- **Favori :** performance enregistrée par un membre dans sa liste personnelle.

### 1.5. Priorités des fonctionnalités

Les fonctionnalités sont réparties selon trois niveaux de priorité :

- **P1 — Essentielle :** fonctionnalité indispensable à la première version utilisable du site.
- **P2 — Importante :** fonctionnalité à développer après la mise en place du socle principal.
- **P3 — Complémentaire :** fonctionnalité pouvant être développée dans une phase ultérieure.

---

# 2. Fonctionnalités attendues

## A. Gestion des comptes

### A1 — Inscription (P1)

Le système doit permettre à un visiteur de créer un compte à l'aide d'un pseudo, d'une adresse e-mail et d'un mot de passe.

Les règles suivantes doivent être respectées :

- Le pseudo doit contenir entre 3 et 30 caractères.
- Le pseudo doit être unique. La comparaison ne doit pas distinguer les majuscules des minuscules.
- L'adresse e-mail doit respecter un format valide et être unique, sans distinction entre majuscules et minuscules.
- Le mot de passe doit contenir au minimum 8 caractères.
- Le mot de passe ne doit jamais être stocké en clair.
- Les champs obligatoires doivent être renseignés.

Si une donnée est invalide ou déjà utilisée, le compte ne doit pas être créé. Un message explicite doit indiquer la cause du refus.

Après une inscription réussie, le système doit confirmer la création du compte et permettre au membre de se connecter.

### A2 — Connexion et déconnexion (P1)

Le système doit permettre à un membre de se connecter à l'aide de son adresse e-mail et de son mot de passe.

En cas de connexion réussie, une session authentifiée doit être créée et les fonctionnalités réservées aux membres doivent devenir accessibles.

En cas d'échec, le système doit afficher un message générique, par exemple : « Adresse e-mail ou mot de passe incorrect. » Le message ne doit pas permettre de déterminer si l'adresse e-mail existe.

Un compte désactivé ne doit pas pouvoir se connecter.

La déconnexion doit invalider la session et empêcher tout nouvel accès aux fonctionnalités nécessitant une authentification. Les opérations protégées doivent également être refusées côté serveur lorsqu'elles sont effectuées sans session valide.

### A3 — Profil du membre (P1)

Chaque membre connecté doit pouvoir consulter sa page de profil.

Cette page doit afficher :

- Le pseudo du membre.
- La liste de ses critiques.
- Un accès à la modification de son profil.
- Un accès à la gestion de ses favoris.
- Un accès à la suppression de son compte.

Chaque critique doit afficher :

- Le nom et le prénom de l'acteur, lorsque le prénom est renseigné.
- Le titre de l'œuvre.
- Le nom du personnage interprété.
- La note attribuée sur 5.
- Le commentaire, s'il existe.
- La date de publication.
- La date de dernière modification, si la critique a été modifiée.

Les critiques doivent être triées par date de publication décroissante. En cas d'égalité, l'identifiant de la critique le plus élevé apparaît en premier.

Chaque critique doit permettre d'accéder à la page de la performance correspondante. Le membre doit également pouvoir accéder aux fonctions de modification et de suppression de ses propres critiques.

Si le membre n'a publié aucune critique, un message explicite doit l'indiquer.

### A4 — Modification du profil (P2)

Un membre connecté doit pouvoir modifier son pseudo, son adresse e-mail et son mot de passe.

Le système doit demander le mot de passe actuel avant toute modification.

Les nouvelles valeurs doivent respecter les règles définies dans A1. Un pseudo ou une adresse e-mail déjà utilisé par un autre membre doit être refusé.

En cas de modification du mot de passe, le nouveau mot de passe doit respecter la longueur minimale de 8 caractères.

La modification doit être enregistrée uniquement si toutes les validations sont réussies. En cas d'erreur, les données existantes doivent être conservées.

Un message doit confirmer la réussite de l'opération ou indiquer la cause de l'échec.

### A5 — Réinitialisation du mot de passe par e-mail (P3)

Un visiteur doit pouvoir demander la réinitialisation de son mot de passe en saisissant son adresse e-mail.

Le système doit afficher le même message, que l'adresse soit associée à un compte ou non, afin de ne pas révéler l'existence d'un compte.

Si un compte correspondant existe, un lien de réinitialisation doit être envoyé par e-mail.

Le lien doit être associé à un jeton aléatoire sécurisé et à usage unique. Le jeton doit devenir inutilisable après sa première utilisation ou après l'émission d'une nouvelle demande.

Conformément au périmètre du projet, aucune durée d'expiration n'est imposée. Dans une mise en production, une expiration limitée devra être envisagée pour renforcer la sécurité.

Le nouveau mot de passe doit comporter au moins 8 caractères. Après une réinitialisation réussie, le système doit confirmer l'opération.

### A6 — Suppression du compte (P3)

Un membre connecté doit pouvoir demander la suppression de son compte après confirmation de son mot de passe.

Une confirmation explicite doit être demandée avant la suppression définitive.

Après validation, le système doit :

- Supprimer les données personnelles du compte.
- Supprimer les favoris associés au membre.
- Anonymiser l'auteur des critiques conservées, afin de préserver les évaluations et les commentaires utiles au fonctionnement du site.
- Supprimer les signalements dont le membre est l'auteur ou anonymiser les données personnelles correspondantes selon les règles de conservation définies.
- Invalider les sessions du compte.

Les critiques conservées ne doivent plus permettre d'identifier le membre supprimé.

La suppression doit être définitive et empêcher toute nouvelle connexion avec les identifiants du compte supprimé.

Un message doit confirmer la réussite ou signaler l'échec de l'opération.

---

## B. Consultation

### B1 — Page d'accueil (P1)

La page d'accueil doit présenter deux sections principales :

**Section 1 — Critiques récentes**

Le système doit afficher les 10 critiques les plus récemment publiées, triées par date de publication décroissante. En cas d'égalité, l'identifiant de la critique le plus élevé apparaît en premier.

Chaque élément doit présenter :

- L'acteur.
- L'œuvre.
- Le personnage interprété.
- La note attribuée.
- Le commentaire, s'il existe.
- Le pseudo de l'auteur, lorsque celui-ci dispose encore d'un compte identifiable.
- La date de publication.

Chaque élément doit permettre d'accéder à la page de la performance correspondante.

**Section 2 — Performances les mieux notées**

Le système doit afficher les 10 performances ayant les meilleures notes moyennes parmi toutes les performances disposant d'au moins une critique.

Le classement doit utiliser les critères suivants :

1. Moyenne non arrondie décroissante.
2. Nombre de critiques décroissant en cas d'égalité exacte de moyenne.
3. Identifiant de la performance croissant si les deux premiers critères sont identiques.

Aucun nombre minimal de critiques supérieur à une seule critique ne doit être imposé.

Chaque élément doit présenter l'acteur, l'œuvre, le personnage, la moyenne sur 5 affichée avec deux décimales et le nombre total de critiques.

Chaque élément doit permettre d'accéder à la page de la performance.

### B2 — Liste des acteurs (P1)

Le site doit afficher la liste de tous les acteurs enregistrés dans la base de données.

Chaque entrée doit présenter :

- Le nom de l'acteur.
- Le prénom, lorsqu'il est disponible.
- La photo, lorsqu'elle est disponible.

Les acteurs doivent être triés par ordre alphabétique du nom, puis du prénom. Le tri ne doit pas distinguer les majuscules des minuscules.

Si plusieurs acteurs possèdent le même nom et le même prénom, un identifiant stable doit permettre de conserver un ordre déterministe.

Chaque entrée doit permettre d'accéder à la page détaillée de l'acteur.

Si aucune fiche d'acteur n'est enregistrée, un message doit l'indiquer.

### B3 — Page d'un acteur (P1)

La page d'un acteur doit afficher :

- Son nom.
- Son prénom, lorsqu'il est disponible.
- Sa photo, lorsqu'elle est disponible.
- Sa date de naissance, lorsqu'elle est disponible.
- Sa biographie, lorsqu'elle est disponible.

La page doit également présenter sa filmographie, c'est-à-dire l'ensemble des performances associées à cet acteur.

Pour chaque performance, les informations suivantes doivent être affichées :

- Le titre de l'œuvre.
- L'année de sortie, lorsqu'elle est connue.
- Le nom du personnage interprété.
- La note moyenne sur 5, affichée avec deux décimales lorsqu'au moins une critique existe.
- Le nombre total de critiques.

Lorsqu'une performance ne possède aucune critique, la moyenne doit être remplacée par la mention « Aucune note » et le nombre de critiques doit être affiché à 0.

Chaque performance doit permettre d'accéder à sa page détaillée et à la page de l'œuvre correspondante.

Par défaut, les performances sont triées par année de sortie décroissante. Les œuvres dont l'année est inconnue apparaissent à la fin. En cas d'égalité, les titres sont triés par ordre alphabétique.

### B4 — Liste des œuvres (P1)

Le site doit afficher toutes les œuvres enregistrées dans la base de données.

Chaque entrée doit présenter :

- Le titre de l'œuvre.
- Le type : film ou série.
- L'année de sortie, lorsqu'elle est connue.

Un filtre doit permettre de choisir entre les options suivantes :

- Toutes les œuvres.
- Films uniquement.
- Séries uniquement.

Par défaut, toutes les œuvres sont affichées et triées par titre dans l'ordre alphabétique, sans distinction entre majuscules et minuscules.

En cas de titres identiques, un ordre secondaire stable doit être appliqué.

Chaque œuvre doit disposer d'un lien vers sa page détaillée.

Si aucun résultat ne correspond au filtre sélectionné, un message explicite doit être affiché.

### B5 — Page d'une œuvre (P1)

Chaque œuvre doit disposer d'une page présentant :

- Son titre.
- Son type : film ou série.
- Son année de sortie, lorsqu'elle est connue.
- Sa description, lorsqu'elle est disponible.
- Son casting.

Pour chaque acteur associé à l'œuvre, la page doit afficher :

- Le nom de l'acteur et son prénom, lorsqu'il est disponible.
- Le nom du personnage interprété.
- La moyenne de la performance sur 5, affichée avec deux décimales lorsqu'au moins une critique existe.
- Le nombre total de critiques.

Lorsqu'une performance ne possède aucune critique, la mention « Aucune note » doit remplacer la moyenne et le nombre de critiques doit être égal à 0.

Les performances du casting doivent être triées par ordre alphabétique du nom de l'acteur, puis du prénom et du personnage.

Chaque acteur doit disposer d'un lien vers sa page détaillée. Chaque performance doit disposer d'un lien vers sa page dédiée.

Si l'œuvre ne possède aucun acteur associé, un message doit l'indiquer.

### B6 — Page d'une performance (P1)

Chaque performance doit disposer d'une page détaillée présentant :

- Le nom et le prénom de l'acteur, lorsque le prénom est disponible.
- Le titre de l'œuvre.
- Le type et l'année de sortie de l'œuvre, lorsque ces informations sont disponibles.
- Le nom du personnage interprété.
- La note moyenne sur 5, affichée avec deux décimales.
- Le nombre total de critiques.

La moyenne est calculée en divisant la somme des notes valides par le nombre total de critiques valides associées à la performance.

Toutes les critiques valides doivent être prises en compte, y compris celles ne comportant aucun commentaire.

Si aucune critique n'existe, la moyenne est remplacée par la mention « Aucune note » et le nombre total de critiques est égal à 0.

Les critiques doivent être affichées de la plus récente à la plus ancienne selon leur date de publication. En cas d'égalité, l'identifiant de la critique le plus élevé apparaît en premier.

Chaque critique doit présenter :

- Le pseudo de son auteur, lorsque celui-ci est encore identifiable.
- La note attribuée.
- Le commentaire, lorsqu'il existe.
- La date de publication.
- La date de modification, si elle existe.

Les critiques sans commentaire doivent rester visibles sous la forme d'une évaluation sans texte.

Un visiteur non connecté peut consulter toutes les informations publiques de cette page.

Un membre connecté doit pouvoir accéder au formulaire de publication d'une critique et, le cas échéant, aux actions de modification ou de suppression de ses propres critiques.

### B7 — Recherche par acteur ou œuvre (P2)

Le site doit proposer un champ de recherche permettant de rechercher un acteur ou une œuvre.

La recherche doit porter sur :

- Le nom et le prénom des acteurs.
- Le titre des œuvres.

Les règles suivantes doivent être appliquées :

- Les espaces situés au début et à la fin de la requête sont supprimés.
- La recherche ne distingue pas les majuscules des minuscules.
- Les correspondances partielles sont acceptées : le terme recherché peut apparaître au début, au milieu ou à la fin du champ.
- La recherche doit également ignorer les différences entre caractères accentués et non accentués.
- Les résultats doivent distinguer les catégories « Acteurs » et « Œuvres ».

Les résultats sont triés par ordre alphabétique dans chaque catégorie.

Un maximum de 20 résultats par catégorie est affiché par page. Une pagination permet de consulter les résultats supplémentaires.

Chaque résultat doit permettre d'accéder à la page détaillée correspondante.

Une requête vide ne doit pas lancer de recherche et doit afficher une invitation à saisir un terme.

Si aucun résultat ne correspond à la requête, le message suivant doit être affiché : « Aucun acteur ou œuvre ne correspond à votre recherche. »

### B8 — Classement général des performances (P2)

Le site doit proposer une page dédiée au classement général des performances.

Toutes les performances ayant reçu au moins une critique doivent pouvoir apparaître dans le classement.

Le classement est effectué selon les critères suivants :

1. Moyenne non arrondie décroissante.
2. Nombre de critiques décroissant en cas d'égalité exacte de moyenne.
3. Identifiant de la performance croissant si les deux premiers critères sont identiques.

La moyenne affichée est arrondie à deux décimales, mais l'ordre du classement repose sur la moyenne non arrondie.

Chaque résultat doit afficher :

- Le nom de l'acteur et son prénom, lorsqu'il est disponible.
- Le titre de l'œuvre.
- Le personnage interprété.
- La moyenne sur 5.
- Le nombre total de critiques.

Chaque résultat doit permettre d'accéder à la page de la performance.

La page doit afficher au maximum 20 performances par page, avec une navigation permettant de consulter les résultats suivants.

### B9 — Tri des rôles d'un acteur (P2)

Sur la page d'un acteur, l'utilisateur doit pouvoir choisir entre les tris suivants :

- **Par année de sortie décroissante :** les œuvres les plus récentes apparaissent en premier. Les années inconnues sont placées à la fin.
- **Par note moyenne décroissante :** les performances les mieux notées apparaissent en premier. Les performances sans critique sont placées à la fin.

Lors d'un tri par note, les égalités sont départagées par le nombre de critiques décroissant, puis par le titre de l'œuvre dans l'ordre alphabétique.

Lors d'un tri par année, les égalités sont départagées par le titre de l'œuvre dans l'ordre alphabétique.

Les performances sans critique doivent rester visibles dans la filmographie.

Chaque performance doit permettre d'accéder à sa page détaillée et à la page de l'œuvre correspondante.

### B10 — Pagination des listes (P2)

Les listes d'acteurs, d'œuvres, de performances classées et de critiques doivent être paginées lorsqu'elles contiennent plus de 20 éléments.

Chaque page doit afficher au maximum 20 éléments.

La navigation doit permettre d'accéder à la page précédente, à la page suivante et aux autres pages disponibles.

Les critères de tri et les filtres actifs doivent être conservés lors d'un changement de page.

Si une suppression entraîne la disparition de tous les éléments d'une page, le système doit afficher la page précédente lorsqu'elle existe, ou un message indiquant qu'aucun résultat n'est disponible.

Les limites spécifiques de la page d'accueil restent fixées à 10 critiques récentes et 10 performances les mieux notées.

---

## C. Critiques et favoris

### C1 — Notation d'une performance (P1)

Un membre connecté doit pouvoir publier une critique associée à une performance existante.

Chaque critique doit comporter une note entière comprise entre 1 et 5 étoiles.

Les notes décimales, nulles, négatives ou supérieures à 5 doivent être refusées.

Un même membre peut publier plusieurs critiques pour une même performance. Chaque publication doit créer une nouvelle critique indépendante.

Chaque critique doit être associée à un membre et à une performance existante.

Après validation, la critique doit être enregistrée et la moyenne ainsi que le nombre de critiques de la performance doivent être mis à jour à partir des données enregistrées.

Les utilisateurs non connectés ne peuvent pas publier de critique.

### C2 — Ajout d'un commentaire facultatif (P1)

Lors de la publication d'une critique, un membre peut ajouter un commentaire facultatif.

Le commentaire doit respecter les règles suivantes :

- Il peut être absent.
- Il ne doit pas dépasser 1 000 caractères.
- Les retours à la ligne sont autorisés.
- Un commentaire vide ou composé uniquement d'espaces est traité comme absent.
- Un commentaire dépassant la limite doit être refusé avec un message explicite.

La note reste obligatoire, même en l'absence de commentaire.

Les données saisies doivent être traitées de manière à empêcher l'exécution de code malveillant et l'injection de contenu non autorisé.

### C3 — Modification d'une critique (P1)

Un membre connecté doit pouvoir modifier uniquement les critiques dont il est l'auteur.

Il doit pouvoir modifier la note et le commentaire, en respectant les règles définies dans C1 et C2.

La modification doit mettre à jour la date de dernière modification, sans changer la date de publication.

La modification doit être enregistrée uniquement si les nouvelles données sont valides.

Un autre membre ne doit pas pouvoir modifier la critique, même en tentant d'accéder directement à une URL ou d'envoyer une requête au serveur.

Une modification réussie doit entraîner la mise à jour des informations affichées et du calcul de la moyenne si la note a changé.

### C4 — Suppression d'une critique (P1)

Un membre connecté doit pouvoir supprimer uniquement les critiques dont il est l'auteur.

Une confirmation explicite doit être demandée avant la suppression.

Après confirmation, la critique doit disparaître des listes publiques et du profil du membre. Elle ne doit plus participer au calcul de la moyenne ni au décompte des critiques.

Les signalements associés à une critique supprimée doivent également être supprimés ou traités conformément aux règles de conservation définies pour le projet, sans laisser de référence invalide.

Un membre ne doit pas pouvoir supprimer la critique d'un autre membre.

### C5 — Signalement d'un commentaire inapproprié (P3)

Un membre connecté doit pouvoir signaler une critique qu'il juge inappropriée.

Les motifs disponibles sont :

- Contenu injurieux.
- Contenu discriminatoire.
- Publicité ou spam.
- Autre.

Chaque signalement doit comporter :

- L'identifiant de la critique signalée.
- L'identifiant du membre ayant effectué le signalement.
- Le motif sélectionné.
- La date du signalement.
- Un statut de traitement initial égal à « en attente ».

Un même membre ne peut signaler une même critique qu'une seule fois.

Le système doit refuser tout signalement concernant une critique inexistante ou supprimée.

Le signalement ne supprime pas automatiquement la critique.

### C6 — Gestion des favoris (P2)

Un membre connecté doit pouvoir ajouter une performance à sa liste de favoris et la retirer de cette liste.

Une même performance ne peut apparaître qu'une seule fois dans la liste d'un membre.

Le membre doit pouvoir consulter sa liste de favoris depuis son profil.

Chaque favori doit présenter :

- Le nom de l'acteur.
- Le titre de l'œuvre.
- Le personnage interprété.
- La note moyenne sur 5, si au moins une critique existe.
- Le nombre total de critiques.

Les favoris sont triés par date d'ajout décroissante.

Un visiteur non connecté ne peut ni consulter la liste personnelle d'un membre ni modifier ses favoris.

Les favoris doivent être supprimés lors de la suppression du compte du membre. Ils sont conservés lorsque le compte est temporairement désactivé.

---

## D. Administration

Les fonctionnalités de cette section sont exclusivement accessibles aux comptes disposant du rôle administrateur.

Les autorisations doivent être vérifiées côté serveur pour chaque opération.

### D1 — Gestion des acteurs (P1)

Un administrateur doit pouvoir ajouter, consulter, modifier et supprimer une fiche d'acteur.

Une fiche d'acteur comprend :

- Un nom obligatoire.
- Un prénom facultatif.
- Une date de naissance facultative.
- Une biographie facultative.
- Une URL de photo facultative.

Le nom doit être renseigné et ne doit pas être composé uniquement d'espaces.

La date de naissance, lorsqu'elle est renseignée, doit être une date valide et ne doit pas être située dans le futur.

L'URL de photo, lorsqu'elle est renseignée, doit respecter un format d'URL valide.

Les champs obligatoires doivent être validés avant l'enregistrement.

Avant la suppression d'un acteur, le système doit vérifier s'il possède des performances associées.

Si des performances existent, la suppression de l'acteur ne doit être autorisée qu'après confirmation explicite de la suppression des performances et des données qui en dépendent. Les critiques, les favoris et les signalements associés doivent être traités sans laisser de référence invalide.

Toute opération doit afficher un message confirmant sa réussite ou expliquant son échec.

### D2 — Gestion des œuvres (P1)

Un administrateur doit pouvoir ajouter, consulter, modifier et supprimer une œuvre.

Chaque œuvre comprend :

- Un titre obligatoire.
- Un type obligatoire, limité aux valeurs « film » et « série ».
- Une année de sortie facultative.
- Une description facultative.

Le titre ne doit pas être vide ni composé uniquement d'espaces.

L'année de sortie, lorsqu'elle est renseignée, doit être une année valide et ne doit pas être située dans le futur.

Les champs obligatoires doivent être validés avant l'enregistrement.

Avant la suppression d'une œuvre, le système doit vérifier si des performances lui sont associées.

Si des performances existent, leur suppression ainsi que celle des critiques, des favoris et des signalements associés doivent être explicitement confirmées. Aucune référence invalide ne doit subsister dans la base de données.

Chaque opération doit afficher un message confirmant sa réussite ou expliquant son échec.

### D3 — Association d'un acteur à une œuvre (P1)

Un administrateur doit pouvoir créer une performance en associant un acteur à une œuvre et en renseignant le nom du personnage interprété.

Chaque performance doit obligatoirement référencer un acteur et une œuvre existants.

Le nom du personnage est obligatoire et ne doit pas être composé uniquement d'espaces.

Le système doit empêcher la création d'une association identique pour un même acteur, une même œuvre et un même personnage.

La détection des doublons doit ignorer les différences de majuscules et minuscules ainsi que les espaces situés au début et à la fin du nom du personnage.

Un message explicite doit être affiché si l'association existe déjà.

Un administrateur doit pouvoir consulter et modifier une performance existante, notamment pour corriger le nom du personnage.

La suppression d'une performance doit nécessiter une confirmation et entraîner le traitement de ses critiques, favoris et signalements associés.

### D4 — Modération des commentaires (P1)

Un administrateur doit pouvoir consulter l'ensemble des critiques publiées sur le site.

Chaque critique doit présenter son auteur, sa performance, sa note, son commentaire éventuel et ses dates de publication et de modification.

L'administrateur doit pouvoir supprimer n'importe quelle critique, indépendamment de son auteur.

La suppression doit nécessiter une confirmation explicite.

Après suppression, la critique ne doit plus être visible publiquement ni participer au calcul de la moyenne et du nombre total de critiques.

Les signalements associés doivent être supprimés ou traités conformément aux règles de conservation définies pour le projet.

Un message doit confirmer la réussite de la suppression.

### D5 — Désactivation et réactivation d'un compte membre (P2)

Un administrateur doit pouvoir désactiver ou réactiver un compte membre.

Un compte désactivé ne doit plus pouvoir :

- Se connecter.
- Publier de critiques.
- Modifier ses critiques.
- Supprimer ses critiques.
- Ajouter ou retirer des favoris.

La désactivation ne doit pas supprimer les données du membre. Ses critiques et ses favoris doivent être conservés.

La vérification du statut du compte doit être effectuée côté serveur à chaque opération protégée. Un membre désactivé ne doit pas pouvoir continuer à utiliser les fonctionnalités protégées avec une session ouverte avant la désactivation.

Lors de la réactivation, le membre doit retrouver l'accès aux fonctionnalités autorisées par son compte.

L'administrateur doit pouvoir consulter le statut du compte et recevoir une confirmation après chaque opération.

### D6 — Consultation et traitement des signalements (P3)

Un administrateur doit pouvoir consulter les signalements enregistrés sur le site.

Chaque signalement doit afficher :

- La critique concernée, si elle existe encore.
- Le motif du signalement.
- La date du signalement.
- Le membre ayant effectué le signalement, s'il est toujours identifiable.
- Le statut de traitement.

Les statuts possibles sont :

- En attente.
- Traité.
- Rejeté.

Le statut initial est « en attente ».

Les signalements doivent être triés par date décroissante. Les signalements en attente doivent être facilement identifiables et peuvent être affichés en priorité.

L'administrateur doit pouvoir modifier le statut d'un signalement en « traité » ou « rejeté ».

Chaque changement de statut doit être enregistré et affiché après validation.

Le traitement d'un signalement ne doit pas supprimer automatiquement la critique concernée.

### D7 — Import de données depuis une API (P3)

Un administrateur doit pouvoir lancer un import de données depuis une API externe configurée.

Avant la mise en œuvre, la documentation doit préciser :

- Le nom de l'API utilisée.
- Les données importées.
- Les champs obligatoires et facultatifs.
- Les règles de correspondance avec les données existantes.
- Les règles de création et de mise à jour.
- Les limites d'utilisation de l'API, lorsqu'elles sont connues.

Avant l'enregistrement, le système doit vérifier la validité des champs obligatoires et rechercher les doublons à partir d'un identifiant externe ou d'une règle de correspondance documentée.

Les données valides doivent être enregistrées même si certaines données importées sont invalides.

À la fin de l'import, un bilan doit afficher :

- Le nombre d'éléments traités.
- Le nombre d'éléments ajoutés.
- Le nombre d'éléments mis à jour.
- Le nombre de doublons ignorés.
- Le nombre d'éléments rejetés.
- La liste des erreurs rencontrées, avec une explication pour chaque erreur.

Les erreurs individuelles ne doivent pas interrompre l'ensemble de l'import, sauf en cas d'indisponibilité de l'API ou d'erreur générale empêchant la poursuite du traitement.

---

# 3. Règles générales

## E1 — Accès aux fonctionnalités

La consultation des acteurs, des œuvres, des performances, des moyennes, des classements et des critiques doit être accessible sans création de compte.

La publication, la modification et la suppression de critiques, ainsi que la gestion des favoris, nécessitent une session membre valide.

Les opérations d'administration sont réservées aux comptes disposant du rôle administrateur.

Les règles d'accès doivent être vérifiées côté serveur et ne doivent pas dépendre uniquement de l'affichage des boutons dans l'interface.

## E2 — Calcul des moyennes

La moyenne d'une performance est calculée selon la formule suivante :

Moyenne = somme des notes valides / nombre total de critiques valides.

Le calcul doit utiliser toutes les critiques enregistrées pour la performance, y compris celles sans commentaire.

Les critiques supprimées ne doivent plus être prises en compte.

Les moyennes doivent être calculées à partir des valeurs exactes et affichées avec deux décimales. L'arrondi ne doit pas modifier l'ordre du classement.

Une performance sans critique ne possède pas de moyenne. Elle doit être présentée comme telle et ne doit pas apparaître dans les classements réservés aux performances évaluées.

## E3 — Tri et ordre d'affichage

Les règles de tri doivent être déterministes.

Lorsqu'un critère de tri principal produit une égalité, un critère secondaire doit être appliqué conformément aux règles de chaque fonctionnalité. Si nécessaire, l'identifiant de l'élément permet de garantir un ordre stable.

Les listes doivent conserver leurs critères de tri et leurs filtres lors d'un changement de page.

## E4 — Dates

Les dates de création et de modification doivent être enregistrées de manière cohérente dans la base de données.

Les dates de publication des critiques restent inchangées lors de leur modification. La date de dernière modification est actualisée à chaque modification réussie.

Les dates affichées aux utilisateurs doivent suivre un format lisible et cohérent sur l'ensemble du site.

## E5 — Intégrité des données

Chaque critique doit obligatoirement être associée à un membre et à une performance existante, sauf si l'auteur a été anonymisé conformément à la règle de suppression de compte.

Chaque performance doit référencer un acteur et une œuvre existants.

Chaque favori doit référencer un membre et une performance existants.

Chaque signalement doit référencer une critique existante ainsi qu'un membre identifiable, sauf anonymisation prévue par les règles de conservation.

Les contraintes doivent être garanties par la base de données et par les contrôles côté serveur.

## E6 — Sécurité

Les mots de passe doivent être hachés à l'aide d'un algorithme adapté au stockage des mots de passe. Ils ne doivent jamais être stockés en clair.

Les requêtes SQL doivent utiliser des requêtes préparées ou un mécanisme équivalent empêchant les injections SQL.

Toutes les données saisies par les utilisateurs doivent être validées côté serveur avant leur traitement.

Les contenus textuels doivent être affichés de manière à empêcher l'exécution de code injecté.

Les sessions doivent être protégées et invalidées lors de la déconnexion.

Les jetons de réinitialisation doivent être sécurisés et à usage unique.

Les opérations sensibles doivent être protégées contre les accès non autorisés. Les formulaires modifiant des données doivent également être protégés contre les requêtes intersites non autorisées.

## E7 — Gestion des erreurs

Les formulaires doivent afficher des messages explicites en cas de données invalides.

Les erreurs doivent être affichées à proximité du champ concerné lorsque cela est pertinent.

Lorsqu'une opération échoue, les données existantes doivent rester inchangées.

Les erreurs techniques ne doivent pas exposer de données sensibles ni de détails internes à l'utilisateur.

Les pages de listes doivent prévoir un état vide lorsque aucun élément n'est disponible.

## E8 — Suppression et conservation

Toute suppression définitive doit être confirmée par l'utilisateur autorisé.

Les suppressions d'acteurs, d'œuvres et de performances doivent traiter leurs dépendances de manière cohérente.

La suppression d'un compte doit suivre la politique d'anonymisation définie dans A6.

Les favoris doivent être supprimés lorsqu'une performance est supprimée.

Les signalements et les critiques dépendant d'un élément supprimé doivent être supprimés ou anonymisés conformément aux règles de conservation, sans laisser de référence invalide.

---

# 4. Interface et navigation

## F1 — Navigation principale

La barre de navigation doit contenir les liens suivants :

- Accueil.
- Acteurs.
- Œuvres.
- Classement.
- Recherche.

Pour un visiteur non connecté, les liens « Connexion » et « Inscription » doivent être accessibles.

Pour un membre connecté, la navigation doit proposer un accès au profil et une action de déconnexion.

Pour un administrateur, un accès supplémentaire à l'espace d'administration doit être disponible.

## F2 — Comportement des formulaires

Les formulaires doivent indiquer les champs obligatoires et facultatifs.

Les erreurs de validation doivent être affichées à proximité du champ concerné.

Lorsqu'un formulaire contient une erreur, les autres valeurs déjà saisies doivent être conservées lorsque cela est possible.

Les opérations de création, de modification et de suppression doivent afficher un message confirmant leur résultat.

## F3 — États des pages

Les listes et les pages dépendant de données doivent prévoir les états suivants :

- Chargement des données.
- Données disponibles.
- Aucun résultat.
- Erreur de chargement.

Les états vides doivent afficher un message explicite.

Les pages d'acteurs, d'œuvres et de performances doivent présenter des liens permettant de naviguer entre les éléments associés.

## F4 — Confirmation des actions

Une confirmation doit être demandée avant toute suppression définitive d'un compte, d'une critique ou d'une donnée administrée lorsque l'opération entraîne une perte de données.

Les opérations de modification ne nécessitent pas de confirmation supplémentaire lorsque l'utilisateur a déjà validé le formulaire.

---

# 5. Critères d'acceptation et tests

Les critères suivants permettent de vérifier objectivement le bon fonctionnement des principales fonctionnalités.

## G1 — Inscription

**Test 1 : inscription valide**

Étant donné un pseudo de 3 caractères, une adresse e-mail valide et un mot de passe de 8 caractères, lorsque le visiteur soumet le formulaire et que les informations sont disponibles, le compte doit être créé.

**Test 2 : pseudo invalide**

Étant donné un pseudo de 2 caractères, lorsque le visiteur soumet le formulaire, le compte ne doit pas être créé et une erreur doit expliquer que le pseudo est trop court.

**Test 3 : e-mail déjà utilisé**

Étant donné une adresse e-mail déjà associée à un compte, lorsque le visiteur tente de s'inscrire avec cette adresse, le compte ne doit pas être créé.

## G2 — Calcul d'une moyenne

**Précondition :** une performance possède trois critiques ayant les notes 5, 4 et 3, dont une sans commentaire.

**Résultat attendu :**

- La moyenne affichée est de 4,00 sur 5.
- Le nombre de critiques affiché est de 3.
- La critique sans commentaire est prise en compte dans le calcul.

## G3 — Classement des performances

**Précondition :** deux performances possèdent une moyenne exacte de 4,50. La première possède deux critiques et la seconde en possède cinq.

**Résultat attendu :**

- La performance ayant cinq critiques apparaît en premier.
- Une performance sans critique n'apparaît pas dans le classement.
- Une performance ayant une seule critique valide peut apparaître dans le classement.

## G4 — Modification d'une critique

**Précondition :** une critique appartient au membre A.

**Résultat attendu :**

- Le membre A peut modifier sa note et son commentaire.
- La date de dernière modification est actualisée.
- La date de publication reste inchangée.
- Le membre B ne peut pas modifier la critique, y compris en envoyant directement une requête au serveur.

## G5 — Suppression d'une critique

**Précondition :** une performance possède plusieurs critiques.

**Résultat attendu :**

- Le système demande une confirmation avant la suppression.
- Après confirmation, la critique disparaît des listes publiques.
- La moyenne et le nombre de critiques sont recalculés sans la critique supprimée.

## G6 — Recherche

**Précondition :** la base de données contient un acteur nommé « Brad Pitt ».

**Résultat attendu :**

- Une recherche avec « brad pitt » renvoie cet acteur.
- Une recherche avec « Pitt » renvoie également cet acteur si la correspondance partielle est utilisée.
- Une recherche avec «  Brad Pitt  » renvoie le même résultat après suppression des espaces périphériques.
- Une recherche sans résultat affiche un message explicite.

## G7 — Contrôle des droits d'accès

**Précondition :** un membre tente de supprimer la critique d'un autre membre.

**Résultat attendu :**

- Le serveur refuse l'opération.
- La critique reste enregistrée.
- Aucun accès non autorisé aux données n'est accordé.

## G8 — Désactivation d'un compte

**Précondition :** un membre est connecté et son compte est désactivé par un administrateur.

**Résultat attendu :**

- Le membre ne peut plus effectuer d'opérations protégées.
- Les tentatives de publication, de modification ou de suppression de critiques sont refusées.
- Les données existantes du membre sont conservées.

## G9 — Pagination

**Précondition :** une liste contient 45 éléments.

**Résultat attendu :**

- La première page affiche 20 éléments.
- La deuxième page affiche 20 éléments.
- La troisième page affiche les 5 éléments restants.
- Le tri sélectionné est conservé lors du changement de page.

## G10 — Suppression d'un compte

**Précondition :** un membre possède plusieurs critiques et plusieurs favoris.

**Résultat attendu :**

- Le mot de passe doit être confirmé.
- Les données personnelles du compte sont supprimées.
- Les favoris du membre sont supprimés.
- Les critiques conservées sont anonymisées.
- Aucune référence invalide ne subsiste dans la base de données.

---

# 6. Données et contraintes de mise en œuvre

## H1 — Identifiants

Chaque membre, acteur, œuvre, performance, critique, favori et signalement doit posséder un identifiant unique.

Les relations entre les données doivent être assurées par des clés étrangères ou des mécanismes équivalents garantissant l'intégrité référentielle.

## H2 — Unicité

Les pseudos et les adresses e-mail doivent être uniques, sans distinction entre majuscules et minuscules.

Une performance ne peut être enregistrée deux fois pour la même combinaison d'acteur, d'œuvre et de personnage, après normalisation du nom du personnage.

Un membre ne peut enregistrer qu'un seul favori pour une performance donnée.

Un membre ne peut signaler une même critique qu'une seule fois.

## H3 — Validations côté serveur

Les contraintes de longueur, de format, de type et d'unicité doivent être vérifiées côté serveur.

Les contrôles effectués dans l'interface ne remplacent pas les validations côté serveur.

La base de données doit également garantir les contraintes d'intégrité essentielles.

## H4 — Données initiales

Avant la mise en service, la base de données doit contenir un ensemble de données permettant de vérifier les principales fonctionnalités.

Cet ensemble doit inclure :

- Des acteurs avec et sans prénom, biographie, date de naissance et photo.
- Des films et des séries.
- Des œuvres avec et sans année de sortie.
- Des performances avec et sans critiques.
- Des critiques avec et sans commentaire.
- Des performances ayant des moyennes différentes et des égalités de classement.
- Des comptes membres et au moins un compte administrateur.

Les comptes de test doivent être identifiés comme tels et ne doivent pas être utilisés comme comptes de production.

## H5 — Documentation technique

Avant la mise en œuvre, les choix techniques doivent être documentés dans un document complémentaire précisant :

- Le langage de programmation.
- Le framework éventuel.
- Le système de gestion de base de données.
- L'architecture générale de l'application.
- Les modalités d'authentification et de gestion des sessions.
- Les modalités d'envoi des e-mails.
- L'API externe utilisée pour l'import, si cette fonctionnalité est développée.
- Les modalités de déploiement et de configuration.

---

# 7. Périmètre de réalisation

## 7.1. Première version — P1

La première version doit permettre :

- La création et l'utilisation d'un compte.
- La consultation des acteurs, des œuvres et des performances.
- L'affichage des notes moyennes et du nombre de critiques.
- La publication, la modification et la suppression de critiques.
- La gestion administrative des acteurs, des œuvres et des performances.
- La modération des critiques.
- L'affichage de la page d'accueil avec les critiques récentes et les performances les mieux notées.

## 7.2. Deuxième phase — P2

Les fonctionnalités suivantes peuvent être ajoutées après validation de la première version :

- La modification du profil.
- La recherche d'acteurs et d'œuvres.
- Le classement général des performances.
- Le tri des performances sur la page d'un acteur.
- La gestion des favoris.
- La pagination avancée des listes.
- La désactivation et la réactivation des comptes membres.

## 7.3. Troisième phase — P3

Les fonctionnalités complémentaires comprennent :

- La réinitialisation du mot de passe par e-mail.
- La suppression du compte.
- Le signalement des critiques.
- La consultation et le traitement des signalements.
- L'import de données depuis une API externe.

Ces priorités concernent le calendrier de réalisation et ne dispensent pas de respecter les exigences de sécurité, de cohérence des données et de contrôle des accès dès la première version.

---

# 8. Résultat attendu

À l'issue du projet, Jeu d'acteur doit être une application web permettant de consulter et d'évaluer les performances individuelles des acteurs dans les films et les séries.

Les visiteurs doivent pouvoir découvrir les acteurs, les œuvres, les distributions et les performances les mieux notées sans créer de compte.

Les membres doivent pouvoir publier leurs évaluations, gérer leurs critiques et leurs favoris, ainsi que consulter leur profil.

Les administrateurs doivent disposer des outils nécessaires pour gérer les données, contrôler les comptes et modérer les contenus.

L'ensemble des fonctionnalités doit respecter les règles de validation, de calcul des moyennes, de classement, de conservation des données et de sécurité définies dans le présent cahier des charges.
