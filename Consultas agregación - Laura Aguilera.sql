
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
select min("Milliseconds") as "Duración mínima de las pistas en milisegundos"
FROM "Track";

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select max ("Milliseconds") as "Duración máxima de las pistas en milisegundos"
FROM "Track";

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
   select min("UnitPrice") as "Precio mínimo pistas"
   from "Track" t ;

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
   select max("UnitPrice") as "Precio máximo pistas"
   from "Track" t ;

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
   select min("InvoiceDate") as "Fecha mínima"
   from "Invoice" i ;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
   select max ("InvoiceDate") as "Fecha máxima"
   from "Invoice" i ;

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
   select count("TrackId") as "Nº Total Pistas"
   from "Track" t ;

-- Ejercicio 8: Contar el número de clientes en Brasil.
   select count("Country") as "Nº clientes en Brasil"
   from "Customer" c 
  where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
   select sum("Milliseconds") as "Duración total pistas en milisegundos"
   from "Track" t ;

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
    select count("Title") as "Nº Empleados Sales Support Agent"
    from "Employee" e 
   where "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
    select sum("Total") as "Total facturado"
    from "Invoice" i ;

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
    select round(avg("Milliseconds"),2) as "Duración media de las pistas en milisegundos"
    from "Track" t ;

-- Ejercicio 13: Calcular el precio medio de las pistas.
    select round(avg("UnitPrice"),2) as "Precio medio de las pistas"
    from "Track";

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
    select round(stddev("Milliseconds"),2) as "Desv. estándar dur. pistas"
    from "Track";

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
 select round(variance("Milliseconds"),2) as "Varianza dur. pistas"
    from "Track";

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
 select round(stddev("UnitPrice"),2) as "Desv. estándar precio pistas"
    from "Track";

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select concat("FirstName", ' ', "LastName") as "Nbre. y apellido clientes"
from "Customer" c ;

