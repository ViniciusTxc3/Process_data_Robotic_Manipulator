%%  Limpa tudo
close all;
clear all;
clc;
cla reset;
%% Plota gráficos
% load('Coleta_Eric.mat');
% Plot_Coleta(Coleta_Eric, 'Experimental 1',1);
% load('Coleta_Ronaldo.mat');
% Plot_Coleta(Coleta_Ronaldo, 'Controle 1',2);
% load('Coleta_Thatiane.mat');
% Plot_Coleta(Coleta_Thatiane, 'Controle 2',3);
% load('Coleta_Amanda.mat');
% Plot_Coleta(Coleta_Amanda, 'Experimental 2',4);
load('Coleta_Eber.mat');
Plot_Coleta(Coleta_Eber, 'Experimental 3',5);
% load('Coleta_Tulio.mat');
% Plot_Coleta(Coleta_Tulio, 'Experimental 3',6);
% load('Coleta_Eduardo.mat');
% Plot_Coleta(Coleta_Eduardo, 'Controle 4',7);
% load('Coleta_Vinicius.mat');
% Plot_Coleta(Coleta_Vinicius, 'Controle 4',8);
% load('Coleta_Ruben.mat');
% Plot_Coleta(Coleta_Ruben, 'Experimental 5',9);
% load('Coleta_Pedro.mat');
% Plot_Coleta(Coleta_Pedro, 'Controle 5',10);

