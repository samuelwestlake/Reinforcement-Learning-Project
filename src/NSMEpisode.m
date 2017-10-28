function [nb_steps, STM] = NSMEpisode(LTM)
% Takes an action given by NSMSelectAction until the goal state is reached.
% Returns the number of steps and a record of each experience.
% NB: STM = current episode
global goal_state;
global mem_size;
nb_steps = 0;                                % Counter for number of steps
state = rndStartState();                     % Get a start location
STM = zeros(mem_size, 3);                    % Initialise STM
while 1                       
    obs = observation(state);                % Current observation
    action = NSMSelectAction(LTM, STM, obs); % Select an action
    state = transition(state, action);       % Update state
    STM(mem_size, :) = [obs, action, 1];     % Update matrix
    nb_steps = nb_steps + 1;                 % Update nb_steps
    if state == goal_state                   % If the end state is reached
        break
    end
    STM = shiftUp(STM);                      % Shift rows up for next step
end
STM = calcReward(STM);                       % Calculate discounted reward 
end