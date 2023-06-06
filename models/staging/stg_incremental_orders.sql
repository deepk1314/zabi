{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

  select * from {{ ref('stg_jaffle_shop_orders') }}

  {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where load_dt > (select max(load_dt) from {{ this }})

{% endif %}