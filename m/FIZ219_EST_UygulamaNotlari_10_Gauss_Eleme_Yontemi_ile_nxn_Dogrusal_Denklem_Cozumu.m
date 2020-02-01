# y = 2x - 5 denklemini cizdirelim

m = 2;
n = -5;
x = linspace(-1,5,7);
y = m*x + n;
plot(x,y,"-o");

# Bu alttakiler grafigimiz guzel gorunsun diye 8)
set(gca, "xaxislocation", "origin")
set(gca, "yaxislocation", "origin")
set(gca, "box", "off")
yticks(-8:6)

# y = -3x + 5 denklemini cizdirelim

m = -3;
n =  5;
x = linspace(-1,5,7);
y = m*x + n;
plot(x,y,"-or");

# Bu alttakiler grafigimiz guzel gorunsun diye 8)
set(gca, "xaxislocation", "origin")
set(gca, "yaxislocation", "origin")
set(gca, "box", "off")
yticks(-10:10)

x = linspace(-1,5,7);
y1 =  2*x - 5;
y2 = -3*x + 5;

plot(x,y1,"-ob",x,y2,"-or");

set(gca, "xaxislocation", "origin")
set(gca, "yaxislocation", "origin")
set(gca, "box", "off")
yticks(-10:10)

x = linspace(-1,5,7);
y1 = 2*x - 1;
y2 = 2*x + 1;

plot(x,y1,"-ob",x,y2,"-or");

set(gca, "xaxislocation", "origin")
set(gca, "yaxislocation", "origin")
set(gca, "box", "off")
yticks(-10:10)

m = 1:5;
F = [10.1918   23.2071   33.3248   42.3553   56.3806];
plot(m,F,"s")

A = [ 2 -5; -3 4]
b = [-8; 5]

# Satir cok uzun oldugu icin "..." kesme isareti ile ikiye ayirdim
y = (-A(2,1) / A(1,1) * b(1) + b(2) ) ...
/ (-A(2,1) / A(1,1) * A(1,2) + A(2,2))

x = (b(1) - A(1,2) * y) / A(1,1)

# Once A ile b'yi birlestirip, M matrisini olusturalim:
M = [A b]

# 1. satiri 3/2 ile carpip, ikinciye ekleyelim:
M(2,:) = 3/2 * M(1,:) + M(2,:)

# 2. denklemde (satirda) y yalniz kaldigina gore:
y = M(2,3) / M(2,2)

# x'i bulmak icin bu y degerini kullanmamiz gerekiyor:
x = (M(1,3) - M(1,2) * y) / M(1,1)

A = [2 -5 3; 1 3 -4; -2 2 -3]
b = [7; -2; -10]
M = [A b]

M(2,:) = -M(2,1)/M(1,1) * M(1,:) + M(2,:)

M(3,:) = -M(3,1)/M(1,1) * M(1,:) + M(3,:)

M(3,:) = -M(3,2) / M(2,2) * M(2,:) + M(3,:)

A = [2 -5 3; 1 3 -4; -2 2 -3]
b = [7; -2; -10]
M = [A b]

n = rows(M); # Degisken ve denklem sayisi

printf("(%dx%d) bir denklem takimi cozuyoruz!\n",n,n);
disp("-----------------------------------")


# Ileriye eleme asamasi:
for eleyen_satir_no = 1:n-1
    for etkilenen_satir_no = eleyen_satir_no+1:n
        M(etkilenen_satir_no,:) = M(etkilenen_satir_no,:) ...
           + M(eleyen_satir_no,:) / M(eleyen_satir_no,eleyen_satir_no)...
           * -M(etkilenen_satir_no,eleyen_satir_no);
    endfor
endfor
disp("Ileriye eleme asamasinin sonucu:");
M
for simdiki_satir_no = n:-1:1
    toplam = 0
    for i = simdiki_satir_no+1 : n
        toplam = toplam + simdiki_satirin_i._sutunu * i.bilinmeyen
    endfor
    simdiki_satir_nolu_bilinmeyeni = (simdiki_satirin_n+1._sutunu - toplam) / 
                                      simdiki_satirin_simdiki_satir_nolu_sutunu
