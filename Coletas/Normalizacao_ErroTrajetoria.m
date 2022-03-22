%% Calculo do erro por tentativa

close all;
clear all;
clc;
set(0,'defaultfigurecolor','w');
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
GraficoNormalizado(TrajetoriaN_Eric, [0 0.4470 0.7410], 'b-s',9); %Azul escuro 
GraficoNormalizado(TrajetoriaN_Amanda, [0.8500 0.3250 0.0980], 'r-o',7); % laranja
GraficoNormalizado(TrajetoriaN_Eber, [0.4940 0.1840 0.5560], 'b-s',9); % roxo
% GraficoNormalizado(TrajetoriaN_Tulio, [0 0 0], '-o'); % Preto
% GraficoNormalizado(TrajetoriaN_Ruben, [0.5 0.5 0.5], '-gs'); %Cinza
GraficoNormalizado(TrajetoriaN_Ronaldo, [0.6350 0.0780 0.1840], 'r-o',7); % vermelho escuro
GraficoNormalizado(TrajetoriaN_Thatiane, [0.3010 0.7450 0.9330], 'b-s',9); % azul claro
GraficoNormalizado(TrajetoriaN_Vinicius, [1 0 1], 'r-o',7);  % magenta
GraficoNormalizado(TrajetoriaN_Pedro, [0.9290 0.6940 0.1250], 'r-o',7); % Amarelo
GraficoNormalizado(TrajetoriaN_Eduardo, [0.4660 0.6740 0.1880], 'b-s',9); % verde


%% Gráfico de cada grupo do erro normalizado
MediaC_erroMAximoN = [];
MediaE_erroMAximoN = [];
for i = 1:637
    
    mediaC = (TrajetoriaN_Thatiane(i,1) + TrajetoriaN_Eric(i,1) + TrajetoriaN_Eduardo(i,1) + TrajetoriaN_Eber(i,1))/4;%+ TrajetoriaN_Ronaldo(i,1))/ 5;
    mediaCR = (TrajetoriaN_Thatiane(i,4) + TrajetoriaN_Eric(i,4) + TrajetoriaN_Eduardo(i,4) + TrajetoriaN_Eber(i,4))/4;% + TrajetoriaN_Ronaldo(i,4))/ 5;
    mediaCL = (TrajetoriaN_Thatiane(i,5) + TrajetoriaN_Eric(i,5) + TrajetoriaN_Eduardo(i,5) + TrajetoriaN_Eber(i,5))/4;%+ TrajetoriaN_Ronaldo(i,4))/ 5;

    MediaC_erroMAximoN = [MediaC_erroMAximoN; mediaC i mediaCR mediaCL];
    
    mediaE = (TrajetoriaN_Vinicius(i,1) + TrajetoriaN_Ronaldo(i,1) + TrajetoriaN_Pedro(i,1) + TrajetoriaN_Amanda(i,1) + TrajetoriaN_Tulio(i,1))/ 5;
    mediaER = (TrajetoriaN_Vinicius(i,4) + TrajetoriaN_Ronaldo(i,4) + TrajetoriaN_Pedro(i,4) + TrajetoriaN_Amanda(i,4) + TrajetoriaN_Tulio(i,4))/ 5;
    mediaEL = (TrajetoriaN_Vinicius(i,5) + TrajetoriaN_Ronaldo(i,5) + TrajetoriaN_Pedro(i,5) + TrajetoriaN_Amanda(i,5) + TrajetoriaN_Tulio(i,5))/ 5;

    MediaE_erroMAximoN = [MediaE_erroMAximoN; mediaE i mediaER mediaEL];
end
figure(21);

hold on;
plot1 = plot(MediaC_erroMAximoN(:,2), MediaC_erroMAximoN(:,1), 'Color', [0 0 1]);
 plot1.Color(4) = 0.2;
