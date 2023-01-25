%% One data measurement
data = readtable('C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log');
%
wv=[725; 689; 802; 838]; 
wavList = {'725', '802'};%CHOOSE ANOTHER WAVELENGTH LIKE 802 838
muaList = [data.UaA_BWl1(40) data.UaA_BWl3(40)].*0.1; %mm-1
% muaList =  [0.0133 0.0151].*0.1; %mm-1

[oxy THb C]  = get_oxy_tHb(muaList, wavList);
oxy