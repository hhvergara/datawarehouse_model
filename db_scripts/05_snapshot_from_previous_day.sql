-- ** REEMPLACE LOS CAMPOS DATE PARA FILTRAR POR DIA DESEADO

-- ** REEMPLACE LOS mna PARA EL OPERADOR "IN" PARA FILTRAR POR ARTICULO,
--    COMENTELO PARA TRAER LA LISTA COMPLETA DE ARTICULOS

SELECT
    sma.mna,
    ssf.cant_stock AS total_stock
FROM farispley_stock_dw.S_sipd_stocks ssf
LEFT JOIN farispley_stock_dw.S_mnad_articulos sma
ON ssf.id_hub = sma.id_hub
WHERE
    DATE(ssf.load_timestamp) = '2024-09-17'
    AND sma.mna IN ('mna_01', 'mna_02')
    AND ssf.load_timestamp = (
        SELECT MAX(s2.load_timestamp)
        FROM farispley_stock_dw.S_sipd_stocks s2
        WHERE s2.id_hub = ssf.id_hub
        AND DATE(s2.load_timestamp) = '2024-09-17'
    )
ORDER BY sma.mna;