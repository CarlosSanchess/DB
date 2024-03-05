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
   IdFuncionario INTEGER UNIQUE NOT NULL,
  FOREIGN KEY(NIC) REFERENCES Pessoa(NIC)
);

CREATE TABLE Hospede(
  NIC INTEGER PRIMARY KEY, 
  FOREIGN KEY(NIC) REFERENCES Pessoa(NIC)
);

CREATE TABLE TipoQuarto(
  IdTipo INTEGER PRIMARY KEY, 
  Ocupacao_Maxima INTEGER NOT NULL, 
  Preco_quarto REAL NOT NULL
);

CREATE TABLE Quarto(
  Numero INTEGER PRIMARY KEY NOT NULL, 
  Ocupado BOOLEAN CHECK (Ocupado IN (0, 1)),
  IdTipo INTEGER NOT NULL,
  FOREIGN KEY(IdTipo) REFERENCES TipoQuarto(IdTipo)
);

CREATE TABLE Reserva(
  IDreserva INTEGER PRIMARY KEY NOT NULL, 
  DataReserva DATE NOT NULL , 
  NIC INTEGER,
  IdTipo INTEGER NOT NULL ,
  FOREIGN KEY(NIC) REFERENCES Hospede(NIC),
  FOREIGN KEY(IdTipo) REFERENCES TipoQuarto(IdTipo)
);

CREATE TABLE Estadia(
  IDreserva INTEGER PRIMARY KEY NOT NULL, 
  Data_check_in DATE NOT NULL, 
  Data_check_out DATE NOT NULL CHECK (Data_check_out >= Data_check_in),
  Numero INTEGER NOT NULL,
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva),
  FOREIGN KEY(Numero) REFERENCES Quarto(Numero)
);

CREATE TABLE Contrato (
  IdFuncionario INTEGER PRIMARY KEY NOT NULL, 
  Full_time BOOLEAN NOT NULL , 
  Dias_de_Trabalho INTEGER NOT NULL, 
  Salario REAL NOT NULL CHECK ((Full_time = 1 AND Salario >= 760) OR Salario >= 0), 
  Data_inicio_contrato DATE NOT NULL, 
  Data_fim_contrato DATE NOT NULL CHECK (Data_fim_contrato > Data_inicio_contrato),
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE Avaliacao(
  IDreserva INTEGER NOT NULL PRIMARY KEY, 
  Avaliacao INTEGER NOT NULL CHECK (Avaliacao >= 0 AND Avaliacao <= 5), 
  Comentario STRING,
  FOREIGN KEY(IDreserva) REFERENCES Estadia(IDreserva)
); 

CREATE TABLE HotelStaff(
  IdFuncionario INTEGER NOT NULL PRIMARY KEY, 
  CargoHotel STRING NOT NULL, 
  Idiomas STRING,
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);

CREATE TABLE RestauranteStaff(
  IdFuncionario INTEGER NOT NULL PRIMARY KEY, 
  CargoRestaurante STRING NOT NULL, 
  FOREIGN KEY(IdFuncionario) REFERENCES Funcionario(IdFuncionario)
);


CREATE TABLE ServicoRestaurante(
  idServicoRestaurante INTEGER NOT NULL PRIMARY KEY, 
  Menu STRING, 
  HorarioAbertura TIME NOT NULL,
  HorarioFecho TIME NOT NULL
);

CREATE TABLE ContaRestaurante(
  IdConta INTEGER PRIMARY KEY NOT NULL, 
  Valor REAL NOT NULL, 
  idServicoRestaurante INTEGER NOT NULL,
  
  IDreserva INTEGER NOT NULL,
  FOREIGN KEY(idServicoRestaurante) REFERENCES ServicoRestaurante(idServicoRestaurante),
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva)
);

CREATE TABLE Pagamento(
  IDreserva INTEGER PRIMARY KEY NOT NULL, 
  DataPagamento DATE NOT NULL, 
  MetodoPagamento STRING, 
  Valor_total REAL NOT NULL,
  FOREIGN KEY(IDreserva) REFERENCES Reserva(IDreserva)
);
