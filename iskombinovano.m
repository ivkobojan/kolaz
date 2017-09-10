%% Formiranje kolaza raznih slika
% Mesanje slika
%
% Napomena: slike treba da budu istih dimenzija!!!

%% Inicijalizacija

close all
clear all
clc

%% Dimenzije slike

vrste = 512;
kolone = 640;

%% Ucitavanje slika

% ucitavanje slike na koju dodajemo druge
% glavna = imread('glavna.jpg');
glavna = imread('nebo.jpg');
figure
imshow(glavna)
title('Slika na koju lepimo ostale')

% uzimanje dimenzija iz slike ako ih ne znamo (odkomentarisati)
% [vrste, kolone] = size(glavna);

% ucitavanje sablona kreiranih pomocu izdvajanje.m
sablon1 = imread('odabran1.jpg');
% pretvaranje u cisto binarnu sliku, za svaki slucaj
sablon1 = im2bw(sablon1, 0.5);
figure
imshow(sablon1)
title('Prvi sablon')

sablon2 = imread('odabrano.jpg');
% pretvaranje u cisto binarnu sliku, za svaki slucaj
sablon2 = im2bw(sablon2, 0.5);
figure
imshow(sablon2)
title('Drugi sablon')

% ucitavanje slika cije delove zelimo da nalepimo
slika1 = imread('more.jpg');
figure
imshow(slika1)
title('Prva slika iz koje uzimamo deo prema sablonu 1')

slika2 = imread('more.jpg');
figure
imshow(slika2)
title('Druga slika iz koje uzimamo deo prema sablonu 2')

%% Kombinovanje

for i = 1 : vrste
    for j = 1 : kolone
        if (sablon1(i,j) > 0)
            glavna(i,j) = slika1(i,j);
        end
        if(sablon2(i,j)> 0)
            glavna(i,j) = slika2(i,j);
        end
    end
end

figure
imshow(glavna)
title('Kolaz')

%% Pamcenje
imwrite(glavna,'Kolaz.jpg');