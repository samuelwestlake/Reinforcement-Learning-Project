function index = lastEpisode(m)
% Returns the index of the latest recorded episode in the LTM
% To prevent interating through blank episodes
n = size(m, 3);
index = 0;
for i = 1:n
    if any(any(m(:, :, i)))         % If there are any non-zero numbers
        index = index + 1;
    end
    if ~any(any(m(:, :, i)))        % If no non-zeros, break
        break
    end
end