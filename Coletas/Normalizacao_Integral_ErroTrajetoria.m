%% Calculo do erro por tentativa

close all;
clear all;
clc;

%% Trás os arquivos

% Vinicius - Eber
% Ruben - Pedro
% Ronaldo - Eric
load('Coleta_Eric.mat');
load('Coleta_Eber.mat');
load('Coleta_Tulio.mat');
load('Coleta_Eduardo.mat');
load('Coleta_Ruben.mat');
load('Coleta_Ronaldo.mat');
load('Coleta_Thatiane.mat');
load('Coleta_Amanda.mat');
load('Coleta_Vinicius.mat');
load('Coleta_Pedro.mat');

%% Gera erro de trajetória normalizado
TrajetoriaN_Eric = ErroTrajetoriaN(Coleta_Eric, 'Coleta Voluntário ',1);
TrajetoriaN_Amanda = ErroTrajetoriaN(Coleta_Amanda, 'Coleta Voluntário ',2);
TrajetoriaN_Eber = ErroTrajetoriaN(Coleta_Eber, 'Coleta Voluntário ',3);
TrajetoriaN_Tulio = ErroTrajetoriaN(Coleta_Tulio, 'Coleta Voluntário ',4);
TrajetoriaN_Ruben = ErroTrajetoriaN(Coleta_Ruben, 'Coleta Voluntário ',5);

TrajetoriaN_Ronaldo = ErroTrajetoriaN(Coleta_Ronaldo, 'Coleta Controle ',6);
TrajetoriaN_Thatiane = ErroTrajetoriaN(Coleta_Thatiane, 'Coleta Controle ',7);
TrajetoriaN_Eduardo = ErroTrajetoriaN(Coleta_Eduardo, 'Coleta Controle ',8);
TrajetoriaN_Vinicius = ErroTrajetoriaN(Coleta_Vinicius, 'Coleta Controle ',9);
TrajetoriaN_Pedro = ErroTrajetoriaN(Coleta_Pedro, 'Coleta Controle ',10);

%% Trajetoria normalizada individual
GraficoNormalizado(TrajetoriaN_Eric, [0.6350 0.0780 0.1840], '-o'); % vermelho escuro
GraficoNormalizado(TrajetoriaN_Amanda, [0.8500 0.3250 0.0980], '-o'); % laranja
GraficoNormalizado(TrajetoriaN_Eber, [0.4940 0.1840 0.5560], '-o'); % roxo
GraficoNormalizado(TrajetoriaN_Tulio, [0.9290 0.6940 0.1250], '-o'); % amarelo
GraficoNormalizado(TrajetoriaN_Ruben, [1 0 1], '-o'); % magenta
GraficoNormalizado(TrajetoriaN_Ronaldo, [0 0.4470 0.7410], '-gs'); %Azul escuro
GraficoNormalizado(TrajetoriaN_Thatiane, [0.3010 0.7450 0.9330], '-gs'); % azul claro
GraficoNormalizado(TrajetoriaN_Eduardo, [0.5 0.5 0.5], '-gs'); % Cinza
GraficoNormalizado(TrajetoriaN_Vinicius, [0.4660 0.6740 0.1880], '-gs'); %Verde
GraficoNormalizado(TrajetoriaN_Pedro, [0 0 0], '-gs'); % Preto

%% Gráfico de cada grupo do erro normalizado
MediaC_erroMAximoN = [];
MediaE_erroMAximoN = [];
for i = 1:637
    mediaC = (TrajetoriaN_Ronaldo(i,1) + TrajetoriaN_Thatiane(i,1) + TrajetoriaN_Vinicius(i,1) + TrajetoriaN_Eduardo(i,1) + TrajetoriaN_Pedro(i,1))/ 5;
    MediaC_erroMAximoN = [MediaC_erroMAximoN; mediaC i];
    
    mediaE = (TrajetoriaN_Eric(i,1) + TrajetoriaN_Tulio(i,1) + TrajetoriaN_Eber(i,1) + TrajetoriaN_Amanda(i,1) + TrajetoriaN_Ruben(i,1))/ 5;
    MediaE_erroMAximoN = [MediaE_erroMAximoN; mediaE i];
end
figure(11);
hold on;
plot1 = plot(MediaC_erroMAximoN(:,2), MediaC_erroMAximoN(:,1), 'Color', [0 0 1]);
 plot1.Color(4) = 0.2;
% suptitle('Grupo Controle');
xlabel('Trials');
ylabel('Aerror');
% xlim([0 650]); % VOLTAR
% ylim([0 15]); % VOLTAR
% figure(12);
plot2 = plot(MediaE_erroMAximoN(:,2), MediaE_erroMAximoN(:,1), 'Color', [1 0 0]);
plot2.Color(4) = 0.2;
% suptitle('Grupo Experimental');
xlabel('Trials');
ylabel('Aerror');
xlim([0 650]); % VOLTAR
ylim([0 15]); % VOLTAR

