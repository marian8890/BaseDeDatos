insert into clientes (nombre, email, telefono, direccion) values ('Laura Sanchez', 'laura.sanchez@email.com', '555-4321', 'Calle Libertad 789');

insert into Productos (nombre, descripcion, precio, stock) VALUES
('Tablet', 'Tablet 10 pulgadas', 350.00, 20);

update Clientes set telefono=555-6789 where cliente_id=2;

delete from Productos where producto_id = 5;

select nombre, email from clientes;

select nombre from productos where precio>500.00;

select nombre, stock from productos where stock>10;

select orden_id, fecha_orden, total from Ordenes
inner join clientes on ordenes.cliente_id=clientes.cliente_id where clientes.nombre = "Carlos Ruiz";

select*from productos where nombre like 'T%';

select sum(total) from ordenes 
inner join clientes on ordenes.orden_id= clientes.cliente_id where clientes.nombre = 'Juan Perez';

select count(*) from clientes;

select max(precio) from productos;

select avg(precio) from productos; 

select min(precio) from productos;

select sum(stock) from productos;

select avg(precio) from productos where stock>10;select avg(precio) from productos where stock>10;

select sum(precio*stock) from productos;