import os
import kaggle

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

download_path = "datasets"

@data_loader
def load_data(*args, **kwargs):
    dataset = "gabrielsantello/lending-club-loan-preprocessed-dataset"
    
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

    assert any(os.scandir(download_path)), 'File could not be downloaded to the selected directory'