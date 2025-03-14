WITH 
    pedidos AS (
        SELECT * 
        FROM {{ ref('stg_sales_order_header') }}
    )
,   detalhes AS (
        SELECT * 
        FROM {{ ref('stg_sales_order_detail') }}
    )
,   motivos AS (
        SELECT * 
        FROM {{ ref('int_salesreson') }}
    )
,   consolidado AS (
        SELECT 
            CONCAT(detalhes.fk_pedido, '-', detalhes.fk_produto) AS pk_pedido_detalhe
        ,   detalhes.fk_pedido
        ,   pedidos.fk_cliente
        ,   pedidos.fk_cartao
        ,   COALESCE(motivos.fk_motivo_venda_agrupado, 'Sem Motivo') AS fk_motivo_venda_agrupado
        ,   detalhes.fk_produto
        ,   pedidos.data_pedido  
        ,   pedidos.fk_territorio
        ,   detalhes.quantidade
        ,   detalhes.preco_unitario
        ,   detalhes.desconto
        ,   (detalhes.quantidade * detalhes.preco_unitario) AS total_bruto
        ,   ((detalhes.quantidade * detalhes.preco_unitario) - detalhes.desconto) AS total_liquido
        ,   pedidos.valor_frete
        FROM detalhes
        LEFT JOIN pedidos 
            ON detalhes.fk_pedido = pedidos.pk_pedido
        LEFT JOIN motivos 
            ON detalhes.fk_pedido = motivos.pk_pedido_motivovenda
    )

SELECT *
FROM consolidado



