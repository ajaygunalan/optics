syms f z_0;

q = f + j*z_0;

qNew = q/(-q/f +1);

distance = real(qNew);  % Distance to the right of the lens
