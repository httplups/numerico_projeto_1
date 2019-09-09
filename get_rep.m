function [rep, x] = get_rep(X,n,RA) 
  r = X(1); 
 linha = 1; 
  for i = 1:n
    if (X(i) > r)
      r = X(i);
      linha = i;
    end
  end
  #printf("Linha: %d\n", linha);
  #printf("R: %d\n", r);
  
  rep = RA(1, linha);
  X(linha) = 0;
  x = X;
endfunction