select * from cliente

-- Criando a tabela cliente --
CREATE TABLE Cliente (
    Cod_cliente serial PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    CPF VARCHAR(11),
    Email VARCHAR(255),
    Telefone VARCHAR(15)
);

-- Criando a tabela pedido --
CREATE TABLE Pedido (
    Cod_pedido serial PRIMARY KEY,
    Data DATE,
    Valor_pedido DECIMAL(10,2),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(Cod_cliente)
);

-- Criando a tabela comentário --
CREATE TABLE Comentarios (
   Cod_pedido int,
   Cod_cliente int,
   FOREIGN KEY(Cod_pedido) REFERENCES Pedido(Cod_pedido),
   FOREIGN KEY(Cod_cliente) REFERENCES Cliente(Cod_cliente)
);

ALTER TABLE Comentarios
ADD comentario varchar (250);

SELECT * from Comentarios

-- Criando a tabela estoque --
CREATE TABLE Estoque (
   Cod_livro serial PRIMARY KEY,
   Quantidade INT
);

-- Criando a tabela livros --
CREATE TABLE Livros (
   Titulo VARCHAR(255),
   Nome_livro VARCHAR(255),
   Categoria VARCHAR(255),
   Valor DECIMAL(10,2),
   idEstoque INT,
   FOREIGN KEY(idEstoque) REFERENCES Estoque(Cod_livro)
);

-- Criando a tabela itensPedido --
CREATE TABLE ItensPedido (
  Cod_livro int,
  Cod_pedido int,
  FOREIGN KEY(Cod_livro) REFERENCES Estoque(Cod_livro),
  FOREIGN KEY(Cod_pedido) REFERENCES Pedido(Cod_pedido)
);

-- Populando a tabela Cliente
INSERT INTO Cliente (Nome, Endereco, CPF, Email, Telefone) VALUES
('João Silva', 'Rua das Flores, 123', '12345678901', 'joao.silva@email.com', '11987654321'),
('Maria Santos', 'Avenida do Sol, 456', '98765432100', 'maria.santos@email.com', '11912345678'),
('Carlos Pereira', 'Rua das Pedras, 789', '11223344556', 'carlos.pereira@email.com', '11923456789'),
('Ana Souza', 'Avenida do Mar, 321', '9988776655', 'ana.souza@email.com', '11934567890'),
('Pedro Costa', 'Rua das Estrelas, 654', '5544332211', 'pedro.costa@email.com', '11945678901');

-- Populando a tabela Estoque
INSERT INTO Estoque (Cod_livro, Quantidade) VALUES
(1, 10),
(2, null),
(3, 8),
(4, 6),
(5, null);

-- Verificando a tabala estoque --
SELECT * from estoque

-- Adicionando uma coluna ID na tabela Estoque --
ALTER TABLE Estoque
ADD id serial primary key;

-- Populando a tabela Livros --
INSERT INTO Livros (Titulo, Nome_livro, Categoria, Valor, idEstoque) VALUES
('O Senhor dos Anéis', 'A Sociedade do Anel', 'Fantasia', 49.90, 1),
('Harry Potter', 'A Pedra Filosofal', 'Fantasia', 39.90, 2),
('Dom Casmurro', 'Machado de Assis', 'Literatura Brasileira', 29.90, 3),
('1984', 'George Orwell', 'Ficção Científica', 34.90, 4),
('O Alquimista', 'Paulo Coelho', 'Romance', 19.90, 5);

-- Verificando a tabela Livros --
SELECT * from livros

-- Populando a tabela Pedido --
INSERT INTO Pedido (Data, Valor_pedido, idCliente) VALUES
('2024-02-07', 49.90, 1),
('2024-02-08', 39.90, 2),
('2024-02-09', 29.90, 3),
('2024-02-11', 19.90, 5);

-- Verificando a tabela Pedido --
SELECT * from pedido

-- Populando a tabela ItensPedido --
INSERT INTO ItensPedido (Cod_livro, Cod_pedido) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- verificando a tabela ItensPedido
SELECT * from itenspedido

