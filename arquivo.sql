CREATE OR REPLACE PROCEDURE realizar_promocao(v_id_produto INT, porcentagem_promocao NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
	v_preco_antigo NUMERIC;
	v_preco_novo NUMERIC;
BEGIN
	SELECT preco INTO v_preco_antigo
		FROM produtos
		WHERE id_produto = v_id_produto;
	RAISE NOTICE 'Produto ID: % | Preço antes do desconto: R$ %', v_id_produto, v_preco_antigo;
		
	UPDATE produtos
		SET preco = preco * (1 - (porcentagem_promocao/100))
		WHERE id_produto = v_id_produto;

	SELECT preco INTO v_preco_novo
		FROM produtos
		WHERE id_produto = v_id_produto;
	RAISE NOTICE 'Produto ID: % | Preço depois do desconto: R$ %', v_id_produto, v_preco_novo;
END;
$$;

CALL realizar_promocao(1, 10)

SELECT * FROM produtos

UPDATE produtos
	SET preco = 4500
	WHERE id_produto = 1;