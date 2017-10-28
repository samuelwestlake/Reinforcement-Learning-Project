% Samuel Westlake
% samuel.westlake@hotmail.co.uk
% Reinforcement Learning Assignment
% Implementation of a Reinforcement Learning algorithm for solving
% partially observable Markov decision problems. 

global goal_state;
global mem_size;
global chance;
global k;

goal_state = 2;                     % Number of the goal state 
mem_size = 20;                      % Max nb of rows in an 
chance = 10;                        % % chance of taking random action
k = 10;                             % Number of nearest steps to be stored
nb_episodes = 100;                  % Number of episodes to run

xlab = 'Episode Number';
ylab = 'Number of Steps Taken';

figure
subplot(1, 2, 1)                    % First plot in 1 x 2 
plot(rndTrial(nb_episodes));        % Plot steps for 100 random
title('Steps taken to solve through random actions')
xlabel(xlab)
ylabel(ylab)
axis([0, nb_episodes, 0, 500])      % Set axis limits
subplot(1, 2, 2)                    % Second plot in 1 x 2
plot(NSMTrial(nb_episodes));        % Plot steps for 100 NSM 
title('Steps taken to solve through NSM actions')
xlabel(xlab)
ylabel(ylab)
axis([0, nb_episodes, 0, 500])      % Set axis limits
