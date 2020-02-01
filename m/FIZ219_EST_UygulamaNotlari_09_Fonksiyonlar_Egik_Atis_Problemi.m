v0 = 30;
theta = 60;
g = 9.81;
t_d = 2*v0*sind(theta)/g

printf("Toplam ucus zamani: %9.6f s\n",t_d)

function f=atis_y(v0,theta,t,g=9.81)
f = v0*sind(theta)*t - 0.5*g*t^2;
endfunction

v0 = 30;
theta = 60;

% atıldıktan az sonraki (t=0.01s) yüksekliğe bakalım:
a = 0.01;
printf("atildiktan %6.3f saniye sonraki yukseklik: %10.5f m.\n",a,atis_y(v0,theta,a))

% bir de 10 saniye sonraki yüksekliğe bakalım:
b = 10;
printf("atildiktan %6.3f saniye sonraki yukseklik: %10.5f m.\n",b,atis_y(v0,theta,b))

% 0.01. ile  10 saniyenin tam ortasındaki anda ne yükseklikte idi?
c = (a + b) / 2;
printf("atildiktan %6.3f saniye sonraki yukseklik: %10.5f m.\n",c,atis_y(v0,theta,c))

clear;

function f=atis_y(v0,theta,t,g=9.81)
f = v0*sind(theta)*t - 0.5*g*t^2;
endfunction

v0 = 30;
theta = 60;

istenilen_hassasiyet = 0.00001;

a = 0.01;
f_a = atis_y(v0,theta,a);

b = 10;
f_b = atis_y(v0,theta,b);

adim = 1;
while(abs(a-b)>istenilen_hassasiyet)
    % arama araliginin boyu |a-b|, istenilen hassasiyetten
    % buyuk oldugu surece, yarilamaya devam ediyoruz
    c = (a+b)/2;
    f_c = atis_y(v0,theta,c);
    printf("%2d: %9.6f  %10.5f | %9.6f  %10.5f | %9.6f  %10.5f\n",adim,a,f_a,c,f_c,b,f_b);
    if(sign(f_c) == sign(f_a))
        % c ile a'nın yükseklikleri aynı işaretli, o zaman 
        % arada kök olmasının garantisi yok, arayışa c ile b 
        % arasında devam edelim
        a = c;
        f_a = f_c;
    else
        % c ile b'nin yükseklikleri aynı işaretli, o zaman 
        % arada kök olmasının garantisi yok, arayışa a ile c 
        % arasında devam edelim
        b = c;
        f_b = f_c;
    endif
    adim = adim + 1;
endwhile

roots([3 0 -4 1])

v0 = 30;
theta = 60;
g = 9.81;
roots([-0.5*g v0*sind(theta) 0])


clear;

function f=atis_y(v0,theta,t,g=9.81)
f = v0*sind(theta)*t - 0.5*g*t^2;
endfunction

v0 = 30;
theta = 60;
g = 9.81;

t_d = 2*v0*sind(theta)/g

N = 5;

t_ler = linspace(0,t_d,N)

y_konumlari = [];

for t = t_ler
    y_konumlari = [y_konumlari, atis_y(v0,theta,t)];
endfor

y_konumlari

plot(t_ler,y_konumlari,"-*")

clear;

function f=atis_y(v0,theta,t,g=9.81)
f = v0*sind(theta)*t - 0.5*g*t.^2;
endfunction

function f=atis_x(v0,theta,t,g=9.81)
f = v0*cosd(theta)*t;
endfunction

v0 = 30;
theta = 60;
g = 9.81;

t_d = 2*v0*sind(theta)/g;

N = 100;

t_ler = linspace(0,t_d,N);

y_konumlari = atis_y(v0,theta,t_ler);
x_konumlari = atis_x(v0,theta,t_ler);

plot(t_ler,y_konumlari,"-*")
xlabel("t (s)")
ylabel("y (m)")
title("Zamana Gore Yukseklik Grafigi")


plot(x_konumlari,y_konumlari,"r-*")
xlabel("x (m)")
ylabel("y (m)")
title("Parcacigin Yorunge Grafigi")

clear;

function [t_d,h_max,R] = ucus_analiz(v0,theta,g=9.81)
v0_y = v0*sind(theta);
t_d = 2*v0_y/g;
t_d_bolu_2 = t_d /2;
h_max = v0_y*t_d_bolu_2 - 0.5*g*t_d_bolu_2^2;
R = v0*cosd(theta) * t_d;
endfunction

ilk_hiz = 30;
aci = 60;
[ucus_zamani,max_yukseklik,menzil] = ucus_analiz(ilk_hiz,aci);
printf("Ucus zamani: %7.4fs | Maksimum Yukseklik: %6.3fm | Menzil: %6.3fm\n",ucus_zamani,max_yukseklik,menzil)

ucus_zamanlari = [];
max_yukseklikler = [];
menziller = [];

acilar = 1:90;
for aci = acilar
    [ucus_zamani,max_yukseklik,menzil] = ucus_analiz(ilk_hiz,aci);
    ucus_zamanlari = [ucus_zamanlari, ucus_zamani];
    max_yukseklikler = [max_yukseklikler, max_yukseklik];
    menziller = [menziller, menzil];
endfor

sonuclar = [acilar' ucus_zamanlari' max_yukseklikler' menziller']

plot(acilar,ucus_zamanlari,"-*");
xlabel("Aci (derece)");
ylabel("Ucus zamani (s)");
title("Acilara gore ucus zamanlari");

plot(acilar,max_yukseklikler,"r-o");
xlabel("Aci (derece)");
ylabel("Maksimum yukseklik (m)");
title("Acilara gore maksimum yukseklikler");

plot(acilar,menziller,"k-^");
xlabel("Aci (derece)");
ylabel("Menzil (m)");
title("Acilara gore menziller");

subplot(2,2,1);
plot(acilar,ucus_zamanlari,"-*");
xlabel("Aci (derece)");
ylabel("Ucus zamani (s)");
title("Acilara gore ucus zamanlari");

subplot(2,2,2);
plot(acilar,max_yukseklikler,"r-o");
xlabel("Aci (derece)");
ylabel("Maksimum yukseklik (m)");
title("Acilara gore maksimum yukseklikler");

subplot(2,2,3);
plot(acilar,menziller,"k-^");
xlabel("Aci (derece)");
ylabel("Menzil (m)");
title("Acilara gore menziller");

subplot(2,2,4);
plot(menziller/2,max_yukseklikler,"ms");
xlabel("? 8)");
ylabel("? ;)");
title("Bakalim bunu yorumlayabilecek misiniz?");
