SELECT 
	ar.artista_nome AS artista,
  al.album_titulo AS album
FROM
  artista AS ar
INNER JOIN
	album AS al ON ar.artista_id = al.artista_id
WHERE ar.artista_nome = 'Elis Regina'
ORDER BY album;