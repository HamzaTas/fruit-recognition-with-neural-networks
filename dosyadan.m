
load net;
%Test
[dosyaAdi,dosyaYolu] = uigetfile({'*.jpg';'*.bmp';'*.png'});
Iinp = zeros(1,28);

I=imread(fullfile(dosyaYolu,dosyaAdi));
resim = strcat(dosyaYolu,dosyaAdi);
axes(handles.axes10);
imshow(resim);
I1=im2bw(I);
srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
Area = srgp.Area;
crl = srgp.MajorAxisLength;
ecc = srgp.Eccentricity;
Iinp(1,1:3) = [ecc Area crl];

O=fft2(I1);
O1=O(1:5,1:5);
O11=O1(:);
Iinp(1, 4:end)= abs(O11');
y=sim(net,Iinp');
disp(y);


%% Sonuç
%%En uygun de?erin bulunup gösterilmesi
[enBuyuk,indis] = max(y);


turler = {  'Apple','Banana','Cherry','Mango','Orange'};         

  sonuc = sprintf('Yüzde %0.6f olasýlýkla %s',enBuyuk*100, turler{indis});        
   set(handles.text18,'string',sonuc);