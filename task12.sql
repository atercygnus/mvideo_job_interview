-- 2. По каждому клиенту нужно выбрать последнюю транзакцию каждого типа.

select client_id, type_id, amount, dttm from(
  select 
    tr.*,
    rank() over(
      PARTITION BY client_id, type_id 
      ORDER BY dttm desc
    ) as rank
  from tr) as t 
 where rank = 1;

