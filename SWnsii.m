function SW = SWnsii(p,delta)
    q = 1 - p;
    MUL2 = 1 + (1 - 2 * delta * delta * p) / sqrt(1 - 4 * delta * delta * p * q);
    DEN1 = (1 - delta) * (1 + sqrt(1 - 4 * delta * delta * p * q));
    SW = q * MUL2 / DEN1;
end