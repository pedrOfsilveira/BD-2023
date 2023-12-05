-- 08) Qual o ranking dos sabores mais pedidos nos últimos 15 dias?


-- SELECT sabor, COUNT(*) as quantidade
-- FROM pizzasabor
-- GROUP BY sabor
-- ORDER BY quantidade DESC;

SELECT sabor.nome, COUNT(*) AS quantidade
FROM pizza
JOIN comanda ON comanda.numero = pizza.comanda
JOIN pizzasabor ON pizzasabor.pizza = pizza.codigo
JOIN sabor ON sabor.codigo = pizzasabor.sabor
WHERE 
  data BETWEEN
    CURRENT_DATE - INTERVAL '15 DAYS'
    AND 
    CURRENT_DATE
GROUP BY sabor.nome
ORDER BY quantidade DESC;