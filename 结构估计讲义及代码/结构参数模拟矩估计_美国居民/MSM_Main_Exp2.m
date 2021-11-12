
%%% precautionary saving

% utility function and parameter
NP=@(c) c.^(-1/rho);
UP=@(c) c.^(-rho);

% rule, backward
c=[]; 
w=[];

% solve backward 
for k=TR:-1:1
EUP=zeros(size(xc));
if k==TR
    EUP=EUP+beta*R*UP(gam0+gam1*(R*xc+1));
else
    EUP=EUP+beta*R*UP(Cnextp(R*xc/G(k+1)+1,w(:,1),c(:,1))*G(k+1));
end
ChiVec=NP(EUP);
MuVec =xc+ChiVec;
w=[MuVec,w];             % matrix of interpolation data
c=[ChiVec,c];             % matrix of interpolation data 
end

% simulation, forward
% set up the shocks
wzero=normrnd(0,1,[NN,1]);
w_sim=exp(mean_w0+sd_w0*wzero)+1;
C_sim=[];

for k=1:TR  
    wi=w_sim(:,k);
    ci=Cnextp(wi,w(:,k),c(:,k));
    C_sim=[C_sim,ci*Y_hat(k)];    
    if k<TR    
    wexp=R*(wi-ci)/(G(k+1))+1;
    w_sim=[w_sim,wexp]; 
    end
end

C_sim_hat=mean(log(C_sim))';

Gg=log(C_hat)-C_sim_hat;
Gg'*Gg;

W_sim=w_sim.*P_sim;
W_sim_hat=mean(log(W_sim))';
