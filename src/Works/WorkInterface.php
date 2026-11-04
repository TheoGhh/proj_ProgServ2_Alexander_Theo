<?php

interface WorkInterface {
    public function getId(): ?int;
    public function getIdTmdb(): int;
    public function getTitle(): string;
    public function getReleaseDate(): ?DateTimeImmutable;
    public function getSynopsis(): ?string;
    public function getType(): string;
    public function getPoster(): ?string;
    public function getSeason(): int;

    public function setId(int $id): void;
    public function setIdTmdb(int $idTmdb): void;
    public function setTitle(string $title): void;
    public function setReleaseDate(?DateTimeImmutable $releaseDate): void;
    public function setSynopsis(?string $synopsis): void;
    public function setType(string $type): void;
    public function setPoster(?string $poster): void;
    public function setSeason(int $season): void;
}
