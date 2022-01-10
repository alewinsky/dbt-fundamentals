with payments as (

    select
        *
    from {{ ref('stg_payments')}}

)

select
    order_id,
    sum(amount) as total_amount_per_order
from payments
group by 1
having total_amount_per_order < 0
