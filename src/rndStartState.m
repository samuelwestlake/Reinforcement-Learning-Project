function start_state = rndStartState()
% Returns a random value between 1 and 11 (not 2)
while 1
    start_state = unidrnd(11);
    if start_state ~= 2
        break
    end
end
end
