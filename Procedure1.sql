create or replace procedure fillFactura(nRows IN number) is
    type number_type is table of number(20) index by binary_integer;
    cont number_type;
    type date_type is table of date index by binary_integer;
    dates date_type;
begin
    delete DETALLE;
    delete factura;
    for i in 1..nRows loop
            SELECT TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '1999-01-01','J') ,TO_CHAR(DATE '2022-11-17','J'))),'J') into dates(i) FROM DUAL;
            cont(i) := i;
        end loop;
    forall j in 1..nRows
        insert into FACTURA values(cont(j),dates(j));
    commit;
end;
