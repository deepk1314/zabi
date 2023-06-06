

{% snapshot dim_orders %}
    {{
        config(
          target_schema='DBT_DKALAHASTI',
          strategy='timestamp',
          unique_key='order_id',
          updated_at='load_dt',
          invalidate_hard_deletes=True
        )
    }}

    select * from {{ ref('stg_jaffle_shop_orders') }}

{% endsnapshot %}