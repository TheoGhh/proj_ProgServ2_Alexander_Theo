<?php

class User implements UserInterface {
    const USERNAME_MIN_LENGTH = 3;
    const USERNAME_MAX_LENGTH = 30;
    const EMAIL_MAX_LENGTH = 255;
    const PASSWORD_MIN_LENGTH = 8;

    private ?int $id;
    private string $username;
    private string $email;
    private string $passwordHash;

    public function __construct(?int $id, string $username, string $email, string $password) {
        $this->id = $id;
        $this->setUsername($username);
        $this->setEmail($email);
        $this->setPassword($password);
    }

    public function getId(): ?int {
        return $this->id;
    }

    public function getUsername(): string {
        return $this->username;
    }

    public function getEmail(): string {
        return $this->email;
    }

    public function getPasswordHash(): string {
        return $this->passwordHash;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setUsername(string $username): void {
        $username = trim($username);
        $length = mb_strlen($username);

        if ($length < self::USERNAME_MIN_LENGTH || $length > self::USERNAME_MAX_LENGTH) {
            throw new InvalidArgumentException(
                "Le nom d'utilisateur doit contenir entre " . self::USERNAME_MIN_LENGTH
                    . " et " . self::USERNAME_MAX_LENGTH . " caractères."
            );
        }

        $this->username = $username;
    }

    public function setEmail(string $email): void {
        $email = trim($email);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL) || mb_strlen($email) > self::EMAIL_MAX_LENGTH) {
            throw new InvalidArgumentException("L'adresse e-mail n'est pas valide.");
        }

        $this->email = $email;
    }

    public function setPassword(string $password): void {
        if (mb_strlen($password) < self::PASSWORD_MIN_LENGTH) {
            throw new InvalidArgumentException(
                "Le mot de passe doit contenir au moins " . self::PASSWORD_MIN_LENGTH . " caractères."
            );
        }

        $this->passwordHash = password_hash($password, PASSWORD_DEFAULT);
    }
}
