-- Sendo M o seu número de matrícula e utilizando a estrutura do banco de dados no arquivo hotel.sql, escreva um comando select para responder cada questão com resultado formatado conforme exemplificado:

-- 1) Caso M%7 seja:
-- 	0: Quartos desocupados no último domingo
-- 	1: Quartos desocupados na última segunda-feira
-- 	2: Quartos desocupados na última terça-feira
-- 	3: Quartos desocupados na última quarta-feira
-- 	4: Quartos desocupados na última quinta-feira
-- 	5: Quartos desocupados na última sexta-feira
-- 	6: Quartos desocupados no último sábado 


-- andar | quarto
-- ------+-------
-- 1     | 101
-- 1     | 102


-- quartos desocupados na ultima quinta-feira

WITH quinta AS
(
  SELECT
  CURRENT_DATE - (
    CASE EXTRACT(DOW FROM CURRENT_DATE)
      WHEN 0 THEN '3 DAYS'
      WHEN 1 THEN '4 DAYS'
      WHEN 2 THEN '5 DAYS'
      WHEN 3 THEN '6 DAYS'
      WHEN 4 THEN '0 DAYS'
      WHEN 5 THEN '1 DAYS'
      WHEN 6 THEN '2 DAYS'
      END 
  )::INTERVAL AS quinta_passada
)
SELECT quarto.andar, quarto.quarto FROM hospedagem
JOIN quarto ON hospedagem.quarto = quarto.codigo

EXCEPT

SELECT quarto.andar, quarto.quarto FROM hospedagem
JOIN quarto ON hospedagem.quarto = quarto.codigo
CROSS JOIN quinta
WHERE quinta_passada::DATE BETWEEN hospedagem.entrada AND hospedagem.saida;