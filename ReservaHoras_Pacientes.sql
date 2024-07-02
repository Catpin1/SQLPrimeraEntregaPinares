-- Tabla Paciente
CREATE TABLE Paciente (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    RUT VARCHAR(12),
    fechaNacimiento DATE,
    direccion VARCHAR(255),
    correo VARCHAR(100),
    telefono VARCHAR(15),
    ocupacion VARCHAR(100),
    previsionSalud VARCHAR(50)
);

-- Tabla Traumatólogo
CREATE TABLE Traumatologo (
    idTraumatologo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    RUT VARCHAR(12),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Tabla Diagnóstico
CREATE TABLE Diagnostico (
    idDiagnostico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla ReservaHora
CREATE TABLE ReservaHora (
    idReserva INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    idTraumatologo INT,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idTraumatologo) REFERENCES Traumatologo(idTraumatologo)
);

-- Tabla Tratamiento
CREATE TABLE Tratamiento (
    idTratamiento INT AUTO_INCREMENT PRIMARY KEY,
    idReserva INT,
    idDiagnostico INT,
    descripcion TEXT,
    FOREIGN KEY (idReserva) REFERENCES ReservaHora(idReserva),
    FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico)
);

-- Tabla Kinesiólogo
CREATE TABLE Kinesiologo (
    idKinesiologo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    RUT VARCHAR(12),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Tabla ReservaTratamiento
CREATE TABLE ReservaTratamiento (
    idReservaTrat INT AUTO_INCREMENT PRIMARY KEY,
    idTratamiento INT,
    idKinesiologo INT,
    fecha DATE,
    hora TIME,
    sesion INT,
    FOREIGN KEY (idTratamiento) REFERENCES Tratamiento(idTratamiento),
    FOREIGN KEY (idKinesiologo) REFERENCES Kinesiologo(idKinesiologo)
);
