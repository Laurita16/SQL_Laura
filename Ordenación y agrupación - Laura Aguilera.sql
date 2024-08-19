
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title" as "Nbre. álbum"
FROM "Album" a 
order by "Title" asc ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select a."Title" as "Nbre. álbum",
count(t."Name") as "Nº canciones"
from "Album" a 
join "Track" t on
a."AlbumId" = t."AlbumId" 
group by a."Title"
order by "Nº canciones" desc 
limit 1;


-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select "Composer" ,
round (avg("Milliseconds"), 2) as "Duración media",
round (stddev("Milliseconds"), 2) as "Desviación estándar",
round (variance("Milliseconds"), 2) as "Varianza"
from "Track" t 
group by "Composer"
order by "Composer" asc ;

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select "Name" as "Nbre. pista",
"UnitPrice" as "Precio pista"
from "Track" t 
limit 10;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select "EmployeeId" ,
concat("FirstName", ' ',"LastName") as "Nbre. empleado"
from "Employee" e 
order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select count("Name") as "Nº géneros"
from "Genre" g ;


-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select concat("FirstName", ' ', "LastName") as "Nbre. cliente",
"Country" as "País"
from "Customer" c 
order by "Nbre. cliente"
limit 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select count("CustomerId") as "Nº de clientes",
"Country" 
from "Customer" c 
group by "Country" 
order by "Nº de clientes" desc ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select sum(i."Total") as "Total factura",
c."Country" 
from "Customer" c 
join "Invoice" i on c."CustomerId" = i."CustomerId" 
group by c."Country" 
having sum(i."Total")>10.00
order by sum(i."Total") desc;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select count(concat("FirstName", ' ', "LastName")) as "Nº. clientes",
"Country" as "País"
from "Customer" c 
group by "Country"
having count(concat("FirstName", ' ', "LastName")) >5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
select "MediaTypeId" as "Tipo de medio",
count("TrackId") as "Cantidad de pistas",
from "Track" t
where "Milliseconds" > 250000
group by "MediaTypeId" 
order by "Cantidad de pistas" desc;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select "Country" as "País",
count("CustomerId") as "Nº total clientes",
"SupportRepId" as "Rep. vtas."
from "Customer" c 
group by "CustomerId" 
having count("CustomerId") <5 ;

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
  select "BillingPostalCode" as "CP",
  count("InvoiceId") as "Nº compras"
  from "Invoice" i
  group by "BillingPostalCode" 
  having count("InvoiceId")>5;

 
-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select mt."Name" as "Tipo de medio", 
count(t."MediaTypeId") as "Cantidad de pistas"
from "Track" t
left join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
where t."UnitPrice" > 0.99 and t."Milliseconds" > 200.000
group by mt."Name" 
order by  "Cantidad de pistas" desc;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select count("CustomerId"),
"Country" as "País",
"State" as "State"
from "Customer" c 
where "SupportRepId" >3 and "Company" is not Null
group by ("CustomerId");
