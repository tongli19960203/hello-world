wv=[725; 689; 802; 838]; 
data = readtable('C:\Tong\2022\master_thesis\oxy\20200328\Jing_test_02\jing02.log');
ua_689 = mean(data.UaA_BWl2);
ua_838 = mean(data.UaA_BWl4);
muaList = [ua_689 ua_838];

%%
wavList = {'689', '838'};%CHOOSE ANOTHER WAVELENGTH LIKE 802 838
muaList = [data.UaA_BWl2(20) data.UaA_BWl4(20)].*0.1; %mm-1
[oxy THb C]  = get_oxy_tHb(muaList, wavList);
oxy

%% 
t_end = data.time;
size_t = length(t_end);

for t = 1:t_end
    ua_689 = zeros(size_t,1)
    ua_689 = data.UaA_BWl2(t);
    ua_838 = data.UaA_BWl4(t);
    muaList = [ua_689 ua_838];
    [oxy THb C]  = get_oxy_tHb(muaList, wavList);
end

%% plot abs blood
%hemoglobin concentration
%man 8.56-11.17 mmol/L
%woman 7.51-9.37 mmol/L
T = 650:1:910;
O2Hb = table_coeff(:,1);
HHb = table_coeff(:,2);
oxy_sat = 0;
ext = O2Hb * oxy_sat + HHb * (1-oxy_sat); %[1/(mM*mm)]
abs = ext * 9 * 10*0.1;% cm-1 DILUTED 10% BLOOD
% ext = (O2Hb * oxy_sat + HHb * (1-oxy_sat))*1000*10; %[1/(M*cm)]
% A = ext/64500;
% C = 0.45 * ;
% abs = C*ext;
figure,plot(T,ext);
hold on
plot(T,O2Hb);
plot(T,HHb);
plot(T,abs)
legend('0','O2Hb','HHb','abs')
%%
%r = 2.5-1.5;
val  = sqrt(3*abs*4)*1.5;%10% diluted blood
figure,plot(T,val);
