clear;
t = linspace(0,5,11);
y = [0.000, -1.312, -4.957, -11.834, -16.382, -26.723,...
-43.170, -48.251, -64.409, -80.289, -112.224];
disp([t',y'])

g = 9.81; # m/s^2

yp = -0.5*g*t.^2;

y_m_yp = y - yp;
y_m_yp2 = y_m_yp.^2;
y_m_yp2_s = sum(y_m_yp2);
er = sqrt(y_m_yp2_s)

pay = sum(y.*(t.^2));
payda = sum(t.^4);

a = -2 * pay / payda  # m/s^2

yp = -0.5*a*t.^2;
plot(t,y,"*r",t,yp,"-b");

yp = -0.5*a*t.^2;

y_m_yp = y - yp;
y_m_yp2 = y_m_yp.^2;
y_m_yp2_s = sum(y_m_yp2);
er = sqrt(y_m_yp2_s)

for i = 2:6
    i
endfor

2:6

kume = 2:6

for i = kume
    i
endfor

for i = [5,1,6,2,-3,-1,4]
    i
endfor

clear;

dizi = {"f","e","d","a","i"};
depo = {}; # sonuclari toplayacagimiz dizi


kullanilabilen_indisler = 1:5;

for bir = 1:5
    # birinci indisi sectik, bunu olabilenler listesinden cikaralim
    kalan_indisler = kullanilabilen_indisler(kullanilabilen_indisler != bir);
    for iki = kalan_indisler
        kalan_indisler3 = kalan_indisler(kalan_indisler != iki);
        for uc = kalan_indisler3
            kalan_indisler4 = kalan_indisler3(kalan_indisler3 != uc);
            for dort = kalan_indisler4
                kalan_indisler5 = kalan_indisler4(kalan_indisler4 != dort);
                 bes = kalan_indisler5;
                    kelime = sprintf("%s%s%s%s%s",dizi{bir},dizi{iki}...
                             ,dizi{uc},dizi{dort},dizi{bes});
                    disp(kelime)
                    depo = {depo{:}, kelime};
            endfor
        endfor
    endfor
endfor

columns(depo)

perms(["f","e","d","a","i"])

rand('state',219); # Sizin denemenizin de
                   # ayni sonuclari vermesi icin

harfler = {"a","b","c"};
# Toplamda 3x2x1 = 6 farklı permutasyon var

depo = {}

for i = 1:10
    kelime = strcat(harfler{randperm(3)}); # nasil urettigimize cok takilmayin 8)
    depo = {depo{:} kelime};
endfor
depo

unique(depo)

function v = inelastik_momentum(v1,v2,m1,m2)
    v1x = v1(1);
    v1y = v1(2);
    v2x = v2(1);
    v2y = v2(2);
    vx = (m1*v1x + m2*v2x)/(m1+m2);
    vy = (m1*v1y + m2*v2y)/(m1+m2);
    v = [vx,vy];
endfunction

V = inelastik_momentum ([1,2],[-1,-2],3,5)
