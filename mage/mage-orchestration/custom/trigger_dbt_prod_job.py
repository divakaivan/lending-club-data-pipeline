import requests
import os

if 'custom' not in globals():
    from mage_ai.data_preparation.decorators import custom
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@custom
def trigger_job(*args, **kwargs):

    # add these variables to your env to run dbt jobs from here
    acc_id = os.environ.get('DBT_ACC_ID')
    job_id = os.environ.get('DBT_JOB_ID')
    api_key = os.environ.get('DBT_API_KEY')
    url = f"https://xm737.us1.dbt.com/api/v2/accounts/{acc_id}/jobs/{job_id}/run/"
    
    headers = {"Authorization": f"Token {api_key}"}
    body = {"cause": "Triggered via API"}

    response = requests.post(url, headers=headers, json=body)

    if response.status_code == 200:
        print("Job triggered! Check progress in dbt cloud")
    else:
        print("Request failed with status code:", response.status_code)
        print("Response:", response.text)
