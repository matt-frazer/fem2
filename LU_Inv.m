function inv = LU_Inv(A)
   
    sizeA = size(A);
    n = sizeA(1);
    L = zeros(n);
    U = eye(n);
    
    %1
    L(:,1) = A(:,1);
    
    %2
    for j = 2:n
       U(1,j) = A(1,j)/L(1,1);
    end
    
    %3
    for j = 2:(n-1)
    
        %L
        for i = j:n
           c = 0;
           for k = 1:(j-1)
                c = c+(L(i,k)*U(k,j));
           end
           L(i,j) = A(i,j) - c; 
        end
        
        %U
        for k = j+1:n
           c = 0;
           for i = 1:(j-1)
                c = c+(L(j,i)*U(i,k));
           end
           U(j,k) = (A(j,k) - c)/L(j,j); 
        end
        
    end
    
    %4
    c = 0;
    for k = 1:(n-1)
        c = c + (L(n,k)*U(k,n));
    end
    L(n,n) = A(n,n) - c;
    
    %solve for columns of inv
    tempInv = zeros(n);
    for row = 1:n
        b = zeros(n,1);
        b(row) = 1;
        
        d = zeros(n,1);
        %solve [L][d] = [b]
        for i = 1:n
            c = 0;
            for k = 1:(i-1)
                c = c + L(i,k)*d(k);
            end
            d(i) = (b(i) - c)/L(i,i);
        end
        
        %solve [U][x] = [d]
        x = zeros(n,1);
        for i = n:-1:1
            c = 0;
            for j = (i+1):n
                c = c + U(i,j)*x(j);
            end
            x(i) = (d(i) - c)/U(i,i);
        end
        
        tempInv(:,row) = x;
    
    end
    inv = tempInv;
end