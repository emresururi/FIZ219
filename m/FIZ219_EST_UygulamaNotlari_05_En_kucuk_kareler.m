veriler = [1 4.9142    
2 7.1201    
3 8.8456   
4 10.8113   
5 13.2231] % ilk sütun x, ikinci sütun y değerleri

% Grafiğini çizdirirsek:
plot(veriler(:,1),veriler(:,2),"bo")

veriler = [1 4.9142    
2 7.1201    
3 8.8456   
4 10.8113   
5 13.2231] % ilk sütun x, ikinci sütun y değerleri
x = veriler(:,1) % Tüm satırlar (":"), 1. sütun
y = veriler(:,2) % Tüm satırlar (":"), 2. sütun

veriler = [1 4.9142    
2 7.1201    
3 8.8456   
4 10.8113   
5 13.2231] % ilk sütun x, ikinci sütun y değerleri
x = veriler(:,1); % Tüm satırlar (":"), 1. sütun
y = veriler(:,2); % Tüm satırlar (":"), 2. sütun
A11 = A12 = A22 = B11 = B12 = 0; % Hesaplanacak değerler
n = rows(x); % Kaç adet verimiz olduğu
for i = 1:n
    A11 = A11 + 2*x(i)^2;
    A12 = A12 + 2*x(i);
    A22 = A22 + 2;
    B11 = B11 + 2*x(i)*y(i);
    B12 = B12 + 2*y(i);
endfor

% Toplamlar hesaplandı bile! 8)
m = (B11 - (A12 * B12 / A22))  / (A11 - (A12^2 / A22))
n = (B12 - A12 * m) / A22 

% Artık verilerimize en yakın geçen 
% doğrunun denklemi elimizde olduğuna göre
% hem doğruyu, hem de deney verilerini birlikte
% çizdirelim

xx = linspace(0,6,100);
tt = m.*xx + n;
plot(xx,tt,x,y,"ro")
