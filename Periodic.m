function slowwave=Periodic(A,F,time,DC)
%unit of time = s 
%F is frequency
%how we define the time? on the introduction
%F = sampling rate [200,100,50,25,6.25,3.125,1.5625]
%T = 1/F
%time means 这个波经历的某个时间
slowwave=DC+A*sin(double(2*pi*F*time));% payattention, it has negtive value
end