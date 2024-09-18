-- PROVEEDORES DATAMART CREATION:

CREATE TABLE farispley_dm_proveedores.H_sipd_stocks (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `idb` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);


CREATE TABLE farispley_dm_proveedores.H_mnad_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_mnad_articulos` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_dm_proveedores.L_stock_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `idb` integer,
  `id_mnad_articulos` integer,
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  FOREIGN KEY (idb) REFERENCES farispley_dm_proveedores.H_sipd_stocks(idb),
  FOREIGN KEY (id_mnad_articulos) REFERENCES farispley_dm_proveedores.H_mnad_articulos(id_mnad_articulos)

);

CREATE TABLE farispley_dm_proveedores.S_sipd_stocks (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `scanning` int,
  `uxb` int,
  `cant_stock` int,
  `unidades` int,
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`),
  FOREIGN KEY (id_hub) REFERENCES farispley_dm_proveedores.H_sipd_stocks(id)

);

CREATE TABLE farispley_dm_proveedores.S_mnad_articulos (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `id_articulo` int,
  `id_numero` int,
  `mna`  varchar(255),
  `sect_secc` int,
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`),
  FOREIGN KEY (id_hub) REFERENCES farispley_dm_proveedores.H_mnad_articulos(id)

);
