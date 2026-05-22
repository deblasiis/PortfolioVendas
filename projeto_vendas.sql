-- Script de Criação do Banco de Dados de Vendas (E-commerce/Varejo)
-- Dados fictícios

CREATE DATABASE IF NOT EXISTS bd_vendas_portfolio;
USE bd_vendas_portfolio;

CREATE TABLE IF NOT EXISTS dim_vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(100) NOT NULL,
    equipe VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dim_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    estado CHAR(2)
);

CREATE TABLE IF NOT EXISTS fato_vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_vendedor INT,
    id_produto INT,
    id_cliente INT,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_vendedor) REFERENCES dim_vendedores(id_vendedor),
    FOREIGN KEY (id_produto) REFERENCES dim_produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES dim_clientes(id_cliente)
);

INSERT INTO dim_vendedores (nome_vendedor, equipe) VALUES
('Ana Silva', 'Sudeste'),
('Bruno Costa', 'Sul'),
('Carlos Souza', 'Sudeste'),
('Diana Lima', 'Nordeste');

INSERT INTO dim_produtos (nome_produto, categoria, preco_unitario) VALUES
('Mouse Sem Fio', 'Periféricos', 120.00),
('Teclado Mecânico', 'Periféricos', 350.00),
('Monitor 24" Gaming', 'Hardware', 1200.00),
('Headset Bluetooth', 'Acessórios', 250.00),
('Notebook Ryzen 7', 'Hardware', 4500.00),
('Cabo HDMI 2.0', 'Acessórios', 45.00);

INSERT INTO dim_clientes (nome_cliente, cidade, estado) VALUES
('João Rodrigues', 'Campinas', 'SP'),
('Maria Oliveira', 'São Paulo', 'SP'),
('Pedro Santos', 'Curitiba', 'PR'),
('Lucas Almeida', 'Salvador', 'BA'),
('Juliana Costa', 'Santos', 'SP');

INSERT INTO fato_vendas (data_venda, id_vendedor, id_produto, id_cliente, quantity, valor_total) VALUES
('2026-01-10', 1, 1, 1, 2, 240.00),
('2026-01-15', 2, 5, 3, 1, 4500.00),
('2026-02-02', 3, 3, 2, 1, 1200.00),
('2026-02-20', 4, 2, 4, 3, 1050.00),
('2026-03-05', 1, 4, 5, 2, 500.00),
('2026-03-12', 3, 6, 1, 5, 225.00),
('2026-04-01', 2, 3, 3, 2, 2400.00),
('2026-04-18', 4, 5, 4, 1, 4500.00),
('2026-05-02', 1, 2, 2, 1, 350.00),
('2026-05-10', 3, 1, 5, 4, 480.00);

USE bd_vendas_portfolio;

-- Refazendo, porque aparece inexistente
INSERT INTO dim_vendedores (nome_vendedor, equipe) VALUES
('Ana Silva', 'Sudeste'),
('Bruno Costa', 'Sul'),
('Carlos Souza', 'Sudeste'),
('Diana Lima', 'Nordeste')
ON DUPLICATE KEY UPDATE nome_vendedor=nome_vendedor;

INSERT INTO dim_produtos (nome_produto, categoria, preco_unitario) VALUES
('Mouse Sem Fio', 'Periféricos', 120.00),
('Teclado Mecânico', 'Periféricos', 350.00),
('Monitor 24" Gaming', 'Hardware', 1200.00),
('Headset Bluetooth', 'Acessórios', 250.00),
('Notebook Ryzen 7', 'Hardware', 4500.00),
('Cabo HDMI 2.0', 'Acessórios', 45.00)
ON DUPLICATE KEY UPDATE nome_produto=nome_produto;

INSERT INTO dim_clientes (nome_cliente, cidade, estado) VALUES
('João Rodrigues', 'Campinas', 'SP'),
('Maria Oliveira', 'São Paulo', 'SP'),
('Pedro Santos', 'Curitiba', 'PR'),
('Lucas Almeida', 'Salvador', 'BA'),
('Juliana Costa', 'Santos', 'SP')
ON DUPLICATE KEY UPDATE nome_cliente=nome_cliente;

INSERT INTO fato_vendas (data_venda, id_vendedor, id_produto, id_cliente, quantidade, valor_total) VALUES
('2026-01-10', 1, 1, 1, 2, 240.00),
('2026-01-15', 2, 5, 3, 1, 4500.00),
('2026-02-02', 3, 3, 2, 1, 1200.00),
('2026-02-20', 4, 2, 4, 3, 1050.00),
('2026-03-05', 1, 4, 5, 2, 500.00),
('2026-03-12', 3, 6, 1, 5, 225.00),
('2026-04-01', 2, 3, 3, 2, 2400.00),
('2026-04-18', 4, 5, 4, 1, 4500.00),
('2026-05-02', 1, 2, 2, 1, 350.00),
('2026-05-10', 3, 1, 5, 4, 480.00);

COMMIT;

select * from fato_vendas;
