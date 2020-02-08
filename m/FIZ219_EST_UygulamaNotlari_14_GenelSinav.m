
# Tercihen fibo_n.m dosyasi olarak
function f = fibo_n(a1,a2,N)
for i=3:N
    f = a1 + a2;
    a1 = a2;
    a2 = f;
endfor
endfunction

fibo_n(2,5,4)

# a)
function f=fonk(x)
    f = x.^2 + 2.2*x - 15;
endfunction

# b)
x = linspace(-6,3,100);
plot(x,fonk(x));

# c)
epsilon = 10^-6;

# 1. kok:
a = -6;
b = 3;
f_a = fonk(a);
f_b = fonk(b);
kok1 = (a + b)/2;
kok_onceki = -100;
i = 0;
while (abs(kok1-kok_onceki)>epsilon)
    f_kok = fonk(kok1);
    i++;
    printf("%04d. %10.7f | %10.7f | %10.7f \t%9.5f\n",i,a,kok1,b,f_kok);
    if(sign(f_a) == sign(f_kok))
        a = kok1;
        f_a = f_kok;
    else
        b = kok1;
        f_b = f_kok;
    endif
    kok_onceki = kok1;
    kok1 = (a + b)/2;
endwhile
printf("1. Kok: %.9f\n",kok1);

printf("\n--------------------------\n")

# 2. kok:
a = kok1+epsilon;
b = 3;
f_a = fonk(a);
f_b = fonk(b);
kok2 = (a + b)/2;
kok_onceki = -100;
i = 0;
while (abs(kok2-kok_onceki)>epsilon)
    f_kok = fonk(kok2);
    i++;
    printf("%04d. %10.7f | %10.7f | %10.7f \t%9.5f\n",i,a,kok2,b,f_kok);
    if(sign(f_a) == sign(f_kok))
        a = kok2;
        f_a = f_kok;
    else
        b = kok2;
        f_b = f_kok;
    endif
    kok_onceki = kok2;
    kok2 = (a + b)/2;
endwhile
printf("2. Kok: %.9f\n",kok2);


# Kontrol edelim:
printf("\nroots() fonksiyonu ile bulunan kökler:\n%.9f\t%.9f\n",roots([1 2.2 -15]))

function kok=kok_bul_fonk(a,b,epsilon)
# 'fonk' fonksiyonun [a,b] araliginda 
# yarilama (bisection) yontemi ile 
# epsilon yaklasiklikla kokunu bulur.

if(a>b)
    # Eger a, b degerinden buyukse,
    # yerlerini degistiriyoruz
    c = a;
    a = b;
    b = c;
endif

f_a = fonk(a);
f_b = fonk(b);
kok = (a + b) / 2;
kok_onceki = a - 1;

while(abs(kok-kok_onceki)>epsilon)
    f_kok = fonk(kok);
    if(sign(f_a) == sign(f_kok))
        a = kok;
        f_a = f_kok;
    else
        b = kok;
        f_b = f_kok;
    endif
    kok_onceki = kok;
    kok = (a + b) / 2;
endwhile
endfunction

a = -6;
b = 3;
epsilon = 1E-6;
kok1 = kok_bul_fonk(a,b,epsilon);
kok2 = kok_bul_fonk(kok1+epsilon,b,epsilon);
printf("1. Kok: %10.7f\n2. Kok: %10.7f\n",kok1,kok2)

# Ogrenci sayisini [50,300] arasinda rasgele olarak belirleyip, 
# rasgele olarak notlar matrisini olusturalim:
n = randi([50,300]);
notlar = randi([0 100],[n 3]);
notlar(1:5,:)

# a)
notlar(:,4) = (notlar(:,1) + notlar(:,2))/4 + notlar(:,3)/2;
notlar(1:5,:)

# b)
gecenler_ort = notlar(notlar(:,4)>=50,4);
gecenler_ort(1:5)

rows(gecenler_ort)

# c)
gecenler_ort_ort = mean(gecenler_ort)

# veya:
gecenler_ort_ort = sum(gecenler_ort) / rows(gecenler_ort)

alar=0:0.1:5;
Alanlar=[];
a_max = 0;
Alan_max = 0;
for a=alar
    b = 5 - a;
    Alan = a * b;
    if(Alan > Alan_max)
        a_max = a;
        Alan_max = Alan;
    endif
    Alanlar = [Alanlar Alan];
endfor

printf("Maksimum alani veren a: %4.2f m\n",a_max);
printf("Bu degere karsilik bulunan alan: %6.3f m^2\n",Alan_max);

plot(alar,Alanlar);
xlabel("a (m)");
ylabel("Alan (m^2)");

# En acik haliyle

N = randi([10,200]);
N=1000; # Hiz karsilastirmasi yapmak icin ayni N degeri
konum = [0,0];

tic();
for i=1:N
    yon = randi([1,4]);
    if(yon == 1)
        # Dogu
        konum = konum + [1 0];
    elseif(yon == 2)
        # Bati
        konum = konum + [-1 0];
    elseif(yon == 3)
        # Kuzey
        konum = konum + [0 1];
    elseif(yon == 4)
        # Guney
        konum = konum + [0 -1];
    endif
