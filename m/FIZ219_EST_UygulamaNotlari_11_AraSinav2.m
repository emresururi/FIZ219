function p = piramit(x)
toplam=0;
for i=1:x
    printf('\n');
    for j=1:i
        printf('%d ',j);
        toplam = toplam + j;
    endfor
endfor
p=toplam;
end

piramit(5)

x=-5; y=abs(x); z = 312.23456789;
printf("x in degeri: %8.4f - y nin degeri: %2.1f - z nin degeri: %6.2f.\n",x,y,z)

a = [6 -2 3];
b = [3 4 -2];
boy_a = norm(a);
boy_b = norm(b);
a_dot_b = dot(a,b);
cos_theta = a_dot_b / (boy_a * boy_b);
theta = acosd(cos_theta)


# Mumkun mertebe her seyi biz yapalim derseniz:
a = [6 -2 3];
b = [3 4 -2];

boy_a = 0;
boy_b = 0;
a_dot_b = 0;

for i = 1:3
    boy_a = boy_a + a(i)^2;
    boy_b = boy_b + b(i)^2;
    a_dot_b = a_dot_b + a(i)*b(i);
endfor
boy_a = sqrt(boy_a);
boy_b = sqrt(boy_b);

cos_theta = a_dot_b / (boy_a * boy_b);
theta = acosd(cos_theta)

# (tercihen) "ortalama.m" dosyasına
function ort = ortalama(s1,s2,s3)
ort = (s1+s2)/4 + s3/2;
endfunction

# Deneyelim:
ortalama(40,60,80)

function ort = ortalama2(notlar)
ort = (notlar(:,1) + notlar(:,2))/4 + notlar(:,3)/2;
endfunction

# Deneyelim
notlar = randi([0 100],[150 3]);
notlar(1:5,:)

ortalamalar = ortalama2(notlar);
ortalamalar(1:5)

m = rand([1,100]) * 20 + 60;

# ilk 5'ini yazdiralim:
m(1:5)
# Araligi kontrol edelim:
min(m)
max(m)

k70 = m(m<70);
be70 = m(m>=70);

# Kontrol edelim:
min(k70)
max(k70)
min(be70)
max(be70)

toplam = length(k70);
for ust_sinir=61:70
    alt_sinir = ust_sinir -1;
    ust_sinir_dan_kucuk_olanlar = sum(k70<ust_sinir);
    alt_sinir_dan_buyuk_esit_olanlar = sum(k70>=alt_sinir);
    ortak_olanlar = ust_sinir_dan_kucuk_olanlar + alt_sinir_dan_buyuk_esit_olanlar ...
    - toplam;
    printf("[%d - %d) araliginda %d adet sayi vardir.\n",alt_sinir,...
    ust_sinir,ortak_olanlar)
endfor

# Bir araligi acip kontrol edelim:
k70(k70>=68 & k70<69)

# Alternatif hesap yontemi
for ust_sinir=61:70
    alt_sinir = ust_sinir -1;
    ust_sinir_dan_kucuk_olanlar = sum(k70<ust_sinir);
    alt_sinir_dan_kucuk_olanlar = sum(k70<alt_sinir);
    ortak_olanlar = ust_sinir_dan_kucuk_olanlar - alt_sinir_dan_kucuk_olanlar;
    printf("[%d - %d) araliginda %d adet sayi vardir.\n",alt_sinir,...
    ust_sinir,ortak_olanlar)
endfor

# Akillica bir yontem! (uzerinde calismanizi oneririm 8)
for ust_sinir=61:70
    alt_sinir = ust_sinir -1;
    ortak_olanlar = (k70<ust_sinir) + (k70>=alt_sinir);
    ortak_olanlar = sum (ortak_olanlar==2);
    printf("[%d - %d) araliginda %d adet sayi vardir.\n",alt_sinir,...
    ust_sinir,ortak_olanlar)
endfor

# Gormediginiz '&' ("VE") operatoru kullanarak:
for ust_sinir=61:70
    alt_sinir = ust_sinir -1;
    ortak_olanlar = sum(k70<ust_sinir & k70>=alt_sinir);
    printf("[%d - %d) araliginda %d adet sayi vardir.\n",alt_sinir,...
    ust_sinir,ortak_olanlar)
endfor

# (tercihen) "bouncy_y_t.m" dosyasina
function [y,t] = bouncy_y_t(h00,g=9.8,n_t=100)
# Calculates the altitude of a free falling object 
# released from an initial height of h0, under 
# gravitational acc. g, from t=0 to y=0 with
# the n_t time intervals
#
# Emre S. Tasci <emre.tasci@hacettepe.edu.tr>
# 26/12/2019

h0 = abs(h00);

t_f = sqrt(2*h0/g);
t = linspace(0,t_f,n_t);
y = h0-0.5*g*t.^2;
    
if(h00<0)
    t = [t t(end)+t];
    yl=flip(y);
    y = [yl y];
endif

endfunction

%clear;

y = [];
t = [];

h0 = 120;
h00 = h0;
[yp,tp] = bouncy_y_t(h00,9.8,10);
[y] = [y yp];
[t] = [t tp];

for i=1:6
h00 /= 2;
end_tp = t(end);
[yp,tp] = bouncy_y_t(-h00,9.8,10);
[y] = [y yp];
[t] = [t end_tp+tp];
endfor

plot(t,y,"-ok");
yticks(0:10:h0);
ylim([0 h0]);
xlim([0 t(end)]);

