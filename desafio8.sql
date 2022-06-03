SELECT 
  ar.nome as artista, 
  al.album 
FROM SpotifyClone.album as al
INNER JOIN SpotifyClone.artista as ar
ON al.artista_id = ar.artista_id
WHERE ar.nome = 'Walter Phoenix'
ORDER BY al.album;
