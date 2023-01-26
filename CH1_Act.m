addpath('C:\Tong\2022\master_thesis\oxy');
% CH1_Act
i=0
tic% t0=tic
while 1
i = i+1;
    
time(i) = toc;

CH1a(i) =Periodic(100,0.0083,time(i),100);

CH2_Act(i) =Periodic(50,0.0083,time(i),20)+ Activation(250,time(i),250,300);
%s = Activation(30,time(i),100,40)
%plot(time,CH1a)

pause(0.05)
%hold on 
plot(time,CH2_Act);

input_2(i) = fgt_set_pressure(2,CH1a(i));
input_3(i) = fgt_set_pressure(3,CH2_Act(i));
hold off
%     
output_3(i) = fgt_get_pressure(3);
%     
output_2(i) = fgt_get_pressure(2);
end
x = 1:length(CH2_Act(1:8000));
x = x/5;
figure;plot(x,CH2_Act(1:8000),'LineWidth',2);

xlabel('Time point [0.12s]','FontSize',20);
ylabel('Pressure[mBar]','FontSize',20)
title('Activation','FontSize',20);
set(gcf,'Units','centimeters','Position',[0 0 16 9])
%%
% %CH2_Act
% % if possible maybe I should design a 400s signal.
% i=0
% tic% t0=tic
% while 1
% i = i+1;
%     
% time(i) = toc;
% CH2_Act(i) =Periodic(20,0.083,time(i),50);
% 
% 
% plot(time,CH2_Act)
% 
% pause(0.05)
% input_3(i) = fgt_set_pressure(2,CH2_Act(i));
% %     
% output_3(i) = fgt_get_pressure(2);
% end

% %%
% %CH1 and CH2 task
% %CH2_Act
% addpath('C:\Tong\2022\master_thesis\oxy');
% % if possible maybe I should design a 400s signal.
% i=0
% tic% t0=tic
% while 1
% i = i+1;
%     
% time(i) = toc;
% CH2_Act(i) =Periodic(25,0.2,time(i),75);
% 
% 
% plot(time,CH2_Act)
% 
% pause(0.05)
% input_4(i) = fgt_set_pressure(1,CH2_Act(i));
% input_4(i) = fgt_set_pressure(2,CH2_Act(i));
% %     
% output_4(i) = fgt_get_pressure(1);
% output_4(i) = fgt_get_pressure(2);
% end
% 
% % need to check from the document how to use the function
