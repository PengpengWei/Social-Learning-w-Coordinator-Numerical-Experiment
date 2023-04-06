function SW = SWbhw(p,delta)
    q = 1 - p;
    % SW = q*(2-p*delta^2)/(2*(1-delta)*(1-p*q*delta^2));
    SW = q*(1-p*delta^2)/((1-delta)*(1-p*q*2*delta^2));
end