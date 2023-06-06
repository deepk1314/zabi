{{
    config(
        materialized='table'
    )
}}

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status,current_timestamp as load_dt, {{convert_date('_etl_loaded_at','YYYY-MM-DD' )}} AS loaded_dt,
   '{{ var("Life3", "Life3") }}' as CTL_SET_NAME


from {{ source('jaffle_shop', 'orders') }}