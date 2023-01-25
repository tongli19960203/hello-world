clc,clear all
data_val = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\validation_blood\test_01.log','PreserveVariableNames',true);
%data_ny = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\noyeast_01.log','PreserveVariableNames',true);
data_ad1 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\noyeast_01.log','PreserveVariableNames',true);
data_ad2 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay_01.log','PreserveVariableNames',true);
data_ad2 = data_ad2(1:400,:);
data_ad3 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay_02.log','PreserveVariableNames',true);
data_ad4 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1635_03.log','PreserveVariableNames',true);
data_ad5 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1643_04.log','PreserveVariableNames',true);
data_ad6 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1650_05.log','PreserveVariableNames',true);
data_ad7 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1657_06.log','PreserveVariableNames',true);
data_ad8 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1702_07.log','PreserveVariableNames',true);
data_ad9 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1709_08.log','PreserveVariableNames',true);
data_ad10 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp1\ay1717_09.log','PreserveVariableNames',true);
%%
% data = zeros(11,1257);
for ii = 1:10
    Time{ii} = eval(['data_ad',num2str(ii)]).time;
    U_a_w1{ii} = eval(['data_ad',num2str(ii)]).("Ua A-B wl 1");%725
    U_a_w3{ii} = eval(['data_ad',num2str(ii)]).("Ua A-B wl 3");%802
    hold on
    plot(Time{ii},U_a_w1{ii})
end

%%
wv=["725" "802"];
% cList = cell(2,length(Time{ii}));
% cList{2,length(Time{ii})}=[];

oxygenList = cell(1,10);
THbList = cell(1,10);
cList=cell(1,10);
for ii = 1:10
% cList= zeros(2,length(Time{ii}));%1324 838 725 802 689

 for i = 1:length(Time{ii})
    A_wv_725{ii} = U_a_w1{1,ii}(i);
    A_wv_802{ii} = U_a_w3{1,ii}(i);
    muaList = [A_wv_725{ii} A_wv_802{ii}];
    [oxy THb C]  = get_oxy_tHb(muaList,wv);
    oxygenList{1,ii}(i) = oxy;
    THbList{1,ii}(i)= THb;
    cList{1,ii}(:,i)=C;
    Sat(i) = oxy./THb;
 end
end
% measure the length of all data
% for j = 1:length(oxygenList)
%     oxymatrix(j) = length(oxygenList{1,j});
%     oxymatrix = sum(oxymatrix);
% end
%
%%
oxym = cell2mat(oxygenList);
THbm = cell2mat(THbList);
time = cell2mat(Time');
time = (time-time(1))./60;
figure(2)
plot(time,oxym,'.');
% plot(time,THbm','.')
ylim([0 1])
