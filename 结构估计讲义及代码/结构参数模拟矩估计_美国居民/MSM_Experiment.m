
% income shock
% permanent income shock
MSM_Main
C_sim_hat1=C_sim_hat;

MSM_Rural
G=[G(1:15);0.95*G(16:31)];  %pernament negative
SMM_Main
C_sim_hat2=C_sim_hat;

SMM_Rural
G=[G(1:15);1.05*G(16:31)];  %pernament positive
SMM_Main

plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*',age,C_sim_hat2,'m-o')

% precautionary saving
plot(age,C_hat,'bo',age,Y_hat,'r-+')
plot(age,Y_hat-C_hat,'bo')

Sum=0;
for i=1:10
    MSM_Main
    Sum=Sum+W_sim_hat;
end
W_sim_hat=Sum/10;  
W_sim_hat1=W_sim_hat;

Sum=0;
for i=1:10
    MSM_Main_Exp2
    Sum=Sum+W_sim_hat;
end
W_sim_hat=Sum/10;  
plot(age,W_sim_hat,'r-+',age,W_sim_hat1,'b-*')

MSM_Main
C_sim_hat1=C_sim_hat;
W_sim_hat1=W_sim_hat;

MSM_Main_Exp2

plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*')
plot(age,log(Y_hat)-C_sim_hat,'r-+',age,log(Y_hat)-C_sim_hat1,'b-*')
plot(age,log(Y_hat)-C_sim_hat,'r-+',age,C_sim_hat-C_sim_hat1,'b-*')
plot(age,W_sim_hat,'r-+',age,W_sim_hat1,'b-*')
plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*',age,Y_hat,'k-+')

[(exp(mean(W_sim_hat(5:9)-W_sim_hat1(5:9)))-1)*100
(exp(mean(W_sim_hat(10:14)-W_sim_hat1(10:14)))-1)*100
(exp(mean(W_sim_hat(15:19)-W_sim_hat1(15:19)))-1)*100
(exp(mean(W_sim_hat(20:24)-W_sim_hat1(20:24)))-1)*100
(exp(mean(W_sim_hat(25:29)-W_sim_hat1(25:29)))-1)*100
(exp(mean(W_sim_hat(30:34)-W_sim_hat1(30:34)))-1)*100
]'

[(exp(mean(W_sim_hat(1:5)-W_sim_hat1(1:5)))-1)*100
(exp(mean(W_sim_hat(6:10)-W_sim_hat1(6:10)))-1)*100
(exp(mean(W_sim_hat(11:15)-W_sim_hat1(11:15)))-1)*100
(exp(mean(W_sim_hat(16:20)-W_sim_hat1(16:20)))-1)*100
(exp(mean(W_sim_hat(21:25)-W_sim_hat1(21:25)))-1)*100
(exp(mean(W_sim_hat(26:31)-W_sim_hat1(26:31)))-1)*100]'

% 美国居民，预防性储蓄的生命周期影响
Sum=0;
for i=1:10
   MSM_Main;Sum=Sum+W_sim_hat;
end
W_sim_hat=Sum/10;W_sim_hat1=W_sim_hat;Sum=0;
for i=1:10
    MSM_Main_Exp2;Sum=Sum+W_sim_hat;
end
W_sim_hat=Sum/10;  
[(exp(mean(W_sim_hat(5:9)-W_sim_hat1(5:9)))-1)*100;(exp(mean(W_sim_hat(10:14)-W_sim_hat1(10:14)))-1)*100;
(exp(mean(W_sim_hat(15:19)-W_sim_hat1(15:19)))-1)*100;(exp(mean(W_sim_hat(20:24)-W_sim_hat1(20:24)))-1)*100;
(exp(mean(W_sim_hat(25:29)-W_sim_hat1(25:29)))-1)*100;(exp(mean(W_sim_hat(30:34)-W_sim_hat1(30:34)))-1)*100]'


%%% borrowing constraing
Sum=0;
for i=1:10
    MSM_Main
    Sum=Sum+C_sim_hat;
end
C_sim_hat=Sum/10;  
plot(age,C_hat,'o',age,C_sim_hat,'r-+')
C_sim_hat1=C_sim_hat;

Sum=0;
for i=1:10
    MSM_Main_Exp3
    Sum=Sum+C_sim_hat;
end
C_sim_hat=Sum/10;  
plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*')

MSM_Main
C_sim_hat1=C_sim_hat;
W_sim_hat1=W_sim_hat;

MSM_Main_Exp3

plot(age,C_hat,'o',age,C_sim_hat,'r-+')
plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*')
plot(age,C_sim_hat,'r-+',age,C_sim_hat1,'b-*',age,Y_hat,'m-o')

(exp(mean(C_sim_hat(1:5)-C_sim_hat1(1:5)))-1)*100

[(exp(mean(C_sim_hat(5:9)-C_sim_hat1(5:9)))-1)*100
(exp(mean(C_sim_hat(10:14)-C_sim_hat1(10:14)))-1)*100
(exp(mean(C_sim_hat(15:19)-C_sim_hat1(15:19)))-1)*100
(exp(mean(C_sim_hat(20:24)-C_sim_hat1(20:24)))-1)*100
(exp(mean(C_sim_hat(25:29)-C_sim_hat1(25:29)))-1)*100
(exp(mean(C_sim_hat(30:34)-C_sim_hat1(30:34)))-1)*100
]'

[(exp(mean(C_sim_hat(1:5)-C_sim_hat1(1:5)))-1)*100
(exp(mean(C_sim_hat(6:10)-C_sim_hat1(6:10)))-1)*100
(exp(mean(C_sim_hat(11:15)-C_sim_hat1(11:15)))-1)*100
(exp(mean(C_sim_hat(16:20)-C_sim_hat1(16:20)))-1)*100
(exp(mean(C_sim_hat(21:25)-C_sim_hat1(21:25)))-1)*100
(exp(mean(C_sim_hat(26:31)-C_sim_hat1(26:31)))-1)*100
]'