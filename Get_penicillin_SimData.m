function [xn,dxn]=Get_penicillin_SimData(noise_level,init_num,dt,T)
changeplot;

% Y0=[16 1.1 0.1 0 102 0.75 10^(-5.0) 298 0];
inp1 = [1.1,0,8.5,30.0,295.5,2.22044604925031e-16,0,0,0,3,3,0.01,1,1];
tspan=[0:dt:T];
% [t1,x1] = ode23t('pengsimv1_6m',tspan,Y0,[],inp1);

xt = [];dxt= []; t = [];
for ii = 1:init_num
    Y0=[16+unifrnd(-0.1,0.1) 1.1+unifrnd(-0.05,0.05) 0.1 0 102+unifrnd(-0.1,0.1) 0.75+unifrnd(-0.15,0.15) 10^(-5.0) 298+unifrnd(-0.1,0.1) 0]; 
%     Y0=[16 1.1 0.1 0 102 0.75 10^(-5.0) 298 0];
    %integrate for each initial conditions
    [t1,x1] = ode45('pengsimv1_6m',tspan,Y0,[],inp1);
    
    x1_noise = x1+noise_level*randn(size(x1));
    if noise_level == 0
        for ll=1:length(tspan)
            dxf(ll,:) = pengsimv1_6m(t,x1_noise(ll,:),[],inp1);
        end
    else
        dxf=gradient(x1_noise,dt);
    end
    %store each instance
    t = [t; t1];
    xt = [xt; x1_noise];
    dxt = [dxt; dxf];
end

xn = xt(:, [1 3 4]);
dxn = dxt(:, [1 3 4]);

% xn = xt(:, [4, 1, 3]);
% dxn = dxt(:, [4, 1, 3]);
% % b=0.005*data(:,3)-0.04*data(:,4)-data(:,4)*0.33./data(:,5);
% c3 = data(:,1)./(0.0002+data(:,1).*(1+data(:,1)/0.1));
% b=0.005*c3.*data(:,3)-0.04*data(:,4);
toc