endfor
# (Bu asamaya baslarken, M'nin ileriye elenmis 
#   halde oldugunu varsayıyoruz)
M

# Geriye yerine yerlestirme asamasi:
x = zeros(n,1); # Buldugumuz cozumleri bu dizide tutacagiz

for simdiki_satir_no = n:-1:1
    toplam = 0;
    for i = simdiki_satir_no+1:n
        toplam = toplam + M(simdiki_satir_no,i) * x(i);
    endfor
    x(simdiki_satir_no) = (M(simdiki_satir_no,n+1) - toplam) ...
      / M(simdiki_satir_no,simdiki_satir_no);
endfor
disp("Geriye yerine yerlestirme asamasinin sonucu:");
x

function x=nn_coz(A,b)
% A(nxn) katsayılar matrisi ve b(nx1) cozum vektoru 
% seklinde verilen n bagimsiz dogrusal denklem 
% takimini cozer.
%
% Sonuc olarak x cozum vektorunu dondurur. (A.x = b)
%
% FIZ219 - Bilgisayar Programlama Dersi, 10. Ders Notu Eki
% Dr. Emre S. Tasci <emre.tasci@hacettepe.edu.tr>
% 11 / 01 / 2020

M = [A b];

n = rows(M); # Degisken ve denklem sayisi

# Ileriye eleme asamasi:
for eleyen_satir_no = 1:n-1
    for etkilenen_satir_no = eleyen_satir_no+1:n
        M(etkilenen_satir_no,:) = M(etkilenen_satir_no,:) ...
           + M(eleyen_satir_no,:) / M(eleyen_satir_no,eleyen_satir_no)...
           * -M(etkilenen_satir_no,eleyen_satir_no);
    endfor
endfor

# Geriye yerine yerlestirme asamasi:
x = zeros(n,1); # Buldugumuz cozumleri bu dizide tutacagiz

for simdiki_satir_no = n:-1:1
    toplam = 0;
    for i = simdiki_satir_no+1:n
        toplam = toplam + M(simdiki_satir_no,i) * x(i);
    endfor
    x(simdiki_satir_no) = (M(simdiki_satir_no,n+1) - toplam) ...
      / M(simdiki_satir_no,simdiki_satir_no);
endfor
endfunction

A = [2 -5 3; 1 3 -4; -2 2 -3]
b = [7; -2; -10]
x = nn_coz(A,b)

m1 = 8.6; m2 = 1.3; muA = 0.35; muB = 0.45; theta = 38; g = 9.81;

A = [1  m1
     1 -m2]
b = [m1*g*sind(theta) - g*cosd(theta)*(muA*m1 + muA*m2 + muB*m2)
     m2*g*(muB*cosd(theta) + sind(theta))]

x = nn_coz(A,b)

# Birbirine bagli ve biri digerinin uzerinde iki cismin
# egik duzlem uzerindeki ivmelerini ve baglandiklari ipteki
# gerilimi cozen program.
#
# (Soruya ornek olarak http://physics.bu.edu/~duffy/py105/Friction.html)
# adresindeki 2. soru alinmistir).
#
# FIZ219 - Bilgisayar Programlama Dersi
# Uygulama Notları: 10
# Gauss eleme yöntemi ile n bilinmeyenli n 
#            -doğrusal- denklemin çözümü örneği
# 
# Dr. Emre S. Tasci <emre.tasci@hacettepe.edu.tr>
# 11/01/2020

clear;

# nn_coz() fonksiyonu:
function x=nn_coz(A,b)
% A(nxn) katsayılar matrisi ve b(nx1) cozum vektoru 
% seklinde verilen n bagimsiz dogrusal denklem 
% takimini cozer.
%
% Sonuc olarak x cozum vektorunu dondurur. (A.x = b)
%
% FIZ219 - Bilgisayar Programlama Dersi, 10. Ders Notu Eki
% Dr. Emre S. Tasci <emre.tasci@hacettepe.edu.tr>
% 11 / 01 / 2020

M = [A b];

n = rows(M); # Degisken ve denklem sayisi

# Ileriye eleme asamasi:
for eleyen_satir_no = 1:n-1
    for etkilenen_satir_no = eleyen_satir_no+1:n
        M(etkilenen_satir_no,:) = M(etkilenen_satir_no,:) ...
           + M(eleyen_satir_no,:) / M(eleyen_satir_no,eleyen_satir_no)...
           * -M(etkilenen_satir_no,eleyen_satir_no);
    endfor
