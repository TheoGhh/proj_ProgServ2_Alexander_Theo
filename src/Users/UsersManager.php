<?php

namespace Users;

use Database\Database;

class UsersManager implements UsersManagerInterface {
    private $database;

    public function __construct(Database $database) {
        $this->database = $database;
    }

    public function getUserById(int $id): ?User {
        $sql = "SELECT id, nom_utilisateur, email, mot_de_passe
            FROM utilisateurs
            WHERE id = :id";

        $stmt = $this->database->getPdo()->prepare($sql);
        $stmt->bindValue(':id', $id);
        $stmt->execute();

        $row = $stmt->fetch();

        return $row ? $this->createUserFromRow($row) : null;
    }

    public function getUserByEmail(string $email): ?User {
        $sql = "SELECT id, nom_utilisateur, email, mot_de_passe
            FROM utilisateurs
            WHERE email = :email";

        $stmt = $this->database->getPdo()->prepare($sql);
        $stmt->bindValue(':email', trim($email));
        $stmt->execute();

        $row = $stmt->fetch();

        return $row ? $this->createUserFromRow($row) : null;
    }

    public function isUsernameTaken(string $username): bool {
        $sql = "SELECT COUNT(*)
            FROM utilisateurs
            WHERE nom_utilisateur = :username";

        $stmt = $this->database->getPdo()->prepare($sql);
        $stmt->bindValue(':username', trim($username));
        $stmt->execute();

        return $stmt->fetchColumn() > 0;
    }

    public function isEmailTaken(string $email): bool {
        $sql = "SELECT COUNT(*)
            FROM utilisateurs
            WHERE email = :email";

        $stmt = $this->database->getPdo()->prepare($sql);
        $stmt->bindValue(':email', trim($email));
        $stmt->execute();

        return $stmt->fetchColumn() > 0;
    }

    public function addUser(User $user): int {
        $sql = "INSERT INTO utilisateurs (
            nom_utilisateur,
            email,
            mot_de_passe
        ) VALUES (
            :username,
            :email,
            :passwordHash
        )";

        $stmt = $this->database->getPdo()->prepare($sql);
        $stmt->bindValue(':username', $user->getUsername());
        $stmt->bindValue(':email', $user->getEmail());
        $stmt->bindValue(':passwordHash', $user->getPasswordHash());
        $stmt->execute();

        $userId = (int) $this->database->getPdo()->lastInsertId();
        $user->setId($userId);
        return $userId;
    }


    private function createUserFromRow(array $row): User {
        $user = new User((int) $row['id'], $row['nom_utilisateur'], $row['email']);

        $user->setPasswordHash($row['mot_de_passe']);

        return $user;
    }
}
