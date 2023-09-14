CREATE PROCEDURE select_tabla
		
AS
BEGIN
	SELECT        profesor.nombre_prof, profesor.apellido_prof, profesor.especialidad, estudiante.nombre_est, estudiante.apellido_est, estudiante.email_est
FROM            profesor CROSS JOIN
                         estudiante

END
GO
