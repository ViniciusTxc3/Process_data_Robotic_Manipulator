%% Calculo da força compensatória

% close all;
clear all;
clc;
%% Trás os arquivos
load('Coleta_Amanda.mat');
ForcaColeta(Coleta_Amanda, ' - Coleta Voluntário',6);
% load('Coleta_Eber.mat');
% ForcaColeta(Coleta_Eber, ' - Coleta Voluntário',5);
% load('Coleta_Eduardo.mat');
% ForcaColeta(Coleta_Eduardo, ' - Coleta Controle',7);
% load('Coleta_Eric.mat');
% ForcaColeta(Coleta_Eric, ' - Coleta Voluntário',1);
% load('Coleta_Pedro.mat');
% ForcaColeta(Coleta_Pedro, ' - Coleta Controle',10);
% load('Coleta_Ronaldo.mat');
% ForcaColeta(Coleta_Ronaldo, ' - Coleta Controle',2);
% load('Coleta_Ruben.mat');
% ForcaColeta(Coleta_Ruben, ' - Coleta Voluntário',9);
load('Coleta_Thatiane.mat');
ForcaColeta(Coleta_Thatiane, ' - Coleta Controle',5);
% load('Coleta_Tulio.mat');
% ForcaColeta(Coleta_Tulio, ' - Coleta Voluntário',6);
% load('Coleta_Vinicius.mat');
% ForcaColeta(Coleta_Vinicius, ' - Coleta Controle',8);

function ForcaColeta = ForcaColeta(Coleta, titulo, f) % (Coleta.mat, título do plot, numero da figura)
cont = 0;
%% Calculo Força máxima por alcance
a = 49;
MAxForca_tentativa = [];
for k=1:13 % 13 bloco
    
    for j=2:50 % 50 alcances
        dados = Coleta(k,j);
        x = dados(:,1);
        %y = dados(:,2);
        Forca_tentativa = [];
        for i=1:length(x{1,1})
%             ForcaR = abs(abs(x{1,1}(i,3) - 2048) + abs(x{1,1}(i,4) - 2018) - 1500);
            ForcaR = abs(x{1,1}(i,3) - 2048) + abs(x{1,1}(i,4) - 2018);
            Forca_tentativa = [Forca_tentativa; ForcaR i];      
        end
        MAxForca_tentativa = [MAxForca_tentativa; max(Forca_tentativa(:,1)) cont];
        cont = cont + 1;
    end
    hold on;
     figure(f) %VOLTAR
    plot(MAxForca_tentativa(:,2),MAxForca_tentativa(:,1));
    xlim([0 650]); %VOLTAR
    ylim([-1 inf]); %VOLTAR
    subplot(1,3,1);
    plot(repmat(a*k,2300),1:2300,'k-.'); %VOLTAR
end
newtitulo = strcat('Força Máxima de cada alcance',titulo); %VOLTAR
suptitle(newtitulo); %VOLTAR
subplot(1,3,2);
hold on;
grid on;
MediaErroAd1 = round(median(MAxForca_tentativa(2*49:3*49)));
stdAd1 = std(MAxForca_tentativa(2*49:3*49));
bar(3,MediaErroAd1,'c')
errorbar(3,MediaErroAd1,stdAd1,'k')
MediaErroAd2 = round(median(MAxForca_tentativa(3*49:4*49)));
stdAd2 = std(MAxForca_tentativa(3*49:4*49));
bar(4,MediaErroAd2,'c')
errorbar(4,MediaErroAd2,stdAd2,'k')
MediaErroAd3 = round(median(MAxForca_tentativa(4*49:5*49)));
stdAd3 = std(MAxForca_tentativa(4*49:5*49));
bar(5,MediaErroAd3,'c')
errorbar(5,MediaErroAd3,stdAd3,'k')

