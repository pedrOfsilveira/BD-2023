-- 04) Quantos sabores doces possuem mais de 8 ingredientes?

WITH sabor_ingrediente AS (
  SELECT sabor.nome AS nome_sabor,
   COUNT(ingrediente) AS quantidade
  FROM sabor
  JOIN saboringrediente ON saboringrediente.sabor = sabor.codigo
  GROUP BY sabor.nome
),
doces AS (
  SELECT nome AS nome_sabor
  FROM sabor
  WHERE tipo = 3
)
SELECT *
FROM sabor_ingrediente
JOIN doces ON doces.nome_sabor = sabor_ingrediente.nome_sabor
WHERE sabor_ingrediente.quantidade > 8;