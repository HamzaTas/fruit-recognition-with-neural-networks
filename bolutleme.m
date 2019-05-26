% Bölütleme
h=msgbox('Sistem Eðitimi Baþladý.');
% Apple
dosya_uzantisi='.jpg';  % Baþka dosya varsa onlarýda eklemesin diye
resim_klasoru='Apple\'; % Her Bir klasör için bu iþi yapacaðýz.
resim_Klasoru_icerigi=dir([resim_klasoru,'*',dosya_uzantisi]);
dosya_sayisi = size(resim_Klasoru_icerigi,1);

apple = zeros(dosya_sayisi,28);


for k=1:dosya_sayisi
    dosya_adi=[resim_klasoru,resim_Klasoru_icerigi(k,1).name];
    I=imread(dosya_adi);
    I1=im2bw(I);   
    srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
    
    Area = srgp.Area;
    crl = srgp.MajorAxisLength;
    ecc = srgp.Eccentricity;
    apple(k, 1:3) = [ecc Area crl];
   
    O=fft2(I1);
    O1=O(1:5,1:5);
    O11=O1(:);
 
    apple(k, 4:end)= abs(O11');
end

Lapple=zeros(dosya_sayisi,5);
Lapple(:,1)=1;

% banana
dosya_uzantisi='.jpg';  % Baþka dosya varsa onlarýda eklemesin diye
resim_klasoru='Banana\'; % Her Bir klasör için bu iþi yapacaðýz.
resim_Klasoru_icerigi=dir([resim_klasoru,'*',dosya_uzantisi]);
dosya_sayisi = size(resim_Klasoru_icerigi,1);

banana = zeros(dosya_sayisi,28);
for k=1:dosya_sayisi
    dosya_adi=[resim_klasoru,resim_Klasoru_icerigi(k,1).name];
    I=imread(dosya_adi);
    I1=im2bw(I);
    srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
    Area = srgp.Area;
    crl = srgp.MajorAxisLength;
    ecc = srgp.Eccentricity;
    banana(k, 1:3) = [ecc Area crl];

    O=fft2(I1);
    O1=O(1:5,1:5);
    O11=O1(:);
    banana(k, 4:end)= abs(O11');

end

Lbanana=zeros(dosya_sayisi,5);
Lbanana(:,2)=1;

% cherry
dosya_uzantisi='.jpg';  % Baþka dosya varsa onlarýda eklemesin diye
resim_klasoru='Cherry\'; % Her Bir klasör için bu iþi yapacaðýz.
resim_Klasoru_icerigi=dir([resim_klasoru,'*',dosya_uzantisi]);
dosya_sayisi = size(resim_Klasoru_icerigi,1);

cherry = zeros(dosya_sayisi,28);

for k=1:dosya_sayisi
    dosya_adi=[resim_klasoru,resim_Klasoru_icerigi(k,1).name];
    I=imread(dosya_adi);
    I1=im2bw(I);
    srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
    Area = srgp.Area;
    crl = srgp.MajorAxisLength;
    ecc = srgp.Eccentricity;
    cherry(k, 1:3) = [ecc Area crl];

    O=fft2(I1);
    O1=O(1:5,1:5);
    O11=O1(:);
    
    cherry(k, 4:end)= abs(O11');

end

Lcherry=zeros(dosya_sayisi,5);
Lcherry(:,3)=1;

% Mongo
dosya_uzantisi='.jpg';  % Baþka dosya varsa onlarýda eklemesin diye
resim_klasoru='Mango\'; % Her Bir klasör için bu iþi yapacaðýz.
resim_Klasoru_icerigi=dir([resim_klasoru,'*',dosya_uzantisi]);
dosya_sayisi = size(resim_Klasoru_icerigi,1);

mango = zeros(dosya_sayisi,28);

for k=1:dosya_sayisi
    dosya_adi=[resim_klasoru,resim_Klasoru_icerigi(k,1).name];
    
    I=imread(dosya_adi);   
    I1=im2bw(I);
    srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
    Area = srgp.Area;
    crl = srgp.MajorAxisLength;
    ecc = srgp.Eccentricity;
    mango(k, 1:3) = [ecc Area crl];

    O=fft2(I1);
    O1=O(1:5,1:5);
    O11=O1(:);
 
    mango(k, 4:end)= abs(O11');
   
end

Lmango=zeros(dosya_sayisi,5);
Lmango(:,4)=1;


% orange
dosya_uzantisi='.jpg';  % Baþka dosya varsa onlarýda eklemesin diye
resim_klasoru='Orange\'; % Her Bir klasör için bu iþi yapacaðýz.
resim_Klasoru_icerigi=dir([resim_klasoru,'*',dosya_uzantisi]);
dosya_sayisi = size(resim_Klasoru_icerigi,1);

orange = zeros(dosya_sayisi,28);


for k=1:dosya_sayisi
    dosya_adi=[resim_klasoru,resim_Klasoru_icerigi(k,1).name];
    I=imread(dosya_adi);
    I1=im2bw(I);
    srgp = regionprops(I1, 'Area','MajorAxisLength','Eccentricity');
    Area = srgp.Area;
    crl = srgp.MajorAxisLength;
    ecc = srgp.Eccentricity;
    orange(k, 1:3) = [ecc Area crl];

    O=fft2(I1);
    O1=O(1:5,1:5);
    O11=O1(:);
   
    orange(k, 4:end)= abs(O11');
   
end

Lorange=zeros(dosya_sayisi,5);
Lorange(:,5)=1;

Ssum=[apple;banana;cherry;mango;orange];
Lsum=[Lapple;Lbanana;Lcherry;Lmango;Lorange];

save Ssum ;
save Lsum;
save h;


