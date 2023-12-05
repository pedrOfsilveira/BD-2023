  -- 18) Qual sabor tem menos ingredientes?

WITH sabor_ingredientes AS (
  SELECT sabor.nome, count(*) AS ingredientes
  FROM saboringrediente
  JOIN sabor ON saboringrediente.sabor = sabor.codigo
  GROUP BY sabor.nome
)
SELECT nome, ingredientes
FROM sabor_ingredientes
WHERE ingredientes = (SELECT min(ingredientes) FROM sabor_ingredientes);

