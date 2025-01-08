
x_coord = 83;  
y_coord = 96;  

time_series = squeeze(v(y_coord, x_coord, 1, :));
plot(1:length(time_series), time_series)
xlabel('Frame Number')
ylabel('Velocity')
title(['Velocity at Point (' num2str(x_coord) ',' num2str(y_coord) ')'])
grid on


Fs = 1; 
L = length(time_series);
Y = fft(time_series);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure
plot(f, P1)
xlabel('Frequency')
ylabel('Power')
title(['Power Spectrum at Point (' num2str(x_coord) ',' num2str(y_coord) ')'])
grid on