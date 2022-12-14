create table factura(
    codigof number(20) primary key,
    fecha date not null
);

create table detalle(
    codigod number(20) primary key,
    codproducto number(20) not null,
    nro_unidades number(20) not null,
    valor_unitario number(20) not null,
    codfact number(20) not null references factura
);

create table prodxtipo(
    id number(20) primary key,
    codprod number(20) not null,
    tipo varchar(2) not null
);

drop table prodxtipo;
drop table detalle;
drop table factura;

insert into factura values(10, TO_DATE('2000/10/03', 'YYYY/MM/DD'));

insert into detalle values(1,1,35,35,10);

SELECT *
FROM factura f, detalle d
WHERE f.codigof = d.codfact;