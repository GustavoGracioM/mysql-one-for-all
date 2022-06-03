SELECT 
  ar.nome as artista, 
  al.album, 
  COUNT(al.album) as seguidores 
FROM SpotifyClone.album as al
INNER JOIN SpotifyClone.artista as ar
ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.usuario_artista as ua
ON ua.artista_id = ar.artista_id
GROUP BY al.album, ar.nome
ORDER BY seguidores desc, ar.nome, al.album;