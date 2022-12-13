DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  USE SpotifyClone;

  CREATE TABLE plano(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      assinatura VARCHAR(100) NOT NULL,
      valor DECIMAL(5,2) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE usuario(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario_nome VARCHAR(100) NOT NULL,
      usuario_idade INT NOT NULL,
      data_assinatura DATE NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;

  CREATE TABLE artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_nome VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_titulo VARCHAR(100) NOT NULL,
      lancamento INT NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;

  CREATE TABLE musica(
      musica_id INT PRIMARY KEY AUTO_INCREMENT,
      musica_titulo VARCHAR(100) NOT NULL,
      duracao INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album(album_id)
  ) engine = InnoDB;

  CREATE TABLE seguindo_artista(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;

  CREATE TABLE historico_reproducao(
      data_reproducao DATETIME NOT NULL,
      usuario_id INT NOT NULL,
      musica_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
  ) engine = InnoDB;

  INSERT INTO plano (assinatura, valor)
  VALUES
    ('gratuito', 0),
    ('universitario', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO usuario (usuario_nome, usuario_idade, data_assinatura, plano_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4),
    ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2),
    ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3),
    ('Jorge Amado', 58, '2017-02-17', 3);

  INSERT INTO artista (artista_nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO album (album_titulo, lancamento, artista_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

INSERT INTO musica (musica_titulo, ducarcao, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 2),
    ('Como Nossos Pais', 105, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 3),
    ('Samba em Paris', 267, 4),
    ('The Bard’s Song', 244, 5),
    ('Feeling Good', 100, 6);

INSERT INTO seguindo_artista (usuario_id , artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 1),
    (10, 2);

INSERT INTO historico_reproducao (data_reproducao, usuario_id , musica_id)
  VALUES
    ('2022-02-28 10:45:55', 1, 8),
    ('2020-05-02 05:30:35', 1, 2),
    ('2020-03-06 11:22:33', 1, 10),
    ('2022-08-05 08:05:17', 2, 10),
    ('2020-01-02 07:40:33', 2, 7),
    ('2020-11-13 16:55:13', 3, 10),
    ('2020-12-05 18:38:30', 3, 2),
    ('2021-08-15 17:10:10', 4, 8),
    ('2022-01-09 01:44:33', 5, 8),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 6, 7),
    ('2017-10-12 12:35:20', 6, 1),
    ('2011-12-15 22:30:49', 7, 4),
    ('2012-03-17 14:56:41', 8, 4),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 10, 3);