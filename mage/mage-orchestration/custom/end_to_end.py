from mage_ai.orchestration.triggers.api import trigger_pipeline

if 'custom' not in globals():
    from mage_ai.data_preparation.decorators import custom
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@custom
def transform_custom(*args, **kwargs):
    """
    args: The output from any upstream parent blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your custom logic here
    trigger_pipeline(
        'data_raw_to_gcs',
        variables={},
        check_status=True,
        error_on_failure=True,
        poll_interval=5,
        schedule_name='end2end',
        verbose=True,
    )
    trigger_pipeline(
        'gcs_to_bq',
        variables={},
        check_status=True,
        error_on_failure=True,
        poll_interval=5,
        schedule_name='end2end',
        verbose=True,
    )
    trigger_pipeline(
        'run_dbt_job',
        variables={},
        check_status=True,
        error_on_failure=True,
        poll_interval=5,
        schedule_name='end2end',
        verbose=True,
    )
