-- SCANNING DATAMART CREATION:

CREATE TABLE farispley_dm_scanning.H_mnad_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_mnad_articulos` int NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_dm_scanning.H_mnad_tipo_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `mna`  varchar(255) NOT NULL UNIQUE,
  `terminal` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255)
);

CREATE TABLE farispley_dm_scanning.L_articulos (
  `id`  int NOT NULL UNIQUE  PRIMARY KEY AUTO_INCREMENT,
  `id_mnad_articulos` int,
  `mna` varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  FOREIGN KEY (mna) REFERENCES farispley_dm_scanning.H_mnad_tipo_articulos(mna),
  FOREIGN KEY (id_mnad_articulos) REFERENCES farispley_dm_scanning.H_mnad_articulos(id_mnad_articulos)
);

CREATE TABLE farispley_dm_scanning.S_mnad_articulos (
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
  FOREIGN KEY (id_hub) REFERENCES farispley_dm_scanning.H_mnad_articulos(id)

);

CREATE TABLE farispley_dm_scanning.S_mnad_tipo_articulos (
  `id`  int NOT NULL UNIQUE AUTO_INCREMENT,
  `id_hub`  int NOT NULL UNIQUE ,
  `descrip`  varchar(255),
  `tipo_cotizacion`  varchar(255),
  `terminal`  varchar(255),
  `load_timestamp` timestamp,
  `record_source` varchar(255),
  PRIMARY KEY (`id`, `load_timestamp`),
  FOREIGN KEY (id_hub) REFERENCES farispley_dm_scanning.H_mnad_tipo_articulos(id)

);
