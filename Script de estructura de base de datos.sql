-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 14:55:25.842

-- tables
-- Table: Apoderados
drop TioJuanito
CREATE TABLE Apoderados (
    idApoderado int  NOT NULL IDENTITY(1, 1),
    Nombre varchar(50)  NOT NULL,
    DNI int  NOT NULL,
    Telefono int  NOT NULL,
    niños_idNiño int  NOT NULL,
    CONSTRAINT Apoderados_pk PRIMARY KEY  (idApoderado)
);

-- Table: Asistentes
CREATE TABLE Asistentes (
    idAsistente int  NOT NULL IDENTITY(1, 1),
    Nombre varchar(30)  NOT NULL,
    DNI int  NOT NULL,
    Buses_idBus int  NOT NULL,
    CONSTRAINT Asistentes_pk PRIMARY KEY  (idAsistente)
);

-- Table: Buses
CREATE TABLE Buses (
    idBus int  NOT NULL IDENTITY(1, 1),
    NumMatricula int  NOT NULL,
    Color varchar(50)  NOT NULL,
    Capacidad int  NOT NULL,
    CONSTRAINT Buses_pk PRIMARY KEY  (idBus)
);

-- Table: Choferes
CREATE TABLE Choferes (
    idChofer int  NOT NULL IDENTITY(1, 1),
    Nombre varchar(30)  NOT NULL,
    DNI int  NOT NULL,
    LicenciCondu varchar(50)  NOT NULL,
    Buses_idBus int  NOT NULL,
    CONSTRAINT Choferes_pk PRIMARY KEY  (idChofer)
);

-- Table: Colegios
CREATE TABLE Colegios (
    idColegio int  NOT NULL IDENTITY(1, 1),
    nombre varchar(50)  NOT NULL,
    CONSTRAINT Colegios_pk PRIMARY KEY  (idColegio)
);

-- Table: Contratos
CREATE TABLE Contratos (
    idContrato int  NOT NULL IDENTITY(1, 1),
    Apoderados_idApoderado int  NOT NULL,
    TiempoCon int  NOT NULL,
    modalidad varchar(30)  NOT NULL,
    CantidadNiño int  NOT NULL,
    Precio int  NOT NULL,
    CONSTRAINT Contratos_pk PRIMARY KEY  (idContrato)
);

-- Table: Recorridos
CREATE TABLE Recorridos (
    idRecorrido int  NOT NULL IDENTITY(1, 1),
    HoralleColeg varchar(20)  NOT NULL,
    HorallCoche varchar(20)  NOT NULL,
    Papeletas int  NOT NULL,
    ParadPolis int  NOT NULL,
    cambiRutas int  NOT NULL,
    Kmetraje int  NOT NULL,
    Choferes_idChofer int  NOT NULL,
    Contratos_idContrato int  NOT NULL,
    CONSTRAINT Recorridos_pk PRIMARY KEY  (idRecorrido)
);

-- Table: niños
CREATE TABLE niños (
    idNiño int  NOT NULL IDENTITY(1, 1),
    nombre varchar(50)  NOT NULL,
    dirección varchar(50)  NOT NULL,
    HoraBuscar varchar(20)  NOT NULL,
    Horadejar varchar(20)  NOT NULL,
    Colegios_idColegio int  NOT NULL,
    CONSTRAINT niños_pk PRIMARY KEY  (idNiño)
);

-- foreign keys
-- Reference: Apoderados_niños (table: Apoderados)
ALTER TABLE Apoderados ADD CONSTRAINT Apoderados_niños
    FOREIGN KEY (niños_idNiño)
    REFERENCES niños (idNiño);

-- Reference: Choferes_Buses (table: Choferes)
ALTER TABLE Choferes ADD CONSTRAINT Choferes_Buses
    FOREIGN KEY (Buses_idBus)
    REFERENCES Buses (idBus);

-- Reference: Contratos_Apoderados (table: Contratos)
ALTER TABLE Contratos ADD CONSTRAINT Contratos_Apoderados
    FOREIGN KEY (Apoderados_idApoderado)
    REFERENCES Apoderados (idApoderado);

-- Reference: Recorrido _Choferes (table: Recorridos)
ALTER TABLE Recorridos ADD CONSTRAINT Recorrido_Choferes
    FOREIGN KEY (Choferes_idChofer)
    REFERENCES Choferes (idChofer);

-- Reference: Recorridos_Contratos (table: Recorridos)
ALTER TABLE Recorridos ADD CONSTRAINT Recorridos_Contratos
    FOREIGN KEY (Contratos_idContrato)
    REFERENCES Contratos (idContrato);

-- Reference: asistentes_Buses (table: Asistentes)
ALTER TABLE Asistentes ADD CONSTRAINT asistentes_Buses
    FOREIGN KEY (Buses_idBus)
    REFERENCES Buses (idBus);

-- Reference: niños_Colegios (table: niños)
ALTER TABLE niños ADD CONSTRAINT niños_Colegios
    FOREIGN KEY (Colegios_idColegio)
    REFERENCES Colegios (idColegio);

-- End of file.

