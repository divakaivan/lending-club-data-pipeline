{{
    config(
        materialized='table'
    )
}}

with loan_data as (
    select
        sub_grade,
        borrower_id,
        loan_amnt,
        int_rate,
        term,
        installment,
        grade,
        loan_status,
        date_id,
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
        issue_d
    from {{ ref('stg_lending_data') }}
),

fact_loans as (
    select
        l.sub_grade,
        l.borrower_id,
        b.emp_title,
        b.emp_length,
        b.home_ownership,
        b.annual_inc,
        b.verification_status,
        b.address,
        l.loan_amnt,
        l.int_rate,
        l.term,
        l.installment,
        l.grade,
        l.loan_status,
        l.date_id,
        d.issue_d,
        d.issue_year,
        d.issue_quarter,
        d.issue_month,
        l.dti,
        l.earliest_cr_line,
        l.open_acc,
        l.pub_rec,
        l.revol_bal,
        l.revol_util,
        l.total_acc,
        l.initial_list_status,
        l.application_type,
        l.mort_acc,
        l.pub_rec_bankruptcies,
        l.purpose,
        l.title
    from loan_data l
    left join {{ ref('dim_borrower') }} b on l.borrower_id = b.borrower_id
    left join {{ ref('dim_date') }} d on l.issue_d = d.issue_d
)

select * from fact_loans