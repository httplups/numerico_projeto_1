function X = gauss(A,B,n)
  [A, B] = pivoteamentopar(A, B, n);
  x = substituicaoreversa(A, B, n);
  X = x;
  #round(X .* 1000)/1000
endfunction

function [a, b] = pivoteamentopar(A, B, n)
  for j = 1:n
  #  printf("\n\nFASE: %d\n\n",j)
    [pivo, k] = maior(A, j, n);
    
    #permutação da matriz A -> linha j com a linha k
    A = permutacao(A,n, k, j);
    #permutação da matriz B -> linha j com a linha k
    B = permutacao(B, 1, k, j);
   
    #calcular os multiplicadores de cada linha
    for i =(j+1):n
      mult = A(i,j)/pivo;
      A(i,:) = A(i,:) - (mult*A(j,:));
      B(i,1) = B(i,1) - (mult*B(j,1));
    end 
  end
  a = A;
  b = B;
endfunction


# essa função retorna o maior elemento da coluna j em res, 
#e a linha q se encontra
function [pivo, linha] = maior(matriz, j, n)
  maior_abs = abs(matriz(j,j));
  linha = j;

  for i = j:n
    if ((abs(matriz(i,j))) > maior_abs)
      maior_abs = abs(matriz(i,j));
      linha = i;
    end
  end
  
  #agora que encontramos a linha do maior abs, iremos retornar o pivo
  #que é o maior, mas SEA o abs
  pivo = matriz(linha, j);
endfunction

function res = substituicaoreversa(P, B, n) 
  X = linspace(0,0,n)'; #matriz da solução
  for i = n:-1:1
    mult = 0;
    for k = (i+1):n
      if (k <= n)
        mult += P(i, k)*X(k);
      end
    end
 
    
    if (abs(P(i,i)) > 0)
      X(i) = ((B(i) - mult)/P(i,i));
    end #else ???
  end
  res = X;
endfunction

#permuta qualquer matriz, seja A ou B
function P = permutacao(m, tam, linha, coluna) 
  aux = linspace(0,0,tam);
  aux = m(linha,:);
  m(linha,:) = m(coluna,:);
  m(coluna,:) = aux;
  P = m;
endfunction

