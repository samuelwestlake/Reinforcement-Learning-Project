function m = shiftUp(m)
% Returns m with all rows shifted up by 1
% NB: last row remains unchanged
for i = 1:length(m)-1                    
    m(i,:) = m(i+1,:);
end
end