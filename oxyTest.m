%% One data measurement
data = readtable('C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log');
%
wv=[725; 689; 802; 838]; 
wavList = {'802', '838'};%CHOOSE ANOTHER WAVELENGTH LIKE 802 838
muaList = [data.UaA_BWl3(50) data.UaA_BWl4(50)].*0.1; %mm-1
[oxy THb C]  = get_oxy_tHb(muaList, wavList);
oxy
% figure,plot(data.UaA_BWl2);%0.124cm-1 725nm 0.15 689nm
% figure,plot(data.UsA_BWl2);
% figure(3),plot(data.UaA_BWl3);%802nm 0.14cm
% %avoid 689nm


%% StO2 changes with time
clc,clear all;
jing02 = readtable("C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log");
jing03 = table2array(jing02);

%0.6s采样一次
time = jing02.time;
time = length(time);
wv=["838" "689"];
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
    A_wv_838(i) = jing02.UaA_BWl4(i);
    A_wv_689(i) = jing02.UaA_BWl2(i);
    muaList = [A_wv_838(i) A_wv_689(i)];
    [oxy THb C]  = get_oxy_tHb(muaList,wv);
    oxygenList(i) = oxy;
    THbList(i) = THb;
    cList(:,i)=C;
    Sat(i) = oxy./THb;
end
t = 1:300;
figure(1);plot(t,oxygenList);
%测试含氧血样蛋白
% THbList=THbList(1:300);
xlabel('Time')
ylabel('Jingjing StO_2' )

figure(2),plot(t,THbList)
xlabel('Time')
ylabel('Jingjing THb' )