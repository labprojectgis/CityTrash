/*
    Sript para la creación de las tablas del sistema citytrash 
    Bases de datos en mysql 
    TFG SISTEMA CITYTRASH 
    Heidy Mabel Izaguirre Alvarez         
	mvn sql:execute
*/
---------- Table for validation queries from the connection pool. ----------
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET time_zone = "+01:00";

DROP TABLE IF EXISTS PingTable;
DROP TABLE IF EXISTS TBL_VALORES_REALES;
DROP TABLE IF EXISTS TBL_SENSORES;
DROP TABLE IF EXISTS TBL_RD_CONT;
DROP TABLE IF EXISTS TBL_RUTAS_DIARIAS;
DROP TABLE IF EXISTS TBL_RU_TP;
DROP TABLE IF EXISTS TBL_RUTAS;
DROP TABLE IF EXISTS TBL_CONTENEDORES;
DROP TABLE IF EXISTS TBL_MODELOS_CONTENEDOR;
DROP TABLE IF EXISTS TBL_CAMIONES;
DROP TABLE IF EXISTS TBL_MC_TB;
DROP TABLE IF EXISTS TBL_MODELOS_CAMION;
DROP TABLE IF EXISTS TBL_TIPOS_BASURA;
DROP TABLE IF EXISTS TBL_DIAS_SIN_TRABAJO;
DROP TABLE IF EXISTS TBL_TELEFONOS;
DROP TABLE IF EXISTS TBL_ALERTAS;
--DROP TABLE IF EXISTS TBL_PRIORIDADES;
DROP TABLE IF EXISTS TBL_TIPOS_ALERTAS;
--DROP TABLE IF EXISTS TBL_TIPOS_DOC;
DROP TABLE IF EXISTS TBL_IDIOMAS;
DROP TABLE IF EXISTS  TBL_TRABAJADORES;

-- pingtable
CREATE TABLE PingTable (foo CHAR(1));

--TIPOS
--CREATE TABLE TBL_PRIORIDADES(
--TIPO VARCHAR(1) NOT NULL,
--DESCRIPCION VARCHAR(255) NOT NULL,
--CONSTRAINT PRIORIDAD_PK PRIMARY KEY(TIPO));

CREATE TABLE TBL_TIPOS_ALERTAS(
TIPO INT NOT NULL AUTO_INCREMENT,
DESCRIPCION VARCHAR(255) NOT NULL,
CONSTRAINT TIPOS_DOC_PK PRIMARY KEY(TIPO))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--CREATE TABLE TBL_TIPOS_DOC(
--TIPO VARCHAR(1) NOT NULL,
--DESCRIPCION VARCHAR(255) NOT NULL,
--CONSTRAINT TIPOS_DOC_PK PRIMARY KEY(TIPO));

CREATE TABLE TBL_IDIOMAS(
IDIOMA VARCHAR(2) NOT NULL,
DESCRIPCION VARCHAR(255) NOT NULL,
CONSTRAINT TIPOS_DOC_PK PRIMARY KEY(IDIOMA))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--- ALERTAS
CREATE TABLE TBL_ALERTAS(
ALERTA_ID BIGINT NOT NULL AUTO_INCREMENT,
FECHA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIORIDAD VARCHAR(1),
TIPO VARCHAR(20),
MENSAJE VARCHAR(500),
CONSTRAINT ALERTA_ID_PK PRIMARY KEY(ALERTA_ID))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

