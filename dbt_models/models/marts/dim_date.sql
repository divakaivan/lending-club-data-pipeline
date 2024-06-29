with raw_date_data as (
    select
        date_id,
        issue_d
    from {{ ref('stg_lending_data') }}
)

select
    date_id,
    issue_d,
    extract(year from issue_d) as issue_year,
    extract(quarter from issue_d) as issue_quarter,
    extract(month from issue_d) as issue_month
from raw_date_data

{% if var('is_dev_run', default=true) %} limit 100 {% endif %}