function nextState = msr_update(state, weight, prunNum)
% MSR_UPDATE calculate next statees of agents by MSR algorithm
% nextState = msr_update(state, weight, prunNum)
% 
% Parameters 
% ----------
% state : vector[double]
%     the statees of agents
% weight : matrix[double][double]
%     weight(i, j) is the weight parameter when the j -> i edge exists.
% prunNum : int
%     It represents the number of the agents nomal agents should cut down.
%     1 - 2*prunNum
%     
% Returns
% ---------
% nextState : vector[double]
%     the next statees of the agents
%     
    nextState = 1:length(state); 
    for i = 1:length(state)
        tmpS = 0;
        
        %calculate neighbor agents of agent i
        neighborIdx = find(weight(i, :));
        neighborWeight = 1:length(neighborIdx);
        neighborState = 1:length(neighborIdx);
        for k = 1:length(neighborIdx)
            neighborState(k) = state(neighborIdx(k));
            neighborWeight(k) = weight(i, neighborIdx(k));
        end
        
        %sort the statees of neighbor agents
        [sortedNeighborState, sortedNeighborIdx] = sort(neighborState);
        
        %calculate next state of agent i
        for j = 1:length(sortedNeighborState)
            if prunNum < j && j <= length(sortedNeighborState) - prunNum
                tmpS = tmpS + neighborWeight(sortedNeighborIdx(j))*sortedNeighborState(j);
            end
        end
        nextState(i) = tmpS;
    end
end