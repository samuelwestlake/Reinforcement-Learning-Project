function [prox, experience] = proximity(LTM, ltm_ep, ltm_step, STM, obs)
% Counts similar steps between current episode and an arbitary step in LTM.
% Returns how near the given step in the LTM is to the STM episode and obs.
% Returns a vector describing the matching LTM experience.
global mem_size;
experience = LTM(ltm_step, :, ltm_ep);                              % LTM experience at given step
prox = 0;                                                           % Initialize prox
if LTM(ltm_step, 1, ltm_ep) == obs                                  % If observations match
    prox = 1;                                                       
    ltm_step = ltm_step - 1;                                        
    stm_step = mem_size;
    while stm_step > 0 && ltm_step > 0                              % Compare observations and actions
        if STM(stm_step, 1) == LTM(ltm_step, 1, ltm_ep) ...
                && STM(stm_step, 2) == LTM(ltm_step, 2, ltm_ep)
            prox = prox + 1;
            stm_step = stm_step - 1;
            ltm_step = ltm_step -1;
        else
            break
        end
    end
end 
end
