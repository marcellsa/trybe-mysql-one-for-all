SELECT
    (SELECT COUNT(musica_titulo) FROM musica) AS "cancoes",
    (SELECT COUNT(artista_nome) FROM artista) AS "artistas",
    (SELECT COUNT(album_titulo) FROM album) AS "albuns";