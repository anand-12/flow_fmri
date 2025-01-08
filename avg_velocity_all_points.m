mean_velocity_map = mean(v(:,:,1,:), 4, 'omitnan');

figure;
imagesc(mean_velocity_map)
colorbar
title('Average Velocity Map')
xlabel('X coordinate')
ylabel('Y coordinate')

clim([min(v(:)) max(v(:))])



highlight_mask = (mean_velocity_map > 100) | (mean_velocity_map < -100);


figure;
imagesc(mean_velocity_map);
colorbar;
title('Average Velocity Map with Highlighted Regions');
xlabel('X coordinate');
ylabel('Y coordinate');
hold on;

[x_highlight, y_highlight] = find(highlight_mask);
scatter(y_highlight, x_highlight, 10, 'r', 'filled'); 

clim([min(v(:)) max(v(:))]);
hold off;

[rows, cols] = find(highlight_mask);


figure;


for i = 1:length(rows)
    
    y_coord = rows(i);
    x_coord = cols(i);
    
    
    time_series = squeeze(v(y_coord, x_coord, 1, :));
    
    
    subplot(ceil(sqrt(length(rows))), ceil(sqrt(length(rows))), i);
    plot(1:length(time_series), time_series);
    xlabel('Frame Number');
    ylabel('Velocity');
    title(['Point (' num2str(x_coord) ',' num2str(y_coord) ')']);
    grid on;
end


sgtitle('Velocity Time Series for Highlighted Points');