MediaErroAd1 = round(median(MAxForca_tentativa(5*49:6*49)));
stdAd1 = std(MAxForca_tentativa(5*49:6*49));
bar(6,MediaErroAd1,'m');
errorbar(6,MediaErroAd1,stdAd1,'k');
MediaErroAd2 = round(median(MAxForca_tentativa(6*49:7*49)));
stdAd2 = std(MAxForca_tentativa(6*49:7*49));
bar(7,MediaErroAd2,'m');
errorbar(7,MediaErroAd2,stdAd2,'k');
MediaErroAd3 = round(median(MAxForca_tentativa(7*49:8*49)));
stdAd3 = std(MAxForca_tentativa(7*49:8*49));
bar(8,MediaErroAd3,'m');
errorbar(8,MediaErroAd3,stdAd3,'k');
%xlim([0 4]); %VOLTAR
%ylim([0 120]); %VOLTAR

MediaErroAd1 = round(median(MAxForca_tentativa(11*49:12*49)));
stdAd1 = std(MAxForca_tentativa(11*49:12*49));
bar(12,MediaErroAd1,'r');
errorbar(12,MediaErroAd1,stdAd1,'k');
MediaErroAd2 = round(median(MAxForca_tentativa(12*49:13*49)));
stdAd2 = std(MAxForca_tentativa(12*49:13*49));
bar(13,MediaErroAd2,'r');
errorbar(13,MediaErroAd2,stdAd2,'k');
%xlim([0 15]); %VOLTAR
%ylim([0 165]); %VOLTAR

subplot(1,3,3);
hold on;
grid on;
MediaErroAd1 = round(mean(MAxForca_tentativa(2*49:3*49)));
stdAd1 = std(MAxForca_tentativa(2*49:3*49));
bar(3,MediaErroAd1,'c')
errorbar(3,MediaErroAd1,stdAd1,'k')
MediaErroAd2 = round(mean(MAxForca_tentativa(3*49:4*49)));
stdAd2 = std(MAxForca_tentativa(3*49:4*49));
bar(4,MediaErroAd2,'c')
errorbar(4,MediaErroAd2,stdAd2,'k')
MediaErroAd3 = round(mean(MAxForca_tentativa(4*49:5*49)));
stdAd3 = std(MAxForca_tentativa(4*49:5*49));
bar(5,MediaErroAd3,'c')
errorbar(5,MediaErroAd3,stdAd3,'k')

MediaErroAd1 = round(mean(MAxForca_tentativa(5*49:6*49)));
stdAd1 = std(MAxForca_tentativa(5*49:6*49));
bar(6,MediaErroAd1,'m');
errorbar(6,MediaErroAd1,stdAd1,'k');
MediaErroAd2 = round(mean(MAxForca_tentativa(6*49:7*49)));
stdAd2 = std(MAxForca_tentativa(6*49:7*49));
bar(7,MediaErroAd2,'m');
errorbar(7,MediaErroAd2,stdAd2,'k');
MediaErroAd3 = round(mean(MAxForca_tentativa(7*49:8*49)));
stdAd3 = std(MAxForca_tentativa(7*49:8*49));
bar(8,MediaErroAd3,'m');
errorbar(8,MediaErroAd3,stdAd3,'k');
%xlim([0 4]); %VOLTAR
%ylim([0 120]); %VOLTAR

MediaErroAd1 = round(mean(MAxForca_tentativa(11*49:12*49)));
stdAd1 = std(MAxForca_tentativa(11*49:12*49));
bar(12,MediaErroAd1,'r');
errorbar(12,MediaErroAd1,stdAd1,'k');
MediaErroAd2 = round(mean(MAxForca_tentativa(12*49:13*49)));
stdAd2 = std(MAxForca_tentativa(12*49:13*49));
bar(13,MediaErroAd2,'r');
errorbar(13,MediaErroAd2,stdAd2,'k');
%xlim([0 15]); %VOLTAR
%ylim([0 165]); %VOLTAR
end %VOLTAR

