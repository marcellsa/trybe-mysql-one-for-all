SELECT 
	COUNT(h.musica_id) AS quantidade_musicas_no_historico
FROM
  historico_reproducao AS h
INNER JOIN
	usuario AS u ON u.usuario_id = h.usuario_id
WHERE u.usuario_nome = 'Barbara Liskov';