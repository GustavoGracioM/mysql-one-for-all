SELECT 
  c.cancao,
  COUNT(c.cancao) as reproducoes 
FROM SpotifyClone.historico_reproducao as h
INNER JOIN SpotifyClone.cancao as c
ON h.cancao_id = c.cancao_id
GROUP BY c.cancao
ORDER BY reproducoes DESC, c.cancao
LIMIT 2;