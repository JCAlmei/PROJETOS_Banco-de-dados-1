-- Criação do banco de dados
CREATE DATABASE MeuBancoDeDados;

-- Uso do banco de dados criado
USE MeuBancoDeDados;

-- Criação da tabela 'Usuarios'
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    PRIMARY KEY(ID)
);

-- Criação da tabela 'Pedidos'
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT,
    UsuarioID INT,
    Produto VARCHAR(100),
    Quantidade INT,
    PRIMARY KEY(PedidoID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Criação do trigger
DELIMITER $$
CREATE TRIGGER pedido_apos_insercao
AFTER INSERT
ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(100);
    SET msg = CONCAT('Novo pedido adicionado com o ID: ', NEW.PedidoID);
    SELECT msg AS 'Status';
END$$
DELIMITER ;
