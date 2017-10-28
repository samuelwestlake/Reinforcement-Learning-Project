function obs = observation(state)
% Returns the observation given the current state
observation_space = [14 14 14 10 10 10 9 5 1 5 3];
obs = observation_space(state);
end
