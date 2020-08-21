-- 5. Посчитать агрегат с суммой транзакций всех типов нарастающим итогом (с первого дня месяца) в разрезе клиентов по дням.

select client_id, tdate, sum(daily_amount) over (partition by client_id order by tdate asc) as cumsum from(
select client_id, dttm::date as tdate, sum(amount) as daily_amount from tr group by client_id, tdate) as t;

