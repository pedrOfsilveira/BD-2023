-- 2) Mês do ano com a maior quantidade de reservas nos últimos 2 anos

-- mes       |  reservas
-- ----------+----------
-- fevereiro |  1000

SELECT
CASE 
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '1' THEN 'janeiro'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '2' THEN 'fevereiro'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '3' THEN 'março'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '4' THEN 'abril'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '5' THEN 'maio'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '6' THEN 'junho'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '7' THEN 'julho'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '8' THEN 'agosto'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '9' THEN 'setembro'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '10' THEN 'outubro'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '11' THEN 'novembro'
  WHEN EXTRACT('MONTH' FROM tmp.mes_serie) = '12' THEN 'dezembro'
END mes,
COUNT(*) AS quantidade
FROM 
(
  SELECT
    generate_series(
      date_trunc('MONTH', inicio),
      date_trunc('MONTH', fim),
      '1 MONTH'::INTERVAL
    ) AS mes_serie
  FROM reserva
  WHERE EXTRACT(YEAR FROM inicio) >= EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '2 YEARS')
) AS tmp
GROUP BY mes
ORDER BY quantidade DESC
LIMIT 1;