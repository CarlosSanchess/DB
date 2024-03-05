PRAGMA foreign_keys = ON;

INSERT INTO Pessoa (NIC, Nome, Data_de_Nascimento, Nacionalidade, Morada, Contacto)
VALUES
('510123456', 'Vinícius Rui', '1995-01-01', 'Brasileira', 'Rua A, nº 123', '+55 11 98765-4321'),
('721987654', 'Maria Oliveira', '1990-02-02', 'Portuguesa', 'Avenida B, nº 456', '+351 91 234 5678'),
('890654321', 'Alejandro Rodríguez', '1985-03-03', 'Espanhola', 'Travessa C, nº 789', '+34 678 901 234'),
('632145789', 'Olivier Dubois', '1980-04-04', 'Francesa', 'Largo D, nº 1011', '+33 123 456 789'),
('456789012', 'Marco Leclerc', '1975-05-05', 'Italiana', 'Praça E, nº 1213', '+39 345 678 9012'),
('987231456', 'Lena Müller', '1970-06-06', 'Alemã', 'Rua F, nº 1415', '+49 876 543 2109'),
('345678901', 'Emily Johnson', '1965-07-07', 'Inglesa', 'Avenida G, nº 1617', '+44 7654 321098'),
('876543210', 'Lars van der Berg', '1960-08-08', 'Holandesa', 'Travessa H, nº 1819', '+31 234 567 890'),
('159357246', 'Elise Dupont', '1955-09-09', 'Belga', 'Rua I, nº 2021', '+32 987 654 321'),
('234567890', 'Dmitri Sokolov', '1950-10-10', 'Russa', 'Avenida J, nº 2223', '+7 910 202-0202'),
('876543219', 'Zhang Liu', '1995-11-11', 'Chinesa', 'Rua K, nº 2425', '+86 132 4567-8901'),
('543219876', 'Hiroshi Tanaka', '1990-12-12', 'Japonesa', 'Avenida L, nº 2627', '+81 90-1234-5678'),
('102938475', 'Priya Singh', '1985-01-13', 'Indiana', 'Travessa M, nº 2829', '+91 87654-3210'),
('657483920', 'Jack Harris', '1980-02-14', 'Australiana', 'Largo N, nº 3031', '+61 4321-0987'),
('987654321', 'Emma Davis', '1975-03-15', 'Canadense', 'Praça O, nº 3233', '+1 555-1234'),
('314159267', 'Sofia Hernandez', '1970-04-16', 'Mexicana', 'Rua P, nº 3435', '+52 9876-543210'),
('987654123', 'Diego Ramirez', '1965-05-17', 'Argentina', 'Avenida Q, nº 3637', '+54 9 11-8765-4321'),
('876509123', 'Pablo Silva', '1960-06-18', 'Chilena', 'Travessa R, nº 3839', '+56 9 9876-5432'),
('123890456', 'Nandi Smit', '1955-07-19', 'Sul-Africana', 'Rua S, nº 4041', '+27 82 345 6789'),
('456721809', 'Erik Lindberg', '1950-08-20', 'Sueca', 'Avenida T, nº 4243', '+46 70-123 45 67');

INSERT INTO Funcionario (NIC, IdFuncionario)
VALUES
  ('510123456', 1),
  ('721987654', 2),
  ('890654321', 3),
  ('632145789', 4),
  ('456789012', 5),
  ('987231456', 6),
  ('345678901', 7),
  ('876543210', 8),
  ('159357246', 9),
  ('234567890', 10);

INSERT INTO Hospede (NIC)
VALUES
  ('876543219'),
  ('543219876'),
  ('102938475'),
  ('657483920'),
  ('987654321'),
  ('314159267'),
  ('987654123'),
  ('876509123'),
  ('123890456'),
  ('456721809');

INSERT INTO TipoQuarto (IdTipo, Ocupacao_Maxima, Preco_quarto)
VALUES
  (1, 2, 100.00),
  (2, 4, 150.00),
  (3, 3, 120.00),
  (4, 2, 80.00);

INSERT INTO Quarto (Numero, Ocupado, IdTipo)
VALUES
  (101, 0, 1),
  (102, 0, 2),
  (103, 1, 3),
  (104, 0, 4),
  (105, 1, 1),
  (106, 0, 2),
  (107, 1, 3),
  (108, 0, 4),
  (109, 0, 1),
  (110, 1, 2);

