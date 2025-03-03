% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% Modified by Niall M. Mangan March 2016
function [xt,dxt]=Get_Yeast_glycolysis_SimData(noise_level,init_num,dt,T)
changeplot;

plottag = 0;

%% generate Data
% Integrate
tspan = 0:dt:T; % time vector

Sinit = rand(init_num,7);
Sinit = [Sinit; 2*rand(init_num,7)];
Sinit = [Sinit; 3*rand(init_num,7)];

% % need this many initial conditions to find the 6th state variable equation
% sss = 450; %5*sss is the number of initial conditions.
% Sinit = 0.01*rand(sss,7);
% Sinit = [Sinit; 0.1*rand(sss,7)];
% Sinit = [Sinit; 2*rand(sss,7)];
% Sinit = [Sinit; 4*rand(sss,7)];


measure = length(Sinit);
xt = [];dxt= []; t = [];
for ii = 1:measure
    %integrate for each initial conditions
    [t1,x1] = ode45(@yeastglycolysisNM, tspan, Sinit(ii,:));
    x1_noise = x1+noise_level*randn(size(x1));
    if noise_level == 0
        for ll=1:length(tspan)
            dxf(ll,:) = yeastglycolysisNM(t,x1_noise(ll,:));
        end
    else
        dxf=gradient(x1_noise,dt);
    end
    %store each instance
    t = [t; t1];
    xt = [xt; x1_noise];
    dxt = [dxt; dxf];
end


num2plot = 1:5*length(tspan);

if plottag >1
    % Plot data and derivatives
    figure(2)
    plot(t(num2plot,:) ,xt(num2plot,:),'o')
    hold on
    xlabel('time')
    ylabel('concentrations')
    drawnow
    
    figure(6)
    plot(t(num2plot,:), dxt(num2plot,:), '.')
    hold on
    xlabel('time')
    ylabel('derivative of concentrations w/ time')
    drawnow
end
toc
