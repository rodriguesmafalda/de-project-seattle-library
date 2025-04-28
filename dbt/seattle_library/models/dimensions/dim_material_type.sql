WITH source AS (
    SELECT DISTINCT
        material_type
    FROM {{ ref('stg_library_checkouts') }}
    WHERE material_type IS NOT NULL
)

SELECT
    material_type
FROM source
