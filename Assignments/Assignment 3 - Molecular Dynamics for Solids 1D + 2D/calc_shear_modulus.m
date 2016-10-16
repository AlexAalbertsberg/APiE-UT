function [gstruc] = calc_young_modulus(fn, dim, r, r0)
    force = 0;
    for i=sqrt(dim):sqrt(dim):dim
        force = force + fn(i,1);
    end
    d = sqrt(dim);
    
    Lx = sqrt(dim);
    Ly = sqrt(dim);
    
    dLx = max(r(:,1)) - Lx;
    
    %calculation of shear modulus
    gstruc = (force/d/Lx)/(dLx/Ly);
end