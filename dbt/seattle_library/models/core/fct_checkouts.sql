WITH base AS (
    SELECT
        material_type,
        checkout_year,
        COUNT(*) AS total_checkouts
    FROM {{ ref('stg_library_checkouts') }}
    GROUP BY material_type, checkout_year
)

SELECT
    material_type,
    checkout_year,
    total_checkouts
FROM base
