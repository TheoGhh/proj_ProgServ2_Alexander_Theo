# Cahier des charges - Jeu d'acteur

## Présentation du projet
Dans Jeu d'acteur, on ne note pas Fight Club, on note Brad Pitt dans le rôle de Tyler Durden. 
Notre appliciation, à l'instar des sites comme Letterboxd, IMDb ou encore Allociné, permet d'évaluer la performance d'un acteur dans un film précis.

## Fonctionnalités

## A. Gestion des comptes

### A1 — Inscription (P1)

Le système doit permettre à un visiteur de créer un compte en renseignant un pseudo, une adresse e-mail et un mot de passe. Le pseudo doit comporter entre 3 et 30 caractères et être unique. L'adresse e-mail doit respecter un format valide et être unique. Le mot de passe doit contenir au moins 8 caractères. Si une information est invalide ou déjà utilisée, le compte ne doit pas être créé et un message doit indiquer la cause du refus.

### A2 — Connexion et déconnexion (P1)

Le système doit permettre à un membre de se connecter avec son adresse e-mail et son mot de passe. En cas de connexion réussie, il doit pouvoir accéder aux fonctionnalités réservées aux membres. En cas d'échec, un message générique doit être affiché sans préciser si l'adresse e-mail existe. La déconnexion doit fermer la session et empêcher l'accès aux fonctionnalités nécessitant une authentification jusqu'à une nouvelle connexion.

### A3 — Profil du membre (P1)

Chaque membre connecté doit pouvoir consulter une page affichant son pseudo et la liste de ses critiques. Chaque critique doit présenter le nom de l'acteur, le titre de l'œuvre, le nom du personnage interprété, la note attribuée, le commentaire éventuel et la date de publication. Les critiques doivent être affichées de la plus récente à la plus ancienne.

### A4 — Modification du profil (P2)

Un membre connecté doit pouvoir modifier son pseudo, son adresse e-mail et son mot de passe. Les règles de validation définies dans A1 doivent s'appliquer aux nouvelles valeurs. Le système doit demander le mot de passe actuel avant toute modification et afficher un message confirmant la réussite ou l'échec de l'opération.

### A5 — Réinitialisation du mot de passe par e-mail (P3)

Un visiteur doit pouvoir demander une réinitialisation du mot de passe en saisissant son adresse e-mail. Le système doit afficher le même message, que l'adresse existe ou non. Si un compte correspondant existe, un lien de réinitialisation doit être envoyé par e-mail. Le lien doit devenir inutilisable après sa première utilisation ou après l'émission d'une nouvelle demande de réinitialisation. Aucun délai d'expiration n'est imposé dans le cadre du projet.

### A6 — Suppression du compte (P3)

Un membre connecté doit pouvoir demander la suppression de son compte après confirmation de son mot de passe. Le système doit supprimer les données personnelles du compte conformément aux règles de conservation définies pour le projet. Le traitement des critiques et des favoris associés doit être défini afin de ne laisser aucune référence invalide dans la base de données.

## B. Consultation

### B1 — Page d'accueil (P1)

La page d'accueil doit afficher les 10 critiques les plus récemment publiées et les 10 performances ayant les notes moyennes les plus élevées. Toutes les performances disposant d'au moins une critique doivent pouvoir apparaître dans le classement, sans seuil minimal de note ni de nombre de critiques au-delà de cette première critique. Chaque élément doit permettre d'accéder à la page correspondante.

### B2 — Liste des acteurs (P1)

Le site doit afficher la liste des acteurs enregistrés dans la base de données. Chaque entrée doit présenter le nom, le prénom et la photo de l'acteur lorsque ces informations sont disponibles. La liste doit être triée par ordre alphabétique du nom, puis du prénom. Chaque acteur doit disposer d'un lien vers sa page détaillée.

### B3 — Page d'un acteur (P1)

