function [estruc,vstruc] = calc_young_modulus(fn, dim, r, r0)
    force = 0;
    for i=sqrt(dim):sqrt(dim):dim
        force = force + fn(i,2);
    end
    d = sqrt(dim);
    
    Lx = sqrt(dim);
    Ly = sqrt(dim);
    
    dLx = max(r(:,1)) - Lx;
    dLy = max(r(:,2)) - Lx;
    
    %calculation of Young's modulus
    estruc = (force/d/Lx)/(dLy/Ly);
    
    %calculation of Poisson ratio
    vstruc = dLx/dLy;

end