% suptitle('Grupo Controle');
xlabel('Trials');
ylabel('Aerror');
% legend('With Control Points');
% xlim([0 650]); % VOLTAR
% ylim([0 15]); % VOLTAR
% figure(12);
plot2 = plot(MediaE_erroMAximoN(:,2), MediaE_erroMAximoN(:,1), 'Color', [1 0 0]);
plot2.Color(4) = 0.2;
%  suptitle('Média Geral');
xlabel('Trials');
ylabel('Aerror');
%  set(get(get(plot1(2:end),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
%  set(get(get(plot2(2:end),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
% legend('MCR SOL','MCR SOL ESS')
% legend('No trajectory','With trajectory');
xlim([0 650]); % VOLTAR
ylim([0 4.5]); % VOLTAR
% 
% figure(22);
% hold on;
% plot1 = plot(MediaC_erroMAximoN(:,3), MediaC_erroMAximoN(:,1), 'Color', [0 0 1]);
%  plot1.Color(4) = 0.2;
% % suptitle('Grupo Controle');
% xlabel('Tentaivas');
% ylabel('Média do Erro máximo Normalizado');
% % xlim([0 650]); % VOLTAR
% % ylim([0 15]); % VOLTAR
% % figure(12);
% plot2 = plot(MediaE_erroMAximoN(:,3), MediaE_erroMAximoN(:,1), 'Color', [1 0 0]);
% plot2.Color(4) = 0.2;
%  suptitle('Direita Geral');
% xlabel('Tentaivas');
% ylabel('Média do Erro máximo Normalizado');
% xlim([0 650]); % VOLTAR
% ylim([0 4.5]); % VOLTAR
% 
% figure(23);
% hold on;
% plot1 = plot(MediaC_erroMAximoN(:,4), MediaC_erroMAximoN(:,1), 'Color', [0 0 1]);
%  plot1.Color(4) = 0.2;
% % suptitle('Grupo Controle');
% xlabel('Tentaivas');
% ylabel('Média do Erro máximo Normalizado');
% % xlim([0 650]); % VOLTAR
% % ylim([0 15]); % VOLTAR
% % figure(12);
% plot2 = plot(MediaE_erroMAximoN(:,4), MediaE_erroMAximoN(:,1), 'Color', [1 0 0]);
% plot2.Color(4) = 0.2;
%  suptitle('Esquerda Geral');
% xlabel('Tentaivas');
% ylabel('Média do Erro máximo Normalizado');
% xlim([0 650]); % VOLTAR
% ylim([0 4.5]); % VOLTAR

%% Gráfico das médias de cada grupo por bloco
mBlocoC = [];
mBlocoE = [];
mediaBlocoC = 0;
mediaBlocoE = 0;
randomSideA = [1 1 1 0 0 0 1 0 0 1 1 1 1 0 1 0 0 1 0 0 0 0 1 0 1 0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 0 0 1 0 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0 1 0 1 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 0 1 0 1 1 1];
contT = 1;
mediaBlocoRC = 0;
mediaBlocoRE = 0;
mediaBlocoLC = 0;
mediaBlocoLE = 0;
for k=1:637 % 13 bloco
    mediaBlocoC = mediaBlocoC + MediaC_erroMAximoN(k,1);
    mediaBlocoE = mediaBlocoE + MediaE_erroMAximoN(k,1);
    
    %% TEste
    %% Dividindo adaptações por lateralidades
    if((k > 98 && k < 393) || (k > 539)) %bloco 3 a 8
        contT = contT + 1;
        if(randomSideA(contT))
            mediaBlocoRC = mediaBlocoRC + MediaC_erroMAximoN(k,1);
            mediaBlocoRE = mediaBlocoRE + MediaE_erroMAximoN(k,1);
        else
            mediaBlocoLC = mediaBlocoLC + MediaC_erroMAximoN(k,1);
            mediaBlocoLE = mediaBlocoLE + MediaE_erroMAximoN(k,1);
        end
    end
    %fim    
    if  mod(k,49) == 0
        mBlocoC = [mBlocoC; mediaBlocoC/49 k-25 mediaBlocoRC/20 mediaBlocoLC/29];
        mBlocoE = [mBlocoE; mediaBlocoE/49 k-25 mediaBlocoRE/20 mediaBlocoLE/29];
        mediaBlocoC = 0;
        mediaBlocoE = 0;
        mediaBlocoRC = 0;
        mediaBlocoLC = 0;
        mediaBlocoRE = 0;
        mediaBlocoLE = 0;
        contT = 1;
    end
    
    
    
end
%  figure(1);
    hold on;
    % Fase 1
    plot(mBlocoC(1:2,2), mBlocoC(1:2,1), '-gs', 'Color', 'b');
    plot(mBlocoE(1:2,2), mBlocoE(1:2,1), '-o', 'Color', 'r');
    % Fase 2
    plot(mBlocoC(3:5,2), mBlocoC(3:5,1), '-gs', 'Color', 'b');
    plot(mBlocoE(3:5,2), mBlocoE(3:5,1), '-o', 'Color', 'r');
    % Fase 3
    plot(mBlocoC(6:8,2), mBlocoC(6:8,1), '-gs', 'Color', 'b');
    plot(mBlocoE(6:8,2), mBlocoE(6:8,1), '-o', 'Color', 'r');
    % Fase 4
    plot(mBlocoC(9:11,2), mBlocoC(9:11,1), '-gs', 'Color', 'b');
    plot(mBlocoE(9:11,2), mBlocoE(9:11,1), '-o', 'Color', 'r');
    % Fase 5
    plot(mBlocoC(12:13,2), mBlocoC(12:13,1), '-gs', 'Color', 'b');
    plot(mBlocoE(12:13,2), mBlocoE(12:13,1), '-o', 'Color', 'r');
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);
    end
%     suptitle('Média dos Campos');
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
ylim([0 4.5]); % VOLTAR

    
    figure(22);
    hold on;
    % Fase 1
    plot(mBlocoC(1:2,2), mBlocoC(1:2,1), '-gs', 'Color', 'b');
    plot(mBlocoE(1:2,2), mBlocoE(1:2,1), '-o', 'Color', 'r');
    % Fase 2
    plot(mBlocoC(3:5,2), mBlocoC(3:5,3), '-gs', 'Color', 'b');
    plot(mBlocoE(3:5,2), mBlocoE(3:5,3), '-o', 'Color', 'r');
    % Fase 3
    plot(mBlocoC(6:8,2), mBlocoC(6:8,3), '-gs', 'Color', 'b');
    plot(mBlocoE(6:8,2), mBlocoE(6:8,3), '-o', 'Color', 'r');
    % Fase 4
    plot(mBlocoC(9:11,2), mBlocoC(9:11,1), '-gs', 'Color', 'b');
    plot(mBlocoE(9:11,2), mBlocoE(9:11,1), '-o', 'Color', 'r');
    % Fase 5
    plot(mBlocoC(12:13,2), mBlocoC(12:13,3), '-gs', 'Color', 'b');
    plot(mBlocoE(12:13,2), mBlocoE(12:13,3), '-o', 'Color', 'r');
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);
    end
%     suptitle('Campo contra a mão dominante');
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
ylim([0 4.5]); % VOLTAR

    
    figure(23);
    hold on;
    % Fase 1
    plot(mBlocoC(1:2,2), mBlocoC(1:2,1), '-gs', 'Color', 'b');
    plot(mBlocoE(1:2,2), mBlocoE(1:2,1), '-o', 'Color', 'r');
    % Fase 2
    plot(mBlocoC(3:5,2), mBlocoC(3:5,4), '-gs', 'Color', 'b');
    plot(mBlocoE(3:5,2), mBlocoE(3:5,4), '-o', 'Color', 'r');
    % Fase 3
    plot(mBlocoC(6:8,2), mBlocoC(6:8,4), '-gs', 'Color', 'b');
    plot(mBlocoE(6:8,2), mBlocoE(6:8,4), '-o', 'Color', 'r');
    % Fase 4
    plot(mBlocoC(9:11,2), mBlocoC(9:11,1), '-gs', 'Color', 'b');
    plot(mBlocoE(9:11,2), mBlocoE(9:11,1), '-o', 'Color', 'r');
    % Fase 5
    plot(mBlocoC(12:13,2), mBlocoC(12:13,4), '-gs', 'Color', 'b');
    plot(mBlocoE(12:13,2), mBlocoE(12:13,4), '-o', 'Color', 'r');
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);
    end
%     suptitle('Campo a favor da mão dominante');
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
ylim([0 4.5]); % VOLTAR

   
    
    
    
    
    
    
    
%% Função de normalização do erro
function [retorno, ErroTrajetoriaN] = ErroTrajetoriaN(Coleta, titulo, f) % (Coleta.mat, título do plot, numero da figura)
randomSide = [1 1 1 0 0 0 1 0 0 1 1 1 1 0 1 0 0 1 0 0 0 0 1 0 1 0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 0 0 1 0 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0 1 0 1 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 0 1 0 1 1 1];


%% Calculo o máximo erro por alcance
erroMaximo = 0;
ColetaOffSet = {};
RColetaOffSet = {};
LColetaOffSet = {};

for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        dados = Coleta(k,j);
        x = dados(:,1);
        erro_tentativa = [];
        for i=1:length(x{1,1})
            erroX = abs(x{1,1}(i,1) - 160) * 0.07;
            erro_tentativa = [erro_tentativa; erroX x{1,1}(i,2) i];
            
        end
        
%% Separando lados
        tempo = 1:0.005:length(x{1,1});
        tempo = tempo(1:length(x{1,1}));
        
        ColetaOffSet{k,j} = trapz(tempo, erro_tentativa(:,1));
        if(k>2 && k < 9) || (k > 11)          
            if(randomSide(j)) 
                RColetaOffSet{k,j} = [trapz(tempo, erro_tentativa(:,1)) j];
            else 
                LColetaOffSet{k,j} = [trapz(tempo, erro_tentativa(:,1)) j];

            end 
        end 
        % Fim de teste
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
NormalizadaErroMaximoR = RColetaOffSet;
NormalizadaErroMaximoL = LColetaOffSet;
for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        dados = ColetaOffSet(k,j);
        x = dados(:,1);
        NormalizadaErroMaximo{k,j} = x{1,1}(:,1)/erroMaximo;
%% Separando lados
        if(k>2 && k < 9) || (k > 11) 
            if(randomSide(j)) 
%                 dadosr = RColetaOffSet{k,j};
%                 r = dadosr(:,1);
                NormalizadaErroMaximoR{k,j} = [RColetaOffSet{k,j}(:,1)/erroMaximo j];
            else 
%                 dadosl = LColetaOffSet{k,j};
%                 l = dadosl(:,1);
                NormalizadaErroMaximoL{k,j} = [LColetaOffSet{k,j}(:,1)/erroMaximo j];
            end 
        end 
        % Fim de teste
    end
end
%% Plot erro normalizado
cont = 0;
a = 49;
NormErroMaximo = [];
NormErroMaximoR = [];
NormErroMaximoL = [];

for k=1:13 % 13 bloco
    for j=2:50 % 50 alcances
        cont = cont + 1;
        
        
%%         Separando lados
        if(k>2 && k < 9) || (k > 11) 
            if(randomSide(j)) 
                NormErroMaximo = [NormErroMaximo; NormalizadaErroMaximo{k,j}(:,1) cont NormalizadaErroMaximoR{k,j}(:,1) NormalizadaErroMaximoR{k,j}(:,1) 0];
            else 
               NormErroMaximo = [NormErroMaximo; NormalizadaErroMaximo{k,j}(:,1) cont NormalizadaErroMaximoL{k,j}(:,1) 0 NormalizadaErroMaximoL{k,j}(:,1)];

            end
        else
            NormErroMaximo = [NormErroMaximo; NormalizadaErroMaximo{k,j}(:,1) cont 0 0 0];
        end 
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
% retornoR = NormErroMaximoR;
% retornoL = NormErroMaximoL;
end %fim da função

function GraficoNormalizado = GraficoNormalizado(TrajetoriaNormalizada, cor, grupo, t)
randomSide = [1 1 1 0 0 0 1 0 0 1 1 1 1 0 1 0 0 1 0 0 0 0 1 0 1 0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 0 0 1 0 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0 1 0 1 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 0 1 0 1 1 1];
Bloco = [];
mediaBloco = 0;
mediaBlocoR = 0;
mediaBlocoL = 0;
contA = 1;
for k=1:637 % 13 bloco
    mediaBloco = mediaBloco + TrajetoriaNormalizada(k,1);
    
    %% Dividindo adaptações por lateralidades
    if((k > 98 && k < 393) || (k > 539)) %bloco 3 a 8
        contA = contA + 1;
        if(randomSide(contA))
            mediaBlocoR = mediaBlocoR + TrajetoriaNormalizada(k,3);
        else
            mediaBlocoL = mediaBlocoL + TrajetoriaNormalizada(k,3);
        end
    end
    if  mod(k,49) == 0
        Bloco = [Bloco; mediaBloco/49 k-25 mediaBlocoR/20 mediaBlocoL/29];
        mediaBloco = 0;
        mediaBlocoR = 0;
        mediaBlocoL = 0;
        contA = 1;
    end
    
    
end
 figure(13);
%  suptitle('Média dos Campos');
    hold on;
    % Fase 1
    plot(Bloco(1:2,2), Bloco(1:2,1), grupo,'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 2
    plot(Bloco(3:5,2), Bloco(3:5,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 3
    plot(Bloco(6:8,2), Bloco(6:8,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 4
    plot(Bloco(9:11,2), Bloco(9:11,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 5
    plot(Bloco(12:13,2), Bloco(12:13,1), grupo,'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);   
    end
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
    ylim([0 4.5]); % VOLTAR
%     set(get(get(plot(2:end),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
%     set(get(get(plot(2:end),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
% legend('MCR SOL','MCR SOL ESS')
%  legend('No trajectory','With trajectory');
    
    %% Lateralidade
    figure(14);
%      suptitle('Campo contra a mão dominante');
    hold on;
    % Fase 1
    plot(Bloco(1:2,2), Bloco(1:2,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 2
    plot(Bloco(3:5,2), Bloco(3:5,3), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 3
    plot(Bloco(6:8,2), Bloco(6:8,3), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 4
    plot(Bloco(9:11,2), Bloco(9:11,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 5
    plot(Bloco(12:13,2), Bloco(12:13,3), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);   
    end
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
    ylim([0 4.5]); % VOLTAR
    
    figure(15);
%      suptitle('Campo a favor da mão dominante');
    hold on;
    % Fase 1
    plot(Bloco(1:2,2), Bloco(1:2,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 2
    plot(Bloco(3:5,2), Bloco(3:5,4), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 3
    plot(Bloco(6:8,2), Bloco(6:8,4), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 4
    plot(Bloco(9:11,2), Bloco(9:11,1), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    % Fase 5
    plot(Bloco(12:13,2), Bloco(12:13,4), grupo, 'MarkerSize',t,'MarkerEdgeColor',cor,'MarkerFaceColor',cor);
    
    for k=1:13
    plot(repmat(49*k,15),0.1:15,'LineStyle','-.', 'Color', [0.62 0.62 0.62]);   
    end
xlabel('Trials');
ylabel('Aerror');
    xlim([0 650]); % VOLTAR
    ylim([0 4.5]); % VOLTAR
end
