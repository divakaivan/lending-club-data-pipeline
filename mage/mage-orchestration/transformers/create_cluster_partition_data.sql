-- Create partitoned and clustered table
CREATE OR REPLACE TABLE dataengcamp-427114.lending_club_bq.lending_club_partitioned_clustered
PARTITION BY DATE(issue_d)
CLUSTER BY grade AS
SELECT * FROM dataengcamp-427114.lending_club_bq.external_lending_data;