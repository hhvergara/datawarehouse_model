-- HUB TABLES

INSERT INTO farispley_stock_dw.H_stock_fisico (id_stock, terminal, load_timestamp, record_source)
SELECT id_stock, terminal, NOW(), 'farispley_stock.mnld_stock_fisico'
FROM farispley_stock.mnld_stock_fisico;

INSERT INTO farispley_stock_dw.H_sipd_stocks (idb, terminal, load_timestamp, record_source)
SELECT idb, terminal, NOW(), 'farispley_stock.sipd_stocks'
FROM farispley_stock.sipd_stocks;

INSERT INTO farispley_stock_dw.H_mnad_articulos (id_mnad_articulos, terminal, load_timestamp, record_source)
SELECT id, terminal, NOW(), 'farispley_stock.mnad_articulos'
FROM farispley_stock.mnad_articulos;

INSERT INTO farispley_stock_dw.H_mnad_tipo_articulos (mna, terminal, load_timestamp, record_source)
SELECT mna, terminal, NOW(), 'farispley_stock.mnad_tipo_articulos'
FROM farispley_stock.mnad_tipo_articulos;

-- LINK TABLES

INSERT INTO farispley_stock_dw.L_stock (id_stock, idb, load_timestamp, record_source)
SELECT 
    stock_fisico.id_stock,
    sipd_stocks.idb,
    NOW(),
    'farispley_stock.mnld_stock_fisico, farispley_stock.sipd_stocks'
FROM farispley_stock_dw.H_stock_fisico stock_fisico
JOIN farispley_stock_dw.H_sipd_stocks sipd_stocks ON stock_fisico.id = sipd_stocks.id;


INSERT INTO farispley_stock_dw.L_stock_articulos (idb, id_mnad_articulos, load_timestamp, record_source)
SELECT 
    sipd_stocks.idb,
    mnad_articulos.id_mnad_articulos,
    NOW(),
    'farispley_stock.mnld_stock_fisico, farispley_stock.sipd_stocks'
FROM farispley_stock_dw.H_sipd_stocks sipd_stocks
JOIN farispley_stock_dw.H_mnad_articulos mnad_articulos ON mnad_articulos.id = sipd_stocks.id;

INSERT INTO farispley_stock_dw.L_articulos (id_mnad_articulos, mna, load_timestamp, record_source)
SELECT 
    mnad_articulos.id_mnad_articulos,
    mnad_tipo_articulos.mna,
    NOW(),
    'farispley_stock.mnld_stock_fisico, farispley_stock.sipd_stocks'
FROM farispley_stock_dw.H_mnad_articulos mnad_articulos
JOIN farispley_stock_dw.H_mnad_tipo_articulos mnad_tipo_articulos ON mnad_tipo_articulos.id = mnad_articulos.id;

-- SAT TABLES

INSERT INTO farispley_stock_dw.S_stock_fisico (id_hub, descrip, apto, terminal, load_timestamp, record_source)
SELECT
	stock_dw.id AS id_hub,
	stock.descrip,
	stock.apto,
	stock.terminal,
	NOW(),
	'farispley_stock.mnld_stock_fisico'
FROM
	farispley_stock.mnld_stock_fisico stock
JOIN farispley_stock_dw.H_stock_fisico stock_dw ON stock_dw.id_stock = stock.id_stock;

INSERT INTO farispley_stock_dw.S_sipd_stocks (id_hub, scanning, uxb, cant_stock, unidades, terminal, load_timestamp, record_source)
SELECT
	stock_dw.id AS id_hub,
	stock.scanning,
	stock.uxb,
	stock.cant_stock,
	stock.unidades,
	stock.terminal,
	NOW(),
	'farispley_stock.sipd_stocks'
FROM
	farispley_stock.sipd_stocks stock
JOIN farispley_stock_dw.H_sipd_stocks stock_dw ON stock_dw.idb = stock.idb;


INSERT INTO farispley_stock_dw.S_mnad_articulos (id_hub, id_articulo, id_numero, mna, sect_secc, terminal, load_timestamp, record_source)
SELECT
	articulos_dw.id AS id_hub,
	articulos.id_articulo,
	articulos.id_numero,
	articulos.mna,
	articulos.sect_secc,
	articulos.terminal,
	NOW(),
	'farispley_stock.mnad_articulos'
FROM
	farispley_stock.mnad_articulos articulos
JOIN farispley_stock_dw.H_mnad_articulos articulos_dw ON articulos_dw.id_mnad_articulos = articulos.id;


INSERT INTO farispley_stock_dw.S_mnad_tipo_articulos (id_hub, descrip, tipo_cotizacion, terminal, load_timestamp, record_source)
SELECT
	articulos_dw.id AS id_hub,
	t_articulos.descrip,
	t_articulos.tipo_cotizacion,
	t_articulos.terminal,
	NOW(),
	'farispley_stock.mnad_tipo_articulos'
FROM
	farispley_stock.mnad_tipo_articulos t_articulos
JOIN farispley_stock_dw.H_mnad_tipo_articulos articulos_dw ON articulos_dw.mna = t_articulos.mna;


