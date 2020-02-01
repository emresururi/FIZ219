ortalama(3,9)

x = [4 2 9 -3 4];
ortalama(x)

dizi = [1 2 3];
ortalama(dizi)

[a_ort g_ort] = ortalama(dizi)

help ortalama

fibonacci = [0 1];
for i=3:100
    fibonacci(i) = fibonacci(i-2) + fibonacci(i-1);
endfor
fibonacci(1:10) % ilk 10 terim
fibonacci(98:100) % son 3 terim

for n=0:9
    printf("F_%d: %3d\n",n,fibo(n))
endfor

function g=arttir(a,b=4)
% ikinci parametre girilmediği takdirde, birinciyi 4 arttırır, 
% girildiği takdirde ikinci kadar arttırır
g = a + b;
endfunction

arttir(3,9)
arttir(3)

% a ve b'ye kodumuzda değer atayalım
a = 5
b = 7

function a=topla(x,y)
% fonksiyon içinde de a ve b geçiyor,
% hatta a, dönüş değerinin ta kendisi olarak tanımlı!
a = x + y; 
% b = 3;
endfunction

topla(3,6) 
% Fonksiyonu çalıştırdık
% bakalım a'nın değeri ne oldu?
a
% b ne oldu peki?
b

function f=tarih_saat()
su_an = localtime(time);
printf("Saat: %02d:%02d\n",su_an.hour(),su_an.min());
endfunction

tarih_saat()
