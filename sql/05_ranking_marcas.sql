--Análisis de concentración de riesgo por marca.
--Auditoría de Marcas con Mayor Riesgo Nutricional
SELECT 
    marca, 
    COUNT(*) as total_productos_rojos
FROM nutricion-ar.datos_nutricionales.alimentos
-- Filtramos usando la lógica de "Riesgo Alto" (Sodio > 400 o Azúcar > 15)
WHERE (sodio_100g > 400 OR azucares_100g > 15)
GROUP BY marca
ORDER BY total_productos_rojos DESC
LIMIT 10;
