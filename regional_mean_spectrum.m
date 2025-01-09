function analyzeRegion(v)
    avg_image = mean(squeeze(v(:,:,1,:)), 3);
    figure;
    imagesc(avg_image);
    colorbar;
    hold on;

    [x1,y1] = ginput(1);
    plot(x1,y1,'r+');
    [x2,y2] = ginput(1);
    plot(x2,y2,'r+');
    

    x1 = round(min(x1,x2));
    x2 = round(max(x1,x2));
    y1 = round(min(y1,y2));
    y2 = round(max(y1,y2));
    

    plot([x1 x2 x2 x1 x1], [y1 y1 y2 y2 y1], 'r-');
    

    region_data = v(y1:y2, x1:x2, 1, :);

    mean_ts = squeeze(mean(mean(region_data, 1), 2));

    figure;
    subplot(2,1,1);
    plot(mean_ts);
    xlabel('Time');
    ylabel('Velocity');
    title('Mean Time Series');
    grid on;

    Y = fft(mean_ts);
    L = length(mean_ts);
    P2 = abs(Y/L);
    P1 = P2(1:floor(L/2+1));
    P1(2:end-1) = 2*P1(2:end-1);
    f = (0:(L/2))/L;
    
    subplot(2,1,2);
    plot(f, P1);
    xlabel('Frequency');
    ylabel('Power');
    title('power spectrum');
    grid on;
end

analyzeRegion(v);