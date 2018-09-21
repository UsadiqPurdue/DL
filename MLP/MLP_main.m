clc;clear;close all;

%% Replace this code with your own data reading

samples=100;features=10;
X=randn(samples,features);Y=randn(samples);

% Define number of layers here

%% Initialize weights and apply backpropagation

for i=1:epochs
    for j=1: samples
        
        x=X(j,:);y=Y(j);
        
        % Perform a forward-pass here. Calculate output of each layer till you reach 
        % the end
        
        
        % Compute delta of output layer and its weight updates
        
        % Backpropagate deltas to compute deltas and updated weights
        % of hidden layers
        
    end
    % Compute error at the end of each epoch
    % Plot training error
end