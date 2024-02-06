CREATE OR REPLACE FUNCTION total_clientes_dia(data DATE) 
RETURN NUMBER IS 
  total NUMBER;
BEGIN 
  SELECT COUNT(*) INTO total
  FROM clientes
  WHERE TRUNC(data_cadastro) = TRUNC(data);
  
  RETURN total;
END;