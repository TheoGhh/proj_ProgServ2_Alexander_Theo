<?php

const DATABASE_FILE = __DIR__ . './script.sql';

$pdo = new PDO("sqlite:" . DATABASE_FILE);
