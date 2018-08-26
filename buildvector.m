function [vect] = buildvector(board)
    % This function returns the vector of features.

    % (1) how many queens are threatened by pawns
    % (2) how many bishops are threatened by pawns
    % ...
    % (25) how many pawns are threatened by queens
    
    % every entry is computed as delta: + total white entries - total
    % black entries.
    
    vect = zeros(25,1);
    
    for i = 1:5
        for j = 1:5
            
% queens ------------------------------------------------------------------
            if board(i,j,5)
                threats = zeros(5,1);
                
                i2 = i-1;
                j2 = j-1;
                while i2 > 0 && j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                    j2 = j2-1;
                end
                
                i2 = i+1;
                j2 = j-1;
                while i2 < 6 && j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                    j2 = j2-1;
                end
                
                i2 = i+1;
                j2 = j+1;
                while i2 < 6 && j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                    j2 = j2+1;
                end
                
                i2 = i-1;
                j2 = j+1;
                while i2 > 0 && j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                    j2 = j2+1;
                end
                
                i2 = i-1;
                j2 = j;
                while i2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                end
                
                i2 = i+1;
                j2 = j;
                while i2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                end
                
                i2 = i;
                j2 = j+1;
                while j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    j2 = j2+1;
                end
                
                i2 = i;
                j2 = j-1;
                while j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    j2 = j2-1;
                end
                
                vect(21:25) = vect(21:25) + board(i,j,5)*threats;
                
% bishops -----------------------------------------------------------------                
            elseif board(i,j,4)
                threats = zeros(5,1);
                
                i2 = i-1;
                j2 = j-1;
                while i2 > 0 && j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                    j2 = j2-1;
                end
                
                i2 = i+1;
                j2 = j-1;
                while i2 < 6 && j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                    j2 = j2-1;
                end
                
                i2 = i+1;
                j2 = j+1;
                while i2 < 6 && j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                    j2 = j2+1;
                end
                
                i2 = i-1;
                j2 = j+1;
                while i2 > 0 && j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                    j2 = j2+1;
                end
                
                vect(16:20) = vect(16:20) + board(i,j,4)*threats;
                
% knights -----------------------------------------------------------------                
            elseif board(i,j,3)
                threats = zeros(5,1);                
                
                i2 = i-2;
                j2 = j-1;
                if i-2 > 0 && j-1 > 0 && board(i-2,j-1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i-2;
                j2 = j+1;
                if i-2 > 0 && j+1 < 6 && board(i-2,j+1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i-1;
                j2 = j+2;
                if i-1 > 0 && j+2 < 6 && board(i-1,j+2,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i+1;
                j2 = j+2;
                if i+1 < 6 && j+2 < 6 && board(i+1,j+2,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i+2;
                j2 = j+1;
                if i+2 < 6 && j+1 < 6 && board(i+2,j+1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i+2;
                j2 = j-1;
                if i+2 < 6 && j-1 > 0 && board(i+2,j-1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i+1;
                j2 = j-2;
                if i+1 < 6 && j-2 > 0 && board(i+1,j-2,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i-1;
                j2 = j-2;
                if i-1 > 0 && j-2 > 0 && board(i-1,j-2,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                vect(11:15) = vect(11:15) + board(i,j,3)*threats;
                
% rooks -------------------------------------------------------------------
            elseif board(i,j,2)
                threats = zeros(5,1);
                
                i2 = i-1;
                j2 = j;
                while i2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2-1;
                end
                
                i2 = i+1;
                j2 = j;
                while i2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    i2 = i2+1;
                end
                
                i2 = i;
                j2 = j+1;
                while j2 < 6
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    j2 = j2+1;
                end
                
                i2 = i;
                j2 = j-1;
                while j2 > 0
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                        break
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                        break
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                        break
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                        break
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                        break
                    end
                    j2 = j2-1;
                end
                
                vect(6:10) = vect(6:10) + board(i,j,2)*threats;
                
% pawns -------------------------------------------------------------------
            elseif board(i,j,1)
                threats = zeros(5,1);
                
                i2 = i-1;
                j2 = j;
                if i-1 > 0 && board(i-1,j,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i+1;
                j2 = j;
                if i+1 < 6 && board(i+1,j,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i;
                j2 = j-1;
                if j-1 > 0 && board(i,j-1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                i2 = i;
                j2 = j+1;
                if j+1 < 6 && board(i,j+1,1)
                    if board(i2,j2,5)
                        threats(1) = threats(1) + 1;
                    elseif board(i2,j2,4)
                        threats(2) = threats(2) + 1;
                    elseif board(i2,j2,3)
                        threats(3) = threats(3) + 1;
                    elseif board(i2,j2,2)
                        threats(4) = threats(4) + 1;
                    elseif board(i2,j2,1)
                        threats(5) = threats(5) + 1;
                    end
                end
                
                vect(1:5) = vect(1:5) + board(i,j,1)*threats;
            end
        end
    end
end

