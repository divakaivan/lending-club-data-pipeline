with raw_borrower_data as (
    select
        emp_title,
        emp_length,
        home_ownership,
        annual_inc,
        verification_status,
        address
    from {{ source('marts', 'lending_club_partitioned_clustered') }}
)

select
    {{ dbt_utils.generate_surrogate_key([ 'emp_title', 'emp_length', 'home_ownership', 'annual_inc', 'verification_status', 'address' ]) }} as borrower_id,
    emp_title,
    emp_length,
    home_ownership,
    annual_inc,
    verification_status,
    address
from raw_borrower_data

{% if var('is_test_run', default=true) %} limit 100 {% endif %}