function possible_moves = possible(board,player)
    % Takes the board and returns the possible moves for player.
    
    % if there is the winning move, this function returns player.
    % possible moves is a kx5x5x5 matrix. Each row is a board.
    
    possible_moves = {};
    
    exit = 0;
    for i = 1:5
        if ~exit
        for j = 1:5
            
            % PLACING -----------------------------------------------------
            if ~board(i,j,1)
                new = board;
                new(i,j,1) = player;
                possible_moves = [possible_moves; new]; %#ok<AGROW>
                
            % MOVING ------------------------------------------------------
            
            
            
% -------------------------------------------------------------------------
% ----------- pawn --------------------------------------------------------
% -------------------------------------------------------------------------
            elseif ~board(i,j,2)
                
                % move up -------------------------------------------------
                if i-1 > 0 && board(i-1,j,1)
                    new = board;
                    new(i,j,1) = 0;
                    if board(i-1,j,5) && board(i,j,1) == player % win
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i-1,j,5)
                    elseif board(i-1,j,4)
                        new(i-1,j,5) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i-1,j,3)
                        new(i-1,j,4) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i-1,j,2)
                        new(i-1,j,3) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    else
                        new(i-1,j,2) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    end
                    
                end
                
                % move down -----------------------------------------------
                if i+1 < 6 && board(i+1,j,1)
                    new = board;
                    new(i,j,1) = 0;
                    if board(i+1,j,5) && board(i,j,1) == player % win
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i+1,j,5)
                    elseif board(i+1,j,4)
                        new(i+1,j,5) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i+1,j,3)
                        new(i+1,j,4) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i+1,j,2)
                        new(i+1,j,3) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    else
                        new(i+1,j,2) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    end
                    
                end
                
                % move left -----------------------------------------------
                if j-1 > 0 && board(i,j-1,1)
                    new = board;
                    new(i,j,1) = 0;
                    if board(i,j-1,5) && board(i,j,1) == player % win
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i,j-1,5)
                    elseif board(i,j-1,4)
                        new(i,j-1,5) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i,j-1,3)
                        new(i,j-1,4) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i,j-1,2)
                        new(i,j-1,3) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    else
                        new(i,j-1,2) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    end
                    
                end
                
                % move right ----------------------------------------------
                if j+1 < 6 && board(i,j+1,1)
                    new = board;
                    new(i,j,1) = 0;
                    if board(i,j+1,5) && board(i,j,1) == player % win
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i,j+1,5)
                    elseif board(i,j+1,4)
                        new(i,j+1,5) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i,j+1,3)
                        new(i,j+1,4) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    elseif board(i,j+1,2)
                        new(i,j+1,3) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    else
                        new(i,j+1,2) = board(i,j,1);
                        possible_moves = [possible_moves; new]; %#ok<AGROW>
                    end
                    
                end                
            % -------------------------------------------------------------
            
            
            
            
