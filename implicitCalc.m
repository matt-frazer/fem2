function implicitResult = implicitCalc( timeStep, timeStop, globalDisplacementVector, fNode, mNode, kEff, cEff, gamma, beta, initConditions )
    
    count = 3;
    currentPos = transpose(initConditions(1,:));
    currentVel = transpose(initConditions(2, :));
    currentAcc = transpose(initConditions(3, :));
    expA = 2 / (beta * timeStep^2) * mNode + kEff + (2*gamma / (beta * timeStep))* cEff;
    expB = (2 / (beta * timeStep^2)) * mNode  + (2*gamma / (beta * timeStep))* cEff;
    expC = (2 / (beta * timeStep)) * mNode  + (2*gamma / (beta ) - 1)* cEff;
    expD = ((1-beta) / beta ) * mNode + timeStep*cEff*(gamma - 1) + ((1-beta) / beta ) * gamma;
    nextForce = [fNode(3) ; fNode(4)];
    
    globalDisplacementVector(1) = currentPos(1);
    globalDisplacementVector(2) = currentPos(2);
    
    for time = 0:timeStep:timeStop
        nextPos = expA \ ( nextForce + expB * currentPos + expC * currentVel + expD * currentAcc);
        
        nextAcc = 2/(beta * timeStep) * (  (nextPos - currentPos) / timeStep ) - ...
            (2 / (beta * timeStep)) * currentVel - ((1 - beta) / beta) * currentAcc;
        
        nextVel = timeStep * ((1-gamma) * currentAcc + gamma *nextAcc) + currentVel;
        currentVel = nextVel;
        currentAcc = nextAcc;
        globalDisplacementVector(count) = nextPos(1);
        globalDisplacementVector(count+1) = nextPos(2);
        currentPos = nextPos;
        nextForce = [fNode(count + 2) ; fNode(count + 3) ];
        count = count + 2;
    end
    
    implicitResult = globalDisplacementVector;
end