DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS ContaRestaurante;
DROP TABLE IF EXISTS ServicoRestaurante;
DROP TABLE IF EXISTS RestauranteStaff;
DROP TABLE IF EXISTS HotelStaff;
DROP TABLE IF EXISTS Avaliacao;
DROP TABLE IF EXISTS Contrato;
DROP TABLE IF EXISTS Estadia;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Quarto;
DROP TABLE IF EXISTS TipoQuarto;
DROP TABLE IF EXISTS Hospede;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Pessoa;


CREATE TABLE Pessoa (
  NIC STRING PRIMARY KEY NOT NULL UNIQUE CHECK (LENGTH(NIC) = 9) ,
  Nome STRING NOT NULL,
  Data_de_Nascimento DATE NOT NULL,
  Nacionalidade STRING NOT NULL,
  Morada STRING NOT NULL,
  Contacto STRING NOT NULL UNIQUE CHECK (LENGTH(Contacto) >= 10)
);
CREATE TABLE Funcionario(
  NIC INTEGER PRIMARY KEY , 
   IdFuncionario INTEGER UNIQUE,
  FOREIGN KEY(NIC) REFERENCES Pessoa(NIC)
);

CREATE TABLE Hospede(
  NIC INTEGER PRIMARY KEY, 
  FOREIGN KEY(NIC) REFERENCES Pessoa(NIC)
);

CREATE TABLE TipoQuarto(
  IdTipo INTEGER PRIMARY KEY, 
  Ocupacao_Maxima INTEGER, 
  Preco_quarto REAL
);

CREATE TABLE Quarto(
  Numero INTEGER PRIMARY KEY, 
  Ocupado BOOLEAN CHECK (Ocupado IN (0, 1)),
  IdTipo INTEGER,
  FOREIGN KEY(IdTipo) REFERENCES TipoQuarto(IdTipo)
);

CREATE TABLE Reserva(
  IDreserva INTEGER PRIMARY KEY, 
  DataReserva DATE , 
  NIC INTEGER,
  IdTipo INTEGER,
  FOREIGN KEY(NIC) REFERENCES Hospede(NIC),
  FOREIGN KEY(IdTipo) REFERENCES TipoQuarto(IdTipo)
);

CREATE TABLE Estadia(
  IDreserva INTEGER PRIMARY KEY, 
  Data_check_in DATE, 
  Data_check_out DATE CHECK (Data_check_out >= Data_check_in),
  Numero INTEGER,
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva),
  FOREIGN KEY(Numero) REFERENCES Quarto(Numero)
);

CREATE TABLE Contrato (
  IdFuncionario INTEGER PRIMARY KEY, 
  Full_time BOOLEAN, 
  Dias_de_Trabalho INTEGER, 
  Salario REAL CHECK ((Full_time = 1 AND Salario >= 760) OR Salario >= 0), 
  Data_inicio_contrato DATE, 
  Data_fim_contrato DATE CHECK (Data_fim_contrato > Data_inicio_contrato),
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE Avaliacao(
  IDreserva INTEGER PRIMARY KEY, 
  Avaliacao INTEGER CHECK (Avaliacao >= 0 AND Avaliacao <= 5), 
  Comentario STRING,
  FOREIGN KEY(IDreserva) REFERENCES Estadia(IDreserva)
); 

CREATE TABLE HotelStaff(
  IdFuncionario INTEGER PRIMARY KEY, 
  CargoHotel STRING NOT NULL, 
  Idiomas STRING,
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE RestauranteStaff(
  IdFuncionario INTEGER PRIMARY KEY, 
  CargoRestaurante STRING NOT NULL, 
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);


CREATE TABLE ServicoRestaurante(
  idServicoRestaurante INTEGER PRIMARY KEY, 
  Menu STRING, 
  HorarioAbertura TIME,
  HorarioFecho TIME
);

CREATE TABLE ContaRestaurante(
  IdConta INTEGER PRIMARY KEY, 
  Valor REAL, 
  idServicoRestaurante INTEGER,
  
  IDreserva INTEGER,
  FOREIGN KEY(idServicoRestaurante) REFERENCES ServicoRestaurante(idServicoRestaurante),
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva)
);

CREATE TABLE Pagamento(
  IDreserva INTEGER PRIMARY KEY, 
  DataPagamento DATE, 
  MetodoPagamento STRING, 
  Valor_total REAL,
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva)
);
