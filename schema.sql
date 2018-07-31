use servermail;

CREATE TABLE virtual_users (id INT AUTO_INCREMENT NOT NULL, domain_id INT DEFAULT NULL, password VARCHAR(106) NOT NULL, email VARCHAR(120) NOT NULL, INDEX domain_id (domain_id), UNIQUE INDEX email (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE =InnoDB;

CREATE TABLE virtual_aliases (id INT AUTO_INCREMENT NOT NULL, domain_id INT DEFAULT NULL, source VARCHAR(100) NOT NULL, destination VARCHAR(100) NOT NULL, INDEX domain_id (domain_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB;

CREATE TABLE virtual_domains (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) NOT NULL, UNIQUE INDEX name (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB;

CREATE TABLE admin (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(100) NOT NULL, password VARCHAR(128) NOT NULL, is_active TINYINT(1) DEFAULT '1' NOT NULL, UNIQUE INDEX username (username), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB;

ALTER TABLE virtual_users ADD CONSTRAINT FK_3C68956A115F0EE5 FOREIGN KEY (domain_id) REFERENCES virtual_domains (id);
ALTER TABLE virtual_aliases ADD CONSTRAINT FK_696568F6115F0EE5 FOREIGN KEY (domain_id) REFERENCES virtual_domains (id);

insert into admin values(1, 'admin', '$2y$10$KWCCBmkpsWeKZ7lyvSbSDenlNBZ02OL7SrggykoudhrQC5GjTOrBG', 1);