-- 06) Qual o ranking da quantidade de comandas por dia da semana no mês passado?

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
ORDER BY comandas DESC;