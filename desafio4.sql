SELECT 
	u.usuario_nome AS usuario,
	IF(MAX(YEAR(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
	usuario AS u
INNER JOIN
	historico_reproducao AS h ON u.usuario_id = h.usuario_id
GROUP BY usuario
ORDER BY usuario;