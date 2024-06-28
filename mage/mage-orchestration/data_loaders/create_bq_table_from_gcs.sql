-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `dataengcamp-427114.lending_club_bq.external_lending_data`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://lending_club_gcs/lending_club.parquet']
);