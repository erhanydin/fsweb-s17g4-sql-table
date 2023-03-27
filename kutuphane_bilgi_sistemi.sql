-- SQL ifadelerinizi buraya yazınız.

CREATE TABLE `islem`(
    `islem_id` BIGINT UNSIGNED NOT NULL,
    `ogrenci_id` BIGINT UNSIGNED NOT NULL,
    `kitap_id` BIGINT UNSIGNED NOT NULL,
    `atarih` VARCHAR(100) NOT NULL,
    `vtarih` BIGINT NOT NULL,
    PRIMARY KEY (`islem_id`)
);

CREATE TABLE `tur`(
    `tur_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tur_adi` BIGINT NOT NULL,
    PRIMARY KEY (`tur_id`)
);

CREATE TABLE `ogrenci`(
    `ogrenci_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_ad` VARCHAR(100) NOT NULL,
    `ogrenci_soyad` VARCHAR(100) NOT NULL,
    `dtarih` VARCHAR(100) NOT NULL,
    `cinsiyet` VARCHAR(10) NOT NULL,
    `sinif` VARCHAR(10) NOT NULL,
    `puan` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`ogrenci_id`)
);

CREATE TABLE `yazar`(
    `yazar_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `yazar_adi` VARCHAR(100) NOT NULL,
    `yazar_soyadi` BIGINT NOT NULL,
    PRIMARY KEY (`yazar_id`)
);

CREATE TABLE `kitap`(
    `kitap_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kitap_adi` VARCHAR(100) NOT NULL,
    `sayfa_sayisi` INT UNSIGNED NOT NULL,
    `puan` INT UNSIGNED NOT NULL,
    `yazar_id` BIGINT UNSIGNED NOT NULL,
    `tur_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`kitap_id`)
);

ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`tur_id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`yazar_id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`kitap_id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`ogrenci_id`);