endfor

mesafe = sqrt(konum(1)^2 + konum(2)^2)
toc()

# Daha ustaca bir yaklasim

N = randi([10,200]);
N=1000; # Hiz karsilastirmasi yapmak icin ayni N degeri
konum = [0,0];

tic();
yon = [1 0
-1 0
0 1
0 -1];
yonler = randi([1,4],[1,N]);
for i=1:N
    konum = konum + yon(yonler(i));
endfor

mesafe = norm(konum)
toc()

# Daha da ustaca bir yaklasim

N = randi([10,200]);
N=1000; # Hiz karsilastirmasi yapmak icin ayni N degeri
konum = [0,0];

tic();

konumlar =  randi([1,4],[1,N]);
xler_net = sum(konumlar==1) - sum(konumlar==2);
yler_net = sum(konumlar==3) - sum(konumlar==4);

mesafe = norm([xler_net yler_net])
toc()

# En super yaklasim 
# (ama 4 ana yonden baska, capraz yonlere de izin olsaydi)

N = randi([10,200]);
N=1000; # Hiz karsilastirmasi yapmak icin ayni N degeri
konum = [0,0];

tic();

konumlar = randi([0,1],[N,2]);
konumlar(konumlar(:,:)==0) = -1;

mesafe = norm(sum(konumlar))
toc()

% 2 Boyutlu, 4 ana yone sarhos yuruyus problemi
% Daha once gidilen yere gidilmez.
% Gidecek yon kalmayinca programdan cikilir.
%
% FIZ219 - Bilgisayar Programlama I dersi
% Dr. Emre S. Tasci <emre.tasci@hacettepe.edu.tr>

clear;

N = randi([10,200]);
N=1000;

konum = [0,0];
konumlar = [];
konumlar = [konumlar; konum];

olasi_yonler = [1 0;-1 0;0 1;0 -1];


% (0,0)'dan baslayip, 4 yone de gidebildigimiz
% icin konumumuz negatif degerler de alabilir.
% Halbuki, konumlari isaretleyecegimiz 'Harita'
% matrisimizin indisleri sadece pozitif degerler
% olmak zorunda. Bu yuzden bir numara yapip,
% orijinimizi matrisimizin ortasina tasiyoruz.
Harita = zeros(2*N+1,2*N+1);
knp1 = konum+N+1;
Harita(knp1(1),knp1(2)) = 1;

for i=1:N
    % Konumu kontrol et:
    pes_etsin_mi = 1;
    konum2harita = konum+N+1;
    for j = 1:4
            knp1 = konum2harita+olasi_yonler(j,:);
            if(Harita(knp1(1),knp1(2)) == 0)
                pes_etsin_mi = 0;
                break;
            endif
    endfor
    if(pes_etsin_mi == 1)
        printf("%d. adimda (%d,%d) cikmaza dustuk!\n",i,konum(1),konum(2));
        break;
    endif

    % Bu noktada biliyoruz ki en az bir tane gidilebilecek yer var
    olasi_konum = konum; 
    knp1 = olasi_konum+N+1;
    while(Harita(knp1(1),knp1(2)) != 0)
        yon = randi([1,4]);
        if(yon == 1)
            % Dogu
            olasi_konum = konum + [1 0];
        elseif(yon == 2)
            % Bati
            olasi_konum = konum + [-1 0];
        elseif(yon == 3)
            % Kuzey
            olasi_konum = konum + [0 1];
        elseif(yon == 4)
            % Guney
            olasi_konum = konum + [0 -1];
        endif
        knp1 = olasi_konum+N+1;
    endwhile
    konum = olasi_konum;
    konumlar = [konumlar; konum];
    knp1 = konum+N+1;
    Harita(knp1(1),knp1(2)) = i+1;
endfor

mesafe = sqrt(konum(1)^2 + konum(2)^2)

#konumlar

% Bundan sonrasi gorsellestirme ile ilgili

% Haritanin tutuldugu buyuk matriste, sadece ilgili
% bolgeye zoom'layalim:
min_max_x = [1:2*N+1](any(Harita,2));
min_max_y = [1:2*N+1](any(Harita,1));
min_x = min(min_max_x)-1;
max_x = max(min_max_x)+1;
min_y = min(min_max_y)-1;
max_y = max(min_max_y)+1;
Harita(min_x:max_x,min_y:max_y)

% Bu da harita ile uyumlu olarak konumlarin gosterilisi
plot(konumlar(1,2),-konumlar(1,1),"bo","markersize",10,'LineWidth',6,...
     konumlar(:,2),-konumlar(:,1),"-o",...
     konumlar(end,2),-konumlar(end,1),"rx","markersize",10,'LineWidth',6)
axis([min(konumlar(:,2))-1,max(konumlar(:,2))+1,...
     -1-max(konumlar(:,1)),1-min(konumlar(:,1))])
