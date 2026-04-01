/*Como crear una tabla desde cero se usa  CREATE TABLE*/

CREATE TABLE personas (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created date
);

/*Para agregarle restricciones a los campos podemos */


CREATE TABLE personas2 (
	id int NOT NULL,
	name varchar(50) NOT NULL, -- No permite entradas vacias
	age int,
	email varchar(50),
	created date
);


CREATE TABLE personas3 (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created date,
	UNIQUE(id) -- Los asigna de manera unica
);


CREATE TABLE personas4 (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created date,
	PRIMARY KEY(id) -- Los asigna de manera unica pero se utiliza para posteriormente relacionar tablas
);


CREATE TABLE personas5 (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created date,
	CHECK(age >= 18) --Solo permite regristrar usuarios que cumplan la restricción específica age >=18
);


CREATE TABLE personas6 (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created datetime DEFAULT CURRENT_TIMESTAMP(), --Mete ek tiempo y la hora actuales
);


CREATE TABLE personas7 (
	id int AUTO_INCREMENT, --Incrementa automaticamente el valor
	name varchar(50),
	age int,
	email varchar(50),
	created date
);



/*Si ahora tenemos una tabla que queremos borra usamos DROP TABLE */

CREATE TABLE personas8 (
	id int,
	name varchar(50),
	age int,
	email varchar(50),
	created date
);

DROP TABLE personas8;


/*Si queremos modificar la configuración de una tabla existente, añadir datos, eliminar, podemos usar ALTER TABLE*/

CREATE TABLE personas8 (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	age int,
	email varchar(50),
	created datetime DEFAULT CURRENT_TIMESTAMP(),
	UNIQUE(id),
	PRIMARY KEY(id),
	CHECK(age >= 18)
);

ALTER TABLE personas8
ADD surname varchar(50); --Añade el campo surname a la tabla

ALTER TABLE personas8
REAME COLUMN surname TO nickname; --Cmabia el nombre de la columna surname a nickname

ALTER TABLE personas8
MODIFY COLUMN nickname varchar(75); --Cmabia el tipo o tamaño del campo nickname

ALTER TABLE personas8
DROP COLUMN nickname; --Elimina la columna nickname









































