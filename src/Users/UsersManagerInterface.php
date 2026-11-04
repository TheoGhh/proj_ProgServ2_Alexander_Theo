<?php

namespace Users;

interface UsersManagerInterface {
    public function getUserById(int $id): ?User;
    public function getUserByEmail(string $email): ?User;
    public function isUsernameTaken(string $username): bool;
    public function isEmailTaken(string $email): bool;
    public function addUser(User $user): int;
}
