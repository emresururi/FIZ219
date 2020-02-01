A = [1:5; 6:10; 11:15; 16:20] % Güzel cevap

A = [1:5
6:10
11:15
16:20] % Eşdeğer güzellikte cevap

A = [1 2 3 4 5
6 7 8 9 10
11 12 13 14 15
16 17 18 19 20] % Bariz cevap

A = [];
for satir = 1:4
    for sutun = 1:5
        A(satir,sutun) = (satir-1)*5 + sutun;
    endfor
endfor
A % İlginç cevap

A = reshape(1:20,5,4)' % Henüz görmediğiniz bir cevap ;)

B = A([2,4],3:4) % Güzel cevap

B = A([2,4],[3,4]) % Normal cevap

B = [A(2,3) A(2,4); A(4,3) A(4,4)] % Zorlama cevap

m = 1:pi

[1:4].^2*2

a = 2;

% a = 5

b = a + 4

%theta = -pi:0.125:3*pi; % Normal aralık tanımı
theta = linspace(-pi,3*pi,100); % Güzel aralık tanımı
sinler = sin(theta);
plot(theta,sinler)

koslar = cos(theta);
plot(theta,sinler,theta,koslar)

plot(theta,sinler,".r",theta,koslar,"--b")

y = 0;
k = 2;
x = 19;
if(k<5)
    while(x<20)
        x = 30 - k.^2;
        y = x + 2;
    endwhile
else
    y = 6;
endif
y

s = sum(6:30) % Güzel cevap

s = 0;
for x = 6:30
    s = s + x;
endfor
s % Normal cevap

s = 6+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+...
26+27+28+29+30 % Korkunç cevap (!!!)

fibonacci = [0 1];
i = 3;
for i=3:100
    fibonacci(i) = fibonacci(i-2) + fibonacci(i-1);
endfor
fibonacci(1:10) % ilk 10 terim
fibonacci(98:100) % son 3 terim
