load netdata.mat % load the current brain

% PARAMETERS --------------------------------------------------------------

batch_size = 5;
alpha = 0.1; % importance of new event (0 = no learning, 1 = take only new)
eps_greedy = 0.4; % probability of taking a random move (decrease with turns)
smoothing_factor = 0.9; % exponential smoothing factor for traces
episodes = 5; % games to be played = episodes * batch_size
verbose = 1; % prints during playing
max_iter = 200; % for network training

% -------------------------------------------------------------------------

net.trainParam.epochs = max_iter;
perf_graph = zeros(1,episodes); % LOG

tic
for i = 1:episodes

    trace_vector = zeros(25,batch_size);
    wins_vector = zeros(1,batch_size);
    
    for j = 1:batch_size
        fprintf('Episode: %d, game %d',i,j);
        disp(' ')
        [traces,win] = play_ia(eps_greedy,smoothing_factor,net,net,verbose); % play a game
        trace_vector(:,j) = traces;
        wins_vector(1,j) = win;

    end
    
    [new_net,TR] = train(net,trace_vector,wins_vector); % learn from the game
    
    perf_graph(i) = TR.best_perf; % LOG
    
    net.Lw{2,1} = (1-alpha)*net.Lw{2,1} + alpha*new_net.Lw{2,1};
    net.Iw{1,1} = (1-alpha)*net.Iw{1,1} + alpha*new_net.Iw{1,1};
    
    save netdata.mat
end

toc
plot(perf_graph);