% -------------------------------------------------------------------------
% ----------- rook --------------------------------------------------------
% -------------------------------------------------------------------------
            elseif ~board(i,j,3)
                
                % move up -------------------------------------------------
                if i-1 > 0
                    for i2 = fliplr(1:i-1)
                        if board(i2,j,1)
                            new1 = board; % move just 1
                            new2 = board; % move 2
                            new1(i,j,2) = 0;
                            new2(i,j,1) = 0;
                            new2(i,j,2) = 0;
                            if board(i2,j,4) && board(i,j,2) == player % if there are 4 or plus
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j,5)
                                break
                            elseif board(i2,j,4)
                                break
                            elseif board(i2,j,3)
                                new1(i2,j,4) = board(i,j,2);
                                new2(i2,j,4) = board(i,j,1);
                                new2(i2,j,5) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            elseif board(i2,j,2)
                                new1(i2,j,3) = board(i,j,2);
                                new2(i2,j,3) = board(i,j,1);
                                new2(i2,j,4) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new1(i2,j,2) = board(i,j,2);
                                new2(i2,j,2) = board(i,j,1);
                                new2(i2,j,3) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                % move down -----------------------------------------------
                if i+1 < 6
                    for i2 = i+1:5
                        if board(i2,j,1)
                            new1 = board; % move just 1
                            new2 = board; % move 2
                            new1(i,j,2) = 0;
                            new2(i,j,1) = 0;
                            new2(i,j,2) = 0;
                            if board(i2,j,4) && board(i,j,2) == player
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j,5)
                                break
                            elseif board(i2,j,4)
                                break
                            elseif board(i2,j,3)
                                new1(i2,j,4) = board(i,j,2);
                                new2(i2,j,4) = board(i,j,1);
                                new2(i2,j,5) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            elseif board(i2,j,2)
                                new1(i2,j,3) = board(i,j,2);
                                new2(i2,j,3) = board(i,j,1);
                                new2(i2,j,4) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new1(i2,j,2) = board(i,j,2);
                                new2(i2,j,2) = board(i,j,1);
                                new2(i2,j,3) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                % move left -----------------------------------------------
                if j-1 > 0
                    for j2 = fliplr(1:j-1)
                        if board(i,j2,1)
                            new1 = board; % move just 1
                            new2 = board; % move 2
                            new1(i,j,2) = 0;
                            new2(i,j,1) = 0;
                            new2(i,j,2) = 0;
                            if board(i,j2,4) && board(i,j,2) == player % if there are 4 or plus
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i,j2,5)
                                break
                            elseif board(i,j2,4)
                                break
                            elseif board(i,j2,3)
                                new1(i,j2,4) = board(i,j,2);
                                new2(i,j2,4) = board(i,j,1);
                                new2(i,j2,5) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            elseif board(i,j2,2)
                                new1(i,j2,3) = board(i,j,2);
                                new2(i,j2,3) = board(i,j,1);
                                new2(i,j2,4) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new1(i,j2,2) = board(i,j,2);
                                new2(i,j2,2) = board(i,j,1);
                                new2(i,j2,3) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                if j+1 < 6
                    for j2 = j+1:5
                        if board(i,j2,1)
                            new1 = board; % move just 1
                            new2 = board; % move 2
                            new1(i,j,2) = 0;
                            new2(i,j,1) = 0;
                            new2(i,j,2) = 0;
                            if board(i,j2,4) && board(i,j,2) == player % if there are 4 or plus
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i,j2,5)
                                break
                            elseif board(i,j2,4)
                                break
                            elseif board(i,j2,3)
                                new1(i,j2,4) = board(i,j,2);
                                new2(i,j2,4) = board(i,j,1);
                                new2(i,j2,5) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            elseif board(i,j2,2)
                                new1(i,j2,3) = board(i,j,2);
                                new2(i,j2,3) = board(i,j,1);
                                new2(i,j2,4) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new1(i,j2,2) = board(i,j,2);
                                new2(i,j2,2) = board(i,j,1);
                                new2(i,j2,3) = board(i,j,2);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end                
            % -------------------------------------------------------------

            
            
            
            
