
INSERT INTO `db_9solutions`.`faixa_etaria` (`faixa_nome`, `limite_inferior`, `limite_superior`)
VALUES
('Criança', 2, 5),
('Pré-Adolescente', 6, 10),
('Adolescente', 11, 15);

INSERT INTO `db_9solutions`.`status_pedido` (`id_status_pedido`, `status`)
VALUES
(1, 'Pendente'),
(2, 'Processando'),
(3, 'Enviado'),
(4, 'Entregue'),
(5, 'Cancelado');

INSERT INTO `db_9solutions`.`categoria_produto` (`nome`)
VALUES
('Itens Diversos'),
('Uso Pessoal'),
('Higiene Pessoal'),
('Brinquedo'),
('Doces'),
('Material Escolar');

INSERT INTO `db_9solutions`.`status_caixa` (`id_status_caixa`, `status`)
VALUES
(1, 'Aberto'),
(2, 'Fechado'),
(3, 'Em Contagem'),
(4, 'Revisão'),
(5, 'Aprovado');


INSERT INTO `db_9solutions`.`produto` (`nome`, `valor`, `genero`, `ativo`, `fk_categoria_produto`, `fk_faixa_etaria`)
VALUES
('Camiseta', 29.99, 'F', 1, 2, 2),
('Laptop', 150.00, 'F', 1, 1, 3),
('Livro de Ficção', 19.99, 'M', 1, 6, 3),
('Bicicleta Infantil', 300.00, 'M', 1, 5, 1),
('Creme Hidratante', 25.50, 'F', 1, 6, 3),
('Carrinho de Controle Remoto', 50.00, 'M', 1, 5, 1),
('Balas', 1.00, 'F', 1, 4, 3);

alter table etapa_caixa
add column id_etapa_caixa int not null primary key auto_increment;



