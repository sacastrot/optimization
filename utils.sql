SELECT TO_DATE(
               TRUNC(
                       DBMS_RANDOM.VALUE(TO_CHAR(DATE '1999-01-01','J')
                           ,TO_CHAR(DATE '2022-11-17','J')
                           )
                   ),'J'
           ) FROM DUAL;