La page d'un acteur doit afficher son nom, son prénom, sa biographie et sa date de naissance lorsque ces informations sont disponibles. Elle doit également présenter sa filmographie, avec le titre de chaque œuvre, son année de sortie, le nom du personnage interprété et la note moyenne de chaque performance. La moyenne doit être calculée à partir de toutes les critiques enregistrées pour la performance et affichée avec deux décimales. Le nombre de critiques doit également être affiché.

### B4 — Liste des œuvres (P1)

Le site doit afficher les œuvres enregistrées dans la base de données, avec leur titre, leur type et leur année de sortie lorsque celle-ci est connue. Un filtre doit permettre d'afficher uniquement les films, uniquement les séries ou toutes les œuvres. Les résultats doivent être triés par titre par défaut. Chaque œuvre doit disposer d'un lien vers sa page détaillée.

### B5 — Page d'une œuvre (P1)

Chaque œuvre doit disposer d'une page présentant son titre, son type, son année de sortie, sa description et son casting lorsque ces informations sont disponibles. Pour chaque acteur du casting, la page doit afficher son nom, le personnage interprété, la note moyenne de sa performance et le nombre de critiques reçues. Les moyennes doivent être calculées à partir des critiques enregistrées pour chaque performance.

### B6 — Page d'une performance (P1)

Chaque performance doit disposer d'une page présentant l'acteur, l'œuvre, le nom du personnage, la note moyenne et le nombre total de critiques. Les commentaires doivent être affichés de la plus récente à la plus ancienne. Les critiques sans commentaire doivent être prises en compte dans le calcul de la moyenne et du nombre total de critiques. La moyenne doit être affichée avec deux décimales.

### B7 — Recherche par acteur ou œuvre (P2)

Le site doit proposer un champ de recherche permettant de rechercher un acteur par son nom ou une œuvre par son titre. La recherche doit ignorer les différences entre majuscules et minuscules et les espaces placés au début ou à la fin de la requête. Les résultats doivent distinguer les acteurs des œuvres et permettre d'ouvrir leur page détaillée. Si aucun résultat ne correspond à la recherche, un message explicite doit être affiché.

### B8 — Classement général des performances (P2)

Le site doit proposer une page classant les performances par note moyenne décroissante. Toutes les performances ayant reçu au moins une critique doivent pouvoir apparaître dans le classement, sans seuil minimal de note ni de nombre de critiques. Chaque résultat doit afficher l'acteur, l'œuvre, le personnage, la moyenne sur 5 et le nombre de critiques. En cas d'égalité de moyenne, la performance ayant reçu le plus grand nombre de critiques doit apparaître en premier.

### B9 — Tri des rôles d'un acteur (P2)

Sur la page d'un acteur, l'utilisateur doit pouvoir trier ses performances par note moyenne décroissante ou par année de sortie décroissante. Lors d'un tri par année, les œuvres dont l'année de sortie est inconnue doivent apparaître à la fin. Chaque performance doit permettre d'accéder à la page de l'œuvre correspondante.

## C. Critiques

### C1 — Notation d'une performance (P1)

Un membre connecté doit pouvoir attribuer une note entière comprise entre 1 et 5 étoiles à une performance. Un même membre doit pouvoir publier plusieurs critiques pour une même performance. Chaque critique doit être enregistrée séparément et associée à son auteur et à la performance concernée. Toutes les critiques valides doivent être prises en compte dans le calcul de la note moyenne et du nombre total de critiques.

### C2 — Ajout d'un commentaire facultatif (P1)

Lorsqu'il publie une critique, un membre peut ajouter un commentaire textuel facultatif de 1 000 caractères maximum. Une critique sans commentaire doit être autorisée. Le système doit refuser un commentaire dépassant cette limite et afficher un message explicite. La note doit rester obligatoire même si aucun commentaire n'est fourni.

### C3 — Modification d'une critique (P1)

Un membre connecté doit pouvoir modifier uniquement les critiques dont il est l'auteur. Il doit pouvoir modifier la note et le commentaire. Après validation, les nouvelles valeurs doivent être enregistrées et la date de modification doit être mise à jour. Un autre membre ne doit pas pouvoir modifier cette critique.

### C4 — Suppression d'une critique (P1)

