WITH dedup_query AS (
    SELECT 
        id,
        itemName,
        category,
        updateDate,
        row_number() OVER (PARTITION BY id ORDER BY updateDate DESC) AS deduplication_id
    FROM {{ source('source', 'items') }}
)

SELECT 
    id,
    itemName,
    category,
    updateDate  
FROM dedup_query
WHERE deduplication_id = 1


