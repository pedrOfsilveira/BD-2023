-- 03) Qual a quantidade média de ingredientes por sabor?

SELECT ROUND(AVG(tmp.ingredientes), 2) AS media
FROM (
  SELECT sabor, COUNT(*) AS ingredientes
  FROM saboringrediente
  GROUP BY sabor
) as tmp;