%  load("Coleta_Amanda.mat");
%  Plot_Coleta(Coleta_Amanda, 'Coleta Voluntário',1);
% load("Coleta_Thatiane.mat");
% Plot_Coleta(Coleta_Thatiane, 'Coleta Controle', 2);
%  load("Coleta_Eduardo.mat");
%  Plot_Coleta(Coleta_Eduardo, 'Coleta Voluntário', 3);
%  load("Coleta_Eber.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 4);
%  load("Coleta_Eric.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 5);
%  load("Coleta_Pedro.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 6);
%  load("Coleta_Ronaldo.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 7);
%  load("Coleta_Ruben.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 8);
%  load("Coleta_Tulio.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 9);
%  load("Coleta_Vinicius.mat");
%  Plot_Coleta(Coleta_Eber, 'Coleta Controle', 10);

%% Função de gerar os gráficos
function graficosColeta = Plot_Coleta(Coleta, tilulo, f) % (Coleta.mat, título do plot, numero da figura)
% Vetor aleatório usado para campos
randomSide = [1 1 1 0 0 0 1 0 0 1 1 1 1 0 1 0 0 1 0 0 0 0 1 0 1 0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 1 1 0 1 0 0 1 1 1 1 1 0 1 0 0 1 0 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0 1 0 1 0 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 0 1 0 1 1 1];
%teste
     figure(1);
    writerObj = VideoWriter('out.avi'); % Name it.
    writerObj.FrameRate = 60; % How many frames per second.
    open(writerObj);
    
for k=3:13 % 13 bloco
    Ymax = 0; % Valor máximo da posição no eixo Y (Usado para a linha média)
    for j=2:50 % 50 alcances
        pause(0.01); %teste
        dados = Coleta{k,j}; % Percorre o bloco e alcance
        
        x = dados(:,1); % dados na coluna um (posição X)
        y = dados(:,2); % dados na coluna 2 (posição Y)
        c1 = dados(:,3); % dados na coluna 3 (posição Corrente motor 1)
        c2 = dados(:,4);% dados na coluna 4 (posição Corrente motor 2)
        %% calculo da media
        matrizDeMedia = []; % Inicia a matriz que recebe os valores médios
        for i=min(y):max(y) % Percorre a matriz entre o valor máximo e mínimo de Y
            % encontre todo y = i
            [rows,cols,vals]  = find(y == i); % Acha todos os X que contem o mesmo valor de Y
            if(~isempty(rows)) %Se posição do vetor está vazaio
                mediaX = round(mean(x(rows))); % media dos x's para y = i (round = arredonda)
                %                 mediaC1 = round(abs(2048 - mean(c1(rows))));
                %                 mediaC2 = round(abs(2048 - mean(c2(rows))));
                matrizDeMedia = [matrizDeMedia; mediaX i];% mediaC1 mediaC2 round(mediaC1+mediaC2/2)]; % Coloca o valor médio de X na posição Y
            else
                matrizDeMedia = [matrizDeMedia; matrizDeMedia(i- min(y),1) i]; % Coloca o valor antetior
            end
            if(i > Ymax) % Compara para achar o valor máximo
                Ymax = i;
            end
        end
        ColetaMedia{j} = matrizDeMedia;      % Coloca toda a nova matriz em uma nova célula
        %% Plot dos gráficos de alcances (BRUTO)
        hold on;
%         figure(f); % VOLTAR
        
        
        l = k; % Define posições no subplot
        if(k > 2)
            l = k + 1;
        end
        
%         subplot(5,3,l);
        %plot(matrizDeMedia(:,1),matrizDeMedia(:,2), '-', 'Color', [0 j/50.0 0]);
        plot(dados(5:end,1)*0.07,dados(5:end,2)*0.07, '-', 'Color', [0.2+(j/65) 0 0]);% [0 0 j/50.0]); %[Plota em tons de verde (escuro -> Claro)
        %          plot(dados{1,1}(:,1),dados{1,1}(:,2), '-', 'Color', [0 j/50.0 0]);
        xlim([0 24]);
        ylim([0 25]);
         xlabel ('X (cm)');
         ylabel ('Y (cm)');
         set(0,'defaultfigurecolor','w');
         %teste
        %if mod(i,4)==0, % Uncomment to take 1 out of every 4 frames.
        frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
        writeVideo(writerObj, frame);
        %end
    end
     
     
%     %% Gera gráficos de alcace médio
%     cont = 0;
%     contR = 0; % Teste
%     contL = 0; % Teste
%     MediaTrajetoria = [];
%     MediaTrajetoriaR = []; % Teste
%     MediaTrajetoriaL = []; % Teste
%     mediaL = 0;
%     mediaR = 0;
%     
%     for i=0:Ymax
%         for z = 2:50%length(ColetaMedia)
%             dados = ColetaMedia{1,z};
%             
%             x = dados(:,1);
%             y = dados(:,2);
%             [rows,cols,vals]  = find(y == i);
%             if(~isempty(rows)) %Se posição do vetor está vazaio
%                 mediaX = mediaX + round(mean(x(rows))); % media dos x's para y = i (round = arredonda)
%                 cont = cont + 1;
%                 if(k>2 && k < 9) || (k > 11) % Teste
%                     if(randomSide(z)) % Teste
%                         mediaR = mediaR + round(mean(x(rows))); % Teste
%                         contR = contR + 1; % Teste
%                     else % Teste
%                         mediaL = mediaL + round(mean(x(rows))); % Teste
%                         contL = contL + 1; % Teste
%                     end % Teste
%                 end % Teste
%             end
%         end
%         Xmedio = round(mediaX/cont);
%         MediaTrajetoria = [MediaTrajetoria; Xmedio i];
%         mediaX = 0;
%         cont = 0;
%         
%         if(k>2 && k < 9) || (k > 11) % Teste
%             XmedioR = round(mediaR/contR); % Teste
%             XmedioL = round(mediaL/contL); % Teste
%             MediaTrajetoriaR = [MediaTrajetoriaR; XmedioR i]; % Teste
%             MediaTrajetoriaL = [MediaTrajetoriaL; XmedioL i]; % Teste
%             mediaR = 0; % Teste
%             mediaL = 0; % Teste
%             contR = 0; % Teste
%             contL = 0; % Teste
%         end % Teste
%     end
%     %plot(MediaTrajetoria(:,1),MediaTrajetoria(:,2), '-', 'Color', [1 0 0],'LineWidth', 1.5);
%     if(k>2 && k < 9) || (k > 11) % Teste
%          plot(MediaTrajetoriaR(:,1)*0.07,MediaTrajetoriaR(:,2)*0.07, '-', 'Color', [0 0 1],'LineWidth', 1);%1.5); % Teste
%          plot(MediaTrajetoriaL(:,1)*0.07,MediaTrajetoriaL(:,2)*0.07, '-', 'Color', [1 0 0],'LineWidth', 1);%1.5); % Teste
%     else
%          plot(MediaTrajetoria(:,1)*0.07,MediaTrajetoria(:,2)*0.07, '-', 'Color', [1 0 0],'LineWidth', 1);%1.5);
%     end % Teste
% close(writerObj); % Saves the movie.
end
 close(writerObj); % Saves the movie.
% suptitle (tilulo);
end

