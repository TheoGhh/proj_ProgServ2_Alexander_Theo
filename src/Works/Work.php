<?php

class Work implements WorkInterface {
    const TYPES = [
        'film' => 'Film',
        'serie' => 'Série'
    ];

    const TITLE_MAX_LENGTH = 120;

    private ?int $id;
    private int $idTmdb;
    private string $title;
    private string $type;
    private int $season;
    private ?DateTimeImmutable $releaseDate;
    private ?string $synopsis;
    private ?string $poster;

    public function __construct(
        ?int $id,
        int $idTmdb,
        string $title,
        string $type,
        int $season = 0,
        ?DateTimeImmutable $releaseDate = null,
        ?string $synopsis = null,
        ?string $poster = null,
    ) {
        $this->id = $id;
        $this->setIdTmdb($idTmdb);
        $this->setTitle($title);
        $this->setType($type);
        $this->setSeason($season);
        $this->setReleaseDate($releaseDate);
        $this->setSynopsis($synopsis);
        $this->setPoster($poster);
    }

    public function getId(): ?int {
        return $this->id;
    }

    public function getIdTmdb(): int {
        return $this->idTmdb;
    }

    public function getTitle(): string {
        return $this->title;
    }

    public function getType(): string {
        return $this->type;
    }

    public function getTypeLabel(): string {
        return self::TYPES[$this->type];
    }

    public function getSeason(): int {
        return $this->season;
    }

    public function getReleaseDate(): ?DateTimeImmutable {
        return $this->releaseDate;
    }

    public function getSynopsis(): ?string {
        return $this->synopsis;
    }

    public function getPoster(): ?string {
        return $this->poster;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setIdTmdb(int $idTmdb): void {
        if ($idTmdb <= 0) {
            throw new InvalidArgumentException("L'identifiant TMDB doit être un nombre positif.");
        }

        $this->idTmdb = $idTmdb;
    }

    public function setTitle(string $title): void {
        $title = trim($title);

        if ($title === '') {
            throw new InvalidArgumentException("Le titre est obligatoire.");
        }

        if (mb_strlen($title) > self::TITLE_MAX_LENGTH) {
            throw new InvalidArgumentException(
                "Le titre ne doit pas dépasser " . self::TITLE_MAX_LENGTH . " caractères."
            );
        }

        $this->title = $title;
    }

    public function setType(string $type): void {
        if (!array_key_exists($type, self::TYPES)) {
            throw new InvalidArgumentException("Le type doit être « film » ou « série ».");
        }

        $this->type = $type;
    }

    // Un film n'a pas de saison (0), une série commence à la saison 1
    public function setSeason(int $season): void {
        if ($this->type === 'film' && $season !== 0) {
            throw new InvalidArgumentException("Un film ne peut pas avoir de saison.");
        }

        if ($this->type === 'serie' && $season < 1) {
            throw new InvalidArgumentException("Une série doit avoir un numéro de saison supérieur ou égal à 1.");
        }

        $this->season = $season;
    }

    public function setReleaseDate(?DateTimeImmutable $releaseDate): void {
        if ($releaseDate !== null && $releaseDate >= new DateTimeImmutable('tomorrow')) {
            throw new InvalidArgumentException("La date de sortie ne peut pas être dans le futur.");
        }

        $this->releaseDate = $releaseDate;
    }

    public function setSynopsis(?string $synopsis): void {
        $synopsis = trim($synopsis ?? '');

        $this->synopsis = $synopsis === '' ? null : $synopsis;
    }

    public function setPoster(?string $poster): void {
        $poster = trim($poster ?? '');

        if ($poster === '') {
            $this->poster = null;
            return;
        }

        if (!filter_var($poster, FILTER_VALIDATE_URL)) {
            throw new InvalidArgumentException("L'URL de l'affiche n'est pas valide.");
        }

        $this->poster = $poster;
    }
}
