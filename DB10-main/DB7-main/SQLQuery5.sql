create database JuanDB;

create table profesor(
	id_prof int identity(1,1) not null,
	nombre_prof varchar(55) not null,
	apellido_prof varchar(55) not null,
	especialidad varchar(55) not null,
	constraint pk_profesor primary key (id_prof)
);

create table estudiante(
	id_est int identity(1,1) not null,
	nombre_est varchar(55) not null,
	apellido_est varchar(55) not null,
	email_est varchar(55) not null,
	constraint pk_estudiante primary key (id_est)
);


create table curso(
	id_curso int identity(1,1) not null,
	nombre_curso varchar(55) not null,
	aula varchar(55) not null,
	constraint pk_curso primary key (id_curso)
);

create table matricula (
	id_matricula int identity(1,1) not null,
	fecha_matricula date not null,
	fecha_inicio date not null,
	fecha_fin date not null,
	estudiante int not null,
	profesor int not null,
	curso int not null,
	constraint pk_matricula primary key (id_matricula),
	constraint fk_estudiante foreign key (estudiante)
	references estudiante(id_est),
	constraint fk_profesor foreign key (profesor)
	references profesor(id_prof),
	constraint fk_curso foreign key (curso)
	references curso (id_curso)
); 




update matricula
set curso = 2
where id_matricula = 20;


/* delete from profesor
where id_prof = 3;
*/

insert into estudiante (nombre_est,apellido_est,email_est)
values('Leonel','Messi','Messi@mail.com'),
	  ('Juanes','Paz',	'Paz@mail.com'),
	  ('Luis','Castro',	'luisc@mail.com'),
	  ('Maria',	'Díaz',	'mariac@mail.com'),
	  ('caro',	'Ruiz',	'cruiz@mail.com'),
	  ('Pedro',	'Jímenez','pj09@mail.com'),
	  ('Juan','Jara','juan.jara@mail.com'),
	  ('Luz','Taborda','luz.taborda@mail.com'),
	  ('Diego','García','dg@mail.com'),
	  ('Luis','Marin','marinluis@mail.com'),
	  ('Karol','Gutierrez','karol@mail.com'),
	  ('Esteban','león','est.leon@mail.com'),
	  ('Lucho'	,'Díaz','luchito@mail.com'),
	  ('Juancito','Felipe','Juanf@mail.com'),
	  ('Luisa',	'Ramirez','luisaR@mail.com'),
	  ('Mario'	,'cortez','Marioc@mail.com'),
	  ('carolina','Perez','Carolina@mail.com'),
	  ('Marlon'	,'JAJ','Marlon@mail.com'),
	  ('Mbape'	,'Jode','Mbape@mail.com'),
	  ('Albert'	,'Atse'	,'Alberta@mail.com');

select * from estudiante;

insert into profesor
values ('jander','Mamba','Web-1'),
	   ('Albeiro','Muriel','JavaScript'),
       ('Fredy','Muñoz','Java'),
       ('jaime','Zapata','React'),
	   ('marcelo','eiri','Mongo');

select * from profesor;

/*alter table curso
drop column profesor;*/

insert into curso
values ('Web-1 ','105'),
       ('JavaScript ','205'),
	   ('Java ','306'),
	   ('React','440'),
	   ('Mongo ','108');

select * from curso;

insert into matricula
values ('2023-01-2','2023-02-03','2023-09-20',8,1,1),
	   ('2023-01-10','2023-02-08','2023-09-10',8,4,4),
	   ('2023-01-12','2023-02-11','2023-09-12',8,2,2),
	   ('2023-01-2','2023-02-03','2023-09-20',2,2,2),
	   ('2023-01-10','2023-02-08','2023-09-10',2,3,3),
	   ('2023-01-12','2023-02-11','2023-09-12',2,1,5);

select * from matricula;


--uso distict 
select distinct nombre_est
from estudiante;

--uso where
select nombre_est,apellido_est
from estudiante
where id_est between 6 and 9;

select nombre_est, apellido_est
from estudiante
where(id_est = 6 or id_est = 9);

select nombre_est, apellido_est
from estudiante
where (nombre_est = 'luis' and nombre_est = 'luis');

-- Order by
select nombre_est, apellido_est
from estudiante
order by apellido_est;

select nombre_est, apellido_est
from estudiante
order by apellido_est ASC;

select nombre_est, apellido_est
from estudiante
order by apellido_est DESC;

-- Top
select top 5 * from estudiante;

--si quiero mostrar las ultimas filas
select top 5 * from estudiante
order by apellido_est DESC;

select * from curso;

ALTER TABLE curso
ADD valor_curso int;


update curso set valor_curso = 26000
where id_curso = 5;

create table ingreso_matricula(
id_ing int identity (1,1) not null,
cantidad_curso int not null,
valor_curso int not null,
valor_matricula as valor_curso*cantidad_curso,
estudiante int not null,
constraint pk_ingreso_matricula primary key (id_ing),
constraint fk_est foreign key (estudiante)
references estudiante(id_est));


insert into ingreso_matricula(valor_curso, cantidad_curso,estudiante)
values (2000000,2,1),
       (4200000,4,1);

select * from ingreso_matricula;

--joins----
select ingreso_matricula.id_ing, estudiante.nombre_est,estudiante.apellido_est	
from ingreso_matricula
inner join estudiante on ingreso_matricula.id_ing = estudiante.id_est;

select matricula.id_matricula,estudiante.nombre_est,estudiante.apellido_est,curso.nombre_curso,profesor.nombre_prof,profesor.apellido_prof
from ((matricula
inner join estudiante on matricula.estudiante = estudiante.id_est)
inner join curso on matricula.curso = curso.id_curso
inner join profesor on matricula.profesor = profesor.id_prof);

select estudiante.id_est,estudiante.nombre_est,estudiante.apellido_est,matricula.fecha_matricula,ingreso_matricula.valor_curso
from estudiante
inner join matricula on estudiante.id_est = matricula.estudiante
inner join ingreso_matricula on estudiante.id_est = ingreso_matricula.estudiante;

--realizar un left join
select nombre_est,apellido_est,email_est
from estudiante
left join ingreso_matricula
on estudiante.id_est = ingreso_matricula.estudiante;
--realizar un right join
select nombre_est,apellido_est,email_est
from estudiante
right join ingreso_matricula
on estudiante.id_est = ingreso_matricula.estudiante;
--full join
select estudiante.id_est, estudiante.nombre_est,matricula.fecha_matricula,curso.nombre_curso
from matricula
full outer join estudiante on matricula.estudiante = estudiante.id_est
full outer join curso on matricula.curso = curso.id_curso;