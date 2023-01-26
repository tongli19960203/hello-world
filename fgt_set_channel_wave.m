function [Input_pressure,Output_pressure] = fgt_set_channel_wave(A,F,DC,A_Active,when,duration,channel)
%parameter=fgt_set_channel_wave(A,F,DC,A_Active,when,duration,channel)

i=0
tic% t0=tic
while 1
i = i+1;   
Time(i) = toc;

slowwave(i)=Periodic(A,F,Time(i),DC);%slowwave=Periodic(A,F,time,DC)
Action_wave(i) = Activation(A_Active,Time(i),when,duration);%Activation(A_Active,time,when,duration)
Inputwave(i) = slowwave(i) +Action_wave(i);
%input_pressure(i) = fgt_set_pressure(2,Inputwave(i));
Input_pressure(i) = fgt_set_pressure(channel,Inputwave(i));
    
Output_pressure(i) = fgt_get_pressure(channel);
   
plot(Time,Inputwave)
pause(0.5)
end  %T在起始时间偏大，2 input要全部放进去 the starting time is too big but 
%become stable later.
% too many input parameters ,so we have to control a lot of parameters even
% we have only 2 waves now