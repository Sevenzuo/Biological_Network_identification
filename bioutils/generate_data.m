clear all; close all; clc; 
addpath('./bioutils');
% define parameters of data generation
init_num = 2;
dt = 1;
T = 20;

% add noise
noise_level = 0;

[xt,dxt]=Get_Michaelis_Menten_SimData(noise_level,init_num,dt,T);
% [xt,dxt]=Get_competenceODE_SimData(noise_level,init_num,dt,T);
% [xt,dxt]=Get_penicillin_SimData(noise_level,init_num,dt,T);
% [xt,dxt]=Get_Yeast_glycolysis_SimData(noise_level,init_num,dt,T);

