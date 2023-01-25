clc,clear all;
data_ad1 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp2\ay1759_01.log','PreserveVariableNames',true);
data_ad2 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp2\ay1828_02.log','PreserveVariableNames',true);
data_ad3 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp2\ay1852_04.log','PreserveVariableNames',true);
data_ad4 = readtable('C:\Users\tongl\Desktop\BloodPhantom\data\exp2\ay1759_01.log','PreserveVariableNames',true);

for ii = 1:4
    Time{ii} = eval(['data_ad',num2str(ii)]).time;
    U_a_w1{ii} = eval(['data_ad',num2str(ii)]).("Ua A-B wl 1");%725
    U_a_w3{ii} = eval(['data_ad',num2str(ii)]).("Ua A-B wl 3");%802
%     hold on
%     plot(Time{ii},U_a_w1{ii})
end

%%
wv=["725" "802"];
% cList = cell(2,length(Time{ii}));
% cList{2,length(Time{ii})}=[];

oxygenList = cell(1,4);
THbList = cell(1,4);
cList=cell(1,4);
for ii = 1:4
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
%%
oxym = cell2mat(oxygenList);
THbm = cell2mat(THbList);
time = cell2mat(Time');
time = (time-time(1))./60;
plot(time,oxym,'.');
% plot(time,THbm','.')
ylim([0 2])