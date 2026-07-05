CREATE DATABASE evaluar_desempeno;
USE evaluar_desempeno;

CREATE TABLE estudiante(
estudiante_id  INT AUTO_INCREMENT PRIMARY KEY,
estudiante VARCHAR(50)
);

CREATE TABLE asignatura(
asignatura_id INT AUTO_INCREMENT PRIMARY KEY,
asignatura VARCHAR (30)
);

CREATE TABLE nota(
nota_id INT AUTO_INCREMENT PRIMARY KEY,
asignatura_id INT,
estudiante_id  INT,
nota DECIMAL(3,2),

FOREIGN KEY (asignatura_id) REFERENCES asignatura(asignatura_id),
FOREIGN KEY (estudiante_id) REFERENCES estudiante(estudiante_id)
);

INSERT INTO estudiante(estudiante) VALUES
('Carlos Pancho'),
('Sophie Mendoza');

INSERT INTO asignatura(asignatura) VALUES
('MySQL'),
('Javascript');

INSERT INTO nota(asignatura_id,estudiante_id,nota) VALUES
(1,1,3.8),
(1,2,1.9),
(2,1,4.5),
(2,2,3.5);

DELIMITER $$
	CREATE FUNCTION ClasificarDesempeño (id_estudiante INT)
	RETURNS VARCHAR (50)
    NOT DETERMINISTIC
    READS SQL DATA
    BEGIN
		DECLARE promedio DECIMAL(3,2);
		SELECT AVG(nota) INTO promedio FROM nota WHERE estudiante_id = id_estudiante;
		RETURN 
        CASE
			WHEN promedio<3 THEN 'Bajo'
			WHEN promedio<=4 THEN 'Aceptable'
			ELSE 'Sobresaliente'
		END;
	END;
$$
DELIMITER ;

SELECT estudiante_id,
       estudiante,
       ClasificarDesempeño(estudiante_id) AS rendimiento
FROM estudiante;