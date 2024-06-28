with raw_borrower_data as (
    select
        borrower_id,
        emp_title,
        emp_length,
        home_ownership,
        annual_inc,
        verification_status,
        address
    from {{ ref('stg_lending_data') }}
)

select
    *
from raw_borrower_data

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %} limit 100 {% endif %}