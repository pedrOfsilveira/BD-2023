-- 02) Qual a quantidade de comandas não pagas na última semana?

WITH semana AS (
  SELECT
    CURRENT_DATE - (EXTRACT(DOW FROM CURRENT_DATE) ||'DAYS')::INTERVAL - INTERVAL '7 DAYS' AS inicio,
    CURRENT_DATE - (EXTRACT(DOW FROM CURRENT_DATE) ||'DAYS')::INTERVAL - INTERVAL '1 DAY' AS fim
)
SELECT *
FROM comanda
CROSS JOIN semana
WHERE 
  pago = 'f'
  AND
  data BETWEEN semana.inicio AND semana.fim;