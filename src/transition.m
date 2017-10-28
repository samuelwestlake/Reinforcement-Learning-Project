function new_state = transition(state, action)
% Mapping of McCallum's grid world. Given the current state and action,
% Returns the new state
state_space = [4 1 1 1;
    5 2 2 2;
    6 3 3 3;
    7 4 1 4;
    9 5 2 5;
    11 6 3 6;
    7 8 4 7;
    8 9 8 7;
    9 10 5 8;
    10 11 10 9;
    11 11 6 10;];
new_state = state_space(state, action);
end
