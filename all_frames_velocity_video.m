% imagesc(v(:, :, 1, 10))
[x,y,z,t] = size(v);

fig = figure;
btn = uicontrol('Style', 'togglebutton', 'String', 'Pause', 'Position', [20 20 50 20]);

for i = 1:t
    if get(btn, 'Value') == 1
        waitfor(btn, 'Value', 0);
    end
    imagesc(v(:,:,1,i))
    title(['Frame ' num2str(i)])
    colorbar
    pause(0.005)
end