% -------------------------------------------------------------------------
% ----------- knight ------------------------------------------------------
% -------------------------------------------------------------------------
            elseif ~board(i,j,4)
                
                % NNE -----------------------------------------------------
                i2 = i-2;
                j2 = j+1;
                if i2 > 0 && j2 < 6 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % NEE -----------------------------------------------------
                i2 = i-1;
                j2 = j+2;
                if i2 > 0 && j2 < 6 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % SEE -----------------------------------------------------
                i2 = i+1;
                j2 = j+2;
                if i2 < 6 && j2 < 6 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % SSE -----------------------------------------------------
                i2 = i+2;
                j2 = j+1;
                if i2 < 6 && j2 < 6 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % SSO -----------------------------------------------------
                i2 = i+2;
                j2 = j-1;
                if i2 < 6 && j2 > 0 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % SOO -----------------------------------------------------
                i2 = i+1;
                j2 = j-2;
                if i2 < 6 && j2 > 0 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % NOO -----------------------------------------------------
                i2 = i-1;
                j2 = j-2;
                if i2 > 0 && j2 > 0 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
                
                % NNO -----------------------------------------------------
                i2 = i-2;
                j2 = j-1;
                if i2 > 0 && j2 > 0 && board(i2,j2,1)
                    new1 = board; % move 1
                    new2 = board; % move 2
                    new3 = board; % move 3
                    new1(i,j,3) = 0;
                    new2(i,j,2) = 0;
                    new2(i,j,3) = 0;
                    new3(i,j,3) = 0;
                    new3(i,j,2) = 0;
                    new3(i,j,1) = 0;
                    if board(i2,j2,3) && board(i,j,3) == player % if there are 4 or plus 
                        possible_moves = player;
                        exit = 1;
                        break
                    elseif board(i2,j2,5)
                    elseif board(i2,j2,4)
                        new1(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1]; %#ok<AGROW>
                    elseif board(i2,j2,3)
                        new1(i2,j2,4) = board(i,j,3);
                        new2(i2,j2,4) = board(i,j,2);
                        new2(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                    elseif board(i2,j2,2)
                        new1(i2,j2,3) = board(i,j,3);
                        new2(i2,j2,3) = board(i,j,2);
                        new2(i2,j2,4) = board(i,j,3);
                        new3(i2,j2,3) = board(i,j,1);
                        new3(i2,j2,4) = board(i,j,2);
                        new3(i2,j2,5) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    else
                        new1(i2,j2,2) = board(i,j,3);
                        new2(i2,j2,2) = board(i,j,2);
                        new2(i2,j2,3) = board(i,j,3);
                        new3(i2,j2,2) = board(i,j,1);
                        new3(i2,j2,3) = board(i,j,2);
                        new3(i2,j2,4) = board(i,j,3);
                        possible_moves = [possible_moves; new1; new2; new3]; %#ok<AGROW>
                    end
                    
                end
            %--------------------------------------------------------------
            
            
            
            
% -------------------------------------------------------------------------
% ----------- bishop ------------------------------------------------------
% -------------------------------------------------------------------------            
            elseif ~board(i,j,5)
                
                % NO ------------------------------------------------------
                i2 = i-1;
                j2 = j-1;
                while i2 > 0 && j2 > 0
                    if board(i2,j2,1)
                        if board(i2,j2,2) && board(i,j,4) == player %at least 2 its win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,4) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new4 = board; % move 4
                            new1(i,j,4) = 0;
                            new2(i,j,3) = 0;
                            new2(i,j,4) = 0;
                            new3(i,j,2) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new4(i,j,1) = 0;
                            new4(i,j,2) = 0;
                            new4(i,j,3) = 0;
                            new4(i,j,4) = 0;
                            new1(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,2) = board(i,j,3);
                            new2(i2,j2,3) = board(i,j,4);
                            new3(i2,j2,2) = board(i,j,2);
                            new3(i2,j2,3) = board(i,j,3);
                            new3(i2,j2,4) = board(i,j,4);
                            new4(i2,j2,2) = board(i,j,1);
                            new4(i2,j2,3) = board(i,j,2);
                            new4(i2,j2,4) = board(i,j,3);
                            new4(i2,j2,5) = board(i,j,4);
                            possible_moves = [possible_moves; new1; new2; new3; new4]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2-1;
                    j2 = j2-1;
                end
                if exit
                    break
                end
                
                % NE ------------------------------------------------------
                i2 = i-1;
                j2 = j+1;
                while i2 > 0 && j2 < 6
                    if board(i2,j2,1)
                        if board(i2,j2,2) && board(i,j,4) == player %at least 2 its win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,4) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new4 = board; % move 4
                            new1(i,j,4) = 0;
                            new2(i,j,3) = 0;
                            new2(i,j,4) = 0;
                            new3(i,j,2) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new4(i,j,1) = 0;
                            new4(i,j,2) = 0;
                            new4(i,j,3) = 0;
                            new4(i,j,4) = 0;
                            new1(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,2) = board(i,j,3);
                            new2(i2,j2,3) = board(i,j,4);
                            new3(i2,j2,2) = board(i,j,2);
                            new3(i2,j2,3) = board(i,j,3);
                            new3(i2,j2,4) = board(i,j,4);
                            new4(i2,j2,2) = board(i,j,1);
                            new4(i2,j2,3) = board(i,j,2);
                            new4(i2,j2,4) = board(i,j,3);
                            new4(i2,j2,5) = board(i,j,4);
                            possible_moves = [possible_moves; new1; new2; new3; new4]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2-1;
                    j2 = j2+1;
                end
                if exit
                    break
                end
                
                % SE ------------------------------------------------------
                i2 = i+1;
                j2 = j+1;
                while i2 < 6 && j2 < 6
                    if board(i2,j2,1)
                        if board(i2,j2,2) && board(i,j,4) == player %at least 2 its win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,4) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new4 = board; % move 4
                            new1(i,j,4) = 0;
                            new2(i,j,3) = 0;
                            new2(i,j,4) = 0;
                            new3(i,j,2) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new4(i,j,1) = 0;
                            new4(i,j,2) = 0;
                            new4(i,j,3) = 0;
                            new4(i,j,4) = 0;
                            new1(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,2) = board(i,j,3);
                            new2(i2,j2,3) = board(i,j,4);
                            new3(i2,j2,2) = board(i,j,2);
                            new3(i2,j2,3) = board(i,j,3);
                            new3(i2,j2,4) = board(i,j,4);
                            new4(i2,j2,2) = board(i,j,1);
                            new4(i2,j2,3) = board(i,j,2);
                            new4(i2,j2,4) = board(i,j,3);
                            new4(i2,j2,5) = board(i,j,4);
                            possible_moves = [possible_moves; new1; new2; new3; new4]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2+1;
                    j2 = j2+1;
                end
                if exit
                    break
                end
                
                % SO ------------------------------------------------------
                i2 = i+1;
                j2 = j-1;
                while i2 < 6 && j2 > 0
                    if board(i2,j2,1)
                        if board(i2,j2,2) && board(i,j,4) == player %at least 2 its win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,4) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new4 = board; % move 4
                            new1(i,j,4) = 0;
                            new2(i,j,3) = 0;
                            new2(i,j,4) = 0;
                            new3(i,j,2) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new4(i,j,1) = 0;
                            new4(i,j,2) = 0;
                            new4(i,j,3) = 0;
                            new4(i,j,4) = 0;
                            new1(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,2) = board(i,j,3);
                            new2(i2,j2,3) = board(i,j,4);
                            new3(i2,j2,2) = board(i,j,2);
                            new3(i2,j2,3) = board(i,j,3);
                            new3(i2,j2,4) = board(i,j,4);
                            new4(i2,j2,2) = board(i,j,1);
                            new4(i2,j2,3) = board(i,j,2);
                            new4(i2,j2,4) = board(i,j,3);
                            new4(i2,j2,5) = board(i,j,4);
                            possible_moves = [possible_moves; new1; new2; new3; new4]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2+1;
                    j2 = j2-1;
                end
                if exit
                    break
                end
            % -------------------------------------------------------------
                
                
 
            
            
