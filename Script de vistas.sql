
create view vistaColegio
as
select * from colegio
go

create view vistani�os
as
select idni�o,direcci�n,horabuscar,horadejar,Colegios.nombre as colegio from ni�os
inner join Colegios on colegios.idcolegio =ni�os.Colegios_idColegio

go

create view vistaApoderado
as
select idapoderados,nombre,dni,telefono,ni�os.ni�os.nombre as ni�o from  Apoderados
inner join ni�os on ni�os.idni�os = apoderados.ni�is_idni�os

go
create view vistaContratos
as
select idContrato,Apoderados.Nombre as apoderado ,Tiempocon,modalidad,cantidadni�o,precio from Contratos 
inner join apoderados on apoderados.idapoderado =contratos.apoderados_idapoderado
go

create view vistaRecorrido
as
select * from recorridos
go

create view vistaChoferes
as
select  idChofer,nombre,dni,licenciCondu,Buses.NumMatricula from Choferes
inner join buses on  buses.idbus =buses_idbus
go

create view vistaBuses
as
select  * from buses

go
create view vistaAsistentes
as
select  idAsistente,nombre,dni,Buses.NumMatricula from Asistentes
inner join buses on  buses.idbus =buses_idbus
go

