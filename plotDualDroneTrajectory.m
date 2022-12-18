function plotDualDroneTrajectory( d1_lat,d1_lon,d1_agl,...
                                  d2_lat,d2_lon,d2_agl,...
                                  delta_t,fps)

%Iteration time
current_t_s = 0;

% Setting up the Plot
figure; hold on
title(sprintf('Time: %0.2f sec', current_t_s), 'Interpreter', 'Latex');
xlabel('longitude(deg)', 'Interpreter', 'Latex')
ylabel('latitude(deg)', 'Interpreter', 'Latex')
zlabel('AGL(m)', 'Interpreter', 'Latex')
grid minor  % Adding grid lines
axis equal  % Equal axis aspect ratio
view(-37.5,30);  % Setting viewing angle

% Plotting with no color to set axis limits
plot3(d1_lat,d1_lon,d1_agl,'Color','none');
plot3(d2_lat,d2_lon,d2_agl,'Color','none');
% Plotting the first iteration
drone1_p = plot3(d1_lat(1),d1_lon(1),d1_agl(1),'b');
drone1_m = scatter3(d1_lat(1),d1_lon(1),d1_agl(1),'filled','b');

drone2_p = plot3(d2_lat(1),d2_lon(1),d2_agl(1),'r');
drone2_m = scatter3(d2_lat(1),d2_lon(1),d2_agl(1),'filled','r');

% Iterating through the length of the time array
for iteration = 1:length(d1_lat)
    % Updating the line
    drone1_p.XData = d1_lat(1:iteration);
    drone1_p.YData = d1_lon(1:iteration);
    drone1_p.ZData = d1_agl(1:iteration);
    % Updating the point
    drone1_m.XData = d1_lat(iteration); 
    drone1_m.YData = d1_lon(iteration);
    drone1_m.ZData = d1_agl(iteration);
    
    % Updating the line
    drone2_p.XData = d2_lat(1:iteration);
    drone2_p.YData = d2_lon(1:iteration);
    drone2_p.ZData = d2_agl(1:iteration);
    % Updating the point
    drone2_m.XData = d2_lat(iteration); 
    drone2_m.YData = d2_lon(iteration);
    drone2_m.ZData = d2_agl(iteration);
    % Updating the title
    title(sprintf('Time: %0.2f sec', current_t_s),...
    'Interpreter','Latex');
    current_t_s = current_t_s + delta_t;
    % Delay
    pause_time_s = 1/fps;
    pause(pause_time_s);
end

end

