function [statisticObj3] = plotStatistic3( statisticObj3 )
%PLOTSTATISTIC2 Summary of this function goes here
%   Detailed explanation goes here
if ishandle(statisticObj3.hFig)
    figure(statisticObj3.hFig);
else
    statisticObj3.runN = 1;
    statisticObj3.hFig = figure;
end
timesAgentsThroughDoor = statisticObj3.timesAgentsThroughDoor;
hold on;
scatter(zeros(1,length(timesAgentsThroughDoor)) + statisticObj3.runN, timesAgentsThroughDoor, 'xr');
hold off;
xlim([0, statisticObj3.runN + 1]);
set(gca, 'XTick', 1:max(1,ceil(statisticObj3.runN/20)):statisticObj3.runN);
xlabel('simulation number');
ylabel('t [s]');
title('Time for each agent passing the exit');
statisticObj3.runN = statisticObj3.runN +1;
end