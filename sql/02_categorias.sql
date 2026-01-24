Objetivo:
--   Generar métricas base del mercado alimentario:
--   - Promedio de azúcar por categoría
--   - Promedio de sodio por categoría
--   - Conteo de productos por tipo

-- Valor de negocio:
--   Permite identificar categorías críticas y establecer KPIs
--   para dashboards ejecutivos y control de calidad.

SELECT categoria, COUNT(*) as total_productos
FROM `nutricion-ar.datos_nutricionales.alimentos`
GROUP BY categoria
ORDER BY total_productos DESC

--Misión 2: El promedio de azúcar por marca
--Acá vamos a detectar qué marcas son más "dulces" en promedio.

SELECT marca, AVG(azucares_100g) as promedio_azucar
FROM `nutricion-ar.datos_nutricionales.alimentos`
GROUP BY marca
ORDER BY promedio_azucar DESC

--Misión 3: Máximos y mínimos de energía
--Para encontrar los extremos nutricionales en tu base de datos.
SELECT categoria, 
       MAX(energia_100g) as max_calorias, 
       MIN(energia_100g) as min_calorias
FROM `nutricion-ar.datos_nutricionales.alimentos`
GROUP BY categoria
