-- Objetivo:
--   Realizar un "Gap Analysis" (Análisis de brechas) utilizando LEFT JOIN
--   para identificar productos o categorías que no poseen estándares
--   nutricionales definidos en la tabla de referencia.
--
-- Valor de negocio:
--   Permite detectar áreas del mercado no reguladas o falta de datos
--   en el catálogo, asegurando que ningún producto quede fuera de la 
--   auditoría por errores de categorización o vacíos legales.

WITH estandares_oms AS (
  -- Supongamos que solo tenemos límites para estas 3 categorías:
  SELECT 'BEBIDAS' as cat_std, 5 as limite_azucar_oms UNION ALL
  SELECT 'LACTEOS', 8 UNION ALL
  SELECT 'SNACKS', 10
)

SELECT 
    a.nombre_producto, 
    a.categoria, 
    e.limite_azucar_oms,
    -- Detectamos el vacío:
    CASE 
        WHEN e.limite_azucar_oms IS NULL THEN '⚠️ SIN ESTÁNDAR DEFINIDO'
        ELSE '✅ CATEGORÍA REGULADA'
    END AS estado_regulacion
FROM `nutricion-ar.datos_nutricionales.alimentos` AS a
-- LEFT JOIN: No borra nada de la tabla de la izquierda (alimentos)
LEFT JOIN estandares_oms AS e ON UPPER(a.categoria) = e.cat_std
ORDER BY estado_regulacion DESC;

--"Detección de inconsistencias y vacíos de datos mediante lógica de LEFT JOIN"--
