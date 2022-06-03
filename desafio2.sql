SELECT 
  COUNT(DISTINCT ca.cancao_id) as cancoes,
  COUNT(DISTINCT ar.artista_id) as artistas,
  COUNT(DISTINCT ab.album_id) as albuns
FROM SpotifyClone.cancao as ca
INNER JOIN SpotifyClone.album as ab
ON ca.album_id = ab.album_id
INNER JOIN SpotifyClone.artista as ar
ON ab.artista_id = ar.artista_id;
