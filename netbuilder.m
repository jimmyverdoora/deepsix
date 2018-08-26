function net = netbuilder(sz1,sz2)
    % Builds an empty network to be trained.
    
    % The network has 2 hidden layer of size sz1 and sz2.
    
    net = network;                     
    net.numInputs = 1;               
    net.inputs{1}.size = 125;               
    net.numLayers = 3;        
    net.layers{1}.size = sz1;
    net.layers{2}.size = sz2;
    net.layers{3}.size = 1;
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'tansig';
    net.layers{3}.transferFcn = 'tansig';
    net.inputConnect(1) = 1;                      
    net.layerConnect(2,1) = 1;
    net.layerConnect(3,2) = 1;        
    net.outputConnect(3) = 1;
    net.trainFcn = 'traingd';
    net.initFcn = 'initlay';
   
    for i = 1:3
        net.layers{i}.initFcn = 'initwb';
    end
    for i = 1:3
        net.inputWeights{i,1}.initFcn = 'randsmall';
    end
    for i = 1:3
        for j = 1:3
            net.layerWeights{i,j}.initFcn = 'randsmall'; 
        end
    end
    
    net = init(net);
    
    save netdata.mat
end