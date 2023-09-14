exec dbo.registra_profesor  @nombre_prof = 'Juan', @apellido_prof = 'acevedo', @especialidad = 'Java'

drop procedure registra_profesor;

select * from profesor;

exec dbo.registra_estudiante  @nombre_est = 'kanye', @apellido_est = 'west', @email_est = 'kanyew@email.com'

select * from  estudiante;

exec dbo.registra_curso @nombre_curso = 'curso java', @aula = '303'

select * from curso;


--select en una tabla 
SELECT        profesor.nombre_prof, profesor.apellido_prof, profesor.especialidad, estudiante.nombre_est, estudiante.apellido_est, estudiante.email_est
FROM            profesor CROSS JOIN
                         estudiante

exec select_tabla