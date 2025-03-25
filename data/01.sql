-- менеджеры
CREATE TABLE gsoft.managers (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'код менеджера',
    `surname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'фамилия менджера',
    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'имя менеджера',
    `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email менеджера',
    `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'телефон менеджера',
    PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci
COMMENT='менеджеры';

-- клиенты
CREATE TABLE gsoft.clients (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'код клиента',
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'название компании',
    `inn` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ИНН клиента',
    `address` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'адрес клиента',
    `email` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email клиента',
    `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'телефон клиента',
    PRIMARY KEY (`id`),
    UNIQUE KEY `clients_unique` (`inn`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci
COMMENT='клиенты';

-- грузы
CREATE TABLE gsoft.freights (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'код груза',
    `container` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'номер контейнера',
    `client_id` int unsigned NOT NULL COMMENT 'код клиента',
    `manager_id` int unsigned NOT NULL COMMENT 'код менеджера',
    `date_arrival` date NOT NULL COMMENT 'дата прибытия груза',
    PRIMARY KEY (`id`),
    KEY `freights_clients_FK` (`client_id`),
    KEY `freights_managers_FK` (`manager_id`),
    CONSTRAINT `freights_clients_FK` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `freights_managers_FK` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci
COMMENT='грузы';

-- документы груза
CREATE TABLE gsoft.documents (
    id INT UNSIGNED auto_increment NOT NULL COMMENT 'код документа',
    doc_type ENUM('Счёт','Накладная', 'Санитарный') DEFAULT 'Счёт' NOT NULL COMMENT 'тип документа',
    freight_id INT UNSIGNED NOT NULL COMMENT 'код груза',
    doc_desc varchar(2048) NULL COMMENT 'описание документа',
    image_id INT UNSIGNED NULL COMMENT 'ссылка на изображение документа',
    date_create DATETIME DEFAULT now() NOT NULL COMMENT 'дата создания',
    CONSTRAINT documents_pk PRIMARY KEY (id),
    CONSTRAINT documents_unique UNIQUE KEY (doc_type,freight_id,image_id),
    CONSTRAINT documents_freights_FK FOREIGN KEY (freight_id) REFERENCES gsoft.freights(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci
COMMENT='документы груза';
