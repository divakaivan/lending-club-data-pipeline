import os
import kaggle
import pandas as pd

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data(*args, **kwargs):
    dataset = "ethon0426/lending-club-20072020q1"
    download_path = "datasets"

    if not os.path.exists(download_path):
        os.makedirs(download_path)
    
    files_exist = any(os.scandir(download_path))
    
    if not files_exist:
        kaggle.api.dataset_download_files(dataset, path=download_path, unzip=True)
        return "Dataset downloaded in ./datasets/"
    else:
        return "Dataset already exists in ./datasets/"


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
