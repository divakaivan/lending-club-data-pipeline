{{ config(materialized="table") }}

with
    raw_loan_data as (
        select * from {{ source("marts", "lending_club_partitioned_clustered") }}
    )

select
    {{ dbt_utils.generate_surrogate_key(["issue_d"]) }} as date_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "emp_title",
                "emp_length",
                "home_ownership",
                "annual_inc",
                "verification_status",
                "address",
            ]
        )
    }} as borrower_id,
    issue_d,
    loan_amnt,
    int_rate,
    term,
    installment,
    grade,
    sub_grade,
    purpose,
    title,
    loan_status,
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
    emp_title,
    emp_length,
    home_ownership,
    annual_inc,
    verification_status,
    address
from raw_loan_data

{% if var("is_dev_run", default=true) %} limit 100 {% endif %}
