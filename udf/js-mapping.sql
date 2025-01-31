CREATE TEMP FUNCTION mapLookup(key STRING) 
RETURNS STRING 
LANGUAGE js AS """
  const mapping = {
    'A': 'Apple',
    'B': 'Banana',
    'C': 'Cherry',
    'D': 'Date'
  };
  return mapping[key] || 'Unknown';
""";

WITH sample_data AS (
  SELECT 'A' AS key UNION ALL
  SELECT 'B' UNION ALL
  SELECT 'X'
)

SELECT key, mapLookup(key) AS value
FROM sample_data;
