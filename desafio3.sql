SELECT 
	u.usuario_nome AS usuario,
	COUNT(h.musica_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(m.duracao / 60), 2) AS total_minutos
FROM
	usuario AS u
INNER JOIN
	historico_reproducao as h ON u.usuario_id = h.usuario_id
INNER JOIN
	musica AS m ON m.musica_id = h.musica_id
GROUP BY usuario
ORDER BY usuario;