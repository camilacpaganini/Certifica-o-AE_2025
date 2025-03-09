WITH 
    pedido_motivo AS (
        SELECT 
            fk_pedido, 
            fk_motivo_venda 
        FROM {{ ref('stg_order_salesreson') }}
    )
,   motivos AS (
        SELECT 
            pk_motivo_venda, 
            nome_motivo 
        FROM {{ ref('stg_sales_reson') }}
    )
,   consolidado AS (
        SELECT 
            pedido_motivo.fk_pedido AS pk_pedido_motivovenda,
            LISTAGG(motivos.nome_motivo, ', ') WITHIN GROUP (ORDER BY motivos.nome_motivo) AS fk_motivo_venda_agrupado
        FROM pedido_motivo
        LEFT JOIN motivos 
            ON pedido_motivo.fk_motivo_venda = motivos.pk_motivo_venda
        GROUP BY pedido_motivo.fk_pedido
    )

SELECT *
FROM consolidado

