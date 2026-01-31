-- Objetivo: Generar indicadores clave (KPIs) de salud pública
-- Valor de negocio: Provee una foto estadística inmediata para la toma de decisiones.

SELECT 
    -- 1. Magnitud del Riesgo: Porcentaje de productos con sello ROJO
    ROUND(COUNTIF(nivel_riesgo = '🔴 ALTO') * 100.0 / COUNT(*), 2) as porcentaje_alto_riesgo,
    
    -- 2. Incumplimiento OMS: Cantidad total de infractores legales
    COUNTIF(cumplimiento_oms = 'EXCEDE') as total_productos_excedidos,
    
    -- 3. Referente Saludable: Promedio de azúcar de los que SÍ cumplen
    ROUND(AVG(IF(cumplimiento_oms = 'CUMPLE', azucares_100g, NULL)), 2) as promedio_azucar_saludable
    
FROM `nutricion-ar.datos_nutricionales.vw_auditoria_consolidada`;
