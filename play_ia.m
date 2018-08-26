function [traces,win] = play_ia(eps_greedy,sm_fac,net1,net2,verbose)
    % Plays a game between two AIs and returns the result.
    
    % esp_greedy: probability of taking a random move is:
    %       max(eps_greedy^(turn^epsilon_decr),eps_fixed)
    % sm_fac: smoothing factor for traces
    % net1, net2: networks who play
    % verbose: print or not
    
    % PARAMETERS
    depth = 2;
    epsilon_decr = 0.7;
    eps_fixed = 0.05;

    % recreates net weights to speed up computation
    w1a = net1.Iw{1};
    w2a = net1.Lw{2,1};
    if size(w1a,2) == 125
        w3a = net1.Lw{3,2};
        simu1 = @(vect) tansig(w3a*tansig(w2a*tansig(w1a*vect)));
    else
        simu1 = @(vect) tansig(w2a*tansig(w1a*vect));
    end
    
    w1b = net2.Iw{1};
    w2b = net2.Lw{2,1};
    if size(w1b,2) == 125
        w3b = net2.Lw{3,2};
        simu2 = @(vect) tansig(w3b*tansig(w2b*tansig(w1b*vect)));
    else
        simu2 = @(vect) tansig(w2b*tansig(w1b*vect));
    end
    
    
    % create empty board and traces    
    board = zeros(5,5,5); % rows, columns, height
    old_board = ones(5,5,5);
    player = 1;
    turn = 1;
    if size(w1a,2) == 125
        traces = board;
    else
        traces = buildvector(board);
    end
    
    while 1 % MAIN GAME CYCLE
        
        
        % find moves
        moves = possible(board,player);
        
        
        % victory check
        if size(moves,1) == 1
            win = moves;
            disp(' ');
            fprintf('%d WINS!', player);
            disp(' ');
            break
        end
        
        
        % find the move to take
        if rand < max(eps_greedy^(turn^epsilon_decr),eps_fixed)
            % random move
            move = cell2mat(datasample(moves,1));
            best = -2;
        else
            best = -1.1;
            for i=1:size(moves,1)
                % build the 125 vector for the net                
                tmp_move = moves{i};
                if player == 1
                    if size(w1a,2) == 125 % if played with the complete board as features
                        value = alphabeta(tmp_move,depth,-1,1,-player,simu1);
                    else % compressed features using buildvector
                        value = alphabeta_features(tmp_move,depth,-1,1,-player,simu1);
                    end
                else
                    if size(w1a,2) == 125
                        value = alphabeta(tmp_move,depth,-1,1,-player,simu2);
                    else
                        value = alphabeta_features(tmp_move,depth,-1,1,-player,simu2);
                    end
                end
                
                % checks if we have a new best move and we don't undo the
                % last move
                if value*player > best && sum(sum(sum(tmp_move == old_board))) < 125
                    best = value*player;
                    move = tmp_move;
                end
            end
        end
        
        
        % LOG
        if verbose
            fprintf('Turn: %d, player: %d, ', turn, player);
            fprintf('Value of best move for %d: %f', player, best);
            disp(' ');
        end
        
        % updates the board and switch the player
        old_board = board;
        board = move;
        player = -player;
        turn = turn + 1;
        
        
        % updates the trace
        if size(w1a,2) == 125
            traces = traces*sm_fac + (1-sm_fac)*board;
        else
            traces = traces*sm_fac + (1-sm_fac)*buildvector(board);
        end
    end
    
    % updates the trace for making the sum of coefficents equal to 1
    if size(w1a,2) == 125
        traces = traces + board*sm_fac^turn;
        traces = reshape(traces,[125,1]);
    else
        traces = traces + buildvector(board)*sm_fac^turn;
    end

end

