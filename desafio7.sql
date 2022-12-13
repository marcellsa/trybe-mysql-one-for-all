SELECT 
	ar.artista_nome AS artista,
  al.album_titulo AS album,
	COUNT(s.usuario_id) AS seguidores
FROM
  artista AS ar
INNER JOIN
	album AS al ON ar.artista_id = al.artista_id
INNER JOIN
	seguindo_artista AS s ON ar.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;