-- 7. Условия те же, что в п. 6, только номер транзакции нужно дополнительно сбрасывать в единицу каждый раз, когда сумма меньше десяти.

select 
    t.client_id, type_id, amount, dttm,
  row_number() over(partition by client_id, reset_row_number order by dttm asc)
from(
select 
    tr.*,
  sum((amount < 100)::int) over(partition by client_id order by dttm asc) as reset_row_number   
from tr 
where 
    extract(year from dttm) = extract(year from now()) 
  and extract(month from dttm) = extract(month from dttm)) as t;

