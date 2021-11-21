with payments as(
    select * from {{red('stg_payments')}}
),

pivoted as(
    select 
        order_id,
        sum(case when payment_method= 'bank_transfer' then amount else 0 end) as bank_transfer_ amount
        sum(case when payment_method= 'coupon' then amount else 0 end) as coupon_ amount
        sum(case when payment_method= 'credit_card' then amount else 0 end) as credit_card_ amount
        sum(case when payment_method= 'gift_card' then amount else 0 end) as gift_card_ amount

    from payments
    where status='success'
    group by 1

)

select * from pivoted