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

-- {% if var('is_dev_run', default=true) %} limit 100 {% endif %}