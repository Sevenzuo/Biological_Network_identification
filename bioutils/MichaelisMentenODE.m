function dSdt = MichaelisMentenODE(t, S)
    % 定义初始参数
    Vmax = 1.5; % 最大反应速率
    Km = 0.3; % 米氏常数
    j_x = 0.6; % 底物的外部输入速率
    % 计算反应速率
    v = (Vmax * S) / (Km + S);
    % 底物浓度的变化速率
    dSdt = j_x - v;
end