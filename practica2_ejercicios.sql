/*Ejercicio 1-3*/
select * from departamento where fk_id_inquilino is null;
update departamento set fk_id_inquilino=null where id_depto=11;

/*Ejercicio 4...*/
select * from departamento;
select * from inquilino;

/*Forma explicita*/
select departamento.id_depto as 'Depto.', inquilino.nombre as 'Nomb_Inq', clasificacion.descrip_clasificacion as 'Clasif.', 
num_rec,chimenea,lavaplatos,cocina_int,
case
		when departamento.fk_id_inquilino is not null then 'SI'
		when inquilino.nombre is null then 'NO'
end as rentado /*Asigna nombre al case*/
from departamento 
left join inquilino
on departamento.fk_id_inquilino = inquilino.id_inquilino
join clasificacion
on departamento.fk_id_clasificacion = clasificacion.id_clasificacion order by inquilino.nombre asc;


/*Ojo con el else del final*/
select departamento.id_depto as 'Depto.', inquilino.nombre as 'Nomb_Inq', clasificacion.descrip_clasificacion as 'Clasif.', 
num_rec,chimenea,lavaplatos,cocina_int,
case
		when inquilino.nombre is null then 'NO'
        else 'SI'
end as rentado
from departamento 
left join inquilino
on departamento.fk_id_inquilino = inquilino.id_inquilino
join clasificacion
on departamento.fk_id_clasificacion = clasificacion.id_clasificacion;


/*Forma implicita*/
select departamento.id_depto as 'Depto.', inquilino.nombre as 'Nomb_Inq', clasificacion.descrip_clasificacion as 'Clasif.', 
num_rec,chimenea,lavaplatos,cocina_int
from departamento,inquilino,clasificacion
where departamento.fk_id_inquilino = inquilino.id_inquilino and departamento.fk_id_clasificacion = clasificacion.id_clasificacion;

/*b)*/
select inquilino.id_inquilino as 'Id. Inq.', inquilino.nombre as 'Nombre', inquilino.telefono as 'Telefono',
departamento.id_depto as 'Depto', clasificacion.descrip_clasificacion as 'Clasif.', clasificacion.monto_renta as 'M_Renta' 
from inquilino 
join departamento
on inquilino.id_inquilino = departamento.fk_id_inquilino
join clasificacion
on departamento.fk_id_clasificacion = clasificacion.id_clasificacion order by inquilino.id_inquilino asc;

/*c)*/
select inquilino.id_inquilino as 'Id. Inq.', inquilino.nombre as 'Nombre',
departamento.id_depto as 'No. Depto.', clasificacion.descrip_clasificacion as 'Clasificacion',
cajon.id_cajon as 'Cajón', cajon.ubicacion as "Ubicación"
from inquilino
join departamento
on inquilino.id_inquilino = departamento.fk_id_inquilino
join clasificacion
on clasificacion.id_clasificacion = departamento.fk_id_clasificacion
join cajon
on cajon.fk_id_depto = departamento.id_depto;

/*d)*/
select departamento.id_depto as 'No. Depto.', clasificacion.descrip_clasificacion as 'Clasificacion',
caracteristica.id_caract as 'id_Caract', caracteristica.desc_caract as 'Caracteristica', caracteristica.monto_car as 'Monto'
from clasificacion
join departamento
on clasificacion.id_clasificacion = departamento.fk_id_clasificacion 
join depto_caracteristicas
on depto_caracteristicas.fk_id_depto = departamento.id_depto
join caracteristica
on caracteristica.id_caract = depto_caracteristicas.fk_id_caract order by departamento.id_depto asc;

/*Forma Implicita*/
select departamento.id_depto as 'No. Depto.', clasificacion.descrip_clasificacion as 'Clasificacion',
caracteristica.id_caract as 'id_Caract', caracteristica.desc_caract as 'Caracteristica', caracteristica.monto_car as 'Monto'
from clasificacion, departamento, depto_caracteristicas, caracteristica
where clasificacion.id_clasificacion = departamento.fk_id_clasificacion and depto_caracteristicas.fk_id_depto = departamento.id_depto
and caracteristica.id_caract = depto_caracteristicas.fk_id_caract order by departamento.id_depto asc;
