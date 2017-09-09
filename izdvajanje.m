%% Formiranje kolaza raznih slika

%% Inicijalizacija

close all
clear all
clc

%% Dimenzije slike

vrste = 512;
kolone = 640;

%% Formiranje pozadine

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

figure, imshow(pozadina)

% Kod za izdvajanje regiona od interesa. Treba da postoji prikazana slika
% na ekranu.
region = roipoly;
figure, imshow(region)

