
function freqDistMap(v)

    [ny, nx, ~, nt] = size(v);
    dom_freq_map = zeros(ny, nx);
    
    for i = 1:ny
        for j = 1:nx
            ts = squeeze(v(i,j,1,:));
            Y = fft(ts);
            P2 = abs(Y/nt);
            P1 = P2(1:floor(nt/2+1));
            [~, max_idx] = max(P1(1:end));  % if i want to skip DC component, do 2:end
            dom_freq_map(i,j) = max_idx;
        end
    end
    
    figure;
    imagesc(dom_freq_map);
    colorbar;
    title('Dominant Frequency Distribution');
end

freqDistMap(v);