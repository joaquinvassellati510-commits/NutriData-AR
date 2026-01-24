
  -- OBJETIVO: Crear un semáforo lógico basado en la composición del alimento


SELECT 
    nombre_producto,
    marca,
    sodio_100g,
    azucares_100g,
    -- Iniciamos la lógica del semáforo:
    CASE 
        WHEN sodio_100g > 400 OR azucares_100g > 15 THEN '🔴 ALTO RIESGO'
        WHEN sodio_100g > 200 OR azucares_100g > 8 THEN '🟡 RIESGO MEDIO'
        ELSE '🟢 BAJO RIESGO'
    END AS nivel_riesgo_nutricional
FROM nutricion-ar.datos_nutricionales.alimentos
ORDER BY nivel_riesgo_nutricional ASC;
