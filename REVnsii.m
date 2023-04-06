function REV = REVnsii(p,delta,N)
    if nargin == 2
        N = 200;
    end
    itertime = N * 10; q = 1 - p; % l = q/p;
    initial_weight = N * 10;
    
    % R: 1,..,N
    R = zeros(N,1);
    r = zeros(N,1);
    A = zeros(N,N);
    % hpos = @(n) l^n/(l^n+1); hneg = @(n) 1/(l^n+1);
    log_diff = log(p) - log(q);
    hpos = @(n) 1 ./(exp(n .* log_diff)+1); hneg = @(n)1 - 1./(exp(n .* log_diff)+1);

    probw = zeros(N,N); % Probability Weight matrix. For each eta^(i), the support is 0~i.
    probw(0+1,0+1) = initial_weight;
    probw(1+1,1+1) = initial_weight;
    for i = 2+1 : N
        for k = 1 : N
            if k > 1
                probw(i,k) = probw(i,k) + probw(i-1,k-1) * (hpos(k-1-1)*q + hneg(k-1-1)*p);
            end
            if k < N
                probw(i,k) = probw(i,k) + probw(i-1,k+1) * (hpos(k+1-1)*p + hneg(k+1-1)*q);
            end
        end
    end
    eta = probw ./ sum(probw,2);

    for i = 1+1 : N
        r(i) = eta(i,1)/2 * (q-p);
    end

    A(0+1,0+1+1) = 1;
    A(1+1,1+1+1) = 1;
    for i = 2 + 1 : N - 1
        A(i,i+1) = 1 - eta(i,1) / 2;
        A(i,1+1) = eta(i,1) / 2;
    end
    % boundary
    A(N,1) = eta(N,1) / 2;
    A(N,N) = 1 - eta(N,1) / 2;
    
    
    for i = 1 : itertime
        R = r + delta * A * R;
    end
    
    REV = R(1);
end