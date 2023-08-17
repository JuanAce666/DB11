alter table profesor 
add email_prof varchar(55) not null;

alter table curso
drop column aula;

alter table matricula
add aula varchar (10) not null; 

exec sp_rename 'profesor.especialidad','area'; 

-- podemos alterar una clave foranea eliminandola o creandola 

alter table matricula
drop constraint fk_curso;

alter table matricula
add constraint fk_curso1
foreign key (curso) references curso (id_curso);
