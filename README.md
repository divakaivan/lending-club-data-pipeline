# Project pipeline

![Project diagram](/project_info/project_diagram.png)

- Raw **Lending Club** data comes from [Kaggle](https://www.kaggle.com/datasets/gabrielsantello/lending-club-loan-preprocessed-dataset)
- **Mage** is used to orchestrate an end to end process including:
  - extract data using kaggle's API and load it to the **Google Cloud Storage** (used as a data lake)
  - create tables in **BigQuery** (used as a data warehouse)
  - run dbt transformation jobs
- **Terraform** is used to manage and provision the infrastructure needed for your data pipeline on Google Cloud Platform
- **dbt** is used to transform the data into dimension tables, add data tests, and create [documentation](https://lending-club-project-dbt-docs.netlify.app/)
- **Looker** is used to create a visualisation [dashboard](https://lookerstudio.google.com/reporting/de05bd99-c678-4088-8abd-fa0974c0da0e)

# Mage pipeline overview

![Mage pipeline overview](/project_info/mage_end_to_end_pipeline_overview.png)
