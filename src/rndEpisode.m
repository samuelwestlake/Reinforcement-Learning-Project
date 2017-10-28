function [nb_steps, episode] = rndEpisode()
% Takes random actions until the goal state is reached.
% Returns the number of steps and a record of each experience.
global goal_state;
global mem_size;  
nb_steps = 0;                                   % nb of steps taken
episode = zeros(mem_size, 3);                   % Initialise episode matrix
state = rndStartState();                        % Get a start location
while 1
    obs = observation(state);                   % Get observation
    action = unidrnd(4);                        % Generate a random action 
    episode(mem_size, :) = [obs, action, 1];    % Update episode
    nb_steps = nb_steps + 1;                    % Update nb_steps
    state = transition(state, action);          % Update state
    if state == goal_state                      % If the end state is reached
        break
    end
    episode = shiftUp(episode);                 % Shift rows up for next step
end
episode = calcReward(episode);                  % Calculate discounted reward
end