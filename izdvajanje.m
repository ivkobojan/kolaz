%% Formiranje kolaza raznih slika

%% Inicijalizacija

close all
clear all
clc

%% Dimenzije slike
% izmeniti u odgovarajucu velicinu
vrste = 512;
kolone = 640;

%% Formiranje pozadine
% Formira se pozadina od slucajnog suma. Umesto ovako formirane pozadine,
% moguce je ucitati sliku od interesa i na njoj vrsiti izdvajanje
pozadina = zeros(vrste, kolone);

for vr = 1:vrste
    for ko = 1:kolone
        trenutni = rand(1);
        if(trenutni < 0.5)
            pozadina(vr,ko) = 0.5;
        else if(trenutni < 0.7)
                pozadina(vr,ko) = trenutni;
            else
                pozadina(vr,ko) = 0.7;
            end
        end
    end
end

%% Ucitavanje slike
% slika = imread('ime.jpg');

%% Prikaz generisane pozadine ili ucitane slike
figure
imshow(pozadina)
title('Generisana pozadina, odaberite region od interesa')

% Kod za izdvajanje regiona od interesa. Treba da postoji prikazana slika
% na ekranu, bilo generisana bilo ucitana. Kliktanjem na odgovarajuca mesta
% na slici se pravi izlomljena linija. Linija mora da se zatvori tako sto
% se poslednji klik izvrsi na pocetnu tacku. Pojavice se krug kada se
% kursor dovede iznad pocetne tacke. Posle klika moguce je pomerati ceo
% region radi boljeg pozicioniranja. Dvoklik na region zavrsava operaciju
% odabira zeljenog regiona
region = roipoly;

% Pretvaranje u cisto binarnu sliku
region = im2bw(region, 0.5);

% Kada se zavrsi izbor zeljenog regiona, prikazuje crno bela slika.
% Izabrani deo je prikazan belom bojom.
figure
imshow(region)

%% Pamcenje slike
% Izabranu sliku zapamtimo radi daljeg koriscenja
imwrite(region,'odabrano.jpg');

% pamcenje pozadine
imwrite(pozadina,'pozadina.jpg');