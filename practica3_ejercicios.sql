/*EJERCICIOS*/
/*A)*/
select revista.id_rev as 'No. Rev', revista.nom_rev as 'Nombre revista', frecuencia.nomb_frec as 'Frecuencia', 
ejemplar.id_ejem as 'No.Eje', ejemplar.fecha_ejem as 'Fecha', ejemplar.precio_ejem as 'Precio', ejemplar.num_pag_ejemp as 'No. Pags.'
from frecuencia
join revista
on frecuencia.id_frec = revista.fk_id_frec
join ejemplar
on revista.id_rev = ejemplar.fk_id_rev;

/*B)*/
select revista.nom_rev as 'Nombre Revista', frecuencia.nomb_frec as 'Frecuencia', ejemplar.id_ejem as 'No. Eje',
ejemplar.fecha_ejem as 'Fecha', articulo.nom_art as 'Articulo', articulo.num_pag_art as '#Pags'
from frecuencia, revista, ejemplar, ejem_art, articulo
where frecuencia.id_frec = revista.fk_id_frec and revista.id_rev = ejemplar.fk_id_rev 
and ejemplar.id_ejem = ejem_art.fk_id_ejem and ejemplar.fk_id_rev = ejem_art.fk_fkid_rev 
and ejem_art.fk_id_art = articulo.id_art;

/*C) NO SE PUDO, REVISAR PROBLEMA CON LA RECURSIVIDAD*/
select autor.id_autor as 'Id_autor', autor.fk_pseudo_id as 'Autor o pseudo', autor.nom_autor as 'Autor real',
articulo.id_art as 'Id_art', articulo.nom_art as 'Nombre Articulo'
from autor,art_aut,articulo
where autor.id_autor = art_aut.fk_id_autor and art_aut.fk_id_art = articulo.id_art order by autor.id_autor asc;