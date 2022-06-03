DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
    artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_artista(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    ana_lancamento INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancao(
    cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(50) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, cancao_id, data_reproducao),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (tipo, valor)
VALUES
  ('gratuito', 0),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO SpotifyClone.usuario (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 4),
  ('Bill', 20, 2),
  ('Roger', 45, 3),
  ('Norman', 58, 3),
  ('Patrick', 33, 4),
  ('Vivian', 26, 2),
  ('Carol', 19, 2),
  ('Angelina', 42, 4),
  ('Paul', 46, 4);

INSERT INTO SpotifyClone.artista (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');


INSERT INTO SpotifyClone.usuario_artista (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.album (album, ana_lancamento, artista_id)
VALUES
  ('Envious', 1990, 1),
  ('Exuberant', 1993, 1),
  ('Hallowed Steam', 1995, 2),
  ('Incandescent', 1998, 3),
  ('Temporary Culture', 2001, 4),
  ('Library of liberty', 2003, 4),
  ('Chained Down', 2007, 5),
  ('Cabinet of fools', 2012, 5),
  ('No guarantees', 2015, 5),
  ('Apparatus', 2015, 6);


INSERT INTO SpotifyClone.cancao (cancao, duracao_segundos, album_id)
VALUES
  ('Soul For Us', 200, 1),
  ('Reflections Of Magic', 163, 1),
  ('Dance With Her Own', 116, 1),
  ('Troubles Of My Inner Fire', 203, 2),
  ('Time Fireworks', 152, 2),
  ('Magic Circus', 105, 3),
  ('Honey, So Do I', 207, 3),
  ("Sweetie, Let's Go Wild", 139, 3),
  ('She Knows', 244, 3),
  ('Fantasy For Me', 100, 4)     ,
  ('Celebration Of More', 146, 4),
  ('Rock His Everything', 223, 4),
  ('Home Forever', 231, 4),
  ('Diamond Power', 241, 4),
  ("Let's Be Silly", 132, 4),
  ('Thang Of Thunder', 240, 5),
  ('Words Of Her Life', 185, 5),
  ('Without My Streets', 176, 5),
  ('Need Of The Evening', 190, 6),
  ('History Of My Roses', 222, 6),
  ('Without My Love', 111, 6),
  ('Walking And Game', 123, 6),
  ('Young And Father', 197, 6),
  ('Finding My Traditions', 179, 7),
  ('Walking And Man', 229, 7),
  ('Hard And Time', 135, 7),
  ("Honey, I'm A Lone Wolf", 150, 7),
  ("She Thinks I Won't Stay Tonight", 166, 8),
  ("He Heard You're Bad For Me", 154, 8),
  ("He Hopes We Can't Stay", 210, 8),
  ('I Know I Know', 117, 8),
  ("He's Walking Away", 159, 9),
  ("He's Trouble", 138, 9),
  ('I Heard I Want To Bo Alone', 120, 9),
  ('I Ride Alone', 151, 9),
  ('Honey', 79, 10),
  ('You Cheated On Me', 95, 10),
  ("Wouldn't It Be Nice", 213, 10),
  ('Baby', 136, 10),
  ('You Make Me Feel So..', 83, 10);


INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id)
VALUES
  (1, 36),
  (1, 25),
  (1, 23),
  (1, 14),
  (1, 15),
  (2, 34),
  (2, 24),
  (2, 21),
  (2, 39),
  (3, 6),
  (3, 3),
  (3, 26),
  (4, 2),
  (4, 35),
  (4, 27),
  (5, 7),
  (5, 12),
  (5, 14),
  (5, 1),
  (6, 38),
  (6, 29),
  (6, 30),
  (6, 22),
  (7, 5),
  (7, 4),
  (7, 11),
  (8, 39),
  (8, 40),
  (8, 32),
  (8, 33),
  (9, 16),
  (9, 17),
  (9, 8),
  (9, 9),
  (10, 20),
  (10, 21),
  (10, 12),
  (10, 13);