%% Gráfico das médias de cada grupo por bloco
mBlocoC = [];
mBlocoE = [];
mediaBlocoC = 0;
mediaBlocoE = 0;
for k=1:637 % 13 bloco
    mediaBlocoC = mediaBlocoC + MediaC_erroMAximoN(k,1);
    mediaBlocoE = mediaBlocoE + MediaE_erroMAximoN(k,1);
    if  mod(k,49) == 0
        mBlocoC = [mBlocoC; mediaBlocoC/49 k-25];
        mBlocoE = [mBlocoE; mediaBlocoE/49 k-25];
        mediaBlocoC = 0;
        mediaBlocoE = 0;
    end
    
    
    
end
% figure(13);
    hold on;
    % Fase 1
    plot(mBlocoC(1:2,2), mBlocoC(1:2,1), '-o', 'Color', 'b');
    plot(mBlocoE(1:2,2), mBlocoE(1:2,1), '-o', 'Color', 'r');
    % Fase 2
    plot(mBlocoC(3:5,2), mBlocoC(3:5,1), '-o', 'Color', 'b');
    plot(mBlocoE(3:5,2), mBlocoE(3:5,1), '-o', 'Color', 'r');
    % Fase 3
    plot(mBlocoC(6:8,2), mBlocoC(6:8,1), '-o', 'Color', 'b');
    plot(mBlocoE(6:8,2), mBlocoE(6:8,1), '-o', 'Color', 'r');
    % Fase 4
    plot(mBlocoC(9:11,2), mBlocoC(9:11,1), '-o', 'Color', 'b');
    plot(mBlocoE(9:11,2), mBlocoE(9:11,1), '-o', 'Color', 'r');
    % Fase 5
    plot(mBlocoC(12:13,2), mBlocoC(12:13,1), '-o', 'Color', 'b');
    plot1 = plot(mBlocoE(12:13,2), mBlocoE(12:13,1), '-o', 'Color', 'r');
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);
    
    end
%      set(get(get(plot1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
%      set(get(get(plot1(2),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
%       set(get(get(plot(2:end),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
   legend('No trajectory','With trajectory');    
xlabel('Trials');
ylabel('Aerror');
xlim([0 650]); % VOLTAR
ylim([0 15]); % VOLTAR
%% Função de normalização do erro
function [retorno, ErroTrajetoriaN] = ErroTrajetoriaN(Coleta, titulo, f) % (Coleta.mat, título do plot, numero da figura)
%% Calculo o máximo erro por alcance
erroMaximo = 0;
ColetaOffSet = {};
for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        dados = Coleta(k,j);
        x = dados(:,1);
        erro_tentativa = [];
        for i=1:length(x{1,1})
            erroX = abs(x{1,1}(i,1) - 160);
            erro_tentativa = [erro_tentativa; erroX x{1,1}(i,2) i];
            
        end
        ColetaOffSet{k,j} = erro_tentativa;
        temp = max(erro_tentativa(:,1));
        if(temp > erroMaximo)
            erroMaximo = temp;
        end
    end
end
%% Achando constante normalizadora
constN = 0;
for j=2:50 % 50 alcances
    constN = constN + max(ColetaOffSet{2,j}(:,1));
end
erroMaximo = constN/49;

%% Normalizando
NormalizadaErroMaximo = ColetaOffSet;
for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        dados = ColetaOffSet(k,j);
        x = dados(:,1);
        NormalizadaErroMaximo{k,j} = x{1,1}(:,1)/erroMaximo;
    end
end
%% Plot erro normalizado
cont = 0;
a = 49;
NormErroMaximo = [];

for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        cont = cont + 1;
        maxNorm = max(NormalizadaErroMaximo{k,j}(:,1));
        NormErroMaximo = [NormErroMaximo; maxNorm cont];
    end
    %plot(repmat(a*k,1),1:0.1,'k-.');
end

% figure(1);%f);
% hold on;
% plot(NormErroMaximo(:,2), NormErroMaximo(:,1));
% newtitulo = strcat(titulo, int2str(f));
% suptitle(newtitulo);
% xlabel('Tentaivas');
% ylabel('Erro máximo Normalizado');
% xlim([0 650]); % VOLTAR
% ylim([0 20]); % VOLTAR

%% Return
retorno = NormErroMaximo;

end %fim da função

function GraficoNormalizado = GraficoNormalizado(TrajetoriaNormalizada, cor, grupo)
Bloco = [];
mediaBloco = 0;
for k=1:637 % 13 bloco
    mediaBloco = mediaBloco + TrajetoriaNormalizada(k,1);
    if  mod(k,49) == 0
        Bloco = [Bloco; mediaBloco/49 k-25];
        mediaBloco = 0;
    end
end
 figure(13);
    hold on;
    % Fase 1
    plot(Bloco(1:2,2), Bloco(1:2,1), grupo, 'Color', cor);
    % Fase 2
    plot(Bloco(3:5,2), Bloco(3:5,1), grupo, 'Color', cor);
    % Fase 3
    plot(Bloco(6:8,2), Bloco(6:8,1), grupo, 'Color', cor);
    % Fase 4
    plot(Bloco(9:11,2), Bloco(9:11,1), grupo, 'Color', cor);
    % Fase 5
    plot(Bloco(12:13,2), Bloco(12:13,1), grupo, 'Color', cor);
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);
    
    end
    xlabel('Tentaivas');
    ylabel('Média do Erro máximo Normalizado');
    xlim([0 650]); % VOLTAR
    ylim([0 15]); % VOLTAR
end
