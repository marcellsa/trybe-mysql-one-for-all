SELECT 
	m.musica_titulo AS nome,
  COUNT(h.usuario_id) AS reproducoes
FROM
  musica AS m
INNER JOIN
	historico_reproducao AS h ON m.musica_id = h.musica_id
INNER JOIN
	usuario AS u ON h.usuario_id = u.usuario_id
INNER JOIN
	plano AS p ON p.plano_id = u.plano_id
WHERE p.assinatura = 'gratuito' OR p.assinatura = 'pessoal'
GROUP BY nome
ORDER BY nome;