# Data pipeline

![Project diagram](/project_info/project_diagram.png)

- Raw **Lending Club** data comes from [Kaggle](https://www.kaggle.com/datasets/gabrielsantello/lending-club-loan-preprocessed-dataset)
- **Mage** is used to orchestrate the process:
  - extract data using kaggle's API and load it to **Google Cloud Storage**
  - create tables in **BigQuery**
  - run dbt transformation jobs
- **Terraform** is used to manage and provision the infrastructure needed for your data pipeline on Google Cloud Platform
- **dbt** is used to tran
