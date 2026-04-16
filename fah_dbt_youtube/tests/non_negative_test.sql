SELECT * 
FROM 
{{ ref('bronze_sales') }}
WHERE
 net_amount < 0 AND gross_amount < 0