function fn = alg14_forcecalculation( r,dim,C)
%FORCECALC Summary of this function goes here
%   Detailed explanation goes here

    %initialize force matrix
    fn = zeros(dim,2);
    
    for i = 1:dim-1
        for j = i+1:dim
            % if two particles are connected
            if(C(i,j) == 1)
                %calculate distance
                dist = abs(r(i,:) - r(j,:));
                
                if(j == i + 1) %vertical neighbors
                    re = [0 1];
                    k = sqrt(2);
                elseif(j == i + sqrt(dim)) %horizontal neighbors
                    re = [1 0];
                    k = sqrt(2);
                else %diagonal neighbors
                    re = [1 1];
                    k = 1;
                end              

                delta = -(dist-re);
                f = k*delta;

                n = (r(i,:)-r(j,:))/dist;

                fij = f*n;
                
                %force is exerted both ways
                fn(i,:) = fn(i,:) + fij;
                fn(j,:) = fn(j,:) - fij;
            end
        end
    end
end