function[input_pressure,Output_pressure] = fgt_set_wave(channel,Inputwave)
%pressureIndex, pressure

%I can change the different input later
%waveduration = 这个波可以保持多久，连续多少次
    tic
for i = 0
    i = i+1
   
    Time(i) = toc
    
    Inputwave(i) = slowwave(i) +Action_wave(i)
    pause(0.5)
    
    input_pressure(i) = fgt_set_pressure(channel,Inputwave);
    
    Output_pressure(i) = fgt_get_pressure(channel);
   
end



