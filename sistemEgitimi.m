
  egitimYuzdesi = get(handles.edit7,'string');
  gecerlilikYuzdesi = get(handles.edit9,'string');
  testYuzdesi = get(handles.edit8,'string');
  noronSay = get(handles.edit5,'string');
     
 
    ey = str2double(egitimYuzdesi); % 80
    gy = str2double(gecerlilikYuzdesi); % 20
    ty = str2double(testYuzdesi); % 20
    ns = str2double(noronSay); % 30
 
 

%% içe Veri Aktar    

    inputs = Ssum(:,:)';
    
    targets = Lsum(:,:)';
   
    %% Neural Network kismi

    % Create a Pattern Recognition Network
    hiddenLayerSize = ns;
  
    net = patternnet(hiddenLayerSize);

    net.divideParam.trainRatio = ey/100;
    net.divideParam.valRatio = gy/100;
    net.divideParam.testRatio = ty/100;
    
    net.trainParam.max_fail = 50;

    % Train the Network
    [net,tr] = train(net,inputs,targets);

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance = perform(net,targets,outputs);

    % Recalculate Training, Validation and Test Performance
    trainTargets = targets .* tr.trainMask{1};
    valTargets = targets  .* tr.valMask{1};
    testTargets = targets  .* tr.testMask{1};
    trainPerformance = perform(net,trainTargets,outputs);
    valPerformance = perform(net,valTargets,outputs);
    testPerformance = perform(net,testTargets,outputs);
    
    delete(h);
    msgbox('Sistem Eðitildi.');

save net;
