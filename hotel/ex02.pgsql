-- 2) Mês do ano com a maior quantidade de reservas nos últimos 2 anos

-- mes       |  reservas
-- ----------+----------
-- fevereiro |  1000

WITH reservas_por_mes AS (
  SELECT
    generate_series(
      date_trunc('MONTH', inicio),
      date_trunc('MONTH', fim),
      '1 MONTH'::INTERVAL
    ) AS mes_serie,
    COUNT(*) AS reservas
  FROM reserva
  WHERE EXTRACT(YEAR FROM inicio) >= EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '2 YEARS')
  GROUP BY mes_serie
)
SELECT
  TO_CHAR(mes_serie, 'FMMonth') AS mes,
  reservas
FROM reservas_por_mes
WHERE reservas = (SELECT MAX(reservas) FROM reservas_por_mes);
