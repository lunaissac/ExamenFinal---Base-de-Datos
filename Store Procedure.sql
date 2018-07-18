

create procedure agregarColegio
@Nombre varchar (40)
AS
begin
insert into colegios values(@nombre) 
end
go
exec agregarColegio @Nombre = 'Mixto' 
