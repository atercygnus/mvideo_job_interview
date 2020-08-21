-- 3. По каждому клиенту выбрать транзакции, сумма которых превышает сумму последней транзакции данного типа для данного клиента.

with t_last_tr as (
  select client_id, type_id, amount as last_tr_amount from(
    select 
      tr.*,
      rank() over(
        PARTITION BY client_id, type_id 
        ORDER BY dttm desc
      ) as rank
    from tr) as t 
   where rank = 1)
 select tr.client_id, tr.type_id, amount, last_tr_amount from(
 tr
 left join 
 t_last_tr
 on tr.client_id = t_last_tr.client_id and tr.type_id = t_last_tr.type_id)
 where amount > last_tr_amount
 order by client_id, type_id;

