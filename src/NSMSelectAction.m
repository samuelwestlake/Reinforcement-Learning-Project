function action = NSMSelectAction(LTM, STM, obs)
% Calculates the avarage discounted reward for each action based on the
% nearest sequences.
% Returns the action with the highest discounted reward.
global k;
global chance;  
mean_reward = zeros(1, 4);                                  % Mean reward for each action
n = unidrnd(100);                                           % Randome number from 0 -> 100 (as chance is input as a %age)
if n > chance                                               % If chace is 90%
    rewards = [];                                           % Tmp vector of rewards
    nearest_steps = KNearest(LTM, STM, obs);                % Get k nearest steps
    for i = 1:4                                             % For each possible action
        for j = 1:k
            if nearest_steps(j, 2) == i                     % If action 
                rewards = [rewards, nearest_steps(j, 3)];   % Append reward to rewards
            end
        end
        if isempty(rewards)                                 % If no nearest steps for this action
            mean_reward(i) = 0;                             
        else
            mean_reward(i) = mean(rewards);                 % Store mean reward for that action
        end
    end
end
if n <= chance || range(mean_reward) == 0                   % If chance is 10% OR all mean_rewards are the same
% if n <= chance                                            % If chance is 10% 
    action = unidrnd(4);                                    % Random action
else 
    [~, action] = max(mean_reward);                         % Use NSM
end
end