----------TRABAJADORES----------
CREATE TABLE TBL_TRABAJADORES( 
TRABAJADOR_ID BIGINT NOT NULL AUTO_INCREMENT,
TRABAJADOR_TYPE VARCHAR(255) NOT NULL,
ROL VARCHAR(255) NOT NULL,
DOC_ID  VARCHAR(15),
NOMBRE VARCHAR(255) NOT NULL,
APELLIDOS VARCHAR(255) NOT NULL,
FEC_NAC DATE NULL,
EMAIL VARCHAR(100) NOT NULL,
CONTRASENA VARCHAR(60) NULL,
TOKEN VARCHAR(200),
FECHA_EXPIRACION_TOKEN TIMESTAMP NOT NULL,
IDIOMA VARCHAR(3) DEFAULT 'es',
VIA VARCHAR(255),
NUMERO INT,
PISO INT,
PUERTA VARCHAR(50),
PROVINCIA VARCHAR(255),
LOCALIDAD VARCHAR(255),
CP decimal(5,0) UNSIGNED ZEROFILL,
RESTO_DIRECCION VARCHAR(100),
TELEFONO DECIMAL(9,0) UNSIGNED ZEROFILL,
CUENTA_HABILITADA INT DEFAULT 0,
TRABAJADOR_ACTIVO INT DEFAULT 1,
FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FECHA_ACTIVACION TIMESTAMP NULL,
CONSTRAINT TRABAJADORES_ID_PK PRIMARY KEY(TRABAJADOR_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

		
ALTER TABLE TBL_TRABAJADORES ADD CONSTRAINT TRABAJADORES_EMAIL_UNIQ UNIQUE (EMAIL);
CREATE INDEX TRABAJADORINDEBYEMAIL_INDEX ON TBL_TRABAJADORES (EMAIL);
ALTER TABLE TBL_TRABAJADORES ADD CONSTRAINT TRABAJADORES_DOC_ID_UNIQ UNIQUE (DOC_ID);
CREATE INDEX TRABAJADORINDEBYDOC_INDEX ON TBL_TRABAJADORES (DOC_ID);

--CREATE TABLE TBL_CONDUCTORES(
--TRABAJADOR BIGINT NOT NULL,
--CONSTRAINT TBL_CONDUCTOR_TRABAJADOR_ID PRIMARY KEY(TRABAJADOR));
--ALTER TABLE TBL_CONDUCTORES ADD CONSTRAINT CONDUCUTOR_TRABAJADORES_FK FOREIGN KEY(TRABAJADOR) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);


----------TELEFONOS TRABAJADORES----------
CREATE TABLE TBL_TELEFONOS(
TRABAJADOR BIGINT,
TELEFONO DECIMAL(9,0),
CONSTRAINT TELEFONO_ID_PK PRIMARY KEY(TRABAJADOR,TELEFONO))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE TBL_TELEFONOS ADD CONSTRAINT TELEFONOS_TRABAJADOR_FK  FOREIGN KEY(TRABAJADOR) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);

