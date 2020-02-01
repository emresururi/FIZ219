x = -3:0.5:3

x = linspace(-3,3,100)

a = 1
a = 2
a = 3
a = 4
a = 5

n = 1:5

for i = 1:5
    a = i
endfor

n = 1:5;
for i = n
    a = i
endfor

s = 0; % Değerleri s'de toplayacağımız için ilk olarak s'yi tanımlayıp sıfırlıyoruz.
xler = -3:0.5:3; % 'xler' ile 'x' arasındaki farka dikkat edin!
for x = xler
    s = s + x*x;
endfor
s

s = 0;
xler = [5,-3,19,12,-2];
for x = xler
    printf("x'in şimdiki değeri: %3d\n",x) % printf() ekrana düzgün bir şekilde 
                                           % yazdırmak için kullanılır, yoksayabilirsiniz.
    s = s + x*x;
endfor
s

xler = [5,-3,19,12,-2];
xkareler = xler.^2

xler = []
xler = [5]
xler = [5 -3] 
xler = [5 -3 19]

xler = []
xler = [xler 5]
xler = [xler -3]
xler = [xler 19]
xler = [xler 12]
xler = [xler -2]

xler = [5,-3,19,12,-2];
xkareler = [];
for x = xler
    xkareler = [xkareler x*x];
endfor
xkareler

3 > 1
5 < 4
12 <= 13
12 >= 12
3 != 7
7 == 7
3 == 5


kareler_toplami = 0;
x = -3; % başlangıç değerimiz
while (x <= 3)
    kareler_toplami = kareler_toplami + x*x;
    x = x + 1;
endwhile
kareler_toplami

x

a = 5
if (a == 5)
    disp("a, 5'e eşit")
endif

if(a > 6)
    disp("a, 6'dan büyük")
endif

if(a < 9)
    disp("a, 9'dan küçük")
endif

a = 5
if(a == 5)
    disp("a 5'e eşit")
elseif(a > 5)
    disp("a 5'ten büyük")
else
    disp("a 5'ten küçük")
endif

alar = [7   -9    3   -7    8   5    6    -2     2    5    0]
for a = alar
    a
    if(a==5)
        disp("a 5'e eşit!")
    elseif(a>5)
        disp("a 5'ten büyük.")
    else
        disp("a 5'ten küçük")
    endif
    disp("---------------------")
endfor

alar = [7   -9    3   -7    8   5    6    -2     2    5    0]
tekler = [];
ciftler = [];
for a = alar
    if(mod(a,2) == 0)
        % a, 2 ile bölündüğünde kalanı sıfır oluyor (mod)
        % o zaman çift demektir
        ciftler = [ciftler a];
    else
        tekler = [tekler a];
    endif
endfor
disp("Tek sayılar:")
tekler

disp("Çift sayılar:")
ciftler

asallar = []; % bulduğumuz asalları bu listenin içine koyacağız
for sayi = 2:10
    % bu bizim asallığını kontrol etmek istediğimiz sayı
    disp("Asallığını kontrol ettiğimiz sayı:")
    sayi
    disp("") % Bir boş satır ekleyelim
    for bolen = 2:sayi-1
        % bölenlerin döngüsünün bitişini 
        % sayi'ya bağlı olarak tanımladığımıza dikkat edin!
        bolen
        kalan = mod(sayi,bolen)
        if(kalan == 0)
            % Bu sayı asal olamaz.
            disp("Sayı asal değil!")
            disp("") % Bir boş satır ekleyelim
        else
            % Buraya sadece asal sayılar mı ulaşabiliyor acaba?
            % Hayır! 8)
            % Örneğin sayi 9, bolen 2,4,5,6,7,8 olduğunda
            % kalan 0 olmayacak ama biliyoruz ki sayı asal değil
        endif
        disp("") % Bir boş satır ekleyelim
    endfor
    disp("-------------------")
endfor

asallar = []; % bulduğumuz asalları bu listenin içine koyacağız
for sayi = 2:10
    % bu bizim asallığını kontrol etmek istediğimiz sayı
    disp("Asallığını kontrol ettiğimiz sayı:")
    sayi
    disp("") % Bir boş satır ekleyelim
    for bolen = 2:sayi-1
        % bölenlerin döngüsünün bitişini 
        % sayi'ya bağlı olarak tanımladığımıza dikkat edin!
        bolen
        kalan = mod(sayi,bolen)
        if(kalan == 0)
            % Bu sayı asal olamaz.
            disp("Sayı asal değil! - döngüden burada çıkıyorum.")
            disp("") % Bir boş satır ekleyelim
            break; % "bolen = 2:sayi-1" döngüsünü kırıyoruz
        endif
        disp("") % Bir boş satır ekleyelim
    endfor
    
    % Buraya iki yoldan gelmiş olabiliriz:
    %   ya sayi kalansız bolundu ve döngü break ile kırıldı
    %     (bu durumda kalan == 0)
    %   ya da hiçbir bolen kalansız bölemedi ve 2:sayi-1 döngüsü
    %     normal yoldan sona erdi (bu durumda kalan != 0)
    if(kalan != 0)
        disp("Sayı asal!")
        asallar = [asallar sayi];
    endif
    disp("-------------------")
endfor
asallar

m = zeros(5,5) % bütün elemanları 0 olan, 5x5 bir matris oluşturur.
for satir=1:5
    for sutun = 1:5
        m(satir,sutun) = 1;
        if(satir == sutun)
            break;
            % şu anda sutun=1:5 döngüsünün içinde olduğumuzdan
            % break ile sadece bu bloktan çıkarız.
        endif
    endfor
endfor
m

asallar = [2]; % bulduğumuz asalları bu listenin içine koyacağız
for sayi = 3:10
    % bu bizim asallığını kontrol etmek istediğimiz sayı
    disp("Asallığını kontrol ettiğimiz sayı:")
    sayi
    disp("") % Bir boş satır ekleyelim
    for bolen = asallar
        % asallar listesinin dinamik bir liste olduğunu
        % yani mesela 4'e gelindiğinde [2 3];
        % 9'a gelindiğinde [2 3 5 7] olduğuna dikkat edin!
        bolen
        kalan = mod(sayi,bolen)
        if(kalan == 0)
            % Bu sayı asal olamaz.
            disp("Sayı asal değil! - döngüden burada çıkıyorum.")
            disp("") % Bir boş satır ekleyelim
            break; % "bolen = 2:sayi-1" döngüsünü kırıyoruz
        endif
        disp("") % Bir boş satır ekleyelim
    endfor
    
    % Buraya iki yoldan gelmiş olabiliriz:
    %   ya sayi kalansız bolundu ve döngü break ile kırıldı
    %     (bu durumda kalan == 0)
    %   ya da hiçbir bolen kalansız bölemedi ve 2:sayi-1 döngüsü
    %     normal yoldan sona erdi (bu durumda kalan != 0)
    if(kalan != 0)
        disp("Sayı asal!")
        asallar = [asallar sayi];
    endif
    disp("-------------------")
endfor
asallar
