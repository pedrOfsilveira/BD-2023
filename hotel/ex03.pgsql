-- 3) UFs com as 2+(M%2) maiores quantidades de hospedagens nos últimos 1+(M%3) semestres
-- * semestres de 01/01 a 30/06 e de 01/07 a 31/12

-- UF | hospedagens
-- ---+------------
-- RS | 100
-- SC | 90

SELECT tmp.uf AS uf, COUNT(*) AS hospedagens
FROM
(
  WITH semestres AS (
    SELECT 
      CASE 
        WHEN EXTRACT('MONTH' FROM CURRENT_DATE) < 7
        THEN ((EXTRACT('YEAR' FROM CURRENT_DATE) - 1) || '-01-01')::DATE

        WHEN EXTRACT('MONTH' FROM CURRENT_DATE) >= 7
        THEN ((EXTRACT('YEAR' FROM CURRENT_DATE) - 1) || '-07-01')::DATE
      END inicio,
      CASE 
        WHEN EXTRACT('MONTH' FROM CURRENT_DATE) < 7
        THEN (EXTRACT('YEAR' FROM CURRENT_DATE) || '-01-01')::DATE

        WHEN EXTRACT('MONTH' FROM CURRENT_DATE) >= 7
        THEN (EXTRACT('YEAR' FROM CURRENT_DATE) || '-07-01')::DATE
      END fim
  )
  SELECT hospedagem.entrada, hospedagem.saida, cliente.uf
  FROM hospedagem
  JOIN cliente ON hospedagem.cliente = cliente.cpf
  CROSS JOIN semestres
  WHERE 
  cliente.uf <> ''
  AND 
  (
    (hospedagem.entrada BETWEEN semestres.inicio AND semestres.fim)
    OR 
    (hospedagem.saida BETWEEN semestres.inicio AND semestres.fim)
  )
) AS tmp
GROUP BY tmp.uf
ORDER BY hospedagens DESC
LIMIT 2;