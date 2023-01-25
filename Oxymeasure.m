% Import the data
jing02 = readtable("C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log");
jing03 = table2array(jing02);
%%
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
% figure;plot(t,Sat(1:300).*100);
%测试含氧血样蛋白
THbList=THbList(1:300);
xlabel('Time')
ylabel('Jingjing StO_2' )

figure(2);plot(t,oxygenList);
% figure(3);plot(t,THbList);
% figure(4);plot(t,cList);
