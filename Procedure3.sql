create or replace procedure fillProdxtipo(nRows IN number) is
    type number_type is table of number(20) index by binary_integer;
    id number_type;
    codprod number_type;
    type varchar_type is table of varchar(2) index by binary_integer;
    tipo varchar_type;
begin
    delete PRODXTIPO;
    for i in 1..nRows loop
            id(i) := i;
            codprod(i) := round(dbms_random.value(1, nRows));
            tipo(i) := DBMS_RANDOM.STRING('U',2);
        end loop;
    forall j in 1..nRows
        insert into PRODXTIPO values(ID(j),CODPROD(j),TIPO(j));
    commit;
end;