function networkGraph = createRandomNetwork(nodeNum, area, comRadius) 
% createRandomNetwork create randome network where agents have neighbor
% agents which are in communication radius.
% networkGraph = createRandomNetwork(nodeNum, area, comRadius)
% 
% Parameters 
% ----------
% nodeNum : int
%     number of nodes in a network.
% area : [int, int]
%     the area where agent can exist.
% comRadius : int or double
%     commmunication radius
%     
% Returns
% ---------
% network : graph
%     the agent network structure
%     
    agentPosX = randi(area(1), nodeNum, 1);
    agentPosY = randi(area(2), nodeNum, 1);
    
    adjacencyMat = zeros(nodeNum);
    for i = 1:nodeNum
        adjacencyMat(i, i) = 1;
    end
    for i = 1:nodeNum-1
        for j = i+1:nodeNum
            if checkNeighbor(agentPosX(i), agentPosY(i), agentPosX(j), agentPosY(j), comRadius)
                adjacencyMat(i, j) = 1;
                adjacencyMat(j, i) = 1;
            end
        end
    end
 
    networkGraph = graph(adjacencyMat);
end

function isNeighbor = checkNeighbor(x1, y1, x2, y2, comRadius)
    if (x2 - x1)^2 + (y2- y1)^2 <= comRadius^2
        isNeighbor  = true;
    else
        isNeighbor = false;
    end
end