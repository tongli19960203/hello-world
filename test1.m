data = readtable('C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log');
%
wv=[725; 689; 802; 838]; 
wavList = {'689', '838','725'};%CHOOSE ANOTHER WAVELENGTH LIKE 802 838
muaList = [data.UaA_BWl2(20) data.UaA_BWl4(21) data.UaA_BWl1(21)].*0.1; %mm-1
[oxy Total_com C water_content]  = get_oxy_water(muaList, wavList);
water_content