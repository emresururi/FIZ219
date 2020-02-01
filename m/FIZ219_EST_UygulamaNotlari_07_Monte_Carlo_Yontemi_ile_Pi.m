rand % Bir kere çağıralım

% 10 kere çağıralım:
for i=1:10
    rand
endfor

% 5x4'lük bir matrisi rastgele sayılarla dolduralım:
m = rand([5,4])

% An itibarı ile üretecin tohumu rastgele bir sayı, 
% dilersek bunu öğrenebiliriz:
mevcut_tohum = rand("seed")

% Şimdi elimizle bir tohum değeri (219 olsun) girip,
% 10 tane rastlantısal sayı üretelim:
rand("seed",219)
for i=1:10
    rand
endfor

% Herhangi bir başka zamanda, hatta bir başka bilgisayarda, 
% tohuma aynı değere atayıp, yine aynı sayıları elde edebiliriz:
rand("seed",rand) % Önce rastgele bir tohum atayalım
m = rand([2 5])

% Şimdi ise tekrardan bir önce atadığımız değeri yazıp,
% yine çalıştıralım:
rand("seed",219)
m = rand([5 2])

rand("seed",219) % böyle başlayalım ki, sizde de, burada da aynı
                   % sayılar üretilsin.
xy = rand([10,2])

xy = xy - 0.5

plot(xy(:,1),xy(:,2),"xb")

plot(xy(:,1),xy(:,2),"xb")
axis([-0.5 0.5 -0.5 0.5])

plot(xy(:,1),xy(:,2),"xb",0,0,"r.")
axis([-0.5 0.5 -0.5 0.5])

t = linspace(0,360,1000);
xx = 0.5*cos(t);
yy = 0.5*sin(t);
plot(xy(:,1),xy(:,2),"xb",0,0,"r.",xx,yy,"k.")
axis([-0.5 0.5 -0.5 0.5])

a = xy(1,:)

d = sqrt(a(1).^2 + a(2)^2)

a % a, 2 boyutlu bir vektör: ilk bileşen x, ikincisi y bileşeni

d = (a(1).^2 + a(2).^2).^(1/2)  % Kök işleminin sayının 1/2. kuvveti olduğunu unutmayın!
d = (a(1).^2 + a(2).^2).^(0.5)  % Burada da 1/2 yerine 0.5'i doğrudan yazdık

d = sqrt(a(1).^2 + a(2).^2)

d = sqrt(dot(a,a))

d = norm(a)

xy

norm(xy)

for i = 1:10
    norm(xy(i,:))
endfor

sqrt(xy(:,1).^2 + xy(:,2).^2)

