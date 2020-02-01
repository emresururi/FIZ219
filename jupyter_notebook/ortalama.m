function [a,g] = ortalama(x)
% [a,g] = ortalama(x) fonksiyonu
%
% verilen x dizisinin elemanlarının
% aritmetik ve geometrik ortalamalarını
% hesaplar.
%
% ilk dönüş değeri olarak aritmetik ortalamayı,
% ikinci dönüş değeri olarak da geometrik ortalamayı
% döndürür.
%
% ayrıca bkz. mean(x,"a"), mean(x,"g")
eleman_sayisi = length(x);
toplam = sum(x);
carpim = prod(x);
a = toplam / eleman_sayisi;
g = carpim^(1/eleman_sayisi); % benzer şekilde nthroot(carpim,N) 
                              % de kullanilabilir..
endfunction