INSERT INTO Reserva (IDreserva, DataReserva, NIC, IdTipo)
VALUES
  (1, '2023-01-10', '876543219', 1),
  (2, '2023-02-15', '543219876', 2),
  (3, '2023-03-20', '102938475', 3),
  (4, '2023-04-05', '657483920', 4),
  (5, '2023-05-12', '987654321', 1),
  (6, '2023-06-18', '314159267', 2),
  (7, '2023-07-01', '987654123', 3),
  (8, '2023-08-10', '876509123', 4),
  (9, '2023-09-22', '123890456', 1),
  (10, '2023-10-05', '456721809', 2);

INSERT INTO Estadia (IDreserva, Data_check_in, Data_check_out, Numero)
VALUES
  (1, '2023-02-01', '2023-02-05', 101),
  (2, '2023-03-10', '2023-03-15', 102),
  (3, '2023-04-01', '2023-04-07', 103),
  (4, '2023-05-08', '2023-05-15', 104),
  (5, '2023-06-20', '2023-06-25', 105),
  (6, '2023-07-05', '2023-07-12', 106),
  (7, '2023-08-15', '2023-08-22', 107),
  (8, '2023-09-25', '2023-10-02', 108),
  (9, '2023-10-10', '2023-10-15', 109),
  (10, '2023-11-01', '2023-11-10', 110);

INSERT INTO Avaliacao (IDreserva, Avaliacao, Comentario)
VALUES
  (1, 4, 'Ótima estadia!'),
  (2, 5, 'Serviço excelente'),
  (3, 3, 'Quarto limpo, mas barulhento'),
  (4, 4, 'Staff muito atencioso'),
  (5, 5, 'Localização perfeita'),
  (6, 4, 'Boa experiência no geral'),
  (7, 3, 'Comida do restaurante poderia ser melhor'),
  (8, 5, 'Recomendo!'),
  (9, 4, 'Boa relação custo-benefício'),
  (10, 5, 'Adorei o hotel e o serviço');
  
INSERT INTO HotelStaff (IdFuncionario, CargoHotel, Idiomas)
VALUES
  (1, 'Recepcionista', 'Português, Inglês'),
  (2, 'Gerente de Operações', 'Português, Espanhol'),
  (3, 'Concierge', 'Português, Inglês'),
  (4, 'Camareira', 'Português'),
  (5, 'Segurança', 'Português, Francês'),
  (6, 'Manutenção', 'Português, Inglês'),
  (7, 'Atendimento ao Cliente', 'Português, Espanhol'),
  (8, 'Cozinheiro Chefe', 'Português, Italiano'),
  (9, 'Barman', 'Português, Inglês'),
  (10, 'Limpeza', 'Português');
  
INSERT INTO RestauranteStaff (IdFuncionario, CargoRestaurante)
VALUES
  (1, 'Chef de Cozinha'),
  (2, 'Porteiro'),
  (3, 'Garçom'),
  (4, 'Auxiliar de Limpeza'),
  (6, 'Chefe de Manutenção'),
  (7, 'Atendente de Reservas'),
  (8, 'Cozinheiro'),
  (9, 'Barista'),
  (10,'Garçom');

INSERT INTO ServicoRestaurante (idServicoRestaurante, Menu, HorarioAbertura, HorarioFecho)
VALUES
  (1, 'Menu Executivo', '12:00:00', '15:00:00'),
  (2, 'Menu Degustação', '18:00:00', '22:00:00'),
  (3, 'À la carte', '12:00:00', '23:00:00'),
  (4, 'Menu Infantil', '11:00:00', '20:00:00');

INSERT INTO ContaRestaurante (IdConta, Valor, idServicoRestaurante, IDreserva)
VALUES
  (1, 120.50, 1, 1),
  (2, 200.00, 2, 2),
  (3, 80.00, 3, 3),
  (4, 150.00, 4, 4),
  (5, 90.00, 1, 5),
  (6, 130.00, 2, 6),
  (7, 75.00, 3, 7),
  (8, 180.00, 4, 8),
  (9, 100.00, 1, 9),
  (10, 160.00, 2, 10);

INSERT INTO Pagamento (IDreserva, DataPagamento, MetodoPagamento, Valor_total)
VALUES
  (1, '2023-02-05', 'Cartão de Crédito', 120.50),
  (2, '2023-03-15', 'Dinheiro', 200.00),
  (3, '2023-04-07', 'Cartão de Débito', 80.00),
  (4, '2023-05-15', 'Transferência Bancária', 150.00),
  (5, '2023-06-25', 'Cartão de Crédito', 90.00),
  (6, '2023-07-12', 'Dinheiro', 130.00),
  (7, '2023-08-22', 'Cartão de Débito', 75.00),
  (8, '2023-10-02', 'Transferência Bancária', 180.00),
  (9, '2023-10-15', 'Cartão de Crédito', 100.00),
  (10, '2023-11-10', 'Dinheiro', 160.00);
