-- Objetivo:
--   Implementar el primer JOIN del proyecto para relacionar datos 
--   de productos con estándares externos de salud.
--
-- Valor de negocio:
--   Permite realizar auditorías de cumplimiento (compliance) automatizadas,
--   identificando qué productos superan los límites legales establecidos
--   por organismos reguladores.

WITH estandares_oms AS (
  -- Creamos una tabla virtual con los límites máximos permitidos
  SELECT 'BEBIDAS' as cat_std, 5 as limite_azucar_oms UNION ALL
  SELECT 'LACTEOS', 8 UNION ALL
  SELECT 'SNACKS', 10 UNION ALL
  SELECT 'CEREALES', 12
)

SELECT 
    a.nombre_producto, 
    a.categoria, 
    a.azucares_100g,
    e.limite_azucar_oms,
    -- Comparamos la tabla A con la tabla E:
    CASE 
        WHEN a.azucares_100g > e.limite_azucar_oms THEN '⚠️ EXCEDE LÍMITE'
        ELSE '✅ DENTRO DE NORMA'
    END AS estatus_oms
FROM `nutricion-ar.datos_nutricionales.alimentos` AS a
-- El puente entre ambas tablas:
INNER JOIN estandares_oms AS e ON UPPER(a.categoria) = e.cat_std
ORDER BY a.azucares_100g DESC;

--"Implementación de INNER JOIN y lógica relacional para validación de estándares nutricionales"--
