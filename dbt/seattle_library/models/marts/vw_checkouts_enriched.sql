WITH fct AS (
  SELECT
    material_type,
    checkout_year,
    total_checkouts
  FROM {{ ref('fct_checkouts') }}
),

dim AS (
  SELECT
    material_type,
    usageclass
  FROM {{ ref('stg_library_checkouts') }}
  WHERE usageclass IS NOT NULL
  GROUP BY material_type, usageclass
)

SELECT
  fct.material_type,
  dim.usageclass AS material_category,
  fct.checkout_year,
  fct.total_checkouts
FROM fct
LEFT JOIN dim
ON fct.material_type = dim.material_type
