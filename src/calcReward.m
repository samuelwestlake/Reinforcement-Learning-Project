function m = calcReward(m)      
% Takes an episode fills in the discounted reward column
% Returns the eposide
n = length(m);                  % n = number of rows
for i = 1:n                           
    m(i, 3) = 10*0.9^(n-i);     % Calculate discounted reward
end
end