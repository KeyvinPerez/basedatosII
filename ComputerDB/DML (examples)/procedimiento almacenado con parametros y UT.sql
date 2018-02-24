USE [ComputerDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_listaDeArticulos]    Script Date: 24/02/2018 12:17:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_listaDeArticulos]
	@idproductos varchar(20)
as
begin
declare @consulta varchar(100),@todosLosRegistros bit
if (len(@idproductos)=0) begin
	select @todosLosRegistros=1 
	select @idproductos='0'
end else begin
	select @todosLosRegistros=0
	
end

select @consulta='select * from Productos 
	where ('+convert(varchar(1),@todosLosRegistros)+'=1 or 
	('+convert(varchar(1),@todosLosRegistros)+'=0 and  id in ('+convert(varchar(20),@idproductos)+')))'

	print(@consulta)
	exec(@consulta)
end
-- exec sp_listaDeArticulos '' -- TODOS LOS REGISTROS
-- exec sp_listaDeArticulos '1' -- DEBE MOSTRAR 1 REGISTRO
-- exec sp_listaDeArticulos '1,2,3,4' -- DEBE MOSTRAR 4 REGISTROS
-- exec sp_listaDeArticulos '%'  -- error
-- exec sp_listaDeArticulos '*' -- error