endfor

# Geriye yerine yerlestirme asamasi:
x = zeros(n,1); # Buldugumuz cozumleri bu dizide tutacagiz

for simdiki_satir_no = n:-1:1
    toplam = 0;
    for i = simdiki_satir_no+1:n
        toplam = toplam + M(simdiki_satir_no,i) * x(i);
    endfor
    x(simdiki_satir_no) = (M(simdiki_satir_no,n+1) - toplam) ...
      / M(simdiki_satir_no,simdiki_satir_no);
endfor
endfunction


# Sorunun verileri:
m1 = 8.6; 
m2 = 1.3;
muA = 0.35; 
muB = 0.45;
theta = 38; 
g = 9.81;

# Bundan sonrasi genel olup, benzer sorular icin sadece
# yukaridaki verilerin degistirilmesi yeterlidir.

# Katsayilar matrisi (1. sutun T; 2. sutun a'nin katsayilari):
A = [1  m1
     1 -m2];

# Sonuclar vektoru:
b = [m1*g*sind(theta) - g*cosd(theta)*(muA*m1 + muA*m2 + muB*m2)
     m2*g*(muB*cosd(theta) + sind(theta))];


x = nn_coz(A,b);

printf("     Ipteki Gerilme: %10.6f N\nKutlelerin ivmeleri: %10.6f m/s^2\n",x(1),x(2));

# Verileri girelim:
R1 = 6; R2 = 2.5; R3 = 1.5;
r2 = 500E-3; r3 = 500E-3;
V1 = 18; V2 = 45;

# Katsayilar matrisi:
A = [R1  r2+R2   0
     R1    0   r3+R3
      0  r2+R2 -(r3+R3)]

# Sonuc vektoru:
b = [V1; V2; V1-V2]

x = nn_coz(A,b)

# Verileri girelim:
R1 = 6; R2 = 2.5; R3 = 1.5;
r2 = 500E-3; r3 = 500E-3;
V1 = 18; V2 = 45;

# Katsayilar matrisi:
A = [R1  r2+R2   0
     R1    0   r3+R3
      1   -1     -1]

# Sonuc vektoru:
b = [V1; V2; 0]

x = nn_coz(A,b);

printf("I1: %8.3f A\nI2: %8.3f A\nI3: %8.3f A\n",x);

# Gosteri icin Kirchoff problemindeki veriyi kullanalim:
A = [ 6   3   0
      6   0   2
      1  -1  -1]

b = [18; 45; 0]

disp("1. yöntem: linsolve fonksiyonu:");
disp("x = linsolve(A,b)")
x = linsolve(A,b)
disp("--------------")

disp("2. yöntem: iki tarafı da A matrisinin tersi ile çarpmak:");
disp("x = inv(A)*b")
x = inv(A)*b
disp("--------------")

disp("3. yöntem: ters bölme operatörünü kullanmak:");
disp("x = A\b")
x = A\b
disp("--------------")

disp("3. yöntem: mldivide fonksiyonu: (bu '\\' operatörüne eşdeğer)");
disp("x = mldivide(A,b)")
x = mldivide(A,b)
disp("--------------")

# Verileri girelim:
R1 = 6; R2 = 2.5; R3 = 1.5;
r2 = 500E-3; r3 = 500E-3;
V1 = 18; V2 = 45;

# Katsayilar matrisi:
A1 = [R1  r2+R2   0
     R1    0   r3+R3
      0  r2+R2 -(r3+R3)];

# Sonuc vektoru:
b1 = [V1; V2; V1-V2];

M1 = [A1 b1]

rank(M1)

# Verileri girelim:
R1 = 6; R2 = 2.5; R3 = 1.5;
r2 = 500E-3; r3 = 500E-3;
V1 = 18; V2 = 45;

# Katsayilar matrisi:
A2 = [R1  r2+R2   0
     R1    0   r3+R3
      1   -1     -1];

# Sonuc vektoru:
b2 = [V1; V2; 0];

M2 = [A2 b2]

rank(M2)
