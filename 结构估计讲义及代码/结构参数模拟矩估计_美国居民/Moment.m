function Gg=Moment(beta,rho,gam0,gam1)
global R vp vt mean_w0 sd_w0
global TR NN
global NP UP Wi Hermit
global w c
global xc xg wg G C_hat Y_hat

% utility function
NP=@(c) c.^(-1/rho);
UP=@(c) c.^(-rho);
% Wi=@(xc,g,n,u) R*xc*exp(-sqrt(2*vp)*n)/g+exp(sqrt(2*vt)*u);
% Hermit=@(wg1,wg2,ci,g,n) beta*R*wg1*wg2*UP(ci*g*exp(sqrt(2*vp)*n))/pi;

% rule, backward
c=[]; 
w=[];

% solve backward, using vector
for k=TR:-1:1
EUP=zeros(size(xc));
if k==TR
    EUP=EUP+beta*R*UP(gam0+gam1*(R*xc+1));
else
for i=1:length(wg)
Wnextp=repmat(R*xc*exp(-sqrt(2*vp)*xg(i))/G(k+1),1,12)+repmat(exp(sqrt(2*vt)*xg'),100,1);
EUP1=beta*R*wg(i)*UP(Cnextp(Wnextp,w(:,1),c(:,1))*G(k+1)*exp(sqrt(2*vp)*xg(i)))/pi;    
EUP=EUP+EUP1*wg;
end
end
ChiVec=NP(EUP);
c=[ChiVec,c];             % matrix of interpolation data
w=[xc+ChiVec,w];             % matrix of interpolation data 
end

% simulation, forward
% set up the shocks
u=normrnd(0,1,[NN,TR]);
n=normrnd(0,1,[NN,TR]);
U=exp(sqrt(vt).*u);
N=exp(sqrt(vp).*n);
wzero=normrnd(0,1,[NN,1]);
w_sim=exp(mean_w0+sd_w0.*wzero)+U(:,1);
c_sim=[];
P_sim=[];

for k=1:TR  
    wt=w_sim(:,k);
    ct=Cnextp(wt,w(:,k),c(:,k));
    c_sim=[c_sim,ct];
    Pt=Y_hat(k)./U(:,k);
    P_sim=[P_sim,Pt];
    if k<TR    
    wexp=R.*(wt-ct)./(G(k+1).*N(:,k+1))+U(:,k+1);
    w_sim=[w_sim,wexp]; 
    end
end

C_sim=c_sim.*P_sim;

%dist=mean(log(Ci_sim))';
Gg=log(C_hat)-mean(log(C_sim))';
