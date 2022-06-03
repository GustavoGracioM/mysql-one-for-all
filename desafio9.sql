SELECT 
  COUNT(*) as quantidade_musicas_no_historico 
FROM SpotifyClone.historico_reproducao as h
INNER JOIN SpotifyClone.usuario as u
ON h.usuario_id = u.usuario_id
WHERE u.usuario = 'Bill';