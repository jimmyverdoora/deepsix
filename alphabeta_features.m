function v = alphabeta_features(node, depth, alpha, beta, player, net)
    % Performs the alpha-beta optimized tree search in the moves.
    
    % node: current board
    % depth: how many moves to look forward
    % player: who has to move in node
    % net: that is used to calculate values

    if depth == 0
        if size(possible(node,player),1) == 1
            v = player;
        else
            v = buildvector(node);
            v = player*net(v*player);
        end
        
    elseif player == 1
    	v = -1;
        moves = possible(node,1);
        if size(moves,1) == 1
            v = 1;
        else
            for i = 1:size(moves,1)
                v = max(v, alphabeta_features(moves{i}, depth-1, alpha, beta, -1, net));
                alpha = max(alpha, v);
                if beta <= alpha
                   break % (* beta cut-off *)
                end
            end
        end
        
    else
        v = 1;
        moves = possible(node,-1);
        if size(moves,1) == 1
            v = -1;
        else
            for i = 1:size(moves,1)
                v = min(v, alphabeta_features(moves{i}, depth-1, alpha, beta, 1, net));
            	beta = min(beta, v);
                if beta <= alpha
                     break % (* alpha cut-off *)
                end
            end
        end
    end
end