-- 01) Quantas pizzas de tamanho grande ou família foram pedidas pela comanda 235?

SELECT COUNT(*) as quantidade
FROM pizza
WHERE 
  tamanho = 'G'
  AND
  comanda = 235;
