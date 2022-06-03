SELECT 
	MIN(p.valor) as faturamento_minimo,
    MAX(p.valor) as faturamento_maximo,
    ROUND(AVG(p.valor), 2) as faturamento_medio,
    SUM(p.valor) as faturamento_total
FROM SpotifyClone.usuario as u
INNER JOIN SpotifyClone.plano as p
ON u.plano_id = p.plano_id;