SELECT 
	u.usuario,
    IF(YEAR(MAX(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') as condicao_usuario
FROM SpotifyClone.historico_reproducao as h
INNER JOIN SpotifyClone.usuario as u 
ON h.usuario_id = u.usuario_id
GROUP BY u.usuario
ORDER BY u.usuario;