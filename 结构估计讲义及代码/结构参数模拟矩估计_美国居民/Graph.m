
w_plot=(0:0.01:3)';
hold on
c_plot=Cnextp(w_plot,w(:,1),c(:,1));
plot(w_plot,c_plot,'b.')
c_plot=Cnextp(w_plot,w(:,10),c(:,10));
plot(w_plot,c_plot)
c_plot=Cnextp(w_plot,w(:,20),c(:,20));
plot(w_plot,c_plot)
c_plot=Cnextp(w_plot,w(:,30),c(:,30));
plot(w_plot,c_plot)
c_plot=Cnextp(w_plot,w(:,40),c(:,40));
plot(w_plot,c_plot,'b--')
axis([0 3 0 1.4])
set(gca,'xtick',0:0.5:2.5) 
set(gca,'ytick',0:0.2:1.2)   
title('Consumption rule: \beta=0.9598, \rho=0.514, \gamma_0=0.0015, \gamma_1=0.071')
xlabel('Normalized asset')
ylabel('Normalized consumption')
hold off
saveas(gcf,'figure1_1.jpg')
saveas(gcf,'figure1_2.jpg')

hold on
plot(age,C_raw,'o',age,C_hat,'-',age,Y_hat,'b-*')
title('Consumption and Income')
xlabel('Age')
legend("raw consumption","smoothed consumption","income",'Location','south')
hold off
saveas(gcf,'figure2.jpg')
saveas(gcf,'figure2.pdf')

C_sim_m0=C_sim_m;
C_sim_m1=C_sim_m;
C_sim_m2=C_sim_m;
hold on
plot(age,log(C_raw),'bo',age,C_sim_hat,'r-',age,log(Y_hat),'b-*')
title('Model Fit')
xlabel('Age')
legend("raw consumption","simulated consumption","income",'Location','south')
hold off
filepath=pwd;         
cd('C:\Users\zoujianwen\Documents\LaTeX\My Slide\Structural Estimation')
saveas(gcf,'figure3_1.jpg')
cd(filepath)  

beta=0.97;
MSM_Main
C_sim_hat1=C_sim_hat;
beta=0.95;
MSM_Main

hold on 
plot(age,log(C_raw),'bo',age,C_sim_hat,'r-',age,C_sim_hat1,'m--',age,log(Y_hat),'b-*')
title('Various \beta')
xlabel('Age')
legend("raw consumption","\beta=0.95","\beta=0.97","income",'Location','south')
hold off
filepath=pwd;         
cd('C:\Users\zoujianwen\Documents\LaTeX\My Slide\Structural Estimation')
saveas(gcf,'figure3_2.jpg')
cd(filepath)  

%plot(age,Y_sim_m,'-*',age,Y_hat,'*')

w_sim_m=mean(w_sim)';
hold on
plot(age,w_sim_m,'-*')
title('Normalized asset by age')
xlabel('Age')
ylabel('Normalized asset')
hold off
%axis([26 42 0 7])
%set(gca,'ytick',0:1:15)
saveas(gcf,'figure4.jpg')
saveas(gcf,'figure4.pdf')

plot(age,S_LC,'--',age,S_Buffer_m,'-',age,S_sim_m,'b-')
saveas(gcf,'figure5_1.pdf')
plot(age,WW_LC_m,'--',age,WW_sim_m,'b-')
saveas(gcf,'figure5_2.pdf')


