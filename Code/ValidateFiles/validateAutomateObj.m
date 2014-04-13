function [ validatedBool ] = validateAutomateObj( automateObj )
%VALIDATEAUTOMATEOBJ validates if automateObj is of right format
if ~iscell(automateObj)
    validatedBool = false;
    return
elseif any(size(automateObj,1) ~= 1 || size(automateObj,2) == 0 ||...
        size(automateObj,2) > 3)
    validatedBool = false;
    return
elseif ~validateNum(automateObj{1}, 'int', [1, 3], [1, 1], [0, 2])
    validatedBool = false;
    return
elseif numel(automateObj{1}) == 2
    if automateObj{1}(1) == automateObj{1}(2) || ...
            (automateObj{1}(1) ~= 3 && automateObj{1}(2) ~= 3)
        validatedBool = false;
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
                 if any(~validateNum(automateObj{k}.automateNr, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.vDesList, 'double', [-inf,inf], [1, 1], [1,inf]) ||...
                         ~validateNum(automateObj{k}.vDesIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.averageIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.averageN, 'int', [1,inf], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.timeNeeded, 'double', [-inf,inf], [1, 1], [length(automateObj{k}.vDesList),length(automateObj{k}.vDesList)]))
                    validatedBool = false;
                    return
                 end
            else
                validatedBool = false;
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
                 if any(~validateNum(automateObj{k}.automateNr, 'int', [2,2], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.wallAngleList, 'double', [0,pi/2], [1, 1], [1,inf]) ||...
                         ~validateNum(automateObj{k}.wallAngleIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.averageIndex, 'int', [1,1], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.averageN, 'int', [1,inf], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.timeNeeded, 'double', [-inf,inf], [1, 1], [length(automateObj{k}.wallAngleList),length(automateObj{k}.wallAngleList)]))
                    validatedBool = false;
                    return
                 end
             else
                validatedBool = false;
                return
             end
        case 3
            fieldNames = {'automateNr',...
                          'timesAgentsThroughDoor',...
                          'hFig',...
                          'runN'};
             if isfield(automateObj{k}, fieldNames)
                 if any(~validateNum(automateObj{k}.automateNr, 'int', [3,3], [1, 1], [1,1]) ||...
                         ~validateNum(automateObj{k}.timesAgentsThroughDoor, 'double', [0,inf], [0, inf], [0,inf]) ||...
                         ~validateNum(automateObj{k}.hFig, 'double', [0,inf], [0, 1], [0,1]) ||...
                         ~validateNum(automateObj{k}.runN, 'int', [1,inf], [1, 1], [1,1]) )
                    validatedBool = false;
                    return
                 end
             else
                validatedBool = false;
                return
             end                
    end
end

validatedBool = true;
end

