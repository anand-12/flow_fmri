mean_velocity_map = mean(v(:,:,1,:), 4, 'omitnan');  % Dimension 4 is time

% Display the average velocity map
figure;
imagesc(mean_velocity_map)
colorbar
title('Average Velocity Map')
xlabel('X coordinate')
ylabel('Y coordinate')

% You might want to use the same color limits as the original data for consistency
clim([min(v(:)) max(v(:))])