{{ config(
    materialized="table"
)}}
with customer as(
    select * from {{ ref('stg_customer') }}
),
 
orders as (
    select * from {{ ref ('stg_orders') }}
),

customer_orders as (
 
    select
        customer_id,
 
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
 
    from orders
 
    group by 1
 
),
 

final as (
 
    select
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
 
    from customer
 
    left join customer_orders using (customer_id)
 
)
 
select * from final