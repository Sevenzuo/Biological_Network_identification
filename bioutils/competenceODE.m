function dxdt = competenceODE(t, x)
    % 定义初始参数
    a1 = 0.004; % 常数 a1
    a2 = 0.07; % 常数 a2
    a3 = 0.04; % 常数 a3
    b1 = 0.82; % 常数 b1
    b2 = 1854.5; % 常数 b2
    % 方程组
    dxdt = zeros(2,1); % column vector
    dxdt(1) = a1 + (a2 * x(1)^2) / (a3 + x(1)^2) - x(1) / (1 + x(1) + x(2));
    dxdt(2) = b1 / (1 + b2 * x(1)^5) - x(2) / (1 + x(1) + x(2));
end