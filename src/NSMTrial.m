function [steps_vector, LTM] = NSMTrial(nb_episodes)
% Runs a series of NSM episodes
% Returns a vector of the number of stepes taken in each episode and
% a 3D array containing each experience for each episode.
global mem_size;
LTM = zeros(mem_size, 3, nb_episodes);          % Initialise LTM
steps_vector = zeros(nb_episodes, 1);           % Initialise steps_vector
for i = 1:nb_episodes
    [nb_steps, episode] = NSMEpisode(LTM);      % Run an episode
    LTM(:,:,i) = episode;                       % Store episode in LTM
    steps_vector(i) = nb_steps;                 % Store steps
end
end