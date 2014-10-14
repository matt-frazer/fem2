function explicitResult = explicitCalc( timeStep, timeStop, globalDisplacementVector, fNode, mNode, kEff, cEff, initConditions )
    
    % Set up and Initial Conditions
    count = 3;
    previousDisplacement = initConditions;
    currentDisplacement = initConditions;
    globalDisplacementVector(1) = currentDisplacement(1);
    globalDisplacementVector(2) = currentDisplacement(2);
    currentForce = [fNode(1) ; fNode(2)]; 
    
    %calculation matrices
    expA = (mNode / timeStep^2) + (cEff / (2 * timeStep ));
    expB = (kEff - ( 2 * mNode ) /( timeStep^2));
    expD =  ( (mNode / timeStep^2) - (cEff / (2 * timeStep )));
    
    %Iterations for Explicit dynamics
    for time = 0:timeStep:timeStop
        nextDisplacement = LU_Inv(expA) * (currentForce - expB*currentDisplacement - expD*previousDisplacement);
        % This is a note-to-self and can be removed
        % this value is the force applied externally the explicit calc
        % formula shown above accounts for the internal forces that act on
        % the node ( the spring and the damper)
        currentForce = [fNode(count) ; fNode(count+1)]; 
        previousDisplacement = currentDisplacement;
        currentDisplacement = nextDisplacement;
        globalDisplacementVector(count) = nextDisplacement(1);
        globalDisplacementVector(count+1) = nextDisplacement(2);
        count = count + 2;
    end
    % we should potentially be using our displacements to find the values
    % acceleratoin and velocity
    
    explicitResult = globalDisplacementVector;
end

