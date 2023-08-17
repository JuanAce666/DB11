create database JuanDB;

CREATE TABLE marcas (
    ID int primary key,
    Nombre varchar(50) not null
);

--marcas
insert into Marcas (ID,Nombre)
values (1,'audi'),
	   (2,'renault'),
	   (3,'bmw'),
	   (4,'mercedes benz'),
	   (5,'ferrari');

select * from marcas

CREATE TABLE Modelos (
    ID int primary key,
    MarcaID int not null,
    Nombre varchar(50) not null,
    Potencia int not null,
    Cilindre int not null,
    FOREIGN KEY (MarcaID) REFERENCES Marcas(ID)
);
--insert 1
insert into Modelos 
values (1,1,'A1 audi',116,2000);
select * from Modelos				


CREATE TABLE Equipamiento (
    ID int primary key,
    Nombre varchar(100)not null
);
-- insert 2
insert into Equipamiento
values (1,'airbag')
select * from Equipamiento
--insert 3
CREATE TABLE Extras (
    ID int primary key,
    Nombre varchar(100) not null,
    Precio float not null
);
insert into Extras
values (1,'aire acondicionado',1000)
select * from Extras
--insert4
CREATE TABLE Modelo_Equipamiento (
    ModeloID int not null,
    EquipamientoID int not null,
    primary key (ModeloID, EquipamientoID),
    foreign key (ModeloID) references Modelos(ID),
    foreign key (EquipamientoID) references Equipamiento(ID)
);
insert into Modelo_Equipamiento
values (1,1)
select * from Modelo_Equipamiento
--insert 5
CREATE TABLE Modelo_Extras (
    ModeloID int not null,
    ExtraID int not null,
    Precio float not null,
    primary key (ModeloID, ExtraID),
    foreign key (ModeloID) references Modelos(ID),
    foreign key (ExtraID) references Extras(ID)
);
insert into Modelo_Extras
values ()

CREATE TABLE Concesionarios (
    ID int primary key,
    Nombre varchar(100)not null,
    Domicilio varchar(200)not null,
    NIF varchar(20)not null
);

CREATE TABLE ServiciosOficiales (
    ID int primary key,
    ConcesionarioID int not null,
    Nombre varchar(100) not null,
    Domicilio varchar(200) not null,
    NIF varchar(20) not null,
    foreign key (ConcesionarioID) references Concesionarios(ID)
);

CREATE TABLE Vendedores (
    ID int primary key,
    Nombre varchar(100) not null,
    NIF varchar(20) not null,
    Domicilio varchar(200) not null
);

CREATE TABLE Automoviles (
    NumeroBastidor varchar(50) primary key,
    ModeloID int not null,
    ConcesionarioID int not null,
    Precio float not null,
    Descuento float not null,
    FechaEntrega date not null,
    Matricula varchar(20) not null,
    Stock int not null,
    foreign key (ModeloID) references Modelos(ID),
    foreign key (ConcesionarioID) references Concesionarios(ID) 
);

CREATE TABLE Ventas (
    ID int primary key,
    AutomovilNumeroBastidor varchar(50) not null,
    VendedorID int not null,
    PrecioVenta float not null,
    ModoPago varchar(20) not null,
    foreign key (AutomovilNumeroBastidor)references Automoviles(NumeroBastidor),
    foreign key (VendedorID) references Vendedores(ID)
);

CREATE TABLE Venta_Extras (
    VentaID int not null,
    ExtraID int not null,
    primary key (VentaID, ExtraID),
    foreign key (VentaID) references Ventas(ID),
    foreign key (ExtraID) references Extras(ID)
);

insert into 
