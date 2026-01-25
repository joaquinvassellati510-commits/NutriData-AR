-- Objetivo:
--   Generar un ranking de marcas según la cantidad de productos
--   clasificados como Alto Riesgo nutricional.

-- Valor de negocio:
--   Permite análisis competitivo, evaluación de proveedores
--   y soporte para estrategias de reformulación o compliance.

-- Definición:
--   Producto "Alto Riesgo" = sodio > 400 mg OR azúcar > 15 g por 100 g


SELECT 
    marca, 
    COUNT(*) as total_productos_rojos
FROM nutricion-ar.datos_nutricionales.alimentos
-- Filtramos usando la lógica de "Riesgo Alto" (Sodio > 400 o Azúcar > 15)
WHERE (sodio_100g > 400 OR azucares_100g > 15)
GROUP BY marca
ORDER BY total_productos_rojos DESC
LIMIT 10;
