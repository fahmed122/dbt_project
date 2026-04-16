WITH product_returns AS (
    SELECT 
        sales_id,
        product_sk,
        refund_amount,
        returned_qty,
        {{ multiply('refund_amount', 'returned_qty') }} AS calculated_gross_amount,
        return_reason,
        CURRENT_TIMESTAMP AS loaded_at
    FROM {{ ref('bronze_returns') }}
),

products AS (
    SELECT 
        product_sk,
        category
    FROM {{ ref('bronze_products') }}
)

SELECT 
    -- Keys
    r.sales_id,
    r.product_sk,
    
    -- Dimensions
    p.category,
    r.return_reason,
    
    -- Metrics
    r.returned_qty,
    r.refund_amount,
    r.calculated_gross_amount,
    
    -- Metadata
    r.loaded_at
FROM product_returns r
JOIN products p 
    ON r.product_sk = p.product_sk