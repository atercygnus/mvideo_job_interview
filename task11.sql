-- 1. По каждому клиенту найти максимальную сумму транзакции с type_id=1 за текущий месяц, дополнив выборку полем с максимальной суммой транзакции этого типа за месяц, соответствующий текущему в прошлом году.

select t1.client_id, max_current_month, coalesce(max_current_month_last_year, 0) as max_prev_month from(
(select 
	client_id, 
  max(amount) as max_current_month
from tr
where 1=1
  and type_id = 1 
  and extract(year from dttm) = extract(year from now())
  and extract(month from dttm) = extract(month from now())
group by client_id) t1
left join
(select 
	client_id, 
  max(amount) as max_current_month_last_year
from tr
where 1=1
  and type_id = 1 
  and extract(year from dttm) = extract(year from now()) - 1
  and extract(month from dttm) = extract(month from now())
group by client_id) t2
on t1.client_id = t2.client_id);

