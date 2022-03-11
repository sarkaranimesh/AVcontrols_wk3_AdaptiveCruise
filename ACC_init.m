%%
clc; close all; clear all;
%%
data = xlsread('signal list.xlsx');
time_stamp = data(:,1);
V_host = data(:,2);
V_target_mps_NaN = data(:,3);
V_target_mps = data(:,4);
