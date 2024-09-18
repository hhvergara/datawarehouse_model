-- 1. Insertar en mnld_stock_fisico (tabla relacionada por id_stock)
INSERT INTO farispley_stock.mnld_stock_fisico (id_stock, descrip, apto, usuario, terminal, ts)
VALUES
(1, 'Stock físico 1', 'Apto 1', 'user1', 'terminal1', '2024-09-10 10:00:00'),
(2, 'Stock físico 2', 'Apto 2', 'user2', 'terminal2', '2024-09-11 11:30:00'),
(3, 'Stock físico 3', 'Apto 3', 'user3', 'terminal3', '2024-09-12 09:00:00'),
(4, 'Stock físico 4', 'Apto 4', 'user4', 'terminal4', '2024-09-13 14:45:00'),
(5, 'Stock físico 5', 'Apto 5', 'user5', 'terminal5', '2024-09-14 08:20:00');

-- 2. Insertar en mnad_tipo_articulos (mna es clave primaria y será referenciada)
INSERT INTO farispley_stock.mnad_tipo_articulos (mna, descrip, tipo_cotizacion, terminal, usuario, ts)
VALUES
('mna_01', 'Artículo tipo 1', 'Cotización tipo 1', 'terminal1', 'user1', '2024-09-10 10:00:00'),
('mna_02', 'Artículo tipo 2', 'Cotización tipo 2', 'terminal2', 'user2', '2024-09-11 11:30:00'),
('mna_03', 'Artículo tipo 3', 'Cotización tipo 3', 'terminal3', 'user3', '2024-09-12 09:00:00'),
('mna_04', 'Artículo tipo 4', 'Cotización tipo 4', 'terminal4', 'user4', '2024-09-13 14:45:00'),
('mna_05', 'Artículo tipo 5', 'Cotización tipo 5', 'terminal5', 'user5', '2024-09-14 08:20:00');

-- 3. Insertar en sipd_stocks (tabla relacionada por id_stock, id es UNIQUE y será referenciado en mnad_articulos)
INSERT INTO farispley_stock.sipd_stocks (id, scanning, uxb, id_stock, cant_stock, unidades, usuario, terminal, ts)
VALUES
(101, 1, 20, 1, 500, 10, 'user1', 'terminal1', '2024-09-10 10:00:00'),
(102, 0, 30, 2, 300, 15, 'user2', 'terminal2', '2024-09-11 11:30:00'),
(103, 1, 40, 3, 700, 20, 'user3', 'terminal3', '2024-09-12 09:00:00'),
(104, 0, 50, 4, 200, 5, 'user4', 'terminal4', '2024-09-13 14:45:00'),
(105, 1, 60, 5, 600, 12, 'user5', 'terminal5', '2024-09-14 08:20:00');

-- 4. Insertar en mnad_articulos (usando id de sipd_stocks y mna de mnad_tipo_articulos)
INSERT INTO farispley_stock.mnad_articulos (id_articulo, id_numero, mna, sect_secc, usuario, terminal, ts, codigo_sap, id)
VALUES
(201, 1001, 'mna_01', 11, 'user1', 'terminal1', '2024-09-10 10:00:00', 50001, 101),
(202, 1002, 'mna_02', 12, 'user2', 'terminal2', '2024-09-11 11:30:00', 50002, 102),
(203, 1003, 'mna_03', 13, 'user3', 'terminal3', '2024-09-12 09:00:00', 50003, 103),
(204, 1004, 'mna_04', 14, 'user4', 'terminal4', '2024-09-13 14:45:00', 50004, 104),
(205, 1005, 'mna_05', 15, 'user5', 'terminal5', '2024-09-14 08:20:00', 50005, 105);
