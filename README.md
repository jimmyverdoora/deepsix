|-------------------------------------------------------------|
|----------------------- D e e p S i x -----------------------|
|-------------------------------------------------------------|

A self learning artifical intelligence for the game Six Making.

Copyright (C) 2018 M. Roselli


1) Intro.
This MATLAB software provides the implementation of a
reinforcement learning agent which plays the game Six Making,
created by Blue Orange Games. The AI plays looking forward with
a tree search and evaluating every possible move using a neural
net.

2) Neural Network Evaluation.
The evaluation of the state of the game is provided by a
simple deep network. You can decide if you want to feed the
full board as an input or a vector of compressed features.
The latter option is recomended and better performing and it
is the one which beated current strongest AI "Smartbot".

3) Usage of the software.
If you want to train the AI from scratch, just run the file
netbuilder_features providing a size for the hidden layer (I
recomend 5-10) (or netbuilder if you want a network which takes
the full board as an input) which will create an empty net.
Then you can run the file train, setting the parameters for
the training as you wish (episodes, learning speed, etc.).
You can also modify the tecnical parameters inside the files,
they are always listed under the section "PARAMETERS". If you
don't want to train the AI, I provided the file with an alrady
trained network (netdata.mat). Run the file "play_human" to
play against the net or challenge another AI, a very basic GUI
is provided. The network you will play against is in the file
netdata.mat (provided as just said or made (updated) by the
training.

4) GUI.
The simple text GUI provided prints on the matlab terminal
5 matrices which are the 5 layers of the board. To make a
move just use the following comands:
to place:
[row, column]
to move:
[number_of_pieces_to_be_moved, from_row, from_column,
to_row, to_column]
for example, if you want to place in the top left just type
[1,1]
if you want to move 2 pieces from (1,2) to (4,5) just type
[2,1,2,4,5]
Note that the game has no checks for preventing wrong moves
because it's not the purpose of this software to play with it.

5) Improving and distributing the software.
Feel free to distribute the code just don't forget the
credits. If you want to develop different features for the
network evaluation to provide better results I will be
happy to know and add it to the project, just email to:
micheleroselli94@gmail.com.
