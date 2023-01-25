%弄一个list放位置信息[11112222]
Ua_exp1_802_filt = sgolayfilt(Ua_exp1_802,1,501);
Ua_exp1_725_ny_filt = sgolayfilt(Ua_exp1_725,1,501);
Ua_exp1_725yeast = Ua_exp1_725(1276:end);
% Ua_exp1_802_filt = Ua_exp1_802_filt(1258:end);
%1258
ay_ny = Ua_exp1_725(1:1275);
ay_01 = Ua_exp1_725(1276:1658);
ay_02 = Ua_exp1_725(1659:1975);
ay_03 = Ua_exp1_725(1976:2682);
ay_04 = Ua_exp1_725(2683:3167);
ay_05 = Ua_exp1_725(3168:3398);
ay_06 = Ua_exp1_725(3399:3646);
ay_07 = Ua_exp1_725(3647:3924);
ay_08 = Ua_exp1_725(3925:4292);
ay_09 = Ua_exp1_725(4293:4715);


ny =  sgolayfilt(ay_ny,1,81);
ay_01 = sgolayfilt(ay_01,1,81);
ay_02 = sgolayfilt(ay_02,1,81);
ay_03 = sgolayfilt(ay_03,1,81);
ay_04 = sgolayfilt(ay_04,1,81);
ay_05 = sgolayfilt(ay_05,1,81);
ay_06 = sgolayfilt(ay_06,1,81);
ay_07 = sgolayfilt(ay_07,1,81);
ay_08 = sgolayfilt(ay_08,1,81);
ay_09 = sgolayfilt(ay_09,1,81);
ay = [ny;ay_01;ay_02;ay_03;ay_04;ay_05;ay_06;ay_07;ay_08;ay_09];
ay_yeast = [ay_01;ay_02;ay_03;ay_04;ay_05;ay_06;ay_07;ay_08;ay_09];
tyeast = t(1276:end);
figure,plot(t,Ua_exp1_725,'r');
hold on
plot(t,ay,'b');
%plot(tyeast,ay_yeast,'k')
%%
% time = length(t_exp1);
%0.6s采样一次

wv=["802" "725"];
% A_wv_725 = jing02(3:end,1);
% A_wv_689 = jing02(i,2);
% A_wv_802 = jing02(3:end,3);
% A_wv_838 = jing02(3:end,4);
% %muaList = [A_wv_725 A_wv_689];
% % Result = get_oxy_tHb(muaList,wv);
time = length(t);
cList = zeros(2,time);%1324 838 725 802 689
for i = 1:time;
%     A_wv_838(i) = jing03(i,1);
%     A_wv_689(i)= jing03(i,2);
    A_wv_802(i) = Ua_exp1_802_filt(i);
    A_wv_725(i) = ay(i);
    muaList = [A_wv_802(i) A_wv_725(i)];
    [oxy THb C]  = get_oxy_tHb(muaList,wv);
    oxygenListf(i) = oxy;
    THbList(i) = THb;
    cList(:,i)=C;
    Sat(i) = oxy./THb;
end
% t = 1:time;
% t = (t_exp1- t_exp1(1))./60;
figure(1);hold on
plot(t,oxygenListf,'.');
%
oxygenListfyeast = oxygenListf(1276:end);
plot(tyeast,oxygenListfyeast,'.');
%测试含氧血样蛋白
ylim([0 1])
xlabel('Time')
ylabel('StO_2' )

figure(2),plot(t,THbList)
xlabel('Time')
ylabel('THb' )
ylim([0 5])
figure(3)
hold on
% t2= tyeast()
% y = -0.0109.*tyeast+ 0.8815;
f1 = fit(tyeast,oxygenList(1276:end)','poly1');
plot(t,oxygenList,'r.')
y1= f1.p1.* tyeast + f1.p2;
plot(tyeast,y1,'y');
f2 = fit(tyeast,oxygenListf(1276:end)','poly1');
y2= f2.p1.* tyeast + f2.p2;
plot(t,oxygenListf,'k.')
plot(tyeast,y2,'b');
hold off
xlabel('Time/min')
ylabel('StO_2')
title('Experiment 1')
legend('Raw data','Fit raw data','Filtered data','Fit filtered data')

%%
Experiment1.StartingTime = {'16:20','16:26','16:30','16:35','16:43','16:50','16:57','17.02','17.09','17.17'};
Experiment1.TimeFormat = 'HH:MM'
Experiment1.Date = '15/12/2022'
%0 4.20 no yeast 0min
%1 4.26 6
%2 4.30 10
%3 4.35 15
%4 4.43 23
%5 4.50 30
%6 4.57 37
%7 5.02 42
%8 5.09 49
%9 5.17 57