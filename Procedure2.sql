create or replace procedure filldetalle(nRows IN number) is
    type number_type is table of number(20) index by binary_integer;

    codFromFact number_type;
    codD        number_type;
    codProd     number_type;
    nroUnits    number_type;
    uniValue    number_type;
    codFact     number_type;
--     Limite inferior
    li number(20) := 0;
begin
    delete DETALLE;
    select CODIGOF bulk collect into codFromFact from FACTURA order by CODIGOF;

    for i in codFromFact.FIRST..codFromFact.LAST loop
        for j in 1..nRows loop
            codD(li) := li;
            codProd(li) := ceil(DBMS_RANDOM.VALUE(2000,10000));
            nroUnits(li) := ceil(DBMS_RANDOM.VALUE(10,1000));
            uniValue(li) := ceil(DBMS_RANDOM.VALUE(800,999999));
            codFact(li) := codFromFact(i);
            li := li + 1;
        end loop;

    end loop;
    forall k in 0..(li-1)
        insert into DETALLE values (codD(k),codProd(k),nroUnits(k),uniValue(k),codFact(k));
    commit;
end;