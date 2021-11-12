% MSM
% by James Zou 26/8/2017

% Declarations  
clear all
global beta rho gam0 gam1 
global R vp vt mean_w0 sd_w0
global Nmax Xmax Xmin Xint Nint
global TR NN
global NP UP Wi Hermit
global w c
global xc xg wg G C_hat Y_hat

% set parameter values
% second stage parameter
Par=[0.9596    0.5403    0.0006    0.0758]';
beta=Par(1);
rho=Par(2);
gam0=Par(3);
gam1=Par(4);

% first stage parameter
R=1.03440;
vp=0.0212;
vt=0.0440;
mean_w0=-2.7944810;
sd_w0=1.7838670;

% grid 
Nmax=100;
Xmax = 40;		
Xmin = 10^(-5);
Xint=2;
Nint=50;
% Grid over cash on hand; _xmin and _xmax exogenous; Program linearizes outside the grid
xc=logspace(log10(Xmin),log10(Xmax),Nmax)';

% shock
NN=20000;
TR=40;

% data
load('Hermite.mat');

% seting up data
load('data_raw.mat');  % age 26-65
G=Y_hat(2:40,:)./Y_hat(1:39,:);
G=[1;G];

%%% estimation
fun=@(x) DistMSM(x(1),x(2),x(3),x(4));
Par0 = [0.9596    0.5403    0.0006    0.0758];
fun(Par0)
tic
[x,fval] = fminsearch(fun,Par0)
toc

% 美国居民，结构参数的MSM估计结果
fun=@(x) DistMSM(x(1),x(2),x(3),x(4));
[Par,fval] = fminsearch(fun,Par0)

%
MSM_Main

%%% graph
plot(age,log(C_raw),'o',age,log(C_hat),'-',age,log(Y_hat),'b-*')
plot(age,log(C_raw),'o',age,C_sim_hat,'-',age,log(Y_hat),'b-*')

% 美国居民，结构参数的标准误
Par = [0.9591    0.5785    0.0006    0.0690]';
moment=@(x) Moment(x(1),x(2),x(3),x(4));
paraest=Par;
J=zeros(TR,4);
NM=50;
for i=1:NM
for j=1:length(paraest)
    a=zeros(size(paraest));
    eps=paraest(j)*1e-3;
    a(j)=eps;
    M(:,j)=(moment(paraest+a)-moment(paraest-a))/(2*eps);
end;
J=J+M;
end;
M=J/NM;
C_sim_sd=std(log(C_sim))';
V=diag(C_sim_sd.^2);
VarBR=pinv(M)*V*pinv(M');
stderror=sqrt(diag(VarBR));
stderror'

% 美国居民，结构参数显著性检验的t统计量，及P值
tvalue=Par./stderror;
tvalue'
pvalue=1-normcdf(tvalue,0,1);
pvalue'



