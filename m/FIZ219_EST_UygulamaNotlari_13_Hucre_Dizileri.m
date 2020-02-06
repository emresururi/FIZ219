x = linspace(0,2*pi,1000);

% x'deki artis miktari
dx = x(2) - x(1);

sinus = sin(x);

% sinus'deki artis miktarlarini hesaplatip, x'deki artis
% miktarina (yani dx'e) bolelim 
% (dx ne kadar kucukse, turev degerine de o kadar
% yaklasmis oluruz!)
dsinus_dx = (sinus(2:end) - sinus(1:end-1)) / dx;

% Kiyaslama icin bildigimiz turev sonucu ile birlikte cizdirelim:
plot(x,sinus,x(1:end-1),dsinus_dx,"r-",x,cos(x),"g-.")
legend("sin(x)","d(sin(x))/dx","cos(x)")

x = linspace(0,2*pi,1000);
sinus = [];
for i = x
    sinus = [sinus sin(i)];
endfor

x = linspace(0,2*pi,1000);
sinus = sin(x);

% Once for dongusu ile yapilan islemi olcelim:
tic
x = linspace(0,2*pi,1000);
sinus = [];
for i = x
    sinus = [sinus sin(i)];
endfor
toc

% Simdi de dogrudan vektor uzerinden:
tic
x = linspace(0,2*pi,1000);
sinus = sin(x);
toc

dizi_tamsayilar = [-5 6 0 2 -33]
dizi_ondalikli  = [1.2 6 3.4 -7.5]
dizi_karmasik   = [1+3*j 6 -2-5*j]

dizi_tamsayilar = [dizi_tamsayilar 3.4]
dizi_ondalikli  = [dizi_ondalikli 1+3*j]

sayi_dizisi = [1 2 3; 4 5 6]
sayi_dizisi(3,2) = 7

hucre_dizisi = {1,"FİZ219",1.23}

hucre_dizisi{2}

hucre_dizisi{2,4} = "FİZ371"

hucre_dizisi{2,3} = [5 4 3; 2 1 0]

hucre_dizisi{1,4} = {5,"Bilgisayar Programlama I", "Emre S. Tasci"}

# Cevap:
hucre_dizisi{1,4}{2}

# Cevap:
hucre_dizisi{2,3}(2,1)

# Cift sayilari ayiralim:
sonuc = [] # sonuclari toplayacagimiz -simdilik- bos kume
for i=1:10
    if (mod(i,2)==0)
        sonuc = [sonuc i]; # sonuc'un dibine secili i'yi ekliyoruz
    endif
endfor

sonuc

# Cift sayilari bu sefer hucre dizisi icine ayiralim:
sonuc = {} # sonuclari toplayacagimiz -simdilik- bos kume
for i=1:10
    if (mod(i,2)==0)
        sonuc = {sonuc i}; # sonuc'un dibine secili i'yi ekliyoruz
    endif
endfor

sonuc

# Cift sayilari bu sefer hucre dizisi icine ayiralim:
# - 2. deneme...-

sonuc = {} # sonuclari toplayacagimiz -simdilik- bos kume
for i=1:10
    if (mod(i,2)==0)
        sonuc = {sonuc{:} i}; # sonuc'un dibine secili i'yi ekliyoruz
    endif
endfor

sonuc
