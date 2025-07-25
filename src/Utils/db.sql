-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS instagram_api;
USE instagram_api;

-- Tabela: Usuario
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    bio VARCHAR(255),
    foto VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela: Post
CREATE TABLE Post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    foto VARCHAR(255) NOT NULL,
    legenda VARCHAR(255),
    localizacao VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE
);

-- Tabela: Comentario
CREATE TABLE Comentario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    post_id INT NOT NULL,
    conteudo VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Post(id) ON DELETE CASCADE
);

-- Tabela: Curtida
CREATE TABLE Curtida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    post_id INT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Post(id) ON DELETE CASCADE,
    UNIQUE KEY unica_curtida (usuario_id, post_id) -- Garante que o mesmo usuário não curta o mesmo post mais de uma vez
);
