# 📚 Evaluación de Desempeño Académico - MySQL

## 📌 Descripción

Este proyecto consiste en el desarrollo de una función definida por el usuario (User Defined Function - UDF) en MySQL para clasificar el desempeño académico de los estudiantes a partir del promedio de sus calificaciones.

La función recibe el ID de un estudiante, calcula el promedio de sus notas registradas y devuelve una clasificación según los siguientes criterios:

* **Bajo:** promedio menor a **3.0**
* **Aceptable:** promedio entre **3.0** y **4.0**
* **Sobresaliente:** promedio mayor a **4.0**

---

## 🗂️ Estructura de la base de datos

La base de datos está compuesta por las siguientes tablas:

* **estudiante:** almacena la información de los estudiantes.
* **asignatura:** almacena las asignaturas disponibles.
* **nota:** registra la calificación obtenida por cada estudiante en cada asignatura.

La tabla **nota** relaciona a estudiantes y asignaturas mediante claves foráneas, siguiendo principios básicos de normalización para evitar redundancia de información.

---

## ⚙️ Función implementada

### ClasificarDesempeño(id_estudiante)

La función realiza las siguientes acciones:

1. Recibe el ID de un estudiante.
2. Calcula el promedio de todas sus calificaciones mediante `AVG()`.
3. Evalúa el promedio utilizando la estructura `CASE`.
4. Retorna una de las siguientes clasificaciones:

   * Bajo
   * Aceptable
   * Sobresaliente

La función fue declarada como **NOT DETERMINISTIC** y **READS SQL DATA**, ya que consulta información almacenada en una tabla y el resultado puede variar si las notas son modificadas.

---
### evidencia

<a href="https://ibb.co/C3wW5WtQ"><img src="https://i.ibb.co/39Tkyksc/imagen-2026-07-05-101902049.png" alt="imagen-2026-07-05-101902049" border="0"></a>

---

## ▶️ Ejecución

1. Ejecutar el archivo SQL en MySQL Workbench.
2. Se creará automáticamente la base de datos **evaluar_desempeno**.
3. Se crearán las tablas correspondientes.
4. Se insertarán los datos de prueba.
5. Se creará la función `ClasificarDesempeño`.
6. Finalmente se ejecutará una consulta que mostrará el rendimiento de cada estudiante.

---

## 📋 Consulta utilizada

```sql
SELECT estudiante_id,
       estudiante,
       ClasificarDesempeño(estudiante_id) AS rendimiento
FROM estudiante;
```

---

## 🛠️ Tecnologías utilizadas

* MySQL 8
* MySQL Workbench

---

## 👨‍💻 Autor

**Manuel Isaac Camaño Díaz**
