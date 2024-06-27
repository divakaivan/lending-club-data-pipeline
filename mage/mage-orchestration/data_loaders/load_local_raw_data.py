from mage_ai.io.file import FileIO
import pandas as pd
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data_from_file(*args, **kwargs):

    filepath = "./datasets/lending_club_loan_two.csv"

    loan_dtypes = {
        'loan_amnt': float, 
        'term': str, 
        'int_rate': float, 
        'installment': float, 
        'grade': str, 
        'sub_grade': str,
        'emp_title': str, 
        'emp_length': str, 
        'home_ownership': str, 
        'annual_inc': float,
        'verification_status': str, 
        'issue_d': str, 
        'loan_status': str, 
        'purpose': str, 
        'title': str,
        'dti': float, 
        'earliest_cr_line': str, 
        'open_acc': float, 
        'pub_rec': float, 
        'revol_bal': float,
        'revol_util': float, 
        'total_acc': float, 
        'initial_list_status': str, 
        'application_type': str,
        'mort_acc': float, 
        'pub_rec_bankruptcies': float, 
        'address': str
    }

    data = pd.read_csv(filepath, dtype=loan_dtypes)
    return data


@test
def test_output_not_none(output, *args) -> None:

    assert output is not None, 'The output is undefined'

@test
def test_is_pd_df(output, *args) -> None:

    assert isinstance(output, pd.DataFrame), 'Output should be a pandas DataFrame'

@test
def test_expected_cols(output, *args) -> None:
    expected_columns = [
        'loan_amnt', 'term', 'int_rate', 'installment', 'grade', 'sub_grade',
        'emp_title', 'emp_length', 'home_ownership', 'annual_inc',
        'verification_status', 'issue_d', 'loan_status', 'purpose', 'title',
        'dti', 'earliest_cr_line', 'open_acc', 'pub_rec', 'revol_bal',
        'revol_util', 'total_acc', 'initial_list_status', 'application_type',
        'mort_acc', 'pub_rec_bankruptcies', 'address'
    ]
    assert all(col in output.columns for col in expected_columns), f'Output DataFrame should have expected columns: {expected_columns}'