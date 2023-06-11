CREATE TABLE desafiobtg.cliente (
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL
);

CREATE TABLE desafiobtg.produto (
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE desafiobtg.pedido (
  codigo_pedido BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codigo_cliente BIGINT NOT NULL,
  data_hora_pedido DATETIME DEFAULT NOW(),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente(id)
);

CREATE TABLE desafiobtg.item_pedido (
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codigo_pedido BIGINT NOT NULL,
  codigo_produto BIGINT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
  FOREIGN KEY (codigo_produto) REFERENCES produto(id)
);

INSERT INTO `desafiobtg`.`cliente` (`id`, `nome`) VALUES ('1', 'Caio Abreu de Azevedo');

INSERT INTO `desafiobtg`.`produto` (`id`, `nome`, `preco`) VALUES ('1', 'Lápis', '1.10');
INSERT INTO `desafiobtg`.`produto` (`id`, `nome`, `preco`) VALUES ('2', 'Caneta', '2.30');
INSERT INTO `desafiobtg`.`produto` (`id`, `nome`, `preco`) VALUES ('3', 'Borracha', '1.80');
INSERT INTO `desafiobtg`.`produto` (`id`, `nome`, `preco`) VALUES ('4', 'Caderno', '8.70');

INSERT INTO `desafiobtg`.`pedido` (`codigo_pedido`, `codigo_cliente`) VALUES ('1', '1');
INSERT INTO `desafiobtg`.`pedido` (`codigo_pedido`, `codigo_cliente`) VALUES ('2', '1');
INSERT INTO `desafiobtg`.`pedido` (`codigo_pedido`, `codigo_cliente`) VALUES ('3', '1');

INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('1', '1', '1', '10');
INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('2', '1', '3', '2');
INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('3', '2', '2', '4');
INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('4', '2', '4', '1');
INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('5', '3', '2', '2');
INSERT INTO `desafiobtg`.`item_pedido` (`id`, `codigo_pedido`, `codigo_produto`, `quantidade`) VALUES ('6', '3', '1', '8');