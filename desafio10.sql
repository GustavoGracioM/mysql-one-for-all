SELECT 
  c.cancao as nome, 
  COUNT(*) as reproducoes 
FROM SpotifyClone.historico_reproducao as h
INNER JOIN SpotifyClone.usuario as u
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.plano as p 
ON u.plano_id = p.plano_id
INNER JOIN SpotifyClone.cancao as c
ON h.cancao_id = c.cancao_id
WHERE p.tipo = 'gratuito' OR p.tipo = 'pessoal'
GROUP BY c.cancao
ORDER BY c.cancao;
