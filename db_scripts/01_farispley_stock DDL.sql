-- STOCK TABLES CREATION:

CREATE TABLE farispley_stock.mnld_stock_fisico (
  `id_stock` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `descrip` varchar(255),
  `apto` varchar(255),
  `usuario` varchar(255),
  `terminal` varchar(255),
  `ts` timestamp
);

CREATE TABLE farispley_stock.mnad_articulos (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_articulo` int,
  `id_numero` int,
  `mna` varchar(255),
  `sect_secc` int,
  `usuario` varchar(255),
  `terminal` varchar(255),
  `ts` timestamp,
  `codigo_sap` int
);

CREATE TABLE farispley_stock.mnad_tipo_articulos (
  `mna` varchar(255) PRIMARY KEY,
  `descrip` varchar(255),
  `tipo_cotizacion` varchar(255),
  `terminal` varchar(255),
  `usuario` varchar(255),
  `ts` timestamp
);

CREATE TABLE farispley_stock.sipd_stocks (
  `idb` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id` int UNIQUE NOT NULL,
  `scanning` int,
  `uxb` int,
  `id_stock` int,
  `cant_stock` int,
  `unidades` int,
  `usuario` varchar(255),
  `terminal` varchar(255),
  `ts` timestamp
);

ALTER TABLE farispley_stock.mnad_articulos ADD FOREIGN KEY (mna) REFERENCES farispley_stock.mnad_tipo_articulos (mna);

ALTER TABLE farispley_stock.sipd_stocks ADD FOREIGN KEY (id_stock) REFERENCES farispley_stock.mnld_stock_fisico (id_stock);

ALTER TABLE farispley_stock.mnad_articulos ADD FOREIGN KEY (id) REFERENCES farispley_stock.sipd_stocks (id);
