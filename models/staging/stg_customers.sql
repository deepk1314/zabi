{{ config
(
    materialized="table",
    post_hook="delete  from {{this}}  where customer_id=1"
 


) }}
select id as customer_id, first_name, last_name

from {{ source("jaffle_shop", "customers") }}