-- Verificando o uso correto da palavra chave WHERE --
SELECT * FROM itenspedido
WHERE cod_pedido = 4;

-- Alterando o valor da coluna Cod_livro na linha 4 --
UPDATE ItensPedido
SET Cod_livro = 5
WHERE id = 4;

-- Adicionando uma coluna id na tabela ItensPedido --
ALTER TABLE ItensPedido
ADD id serial primary key;

-- Populando a tabela Comentario
INSERT INTO Comentarios (Cod_pedido, Cod_cliente, comentario) VALUES
(1, 1,'A Sociedade do Anel me levou a uma aventura incrível desde a primeira página. A riqueza dos detalhes e a profundidade dos personagens são impressionantes. Recomendo fortemente para todos os amantes de fantasia.'),
(2, 2, 'A Pedra Filosofal foi uma leitura mágica. J.K. Rowling criou um mundo que é ao mesmo tempo maravilhosamente imaginativo e profundamente relatable. Mal posso esperar para ler o próximo livro da série!'),
(3, 3, 'Dom Casmurro é uma obra-prima da literatura brasileira. A escrita de Machado de Assis é elegante e perspicaz, e a história é ao mesmo tempo engraçada e trágica. Um livro que vale a pena ler e reler.'),
(4, 5, 'O Alquimista é um livro inspirador que me fez refletir sobre meus próprios sonhos e aspirações. A história é simples, mas a mensagem é profunda. Um livro que todos deveriam ler pelo menos uma vez na vida.');

-- Verificando a tabela Comentarios --
SELECT * from comentarios


-- APLICANDO MÉTODOS DE VERIFICAÇÃO DE REGISTROS --

-- INNER JOIN: Retorna registros que têm valores correspondentes em 
--ambas as tabelas. --
SELECT Cliente.Nome, Pedido.Data
FROM Cliente
INNER JOIN Pedido ON Cliente.Cod_cliente = Pedido.idCliente;

-- LEFT JOIN (ou LEFT OUTER JOIN): Retorna todos os registros da tabela à esquerda, 
--e os registros correspondentes da tabela à direita. O resultado é NULL na tabela à 
--direita para as linhas sem correspondência. --
SELECT Cliente.Nome, Pedido.Data
FROM Cliente
LEFT JOIN Pedido ON Cliente.Cod_cliente = Pedido.idCliente;

-- RIGHT JOIN (ou RIGHT OUTER JOIN): Retorna todos os registros da tabela à direita, 
--e os registros correspondentes da tabela à esquerda. O resultado é NULL na tabela 
--à esquerda para as linhas sem correspondência. --
SELECT Estoque.Quantidade, Livros.idestoque
FROM Estoque
RIGHT JOIN Livros ON Estoque.cod_livro = Livros.idEstoque;

-- FULL OUTER JOIN (ou FULL JOIN): Retorna todos os registros quando há 
--uma correspondência na tabela à esquerda ou na tabela à 
--direita. --
SELECT Livros.idestoque, Estoque.Quantidade
FROM Livros
FULL OUTER JOIN Estoque ON Livros.idEstoque = Estoque.cod_livro;


-- Exemplos de  funções SQL --

-- COUNT(): Esta função retorna o número de linhas que correspondem a um critério especificado. --
SELECT COUNT(*) 
FROM Cliente;
-- Este comando conta o número total de clientes. --

-- SUM(): Esta função retorna a soma total de uma coluna numérica. --
SELECT SUM(Valor_pedido) 
FROM Pedido;
-- Este comando retorna o valor total de todos os pedidos. --

-- AVG(): Esta função retorna a média dos valores em uma coluna numérica.-- 
SELECT AVG(Valor_pedido) 
FROM Pedido;


-- Função SQL que retorna o total de pedidos de um cliente específico. Esta função é escrita 
--em PL/pgSQL, a linguagem procedural do PostgreSQL:
CREATE OR REPLACE FUNCTION total_pedidos(p_idCliente INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM Pedido
    WHERE idCliente = p_idCliente;

    RETURN total;
END; $$
LANGUAGE plpgsql;

SELECT total_pedidos(2);