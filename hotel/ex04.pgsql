-- 4) Percentual de clientes que se hospedaram 2 ou mais vezes no último ano

-- percentual
-- ----------
-- 15.35%

WITH total AS (
  SELECT COUNT(DISTINCT cliente) AS clientes
  FROM hospedagem
  WHERE 
    EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 YEAR') 
    BETWEEN 
      EXTRACT(YEAR FROM entrada)
      AND
      EXTRACT(YEAR FROM saida)
), 
favoravel AS (
  SELECT COUNT(DISTINCT cliente) as clientes_recorrentes
  FROM (
    SELECT cliente
    FROM hospedagem
    WHERE 
      EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 YEAR') 
      BETWEEN 
        EXTRACT(YEAR FROM entrada)
        AND
        EXTRACT(YEAR FROM saida)
    GROUP BY cliente
    HAVING COUNT(*) >= 2
  ) AS tmp
)
SELECT ROUND((favoravel.clientes_recorrentes::NUMERIC / total.clientes::NUMERIC * 100), 2) || '%' AS percentual
FROM total
CROSS JOIN favoravel;
