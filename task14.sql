-- 4. Посчитать среднемесячную сумму транзакций в разрезе клиентов отдельно по каждому типу транзакции.

select client_id, type_id, avg(amount) from(
  select 
    client_id, 
    type_id, 
    extract(year from dttm) as tyear, 
    extract(month from dttm) as tmonth, 
    sum(amount) as amount 
  from tr
  group by 
    client_id, 
    type_id, 
    extract(year from dttm), 
    extract(month from dttm)) as t
group by client_id, type_id
order by client_id, type_id;