xyxy = (xy'*xy)
lambdalar = eig(xyxy)
sqrt(lambdalar)
max(sqrt(lambdalar))

disp("--------------------")

% ya da tek satirda hepsini toplarsak:
max(sqrt(eig(xy'*xy)))  % bir matrisin 2. dereceden norm'u

mesafeler = norm(xy,"rows")

xy = [xy mesafeler]

3 > 1
5 < 4
12 <= 13
12 >= 12
3 != 7
7 == 7
3 == 5

rand("seed",219) % Başlamadan biz yine tohumu ayarlayalım her ihtimale karşı ki,
                 % sizin üreteceğiniz sayılar buradakilerle aynı olsunlar.
sayilar = randi([20 70],[1 10]) % 20 ile 70 arasında (onlar da dahil), 1x5'lik matris doldur

sayilar == 46

sayilar <= 46

sum(sayilar<=46)

onerme_sonucu_gelen  = sayilar<=46
bizim_tanimladigimiz = [0 1 1 1 1 1 0 1 0 1]

typeinfo(onerme_sonucu_gelen)
typeinfo(bizim_tanimladigimiz)

sayilar([4:7 9]) % sayilar'in 4.,5.,6.,7. ve 9. elemanı

sayilar(onerme_sonucu_gelen)

sayilar(sayilar<=46)

ciftler = sayilar(mod(sayilar,2)==0) % sayilar listesinin çift elemanları
ucun_katlari = sayilar(mod(sayilar,3)==0) % sayilar listesinin üçe tam bölünebilen elemanları
ortalamanin_altindakiler = sayilar(sayilar< sum(sayilar)/columns(sayilar)) % sayilar listesinin
                                                             % ortalamasının altındaki elemanları
tam_kareler = sayilar(sqrt(sayilar)-floor(sqrt(sayilar))  == 0) % sayilar listesinin tam kare elemanları

mod(sayilar,2)==0

filtre = (mod(sayilar,2) == 0)
sayilar(filtre)
[1:10](filtre)

cift_sayilar_filtresi = (mod(sayilar,2) == 0)
tek_sayilar_filtresi  =  not(cift_sayilar_filtresi)
sayilar(tek_sayilar_filtresi)

xy

hangileri = xy(:,3) <= 0.5 % xy'nin üçüncü sütunu olan mesafelerden hangileri
               % 0.5'ten küçük veya ona eşit

hangi_satirlar = [1:10](hangileri) % Bu kıstası karşılayan satırlar 
                                   % hangi satırlara karşılık geliyor

dairenin_icindekiler = xy(hangi_satirlar,:) % Bu satırları getir

dairenin_icindekiler = xy([1:10](xy(:,3)<=0.5),:)

dairenin_disindakiler = xy([1:10](not(hangileri)),:)

plot(0,0,".r",... % orijin
xx,yy,"k.",... % daire
dairenin_icindekiler(:,1),dairenin_icindekiler(:,2),"or",... % dairenin içindeki noktalar
dairenin_disindakiler(:,1),dairenin_disindakiler(:,2),"sb") % dairenin dışındaki noktalar

axis([-0.5 0.5 -0.5 0.5])

pi_yaklasik = 4 * rows(dairenin_icindekiler) / rows(xy)

% Uygulama Notları: 7
% FİZ219 - Bilgisayar Programlama I | 23/11/2019
% Monte Carlo yöntemi ile Pi sayısının kestirimi
%
% Emre S. Tasci emre.tasci@hacettepe.edu.tr

% Şu ana kadar yaptığımız her şeyi silelim
% (Octave'ı yeni açmış gibi olalım):
clear;

% Sonuçların buradakilerle birebir uyuşması açısından:
rand("seed",219) 

% Toplam üretilen rastgele nokta sayısı -- bunu ne kadar
% yüksek yaparsanız, sonuç pi'ye o kadar yakınsayacaktır
n = 1000;

% Noktaları üretelim:
xy = rand([n 2]) - 0.5;

% Orijine olan mesafelerini hesaplatalım:
mesafeler = norm(xy,"rows");

% mesafeler'i xy'ye 3. sütun olarak ekleyelim:
xy = [xy mesafeler];

% mesafelerin 0.5'e eşit veya ondan küçük olduğu satırları bulalım:
dairenin_icindekiler_satirlar_filtresi = xy(:,3)<=0.5;
dairenin_icindekiler_satirlar = [1:n](dairenin_icindekiler_satirlar_filtresi);
dairenin_icindekiler = xy(dairenin_icindekiler_satirlar,:);

dairenin_disindakiler = xy([1:n](not(dairenin_icindekiler_satirlar_filtresi)),:);

% pi'yi hesaplayalım:
icerideki_nokta_sayisi = rows(dairenin_icindekiler)
disaridaki_nokta_sayisi = rows(dairenin_disindakiler)
toplam_nokta_sayisi = n
disp("------------------------------")
pi_yaklasik = 4 * icerideki_nokta_sayisi / n

% Grafiği çizdirelim:

% Dairemiz:
t = linspace(0,360,1000);
xx = 0.5 * cosd(t);
yy = 0.5 * sind(t);

plot(0,0,".r",... % orijin
xx,yy,"k.",... % daire
dairenin_icindekiler(:,1),dairenin_icindekiler(:,2),"or",... % dairenin içindeki noktalar
dairenin_disindakiler(:,1),dairenin_disindakiler(:,2),"sb") % dairenin dışındaki noktalar

axis([-0.5 0.5 -0.5 0.5])


% -------------------------------------------------------
% rastgele tohumu : 219 için sonuçlar özet:
%       n    #iç      #dış       #pi
%      10      9         1       3.6000000
%     100     80        20       3.2000000
%    1000    784       216       3.1360000
%   10000   7863      2137       3.1452000
%  100000  78649     21351       3.1459600
% 1000000 785546    214454       3.1421840