----------DIAS SIN TRABAJO TRABAJADOR----------
CREATE TABLE TBL_DIAS_SIN_TRABAJO(
DIAS_SIN_TRABAJO_ID BIGINT NOT NULL AUTO_INCREMENT,
TRABAJADOR BIGINT NOT NULL,
FECHA DATE NOT NULL,
TIPO_MOTIVO VARCHAR(20) NOT NULL,
DESCRIPCION VARCHAR(50),
CONSTRAINT DIAS_SIN_TRABAJO_PK PRIMARY KEY(DIAS_SIN_TRABAJO_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_DIAS_SIN_TRABAJO ADD CONSTRAINT DIAS_SIN_TRABAJO_TRABAJADORES_FK FOREIGN KEY(TRABAJADOR) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);

----------TIPOS DE  BASURA ----------
CREATE TABLE TBL_TIPOS_BASURA(
TIPO_BASURA_ID INT NOT NULL AUTO_INCREMENT,
TIPO VARCHAR(100),
CONSTRAINT TIPO_BASURA_PK PRIMARY KEY(TIPO_BASURA_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

----------CAMIONES----------
CREATE TABLE TBL_MODELOS_CAMION(
MODELO_CAMION_ID INT NOT NULL AUTO_INCREMENT,
VOLUMEN_TOLVA DECIMAL(17,2) DEFAULT 0,
ANCHO DECIMAL(17,2) NOT NULL,
ALTURA DECIMAL(17,2) NOT NULL,
LONGITUD DECIMAL(17,2) NOT NULL,
DISTANCIA DECIMAL(17,2) DEFAULT 0,
PMA INT DEFAULT 0,
CONSTRAINT MODELO_CAMION_PK PRIMARY KEY(MODELO_CAMION_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE TBL_MODELOS_CAMION ADD CONSTRAINT MODELO_CAMION_ANCHO_CK CHECK(ANCHO > 0);
ALTER TABLE TBL_MODELOS_CAMION ADD CONSTRAINT MODELO_CAMION_ALTURA_CK CHECK(ALTURA > 0);
ALTER TABLE TBL_MODELOS_CAMION ADD CONSTRAINT MODELO_CAMION_LONGITUD_CK CHECK(LONGITUD > 0);


-- MODELO CAMION TIPO DE BASURA
CREATE TABLE TBL_MC_TB(
MODELO_CAMION INT NOT NULL,
TIPO_BASURA  INT NOT NULL,
CAPACIDAD DECIMAL(17,2) NOT NULL,
CONSTRAINT MODELOCAMION_TIPOBASURAPK PRIMARY KEY(MODELO_CAMION,TIPO_BASURA))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE TBL_MC_TB ADD CONSTRAINT TBL_MODELOCAMION_TIPOBASURA_MODELO_FK FOREIGN KEY(MODELO_CAMION) REFERENCES TBL_MODELOS_CAMION (MODELO_CAMION_ID);
ALTER TABLE TBL_MC_TB ADD CONSTRAINT TBL_MODELOCAMION_TIPOBASURA_TIPO_FK FOREIGN KEY(TIPO_BASURA) REFERENCES TBL_TIPOS_BASURA (TIPO_BASURA_ID);
ALTER TABLE TBL_MC_TB ADD CONSTRAINT TBL_CAPACIDAD_CHECK CHECK(CAPACIDAD > 0);

--- CAMIONES
CREATE TABLE TBL_CAMIONES(
CAMION_ID BIGINT NOT NULL AUTO_INCREMENT,
VIN VARCHAR(17),
NOMBRE VARCHAR(255),
MATRICULA VARCHAR(20),
FECHA_ALTA TIMESTAMP NOT NULL,
FECHA_BAJA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
MODELO_CAMION INT,
RECOGEDOR_ASIGNADO BIGINT,
CODUCTOR_ASIGNADO BIGINT,
CONDUCTOR_SUPLENTE BIGINT,
ACTIVO BIT DEFAULT 1,
CONSTRAINT CAMIONES_PK PRIMARY KEY(CAMION_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_CAMIONES ADD CONSTRAINT CAMIONES_MODELO_FK FOREIGN KEY(MODELO_CAMION) REFERENCES TBL_MODELOS_CAMION (MODELO_CAMION_ID);
ALTER TABLE TBL_CAMIONES ADD CONSTRAINT CAMIONES_RECOGEDOR_FK FOREIGN KEY(RECOGEDOR_ASIGNADO) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);
ALTER TABLE TBL_CAMIONES ADD CONSTRAINT CAMIONES_CONDUCTOR_ASIGNADO_FK FOREIGN KEY(CODUCTOR_ASIGNADO) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);
ALTER TABLE TBL_CAMIONES ADD CONSTRAINT CAMIONES_CONDUCTOR_SUPLENTE_FK FOREIGN KEY(CONDUCTOR_SUPLENTE) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);

---------- CONTENEDORES ------------
CREATE TABLE TBL_MODELOS_CONTENEDOR(
MODELO_CONTENEDOR_ID INT NOT NULL AUTO_INCREMENT,
CAMPACIDAD_NOMINAL DECIMAL(17,2) NOT NULL,
CARGA_NOMINAL DECIMAL(17,2) NOT NULL,
PROFUNDIDAD DECIMAL(17,2),
ALTURA DECIMAL(17,2),
ANCHURA DECIMAL(17,2),
PESO_VACIO DECIMAL(17,2),
TIPO_BASURA  INT,
CONSTRAINT MODELOS_CONTENEDOR_PK PRIMARY KEY(MODELO_CONTENEDOR_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE TBL_MODELOS_CONTENEDOR ADD CONSTRAINT MODELOS_CONTENEDOR_CARGA_NOMINAL_CK CHECK(CARGA_NOMINAL > 0);
ALTER TABLE TBL_MODELOS_CONTENEDOR ADD CONSTRAINT MODELOS_CONTENEDOR_CAMPACIDAD_NOMINAL_CK CHECK(CAMPACIDAD_NOMINAL > 0);
ALTER TABLE TBL_MODELOS_CONTENEDOR ADD CONSTRAINT MODELOS_CONTENEDOR_TIPOBASURA_FK FOREIGN KEY(TIPO_BASURA) REFERENCES TBL_TIPOS_BASURA (TIPO_BASURA_ID);

--CONTENEDORES
CREATE TABLE TBL_CONTENEDORES(
CONTENEDOR_ID BIGINT NOT NULL AUTO_INCREMENT,
LOCALIZACION_LATITUD DOUBLE,
LOCALIZACION_LONGITUD DOUBLE,
FECHA_ALTA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FECHA_BAJA TIMESTAMP NULL,
ACTIVO BIT DEFAULT 1,
MODELO_CONTENEDOR INT,
CONSTRAINT CONTENEDOR_PK PRIMARY KEY(CONTENEDOR_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_CONTENEDORES ADD CONSTRAINT CONTENEDOR_MODELO_FK FOREIGN KEY(MODELO_CONTENEDOR) REFERENCES TBL_MODELOS_CONTENEDOR (MODELO_CONTENEDOR_ID);

---------- RUTAS ------------
CREATE TABLE TBL_RUTAS(
RUTA_ID INT NOT NULL AUTO_INCREMENT,
INICIO_LATITUD DOUBLE,
INICIO_LONGITUD DOUBLE,
FIN_LATITUD DOUBLE,
FIN_LONGITUD DOUBLE,
ACTIVO BIT DEFAULT 1,
CAMION BIGINT,
CONSTRAINT RUTA_PK PRIMARY KEY(RUTA_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_RUTAS ADD CONSTRAINT RUTAS_CAMION_FK FOREIGN KEY(CAMION) REFERENCES TBL_CAMIONES (CAMION_ID);

-- RUTAS DIARIAS TIPOS DE BASURA
CREATE TABLE TBL_RU_TP(
TIPO_BASURA INT NOT NULL,
RUTA INT NOT NULL,
CONSTRAINT RU_TP_PK PRIMARY KEY(TIPO_BASURA,RUTA))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_RU_TP ADD CONSTRAINT RU_TP_TIPOBASURA_FK FOREIGN KEY(TIPO_BASURA) REFERENCES TBL_TIPOS_BASURA (TIPO_BASURA_ID);
ALTER TABLE TBL_RU_TP ADD CONSTRAINT RU_TP_RUTA_FK FOREIGN KEY(RUTA) REFERENCES TBL_RUTAS (RUTA_ID);

-- HISTORIAL DE RUTAS
CREATE TABLE TBL_RUTAS_DIARIAS(
FECHA DATE NOT NULL,
RUTA INT NOT NULL,
FECHA_HORA_INICIO TIMESTAMP NULL,
FECHA_HORA_FIN TIMESTAMP NULL,
TRABAJADOR_ASIGNADO BIGINT,
CONDUCTOR_ASIGNADO BIGINT,
TRABAJADOR_ACTUALIZA BIGINT,
FECHA_HORA_ACTUALIZACION TIMESTAMP NULL,
CONSTRAINT RUTAS_DIARIAS_PK PRIMARY KEY(RUTA,FECHA))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE TBL_RUTAS_DIARIAS ADD CONSTRAINT RUTAS_DIARIAS_RUTA_FK FOREIGN KEY(RUTA) REFERENCES TBL_RUTAS (RUTA_ID);
ALTER TABLE TBL_RUTAS_DIARIAS ADD CONSTRAINT RUTAS_DIARIAS_TRABAJADORASIG_FK FOREIGN KEY(TRABAJADOR_ASIGNADO) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);
ALTER TABLE TBL_RUTAS_DIARIAS ADD CONSTRAINT RUTAS_DIARIAS_CONDUCTOR_FK FOREIGN KEY(CONDUCTOR_ASIGNADO) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);
ALTER TABLE TBL_RUTAS_DIARIAS ADD CONSTRAINT RUTAS_DIARIAS_TRABAJADORACTUAL_FK FOREIGN KEY(TRABAJADOR_ACTUALIZA) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);

-- RUTAS DIARIAS CONTENEDORES ASIGNADOS 
CREATE TABLE TBL_RD_CONT(
FECHA DATE NOT NULL,
RUTA INT NOT NULL,
CONTENEDOR BIGINT NOT NULL,
SUGERENCIA BIT NOT NULL DEFAULT 1,
REGOGIO BIT NOT NULL DEFAULT 0,
FECHA_HORA TIMESTAMP NULL,
TRABAJADOR_ACTUALIZA BIGINT)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_RD_CONT ADD CONSTRAINT RD_CONT_PK PRIMARY KEY(FECHA,RUTA,CONTENEDOR);
ALTER TABLE TBL_RD_CONT ADD CONSTRAINT RD_CONT_RUTA_RUTA_FK FOREIGN KEY(RUTA) REFERENCES TBL_RUTAS (RUTA_ID);
ALTER TABLE TBL_RD_CONT ADD CONSTRAINT RD_CONT_TRABAJADORACTUAL_FK FOREIGN KEY(TRABAJADOR_ACTUALIZA) REFERENCES TBL_TRABAJADORES (TRABAJADOR_ID);

--SENSORES
CREATE TABLE TBL_SENSORES(
SENSOR_ID BIGINT NOT NULL AUTO_INCREMENT,
CONTENEDOR BIGINT NOT NULL,
ACTIVO BIT NOT NULL DEFAULT 1,
ULTIMA_ACTUALIZACION TIMESTAMP NULL, 
SENSOR_TYPO VARCHAR(255),
BT_PORCENTAJE DOUBLE,
TE_CENTIGRADOS DOUBLE,
VO_PORNCENTAJE DOUBLE,
CONSTRAINT SENSORES_PK PRIMARY KEY(SENSOR_ID))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_SENSORES ADD CONSTRAINT SENSORES_CONTENEDOR_FK FOREIGN KEY(CONTENEDOR) REFERENCES TBL_CONTENEDORES (CONTENEDOR_ID);

--VALORES SENSORES
CREATE TABLE TBL_VALORES_REALES(
FECHA_HORA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
SENSOR BIGINT NOT NULL,
VALOR DOUBLE,
CONSTRAINT VALORES_REALES_PK PRIMARY KEY(SENSOR,FECHA_HORA))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE TBL_VALORES_REALES ADD CONSTRAINT VALORES_REALES_SENSORES_FK FOREIGN KEY(SENSOR) REFERENCES TBL_SENSORES (SENSOR_ID);
