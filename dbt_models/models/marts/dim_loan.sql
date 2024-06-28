with raw_loan_data as (
    select
        purpose,
        title,
        sub_grade
    from {{ source('marts', 'lending_club_partitioned_clustered') }}
)

select
    {{ dbt_utils.generate_surrogate_key([ 'purpose', 'title', 'sub_grade' ]) }} as loan_id,
    purpose,
    title,
    sub_grade
from raw_loan_data

{% if var('is_test_run', default=true) %} limit 100 {% endif %}