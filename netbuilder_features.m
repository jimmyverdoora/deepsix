function net = netbuilder_features(sz1)
    % Builds an empty network to be trained.
    
    % The network has 1 hidden layer of size sz1.

    net = network;                     
    net.numInputs = 1;               
    net.inputs{1}.size = 25;               
    net.numLayers = 2;        
    net.layers{1}.size = sz1;
    net.layers{2}.size = 1;
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'tansig';
    net.inputConnect(1) = 1;                      
    net.layerConnect(2,1) = 1;     
    net.outputConnect(2) = 1;
    net.trainFcn = 'traingd';
    net.initFcn = 'initlay';
   
    for i = 1:2
        net.layers{i}.initFcn = 'initwb';
    end
    for i = 1:2
        net.inputWeights{i,1}.initFcn = 'randsmall';
    end
    for i = 1:2
        for j = 1:2
            net.layerWeights{i,j}.initFcn = 'randsmall'; 
        end
    end
    
    net = init(net);
    
    save netdata.mat
end