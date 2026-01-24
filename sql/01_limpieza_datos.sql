--Ver solo una categoría
--Sirve para comparar productos similares.

SELECT nombre_producto, marca, azucares_100g
FROM `nutricion-ar.datos_nutricionales.alimentos`
WHERE LOWER(categoria) = 'bebidas'


--Identificar exceso de azúcar
SELECT *
FROM `nutricion-ar.datos_nutricionales.alimentos`
WHERE azucares_100g > 10
ORDER BY azucares_100g DESC

--Filtros combinados (La lupa del nutricionista)
--Busquemos productos que sean críticos tanto en sodio como en sellos.

SELECT nombre_producto, sodio_100g, cantidad_sellos
FROM `nutricion-ar.datos_nutricionales.alimentos`
WHERE sodio_100g > 400 OR cantidad_sellos > 2
