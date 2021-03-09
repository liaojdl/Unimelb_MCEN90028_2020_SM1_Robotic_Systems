function [r_link,t_link] = T_linkrad(DH_row)
%% description
%	T_link takes in one row of the D-H table DH_row of 1 by 4 numercial 
%   elements, and computes the 4 by 4 homogeneous translational matrix
%% input
%  &param DH_row: 1x4, [a,alpha,d,q],
%  a: translation along x, alpha: rotation about x
%  d: translation along z, q: rotation about z
%% output
%  &param t_link, 4x4, homogeneous translational matrix from the current
%  frame to the last

    %extracting parameters
    a = DH_row(1);
    alpha = DH_row(2);
    d = DH_row(3);
    q = DH_row(4);
    
    %compute translationak matrix
    dx = [1 0 0 a;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
    rx = [1 0 0 0;
         0 cos(alpha) -sin(alpha) 0;
         0 sin(alpha) cos(alpha) 0;
         0 0 0 1];
    dz = [1 0 0 0;
         0 1 0 0;
         0 0 1 d;
         0 0 0 1];
    rz = [cos(q) -sin(q) 0 0;
         sin(q) cos(q) 0 0;
         0 0 1 0;
         0 0 0 1];
    t_link = dx*rx*dz*rz;
    r_link = t_link(1:3,1:3);
end