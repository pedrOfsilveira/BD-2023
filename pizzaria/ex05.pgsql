-- 05) Quais dias tiveram mais de 10 comandas nos últimos 15 dias?

SELECT data, COUNT(*) AS quantidade
FROM comanda
GROUP BY data
HAVING
  (
    data BETWEEN 
      CURRENT_DATE - INTERVAL '15 DAYS' 
      AND 
      CURRENT_DATE
  )
  AND COUNT(*) > 10;
