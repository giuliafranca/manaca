-- Tabela Cliente
INSERT INTO tb_cliente VALUES (nextval('sq_cliente'), 'Anthony Edward Stark', '234.654.872-21', 'Rico13', 'stark@gmail.com');
INSERT INTO tb_cliente VALUES (nextval('sq_cliente'), 'Robert Pattinson', '164.832.567-01', 'Bella', 'pattinson.10@hotmail.com');

-- Tabela Container
INSERT INTO tb_container VALUES(nextval('sq_container'), 1, 'Rua das Rosas', '#0000FF', 45.5, 1, 60, 25.3, 60.8, 50, 50);
INSERT INTO tb_container VALUES(nextval('sq_container'), 1, 'Rua das Pedras', '#FFFF00', 35.5, 1, 50, 25.3, 57.8, 60, 60);

-- Tabela Vegetal
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Tomate', 25, '#F0E68C', 65, 20, 1, 80, 60);
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Alface', 15, '#FF8C00', 80, 30, 2, 60, 45);
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Hortelã-grosso', 18, '#8B0000', 75, 10, 1, 90, 30);
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Espinafre', 17, '#FFD93B', 78, 60, 3, 75, 30);
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Acelga', 17, '#FF4030', 55, 40, 1, 90, 33);
INSERT INTO tb_vegetal VALUES (nextval('sq_vegetal'), 'Cebolinha', 22, '#FE9200', 80, 30, 2, 85, 40);

INSERT INTO tb_plantado VALUES (nextval('sq_plantado'), 3, 1);
INSERT INTO tb_plantado VALUES (nextval('sq_plantado'), 4, 2);
