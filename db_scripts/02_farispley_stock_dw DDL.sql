-- STOCK DATAWAREHOUSE CREATION:

CREATE TABLE farispley_stock_dw.H_stock_fisico (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_stock` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.H_sipd_stocks (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `idb` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.H_mnad_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_mnad_articulos` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.H_mnad_tipo_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `mna`  varchar(255) NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.L_stock (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_stock` integer,
  `idb` integer,
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.L_stock_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `idb` integer,
  `id_mnad_articulos` integer,
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.L_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_mnad_articulos` int,
  `mna` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_stock_dw.S_stock_fisico (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `descrip`  varchar(255),
  `apto`  varchar(255),
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`)
);

CREATE TABLE farispley_stock_dw.S_sipd_stocks (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `scanning` int,
  `uxb` int,
  `cant_stock` int,
  `unidades` int,
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`)
);

CREATE TABLE farispley_stock_dw.S_mnad_articulos (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `id_articulo` int,
  `id_numero` int,
  `mna`  varchar(255),
  `sect_secc` int,
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`)
);

CREATE TABLE farispley_stock_dw.S_mnad_tipo_articulos (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `descrip`  varchar(255),
  `tipo_cotizacion`  varchar(255),
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`)
);

ALTER TABLE farispley_stock_dw.S_mnad_tipo_articulos ADD FOREIGN KEY (id_hub) REFERENCES farispley_stock_dw.H_mnad_tipo_articulos (id);
ALTER TABLE farispley_stock_dw.S_mnad_articulos ADD FOREIGN KEY (id_hub) REFERENCES farispley_stock_dw.H_mnad_articulos (id);
ALTER TABLE farispley_stock_dw.S_sipd_stocks ADD FOREIGN KEY (id_hub) REFERENCES farispley_stock_dw.H_sipd_stocks (id);
ALTER TABLE farispley_stock_dw.S_stock_fisico ADD FOREIGN KEY (id_hub) REFERENCES farispley_stock_dw.H_stock_fisico (id);
ALTER TABLE farispley_stock_dw.L_stock ADD FOREIGN KEY (id_stock) REFERENCES farispley_stock_dw.H_stock_fisico (id_stock);
ALTER TABLE farispley_stock_dw.L_stock ADD FOREIGN KEY (idb) REFERENCES farispley_stock_dw.H_sipd_stocks (idb);
ALTER TABLE farispley_stock_dw.L_stock_articulos ADD FOREIGN KEY (idb) REFERENCES farispley_stock_dw.H_sipd_stocks (idb);
ALTER TABLE farispley_stock_dw.L_stock_articulos ADD FOREIGN KEY (id_mnad_articulos) REFERENCES farispley_stock_dw.H_mnad_articulos (id_mnad_articulos);
ALTER TABLE farispley_stock_dw.L_articulos ADD FOREIGN KEY (id_mnad_articulos) REFERENCES farispley_stock_dw.H_mnad_articulos (id_mnad_articulos);
ALTER TABLE farispley_stock_dw.L_articulos ADD FOREIGN KEY (mna) REFERENCES farispley_stock_dw.H_mnad_tipo_articulos (mna);