Un membre connecté doit pouvoir supprimer uniquement les critiques dont il est l'auteur, après confirmation. La critique supprimée doit disparaître de la liste des commentaires et ne plus être prise en compte dans le calcul de la note moyenne ni dans le nombre total de critiques.

### C5 — Signalement d'un commentaire inapproprié (P3)

Un membre connecté doit pouvoir signaler une critique en sélectionnant un motif parmi les catégories « contenu injurieux », « contenu discriminatoire », « publicité ou spam » et « autre ». Un même membre ne doit pouvoir signaler une même critique qu'une seule fois. Le signalement doit être enregistré avec sa date et un statut initial « en attente ».

## D. Administration

### D1 — Gestion des acteurs (P1)

Un administrateur doit pouvoir ajouter, consulter, modifier et supprimer une fiche d'acteur. La fiche doit contenir obligatoirement un nom et peut contenir un prénom, une date de naissance, une biographie et une URL de photo. Les champs obligatoires doivent être validés avant l'enregistrement. Ces opérations doivent être réservées aux comptes disposant du rôle administrateur.

### D2 — Gestion des œuvres (P1)

Un administrateur doit pouvoir ajouter, consulter, modifier et supprimer une œuvre. Chaque œuvre doit posséder un titre et un type parmi « film » et « série ». L'année de sortie et la description sont facultatives. Le système doit valider les champs obligatoires avant l'enregistrement et réserver ces opérations aux administrateurs.

### D3 — Association d'un acteur à une œuvre (P1)

Un administrateur doit pouvoir associer un acteur à une œuvre en créant une performance et en renseignant le nom du personnage interprété. Chaque performance doit référencer un acteur et une œuvre existants. Le système doit empêcher la création d'une association identique pour le même acteur, la même œuvre et le même personnage.

### D4 — Modération des commentaires (P1)

Un administrateur doit pouvoir consulter et supprimer toute critique publiée sur le site. La suppression doit nécessiter une confirmation. Une fois supprimée, la critique ne doit plus être visible et ne doit plus participer au calcul des notes moyennes ni au décompte des critiques.

### D5 — Désactivation d'un compte membre (P2)

Un administrateur doit pouvoir désactiver et réactiver un compte membre. Un compte désactivé ne doit plus pouvoir se connecter, publier de critiques, modifier ses critiques ou gérer ses favoris. Les données associées doivent être conservées selon les règles de conservation définies pour le projet.

### D6 — Consultation des signalements (P3)

Un administrateur doit pouvoir consulter les critiques signalées ainsi que le motif, la date du signalement, le membre ayant effectué le signalement et le statut de traitement. Il doit pouvoir marquer un signalement comme « traité » ou « rejeté ». Les signalements en attente doivent pouvoir être identifiés facilement.

### D7 — Import de données depuis une API (P3)

Un administrateur doit pouvoir lancer un import de données depuis une API externe configurée. Avant l'enregistrement, le système doit vérifier les champs obligatoires et rechercher les doublons à partir d'un identifiant externe ou d'une règle de correspondance documentée. Les erreurs d'import doivent être signalées sans empêcher l'enregistrement des données valides. L'API utilisée, les champs importés et les règles de mise à jour doivent être documentés avant la mise en œuvre.

## E. Règles générales

La consultation des pages d'acteurs, des œuvres, des performances, des notes moyennes et des commentaires doit être accessible sans création de compte. La publication, la modification et la suppression de critiques, ainsi que la gestion des favoris, doivent nécessiter une connexion. Les opérations d'administration doivent être réservées aux comptes disposant du rôle administrateur.

Les notes doivent être des nombres entiers compris entre 1 et 5. Les moyennes doivent être calculées à partir des critiques enregistrées et affichées avec deux décimales. Une critique doit toujours être associée à un membre et à une performance existante. Les règles d'accès doivent être contrôlées côté serveur, et non uniquement dans l'interface.

Les mots de passe ne doivent jamais être stockés en clair. Les requêtes SQL doivent utiliser des requêtes préparées, et les données saisies par les utilisateurs doivent être validées avant leur traitement.
