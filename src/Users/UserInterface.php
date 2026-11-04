<?php

interface UserInterface {
    public function getId(): ?int;
    public function getUsername(): string;
    public function getEmail(): string;
    public function getPasswordHash(): string;

    public function setId(int $id): void;
    public function setUsername(string $username): void;
    public function setEmail(string $email): void;
    public function setPassword(string $password): void;
}
