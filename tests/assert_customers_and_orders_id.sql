-- There must always be customer ID mapping between customers and orders.
-- Therefore return records where this isn't true to make the test fail.
select
  a.customer_id as orders_customer_id,
  b.customer_id as customers_customer_id
from {{ ref('stg_orders') }} a
left join {{ ref('stg_customers') }} b
on a.customer_id = b.customer_id
where b.customer_id is null