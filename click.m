function plotSpectrumAtPoint(v)
    avg_image = mean(squeeze(v(:,:,1,:)), 3);  
    fig_image = figure('Name', 'Time-averaged Image');
    imagesc(avg_image);
    colorbar;
    hold on;

    while true

        figure(fig_image);

        [x_coord, y_coord, button] = ginput(1);

        if isempty(button)
            break
        end
        
        x_coord = round(x_coord);
        y_coord = round(y_coord);

        plot(x_coord, y_coord, 'r+', 'MarkerSize', 10);

        time_series = squeeze(v(y_coord, x_coord, 1, :));
        
        figure('Name', sprintf('point (%d,%d)', x_coord, y_coord));
        

        subplot(2,1,1)
        plot(1:length(time_series), time_series)
        xlabel('frame')
        ylabel('vel')
        title(['vel at point (' num2str(x_coord) ',' num2str(y_coord) ')'])
        grid on
        
        Fs = 30; % might be different
        L = length(time_series);
        Y = fft(time_series);
        P2 = abs(Y/L);
        P1 = P2(1:floor(L/2+1));
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;
        
        subplot(2,1,2)
        plot(f, P1)
        xlabel('f')
        ylabel('power')
        title(['power at (' num2str(x_coord) ',' num2str(y_coord) ')'])
        grid on
    end
end

plotSpectrumAtPoint(v)

