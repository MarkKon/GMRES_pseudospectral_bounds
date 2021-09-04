function [rho, ell] = rhoFromHeight(x,y,Z,e)
    [X,Y] = meshgrid(x,y);

    M = contour(X,Y,Z, [e,e]); %Pseudospektrum aus Hoehenlinie
    M(:,1)= []; %reelle Eintr�ge
    M(:,2) = []; %komplexe Eintr�ge
    k = boundary(transpose(M(1,:)),transpose(M(2,:))); %Index berichtigen
    ell = perimeter(polyshape(transpose(M(:,k))));  %Wegl�nge approximieren
    c = complex(M(1,k),M(2,k)); 
    p = polygon(c); %Polygon erstellen
    f = extermap(p); 
    plot(f);
    %aussen, nicht innen: f bildet das Innere der Einheitskreisscheibe
    %auf das �u�ere des Polygons ab, inv(f) das �u�ere des Polygons in 
    %die Einheitskreisscheibe. z |-> -1/z ist konform zwischen Innerem (ohne
    % Null) und �u�erem der Einheitskreisscheibe:
    rho = abs(evalinv(f,0)); 
end