CREATE DATABASE kopma_36
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE USER 'mhs_36'@'localhost'
    IDENTIFIED BY '<animepink>';

GRANT ALL PRIVILEGES ON kopma_36.* TO 'mhs_36'@'localhost';