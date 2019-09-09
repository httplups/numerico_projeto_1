# calcular P, usar A

function P = gera_prob(A, n)
  for i = 1:n
    for j = 1:n
      if (sum(A(i,:)) == 0)
         P(i,j) = (1/n);
      else 
         P(i,j) = A(i,j)/sum(A(i,:));
      end
    end
  end
endfunction


