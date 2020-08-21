-- 6. Выбрать данные из таблицы за текущий месяц, дополнив их номером транзакции в разрезе клиентов, который начинается с единицы и увеличивается на один в порядке возрастания dttm.

select 
    tr.*,
    row_number() over(partition by client_id order by dttm asc)
from tr 
where 
    extract(year from dttm) = extract(year from now()) 
  and extract(month from dttm) = extract(month from dttm);

