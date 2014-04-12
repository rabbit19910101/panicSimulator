function [ checkBool ] = checkAutomateObj( automateObj )
%CHECKSETTINGS Summary of this function goes here
%   Detailed explanation goes here
if ~iscell(automateObj)
    checkBool = false;
    return
elseif any(size(automateObj,1) ~= 1 || size(automateObj,2) == 0 ||...
        size(automateObj,2) > 3)
    checkBool = false;
    return
elseif ~testNum(automateObj{1}, 'int', [1, 3], [1, 1], [0, 2])
    checkBool = false;
    return
elseif numel(automateObj{1}) == 2
    if automateObj{1}(1) == automateObj{1}(2) || ...
            (automateObj{1}(1) ~= 3 && automateObj{1}(2) ~= 3)
        checkBool = false;
        return
    end
end
for k = 2:length(automateObj{1})+1
    automateNr = automateObj{1}(k-1);
    switch automateNr
        case 1
            fieldNames = {'automateNr',...
                          'vDesList',...
                          'vDesIndex',...
                          'averageIndex',...
                          'averageN',...
                          'timeNeeded'};
            if isfield(automateObj{k}, fieldNames)
                 if any(~testNum(automateObj{k}.automateNr, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.vDesList, 'double', [-inf,inf], [1, 1], [1,inf]) ||...
                         ~testNum(automateObj{k}.vDesIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.averageIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.averageN, 'int', [1,inf], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.timeNeeded, 'double', [-inf,inf], [1, 1], [length(automateObj{k}.vDesList),length(automateObj{k}.vDesList)]))
                    checkBool = false;
                    return
                 end
            else
                checkBool = false;
                return
            end
        case 2
            fieldNames = {'automateNr',...
                          'wallAngleList',...
                          'wallAngleIndex',...
                          'averageIndex',...
                          'averageN',...
                          'timeNeeded'};
             if isfield(automateObj{k}, fieldNames)
                 if any(~testNum(automateObj{k}.automateNr, 'int', [2,2], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.wallAngleList, 'double', [0,pi/2], [1, 1], [1,inf]) ||...
                         ~testNum(automateObj{k}.wallAngleIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.averageIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.averageN, 'int', [1,inf], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.timeNeeded, 'double', [-inf,inf], [1, 1], [length(automateObj{k}.wallAngleList),length(automateObj{k}.wallAngleList)]))
                    checkBool = false;
                    return
                 end
             else
                checkBool = false;
                return
             end
        case 3
            fieldNames = {'automateNr',...
                          'timesAgentsThroughDoor',...
                          'hFig',...
                          'runN'};
             if isfield(automateObj{k}, fieldNames)
                 if any(~testNum(automateObj{k}.automateNr, 'int', [3,3], [1, 1], [1,1]) ||...
                         ~testNum(automateObj{k}.timesAgentsThroughDoor, 'double', [0,inf], [0, inf], [0,inf]) ||...
                         ~testNum(automateObj{k}.hFig, 'double', [0,inf], [0, 1], [0,1]) ||...
                         ~testNum(automateObj{k}.runN, 'int', [1,inf], [1, 1], [1,1]) )
                    checkBool = false;
                    return
                 end
             else
                checkBool = false;
                return
             end                
    end
end

checkBool = true;
end

