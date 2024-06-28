with raw_loan_data as (
    select *
    from {{ source('staging', 'lending_club_partitioned_clustered') }}
)

select
    sub_grade,
    {{ dbt_utils.generate_surrogate_key(['emp_title', 'emp_length', 'home_ownership', 'annual_inc', 'verification_status', 'address']) }} as borrower_id,
    loan_amnt,
    int_rate,
    term,
    installment,
    grade,
    loan_status,
    {{ dbt_utils.generate_surrogate_key(['issue_d']) }} as date_id,
    dti,
    earliest_cr_line,
    open_acc,
    pub_rec,
    revol_bal,
    revol_util,
    total_acc,
    initial_list_status,
    application_type,
    mort_acc,
    pub_rec_bankruptcies,
    purpose,
    title,
    emp_title,
    emp_length,
    home_ownership,
    annual_inc,
    verification_status,
    address,
    issue_d
from raw_loan_data

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %} limit 100 {% endif %}