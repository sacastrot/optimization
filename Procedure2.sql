-- TODO: Tiene errores la logica, no funciona
create or replace procedure filldetalle(nRows IN number) is
    type number_type is table of number(20) index by binary_integer;
    codigof number_type;

    codigod number_type;
    codproducto     number_type;
    nro_unidades    number_type;
    valor_unitario  number_type;
    codfact         number_type;
    cont number(20) := 0;
begin
    select CODIGOF bulk collect into codigof from FACTURA order by CODIGOF;

    for i in 0..codigof.LAST loop
        for j in 1..nRows loop
            codigod(i+j) := i+j;
            codproducto(i) := ceil(DBMS_RANDOM.VALUE(2000,10000));
            nro_unidades(i) := ceil(DBMS_RANDOM.VALUE(10,1000));
            valor_unitario(i) := ceil(DBMS_RANDOM.VALUE(800,999999));
            codfact(i+j) := codigof(i);
            cont := i+j;
        end loop;
    end loop;

    forall k in 1..cont
        insert into DETALLE values (CODIGOD(k),CODPRODUCTO(k),NRO_UNIDADES(k),VALOR_UNITARIO(k),CODFACT(k));

end;