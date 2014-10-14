function kEff = calcKEff( kVal, theta )
        % Ensure theta is in radians
        a = cos(angle(theta));
        b = sin(angle(theta));

        m = [ a^2     a*b     -a^2    -a*b;
              a*b     b^2     -a*b    -b^2;
              -a^2    -a*b    a^2     a*b;
              -a*b    -b^2    a*b     b^2;];
        
        kEff = kVal * m;
end

