function nearest_steps = KNearest(LTM, STM, obs)
% Runs proximity for all recorded steps in LTM.
% Returns a list of the steps with the highest proximities. 
global mem_size;
global k;
nearest_steps = zeros(k, 4);                                    % Initialise nearest_steps
n = lastEpisode(LTM);                                           % Index of last episode containing non-zeros
for i = 1:n                                                     % For recorded episodes (only)          
    for j = 1:mem_size                                          % For all steps in LTM         
        [prox, experience] = proximity(LTM, i, j, STM, obs);    % Get proximity
        if prox > 0                                                     
            [min_prox, index] = min(nearest_steps(:, 4));       % Lowest proximity in nearest_steps and corresponding index             
            if prox > min_prox                                  
                nearest_steps(index, :) = [experience, prox];   % Overwrite row with the lowest proximity
            end
        end
    end
end
end