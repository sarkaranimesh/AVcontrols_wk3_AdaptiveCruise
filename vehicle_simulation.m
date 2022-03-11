clc;close all;
%%
% sim_time = 10;
% sample_time = 0.01;
% time = 0:sample_time:sim_time;
sim_options = ["one lane", "3-lane","reference track"];
vehicle_no = ['1','2','3'];
number_vehicles = vehicle_no(1);
plot_mode = sim_options(1);
fig_trajectory_result = figure(1);
%% simulated signals for acc vehicle
data = xlsread('sim_signals.xlsx');
x_pos = data(:,5);
y_pos = data(:,6);
x_pos_target = data(:,8);
y_pos_target = data(:,6);% car body end coordinates
w = 4.6 ; h = 1.2;
init_C_x = 1; init_C_y = 0;
velocity_host = data(:,2);
velocity_target = data(:,7);
Range_m = data(:,9);
range_rate = data(:,10);
%% import data
% time = out.tout;
% x_pos = out.Host_position;
% y_pos = zeros(length(x_pos),1);
% x_pos_target = out.Target_position;
% y_pos_target = zeros(length(x_pos_target),1);
% w = 4.6 ; h = 1.2;
% init_C_x = 1; init_C_y = 0;
% velocity_host = out.v_host_mps;
% velocity_target = out.V_target_mps;
% Range_m = out.Range_m;
% range_rate = out.Range_rate;

%% Road lines plot

fig_trajectory_result; hold on; 
y_cd = 1.8; y_cdn = -1.8;x_cd = 0;
yline(y_cd, 'Linewidth', 3);
yline(y_cd+0.1, 'Linewidth',3);
yline(y_cd, 'Linewidth', 3);
yline(y_cdn-0.1, 'Linewidth', 3);
xlabel('Time (sec)'); 
%% Initialize video
% myVideo = VideoWriter('myVideoFile'); %open video file
% myVideo.FrameRate = 15; 
% open(myVideo)

fig_trajectory_result; hold on;
max_distance = max([round(max(x_pos+1)) round(max(x_pos_target+1))]);

for ii = 1:length(x_pos)
    lowerleft_x = x_pos(ii)-w/2;
    lowerleft_y = y_pos(ii)-h/2  ;ans
    Ph = rectangle('Position',[lowerleft_x lowerleft_y w h],'Edgecolor','r','Linewidth',2);
    drawnow
     
    % plot the target car

    LL_x_target = x_pos_target(ii)-w/2;
    LL_y_target = y_pos_target(ii)-h/2  ;
    Ph_t = rectangle('Position',[LL_x_target LL_y_target w h],'Edgecolor','g','Linewidth',2);
    drawnow
%     title_draw = "time = "+num2str(time(ii), '%5.1f') + "Host velocity (mps) = "+num2str(velocity_host(ii), '%5.1f' + "Target velocity (mps)=  "+num2str(velocity_target(ii), '%5.1f')] 
%     title(title_draw);

    ylim([-5 5]);
    axis([x_pos(ii)-5 x_pos(ii)+48 -5 5]);
    
    delete(Ph_t);delete(Ph);
    %Pause and grab frame
%     pause(0.5)
%     frame = getframe(gcf); %get frame
%     writeVideo(myVideo, frame);
end
% close(myVideo)


