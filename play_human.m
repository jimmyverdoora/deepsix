load netdata.mat % load the current brain
% Function to play against AI or challenge other AI.

% to place a piece type: [row,col]
%                        example: [1,1] = top left
% to move type: [n_pieces,row,col,to_row,to_col]
%               how many pieces in the tower to move from row-col to
%               to_row-to_col


% PARAMETERS --------------------------------------------------------------

brain_depth = 4;
human_start = 0; % 0 -> human = -1, 1 -> human = 1

% -------------------------------------------------------------------------




w1 = net.Iw{1};
w2 = net.Lw{2,1};
if size(net.Lw,1) == 3
    w3 = net.Lw{3,2};
    simu = @(vect) tansig(w3*tansig(w2*tansig(w1*vect)));
else
    simu = @(vect) tansig(w2*tansig(w1*vect));
end
    
    
    
board = zeros(5,5,5);
disp(board);
old_board = ones(5,5,5);
player = 1;
turn = 1;
    

if human_start
    move = board; %#ok<*UNRCH>
    % [row,column] place comand, [n_pieces,row,col,to_row,to_col]
    tmp_move = input('Move: ');
    if size(tmp_move,2) == 2
        move(tmp_move(1),tmp_move(2),1) = 1;
    else
        h_start = 5 - sum(squeeze(move(tmp_move(2),tmp_move(3),:)) == 0);
        h_finish = 5 - sum(squeeze(move(tmp_move(4),tmp_move(5),:)) == 0);
        for i = 0:tmp_move(1)-1
            move(tmp_move(4),tmp_move(5),h_finish+tmp_move(1)-i) = move(tmp_move(2),tmp_move(3),h_start-i);
            move(tmp_move(2),tmp_move(3),h_start-i) = 0;   
        end
    end
    old_board = board;
    board = move;
    disp(board);
    player = -player;
    turn = turn + 1;
end


while 1
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
        
    tic
    best = -1;
    for i=1:size(moves,1)
        % build the 125 vector for the net                
        tmp_move = moves{i};
        if size(w1,2) == 125
            value = alphabeta(tmp_move,brain_depth,-1,1,-player,simu);
        else
            value = alphabeta_features(tmp_move,brain_depth,-1,1,-player,simu);
        end
        if value*player > best && sum(sum(sum(tmp_move == old_board))) < 125
            best = value*player;
            move = tmp_move;
        end
        disp(i/size(moves,1));
    end
    toc
    
    % LOG
    if verbose
        fprintf('Turn: %d, player: %d, ', turn, player);
        fprintf('Value of best move for %d: %f', player, best);
        disp(' ');
    end
        
    
    % updates the board and switch the player
    board = move;
    disp(board);
    player = -player;
    turn = turn + 1;

    
    % PLAYER MOVE ---------------------------------------------------------
    move = board;
    % [row,column] place comand, [n_pieces,row,col,to_row,to_col]
    tmp_move = input('Move: ');
    if size(tmp_move,2) == 2
        if human_start
            move(tmp_move(1),tmp_move(2),1) = 1;
        else
            move(tmp_move(1),tmp_move(2),1) = -1;
        end
    else
        h_start = 5 - sum(squeeze(move(tmp_move(2),tmp_move(3),:)) == 0);
        h_finish = 5 - sum(squeeze(move(tmp_move(4),tmp_move(5),:)) == 0);
        for i = 0:tmp_move(1)-1
            move(tmp_move(4),tmp_move(5),h_finish+tmp_move(1)-i) = move(tmp_move(2),tmp_move(3),h_start-i);
            move(tmp_move(2),tmp_move(3),h_start-i) = 0;   
        end
    end
    old_board = board;
    board = move;
    disp(board);
    player = -player;
    turn = turn + 1;
    
  
end