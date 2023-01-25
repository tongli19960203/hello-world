data = readtable('C:\Users\tongl\Desktop\BloodPhantom\blood_spectrum.txt');
wavelength = data.lambda;
Hb02 = data.Hb02; %cm-1/M
Hb = data.Hb;

abs_Hb02 = Hb02 *2.303*150/64500;%cm-1
abs_Hb = Hb*2.303*150/64500;

figure,plot(wavelength(200:350),abs_Hb02(200:350));
hold on 
plot(wavelength(200:350),abs_Hb(200:350));
legend('HbO2' ,'Hb')
xlabel('wv')
ylabel('Ua cm-1')

wv_ua = [wavelength abs_Hb02 abs_Hb];
wv=[725; 689; 802; 838];
abshb02=[1.99 1.47 4.43 5.4];
abshb=[6.45 11.32 3.98 3.71];%cm-1

%[r sqrt(3uaus) >> 1
val  = sqrt(3*abshb*4*0.1)*1.5;%10% diluted blood
figure,plot(val);


