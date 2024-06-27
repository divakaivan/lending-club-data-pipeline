import pandas as pd

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    
    data['term'] = data['term'].apply(lambda x: x.split()[0]).astype(int)
    data['earliest_cr_line'] = pd.to_datetime('01-' + data['earliest_cr_line'], format='%d-%b-%Y')
    data['issue_d'] = pd.to_datetime('01-' + data['issue_d'], format='%d-%b-%Y')

    return data


@test
def test_output_not_none(output, *args) -> None:

    assert output is not None, 'The output is undefined'

@test
def test_date_cols_converted(output, *args) -> None:

    crucial_dates = ['earliest_cr_line', 'issue_d']
    for col in crucial_dates:
        assert pd.api.types.is_datetime64_any_dtype(output[col]), f"Column '{col}' should be datetime"

@test 
def test_term_col_converted(output, *args) -> None:

    assert output['term'].dtype == int, "Column 'term' should be converted to integer"