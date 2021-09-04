function [rhovec,Cvec,k] = testGMRES(A,N,opts,s,l)
    [x,y,Z] = eigtool(A,opts,1);
    e=s/100;
    rhovec = [];
    Cvec = [];
    k = -min(log10(min(Z))/2);
    for i = 1:min([k,5,l])
        e = e/100;
        [rho,ell] = rhoFromHeight(x,y,Z,e);
        rhovec = [rhovec rho];
        C = ell/(200*pi*e);
        Cvec = [Cvec C];
    end
    
    b = randn(N,1);
    [X,flag,relres,iter,resvec] = gmres(A,b,[],1e-14,N);
    ax = [0:length(resvec)-1];
    semilogy(ax,resvec/resvec(1),'k-','LineWidth',1.5); hold on
    M= [];
    for i = 1:min([k,5,l])
        semilogy(ax,Cvec(i)*resvec(1)*(rhovec(i).^(ax)), '--','LineWidth',1.5);
        M = [M ; Cvec(i)*resvec(1)*(rhovec(i).^(ax))];
    end
    semilogy(ax,min(M), 'b-','LineWidth',.7);
    legend('Residuum','eps = 1e-2','eps = 1e-4','eps = 1e-6','eps = 1e-8','eps = 1e-10', 'Min');
    xlabel('iteration'), ylabel('relative residual norm');
    hold off
end