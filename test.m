function analyze_velocity_statistics(v)
    mean_velocity_map = mean(v(:,:,1,:), 4, 'omitnan');
    std_velocity_map = std(v(:,:,1,:), 0, 4, 'omitnan');
    max_velocity_map = max(v(:,:,1,:), [], 4);
    min_velocity_map = min(v(:,:,1,:), [], 4);
    
    figure('Position', [100 100 1200 800]);
    
    subplot(2,2,1)
    imagesc(mean_velocity_map)
    colorbar
    title('Mean Velocity')
    
    subplot(2,2,2)
    imagesc(std_velocity_map)
    colorbar
    title('Velocity Standard Deviation')
    
    subplot(2,2,3)
    imagesc(max_velocity_map)
    colorbar
    title('Maximum Velocity')
    
    subplot(2,2,4)
    imagesc(min_velocity_map)
    colorbar
    title('Minimum Velocity')
end





function analyze_velocity_distribution(v)
    % Analyze velocity value distribution
    all_velocities = v(:,:,1,:);
    
    figure;
    histogram(all_velocities(:), 100, 'Normalization', 'probability')
    title('Velocity Distribution')
    xlabel('Velocity Value')
    ylabel('Probability')
    grid on
    
    % Add statistical annotations
    velocity_mean = mean(all_velocities(:), 'omitnan');
    velocity_std = std(all_velocities(:), 'omitnan');
    text(0.7, 0.9, sprintf('Mean: %.2f\nStd: %.2f', velocity_mean, velocity_std), ...
         'Units', 'normalized')
end

% Run all analyses
analyze_velocity_statistics(v);
analyze_velocity_distribution(v);