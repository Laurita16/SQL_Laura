
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name" as "Nbre. pista",
a."Title" as "Título del álbum"
from "Track" t 
left join "Album" a ON 
t."AlbumId" = a."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select a."Name" as "Nbre. artista",
a2."Title" as "Título del álbum"
from "Artist" a 
left join "Album" a2 ON 
a."ArtistId" = a2."AlbumId"
order by a."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select 
concat(c."FirstName", ' ', c."LastName") as "Nbre_cliente",
i."Total"  as "Total_factura"
from "Customer" c 
left join "Invoice" i 
ON c."CustomerId" = i."CustomerId"
order by i."Total" desc 
limit 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select
concat(e."FirstName", ' ', e."FirstName") as "Nbre. Empleado",
concat(c."FirstName", ' ', c."LastName") as "Nbre. cliente" 
from "Employee" e 
left join "Customer" c on
e."EmployeeId" = c."CustomerId" ;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select il."InvoiceId" as "ID Factura",
t."Name" as "Nbre. Pista"
from "Track" t 
left join "InvoiceLine" il on
t."TrackId"  = il."TrackId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select a."Name" as "Nbre. artista",
g."Name" as "Género pista"
from "Artist" a
join "Album" a2 on a."ArtistId"  = a2."ArtistId" 
join "Track" t ON a2."AlbumId"  = t."AlbumId"
join "Genre" g on t."GenreId"  = g."GenreId" ;

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as "Nbre. pista", mt."Name"as "Medio disponible"
from "Track" t 
left join "MediaType" mt on
t."TrackId"  = mt."MediaTypeId" ;


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select t."Name" as "Nbre. Pista", g."Name" as "Género"
from "Track" t
full join "Genre" g on t."TrackId" = g."GenreId" ;


-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select
concat(c."FirstName", ' ', c."LastName") as "Nbre. Cliente",
i."InvoiceId" as "Nº factura"
from "Invoice" i 
full join "Customer" c 
on c."CustomerId" = i."CustomerId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select a."Title" as "Álbum", a2."Name" as "Artista"
from "Album" a 
full join "Artist" a2 on
a."AlbumId" = a2."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select g."Name" as "Nbre. género",
count(t."Name") as "Nº pistas"
from "Track" t 
left join "Genre" g on
t."TrackId" = g."GenreId" 
group by g."Name"
order by count(t."Name") desc ;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select a."Title" as "Título álmum",
t."Milliseconds" as "Duración"
from "Album" a 
left join "Track" t ON 
a."AlbumId" = t."TrackId" ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select
concat(c."FirstName", ' ', c."LastName") as "Nbre. Cliente",
i."Total" 
from "Customer" c 
left join "Invoice" i ON 
c."CustomerId" = i."InvoiceId" ;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select
concat(e."FirstName", ' ', e."LastName") as "Nbre. empleado",
concat(c."FirstName", ' ', c."LastName") "Nbre. cliente" 
from "Employee" e 
full join "Customer" c on
e."EmployeeId" = c."CustomerId" ;


