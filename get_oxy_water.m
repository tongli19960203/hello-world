%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [oxy Total_com C water_content] = get_oxy_water(muaList,  wavList)
%(c_HHb, c_OHb,c_H2O, c_Lipid, wav)
numWav = length(wavList);
[dx_mua, dy_mua] = size(muaList);
if dy_mua <3
    error('To calculate oxygenation, the number of wavelength is at least 2')
end
if dx_mua~=1
    error('please rearange the shape of muaList')
end
if numWav~=dy_mua
    error('number of wavelength and number of mua are not equal')
end
TABLE_NIRFAST
T = 650:1:910;
for iwav = 1:numWav
    wav = str2num(wavList{iwav});
    tt = find(T== floor(wav));

    Ex_HHb(iwav) = table_coeff(tt,2); %[1/(mM*mm)]
    Ex_O2Hb(iwav) = table_coeff(tt,1);
    Ex_H2O(iwav) = table_coeff(tt,3);
%     Ex_Lipid(iwav) = table_coeff(tt,4);
% mua = Ex_Hb * c_HHb + Ex_HbO * c_OHb + c_H2O * Ex_H2O + c_Lipid * Ex_Lipid;
% mua = Ex_Hb * c_HHb + Ex_HbO * c_OHb ;
    
end

E = [Ex_HHb
          Ex_O2Hb
                 Ex_H2O];
A = muaList;
C = A/E;
Total_com = sum(C);
oxy = C(2)/Total_com;
water_content = C(3)/Total_com;