with raw_date_data as (
    select
        issue_d
    from {{ source('marts', 'lending_club_partitioned_clustered') }}
)

select
    {{ dbt_utils.generate_surrogate_key([ 'issue_d' ]) }} as date_id,
    issue_d,
    extract(year from issue_d) as issue_year,
    extract(quarter from issue_d) as issue_quarter,
    extract(month from issue_d) as issue_month
from raw_date_data

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %} limit 100 {% endif %}