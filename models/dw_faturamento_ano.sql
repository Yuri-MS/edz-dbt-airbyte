with dw_faturamento_ano as(
    select 
        date_part('year', purchased_at) as "Ano"
        , sum(ap.price) as "Faturamento"
    from
        public.airbyte_purchases pur 
        inner join public.airbyte_products ap 
            on pur.product_id = ap.id
    group by 1
    order by 1 desc    
)
select * from dw_faturamento_ano
