
x_coord = 69;  
y_coord = 124;  

time_series = squeeze(v(y_coord, x_coord, 1, :));
plot(1:length(time_series), time_series)
xlabel('Frame Number')
ylabel('Velocity')
title(['Velocity at Point (' num2str(x_coord) ',' num2str(y_coord) ')'])
grid on

    