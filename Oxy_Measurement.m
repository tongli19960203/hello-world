data_val = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\validation_blood\test_01.log','PreserveVariableNames',true);
data_ny = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\noyeast_01.log','PreserveVariableNames',true);
data_ad01 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay_01.log','PreserveVariableNames',true);
data_ad01 = data_ad01(1:400,:);
data_ad02 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay_02.log','PreserveVariableNames',true);
data_ad03 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1635_03.log','PreserveVariableNames',true);
data_ad04 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1643_04.log','PreserveVariableNames',true);
data_ad05 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1650_05.log','PreserveVariableNames',true);
data_ad06 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1657_06.log','PreserveVariableNames',true);
data_ad07 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1702_07.log','PreserveVariableNames',true);
data_ad08 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1709_08.log','PreserveVariableNames',true);
data_ad09 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1717_09.log','PreserveVariableNames',true);
%%

time_exp1 = padcat(data_ny.time,data_ad01.time,data_ad02.time,data_ad03.time,data_ad04.time,data_ad05.time,data_ad06.time,data_ad07.time,data_ad08.time,data_ad09.time);
% t_exp1 = reshape(time_exp1.',[1275*10 1]);
t_exp1 = time_exp1(:);  % make several columns to one colums.
t_exp1 = t_exp1(~isnan(t_exp1));
%%
% x = [];
% for i = 1:10
%   y = time_exp1(:,i);
%   x = [x y];  % or x = cat(2, x, y)
% end
Ua_exp1_725 = padcat(data_ny.("Ua A-B wl 1"),data_ad01.("Ua A-B wl 1"),data_ad02.("Ua A-B wl 1"),data_ad03.("Ua A-B wl 1"),data_ad04.("Ua A-B wl 1"),data_ad05.("Ua A-B wl 1"),data_ad06.("Ua A-B wl 1"),data_ad07.("Ua A-B wl 1"),data_ad08.("Ua A-B wl 1"),data_ad09.("Ua A-B wl 1"));
Ua_exp1_689 = padcat(data_ny.("Ua A-B wl 2"),data_ad01.("Ua A-B wl 2"),data_ad02.("Ua A-B wl 2"),data_ad03.("Ua A-B wl 2"),data_ad04.("Ua A-B wl 2"),data_ad05.("Ua A-B wl 2"),data_ad06.("Ua A-B wl 2"),data_ad07.("Ua A-B wl 2"),data_ad08.("Ua A-B wl 2"),data_ad09.("Ua A-B wl 2"));
Ua_exp1_802 = padcat(data_ny.("Ua A-B wl 3"),data_ad01.("Ua A-B wl 3"),data_ad02.("Ua A-B wl 3"),data_ad03.("Ua A-B wl 3"),data_ad04.("Ua A-B wl 3"),data_ad05.("Ua A-B wl 3"),data_ad06.("Ua A-B wl 3"),data_ad07.("Ua A-B wl 3"),data_ad08.("Ua A-B wl 3"),data_ad09.("Ua A-B wl 3"));
Ua_exp1_838 = padcat(data_ny.("Ua A-B wl 1"),data_ad01.("Ua A-B wl 1"),data_ad02.("Ua A-B wl 1"),data_ad03.("Ua A-B wl 4"),data_ad04.("Ua A-B wl 4"),data_ad05.("Ua A-B wl 4"),data_ad06.("Ua A-B wl 4"),data_ad07.("Ua A-B wl 4"),data_ad08.("Ua A-B wl 4"),data_ad09.("Ua A-B wl 4"));

Us_exp1_725 = padcat(data_ny.("Us A-B wl 1"),data_ad01.("Us A-B wl 1"),data_ad02.("Us A-B wl 1"),data_ad03.("Us A-B wl 1"),data_ad04.("Us A-B wl 1"),data_ad05.("Us A-B wl 1"),data_ad06.("Us A-B wl 1"),data_ad07.("Us A-B wl 1"),data_ad08.("Us A-B wl 1"),data_ad09.("Us A-B wl 1"));
Us_exp1_689 = padcat(data_ny.("Us A-B wl 2"),data_ad01.("Us A-B wl 2"),data_ad02.("Us A-B wl 2"),data_ad03.("Us A-B wl 2"),data_ad04.("Us A-B wl 2"),data_ad05.("Us A-B wl 2"),data_ad06.("Us A-B wl 2"),data_ad07.("Us A-B wl 2"),data_ad08.("Us A-B wl 2"),data_ad09.("Us A-B wl 2"));
Us_exp1_802 = padcat(data_ny.("Us A-B wl 3"),data_ad01.("Us A-B wl 3"),data_ad02.("Us A-B wl 3"),data_ad03.("Us A-B wl 3"),data_ad04.("Us A-B wl 3"),data_ad05.("Us A-B wl 3"),data_ad06.("Us A-B wl 3"),data_ad07.("Us A-B wl 3"),data_ad08.("Us A-B wl 3"),data_ad09.("Us A-B wl 3"));
Us_exp1_838 = padcat(data_ny.("Us A-B wl 1"),data_ad01.("Us A-B wl 1"),data_ad02.("Us A-B wl 1"),data_ad03.("Us A-B wl 4"),data_ad04.("Us A-B wl 4"),data_ad05.("Us A-B wl 4"),data_ad06.("Us A-B wl 4"),data_ad07.("Us A-B wl 4"),data_ad08.("Us A-B wl 4"),data_ad09.("Us A-B wl 4"));

%ua
%%
Ua_exp1_689 = Ua_exp1_689(:);
Ua_exp1_689 = Ua_exp1_689(~isnan(Ua_exp1_689));
Ua_exp1_725 = Ua_exp1_725(:);
Ua_exp1_725= Ua_exp1_725(~isnan(Ua_exp1_725));
Ua_exp1_802 = Ua_exp1_802(:);
Ua_exp1_802 = Ua_exp1_802(~isnan(Ua_exp1_802));
Ua_exp1_838 = Ua_exp1_838(:);
Ua_exp1_838 = Ua_exp1_838(~isnan(Ua_exp1_838));
%us
Us_exp1_689 = Us_exp1_689(:);
Us_exp1_689 = Us_exp1_689(~isnan(Us_exp1_689));
Us_exp1_725 = Us_exp1_725(:);
Us_exp1_725 = Us_exp1_725(~isnan(Us_exp1_725));
Us_exp1_802 = Us_exp1_802(:);
Us_exp1_802 = Us_exp1_802(~isnan(Us_exp1_802));
Us_exp1_838 = Us_exp1_838(:);
Us_exp1_838 = Us_exp1_838(~isnan(Us_exp1_838));

%%
Ua_exp1 = padcat(Ua_exp1_689,Ua_exp1_725,Ua_exp1_802,Ua_exp1_838);
Us_exp1 = padcat(Us_exp1_689,Us_exp1_725,Us_exp1_802,Us_exp1_838);
figure(1),plot(t_exp1,Ua_exp1);
ylim([0 1.6])
legend('689','725','802','838')
xlabel('Time point')
ylabel('Ua cm^-1')

figure(2),plot(t_exp1,Us_exp1);
ylim([0 20])
legend('689','725','802','838')
xlabel('Time point')
ylabel('Us cm^-1')

%%

time = length(t_exp1);
%0.6s采样一次

wv=["802" "725"];
% A_wv_725 = jing02(3:end,1);
% A_wv_689 = jing02(i,2);
% A_wv_802 = jing02(3:end,3);
% A_wv_838 = jing02(3:end,4);
% %muaList = [A_wv_725 A_wv_689];
% % Result = get_oxy_tHb(muaList,wv);

cList = zeros(2,time);%1324 838 725 802 689
for i = 1:time;
%     A_wv_838(i) = jing03(i,1);
%     A_wv_689(i)= jing03(i,2);
    A_wv_802(i) = Ua_exp1_802(i);
    A_wv_725(i) = Ua_exp1_725(i);
    muaList = [A_wv_802(i) A_wv_725(i)];
    [oxy THb C]  = get_oxy_tHb(muaList,wv);
    oxygenList(i) = oxy;
    THbList(i) = THb;
    cList(:,i)=C;
    Sat(i) = oxy./THb;
end
% t = 1:time;
t = (t_exp1- t_exp1(1))./60;
oxygenListyeast = oxygenList(1258:end);
figure(1);plot(t,oxygenList,'.');
%测试含氧血样蛋白
ylim([0 1])
xlabel('Time')
ylabel('StO_2' )

figure(2),plot(t,THbList)
xlabel('Time')
ylabel('THb' )
ylim([0 5])

%%
%Signal smoothing
T = t_exp1(500:end);
T = (T -T (1))./60;
N = 500;
coeff = ones(1, N)/N;
StO2_Ave = filter(coeff,1,oxygenList);
StO2_mean =StO2_Ave(500:end);
oxyList= oxygenList(500:end);
figure(3);
% plot(t,oxygenList)

plot(T,[oxyList;StO2_mean])
% plot(t,StO2_Ave)
legend('StO2','Sto2 Ave')
xlabel('Time/min')
ylabel('StO_2')

%% Linear fit
figure,hold on 
plot(T,StO2_mean,'r*','MarkerSize',2),

p1 = -0.006795,%-0.006828, -0.006762
p2 =  0.9434  % (0.9423, 0.9446)
y = p1.*T + p2;
id1 = find(T == 1)
plot(T,y);

xlabel('Time/min')
ylabel('StO_2')
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
% %% Match point
% xax = [0 1 2 3 4 5 6 7 8 9];
% ay_ny = mean(StO2_mean(500:1257));
% ay_01 = mean(StO2_mean(1258:1658));
% ay_02 = mean(StO2_mean(1659:1975));
% ay_03 = mean(StO2_mean(1976:2682));
% ay_04 = mean(StO2_mean(2683:3167));
% ay_05 = mean(StO2_mean(3167:3398));
% ay_06 = mean(StO2_mean(3399:3646));
% ay_07 = mean(StO2_mean(3647:3924));
% % ay_08 = mean(StO2_mean(3925:4292));
% % ay_09 = mean(StO2_mean(4293:4700));
% ay = [ay_ny ay_01 ay_02 ay_03 ay_01]



