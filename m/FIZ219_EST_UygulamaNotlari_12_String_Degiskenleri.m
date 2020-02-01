for i = 3:8
    printf("Elimizdeki sayi: %d --> Bu sayi ",i)
    if(mod(i,2)==0)
        printf("cift bir sayidir.\n");
    else
        printf("tek bir sayidir.\n");
    endif
endfor
    

isim = "Batuhan"

isim(2) % 2. eleman (harf)
isim(4:6) % 4.,5.,6. harfler 
isim(5:end-1) % 5. harften sondan bir önceki harfe kadar
isim(1:2:7) % 1. harften 7. harfe bir atlayarak (2 ekleyerek)
isim(3:-1:1) % 3. harften 1. harfe geriye doğru

str1 = "ABCabc";
printf("%d\n",str1);

dizi = [70, 105, 122, 50, 49, 57];
str2 = char(dizi)

str3 = ["F", "i", "z", "2", "1", "9"]

str4 = "Fiz219"

% "a", "b"den büyük mü (yani sonra mı geliyor)?
"a" > "b" 

% "a", "b"den küçük mü (yani önce mi geliyor)?
"a" < "b"

% "a", "b"ye eşit mi (yani ASCII tablosunda aynı yerde mi)?
"a" == "b"

str5 = "a"
str6 = "b"
str5 > str6
str5 < str6
str5 == str6

str7 = "Bilgisayar "
str8 = "Programlama"
str7 > str8

str7(str7>str8)

str7 == str8

% str7 değişkeninde tutulan kelime, str8'dekiyle aynı mı?
strcmp(str7,str8)

dizi = [70, 105, 122, 50, 49, 57];
str2 = char(dizi)

str3 = ["F", "i", "z", "2", "1", "9"]
str4 = "Fiz219"


strcmp(str2, str3)
strcmp(str3, str4)

str4 = "Fiz219"
str9 = "FIZ219"
str10 = "FIz219"

strcmp(str4,str9)
strcmp(str4,str10)

strcmpi(str4,str9)
strcmpi(str4,str10)

str1 = "Merhaba"
str2 = "Dünya!"

sayi1 = [1 2 3]
sayi2 = [5 6 7]
sayi3 = [sayi1 sayi2]

str1 = "Merhaba"
str2 = "Dünya!"
str3 = [str1 str2]

str3 = [str1 " " str2]

str4 = strcat(str1,str2)

% sondaki bosluklar, sekmeler, vs. strcat tarafindan yoksayilir:
str5 = strcat("Merhaba ","Dunya")

% bastaki bosluklar, sekmeler, vs. strcat tarafindan ele alinir:
str6 = strcat("Merhaba"," Dunya")

strcat("Merhaba ","Dunya")
cstrcat("Merhaba ","Dunya")
disp("-----------------")
strcat("Merhaba"," ","Dunya")
cstrcat("Merhaba"," ","Dunya")

printf("Dersimizin adi: %s.\n","FIZ219 - Bilgisayar Programlama");

for i = 3:8
    if(mod(i,2)==0)
        tekcift = "cift";
    else
        tekcift = "tek";
    endif
    printf("Elimizdeki sayi: %d --> Bu sayi %s bir sayidir.\n",i,tekcift)
endfor

str = "Deneme";
printf("Denemeye 10 karakter ayarlayalim:%10s.\n",str) % Saga yaslanmis
printf("Denemeye 10 karakter ayarlayalim:%-10s.\n",str)% Sola yaslanmis

function f = topla(a,b)
a+b
endfunction

topla(3,5)
toplam = topla(3,5)
toplam = topla(3,5)

function f = topla(a,b)
f = a+b
endfunction

toplam = topla(3,5)


str1 = "Merhaba"
str2 = "Dunya!"
% Merhaba Dunya!
% 12345678901234  : Bastan sona toplam 14 karakter
donus_degeri = printf("%s %s",str1,str2)

str1 = "Merhaba"
str2 = "Dunya!"
donus_degeri = sprintf("%s %s",str1,str2)
donus_degeri

printf("%s %s %s\n",donus_degeri,donus_degeri,donus_degeri)

function f = merhaba(isim)
f = sprintf("Merhaba %s!\n",isim);
endfunction

md = merhaba("Dunya")
me = merhaba("Emre")

