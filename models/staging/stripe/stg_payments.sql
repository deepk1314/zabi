
  

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,amount,
    -- amount is stored in cents, convert it to dollars
  --  amount / 100 as amount,
  {{ convert('amount') }} as amount_dollars,
    created as created_at  ,{{run_statement()}} as count_orders  
from {{ source('stripe', 'payment') }}