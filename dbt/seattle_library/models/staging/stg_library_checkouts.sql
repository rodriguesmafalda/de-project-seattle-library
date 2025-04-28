WITH source AS (
  SELECT
    title,
    isbn,
    publisher,
    subjects,
    materialtype AS material_type,
    checkoutyear AS checkout_year,
    checkoutmonth AS checkout_month,
    checkouts,
    creator,
    usageclass,
    checkouttype,
    publicationyear
  FROM `{{ var('project_id') }}.{{ var('dataset') }}.raw_checkouts`
)

SELECT
  title,
  isbn,
  publisher,
  subjects,
  material_type,
  SAFE_CAST(checkout_year AS INT64) AS checkout_year,
  SAFE_CAST(checkout_month AS INT64) AS checkout_month,
  SAFE_CAST(checkouts AS INT64) AS checkouts,
  creator,
  usageclass,
  checkouttype,
  SAFE_CAST(publicationyear AS INT64) AS publication_year
FROM source
WHERE checkout_year IN (2018, 2019, 2020)
