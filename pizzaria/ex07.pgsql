-- 07) Quais dias da semana tiveram menos de 20 comandas no mês passado?

SELECT *
FROM (
  SELECT
    TO_CHAR(data, 'FMDay') AS dia,
    COUNT(*) as comandas
  FROM comanda
  WHERE 
    data BETWEEN
      DATE_TRUNC('MONTH', CURRENT_DATE) - INTERVAL '1 MONTH'
      AND
      DATE_TRUNC('MONTH', CURRENT_DATE) - INTERVAL '1 DAY'
  GROUP BY dia
  ORDER BY comandas DESC
) 
WHERE comandas < 20;