% -------------------------------------------------------------------------
% ----------- queen -------------------------------------------------------
% -------------------------------------------------------------------------                            
            else
                
                % NO ------------------------------------------------------
                i2 = i-1;
                j2 = j-1;
                while i2 > 0 && j2 > 0
                    if board(i2,j2,1)
                        if board(i,j,5) == player % win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,5) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new2 = board; % move 2 is the only non resign move
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new2(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,3) = board(i,j,5);
                            possible_moves = [possible_moves; new2]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2-1;
                    j2 = j2-1;
                end
                if exit
                    break
                end
                
                % NE ------------------------------------------------------
                i2 = i-1;
                j2 = j+1;
                while i2 > 0 && j2 < 6
                    if board(i2,j2,1)
                        if board(i,j,5) == player % win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,5) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new2 = board; % move 2 is the only non resign move
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new2(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,3) = board(i,j,5);
                            possible_moves = [possible_moves; new2]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2-1;
                    j2 = j2+1;
                end
                if exit
                    break
                end
                
                % SE ------------------------------------------------------
                i2 = i+1;
                j2 = j+1;
                while i2 < 6 && j2 < 6
                    if board(i2,j2,1)
                        if board(i,j,5) == player % win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,5) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new2 = board; % move 2 is the only non resign move
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new2(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,3) = board(i,j,5);
                            possible_moves = [possible_moves; new2]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2+1;
                    j2 = j2+1;
                end
                if exit
                    break
                end
                
                % SO ------------------------------------------------------
                i2 = i+1;
                j2 = j-1;
                while i2 < 6 && j2 > 0
                    if board(i2,j2,1)
                        if board(i,j,5) == player % win
                            possible_moves = player;
                            exit = 1;
                            break
                        elseif board(i2,j2,5)
                            break
                            
                        elseif board(i2,j2,4)
                            break
                            
                        elseif board(i2,j2,3)
                            break
                        
                        elseif board(i2,j2,2)
                            new = board;
                            new(i,j,5) = 0;
                            new(i2,j2,3) = -player;
                            possible_moves = [possible_moves; new]; %#ok<AGROW>
                            break
                        else
                            new2 = board; % move 2 is the only non resign move
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new2(i2,j2,2) = board(i,j,4);
                            new2(i2,j2,3) = board(i,j,5);
                            possible_moves = [possible_moves; new2]; %#ok<AGROW>
                            break
                        end
                    end
                    i2 = i2+1;
                    j2 = j2-1;
                end
                if exit
                    break
                end
                
                % move up -------------------------------------------------
                if i-1 > 0
                    j2 = j;
                    for i2 = fliplr(1:i-1)
                        if board(i2,j2,1)
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new1(i,j,5) = 0;
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new3(i,j,5) = 0;
                            if board(i,j,5) == player % win
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j2,5)
                                break
                            elseif board(i2,j2,4)
                                break
                            elseif board(i2,j2,3)
                                new1(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1]; %#ok<AGROW>
                                break
                            elseif board(i2,j2,2)
                                new1(i2,j2,3) = board(i,j,5);
                                new2(i2,j2,3) = board(i,j,4);
                                new2(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new2(i2,j2,2) = board(i,j,4);
                                new2(i2,j2,3) = board(i,j,5);
                                new3(i2,j2,2) = board(i,j,3);
                                new3(i2,j2,3) = board(i,j,4);
                                new3(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new2; new3]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                % move down -----------------------------------------------
                if i+1 < 6
                    j2 = j;
                    for i2 = i+1:5
                        if board(i2,j2,1)
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new1(i,j,5) = 0;
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new3(i,j,5) = 0;
                            if board(i,j,5) == player % win
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j2,5)
                                break
                            elseif board(i2,j2,4)
                                break
                            elseif board(i2,j2,3)
                                new1(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1]; %#ok<AGROW>
                                break
                            elseif board(i2,j2,2)
                                new1(i2,j2,3) = board(i,j,5);
                                new2(i2,j2,3) = board(i,j,4);
                                new2(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new2(i2,j2,2) = board(i,j,4);
                                new2(i2,j2,3) = board(i,j,5);
                                new3(i2,j2,2) = board(i,j,3);
                                new3(i2,j2,3) = board(i,j,4);
                                new3(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new2; new3]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                % move left -----------------------------------------------
                if j-1 > 0
                    i2 = i;
                    for j2 = fliplr(1:j-1)
                        if board(i2,j2,1)
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new1(i,j,5) = 0;
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new3(i,j,5) = 0;
                            if board(i,j,5) == player % win
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j2,5)
                                break
                            elseif board(i2,j2,4)
                                break
                            elseif board(i2,j2,3)
                                new1(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1]; %#ok<AGROW>
                                break
                            elseif board(i2,j2,2)
                                new1(i2,j2,3) = board(i,j,5);
                                new2(i2,j2,3) = board(i,j,4);
                                new2(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new2(i2,j2,2) = board(i,j,4);
                                new2(i2,j2,3) = board(i,j,5);
                                new3(i2,j2,2) = board(i,j,3);
                                new3(i2,j2,3) = board(i,j,4);
                                new3(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new2; new3]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
                
                % move right ----------------------------------------------
                if j+1 < 6
                    i2 = i;
                    for j2 = j+1:5
                        if board(i2,j2,1)
                            new1 = board; % move 1
                            new2 = board; % move 2
                            new3 = board; % move 3
                            new1(i,j,5) = 0;
                            new2(i,j,4) = 0;
                            new2(i,j,5) = 0;
                            new3(i,j,3) = 0;
                            new3(i,j,4) = 0;
                            new3(i,j,5) = 0;
                            if board(i,j,5) == player % win
                                possible_moves = player;
                                exit = 1;
                                break
                            elseif board(i2,j2,5)
                                break
                            elseif board(i2,j2,4)
                                break
                            elseif board(i2,j2,3)
                                new1(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1]; %#ok<AGROW>
                                break
                            elseif board(i2,j2,2)
                                new1(i2,j2,3) = board(i,j,5);
                                new2(i2,j2,3) = board(i,j,4);
                                new2(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new1; new2]; %#ok<AGROW>
                                break
                            else
                                new2(i2,j2,2) = board(i,j,4);
                                new2(i2,j2,3) = board(i,j,5);
                                new3(i2,j2,2) = board(i,j,3);
                                new3(i2,j2,3) = board(i,j,4);
                                new3(i2,j2,4) = board(i,j,5);
                                possible_moves = [possible_moves; new2; new3]; %#ok<AGROW>
                                break
                            end
                            
                        end
                    end
                    if exit
                        break
                    end
                end
             % ------------------------------------------------------------
                
                
                
            end
        end
        end
    end
    
    
end

