function Action_wave = Activation(A_Active,time,when,duration)
%function Action_wave = Activation(A_Active,Mount,duration)
%sigma = duration;
%duration is the sigma
%time is the mean;
%duration = sigma/6
%Action_wave = A_Active/0.4*(normpdf(double(time),when,duration));
Action_wave_one = normpdf(double(time),when,duration/6);
alpha = normpdf(when,when,duration/6);


Action_wave = A_Active/alpha*Action_wave_one;
%Action_wave = A_Active*(1/((duration*sqrt(2*pi))*exp(-(when^2)/(2*duration^2))))
    %function Mount = 
    %f(x) = A_Active*(1/((sigma*sqrt(2*pi))*exp(-((x-mean)^2)/(2*sigma^2))))
    
end