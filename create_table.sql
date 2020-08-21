drop table if exists tr;

create table tr (
  client_id bigint,   -- id клиента
  type_id integer,    -- id типа транзакции
  amount numeric,     -- сумма транзакции
  dttm timestamp      -- таймстамп (дата+время) транзакции
);

COPY tr(client_id, type_id, amount, dttm) 
FROM '/home/atercygnus/mvideo_job_interview/transactions.csv' 
DELIMITER ',' 
CSV HEADER;

