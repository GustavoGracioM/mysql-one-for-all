SELECT 
  COUNT(h.usuario_id) as qtde_musicas_ouvidas,
	u.usuario,
	ROUND(SUM(c.duracao_segundos) / 60, 2) as total_minutos
FROM SpotifyClone.historico_reproducao as h
INNER JOIN SpotifyClone.usuario as u
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancao as c
ON h.cancao_id = c.cancao_id
GROUP BY h.usuario_id
ORDER BY u.usuario;